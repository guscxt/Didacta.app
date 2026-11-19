import { Router } from 'express';
import { listar, responder } from '../controllers/questoesController';

const router = Router();

router.get('/', listar);
router.post('/:id/responder', responder);

export default router;
