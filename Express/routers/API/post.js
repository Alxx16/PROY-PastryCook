const User = require("../../model/User")

//Raíz
module.exports = {
    postApi : {
        async signUp (request, response) {
            const reqRegistro = request.body;
            const user = new User(reqRegistro);
            const registroUser = await user.registerUser();

            if(registroUser !== 0 ){
                response.status(201).json({"Registro Exitoso": registroUser})
            }else{
                response.status(400).json({"Registro No Exitoso: Nombre de Usuario Existente": registroUser})
            }
        },
        async login (request, response) {
            const reqLogin = request.body;
            const user = new User(reqLogin);
            const {resulRes, idUsu} = await user.loginUser();

            if(resulRes !== 0 ){
                response.status(200).json({"¡Bienvenido!": idUsu})
            }else{
                response.status(400).json({"Fallo al Iniciar Sesión": idUsu})
            }
        },
        async postRecipe (request, response) {
            
        }
    }   
}


