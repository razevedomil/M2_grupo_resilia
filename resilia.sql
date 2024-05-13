-- Criando a tabela Cursos no esquema "resilia"
CREATE TABLE resilia.Cursos (
    id_curso SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    carga_horaria_total INTEGER
);

-- Criando a tabela Alunos no esquema "resilia"
CREATE TABLE resilia.Alunos (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_nascimento DATE,
    telefone VARCHAR(20),
    status VARCHAR(20)
);

-- Criando a tabela Facilitadores no esquema "resilia"
CREATE TABLE resilia.Facilitadores (
    id_facilitador SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Criando a tabela Turmas no esquema "resilia"
CREATE TABLE resilia.Turmas (
    id_turma SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    data_inicio DATE,
    data_termino DATE,
    id_curso INTEGER REFERENCES resilia.Cursos(id_curso)
);

-- Criando a tabela Módulos no esquema "resilia"
CREATE TABLE resilia.Modulos (
    id_modulo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    carga_horaria INTEGER,
    id_curso INTEGER REFERENCES resilia.Cursos(id_curso)
);

-- Criando tabela de relacionamento Alunos_Turmas (muitos para muitos) no esquema "resilia"
CREATE TABLE resilia.Alunos_Turmas (
    id_aluno INTEGER REFERENCES resilia.Alunos(id_aluno),
    id_turma INTEGER REFERENCES resilia.Turmas(id_turma),
    PRIMARY KEY (id_aluno, id_turma)
);

-- Criando tabela de relacionamento Facilitadores_Turmas (um para muitos) no esquema "resilia"
CREATE TABLE resilia.Facilitadores_Turmas (
    id_facilitador INTEGER REFERENCES resilia.Facilitadores(id_facilitador),
    id_turma INTEGER REFERENCES resilia.Turmas(id_turma),
    PRIMARY KEY (id_facilitador, id_turma)
);


-- INSERINDO DADOS NA TABELA

-- Inserindo um aluno
INSERT INTO resilia.Alunos (nome, email, data_nascimento, telefone, status)
VALUES ('João Silva', 'joao@email.com', '2000-01-15', '(11) 9999-8888', 'Ativo'),
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

-- Inserindo vários facilitadores
INSERT INTO resilia.Facilitadores (nome, email, telefone)
VALUES
    ('Ana Silva', 'ana.silva@empresa.com', '(11) 9876-5432'),
    ('Pedro Santos', 'pedro.santos@empresa.com', '(21) 1234-5678'),
    ('Mariana Costa', 'mariana.costa@empresa.com', '(31) 2468-1357'),
    ('Lucas Oliveira', 'lucas.oliveira@empresa.com', '(41) 9876-5432'),
    ('Isabela Rodrigues', 'isabela.rodrigues@empresa.com', '(51) 1234-5678'),
    ('Rafaela Almeida', 'rafaela.almeida@empresa.com', '(61) 2468-1357'),
    ('Gustavo Pereira', 'gustavo.pereira@empresa.com', '(71) 1357-2468'),
    ('Fernanda Souza', 'fernanda.souza@empresa.com', '(81) 7654-3210'),
    ('Diego Lima', 'diego.lima@empresa.com', '(91) 2345-6789'),
    ('Camila Ferreira', 'camila.ferreira@empresa.com', '(99) 8765-4321');


-- Inserindo uma turma
-- Inserindo turmas com nomes baseados nos cursos
INSERT INTO resilia.Turmas (nome, data_inicio, data_termino)
VALUES 
('Turma Desenvolvimento Web', '2024-07-01', '2024-08-31'),
('Turma Data Science', '2024-08-01', '2024-09-30'),
('Turma Design Gráfico', '2024-09-01', '2024-10-31'),
('Turma Marketing Digital', '2024-10-01', '2024-11-30'),
('Turma Gestão de Projetos', '2024-11-01', '2024-12-31'),
('Turma Inteligência Artificial', '2024-12-01', '2025-01-31'),
('Turma Redes de Computadores', '2025-01-01', '2025-02-28'),
('Turma Programação em Python', '2025-02-01', '2025-03-31'),
('Turma Banco de Dados', '2025-03-01', '2025-04-30'),
('Turma Segurança da Informação', '2025-04-01', '2025-05-31');


-- Inserindo um módulo
INSERT INTO resilia.Modulos (nome, descricao, carga_horaria)
VALUES
    ('Introdução ao Desenvolvimento Web', 'Fundamentos básicos de desenvolvimento web', 40),
    ('Introdução à Ciência de Dados', 'Princípios essenciais de data science', 40),
    ('Fundamentos de Design Gráfico', 'Conceitos básicos de design visual', 40),
    ('Estratégias de Marketing Online', 'Práticas de marketing digital', 40),
    ('Gerenciamento de Projetos', 'Princípios de gestão de projetos', 40),
    ('Introdução à Inteligência Artificial', 'Conceitos fundamentais de IA', 40),
    ('Fundamentos de Redes', 'Noções básicas sobre redes', 40),
    ('Python Básico', 'Introdução à programação em Python', 40),
    ('Introdução a Bancos de Dados', 'Princípios de bancos de dados', 40),
    ('Fundamentos de Segurança Cibernética', 'Noções básicas de segurança da informação', 40);

-- Inserindo um curso
INSERT INTO resilia.Cursos (nome, descricao, carga_horaria_total)
VALUES
    ('Desenvolvimento Web', 'Curso completo de desenvolvimento web', 180),
    ('Data Science', 'Curso abrangente de ciência de dados', 200),
    ('Design Gráfico', 'Curso prático de design gráfico', 150),
    ('Marketing Digital', 'Curso especializado em marketing online', 160),
    ('Gestão de Projetos', 'Curso de gerenciamento de projetos', 140),
    ('Inteligência Artificial', 'Curso avançado de IA', 220),
    ('Redes de Computadores', 'Curso sobre redes e conectividade', 190),
    ('Programação em Python', 'Curso prático de Python', 120),
    ('Banco de Dados', 'Curso completo de bancos de dados', 170),
    ('Segurança da Informação', 'Curso essencial de segurança cibernética', 200);
