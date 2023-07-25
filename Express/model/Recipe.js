const {connection} = require("../config.db");

class Recipe {
 
    constructor({operacion, id_Usuario, id_Receta, titulo_, ingre_, 
                descrp_, img_, id_Postres, id_Dificultad, idtipoPlan_}){
        this.operacion = operacion;
        this.id_Usuario = id_Usuario;
        this.id_Receta = id_Receta;
        this.titulo_ = titulo_;
        this.ingre_ = ingre_;
        this.descrp_ = descrp_;
        this.img_ = img_;
        this.id_Postres = id_Postres;
        this.id_Dificultad = id_Dificultad;
        this.idtipoPlan_ = idtipoPlan_;
    }
    async getAllRecipe(){
        try {
            const [results] = await new Promise((resolve, reject) => {
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
            console.log("Error al obtener recetas = ", error)
        }
        return 0;
    }
    async processRecipe(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_recetas`(?,?,?,?,?,?,?,?,?,?)', 
                                [   this.operacion, this.id_Usuario, this.id_Receta,
                                    this.titulo_, this.ingre_, this.descrp_, this.img_,
                                    this.id_Postres, this.id_Dificultad, this.idtipoPlan_
                                ],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results)
                            resolve(results);
                    }
                );
            });
            return results.affectedRows;
        } catch (error) {
            console.log("Error al crear la receta", error)
            return 0;
        }
    }
    async searchRecipe(){
        try {
            const [results] = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_filtrarBusqueda`(?,?,?,?,?)', 
                                [   this.operacion, this.titulo_,this.id_Postres
                                    , this.id_Dificultad, this.idtipoPlan_
                                ],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results)
                            resolve(results);
                    }
                );
            });
            return results;
        } catch (error) {
            console.log("Error al buscar las recetas", error)
            return 0;
        }
    }
}

module.exports = Recipe;