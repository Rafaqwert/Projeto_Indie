//Váriavel que faz uma requisição do pacote mysql2 (presente em package.json)
//Pacote referente ao MySQL workbench
var mysql = require("mysql2");
//Váriavel que faz uma requisição do pacote mssql (presente em package.json)
//Pacote referente ao SQL Server
var sql = require('mssql');

//=================CONEXÃO DO BANCO DE DADOS====================//

// CONEXÃO DO SQL SERVER - AZURE (NUVEM)
// var sqlServerConfig = {
//     server: "SEU_SERVIDOR",
//     database: "SEU_BANCO_DE_DADOS",
//     user: "SEU_USUARIO",
//     password: "SUA_SENHA",
//     pool: {
//         max: 10,
//         min: 0,
//         idleTimeoutMillis: 30000
//     },
//     options: {
//         encrypt: true, // for azure
//     }
// }

//Configurações do servidor (para conectar com o MySQL workbench)
var mySqlConfig = { 
    host: "SEU_SERVIDOR",
    database: "SEU_BANCO_DE_DADOS",
    user: "SEU_USUARIO",
    password: "SUA_SENHA",
};


function executar(instrucao) {
    // VERIFICA A VARIÁVEL DE AMBIENTE SETADA EM app.js
    if (process.env.AMBIENTE_PROCESSO == "producao") {
        return new Promise(function (resolve, reject) {
            sql.connect(sqlServerConfig).then(function () {
                return sql.query(instrucao);
            }).then(function (resultados) {
                console.log(resultados);
                resolve(resultados.recordset);
            }).catch(function (erro) {
                reject(erro);
                console.log('ERRO: ', erro);
            });
            sql.on('error', function (erro) {
                return ("ERRO NO SQL SERVER (Azure): ", erro);
            });
        });
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        return new Promise(function (resolve, reject) {
            var conexao = mysql.createConnection(mySqlConfig);
            conexao.connect();
            conexao.query(instrucao, function (erro, resultados) {
                conexao.end();
                if (erro) {
                    reject(erro);
                }
                console.log(resultados);
                resolve(resultados);
            });
            conexao.on('error', function (erro) {
                return ("ERRO NO MySQL WORKBENCH: ", erro.sqlMessage);
            });
        });
    } else {
        return new Promise(function (resolve, reject) {
            console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
            reject("AMBIENTE NÃO CONFIGURADO EM app.js")
        });
    }
}

module.exports = {
    executar
}