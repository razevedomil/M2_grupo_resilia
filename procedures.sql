CREATE SCHEMA resilia;
CREATE OR REPLACE PROCEDURE resilia.criar_tabelas_resilia()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Criando a tabela Cursos no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Cursos (
        id_curso SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        descricao TEXT,
        carga_horaria_total INTEGER
    );

    -- Criando a tabela Alunos no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Alunos (
        id_aluno SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        email VARCHAR(100),
        data_nascimento DATE,
        telefone VARCHAR(20),
        status VARCHAR(20)
    );

	    -- Criando a tabela Facilitadores no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Facilitadores (
        id_facilitador SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        email VARCHAR(100),
        telefone VARCHAR(20)
    );

    -- Criando a tabela Módulos no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Modulos (
        id_modulo SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        descricao TEXT,
        carga_horaria INTEGER,
        id_curso INTEGER REFERENCES resilia.Cursos(id_curso)
    );

    -- Criando a tabela Turmas no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Turmas (
        id_turma SERIAL PRIMARY KEY,
        nome VARCHAR(100),
        data_inicio DATE,
        data_termino DATE,
        id_curso INTEGER REFERENCES resilia.Cursos(id_curso)
    );
	

    -- Criando tabela de relacionamento Alunos_Turmas no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Alunos_Turmas (
        id_aluno INTEGER REFERENCES resilia.Alunos(id_aluno),
        id_turma INTEGER REFERENCES resilia.Turmas(id_turma),
        PRIMARY KEY (id_aluno, id_turma)
    );

    -- Criando tabela de relacionamento Facilitadores_Turmas no esquema "resilia"
    CREATE TABLE IF NOT EXISTS resilia.Facilitadores_Turmas (
        id_facilitador INTEGER REFERENCES resilia.Facilitadores(id_facilitador),
        id_turma INTEGER REFERENCES resilia.Turmas(id_turma),
        PRIMARY KEY (id_facilitador, id_turma)
    );
END;
$$;


