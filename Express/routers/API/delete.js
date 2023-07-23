const User = require("../../model/User")
const Favorite = require("../../model/Favorite")

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
                response.status(200).json({msj: "Eliminado de Favoritos", idR: idReceta})
            }else{
                response.status(400).json({msj: "Fallo al Eliminar de Favoritos", idR: idReceta} )
            }
        }
    }
}