CREATE DATABASE Webaesthetic;

USE Webaesthetic;

CREATE TABLE Webaesthetic.Conta(
	idConta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60),
    email VARCHAR(100)
);

CREATE TABLE Webaesthetic.Usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeReal VARCHAR(100),
    senha VARCHAR(21),
    fkConta INT,
    FOREIGN KEY(fkConta) REFERENCES Conta(idConta)
);

CREATE TABLE Webaesthetic.Comentario(
	idComentario INT PRIMARY KEY AUTO_INCREMENT,
    comentario VARCHAR(1000),
    fkConta INT,
    FOREIGN KEY(fkConta) REFERENCES Conta(idConta)
);

CREATE TABLE Webaesthetic.Favorito(
	idFavorito INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstetica VARCHAR(45),
    fkConta INT,
    FOREIGN KEY(fkConta) REFERENCES Conta(idConta)
);