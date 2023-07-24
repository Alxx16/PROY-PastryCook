const Favorite = require("../../model/Favorite")
const Recipe = require("../../model/Recipe")

//Raíz
module.exports = {
    deleteApi : {
        async deleteFavorite (request, response) {
            const reqFav = {
                operacion: request.query.op
                ,  id_Receta: request.query.id_R
                , id_Usuario: request.query.id_U
            };
            const recetaFav = new Favorite(reqFav);
            const {resulRes, idReceta} = await recetaFav.getProcessFavorite();
            if(resulRes !== 0){
                response.status(200).json({msj: "Eliminado de Favoritos", idR: idReceta, estado: resulRes})
            }else{
                response.status(400).json({msj: "Fallo al Eliminar de Favoritos", idR: idReceta, estado: resulRes} )
            }
        },
        async deleteRecipe (request, response){
            const reqDele = request.body;
            const recipe = new Recipe(reqDele);
            const results = await recipe.processRecipe();

            if(results !== 0){
                response.status(200).json({msj: "Receta Eliminada", estado: results})
            }else{
                response.status(400).json({msj: "Fallo al eliminar la receta", estado: results} )
            }
        }
    }
}