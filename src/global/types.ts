export type Usuario = {
    id: number
    nome: string
    email: string
    papel: 'aluno' | 'administrador'
}

// O que o app guarda depois do login
export type Sessao = {
    token: string
    usuario: Usuario
}

// Conteúdo de matemática (mesma ideia da tabela "areas" do banco)
export type Area = {
    id: number
    nome: string        // nome no banco
    rotulo: string      // texto mostrado na tela
    simbolo: string
}

// Nível de dificuldade (mesma ideia da tabela "niveis_dificuldade")
export type Nivel = {
    id: number
    nome: string
    cor: string         // cor do texto e da borda
    fundo: string       // cor de fundo do botão
}
