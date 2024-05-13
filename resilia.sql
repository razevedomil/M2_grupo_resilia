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
