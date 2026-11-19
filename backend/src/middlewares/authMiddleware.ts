import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

export type UsuarioToken = {
  id: number;
  papel: 'aluno' | 'administrador';
};

// Um pedido que já passou pelo login: carrega o usuário que veio no token
export interface RequisicaoAutenticada extends Request {
  usuario?: UsuarioToken;
}

export function autenticar(req: RequisicaoAutenticada, res: Response, next: NextFunction) {
  const cabecalho = req.headers.authorization;

  if (!cabecalho || !cabecalho.startsWith('Bearer ')) {
    return res.status(401).json({ erro: 'Faça login para continuar.' });
  }

  const token = cabecalho.slice(7);

  try {
    const dados = jwt.verify(token, process.env.JWT_SECRET as string) as UsuarioToken;
    req.usuario = { id: dados.id, papel: dados.papel };
    return next();
  } catch (erro) {
    return res.status(401).json({ erro: 'Sessão inválida ou expirada. Faça login de novo.' });
  }
}
