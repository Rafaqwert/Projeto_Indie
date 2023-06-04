var database = require("../database/config");

function buscarUltimasMedidas(){
    
    instrucaoSql = ''

    instrucaoSql = `SELECT nomeEstetica, COUNT(fkFavorito)votos FROM Cadastro JOIN 
    Favorito ON fkFavorito = IdFavorito GROUP BY fkFavorito;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas
}