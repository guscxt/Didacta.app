import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import authRoutes from './routes/authRoutes';
import questoesRoutes from './routes/questoesRoutes';
import progressoRoutes from './routes/progressoRoutes';
import { autenticar } from './middlewares/authMiddleware';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.use('/auth', authRoutes);
app.use('/questoes', autenticar, questoesRoutes);
app.use('/progresso', autenticar, progressoRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
