import { Router } from 'express';
import { resumo } from '../controllers/progressoController';

const router = Router();

router.get('/', resumo);

export default router;
