var database = require("../database/config");

function buscarUltimasMedidas(idfavorito, fkFavorito){
    
    instrucaoSql = ''

    instrucaoSql = `SELECT ${idfavorito}, COUNT(${fkFavorito})votos FROM Cadastro JOIN 
    Favorito ON fkFavorito = IdFavorito GROUP BY ${fkFavorito};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas
}