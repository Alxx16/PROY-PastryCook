const User = require("../../model/User")
const Recipe = require("../../model/Recipe")
const CategoriaNivel = require("../../model/CategoriaNivel")
const Planes = require("../../model/Plan")

//Raíz
module.exports = {
    getApi : {
        async getUser (request, response) {
            const reqGetU = {
                operacion: 'T', idUsuario: request.query.id, nameUser: ' ',
                correo: ' ', contrasena: ' ', nombreUsuario: ' ', icono: ' '
            };
            const user = new User(reqGetU);
            const resultsData = await user.getDataUser();
            response.status(200).json(resultsData)
        },
        async getDataRecipe (request, response) {
            const reqRecipeIn = {
                operacion: request.query.op
                , id_Usuario: request.query.idU
                , id_Receta: request.query.idR
            };
            let ej;
            const recipe = new Recipe(reqRecipeIn);
            const resultsRecipe = await recipe.getAllRecipe();
            const resultsR = JSON.stringify(resultsRecipe) === '[]' ? [{ "msj": 'No se han encontrado Recetas', "estado": 0}] : resultsRecipe
            response.status(200).json(resultsR);
        },
        async getCategNivel (request, response){
            const operacion = request.query.op;
            const filtros = new CategoriaNivel(operacion);
            const [results] = await filtros.getData();
            response.status(200).json(results);
        },
        async getPlanes (request, response){
            const reqPlanes = {
                                operacion: request.query.op, id_user: request.query.idU
                                , id_plan_: request.query.idP, descount: request.query.desc
                            }
            const planes = new Planes(reqPlanes);
            const [results] = await planes.getPlanesAll();
            response.status(200).json(results);
        }
    }
}