CREATE OR REPLACE PROCEDURE resilia.inserir_dados()
LANGUAGE plpgsql
AS $$
BEGIN
	--INSERIR DADOS DO CURSO:
	CREATE TEMP TABLE IF NOT EXISTS temp_cursos (
    nome varchar,
    descricao varchar,
    carga_horaria_total int
);

	INSERT INTO temp_cursos (nome, descricao, carga_horaria_total)
	VALUES
		('Desenvolvimento Web', 'Curso completo de desenvolvimento web', 180),
		('Data Science', 'Curso abrangente de ciência de dados', 200),
		('Design Gráfico', 'Curso prático de design gráfico', 150),
		('Marketing Digital', 'Curso especializado em marketing online', 160),
		('Gestão de Projetos', 'Curso de gerenciamento de projetos', 140);

	INSERT INTO resilia.Cursos (nome, descricao, carga_horaria_total)
	SELECT nome, descricao, carga_horaria_total FROM temp_cursos;

	--INSERIR DADOS DOS ALUNOS
    CREATE TEMP TABLE IF NOT EXISTS temp_alunos (
        nome varchar,
        email varchar,
        data_nascimento date,
        telefone varchar,
        status varchar
    );

    INSERT INTO temp_alunos (nome, email, data_nascimento, telefone, status)
    VALUES
		('João Silva', 'joao@email.com', '2000-01-15', '(11) 9999-8888', 'Ativo'),
		('João Silva', 'joao@email.com', '2000-01-15', '(11) 9999-8888', 'Ativo'),
		('Maria Santos', 'maria@email.com', '1998-05-20', '(21) 9876-5432', 'Ativo'),
		('Pedro Oliveira', 'pedro@email.com', '1999-03-10', '(31) 1234-5678', 'Ativo'),
		('Ana Pereira', 'ana@email.com', '2001-09-05', '(41) 5555-1234', 'Ativo'),
		('Carlos Souza', 'carlos@email.com', '1997-11-30', '(51) 7777-9876', 'Ativo'),
		('Laura Mendes', 'laura@email.com', '1995-07-25', '(61) 3333-4567', 'Ativo'),
		('André Almeida', 'andre@email.com', '1998-04-18', '(71) 8888-2345', 'Ativo'),
		('Sofia Costa', 'sofia@email.com', '2002-02-12', '(81) 2222-6789', 'Ativo'),
		('Guilherme Lima', 'guilherme@email.com', '1996-08-08', '(91) 4444-3456', 'Ativo'),
		('Isabela Fernandes', 'isabela@email.com', '2003-06-22', '(01) 9999-0000', 'Ativo'),
		('Fernanda Oliveira', 'fernanda@email.com', '1997-02-18', '(12) 3456-7890', 'Ativo'),
		('Rafael Santos', 'rafael@email.com', '1999-08-05', '(22) 9876-5432', 'Ativo'),
		('Camila Pereira', 'camila@email.com', '2000-04-10', '(32) 1234-5678', 'Ativo'),
		('Lucas Souza', 'lucas@email.com', '1996-11-20', '(42) 5555-1234', 'Ativo'),
		('Gustavo Almeida', 'gustavo@email.com', '1995-03-25', '(62) 3333-4567', 'Ativo'),
		('Carolina Costa', 'carolina@email.com', '1994-09-12', '(72) 8888-2345', 'Ativo'),
		('Pedro Lima', 'pedro@email.com', '2001-01-22', '(82) 2222-6789', 'Ativo'),
		('Mariana Fernandes', 'mariana@email.com', '2004-06-08', '(92) 4444-3456', 'Ativo'),
		('Eduardo Silva', 'eduardo@email.com', '2003-12-31', '(02) 9999-0000', 'Ativo'),
		('Fernanda Oliveira', 'fernanda@email.com', '1997-02-18', '(12) 3456-7890', 'Ativo'),
		('Rafael Santos', 'rafael@email.com', '1999-08-05', '(22) 9876-5432', 'Ativo'),
		('Camila Pereira', 'camila@email.com', '2000-04-10', '(32) 1234-5678', 'Ativo'),
		('Lucas Souza', 'lucas@email.com', '1996-11-20', '(42) 5555-1234', 'Ativo'),
		('Juliana Mendes', 'juliana@email.com', '1998-07-15', '(52) 7777-9876', 'Ativo'),
		('Gustavo Almeida', 'gustavo@email.com', '1995-03-25', '(62) 3333-4567', 'Ativo'),
		('Carolina Costa', 'carolina@email.com', '1994-09-12', '(72) 8888-2345', 'Ativo'),
		('Pedro Lima', 'pedro@email.com', '2001-01-22', '(82) 2222-6789', 'Ativo'),
		('Mariana Fernandes', 'mariana@email.com', '2004-06-08', '(92) 4444-3456', 'Ativo'),
		('Eduardo Silva', 'eduardo@email.com', '2003-12-31', '(02) 9999-0000', 'Ativo'),
		('Alice Oliveira', 'alice@email.com', '1990-03-25', '(11) 1111-2222', 'Ativo'),
		('Bruno Santos', 'bruno@email.com', '1985-07-12', '(21) 2222-3333', 'Ativo'),
		('Carla Pereira', 'carla@email.com', '1978-09-18', '(31) 3333-4444', 'Ativo'),
		('Daniel Costa', 'daniel@email.com', '1989-02-10', '(41) 4444-5555', 'Ativo'),
		('Eva Almeida', 'eva@email.com', '1993-11-05', '(51) 5555-6666', 'Ativo'),
		('Felipe Mendes', 'felipe@email.com', '1982-06-20', '(61) 6666-7777', 'Ativo'),
		('Gabriela Lima', 'gabriela@email.com', '1975-08-15', '(71) 7777-8888', 'Ativo'),
		('Henrique Souza', 'henrique@email.com', '1997-04-18', '(81) 8888-9999', 'Ativo'),
		('Isadora Fernandes', 'isadora@email.com', '1980-01-12', '(91) 9999-0000', 'Ativo'),
		('João Pereira', 'joao_pereira@email.com', '1987-12-22', '(01) 0000-1111', 'Ativo'),
		('Karen Costa', 'karen@email.com', '1991-05-08', '(12) 1111-2222', 'Ativo'),
		('Lucas Oliveira', 'lucas_o@email.com', '1986-07-10', '(22) 2222-3333', 'Ativo'),
		('Mariana Santos', 'mariana_santos@email.com', '1979-09-25', '(32) 3333-4444', 'Ativo'),
		('Natalia Almeida', 'natalia@email.com', '1994-02-05', '(42) 4444-5555', 'Ativo'),
		('Otávio Mendes', 'otavio@email.com', '1983-06-12', '(52) 5555-6666', 'Ativo'),
		('Paula Lima', 'paula@email.com', '1976-08-17', '(62) 6666-7777', 'Ativo'),
		('Quiteria Silva', 'quiteria@email.com', '1988-04-22', '(72) 7777-8888', 'Ativo'),
		('Rafael Souza', 'rafael_souza@email.com', '1998-01-10', '(82) 8888-9999', 'Ativo'),
		('Sandra Fernandes', 'sandra@email.com', '1981-05-12', '(92) 9999-0000', 'Ativo'),
		('Thiago Oliveira', 'thiago@email.com', '1992-06-08', '(02) 0000-1111', 'Ativo');

    INSERT INTO resilia.alunos (nome, email, data_nascimento, telefone, status)
    SELECT nome, email, data_nascimento, telefone, status FROM temp_alunos;


	--- INSERIR FACILITADORES
	
	CREATE TEMP TABLE IF NOT EXISTS temp_facilitadores (
        nome varchar,
        email varchar,
        telefone varchar
    );
	
	INSERT INTO temp_facilitadores (nome, email, telefone)
    VALUES
        ('Ana Silva', 'ana.silva@empresa.com', '(11) 9876-5432'),
        ('Pedro Santos', 'pedro.santos@empresa.com', '(21) 1234-5678'),
        ('Mariana Costa', 'mariana.costa@empresa.com', '(31) 2468-1357'),
        ('Lucas Oliveira', 'lucas.oliveira@empresa.com', '(41) 9876-5432'),
        ('Isabela Rodrigues', 'isabela.rodrigues@empresa.com', '(51) 1234-5678'),
		('Carlos Mendes', 'carlos.mendes@empresa.com', '(61) 9987-6543'),
		('Juliana Ribeiro', 'juliana.ribeiro@empresa.com', '(71) 9123-4567'),
		('Roberto Dias', 'roberto.dias@empresa.com', '(81) 9234-5678'),
		('Fernanda Lima', 'fernanda.lima@empresa.com', '(91) 9345-6789'),
		('Ricardo Alves', 'ricardo.alves@empresa.com', '(01) 9456-7890');

	INSERT INTO resilia.facilitadores (nome, email, telefone)
    SELECT nome, email, telefone FROM temp_facilitadores;
	
	
	---INSERIR DADOS NA TABELA TURMAS
	CREATE TEMP TABLE IF NOT EXISTS temp_turmas (
    nome varchar,
    data_inicio date,
    data_termino date
);

	INSERT INTO temp_turmas (nome, data_inicio, data_termino)
	VALUES 
		('Turma Desenvolvimento Web', '2024-07-01', '2024-08-31'),
		('Turma Data Science', '2024-08-01', '2024-09-30'),
		('Turma Design Gráfico', '2024-09-01', '2024-10-31'),
		('Turma Marketing Digital', '2024-10-01', '2024-11-30'),
		('Turma Gestão de Projetos', '2024-11-01', '2024-12-31');

	INSERT INTO resilia.turmas (nome, data_inicio, data_termino)
	SELECT nome, data_inicio, data_termino FROM temp_turmas;

	---INSERIR DADOS DA TABELA MODULO:

	CREATE TEMP TABLE IF NOT EXISTS temp_modulos (
    nome varchar,
    descricao varchar,
    carga_horaria int
);

	INSERT INTO temp_modulos (nome, descricao, carga_horaria)
	VALUES
		('Introdução ao Desenvolvimento Web', 'Fundamentos básicos de desenvolvimento web', 40),
		('Introdução à Ciência de Dados', 'Princípios essenciais de data science', 40),
		('Fundamentos de Design Gráfico', 'Conceitos básicos de design visual', 40),
		('Estratégias de Marketing Online', 'Práticas de marketing digital', 40),
		('Gerenciamento de Projetos', 'Princípios de gestão de projetos', 40);

	INSERT INTO resilia.Modulos (nome, descricao, carga_horaria)
	SELECT nome, descricao, carga_horaria FROM temp_modulos;

END;
$$;


-- CRIAR PROCEDURE PARA INSERIR DADOS DE RELACIONAMENTO(aluno_turma,facilitador_turma)
CREATE OR REPLACE PROCEDURE resilia.inserir_relacionamentos()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Inserir dados na tabela Alunos_Turmas
    INSERT INTO resilia.Alunos_Turmas (id_aluno, id_turma) VALUES
    (1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1),
    (11, 2), (12, 2), (13, 2), (14, 2), (15, 2), (16, 2), (17, 2), (18, 2), (19, 2), (20, 2),
    (21, 3), (22, 3), (23, 3), (24, 3), (25, 3), (26, 3), (27, 3), (28, 3), (29, 3), (30, 3),
    (31, 4), (32, 4), (33, 4), (34, 4), (35, 4), (36, 4), (37, 4), (38, 4), (39, 4), (40, 4),
    (41, 5), (42, 5), (43, 5), (44, 5), (45, 5), (46, 5), (47, 5), (48, 5), (49, 5), (50, 5);

    -- Inserir dados na tabela Facilitadores_Turmas
    INSERT INTO resilia.Facilitadores_Turmas (id_facilitador, id_turma) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
END;
$$;
