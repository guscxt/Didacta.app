import { requisitar } from './requisicao';

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


export function listarQuestoes(token: string, areaId: number, nivelId: number) {
    return requisitar<Questao[]>(token, 'GET', `/questoes?area=${areaId}&nivel=${nivelId}`);
}

export function responderQuestao(token: string, questaoId: number, letra: string, segundos: number) {
    return requisitar<ResultadoResposta>(token, 'POST', `/questoes/${questaoId}/responder`, { letra, segundos });
}
