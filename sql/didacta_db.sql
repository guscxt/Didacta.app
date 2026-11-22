-- Active: 1795372401586@@127.0.0.1@5432@didacta@public
CREATE TABLE niveis_dificuldade (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(20) UNIQUE NOT NULL -- Fácil, Médio, Difícil
);

CREATE TABLE areas (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(100) UNIQUE NOT NULL -- Frações, Porcentagem, Equações, Geometria...
);

-- =========================================================
-- Usuários 
-- =========================================================

CREATE TABLE usuarios (
    id              SERIAL PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    email           VARCHAR(150) UNIQUE NOT NULL,
    senha_hash      VARCHAR(255) NOT NULL,
    papel           VARCHAR(20) NOT NULL CHECK (papel IN ('aluno', 'administrador')),
    criado_em       TIMESTAMP NOT NULL DEFAULT NOW()
);

-- =========================================================
-- Banco de questões
-- =========================================================

CREATE TABLE questoes (
    id                      SERIAL PRIMARY KEY,
    area_id                 INTEGER NOT NULL REFERENCES areas(id),
    nivel_id                INTEGER NOT NULL REFERENCES niveis_dificuldade(id),
    enunciado               TEXT NOT NULL,
    resolucao_detalhada     TEXT NOT NULL, -- exibida quando o aluno erra (Tela 4)
    criado_por              INTEGER REFERENCES usuarios(id), -- administrador que cadastrou
    criado_em               TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_questoes_area_nivel ON questoes(area_id, nivel_id);

-- =========================================================
-- Alternativas das questões
-- =========================================================

CREATE TABLE alternativas (
    id          SERIAL PRIMARY KEY,
    questao_id  INTEGER NOT NULL REFERENCES questoes(id) ON DELETE CASCADE,
    letra       CHAR(1) NOT NULL CHECK (letra IN ('A', 'B', 'C', 'D')),
    texto       TEXT NOT NULL,
    correta     BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (questao_id, letra)
);

CREATE UNIQUE INDEX uq_alternativa_correta ON alternativas(questao_id) WHERE correta;

-- =========================================================
-- Tentativas de resposta 
-- =========================================================

CREATE TABLE tentativas (
    id                  SERIAL PRIMARY KEY,
    aluno_id            INTEGER NOT NULL REFERENCES usuarios(id),
    questao_id          INTEGER NOT NULL REFERENCES questoes(id),
    resposta_dada       TEXT NOT NULL, 
    correta             BOOLEAN NOT NULL,
    tentativa_numero    INTEGER NOT NULL DEFAULT 1,
    respondida_em       TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_tentativas_aluno   ON tentativas(aluno_id);
CREATE INDEX idx_tentativas_questao ON tentativas(questao_id);

-- =========================================================
-- View: progresso do aluno por área 
-- =========================================================

CREATE VIEW progresso_por_area AS
SELECT
    t.aluno_id,
    q.area_id,
    a.nome AS area_nome,
    COUNT(*) AS total_respondidas,
    SUM(CASE WHEN t.correta THEN 1 ELSE 0 END) AS total_acertos,
    ROUND(
        100.0 * SUM(CASE WHEN t.correta THEN 1 ELSE 0 END) / COUNT(*), 2
    ) AS taxa_acerto
FROM tentativas t
JOIN questoes q ON q.id = t.questao_id
JOIN areas a    ON a.id = q.area_id
GROUP BY t.aluno_id, q.area_id, a.nome;

INSERT INTO niveis_dificuldade (nome) VALUES
    ('Fácil'), ('Médio'), ('Difícil');

INSERT INTO areas (nome) VALUES
    ('Frações'), ('Porcentagem'), ('Equações'), ('Geometria'),
    ('Números Inteiros'), ('Álgebra'), ('Proporção');
