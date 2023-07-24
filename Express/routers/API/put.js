const User = require("../../model/User")
const Recipe = require("../../model/Recipe")

//Raíz
module.exports = {
    putApi : {
        async editUser (request, response) {
            let reqEdit = JSON.parse(request.body.data);
            reqEdit["operacion"] = '';
            reqEdit["icono"] = request.file.destination.split("/")[1] +'/'+ request.file.filename
            const user = new User(reqEdit);
            const resultEdit = await user.updateDataUser();

            if(resultEdit !== 0 ){
                response.status(201).json({msj: "Datos Actualizados", affected: resultEdit})
            }else{
                response.status(400).json({msj: "Error al Actualizar los Datos", affected: resultEdit})
            }
        },
        async editRecipe (request, response){
            let reqEdit = JSON.parse(request.body.data);
            reqEdit["operacion"] = '';
            reqEdit["icono"] = request.file.destination.split("/")[1] +'/'+ request.file.filename
            const recipe = new Recipe(reqEdit);
            const results = await recipe.processRecipe();

            if(results !== 0){
                response.status(200).json({msj: "Receta Editada", estado: results})
            }else{
                response.status(400).json({msj: "Fallo al editar la receta", estado: results} )
            }
        },
        async actPlanUsu (request, response){
            const reqSubsc = request.body;
            const plan = new Plan(reqSubsc);
            const resSubs = await plan.subsPlanUser();

            if(resSubs !== 0){
                response.status(200).json({msj: "Subscripción Exitosa", estado: resSubs})
            }else{
                response.status(400).json({msj: "Fallo Subscribir al Plan", estado: resSubs} )
            }
        }
    }
}


