const {connection} = require("../config.db");

class Planes{

    constructor({operacion, id_user, id_plan_, descount}){
        this.operacion = operacion,
        this.id_user = id_user,
        this.id_plan_ = id_plan_,
        this.descount = descount
    }
    async getPlanesAll(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_planes`(?,?,?,?)', 
                                [this.operacion, this.id_user, this.id_plan_, this.descount],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results);
                            resolve(results);
                    }
                );
            });
            return results
        } catch (error) {
            console.log("Error al Obtener la Data: ",error)
        }
    }
    async subsPlanUser(){
        try {
            
        } catch (error) {
            
        }
    }
}

module.exports = Planes;

