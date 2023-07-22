const User = require("../../model/User")

//Raíz
module.exports = {
    getApi : {
        async getUser (request, response) {
            const reqGetU = {operacion: 'T', idUsuario: request.query.id, nameUser: ' ',
                            correo: ' ', contrasena: ' ', nombreUsuario: ' ', icono: ' '};
            console.log(reqGetU);
            const user = new User(reqGetU);
            const resultsData = await user.getDataUser();
            response.status(200).json(resultsData)
        },
        async seeRecipe (request, response) {

        },
        async seeRecipeDetails (request, response) {
            
        }
    }
}
