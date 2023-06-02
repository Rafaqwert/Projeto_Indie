-- Documento de apoio para criação de banco e tabelas em outras máquinas
CREATE DATABASE Webaesthetic;

USE Webaesthetic;

-- DROP DATABASE Webaesthetic;

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
CREATE TABLE Webaesthetic.Online(
	idOnline INT,
    fkCadastro INT,
    PRIMARY KEY(idOnline, fkCadastro),
    FOREIGN KEY(fkCadastro) REFERENCES Cadastro(idCadastro)
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

INSERT INTO Webaesthetic.Favorito(nomeEstetica) VALUES
('Nenhum'),
('Old Web'),
('Y2K Millenium'),
('Frutiger Aero'),
('Vaporwave');

INSERT INTO Cadastro(nome, email, senha, fkFavorito) VALUES 
('A', 'a@email', '123', 2),
('B', 'b@email', '123', 1),
('C', 'c@email', '123', 3),
('D', 'd@email', '123', 3),
('E', 'e@email', '123', 4),
('F', 'f@email', '123', 5),
('G', 'g@email', '123', 4),
('H', 'h@email', '123', 5),
('I', 'i@email', '123', 2);

-- Configuração de chave estrangeira (relação de Cadastro com Favorito)
ALTER TABLE Webaesthetic.Cadastro ADD FOREIGN KEY(fkFavorito) REFERENCES webaesthetic.Favorito(idFavorito);

SELECT * FROM webaesthetic.Cadastro;
SELECT * FROM webaesthetic.Comentario;
SELECT * FROM webaesthetic.Online;
SELECT * FROM webaesthetic.Favorito;

SELECT nome, fkFavorito, nomeEstetica FROM webaesthetic.cadastro RIGHT JOIN webaesthetic.favorito
	ON fkFavorito = idFavorito;
-- quantidade de vezes que uma determinada estetica foi escolhida
SELECT nomeEstetica, COUNT(fkFavorito) Votos FROM Cadastro JOIN Favorito ON fkFavorito = IdFavorito GROUP BY nomeEstetica;

-- Configuração de privilégios do usuário
-- GRANT USAGE ON webaesthetics.* TO 'adm_1'@'%';
-- GRANT ALL PRIVILEGES ON Webaesthetic.* TO adm_1;
-- FLUSH PRIVILEGES;

-- SHOW GRANTS FOR adm_1;

-- Select nome, fkFavorito FROM Cadastro JOIN Favorito ON fkFavorito = idFavorito;

-- UPDATE webaesthetic.cadastro SET fkFavorito = null WHERE idCadastro = 1;