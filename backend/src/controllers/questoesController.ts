import { Response } from 'express';
import { pool } from '../db';
import { RequisicaoAutenticada } from '../middlewares/authMiddleware';

// GET /questoes?area=1&nivel=1
// Devolve as questões de uma área e nível com as alternativas.
// O gabarito NÃO vai junto: quem confere a resposta é o servidor.
export async function listar(req: RequisicaoAutenticada, res: Response) {
  const area = Number(req.query.area);
  const nivel = Number(req.query.nivel);

  if (!Number.isInteger(area) || !Number.isInteger(nivel)) {
    return res.status(400).json({ erro: 'Informe a área e o nível.' });
  }

  try {
    const resultado = await pool.query(
      `SELECT q.id,
              q.enunciado,
              json_agg(json_build_object('letra', a.letra, 'texto', a.texto) ORDER BY a.letra) AS alternativas
         FROM questoes q
         JOIN alternativas a ON a.questao_id = q.id
        WHERE q.area_id = $1 AND q.nivel_id = $2
        GROUP BY q.id
        ORDER BY q.id`,
      [area, nivel]
    );

    return res.json(resultado.rows);
  } catch (erro) {
    console.error('Erro ao listar questões:', erro);
    return res.status(500).json({ erro: 'Erro interno ao buscar as questões.' });
  }
}

// POST /questoes/:id/responder   { "letra": "B" }
// Confere a resposta, grava a tentativa do aluno e devolve o resultado com a resolução.
export async function responder(req: RequisicaoAutenticada, res: Response) {
  const questaoId = Number(req.params.id);
  const letra = String(req.body?.letra ?? '').toUpperCase();
  // Tempo que o aluno levou para responder, em segundos.
  // Limitado a 10 minutos para não contar o tempo em que ele deixou o app aberto sem usar.
  const segundos = Math.max(0, Math.min(600, Math.round(Number(req.body?.segundos) || 0)));

  if (!Number.isInteger(questaoId) || !['A', 'B', 'C', 'D'].includes(letra)) {
    return res.status(400).json({ erro: 'Informe a questão e a letra (A, B, C ou D).' });
  }

  if (!req.usuario) {
    return res.status(401).json({ erro: 'Faça login para continuar.' });
  }

  try {
    const busca = await pool.query(
      `SELECT q.resolucao_detalhada, a.letra AS letra_correta
         FROM questoes q
         JOIN alternativas a ON a.questao_id = q.id AND a.correta
        WHERE q.id = $1`,
      [questaoId]
    );

    const questao = busca.rows[0];
    if (!questao) {
      return res.status(404).json({ erro: 'Questão não encontrada.' });
    }

    const correta = letra === questao.letra_correta;

    // tentativa_numero conta quantas vezes este aluno já respondeu esta questão
    await pool.query(
      `INSERT INTO tentativas (aluno_id, questao_id, resposta_dada, correta, tentativa_numero, tempo_gasto_segundos)
       VALUES ($1, $2, $3, $4,
               (SELECT COALESCE(MAX(tentativa_numero), 0) + 1
                  FROM tentativas
                 WHERE aluno_id = $1 AND questao_id = $2),
               $5)`,
      [req.usuario.id, questaoId, letra, correta, segundos]
    );

    return res.json({
      correta,
      letraCorreta: questao.letra_correta,
      resolucao: questao.resolucao_detalhada,
    });
  } catch (erro) {
    console.error('Erro ao responder questão:', erro);
    return res.status(500).json({ erro: 'Erro interno ao registrar a resposta.' });
  }
}
