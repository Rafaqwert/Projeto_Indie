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
    sexo CHAR(1),
    fkFavorito INT
);

-- Tabela para usuário logar no blog
CREATE TABLE Webaesthetic.Online(
	idOnline INT PRIMARY KEY AUTO_INCREMENT,
    fkCadastro INT,
    FOREIGN KEY(fkCadastro) REFERENCES Cadastro(idCadastro)
);

-- Tabela de favoritos (do questionario do blog)
CREATE TABLE Webaesthetic.Favorito(
	idFavorito INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstetica VARCHAR(45)
);

ALTER TABLE Webaesthetic.Cadastro ADD FOREIGN KEY(fkFavorito) REFERENCES webaesthetic.Favorito(idFavorito);

INSERT INTO Webaesthetic.Favorito(nomeEstetica) VALUES
('Nenhum'),
('Old_Web'),
('Y2K_Millenium'),
('Frutiger_Aero'),
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

INSERT INTO webaesthetic.Online(fkCadastro) VALUES (1);

-- Configuração de chave estrangeira (relação de Cadastro com Favorito)


SELECT * FROM webaesthetic.Cadastro;
SELECT * FROM webaesthetic.Online;
SELECT * FROM webaesthetic.Favorito;

SELECT nome, fkFavorito, nomeEstetica FROM webaesthetic.cadastro RIGHT JOIN webaesthetic.favorito
	ON fkFavorito = idFavorito;
-- quantidade de vezes que uma determinada estetica foi escolhida

SELECT nomeEstetica, COUNT(fkFavorito)votos FROM Cadastro JOIN Favorito ON fkFavorito = IdFavorito GROUP BY fkFavorito;

-- Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'webaesthetic.Favorito.idFavorito' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

-- Configuração de privilégios do usuário
-- GRANT USAGE ON webaesthetics.* TO 'adm_1'@'%';
-- GRANT ALL PRIVILEGES ON Webaesthetic.* TO adm_1;
-- FLUSH PRIVILEGES;

-- SHOW GRANTS FOR adm_1;

-- Select nome, fkFavorito FROM Cadastro JOIN Favorito ON fkFavorito = idFavorito;

-- UPDATE webaesthetic.cadastro SET fkFavorito = null WHERE idCadastro = 1;