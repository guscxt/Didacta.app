import { API_URL } from './api';

export type Alternativa = {
    letra: string
    texto: string
}

export type Questao = {
    id: number
    enunciado: string
    alternativas: Alternativa[]
}

export type ResultadoResposta = {
    correta: boolean
    letraCorreta: string
    resolucao: string
}

async function requisitar<T>(token: string, metodo: 'GET' | 'POST', rota: string, corpo?: object): Promise<T> {
    const resposta = await fetch(`${API_URL}${rota}`, {
        method: metodo,
        headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${token}`,
        },
        body: corpo ? JSON.stringify(corpo) : undefined,
    });

    const texto = await resposta.text();
    let dados: any = null;
    try {
        dados = texto ? JSON.parse(texto) : null;
    } catch {
        dados = null;
    }

    if (!resposta.ok) {
        throw new Error(
            dados?.erro ||
                `O servidor respondeu com erro ${resposta.status}.\nEndereço: ${API_URL}${rota}\nResposta: ${texto.slice(0, 120) || '(vazia)'}`
        );
    }

    if (dados === null) {
        throw new Error(`Resposta inesperada do servidor (status ${resposta.status}).`);
    }

    return dados as T;
}


export function listarQuestoes(token: string, areaId: number, nivelId: number) {
    return requisitar<Questao[]>(token, 'GET', `/questoes?area=${areaId}&nivel=${nivelId}`);
}

// Manda a letra escolhida; o servidor confere, grava a tentativa e devolve o resultado
export function responderQuestao(token: string, questaoId: number, letra: string) {
    return requisitar<ResultadoResposta>(token, 'POST', `/questoes/${questaoId}/responder`, { letra });
}
