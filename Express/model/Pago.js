const {connection} = require("../config.db");

class Pago{

    async getTipoPago(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_planes`(?,?,?,?)', 
                                ['F', 0, 0, 0],
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
    async postPago(){ //Para hacer el pago por paypal
        try {
            
        } catch (error) {
            
        }
    }
}

module.exports = Pago;