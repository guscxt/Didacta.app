export type ResumoProgresso = {
    questoesRespondidas: number
    taxaAcerto: number          // de 0 a 100
    minutosHoje: number
    sequenciaDias: number
    porConteudo: { nome: string, acertos: number, total: number }[]
}

// Dados de exemplo, iguais aos do protótipo.
// Depois serão trocados pelos dados reais do backend (GET /progresso).
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
