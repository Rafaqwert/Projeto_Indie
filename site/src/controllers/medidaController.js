var medidaModel = require("../models/medidaModel");

function buscarUltimasMedidas(req, res) {

    console.log(`Verificando os favoritos`);

    medidaModel.buscarUltimasMedidas().then(function (resultado) {
       
        res.status(200).json(resultado);
        
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimasMedidas
}