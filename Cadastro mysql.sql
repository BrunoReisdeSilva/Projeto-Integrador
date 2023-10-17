
CREATE SCHEMA IF NOT EXISTS Cadastrar;

USE Cadastrar;
CREATE TABLE cadastro (
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);


INSERT INTO cadastrar (nome, telefone, endereco, cpf, email) 
VALUES 
    ('João', '9999-9999', 'Rua Oscar Freire', '3434343', 'joao@gmail.com'),
    ('Maria', '9988-7777', 'Rua Galvao Bueno', '4555670', 'maria@gmail.com');

CREATE TABLE login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);
INSERT INTO login (nome, email, senha) 
VALUES ('Nome do Usuário', 'usuario@email.com', 'senha_hash');

SELECT * FROM login WHERE email = 'usuario@email.com' AND senha = 'senha_hash';

