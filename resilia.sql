CALL resilia.criar_tabelas_resilia();
CALL resilia.inserir_dados();
CALL resilia.inserir_relacionamentos();



--testes
select * from resilia.alunos;
select * from resilia.facilitadores
select * from resilia.turmas
Select * from resilia.cursos
select * from resilia.alunos_turmas;
select * from resilia.facilitadores_turmas;
