// Troque pela URL pública da porta 3000 do seu Codespace
// (aba Ports → porta 3000 → copiar o "Forwarded Address", sem barra no final)
export const API_URL = 'https://humble-space-memory-g4v5qw964pj6hvq5j-3000.app.github.dev';

type Usuario = {
  id: number;
  nome: string;
  email: string;
  papel: 'aluno' | 'administrador';
};

type LoginResponse = {
  token: string;
  usuario: Usuario;
};

async function post<T>(rota: string, corpo: object): Promise<T> {
  const resposta = await fetch(`${API_URL}${rota}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(corpo),
  });

  // Lê como texto primeiro: se o servidor responder vazio ou com HTML,
  // o app mostra uma mensagem útil em vez de "JSON Parse error"
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
    throw new Error(
      `Resposta inesperada do servidor (status ${resposta.status}). Confira o API_URL e se a porta 3000 está pública.`
    );
  }

  return dados as T;
}

// Verifica e-mail e senha no banco (via backend) e devolve o token
export function login(email: string, senha: string) {
  return post<LoginResponse>('/auth/login', { email, senha });
}

// Grava um novo usuário no banco (via backend)
export function registrar(nome: string, email: string, senha: string) {
  return post<Usuario>('/auth/registrar', { nome, email, senha, papel: 'aluno' });
}
