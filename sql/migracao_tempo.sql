-- Active: 1795381369217@@127.0.0.1@5432@didacta@public
--   docker compose -f sql/docker-compose.yml exec -T db psql -U didacta -d didacta -v ON_ERROR_STOP=1 < sql/migracao_tempo.sql

ALTER TABLE tentativas
    ADD COLUMN IF NOT EXISTS tempo_gasto_segundos INTEGER NOT NULL DEFAULT 0 CHECK (tempo_gasto_segundos >= 0);
