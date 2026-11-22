import { API_URL } from './api';

export async function requisitar<T>(token: string, metodo: 'GET' | 'POST', rota: string, corpo?: object): Promise<T> {
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
