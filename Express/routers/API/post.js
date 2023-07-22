const User = require("../../model/User")

//Raíz
module.exports = {
    postApi : {
        async signUp (request, response) {
            const reqRegistro = request.body;
            const user = new User(reqRegistro);
            const registroUser = await user.registerUser();

            if(registroUser !== 0 ){
                response.status(201).json({msj: "Registro Exitoso", affected: registroUser})
            }else{
                response.status(400).json({msj: "Registro No Exitoso: Nombre de Usuario Existente", affected: registroUser})
            }
        },
        async login (request, response) {
            const reqLogin = request.body;
            const user = new User(reqLogin);
            const {resulRes, idUsu} = await user.loginUser();

            if(resulRes !== 0 ){
                response.status(200).json({msj: "¡Bienvenido!", id: idUsu})
            }else{
                response.status(400).json({msj: "Fallo al Iniciar Sesión", id: idUsu})
            }
        },
        async postRecipe (request, response) {
            
        },
        async postFavorite (request, response) {
            
        }
    }   
}


