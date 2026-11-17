-- Active: 1794918617624@@127.0.0.1@5432@didacta@public
-- docker compose -f sql/docker-compose.yml exec -T db psql -U didacta -d didacta -v ON_ERROR_STOP=1 < sql/didacta_questoes.sql

SET client_encoding = 'UTF8';

BEGIN;

DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM questoes) THEN
        RAISE EXCEPTION 'A tabela questoes já tem dados. Carga cancelada.';
    END IF;
END $$;

-- ========== Frações — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Quanto é 2/5 + 1/5?', 'Os denominadores são iguais, então somamos apenas os numeradores e mantemos o denominador: 2/5 + 1/5 = 3/5.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/5', TRUE),
        ('B', '3/10', FALSE),
        ('C', '2/5', FALSE),
        ('D', '1/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Qual das frações a seguir é equivalente a 2/3?', 'Multiplicando numerador e denominador de 2/3 por 2, obtemos 4/6. As demais não são equivalentes: 2/6 = 1/3, 3/4 e 4/9 têm valores diferentes de 2/3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/4', FALSE),
        ('B', '4/9', FALSE),
        ('C', '4/6', TRUE),
        ('D', '2/6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Uma pizza foi dividida em 8 fatias iguais. Ana comeu 3 fatias e Bruno comeu 2 fatias. Que fração da pizza foi comida pelos dois juntos?', 'Juntos comeram 3 + 2 = 5 fatias de um total de 8 fatias, ou seja, 5/8 da pizza. Ao somar frações de mesmo denominador, o denominador não muda.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5/16', FALSE),
        ('B', '3/8', FALSE),
        ('C', '5/8', TRUE),
        ('D', '8/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Escreva a fração 12/18 na forma irredutível.', 'O maior divisor comum de 12 e 18 é 6. Dividindo os dois termos por 6: 12/18 = 2/3, que não pode mais ser simplificada.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/3', FALSE),
        ('B', '3/4', FALSE),
        ('C', '4/9', FALSE),
        ('D', '2/3', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Qual das frações a seguir é a maior?', 'Usando denominador comum 24: 1/2 = 12/24, 5/8 = 15/24, 2/3 = 16/24 e 3/4 = 18/24. Como 18 é o maior numerador, 3/4 é a maior fração.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/4', TRUE),
        ('B', '1/2', FALSE),
        ('C', '5/8', FALSE),
        ('D', '2/3', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Quanto é 3/4 de 20?', 'Para calcular 3/4 de 20, divida 20 por 4 e multiplique por 3: 20 ÷ 4 = 5 e 5 × 3 = 15.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15', TRUE),
        ('B', '5', FALSE),
        ('C', '17', FALSE),
        ('D', '23', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Calcule 9/11 − 4/11.', 'Os denominadores são iguais: subtraímos os numeradores e mantemos o denominador. 9 − 4 = 5, logo o resultado é 5/11.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5/22', FALSE),
        ('B', '13/11', FALSE),
        ('C', '4/11', FALSE),
        ('D', '5/11', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Transforme a fração imprópria 7/3 em número misto.', 'Dividindo 7 por 3, obtemos quociente 2 e resto 1. Assim, 7/3 = 2 inteiros e 1/3, ou seja, 2 1/3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2 2/3', FALSE),
        ('B', '2 1/3', TRUE),
        ('C', '3 1/3', FALSE),
        ('D', '1 1/3', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Qual fração representa o número decimal 0,25?', '0,25 = 25/100. Dividindo numerador e denominador por 25, temos 1/4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/25', FALSE),
        ('B', '1/4', TRUE),
        ('C', '1/2', FALSE),
        ('D', '2/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 1, 'Qual das frações a seguir é imprópria?', 'Uma fração é imprópria quando o numerador é maior ou igual ao denominador. Das opções, apenas 9/5 tem numerador (9) maior que o denominador (5).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/5', FALSE),
        ('B', '9/5', TRUE),
        ('C', '5/9', FALSE),
        ('D', '2/7', FALSE)
) AS v(letra, texto, correta);


-- ========== Frações — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Calcule 2/3 + 1/4.', 'O MMC de 3 e 4 é 12. Então 2/3 = 8/12 e 1/4 = 3/12. Somando: 8/12 + 3/12 = 11/12.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/7', FALSE),
        ('B', '3/12', FALSE),
        ('C', '11/12', TRUE),
        ('D', '5/6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Uma receita usa 3/4 de xícara de açúcar. Ao preparar apenas metade da receita, quanto de açúcar deve ser usado?', 'Metade de 3/4 é 1/2 × 3/4 = 3/8. Portanto, devem ser usados 3/8 de xícara de açúcar.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/2 de xícara', FALSE),
        ('B', '3/6 de xícara', FALSE),
        ('C', '3/8 de xícara', TRUE),
        ('D', '1/4 de xícara', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Calcule 5/6 × 9/10 e escreva o resultado na forma mais simples.', 'Multiplicamos numeradores e denominadores: (5 × 9)/(6 × 10) = 45/60. Dividindo por 15, obtemos 3/4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7/8', FALSE),
        ('B', '3/4', TRUE),
        ('C', '4/3', FALSE),
        ('D', '3/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Quanto é 3/5 ÷ 3/10?', 'Dividir por uma fração é multiplicar pelo seu inverso: 3/5 × 10/3 = 30/15 = 2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '9/50', FALSE),
        ('B', '2', TRUE),
        ('C', '1/2', FALSE),
        ('D', '6/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Pedro já leu 2/5 de um livro de 250 páginas. Quantas páginas ainda faltam para ele terminar a leitura?', 'Pedro leu 2/5 de 250 = 100 páginas. Faltam 250 − 100 = 150 páginas. Outra forma: faltam 3/5 do livro, e 3/5 de 250 = 150.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '100 páginas', FALSE),
        ('B', '200 páginas', FALSE),
        ('C', '150 páginas', TRUE),
        ('D', '50 páginas', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Um tanque estava com 3/8 de sua capacidade. Em seguida, foi acrescentado o equivalente a 1/4 da capacidade. Que fração da capacidade do tanque está ocupada agora?', 'Como 1/4 = 2/8, temos 3/8 + 2/8 = 5/8 da capacidade do tanque.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5/8', TRUE),
        ('B', '4/12', FALSE),
        ('C', '1/2', FALSE),
        ('D', '3/32', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Qual sequência apresenta as frações 3/4, 1/2 e 5/8 em ordem crescente?', 'Com denominador comum 8: 3/4 = 6/8, 1/2 = 4/8 e 5/8. Em ordem crescente: 4/8, 5/8, 6/8, ou seja, 1/2, 5/8, 3/4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/2, 5/8, 3/4', TRUE),
        ('B', '3/4, 5/8, 1/2', FALSE),
        ('C', '1/2, 3/4, 5/8', FALSE),
        ('D', '5/8, 1/2, 3/4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Que fração de 1 hora representam 20 minutos?', '1 hora tem 60 minutos. A fração é 20/60, que simplificada (÷ 20) resulta em 1/3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/2', FALSE),
        ('B', '2/3', FALSE),
        ('C', '1/20', FALSE),
        ('D', '1/3', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'Calcule 1 1/2 + 2 1/4.', 'Transformando em frações impróprias: 3/2 + 9/4 = 6/4 + 9/4 = 15/4, que é igual a 3 3/4. Também é possível somar os inteiros (1 + 2 = 3) e as partes fracionárias (1/2 + 1/4 = 3/4).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3 2/6', FALSE),
        ('B', '4 1/4', FALSE),
        ('C', '3 1/2', FALSE),
        ('D', '3 3/4', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 2, 'João gastou 1/3 do salário com aluguel e 1/4 com alimentação. Que fração do salário sobrou?', 'Gastos: 1/3 + 1/4 = 4/12 + 3/12 = 7/12. Sobrou 1 − 7/12 = 12/12 − 7/12 = 5/12.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7/12', FALSE),
        ('B', '2/7', FALSE),
        ('C', '1/12', FALSE),
        ('D', '5/12', TRUE)
) AS v(letra, texto, correta);


-- ========== Frações — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Uma torneira enche um tanque sozinha em 6 horas e outra enche o mesmo tanque sozinha em 3 horas. Funcionando juntas, em quanto tempo enchem o tanque?', 'Em 1 hora, a primeira enche 1/6 do tanque e a segunda 1/3. Juntas: 1/6 + 2/6 = 3/6 = 1/2 do tanque por hora. Para encher o tanque inteiro, levam 2 horas.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2 horas', TRUE),
        ('B', '4 horas e 30 minutos', FALSE),
        ('C', '9 horas', FALSE),
        ('D', '3 horas', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Marcos gastou 1/3 do seu dinheiro e, depois, 2/5 do que restou. Ficou com R$ 36,00. Quanto Marcos tinha inicialmente?', 'Após o primeiro gasto, restaram 2/3. Depois gastou 2/5 desse restante e ficou com 3/5 dele: 3/5 × 2/3 = 2/5 do valor inicial. Se 2/5 do valor é R$ 36,00, então 1/5 é R$ 18,00 e o total é 5 × 18 = R$ 90,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 60,00', FALSE),
        ('B', 'R$ 135,00', FALSE),
        ('C', 'R$ 90,00', TRUE),
        ('D', 'R$ 54,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Qual é o valor de (1/2 + 1/3) ÷ (5/6 − 1/3)?', '1/2 + 1/3 = 3/6 + 2/6 = 5/6. Já 5/6 − 1/3 = 5/6 − 2/6 = 3/6 = 1/2. Então (5/6) ÷ (1/2) = 5/6 × 2 = 10/6 = 5/3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5/3', TRUE),
        ('B', '3/5', FALSE),
        ('C', '5/6', FALSE),
        ('D', '5/12', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Um reservatório estava com 2/5 da sua capacidade. Depois de colocados mais 120 litros de água, passou a ficar com 7/10 da capacidade. Qual é a capacidade total do reservatório?', 'A parte acrescentada corresponde a 7/10 − 2/5 = 7/10 − 4/10 = 3/10 da capacidade. Se 3/10 da capacidade são 120 L, então 1/10 são 40 L e a capacidade total é 10 × 40 = 400 L.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '300 litros', FALSE),
        ('B', '480 litros', FALSE),
        ('C', '1200 litros', FALSE),
        ('D', '400 litros', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Qual das frações a seguir está entre 1/3 e 1/2?', 'Em decimais: 1/3 ≈ 0,333 e 1/2 = 0,5. Como 2/5 = 0,4, ele está entre os dois. Já 1/4 = 0,25 é menor que 1/3, e 3/5 = 0,6 e 7/12 ≈ 0,583 são maiores que 1/2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/4', FALSE),
        ('B', '2/5', TRUE),
        ('C', '3/5', FALSE),
        ('D', '7/12', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Um ciclista percorreu 2/5 de um trajeto na primeira hora e 1/3 do que restava na segunda hora. Ainda faltam 24 km para terminar. Qual é o comprimento total do trajeto?', 'Após a 1ª hora restam 3/5 do trajeto. Na 2ª hora percorreu 1/3 de 3/5 = 1/5 do trajeto. Então restam 3/5 − 1/5 = 2/5. Se 2/5 do trajeto são 24 km, 1/5 são 12 km e o trajeto todo tem 60 km.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '90 km', FALSE),
        ('B', '36 km', FALSE),
        ('C', '60 km', TRUE),
        ('D', '120 km', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Se 3/4 de um número é igual a 18, quanto vale 5/6 desse mesmo número?', 'Se 3/4 do número é 18, então 1/4 é 6 e o número é 24. Agora, 5/6 de 24 = 24 ÷ 6 × 5 = 4 × 5 = 20.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15', FALSE),
        ('B', '20', TRUE),
        ('C', '24', FALSE),
        ('D', '30', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Em uma escola, 3/7 dos alunos são meninas. O número de meninos excede o de meninas em 12 alunos. Quantos alunos tem a escola?', 'Os meninos são 1 − 3/7 = 4/7 dos alunos. A diferença 4/7 − 3/7 = 1/7 corresponde a 12 alunos. Logo o total é 7 × 12 = 84 alunos (36 meninas e 48 meninos).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '36 alunos', FALSE),
        ('B', '84 alunos', TRUE),
        ('C', '48 alunos', FALSE),
        ('D', '28 alunos', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Qual é o valor da expressão 1/2 + 2/3 × 3/4 − 1/6?', 'Primeiro a multiplicação: 2/3 × 3/4 = 6/12 = 1/2. Depois, da esquerda para a direita: 1/2 + 1/2 = 1 e 1 − 1/6 = 5/6.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5/6', TRUE),
        ('B', '17/24', FALSE),
        ('C', '7/6', FALSE),
        ('D', '1', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (1, 3, 'Uma herança foi dividida assim: metade para Ana, 1/3 do total para Bruno e o restante, R$ 20 mil, para Carlos. Qual era o valor total da herança?', 'Ana e Bruno receberam 1/2 + 1/3 = 5/6 da herança. Sobra 1/6 para Carlos, que são R$ 20 mil. Logo o total é 6 × 20 = R$ 120 mil.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 100 mil', FALSE),
        ('B', 'R$ 60 mil', FALSE),
        ('C', 'R$ 80 mil', FALSE),
        ('D', 'R$ 120 mil', TRUE)
) AS v(letra, texto, correta);


-- ========== Porcentagem — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Quanto é 10% de 350?', '10% é o mesmo que 10/100 = 1/10. Basta dividir por 10: 350 ÷ 10 = 35.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '35', TRUE),
        ('B', '3,5', FALSE),
        ('C', '350', FALSE),
        ('D', '0,35', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Qual fração irredutível representa 25%?', '25% = 25/100. Dividindo numerador e denominador por 25, obtemos 1/4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1/25', FALSE),
        ('B', '1/2', FALSE),
        ('C', '2/5', FALSE),
        ('D', '1/4', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Escreva o número decimal 0,6 na forma de porcentagem.', 'Para passar de decimal para porcentagem, multiplicamos por 100: 0,6 × 100 = 60, ou seja, 60%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6%', FALSE),
        ('B', '0,6%', FALSE),
        ('C', '600%', FALSE),
        ('D', '60%', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Em uma sala com 40 alunos, 50% são meninas. Quantos meninos há na sala?', '50% de 40 é a metade: 20 meninas. Os meninos são os outros 40 − 20 = 20 alunos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10', FALSE),
        ('B', '40', FALSE),
        ('C', '20', TRUE),
        ('D', '50', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Uma camiseta custava R$ 80,00 e recebeu desconto de 10%. Qual é o novo preço?', 'O desconto é 10% de 80 = R$ 8,00. O novo preço é 80 − 8 = R$ 72,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 72,00', TRUE),
        ('B', 'R$ 8,00', FALSE),
        ('C', 'R$ 70,00', FALSE),
        ('D', 'R$ 88,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'A fração 3/10 corresponde a qual porcentagem?', 'Multiplicando por 100: 3/10 × 100 = 30. Também: 3/10 = 30/100 = 30%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3%', FALSE),
        ('B', '33%', FALSE),
        ('C', '30%', TRUE),
        ('D', '70%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Dos 60 alunos de uma escola, 15 viajaram no fim de semana. Que porcentagem dos alunos viajou?', 'A fração dos alunos que viajou é 15/60 = 1/4, que corresponde a 25%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15%', FALSE),
        ('B', '45%', FALSE),
        ('C', '4%', FALSE),
        ('D', '25%', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Um produto custava R$ 50,00 e teve aumento de 20%. Qual é o novo preço?', 'O aumento é 20% de 50 = R$ 10,00. O novo preço é 50 + 10 = R$ 60,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 10,00', FALSE),
        ('B', 'R$ 60,00', TRUE),
        ('C', 'R$ 70,00', FALSE),
        ('D', 'R$ 52,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Qual dos valores a seguir é o maior?', 'Escrevendo tudo em porcentagem: 0,3 = 30%, 1/4 = 25%, 3/20 = 15% e 35%. O maior valor é 35%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '0,3', FALSE),
        ('B', '1/4', FALSE),
        ('C', '35%', TRUE),
        ('D', '3/20', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 1, 'Em uma votação com 200 votos, 45% foram ‘sim’. Quantos votos ‘sim’ houve?', '10% de 200 são 20 votos e 5% são 10 votos. Para 45%: 4 × 20 + 10 = 90 votos. Ou: 0,45 × 200 = 90.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '45 votos', FALSE),
        ('B', '90 votos', TRUE),
        ('C', '9 votos', FALSE),
        ('D', '155 votos', FALSE)
) AS v(letra, texto, correta);


-- ========== Porcentagem — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Um celular custa R$ 1200,00, mas tem 15% de desconto para pagamento à vista. Quanto custa à vista?', 'O desconto é 15% de 1200 = 0,15 × 1200 = R$ 180,00. O preço à vista é 1200 − 180 = R$ 1020,00. (Outra forma: 85% de 1200 = 1020.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 180,00', FALSE),
        ('B', 'R$ 1380,00', FALSE),
        ('C', 'R$ 1185,00', FALSE),
        ('D', 'R$ 1020,00', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Um salário de R$ 2000,00 recebeu reajuste de 8%. Qual é o novo salário?', 'O aumento é 8% de 2000 = R$ 160,00. O novo salário é 2000 + 160 = R$ 2160,00. (Outra forma: 108% de 2000 = 2160.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 160,00', FALSE),
        ('B', 'R$ 2016,00', FALSE),
        ('C', 'R$ 2800,00', FALSE),
        ('D', 'R$ 2160,00', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'O preço de um produto passou de R$ 90,00 para R$ 108,00. Qual foi o aumento percentual?', 'O aumento foi 108 − 90 = R$ 18,00. Em relação ao preço inicial: 18/90 = 0,2 = 20%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '18%', FALSE),
        ('B', '20%', TRUE),
        ('C', '10%', FALSE),
        ('D', '25%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Em um jogo online há 250 jogadores e 40% deles são iniciantes. Quantos jogadores não são iniciantes?', 'Os iniciantes são 40% de 250 = 100. Os que não são iniciantes: 250 − 100 = 150 (ou 60% de 250 = 150).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '150', TRUE),
        ('B', '100', FALSE),
        ('C', '210', FALSE),
        ('D', '60', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Em uma prova com 25 questões, Lia acertou 18. Qual foi a porcentagem de acertos?', 'A razão de acertos é 18/25. Multiplicando numerador e denominador por 4: 72/100 = 72%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '18%', FALSE),
        ('B', '72%', TRUE),
        ('C', '25%', FALSE),
        ('D', '75%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Uma loja compra um produto por R$ 60,00 e o vende com lucro de 30% sobre o preço de compra. Qual é o preço de venda?', 'O lucro é 30% de 60 = R$ 18,00. O preço de venda é 60 + 18 = R$ 78,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 18,00', FALSE),
        ('B', 'R$ 78,00', TRUE),
        ('C', 'R$ 90,00', FALSE),
        ('D', 'R$ 80,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Em uma pesquisa com 360 pessoas, 45% preferem o produto A. Quantas pessoas preferem o produto A?', '45% de 360 = 0,45 × 360 = 162. (198 seria o número de pessoas que NÃO preferem o produto A.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '198', FALSE),
        ('B', '81', FALSE),
        ('C', '162', TRUE),
        ('D', '16,2', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Sabendo que 30% de um número é 45, qual é esse número?', 'Se 30% do número é 45, então 10% é 15. O número (100%) é 10 × 15 = 150.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '150', TRUE),
        ('B', '13,5', FALSE),
        ('C', '135', FALSE),
        ('D', '75', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Uma TV foi vendida com 12% de desconto por R$ 880,00. Qual era o preço original?', 'Com 12% de desconto, o preço pago é 88% do original. Então 0,88 × preço = 880, e o preço é 880 ÷ 0,88 = R$ 1000,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 1000,00', TRUE),
        ('B', 'R$ 985,60', FALSE),
        ('C', 'R$ 968,00', FALSE),
        ('D', 'R$ 1056,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 2, 'Em uma turma de 40 alunos, 60% são meninas e 25% das meninas usam óculos. Quantas meninas usam óculos?', 'As meninas são 60% de 40 = 24. Delas, 25% usam óculos: 24 ÷ 4 = 6 meninas.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10', FALSE),
        ('B', '15', FALSE),
        ('C', '6', TRUE),
        ('D', '24', FALSE)
) AS v(letra, texto, correta);


-- ========== Porcentagem — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Um produto de R$ 200,00 recebeu um desconto de 20% e, sobre o novo preço, um segundo desconto de 10%. Qual é o preço final?', 'Após 20% de desconto: 200 × 0,8 = R$ 160,00. Sobre esse valor, mais 10% de desconto: 160 × 0,9 = R$ 144,00. Descontos sucessivos não se somam (20% + 10% = 30% daria R$ 140,00).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 140,00', FALSE),
        ('B', 'R$ 144,00', TRUE),
        ('C', 'R$ 150,00', FALSE),
        ('D', 'R$ 160,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'O preço de um produto sofreu um aumento de 25% e, em seguida, um desconto de 20%. Em comparação com o preço original, o preço final:', 'Multiplicando os fatores: 1,25 × 0,80 = 1,00. O preço final é 100% do preço inicial, portanto não houve alteração.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'é 5% maior', FALSE),
        ('B', 'é 5% menor', FALSE),
        ('C', 'é igual ao preço original', TRUE),
        ('D', 'é 20% maior', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Um capital de R$ 5000,00 foi aplicado a juros compostos de 10% ao mês durante 2 meses. Qual é o montante no final do período?', 'Após o 1º mês: 5000 × 1,10 = R$ 5500,00. Após o 2º mês: 5500 × 1,10 = R$ 6050,00. (R$ 6000,00 seria o resultado com juros simples.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 6000,00', FALSE),
        ('B', 'R$ 5500,00', FALSE),
        ('C', 'R$ 6500,00', FALSE),
        ('D', 'R$ 6050,00', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Um preço sofreu dois aumentos sucessivos: o primeiro de 20% e o segundo de 30%. Qual foi o aumento percentual total?', 'Os fatores de aumento são 1,20 e 1,30. Multiplicando: 1,20 × 1,30 = 1,56. O aumento total foi de 56%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '56%', TRUE),
        ('B', '50%', FALSE),
        ('C', '46%', FALSE),
        ('D', '60%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Uma solução de 500 g contém 20% de sal. Quantos gramas de água devem evaporar para que a solução passe a ter 25% de sal?', 'O sal é 20% de 500 = 100 g e não evapora. Para que 100 g sejam 25% da nova solução, a massa total deve ser 100 ÷ 0,25 = 400 g. Portanto evaporam 500 − 400 = 100 g de água.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '125 g', FALSE),
        ('B', '25 g', FALSE),
        ('C', '50 g', FALSE),
        ('D', '100 g', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Após um crescimento de 10%, a população de uma cidade chegou a 33000 habitantes. Qual era a população antes do crescimento?', 'A população atual é 110% da anterior: 1,10 × P = 33000, logo P = 33000 ÷ 1,10 = 30000. (29700 seria o resultado de tirar 10% de 33000, o que é um erro comum.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30000 habitantes', TRUE),
        ('B', '29700 habitantes', FALSE),
        ('C', '36300 habitantes', FALSE),
        ('D', '31000 habitantes', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Um produto custa R$ 400,00. A loja A oferece 30% de desconto. A loja B oferece 20% de desconto seguido de mais 10% sobre o valor já reduzido. Qual é a diferença de preço entre as duas lojas?', 'Loja A: 400 × 0,70 = R$ 280,00. Loja B: 400 × 0,80 = 320 e 320 × 0,90 = R$ 288,00. A diferença é 288 − 280 = R$ 8,00 (a loja A é mais barata).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 0,00', FALSE),
        ('B', 'R$ 12,00', FALSE),
        ('C', 'R$ 8,00', TRUE),
        ('D', 'R$ 20,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Em uma turma, 40% dos alunos são meninos. Praticam esporte 25% dos meninos e 50% das meninas. Que porcentagem da turma pratica esporte?', 'Em 100 alunos: 40 meninos e 60 meninas. Meninos que praticam: 25% de 40 = 10. Meninas que praticam: 50% de 60 = 30. Total: 10 + 30 = 40 em 100, ou seja, 40%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '37,5%', FALSE),
        ('B', '75%', FALSE),
        ('C', '30%', FALSE),
        ('D', '40%', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Um produto custa R$ 800,00 à vista. A prazo, a loja cobra entrada de 30% do preço à vista mais duas parcelas de R$ 300,00. Qual é o acréscimo percentual do preço a prazo em relação ao preço à vista?', 'Entrada: 30% de 800 = R$ 240,00. Total a prazo: 240 + 2 × 300 = R$ 840,00. O acréscimo é 840 − 800 = R$ 40,00, e 40/800 = 0,05 = 5%.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3%', FALSE),
        ('B', '10%', FALSE),
        ('C', '5%', TRUE),
        ('D', '40%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (2, 3, 'Os dois lados de um retângulo foram aumentados em 10% cada um. De quantos por cento aumentou a área do retângulo?', 'Se os lados medem a e b, os novos lados medem 1,1a e 1,1b. A nova área é 1,1 × 1,1 × ab = 1,21 × ab, ou seja, 21% maior que a original.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '20%', FALSE),
        ('B', '21%', TRUE),
        ('C', '10%', FALSE),
        ('D', '11%', FALSE)
) AS v(letra, texto, correta);


-- ========== Equações — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual é o valor de x na equação x + 7 = 15?', 'Para isolar x, subtraímos 7 dos dois lados: x = 15 − 7 = 8. Verificação: 8 + 7 = 15.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '22', FALSE),
        ('B', '8', TRUE),
        ('C', '7', FALSE),
        ('D', '−8', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Resolva a equação 3x = 27.', 'Dividimos os dois lados por 3: x = 27 ÷ 3 = 9. Verificação: 3 × 9 = 27.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '24', FALSE),
        ('B', '30', FALSE),
        ('C', '81', FALSE),
        ('D', '9', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Pensei em um número, somei 9 e obtive 21. Qual é o número em que pensei?', 'Chamando o número de x: x + 9 = 21. Logo x = 21 − 9 = 12.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30', FALSE),
        ('B', '13', FALSE),
        ('C', '12', TRUE),
        ('D', '189', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual é a solução da equação 2x + 3 = 11?', 'Subtraímos 3 dos dois lados: 2x = 8. Dividindo por 2: x = 4. Verificação: 2 × 4 + 3 = 11.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', TRUE),
        ('B', '7', FALSE),
        ('C', '3', FALSE),
        ('D', '8', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Resolva a equação x/4 = 6.', 'Multiplicamos os dois lados por 4: x = 6 × 4 = 24. Verificação: 24 ÷ 4 = 6.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2', FALSE),
        ('B', '24', TRUE),
        ('C', '10', FALSE),
        ('D', '1,5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual é o valor de x em 5x − 10 = 20?', 'Somamos 10 aos dois lados: 5x = 30. Dividindo por 5: x = 6. Verificação: 5 × 6 − 10 = 20.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2', FALSE),
        ('B', '6', TRUE),
        ('C', '4', FALSE),
        ('D', '10', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Daqui a 5 anos, Lia terá 17 anos. Qual é a idade atual de Lia?', 'Se x é a idade atual, x + 5 = 17. Então x = 17 − 5 = 12 anos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '12 anos', TRUE),
        ('B', '22 anos', FALSE),
        ('C', '5 anos', FALSE),
        ('D', '17 anos', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual equação representa a frase: ‘o dobro de um número somado com 5 é igual a 19’?', 'O dobro de um número é 2x. Somado com 5, fica 2x + 5, e isso é igual a 19: 2x + 5 = 19. Na alternativa 2(x + 5) o 5 seria somado antes de dobrar.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2x + 5 = 19', TRUE),
        ('B', '2(x + 5) = 19', FALSE),
        ('C', '2 + x + 5 = 19', FALSE),
        ('D', '2x − 5 = 19', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual valor de x torna verdadeira a igualdade x + 4 = 2x − 1?', 'Testando x = 5: o lado esquerdo vale 5 + 4 = 9 e o lado direito vale 2 × 5 − 1 = 9. Os outros valores não igualam os dois lados (x = 1: 5 e 1; x = 3: 7 e 5; x = 4: 8 e 7). Algebricamente: 4 + 1 = 2x − x, logo x = 5.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1', FALSE),
        ('B', '3', FALSE),
        ('C', '4', FALSE),
        ('D', '5', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 1, 'Qual é a solução de 4x = x + 21?', 'Subtraímos x dos dois lados: 3x = 21. Dividindo por 3: x = 7. Verificação: 4 × 7 = 28 e 7 + 21 = 28.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '21', FALSE),
        ('B', '4', FALSE),
        ('C', '7', TRUE),
        ('D', '5,25', FALSE)
) AS v(letra, texto, correta);


-- ========== Equações — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Resolva a equação 3(x + 2) = 24.', 'Dividindo os dois lados por 3: x + 2 = 8. Então x = 6. (Ou, aplicando a distributiva: 3x + 6 = 24, 3x = 18, x = 6.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '8', FALSE),
        ('B', '6', TRUE),
        ('C', '10', FALSE),
        ('D', '2', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Qual é a solução da equação 5x − 7 = 3x + 9?', 'Passamos 3x para a esquerda e 7 para a direita: 5x − 3x = 9 + 7, ou seja, 2x = 16. Logo x = 8. Verificação: 5 × 8 − 7 = 33 e 3 × 8 + 9 = 33.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '8', TRUE),
        ('B', '1', FALSE),
        ('C', '2', FALSE),
        ('D', '16', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'A soma de dois números inteiros consecutivos é 59. Qual é o maior deles?', 'Os números são x e x + 1. Então x + (x + 1) = 59, 2x = 58 e x = 29. Os números são 29 e 30, e o maior é 30.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '29', FALSE),
        ('B', '28', FALSE),
        ('C', '30', TRUE),
        ('D', '31', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Um retângulo tem perímetro de 36 cm. O comprimento mede 4 cm a mais que a largura. Qual é a medida da largura?', 'Largura x e comprimento x + 4. Perímetro: 2x + 2(x + 4) = 36, logo 4x + 8 = 36, 4x = 28 e x = 7 cm. (O comprimento mede 11 cm.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7 cm', TRUE),
        ('B', '11 cm', FALSE),
        ('C', '14 cm', FALSE),
        ('D', '8 cm', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Resolva a equação x/3 + x/2 = 10.', 'O MMC de 3 e 2 é 6. Multiplicando tudo por 6: 2x + 3x = 60, então 5x = 60 e x = 12. Verificação: 12/3 + 12/2 = 4 + 6 = 10.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5', FALSE),
        ('B', '6', FALSE),
        ('C', '12', TRUE),
        ('D', '25', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Mariana tem R$ 15,00 a mais que o dobro do que Pedro tem. Juntos, os dois têm R$ 99,00. Quanto Pedro tem?', 'Pedro tem x e Mariana tem 2x + 15. Juntos: x + 2x + 15 = 99, 3x = 84 e x = 28. Pedro tem R$ 28,00 e Mariana tem R$ 71,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 42,00', FALSE),
        ('B', 'R$ 33,00', FALSE),
        ('C', 'R$ 56,00', FALSE),
        ('D', 'R$ 28,00', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Qual é a solução da equação 2(x − 3) = 3(x − 2)?', 'Aplicando a distributiva: 2x − 6 = 3x − 6. Somando 6 aos dois lados: 2x = 3x, logo x = 0. Verificação: 2(−3) = −6 e 3(−2) = −6.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6', FALSE),
        ('B', '0', TRUE),
        ('C', '−6', FALSE),
        ('D', 'Não tem solução', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Qual é a solução da equação 3x + 12 = 0?', 'Subtraímos 12 dos dois lados: 3x = −12. Dividindo por 3: x = −4. Verificação: 3 × (−4) + 12 = 0.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', FALSE),
        ('B', '−12', FALSE),
        ('C', '12', FALSE),
        ('D', '−4', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Dois números x e y satisfazem x + y = 10 e x − y = 4. Qual é o valor de x?', 'Somando as duas equações: 2x = 14, então x = 7. Substituindo: 7 + y = 10, logo y = 3. Verificação: 7 − 3 = 4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3', FALSE),
        ('B', '6', FALSE),
        ('C', '7', TRUE),
        ('D', '14', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 2, 'Uma corrida de táxi custa R$ 6,00 de bandeirada mais R$ 2,50 por quilômetro rodado. Se uma corrida custou R$ 26,00, quantos quilômetros foram percorridos?', 'Equação: 6 + 2,5x = 26. Então 2,5x = 20 e x = 20 ÷ 2,5 = 8 km. (10,4 km seria o resultado de esquecer a bandeirada.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10,4 km', FALSE),
        ('B', '13 km', FALSE),
        ('C', '9 km', FALSE),
        ('D', '8 km', TRUE)
) AS v(letra, texto, correta);


-- ========== Equações — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Quais são as raízes da equação x² − 5x + 6 = 0?', 'Procuramos dois números com soma 5 e produto 6: são 2 e 3. Verificação: 2² − 5 × 2 + 6 = 0 e 3² − 5 × 3 + 6 = 0.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2 e 3', TRUE),
        ('B', '−2 e −3', FALSE),
        ('C', '1 e 6', FALSE),
        ('D', '−1 e −6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Quais são as raízes da equação x² − 4x − 12 = 0?', 'Procuramos dois números com soma 4 e produto −12: são 6 e −2. Verificação: 6² − 4 × 6 − 12 = 0 e (−2)² − 4 × (−2) − 12 = 0. Por Bhaskara: Δ = 16 + 48 = 64, x = (4 ± 8)/2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−6 e 2', FALSE),
        ('B', '12 e −1', FALSE),
        ('C', '6 e −2', TRUE),
        ('D', '4 e −3', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'O comprimento de um retângulo excede a largura em 3 cm e a área do retângulo é 40 cm². Qual é a medida da largura?', 'Largura x e comprimento x + 3: x(x + 3) = 40, ou seja, x² + 3x − 40 = 0. As raízes são 5 e −8 (soma −3, produto −40). Como a medida é positiva, x = 5 cm (e o comprimento é 8 cm). Verificação: 5 × 8 = 40.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '8 cm', FALSE),
        ('B', '5 cm', TRUE),
        ('C', '4 cm', FALSE),
        ('D', '10 cm', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Se 2x + y = 11 e x − y = 1, qual é o valor de x · y?', 'Somando as equações: 3x = 12, então x = 4. Da segunda: y = x − 1 = 3. Verificação: 2 × 4 + 3 = 11. Então x · y = 4 × 3 = 12. (7 é o valor de x + y.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7', FALSE),
        ('B', '12', TRUE),
        ('C', '11', FALSE),
        ('D', '4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Um pai tem 40 anos e seu filho tem 10 anos. Daqui a quantos anos a idade do pai será o triplo da idade do filho?', 'Daqui a t anos: 40 + t = 3(10 + t). Então 40 + t = 30 + 3t, 10 = 2t e t = 5. Verificação: pai com 45 anos e filho com 15 anos (45 = 3 × 15).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10 anos', FALSE),
        ('B', '15 anos', FALSE),
        ('C', '5 anos', TRUE),
        ('D', '20 anos', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Qual é a solução da equação (x + 1)/2 − (x − 1)/3 = 2?', 'Multiplicando tudo por 6 (MMC): 3(x + 1) − 2(x − 1) = 12. Então 3x + 3 − 2x + 2 = 12, x + 5 = 12 e x = 7. Verificação: 8/2 − 6/3 = 4 − 2 = 2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5', FALSE),
        ('B', '9', FALSE),
        ('C', '8', FALSE),
        ('D', '7', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Em uma papelaria, 3 canetas e 2 cadernos custam R$ 31,00, e 1 caneta e 4 cadernos custam R$ 27,00. Qual é o preço de um caderno?', 'Sendo c a caneta e d o caderno: 3c + 2d = 31 e c + 4d = 27. Da segunda, c = 27 − 4d. Substituindo: 81 − 12d + 2d = 31, então 10d = 50 e d = 5. A caneta custa R$ 7,00. Verificação: 3 × 7 + 2 × 5 = 31.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 7,00', FALSE),
        ('B', 'R$ 5,00', TRUE),
        ('C', 'R$ 4,00', FALSE),
        ('D', 'R$ 6,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Isolando x na equação 3x − a = 2x + b, obtemos:', 'Subtraímos 2x dos dois lados: x − a = b. Somando a aos dois lados: x = a + b. Teste com a = 2 e b = 3: x = 5 → 3 × 5 − 2 = 13 e 2 × 5 + 3 = 13.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'x = a + b', TRUE),
        ('B', 'x = a − b', FALSE),
        ('C', 'x = b − a', FALSE),
        ('D', 'x = −a − b', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'Um quadrado tem lado x. Se o lado aumentar 3 unidades, a área do quadrado aumenta 45 unidades quadradas. Qual é o valor de x?', 'A nova área é (x + 3)² e a antiga é x². Então (x + 3)² − x² = 45, ou seja, x² + 6x + 9 − x² = 45, 6x = 36 e x = 6. Verificação: 9² − 6² = 81 − 36 = 45.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6', TRUE),
        ('B', '5', FALSE),
        ('C', '7', FALSE),
        ('D', '15', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (3, 3, 'A soma de dois números é 30. O triplo do menor excede o maior em 2 unidades. Qual é o maior número?', 'Menor a e maior b: a + b = 30 e 3a = b + 2. Substituindo b = 30 − a: 3a = 32 − a, então 4a = 32 e a = 8. O maior é b = 22. Verificação: 3 × 8 = 24 = 22 + 2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '8', FALSE),
        ('B', '20', FALSE),
        ('C', '24', FALSE),
        ('D', '22', TRUE)
) AS v(letra, texto, correta);


-- ========== Geometria — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Qual é o perímetro de um quadrado cujo lado mede 7 cm?', 'O quadrado tem 4 lados iguais: 4 × 7 = 28 cm. (49 cm² seria a área.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '14 cm', FALSE),
        ('B', '28 cm', TRUE),
        ('C', '49 cm', FALSE),
        ('D', '21 cm', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Qual é a área de um retângulo de 8 cm de comprimento e 5 cm de largura?', 'Área do retângulo = comprimento × largura = 8 × 5 = 40 cm². (26 cm seria o perímetro.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '26 cm²', FALSE),
        ('B', '13 cm²', FALSE),
        ('C', '80 cm²', FALSE),
        ('D', '40 cm²', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Quanto mede a soma dos ângulos internos de qualquer triângulo?', 'A soma dos ângulos internos de qualquer triângulo é sempre 180°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '90°', FALSE),
        ('B', '270°', FALSE),
        ('C', '180°', TRUE),
        ('D', '360°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Em um triângulo, dois ângulos medem 50° e 60°. Quanto mede o terceiro ângulo?', 'A soma dos ângulos internos é 180°. Então o terceiro ângulo mede 180° − (50° + 60°) = 180° − 110° = 70°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '110°', FALSE),
        ('B', '80°', FALSE),
        ('C', '130°', FALSE),
        ('D', '70°', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Dois ângulos são complementares. Se um deles mede 35°, quanto mede o outro?', 'Ângulos complementares somam 90°. O outro mede 90° − 35° = 55°. (145° seria o suplementar de 35°.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '145°', FALSE),
        ('B', '55°', TRUE),
        ('C', '65°', FALSE),
        ('D', '125°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Quantos vértices tem um cubo?', 'Um cubo possui 8 vértices, 12 arestas e 6 faces.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6', FALSE),
        ('B', '12', FALSE),
        ('C', '8', TRUE),
        ('D', '4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Qual é a área de um triângulo com 10 cm de base e 6 cm de altura?', 'Área do triângulo = (base × altura) ÷ 2 = (10 × 6) ÷ 2 = 60 ÷ 2 = 30 cm².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30 cm²', TRUE),
        ('B', '60 cm²', FALSE),
        ('C', '16 cm²', FALSE),
        ('D', '32 cm²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'O raio de uma circunferência mede 5 cm. Quanto mede o diâmetro dessa circunferência?', 'O diâmetro é o dobro do raio: 2 × 5 = 10 cm.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2,5 cm', FALSE),
        ('B', '25 cm', FALSE),
        ('C', '10 cm', TRUE),
        ('D', '15 cm', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Dois ângulos são suplementares. Se um deles mede 120°, quanto mede o outro?', 'Ângulos suplementares somam 180°. O outro mede 180° − 120° = 60°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '60°', TRUE),
        ('B', '30°', FALSE),
        ('C', '240°', FALSE),
        ('D', '90°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 1, 'Qual é o volume de um cubo com aresta de 3 cm?', 'Volume do cubo = aresta × aresta × aresta = 3 × 3 × 3 = 27 cm³.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '9 cm³', FALSE),
        ('B', '18 cm³', FALSE),
        ('C', '12 cm³', FALSE),
        ('D', '27 cm³', TRUE)
) AS v(letra, texto, correta);


-- ========== Geometria — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Um trapézio tem bases de 9 m e 5 m e altura de 4 m. Qual é a sua área?', 'Área do trapézio = (base maior + base menor) × altura ÷ 2 = (9 + 5) × 4 ÷ 2 = 14 × 4 ÷ 2 = 28 m².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '56 m²', FALSE),
        ('B', '45 m²', FALSE),
        ('C', '28 m²', TRUE),
        ('D', '18 m²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Os ângulos internos de um triângulo medem x, 2x e 3x. Quanto mede o menor ângulo?', 'A soma é 180°: x + 2x + 3x = 6x = 180°, então x = 30°. Os ângulos medem 30°, 60° e 90°, e o menor é 30°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30°', TRUE),
        ('B', '60°', FALSE),
        ('C', '90°', FALSE),
        ('D', '20°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'O piso de uma sala retangular de 6 m por 4 m será coberto com placas quadradas de 50 cm de lado. Quantas placas serão necessárias, sem considerar perdas?', 'Área da sala: 6 × 4 = 24 m². Cada placa tem 0,5 m × 0,5 m = 0,25 m². Número de placas: 24 ÷ 0,25 = 96. (Ou: 12 placas no comprimento × 8 na largura = 96.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '48 placas', FALSE),
        ('B', '96 placas', TRUE),
        ('C', '24 placas', FALSE),
        ('D', '100 placas', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Em um triângulo retângulo, os catetos medem 6 cm e 8 cm. Quanto mede a hipotenusa?', 'Pelo Teorema de Pitágoras: h² = 6² + 8² = 36 + 64 = 100, logo h = 10 cm.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '14 cm', FALSE),
        ('B', '12 cm', FALSE),
        ('C', '100 cm', FALSE),
        ('D', '10 cm', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Qual é a área de um círculo de raio 4 cm? (Use π = 3,14.)', 'Área do círculo = π × r² = 3,14 × 4² = 3,14 × 16 = 50,24 cm². (25,12 é a medida do comprimento da circunferência: 2 × 3,14 × 4.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '25,12 cm²', FALSE),
        ('B', '12,56 cm²', FALSE),
        ('C', '50,24 cm²', TRUE),
        ('D', '100,48 cm²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Quanto mede a soma dos ângulos internos de um hexágono?', 'A soma dos ângulos internos de um polígono de n lados é (n − 2) × 180°. Para n = 6: 4 × 180° = 720°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '720°', TRUE),
        ('B', '540°', FALSE),
        ('C', '360°', FALSE),
        ('D', '1080°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Uma caixa-d’água tem a forma de um paralelepípedo com 5 dm de comprimento, 4 dm de largura e 3 dm de altura. Sabendo que 1 dm³ equivale a 1 litro, quantos litros cabem nela?', 'Volume = 5 × 4 × 3 = 60 dm³, que equivalem a 60 litros. (94 seria a área total da superfície.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '12 litros', FALSE),
        ('B', '60 litros', TRUE),
        ('C', '94 litros', FALSE),
        ('D', '600 litros', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Duas retas paralelas são cortadas por uma transversal. Um dos ângulos agudos formados mede 65°. Quanto mede cada ângulo obtuso formado?', 'Um ângulo agudo e um obtuso formados pela transversal são suplementares (somam 180°). Logo, o obtuso mede 180° − 65° = 115°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '115°', TRUE),
        ('B', '25°', FALSE),
        ('C', '65°', FALSE),
        ('D', '295°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Um terreno tem a forma de um retângulo de 10 m por 4 m, ao qual foi justaposto um quadrado de 4 m de lado, formando uma figura em L. Qual é a área total do terreno?', 'Dividimos a figura em duas partes: o retângulo tem 10 × 4 = 40 m² e o quadrado tem 4 × 4 = 16 m². Área total: 40 + 16 = 56 m².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '44 m²', FALSE),
        ('B', '64 m²', FALSE),
        ('C', '160 m²', FALSE),
        ('D', '56 m²', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 2, 'Um triângulo isósceles tem perímetro de 30 cm e a base mede 8 cm. Quanto mede cada um dos lados congruentes?', 'Os dois lados congruentes somam 30 − 8 = 22 cm. Cada um mede 22 ÷ 2 = 11 cm.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '22 cm', FALSE),
        ('B', '11 cm', TRUE),
        ('C', '7 cm', FALSE),
        ('D', '8 cm', FALSE)
) AS v(letra, texto, correta);


-- ========== Geometria — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Um retângulo tem diagonal de 10 cm e um dos lados mede 6 cm. Qual é a área desse retângulo?', 'A diagonal forma um triângulo retângulo com os lados do retângulo. Pelo Teorema de Pitágoras: 10² = 6² + b², então b² = 64 e b = 8 cm. Área: 6 × 8 = 48 cm².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '60 cm²', FALSE),
        ('B', '24 cm²', FALSE),
        ('C', '80 cm²', FALSE),
        ('D', '48 cm²', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Um círculo está inscrito em um quadrado de lado 10 cm (toca os quatro lados). Qual é a área da região do quadrado que fica fora do círculo? (Use π = 3.)', 'O diâmetro do círculo é 10 cm, então o raio é 5 cm. Área do círculo: 3 × 5² = 75 cm². Área do quadrado: 10² = 100 cm². Região fora do círculo: 100 − 75 = 25 cm².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '75 cm²', FALSE),
        ('B', '50 cm²', FALSE),
        ('C', '25 cm²', TRUE),
        ('D', '15 cm²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Um cilindro tem raio da base de 3 cm e altura de 10 cm. Qual é o seu volume? (Use π = 3,14.)', 'Volume do cilindro = área da base × altura = π × r² × h = 3,14 × 9 × 10 = 282,6 cm³.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '94,2 cm³', FALSE),
        ('B', '282,6 cm³', TRUE),
        ('C', '942 cm³', FALSE),
        ('D', '90 cm³', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Cada ângulo interno de um polígono regular mede 150°. Quantos lados tem esse polígono?', 'Cada ângulo externo mede 180° − 150° = 30°. A soma dos ângulos externos é 360°, então o número de lados é 360 ÷ 30 = 12.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10', FALSE),
        ('B', '8', FALSE),
        ('C', '12', TRUE),
        ('D', '15', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Três retas paralelas são cortadas por duas transversais. Em uma transversal, os segmentos determinados medem 3 cm e x cm; na outra, medem 6 cm e 10 cm (nessa ordem, em segmentos correspondentes). Qual é o valor de x?', 'Pelo Teorema de Tales, os segmentos correspondentes são proporcionais: 3/x = 6/10. Então 6x = 30 e x = 5 cm.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1,8 cm', FALSE),
        ('B', '18 cm', FALSE),
        ('C', '2 cm', FALSE),
        ('D', '5 cm', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Em um mesmo instante, um poste projeta sombra de 3 m e uma pessoa de 1,8 m de altura projeta sombra de 0,9 m. Qual é a altura do poste?', 'Os triângulos formados são semelhantes: altura/sombra é constante. Para a pessoa: 1,8 ÷ 0,9 = 2. Logo, a altura do poste é 2 × 3 = 6 m.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6 m', TRUE),
        ('B', '5,4 m', FALSE),
        ('C', '2,7 m', FALSE),
        ('D', '3,6 m', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Um retângulo de 14 m por 6 m e um quadrado têm o mesmo perímetro. Quantos metros quadrados a área do quadrado excede a do retângulo?', 'Perímetro do retângulo: 2 × (14 + 6) = 40 m, então o lado do quadrado é 40 ÷ 4 = 10 m. Áreas: quadrado = 100 m² e retângulo = 84 m². Diferença: 100 − 84 = 16 m².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6 m²', FALSE),
        ('B', '8 m²', FALSE),
        ('C', '16 m²', TRUE),
        ('D', '20 m²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Um tanque em forma de cubo de aresta 2 m está cheio de água. Toda a água é transferida para outro tanque, em forma de paralelepípedo, de base retangular 1 m por 2 m. Qual será a altura da água no segundo tanque?', 'Volume de água: 2 × 2 × 2 = 8 m³. Área da base do segundo tanque: 1 × 2 = 2 m². Altura = volume ÷ área da base = 8 ÷ 2 = 4 m.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2 m', FALSE),
        ('B', '8 m', FALSE),
        ('C', '1 m', FALSE),
        ('D', '4 m', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'Em um triângulo, um ângulo externo mede 120° e um dos ângulos internos não adjacentes a ele mede 45°. Quanto mede o outro ângulo interno não adjacente?', 'O ângulo externo é igual à soma dos dois ângulos internos não adjacentes. Então o outro mede 120° − 45° = 75°. Verificação: o ângulo interno adjacente mede 60°, e 60° + 45° + 75° = 180°.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '60°', FALSE),
        ('B', '75°', TRUE),
        ('C', '165°', FALSE),
        ('D', '15°', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (4, 3, 'De um quadrado de lado 8 cm foram recortados, em cada um dos quatro cantos, triângulos retângulos isósceles de catetos 2 cm. Qual é a área da figura que sobrou?', 'Área do quadrado: 8 × 8 = 64 cm². Cada triângulo recortado tem área (2 × 2) ÷ 2 = 2 cm², e são 4 triângulos: 4 × 2 = 8 cm². A figura que sobrou tem 64 − 8 = 56 cm².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '56 cm²', TRUE),
        ('B', '60 cm²', FALSE),
        ('C', '48 cm²', FALSE),
        ('D', '52 cm²', FALSE)
) AS v(letra, texto, correta);


-- ========== Números Inteiros — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Quanto é (+7) + (−3)?', 'Somar (−3) é o mesmo que subtrair 3: 7 − 3 = 4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', TRUE),
        ('B', '10', FALSE),
        ('C', '−4', FALSE),
        ('D', '−10', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Quanto é −8 + 5?', 'Sinais diferentes: subtraímos os módulos (8 − 5 = 3) e damos o sinal do número de maior módulo, que é negativo. Resultado: −3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−3', TRUE),
        ('B', '3', FALSE),
        ('C', '−13', FALSE),
        ('D', '13', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'A temperatura em uma cidade era −2 °C e subiu 7 °C. Qual é a nova temperatura?', 'Subir 7 graus significa somar 7: −2 + 7 = 5 °C.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5 °C', TRUE),
        ('B', '−9 °C', FALSE),
        ('C', '9 °C', FALSE),
        ('D', '2 °C', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Qual alternativa apresenta os números inteiros em ordem crescente?', 'Na reta numérica, quanto mais à esquerda, menor o número. Os negativos vêm primeiro e −5 é menor que −1: −5, −1, 0, 3, 4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−1, −5, 0, 3, 4', FALSE),
        ('B', '−5, −1, 0, 3, 4', TRUE),
        ('C', '0, −1, −5, 3, 4', FALSE),
        ('D', '4, 3, 0, −1, −5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Qual é o valor de |−9|?', 'O módulo (valor absoluto) de um número é a sua distância até o zero, que nunca é negativa. Logo |−9| = 9.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−9', FALSE),
        ('B', '0', FALSE),
        ('C', '18', FALSE),
        ('D', '9', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Quanto é 6 − 10?', 'Como 10 é maior que 6, o resultado é negativo: 10 − 6 = 4, então 6 − 10 = −4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', FALSE),
        ('B', '16', FALSE),
        ('C', '−4', TRUE),
        ('D', '−16', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Quanto é (−3) × (−4)?', 'Multiplicação de dois números negativos resulta em positivo: 3 × 4 = 12.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−12', FALSE),
        ('B', '12', TRUE),
        ('C', '−7', FALSE),
        ('D', '7', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Quanto é (−20) ÷ 4?', 'Divisão de sinais diferentes resulta em negativo: 20 ÷ 4 = 5, então (−20) ÷ 4 = −5.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '5', FALSE),
        ('B', '−5', TRUE),
        ('C', '−16', FALSE),
        ('D', '−80', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Qual é o antecessor do número inteiro −10?', 'O antecessor é o número que vem imediatamente antes, ou seja, subtraímos 1: −10 − 1 = −11.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−9', FALSE),
        ('B', '11', FALSE),
        ('C', '9', FALSE),
        ('D', '−11', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 1, 'Carlos tinha R$ 50 na conta e gastou R$ 80 no cartão. Qual é o saldo final, em reais?', 'Saldo final = 50 − 80 = −30. O saldo é negativo, o que indica que ele ficou devendo R$ 30.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30', FALSE),
        ('B', '130', FALSE),
        ('C', '−30', TRUE),
        ('D', '−130', FALSE)
) AS v(letra, texto, correta);


-- ========== Números Inteiros — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Calcule (−5) × (+4) + 12.', 'Primeiro a multiplicação: (−5) × 4 = −20. Depois: −20 + 12 = −8.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '8', FALSE),
        ('B', '−8', TRUE),
        ('C', '−32', FALSE),
        ('D', '32', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Calcule 15 − (−6) + (−4).', 'Subtrair (−6) é somar 6, e somar (−4) é subtrair 4: 15 + 6 − 4 = 17.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '17', TRUE),
        ('B', '5', FALSE),
        ('C', '13', FALSE),
        ('D', '25', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Calcule −3 + 2 × (−4) − (−7).', 'Primeiro a multiplicação: 2 × (−4) = −8. Depois: −3 − 8 + 7 = −11 + 7 = −4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '11', FALSE),
        ('B', '4', FALSE),
        ('C', '−4', TRUE),
        ('D', '−18', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Um elevador estava no 2º andar, desceu 6 andares e depois subiu 3 andares. Considerando que o térreo é o andar 0 e os subsolos são negativos, em que andar o elevador parou?', 'Posição final: 2 − 6 + 3 = −1, que corresponde ao 1º subsolo.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1', FALSE),
        ('B', '−7', FALSE),
        ('C', '11', FALSE),
        ('D', '−1', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Em uma cidade a temperatura era −8 °C e, em outra, 5 °C. Qual é a diferença entre essas temperaturas (maior menos menor)?', 'Diferença = 5 − (−8) = 5 + 8 = 13 °C.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3 °C', FALSE),
        ('B', '13 °C', TRUE),
        ('C', '−3 °C', FALSE),
        ('D', '−13 °C', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Quantos números inteiros existem entre −3 e 4, sem contar os próprios −3 e 4?', 'Os inteiros entre −3 e 4 são −2, −1, 0, 1, 2 e 3. Ao todo, 6 números.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7', FALSE),
        ('B', '8', FALSE),
        ('C', '5', FALSE),
        ('D', '6', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Quanto vale (−2)³?', '(−2)³ = (−2) × (−2) × (−2). Primeiro (−2) × (−2) = 4 e depois 4 × (−2) = −8. Expoente ímpar mantém o sinal negativo.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−8', TRUE),
        ('B', '8', FALSE),
        ('C', '−6', FALSE),
        ('D', '6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Qual é a soma de todos os números inteiros de −4 a 4?', 'Os números opostos se anulam: (−4 + 4) + (−3 + 3) + (−2 + 2) + (−1 + 1) + 0 = 0.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', FALSE),
        ('B', '8', FALSE),
        ('C', '−4', FALSE),
        ('D', '0', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Um mergulhador está a 15 metros abaixo da superfície (posição −15). Ele sobe 4 metros e depois desce 9 metros. Em que posição ele fica?', 'Posição final: −15 + 4 − 9 = −11 − 9 = −20, ou seja, 20 metros abaixo da superfície.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−2 m', FALSE),
        ('B', '−28 m', FALSE),
        ('C', '−20 m', TRUE),
        ('D', '−10 m', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 2, 'Calcule (−48) ÷ (−6) + (−3) × 2.', '(−48) ÷ (−6) = 8 e (−3) × 2 = −6. Então 8 + (−6) = 2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '14', FALSE),
        ('B', '−2', FALSE),
        ('C', '2', TRUE),
        ('D', '6', FALSE)
) AS v(letra, texto, correta);


-- ========== Números Inteiros — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Qual é o valor da expressão (−2)² − 3 × (−1) + (−10) ÷ 5?', '(−2)² = 4; −3 × (−1) = +3; (−10) ÷ 5 = −2. Então 4 + 3 − 2 = 5.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1', FALSE),
        ('B', '5', TRUE),
        ('C', '9', FALSE),
        ('D', '−5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Observe a sequência −7, −4, −1, 2, … em que cada termo é obtido somando o mesmo número ao anterior. Qual é o 20º termo?', 'A diferença entre termos consecutivos é 3. Do 1º ao 20º termo são 19 acréscimos: −7 + 19 × 3 = −7 + 57 = 50.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '47', FALSE),
        ('B', '50', TRUE),
        ('C', '53', FALSE),
        ('D', '60', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Pedro devia R$ 120,00 e pagou 3 parcelas de R$ 25,00. Depois, contraiu uma nova dívida de R$ 40,00. Qual é a sua situação final, em reais (negativo indica dívida)?', 'Situação inicial: −120. Pagando 3 × 25 = 75: −120 + 75 = −45. Nova dívida de 40: −45 − 40 = −85.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−45', FALSE),
        ('B', '85', FALSE),
        ('C', '−35', FALSE),
        ('D', '−85', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'O produto de dois números inteiros é −24 e a soma deles é 2. Qual é o menor desses números?', 'Procuramos dois inteiros com produto −24 e soma 2. Testando: 6 e −4 (6 × (−4) = −24 e 6 + (−4) = 2). O menor deles é −4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', FALSE),
        ('B', '−6', FALSE),
        ('C', '−4', TRUE),
        ('D', '6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Quantos números inteiros x satisfazem −5 < x ≤ 3?', 'Os inteiros maiores que −5 e menores ou iguais a 3 são −4, −3, −2, −1, 0, 1, 2 e 3. Ao todo, 8 números.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7', FALSE),
        ('B', '9', FALSE),
        ('C', '8', TRUE),
        ('D', '10', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Calcule (−1)⁷ + 3 × (−1)⁸ − (−1)⁵.', '(−1)⁷ = −1 (expoente ímpar); (−1)⁸ = 1 (expoente par), então 3 × 1 = 3; (−1)⁵ = −1, e subtrair (−1) é somar 1. Total: −1 + 3 + 1 = 3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3', TRUE),
        ('B', '−3', FALSE),
        ('C', '1', FALSE),
        ('D', '−5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'A temperatura do ar diminui 6 °C a cada 1000 m de altitude. Ao nível do mar a temperatura é 24 °C. Qual será a temperatura a 5000 m de altitude?', 'Queda total: 5 × 6 = 30 °C. Temperatura: 24 − 30 = −6 °C.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−6 °C', TRUE),
        ('B', '6 °C', FALSE),
        ('C', '−30 °C', FALSE),
        ('D', '18 °C', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'A média de cinco temperaturas, em °C, é −1. Quatro delas são −4, 3, −6 e 0. Qual é a quinta temperatura?', 'A soma das cinco temperaturas é 5 × (−1) = −5. As quatro conhecidas somam −4 + 3 − 6 + 0 = −7. A quinta é −5 − (−7) = 2 °C.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2 °C', TRUE),
        ('B', '−2 °C', FALSE),
        ('C', '5 °C', FALSE),
        ('D', '−12 °C', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Em um jogo, cada resposta certa vale +5 pontos e cada resposta errada vale −3 pontos. Em 20 questões, um jogador acertou 12 e errou as demais. Quantos pontos ele fez?', 'Acertos: 12 × 5 = 60. Erros: 8 questões × (−3) = −24. Total: 60 − 24 = 36 pontos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '24', FALSE),
        ('B', '60', FALSE),
        ('C', '96', FALSE),
        ('D', '36', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (5, 3, 'Qual é o valor de |−12 + 5| − |3 − 10| + |−4|?', '|−12 + 5| = |−7| = 7; |3 − 10| = |−7| = 7; |−4| = 4. Então 7 − 7 + 4 = 4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '18', FALSE),
        ('B', '4', TRUE),
        ('C', '−4', FALSE),
        ('D', '11', FALSE)
) AS v(letra, texto, correta);


-- ========== Álgebra — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Qual é o valor numérico da expressão 3x + 2 para x = 4?', 'Substituindo x por 4: 3 × 4 + 2 = 12 + 2 = 14.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '9', FALSE),
        ('B', '14', TRUE),
        ('C', '24', FALSE),
        ('D', '12', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Simplifique a expressão 5a + 3a.', 'Termos semelhantes têm a mesma parte literal: somamos os coeficientes e mantemos a letra. 5a + 3a = 8a.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15a', FALSE),
        ('B', '8a²', FALSE),
        ('C', '8a', TRUE),
        ('D', '8', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Qual expressão algébrica representa ‘o triplo de um número mais 5’?', 'O triplo de um número x é 3x. ‘Mais 5’ significa somar 5: 3x + 5. Em 3(x + 5) o 5 seria somado antes de triplicar.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3 + 5x', FALSE),
        ('B', 'x + 15', FALSE),
        ('C', '3(x + 5)', FALSE),
        ('D', '3x + 5', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Qual é o valor numérico de a² quando a = −5?', 'a² = (−5)² = (−5) × (−5) = 25. O quadrado de um número negativo é positivo.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−25', FALSE),
        ('B', '10', FALSE),
        ('C', '−10', FALSE),
        ('D', '25', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Qual é o coeficiente numérico do termo −4x²?', 'O coeficiente é o número que multiplica a parte literal. No termo −4x², a parte literal é x² e o coeficiente é −4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4', FALSE),
        ('B', '2', FALSE),
        ('C', '−4', TRUE),
        ('D', 'x²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Simplifique a expressão 2x + 3x − x.', 'Somamos os coeficientes: 2 + 3 − 1 = 4. Logo 2x + 3x − x = 4x.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4x', TRUE),
        ('B', '6x', FALSE),
        ('C', '5x', FALSE),
        ('D', '4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Um quadrado tem lado de medida x. Qual expressão representa o seu perímetro?', 'O quadrado tem 4 lados iguais a x, então o perímetro é x + x + x + x = 4x. A expressão x² representa a área.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'x²', FALSE),
        ('B', 'x + 4', FALSE),
        ('C', '2x', FALSE),
        ('D', '4x', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Qual é o valor numérico de 2x − y para x = 5 e y = 3?', 'Substituindo: 2 × 5 − 3 = 10 − 3 = 7.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '13', FALSE),
        ('B', '7', TRUE),
        ('C', '1', FALSE),
        ('D', '8', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Na sequência 3, 6, 9, 12, …, qual expressão dá o termo de posição n?', 'Cada termo é o triplo da sua posição: 1º → 3 × 1, 2º → 3 × 2, 3º → 3 × 3, e assim por diante. O termo geral é 3n.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3n', TRUE),
        ('B', 'n + 3', FALSE),
        ('C', 'n³', FALSE),
        ('D', '3n + 1', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 1, 'Aplicando a propriedade distributiva, 4(x + 2) é igual a:', 'O fator 4 multiplica cada termo dentro dos parênteses: 4 × x + 4 × 2 = 4x + 8.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4x + 2', FALSE),
        ('B', 'x + 8', FALSE),
        ('C', '4x + 8', TRUE),
        ('D', '4x + 6', FALSE)
) AS v(letra, texto, correta);


-- ========== Álgebra — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Simplifique a expressão 3(2x − 1) + 4x.', 'Distribuindo: 3 × 2x − 3 × 1 + 4x = 6x − 3 + 4x. Juntando os termos semelhantes (6x + 4x = 10x): 10x − 3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10x + 3', FALSE),
        ('B', '10x − 3', TRUE),
        ('C', '10x − 1', FALSE),
        ('D', '6x − 3', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Qual é o valor numérico de x² − 2x + 1 para x = −3?', 'x² = (−3)² = 9 e −2x = −2 × (−3) = +6. Então 9 + 6 + 1 = 16.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '−2', FALSE),
        ('B', '16', TRUE),
        ('C', '4', FALSE),
        ('D', '10', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'O desenvolvimento de (x + 3)² é:', 'Quadrado da soma: (x + 3)² = x² + 2 · x · 3 + 3² = x² + 6x + 9. É comum errar escrevendo apenas x² + 9, esquecendo o termo do meio.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'x² + 6x + 9', TRUE),
        ('B', 'x² + 9', FALSE),
        ('C', 'x² + 3x + 9', FALSE),
        ('D', 'x² + 6x + 6', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'A forma fatorada de x² − 25 é:', 'É uma diferença de quadrados: a² − b² = (a − b)(a + b). Com a = x e b = 5: x² − 25 = (x − 5)(x + 5).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '(x − 5)²', FALSE),
        ('B', '(x + 5)²', FALSE),
        ('C', '(x − 5)(x + 5)', TRUE),
        ('D', '(x − 25)(x + 1)', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Fatorando 6x + 9 colocando o fator comum em evidência, obtemos:', 'O maior fator comum de 6x e 9 é 3. Dividindo cada termo por 3: 6x ÷ 3 = 2x e 9 ÷ 3 = 3. Logo 6x + 9 = 3(2x + 3).')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3(2x + 9)', FALSE),
        ('B', '6(x + 3)', FALSE),
        ('C', '3(2x + 3)', TRUE),
        ('D', '3(x + 3)', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Qual é o resultado de (2x² + 3x) + (x² − 5x + 4)?', 'Somamos os termos semelhantes: 2x² + x² = 3x²; 3x − 5x = −2x; e o termo independente é 4. Resultado: 3x² − 2x + 4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3x² + 8x + 4', FALSE),
        ('B', '3x² − 2x + 4', TRUE),
        ('C', '3x² − 8x + 4', FALSE),
        ('D', '3x⁴ − 2x + 4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Um retângulo tem lados (x + 2) e (x + 5). Qual expressão representa a sua área?', 'Área = (x + 2)(x + 5) = x² + 5x + 2x + 10 = x² + 7x + 10. (2x + 14 seria o perímetro.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'x² + 7x + 10', TRUE),
        ('B', 'x² + 10', FALSE),
        ('C', 'x² + 7x + 7', FALSE),
        ('D', '2x + 14', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Uma camiseta custa c reais e uma calça custa R$ 10,00 a mais que o dobro do preço da camiseta. Qual expressão representa o preço de 3 camisetas e 1 calça?', 'A calça custa 2c + 10. Três camisetas custam 3c. Total: 3c + 2c + 10 = 5c + 10.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6c + 10', FALSE),
        ('B', '5c', FALSE),
        ('C', '3c + 10', FALSE),
        ('D', '5c + 10', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Na sequência 5, 9, 13, 17, …, cada termo é obtido somando 4 ao anterior. Qual é o 10º termo?', 'O termo geral é 4n + 1 (o 1º termo é 4 × 1 + 1 = 5). Para n = 10: 4 × 10 + 1 = 41.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '40', FALSE),
        ('B', '45', FALSE),
        ('C', '37', FALSE),
        ('D', '41', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 2, 'Simplificando a expressão (6x²y) ÷ (3xy), com x e y diferentes de zero, obtemos:', 'Dividimos os coeficientes (6 ÷ 3 = 2) e as letras: x² ÷ x = x e y ÷ y = 1. Resultado: 2x.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2x', TRUE),
        ('B', '3x', FALSE),
        ('C', '2xy', FALSE),
        ('D', '2x²', FALSE)
) AS v(letra, texto, correta);


-- ========== Álgebra — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'A forma fatorada de x² + 6x + 9 é:', 'É um trinômio quadrado perfeito: x² + 2 · x · 3 + 3² = (x + 3)². Verificação: (x + 9)(x + 1) = x² + 10x + 9, que é diferente.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '(x + 3)(x − 3)', FALSE),
        ('B', '(x + 9)(x + 1)', FALSE),
        ('C', '(x + 3)²', TRUE),
        ('D', '(x − 3)²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Sabendo que x + y = 12 e x − y = 5, qual é o valor de x² − y²?', 'Como x² − y² = (x + y)(x − y), basta multiplicar: 12 × 5 = 60.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '60', TRUE),
        ('B', '17', FALSE),
        ('C', '7', FALSE),
        ('D', '144', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Se a + b = 7 e a · b = 12, qual é o valor de a² + b²?', 'Como (a + b)² = a² + 2ab + b², temos a² + b² = (a + b)² − 2ab = 49 − 24 = 25. (Os números são 3 e 4: 9 + 16 = 25.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '49', FALSE),
        ('B', '19', FALSE),
        ('C', '25', TRUE),
        ('D', '37', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Simplificando a expressão (x² − 9)/(x − 3), com x ≠ 3, obtemos:', 'Fatorando o numerador (diferença de quadrados): x² − 9 = (x − 3)(x + 3). Cancelando (x − 3): resultado x + 3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'x − 3', FALSE),
        ('B', 'x + 3', TRUE),
        ('C', 'x + 9', FALSE),
        ('D', 'x² − 3', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'A expressão (a + b)² − (a − b)² é equivalente a:', '(a + b)² = a² + 2ab + b² e (a − b)² = a² − 2ab + b². Subtraindo: 2ab − (−2ab) = 4ab. Teste com a = 3 e b = 1: 16 − 4 = 12 = 4 × 3 × 1.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2ab', FALSE),
        ('B', '4ab', TRUE),
        ('C', '0', FALSE),
        ('D', '2a² + 2b²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Hoje, Ana tem x anos e Beto tem 2x − 4 anos. Daqui a 6 anos, a soma das idades dos dois será 62 anos. Qual é a idade atual de Ana?', 'Daqui a 6 anos: Ana terá x + 6 e Beto terá (2x − 4) + 6 = 2x + 2. Soma: 3x + 8 = 62, então 3x = 54 e x = 18. Verificação: Ana com 24 e Beto com 38 anos: 24 + 38 = 62.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '20 anos', FALSE),
        ('B', '16 anos', FALSE),
        ('C', '54 anos', FALSE),
        ('D', '18 anos', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Com palitos, formam-se fileiras de quadrados: 1 quadrado usa 4 palitos, 2 quadrados usam 7, 3 quadrados usam 10, e assim por diante. Quantos palitos são necessários para 20 quadrados?', 'Cada quadrado acrescentado usa 3 palitos novos, então o termo geral é 3n + 1. Para n = 20: 3 × 20 + 1 = 61 palitos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '64', FALSE),
        ('B', '60', FALSE),
        ('C', '80', FALSE),
        ('D', '61', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Usando produtos notáveis, qual é o valor de 101² − 99²?', 'É uma diferença de quadrados: a² − b² = (a − b)(a + b). Então 101² − 99² = (101 − 99)(101 + 99) = 2 × 200 = 400.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '400', TRUE),
        ('B', '200', FALSE),
        ('C', '202', FALSE),
        ('D', '4', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Fatorando por agrupamento a expressão ax + ay + bx + by, obtemos:', 'Agrupando: a(x + y) + b(x + y). Colocando (x + y) em evidência: (a + b)(x + y). Verificação: (a + b)(x + y) = ax + ay + bx + by.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '(a + b)(x − y)', FALSE),
        ('B', '(a − b)(x + y)', FALSE),
        ('C', '(a + x)(b + y)', FALSE),
        ('D', '(a + b)(x + y)', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (6, 3, 'Qual é o valor numérico de a²b − ab² para a = 2 e b = −3?', 'a²b = 2² × (−3) = 4 × (−3) = −12. ab² = 2 × (−3)² = 2 × 9 = 18. Então −12 − 18 = −30.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30', FALSE),
        ('B', '6', FALSE),
        ('C', '−30', TRUE),
        ('D', '−6', FALSE)
) AS v(letra, texto, correta);


-- ========== Proporção — Fácil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Qual é a razão entre 12 e 4?', 'A razão entre 12 e 4 é 12/4 = 3.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3', TRUE),
        ('B', '1/3', FALSE),
        ('C', '8', FALSE),
        ('D', '16', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Qual é o valor de x na proporção 2/3 = x/9?', 'Multiplicando em cruz: 3 · x = 2 · 9, então 3x = 18 e x = 6. Outra forma: 9 é 3 vezes 3, então x é 3 vezes 2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3', FALSE),
        ('B', '4', FALSE),
        ('C', '13,5', FALSE),
        ('D', '6', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Três pães custam R$ 6,00. Quanto custam 5 pães do mesmo tipo?', 'Cada pão custa 6 ÷ 3 = R$ 2,00. Cinco pães custam 5 × 2 = R$ 10,00.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', 'R$ 8,00', FALSE),
        ('B', 'R$ 10,00', TRUE),
        ('C', 'R$ 15,00', FALSE),
        ('D', 'R$ 12,00', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Em um mapa com escala 1:100, um segmento de 5 cm representa quantos metros na realidade?', 'Na escala 1:100, 1 cm no desenho equivale a 100 cm reais. Então 5 cm equivalem a 500 cm = 5 m.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '0,5 m', FALSE),
        ('B', '50 m', FALSE),
        ('C', '5 m', TRUE),
        ('D', '500 m', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Em uma turma há 12 meninas e 8 meninos. Qual é a razão entre o número de meninas e o de meninos, na forma irredutível?', 'A razão é 12/8. Dividindo os dois termos por 4: 3/2.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2/3', FALSE),
        ('B', '3/2', TRUE),
        ('C', '4/3', FALSE),
        ('D', '3/5', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Qual dos pares de razões forma uma proporção?', 'Há proporção quando as razões são iguais. 3/4 = 6/8 (multiplicando por 2). Nos outros pares os produtos cruzados são diferentes: 2 × 9 ≠ 5 × 4; 1 × 5 ≠ 2 × 2; 5 × 7 ≠ 6 × 6.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '3/4 e 6/8', TRUE),
        ('B', '2/5 e 4/9', FALSE),
        ('C', '1/2 e 2/5', FALSE),
        ('D', '5/6 e 6/7', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Um carro percorreu 120 km em 2 horas. Qual foi a sua velocidade média?', 'Velocidade média = distância ÷ tempo = 120 ÷ 2 = 60 km/h.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '240 km/h', FALSE),
        ('B', '30 km/h', FALSE),
        ('C', '122 km/h', FALSE),
        ('D', '60 km/h', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Para fazer 12 biscoitos, uma receita usa 2 xícaras de farinha. Quantas xícaras de farinha são necessárias para fazer 30 biscoitos?', '30 biscoitos são 2,5 vezes 12 biscoitos (30 ÷ 12 = 2,5). Então a farinha também é 2,5 vezes maior: 2 × 2,5 = 5 xícaras.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4 xícaras', FALSE),
        ('B', '5 xícaras', TRUE),
        ('C', '6 xícaras', FALSE),
        ('D', '10 xícaras', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Duas crianças vão dividir 20 balas na razão de 1 para 3. Quantas balas receberá a criança que ficar com a maior parte?', 'A divisão tem 1 + 3 = 4 partes iguais. Cada parte vale 20 ÷ 4 = 5 balas. A maior parte tem 3 × 5 = 15 balas.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15', TRUE),
        ('B', '5', FALSE),
        ('C', '10', FALSE),
        ('D', '17', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 1, 'Qual é a razão entre 15 minutos e 1 hora?', 'Para comparar, as unidades devem ser iguais: 1 hora = 60 minutos. A razão é 15/60 = 1/4.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '15', FALSE),
        ('B', '1/15', FALSE),
        ('C', '1/4', TRUE),
        ('D', '1/2', FALSE)
) AS v(letra, texto, correta);


-- ========== Proporção — Médio ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Um carro consome 8 litros de combustível para percorrer 100 km. Mantido o mesmo consumo, quantos litros ele gasta em uma viagem de 250 km?', 'Quilômetros e litros são grandezas diretamente proporcionais: 8/100 = x/250. Então x = 8 × 250 ÷ 100 = 20 litros.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '20 litros', TRUE),
        ('B', '25 litros', FALSE),
        ('C', '12,5 litros', FALSE),
        ('D', '18 litros', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Quatro torneiras iguais enchem uma piscina em 6 horas. Em quanto tempo 8 torneiras iguais encheriam a mesma piscina?', 'Quanto mais torneiras, menos tempo: as grandezas são inversamente proporcionais. 4 × 6 = 8 × t, logo t = 24 ÷ 8 = 3 horas.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '12 horas', FALSE),
        ('B', '6 horas', FALSE),
        ('C', '3 horas', TRUE),
        ('D', '2 horas', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Em um mapa com escala 1:250 000, a distância entre duas cidades é de 6 cm. Qual é a distância real entre elas?', 'Distância real = 6 × 250 000 = 1 500 000 cm. Como 100 000 cm = 1 km, a distância é 15 km.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1,5 km', FALSE),
        ('B', '15 km', TRUE),
        ('C', '150 km', FALSE),
        ('D', '25 km', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'O número 360 será dividido em partes diretamente proporcionais a 2, 3 e 4. Qual é a maior dessas partes?', 'A soma das razões é 2 + 3 + 4 = 9. Cada unidade vale 360 ÷ 9 = 40. As partes são 80, 120 e 160, e a maior é 160.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '120', FALSE),
        ('B', '180', FALSE),
        ('C', '90', FALSE),
        ('D', '160', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Uma tinta é feita misturando azul e branca na razão 3:2 (azul para branca). Quantos litros de tinta branca são necessários para misturar com 15 litros de tinta azul?', 'Pela razão 3/2 = 15/x, temos 3x = 30 e x = 10 litros. Outra forma: 15 L é 5 vezes 3, então a branca é 5 vezes 2 = 10 L.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '22,5 litros', FALSE),
        ('B', '6 litros', FALSE),
        ('C', '10 litros', TRUE),
        ('D', '5 litros', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Três litros de tinta cobrem 24 m² de parede. Quantos litros são necessários para cobrir 40 m²?', 'Cada litro cobre 24 ÷ 3 = 8 m². Para 40 m²: 40 ÷ 8 = 5 litros.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '4 litros', FALSE),
        ('B', '5 litros', TRUE),
        ('C', '8 litros', FALSE),
        ('D', '6 litros', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Em uma escola, 3 de cada 8 alunos preferem futebol. Entre 120 alunos, quantos preferem futebol?', 'A razão 3/8 de 120 alunos: 120 ÷ 8 = 15 e 15 × 3 = 45 alunos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '40', FALSE),
        ('B', '15', FALSE),
        ('C', '45', TRUE),
        ('D', '360', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Qual é o valor de x na proporção x/12 = 5/8?', 'Multiplicando em cruz: 8x = 5 × 12 = 60. Então x = 60 ÷ 8 = 7,5.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '7', FALSE),
        ('B', '9,6', FALSE),
        ('C', '15', FALSE),
        ('D', '7,5', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'Em um mapa, dois pontos estão a 8 cm de distância e, na realidade, distam 40 km. Qual é a escala do mapa?', 'Convertendo: 40 km = 4 000 000 cm. A razão é 8 cm : 4 000 000 cm = 1 : 500 000.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1:5 000', FALSE),
        ('B', '1:50 000', FALSE),
        ('C', '1:5 000 000', FALSE),
        ('D', '1:500 000', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 2, 'A razão entre dois números é 3/5 e a soma deles é 64. Qual é o maior desses números?', 'Os números são 3k e 5k. Então 3k + 5k = 64, 8k = 64 e k = 8. Os números são 24 e 40, e o maior é 40.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '40', TRUE),
        ('B', '24', FALSE),
        ('C', '38,4', FALSE),
        ('D', '64', FALSE)
) AS v(letra, texto, correta);


-- ========== Proporção — Difícil ==========

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Seis pedreiros constroem 30 m de muro em 5 dias. Mantendo o mesmo rendimento, em quantos dias 10 pedreiros constroem 60 m de muro?', 'Mais pedreiros diminuem o tempo (inversa) e mais muro aumenta o tempo (direta). Dias = 5 × (6/10) × (60/30) = 5 × 0,6 × 2 = 6 dias.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '6 dias', TRUE),
        ('B', '3 dias', FALSE),
        ('C', '10 dias', FALSE),
        ('D', '4 dias', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Quatro máquinas iguais produzem 240 peças em 6 horas. Quantas peças 6 dessas máquinas produzem em 8 horas?', 'Cada máquina produz 240 ÷ 4 ÷ 6 = 10 peças por hora. Seis máquinas em 8 horas: 6 × 8 × 10 = 480 peças.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '480 peças', TRUE),
        ('B', '360 peças', FALSE),
        ('C', '320 peças', FALSE),
        ('D', '960 peças', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'O número 180 será dividido em partes inversamente proporcionais a 2, 3 e 6. Qual é a maior dessas partes?', 'Partes inversamente proporcionais a 2, 3 e 6 são proporcionais a 1/2, 1/3 e 1/6, ou seja, a 3, 2 e 1 (multiplicando por 6). Soma: 6. Cada unidade vale 180 ÷ 6 = 30. As partes são 90, 60 e 30, e a maior é 90.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '30', FALSE),
        ('B', '60', FALSE),
        ('C', '108', FALSE),
        ('D', '90', TRUE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Dois quadrados têm lados na razão 2:3. Qual é a razão entre as suas áreas?', 'Se os lados são 2k e 3k, as áreas são (2k)² = 4k² e (3k)² = 9k². A razão entre as áreas é 4:9, o quadrado da razão entre os lados.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '2:3', FALSE),
        ('B', '8:27', FALSE),
        ('C', '4:9', TRUE),
        ('D', '5:9', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Para preparar uma solução, misturam-se 2 litros de concentrado para cada 5 litros de água. Quantos litros de concentrado são necessários para obter 28 litros de solução?', 'Cada porção tem 2 + 5 = 7 litros de solução. Em 28 litros há 28 ÷ 7 = 4 porções. Concentrado: 4 × 2 = 8 litros.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '10 litros', FALSE),
        ('B', '8 litros', TRUE),
        ('C', '14 litros', FALSE),
        ('D', '20 litros', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'A idade da mãe e a idade da filha estão na razão 7:2 e a diferença entre elas é de 30 anos. Quantos anos tem a mãe?', 'As idades são 7k e 2k. A diferença é 7k − 2k = 5k = 30, então k = 6. A mãe tem 7 × 6 = 42 anos e a filha tem 12 anos.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '42 anos', TRUE),
        ('B', '12 anos', FALSE),
        ('C', '30 anos', FALSE),
        ('D', '35 anos', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Em uma viagem de ida, um carro andou a 90 km/h durante 4 horas. Na volta, pelo mesmo caminho, levou 5 horas. Qual foi a velocidade média na volta?', 'Distância: 90 × 4 = 360 km. Na volta: 360 ÷ 5 = 72 km/h. (Velocidade e tempo são inversamente proporcionais.)')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '112,5 km/h', FALSE),
        ('B', '72 km/h', TRUE),
        ('C', '60 km/h', FALSE),
        ('D', '80 km/h', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Se A é 40% de B e B é 25% de C, então A é quantos por cento de C?', 'A = 0,40 × B e B = 0,25 × C. Logo A = 0,40 × 0,25 × C = 0,10 × C, ou seja, 10% de C. Com C = 100: B = 25 e A = 10.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '65%', FALSE),
        ('B', '15%', FALSE),
        ('C', '10%', TRUE),
        ('D', '100%', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Em um mapa com escala 1:1000, um terreno retangular mede 4 cm por 3 cm. Qual é a área real do terreno?', 'Cada centímetro no mapa equivale a 1000 cm = 10 m. Os lados reais medem 4 × 10 = 40 m e 3 × 10 = 30 m. Área: 40 × 30 = 1200 m².')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '12 m²', FALSE),
        ('B', '1200 m²', TRUE),
        ('C', '120 m²', FALSE),
        ('D', '12000 m²', FALSE)
) AS v(letra, texto, correta);

WITH q AS (
    INSERT INTO questoes (area_id, nivel_id, enunciado, resolucao_detalhada)
    VALUES (7, 3, 'Oito máquinas, trabalhando 6 horas por dia durante 5 dias, produzem 1200 peças. Quantas peças 10 máquinas iguais produzem em 4 dias, trabalhando 9 horas por dia?', 'A produção é proporcional a máquinas × horas × dias. Situação 1: 8 × 6 × 5 = 240 unidades para 1200 peças (5 peças por unidade). Situação 2: 10 × 9 × 4 = 360 unidades, que produzem 360 × 5 = 1800 peças.')
    RETURNING id
)
INSERT INTO alternativas (questao_id, letra, texto, correta)
SELECT q.id, v.letra, v.texto, v.correta
FROM q, (VALUES
        ('A', '1440 peças', FALSE),
        ('B', '1350 peças', FALSE),
        ('C', '2000 peças', FALSE),
        ('D', '1800 peças', TRUE)
) AS v(letra, texto, correta);


COMMIT;
