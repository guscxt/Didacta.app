import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { pool } from '../db';

const JWT_SECRET = process.env.JWT_SECRET as string;

export async function registrar(req: Request, res: Response) {
  const { nome, email, senha } = req.body;

  if (!nome || !email || !senha) {
    return res.status(400).json({ erro: 'Preencha nome, email e senha.' });
  }

  try {
    const existente = await pool.query('SELECT id FROM usuarios WHERE email = $1', [email]);
    if (existente.rows.length > 0) {
      return res.status(409).json({ erro: 'Já existe um usuário com esse email.' });
    }

    const senhaHash = await bcrypt.hash(senha, 10);

    const resultado = await pool.query(
      `INSERT INTO usuarios (nome, email, senha_hash, papel)
       VALUES ($1, $2, $3, 'aluno')
       RETURNING id, nome, email, papel`,
      [nome, email, senhaHash]
    );

    return res.status(201).json(resultado.rows[0]);
  } catch (erro) {
    console.error('Erro ao registrar usuário:', erro);
    return res.status(500).json({ erro: 'Erro interno ao registrar usuário.' });
  }
}

export async function login(req: Request, res: Response) {
  const { email, senha } = req.body;

  if (!email || !senha) {
    return res.status(400).json({ erro: 'Informe email e senha.' });
  }

  try {
    const resultado = await pool.query(
      'SELECT id, nome, email, senha_hash, papel FROM usuarios WHERE email = $1',
      [email]
    );

    const usuario = resultado.rows[0];
    if (!usuario) {
      return res.status(401).json({ erro: 'Email ou senha inválidos.' });
    }

    const senhaConfere = await bcrypt.compare(senha, usuario.senha_hash);
    if (!senhaConfere) {
      return res.status(401).json({ erro: 'Email ou senha inválidos.' });
    }

    const token = jwt.sign(
      { id: usuario.id, papel: usuario.papel },
      JWT_SECRET,
      { expiresIn: '7d' }
    );

    return res.json({
      token,
      usuario: { id: usuario.id, nome: usuario.nome, email: usuario.email, papel: usuario.papel },
    });
  } catch (erro) {
    console.error('Erro ao fazer login:', erro);
    return res.status(500).json({ erro: 'Erro interno ao fazer login.' });
  }
}
