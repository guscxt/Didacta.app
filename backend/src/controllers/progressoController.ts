import { Response } from 'express';
import { pool } from '../db';
import { RequisicaoAutenticada } from '../middlewares/authMiddleware';

// Dia anterior a uma data no formato AAAA-MM-DD
function diaAnterior(dia: string): string {
  const [ano, mes, diaDoMes] = dia.split('-').map(Number);
  return new Date(Date.UTC(ano, mes - 1, diaDoMes - 1)).toISOString().slice(0, 10);
}

// Quantos dias seguidos o aluno estudou, contando até hoje.
// Se ele ainda não estudou hoje mas estudou ontem, a sequência continua valendo.
export function calcularSequencia(diasComEstudo: string[], hoje: string): number {
  const dias = new Set(diasComEstudo);

  let dia = hoje;
  if (!dias.has(dia)) {
    dia = diaAnterior(dia);
    if (!dias.has(dia)) return 0;
  }

  let sequencia = 0;
  while (dias.has(dia)) {
    sequencia++;
    dia = diaAnterior(dia);
  }
  return sequencia;
}

// GET /progresso
// Resumo do aluno logado para a tela Início.
export async function resumo(req: RequisicaoAutenticada, res: Response) {
  if (!req.usuario) {
    return res.status(401).json({ erro: 'Faça login para continuar.' });
  }

  const alunoId = req.usuario.id;

  try {
    const [porArea, hoje, dias] = await Promise.all([
      // Acertos e total por conteúdo (view progresso_por_area)
      pool.query(
        `SELECT area_nome, total_respondidas, total_acertos
           FROM progresso_por_area
          WHERE aluno_id = $1
          ORDER BY area_id`,
        [alunoId]
      ),
      // Tempo estudado hoje, no horário de Brasília
      pool.query(
        `SELECT COALESCE(SUM(tempo_gasto_segundos), 0) AS segundos,
                (now() AT TIME ZONE 'America/Sao_Paulo')::date::text AS hoje
           FROM tentativas
          WHERE aluno_id = $1
            AND (respondida_em::timestamptz AT TIME ZONE 'America/Sao_Paulo')::date
                = (now() AT TIME ZONE 'America/Sao_Paulo')::date`,
        [alunoId]
      ),
      // Dias em que o aluno respondeu pelo menos uma questão
      pool.query(
        `SELECT DISTINCT (respondida_em::timestamptz AT TIME ZONE 'America/Sao_Paulo')::date::text AS dia
           FROM tentativas
          WHERE aluno_id = $1`,
        [alunoId]
      ),
    ]);

    // O PostgreSQL devolve contagens como texto, então convertemos para número
    const porConteudo = porArea.rows.map(linha => ({
      nome: linha.area_nome as string,
      acertos: Number(linha.total_acertos),
      total: Number(linha.total_respondidas),
    }));

    const segundosHoje = Number(hoje.rows[0].segundos);
    const questoesRespondidas = porConteudo.reduce((soma, c) => soma + c.total, 0);
    const acertos = porConteudo.reduce((soma, c) => soma + c.acertos, 0);

    return res.json({
      questoesRespondidas,
      taxaAcerto: questoesRespondidas > 0 ? Math.round((acertos / questoesRespondidas) * 100) : 0,
      // Se estudou menos de 1 minuto, mostra 1 (e não 0)
      minutosHoje: segundosHoje > 0 ? Math.max(1, Math.round(segundosHoje / 60)) : 0,
      sequenciaDias: calcularSequencia(dias.rows.map(linha => linha.dia as string), hoje.rows[0].hoje as string),
      porConteudo,
    });
  } catch (erro) {
    console.error('Erro ao montar o progresso:', erro);
    return res.status(500).json({ erro: 'Erro interno ao buscar o progresso.' });
  }
}
