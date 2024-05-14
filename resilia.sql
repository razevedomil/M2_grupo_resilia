select * from resilia.alunos;
select * from resilia.facilitadores;
select * from resilia.cursos;
select * from resilia.modulos;
select * from resilia.turmas;

--CRIAR TODAS AS TABELAS NECESSÁRIAS:
CALL resilia.criar_tabelas_resilia();

--INSERIR TODOS OS DADOS CHAMANDO A PROCEDURE:
CALL inserir_dados();
