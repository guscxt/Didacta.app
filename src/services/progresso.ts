import { requisitar } from './requisicao';

export type ConteudoProgresso = {
    nome: string     
    acertos: number
    total: number
}

export type ResumoProgresso = {
    questoesRespondidas: number
    taxaAcerto: number          
    minutosHoje: number
    sequenciaDias: number
    porConteudo: ConteudoProgresso[]
}

export function buscarProgresso(token: string) {
    return requisitar<ResumoProgresso>(token, 'GET', '/progresso');
}
