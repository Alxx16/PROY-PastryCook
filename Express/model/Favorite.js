const {connection} = require("../config.db");

class Favorite {
 
    constructor({operacion, id_Receta, id_Usuario}){
        this.operacion = operacion;
        this.id_Receta = id_Receta;
        this.id_Usuario = id_Usuario;
    }
    async getProcessFavorite(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_favorito`(?,?,?)', 
                                [this.operacion, this.id_Receta, this.id_Usuario],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results)
                            resolve(results);
                    }
                );
            });
            const resResponse = results ? 1 : 0
            return {resulRes: resResponse, idReceta: this.id_Receta};
        } catch (error) {
            console.log(error);
            console.log("Error al obtener recetas favoritas")
            return {resulRes: 0, idReceta: this.id_Receta};
        }
    }
}

module.exports = Favorite;