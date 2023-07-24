const {connection} = require("../config.db");

class Planes{

    constructor({operacion, id_user, id_plan_, total}){
        this.operacion = operacion,
        this.id_user = id_user,
        this.id_plan_ = id_plan_,
        this.total = total
    }
    async getPlanesAll(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_planes`(?,?,?,?)', 
                                [this.operacion, this.id_user, this.id_plan_, this.total],
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
    async detailsPlan(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_planes`(?,?,?,?)', 
                                ['E', 0, this.id_plan_, 0],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results);
                            resolve(results);
                    }
                );
            });
            return results
        } catch (error) {
            
        }
    }
    async subsPlanUser(){
        try {
            
        } catch (error) {
            
        }
    }
}

module.exports = Planes;

