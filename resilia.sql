CALL resilia.criar_tabelas_resilia();
CALL resilia.inserir_dados();
CALL resilia.inserir_relacionamentos();


--1. Selecionar a quantidade total de estudantes cadastrados no banco código: 
	SELECT COUNT(alunos.nome) AS total_estudantes
	FROM resilia.alunos

--2.SELECIONAR OS FACILITADORES QUE ESTÃO EM MAIS DE UMA TURMA(ERRADO):
SELECT 
    f.id_facilitador,
    f.nome,
    COUNT(ft.id_turma) AS numero_de_turmas
FROM 
    resilia.Facilitadores f
JOIN 
    resilia.Facilitadores_Turmas ft ON f.id_facilitador = ft.id_facilitador
GROUP BY 
    f.id_facilitador, f.nome
HAVING 
    COUNT(ft.id_turma) > 1;

-- 4.CRIAR TABELA DE LOG PARA VISUALIZAR ATUALIZAÇÃO DE STATUS DO ALUNO
CREATE TABLE resilia.Log_Status_Alunos (
    id SERIAL PRIMARY KEY,
    id_aluno INTEGER,
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_anterior VARCHAR(20),
    status_novo VARCHAR(20)
);
--visualizar log
select * from resilia.Log_status_alunos;

--3.CRIAR A VIEW PARA VER PORCENTAGEM DE EVASÃO POR TURMA
CREATE VIEW resilia.Porcentagem_Evasao_Por_Turma AS
SELECT
    T.id_turma,
    T.nome AS nome_turma,
    COUNT(A.id_aluno) AS total_alunos,
    (COUNT(CASE WHEN A.status = 'Evasão' THEN 1 END) * 100.0 / COUNT(A.id_aluno)) AS percentagem_evasao
FROM
    resilia.Turmas AS T
JOIN
    resilia.Alunos_Turmas AS AT ON T.id_turma = AT.id_turma
JOIN
    resilia.Alunos AS A ON AT.id_aluno = A.id_aluno
GROUP BY
    T.id_turma, T.nome;

--visualizar a porcentagem de evasão:
SELECT * FROM resilia.Porcentagem_Evasao_Por_Turma;

-- 4.CRIAR TRIGGER PARA ATUALIZAÇÃO
CREATE OR REPLACE FUNCTION resilia.trigger_atualizacao_status_aluno()
RETURNS TRIGGER AS $$
BEGIN
    -- Verificar se o status foi atualizado
    IF NEW.status <> OLD.status THEN
        -- Inserir os detalhes da atualização na tabela de log
        INSERT INTO resilia.Log_Status_Alunos (id_aluno, status_anterior, status_novo)
        VALUES (NEW.id_aluno, OLD.status, NEW.status);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 4.Associar o trigger à tabela de alunos
CREATE TRIGGER atualizacao_status_aluno
AFTER UPDATE OF status ON resilia.Alunos
FOR EACH ROW
EXECUTE FUNCTION resilia.trigger_atualizacao_status_aluno();


-- 4.ATUALIZAR STATUS DO ALUNO:
UPDATE resilia.Alunos
SET status = 'Evasão'
WHERE id_aluno = 1;
SELECT * FROM resilia.Log_Status_Alunos;


--5. Além disso, vocês deverão pensar em uma pergunta que deverá ser respondida por uma 
--consulta SQL que combine pelo menos 3 tabelas. OK ✔
--PERGUNTA = "Quais são os alunos matriculados em cada turma e qual é o facilitador responsável por cada turma?" ✔
--Para responder a essa pergunta, precisamos combinar as tabelas Alunos, Turmas, Facilitadores e Facilitadores_Turmas. 
--Aqui está uma consulta SQL que realiza essa tarefa:

SELECT
    T.nome AS nome_turma,
    A.nome AS nome_aluno,
    F.nome AS nome_facilitador
FROM
    resilia.Turmas AS T
JOIN
    resilia.Alunos_Turmas AS AT ON T.id_turma = AT.id_turma
JOIN
    resilia.Alunos AS A ON AT.id_aluno = A.id_aluno
JOIN
    resilia.Facilitadores_Turmas AS FT ON T.id_turma = FT.id_turma
JOIN
    resilia.Facilitadores AS F ON FT.id_facilitador = F.id_facilitador;



--6. "6 perguntas estratégicas da empresa"
--Pergunta 1: Quem são os alunos evasivos e qual as suas idades?:
SELECT 
    nome, email, data_nascimento, telefone, status
FROM 
    resilia.Alunos
WHERE 
    status = 'Evasão';


--testes
select * from resilia.alunos;
select * from resilia.facilitadores
select * from resilia.turmas
Select * from resilia.cursos
select * from resilia.alunos_turmas;
select * from resilia.facilitadores_turmas;
