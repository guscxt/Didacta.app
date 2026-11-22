export type ResumoProgresso = {
    questoesRespondidas: number
    taxaAcerto: number          
    minutosHoje: number
    sequenciaDias: number
    porConteudo: { nome: string, acertos: number, total: number }[]
}

export const resumoExemplo: ResumoProgresso = {
    questoesRespondidas: 0,
    taxaAcerto: 0,
    minutosHoje: 0,
    sequenciaDias: 0,
    porConteudo: [
        { nome: 'Frações', acertos: 0, total: 0 },
        { nome: 'Porcentagem', acertos: 0, total: 0 },
        { nome: 'Equações', acertos: 0, total: 0 },
    ],
}
