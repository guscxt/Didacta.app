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
