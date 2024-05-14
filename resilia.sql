select * from resilia.alunos;
select * from resilia.facilitadores;
select * from resilia.cursos;
select * from resilia.modulos;
select * from resilia.turmas;

--CRIAR TODAS AS TABELAS NECESSÁRIAS:
CALL resilia.criar_tabelas_resilia();

--INSERIR TODOS OS DADOS CHAMANDO A PROCEDURE:
CALL inserir_dados();


		--INSERIR DADOS NA TABELA ALUNOS_TURMAS
	INSERT INTO resilia.Alunos_Turmas (id_aluno, id_turma) VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1),
    (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
    (21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
    (31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), (39, 4), (40, 4),
    (41, 5), (42, 5), (43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5), (49, 5), (50, 5);
