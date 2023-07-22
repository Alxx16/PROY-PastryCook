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
            return results;
        } catch (error) {
            console.log(error);
            console.log("Error al obtener recetas favoritas")
        }
        return 0;
    }
}

module.exports = Favorite;