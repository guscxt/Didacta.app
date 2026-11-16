import { Area, Nivel } from "../../global/types"

// Os ids seguem a ordem do banco (tabela "areas").
// Depois, esta lista virá do backend (GET /areas).
export const areas: Area[] = [
    { id: 1, nome: 'Frações', rotulo: 'Frações', simbolo: '½' },
    { id: 2, nome: 'Porcentagem', rotulo: 'Porcentagem', simbolo: '%' },
    { id: 3, nome: 'Equações', rotulo: 'Equações', simbolo: 'x' },
    { id: 4, nome: 'Geometria', rotulo: 'Geometria', simbolo: '△' },
    { id: 5, nome: 'Números Inteiros', rotulo: 'Núm. Inteiros', simbolo: '±' },
    { id: 6, nome: 'Álgebra', rotulo: 'Álgebra', simbolo: '∑' },
    { id: 7, nome: 'Proporção', rotulo: 'Proporção', simbolo: '∝' },
]

// Os ids seguem a ordem do banco (tabela "niveis_dificuldade").
export const niveis: Nivel[] = [
    { id: 1, nome: 'Fácil', cor: '#16a34a', fundo: '#e8f6ed' },
    { id: 2, nome: 'Médio', cor: '#d97706', fundo: '#fdf1e1' },
    { id: 3, nome: 'Difícil', cor: '#dc2626', fundo: '#fde9e9' },
]
