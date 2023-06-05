//===========================SESSÂO======================//

//Função para validar se sessão no login foi respondida corretamente
function validarSessao() {
    //aguardar();//Chama função para aguardar na tela de carregamento

    var email = sessionStorage.EMAIL_USUARIO; //Váriavel que recebe email guardado no sessionStorage
    var nome = sessionStorage.NOME_USUARIO; //Váriavel que recebe nome guardado no sessionStorage

    // Variavel que recebe o espaço na home page para 
    // mostrar o nome do usuário
    var b_usuario = document.getElementById("b_usuario");

    //Se o campo de email e de nome ser diferente de vazio, então entre
    if (email != null && nome != null) {
    //validado

    } else {//Se não, volta para login
        window.location = "../login.html";
    }
}

//???Limpa as informações no sessionStorage
function limparSessao() {
    sessionStorage.clear();
    window.location = "../login.html"
}
//========================================================//

//===========================LOADING======================//
//Função de carregamento da página
function aguardar() {
    //Mostra na tela a div Aguardar que contém o gif de 'loading'
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
    console.log('carregando');
}

function finalizarAguardar(texto) {
    //Esconde na tela a div Aguardar que contém o gif de 'loading'
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";
    console.log('fim carregando');

    var divErrosLogin = document.getElementById("div_erros_login");
    if(texto) {
        divErrosLogin.style.display = "flex"; //Mostra div
        divErrosLogin.innerHTML = texto; //Escreve parametro na div
    }
}
//========================================================//

// function entrarOnline(resposta) {

//     var idUsuario = sessionStorage.ID_USUARIO;

//     fetch("/usuarios/entrarOnline", {
//         method: "POST",
//         headers: {
//             "Content-Type": "application/json"
//         },
//         body: JSON.stringify({
//             idUser: idUsuario
//         })
//     }).then(function (resposta) {
//         console.log("ESTOU NO THEN DO entrar()!")

        
// }).catch(function (erro) {
//         console.log(erro);
//     });

//     return false;
// }

//===========================MODAL======================//
// function mostrarModal() {
//     var divModal = document.getElementById("div_modal");
//     divModal.style.display = "flex";
// }

// function fecharModal() {
//     var divModal = document.getElementById("div_modal");
//     divModal.style.display = "none";
// }
//========================================================//