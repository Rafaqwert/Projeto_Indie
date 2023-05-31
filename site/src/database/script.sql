-- Documento de apoio para criação de banco e tabelas em outras máquinas

CREATE DATABASE Webaesthetic;

USE Webaesthetic;

-- Tabela com informações do usuário
CREATE TABLE Webaesthetic.Cadastro(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(25),
    email VARCHAR(100),
    senha VARCHAR(21),
    biografia VARCHAR(100),
    genero CHAR(1),
	CONSTRAINT CHK_GEN CHECK(genero IN('m','f','n')),
    fkFavorito INT
);

-- Tabela para usuário logar no blog
CREATE TABLE Webaesthetic.Login(
	idLogin INT,
    fkCadastro INT,
    PRIMARY KEY(idLogin, fkCadastro),
    email VARCHAR(100),
    senha VARCHAR(21)
);

-- Tabela de comentários no blog
CREATE TABLE Webaesthetic.Comentario(
	idComentario INT PRIMARY KEY AUTO_INCREMENT,
    comentario VARCHAR(1000),
    fkCadastro INT,
    FOREIGN KEY(fkCadastro) REFERENCES Webaesthetic.Cadastro(idCadastro)
);

-- Tabela de favoritos (do questionario do blog)
CREATE TABLE Webaesthetic.Favorito(
	idFavorito INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstetica VARCHAR(45)
);

-- Configuração de chave estrangeira (relação de Cadastro com Favorito)
ALTER TABLE Webaesthetic.Cadastro ADD FOREIGN KEY(fkFavorito) REFERENCES webaesthetic.Favorito(idFavorito);

SELECT * FROM Cadastro;
SELECT * FROM Comentario;
SELECT * FROM Login;
SELECT * FROM Favorito;

SELECT nome, fkFavorito, nomeEstetica FROM webaesthetic.cadastro RIGHT JOIN webaesthetic.favorito
	ON fkFavorito = idFavorito;

INSERT INTO Webaesthetic.Favorito(nomeEstetica) VALUES
('Old Web'),
('Y2K Millenium'),
('Frutiger Aero'),
('Vaporwave');

-- DROP DATABASE Webaesthetic;