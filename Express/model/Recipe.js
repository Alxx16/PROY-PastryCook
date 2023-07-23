const {connection} = require("../config.db");

class Recipe {
 
    constructor({operacion, id_Usuario, id_Receta}){
        this.operacion = operacion;
        this.id_Usuario = id_Usuario;
        this.id_Receta = id_Receta;
    }
    async getAllRecipe(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_mostrar_recetas`(?,?,?)', 
                                [this.operacion, this.id_Usuario, this.id_Receta],
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
            console.log("Error al obtener recetas")
        }
        return 0;
    }
}

module.exports = Recipe;