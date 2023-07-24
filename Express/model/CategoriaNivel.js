//conexión con la base de datos
const {connection} = require("../config.db");

class CategoriaNivel {
 
    constructor(operacion){
        this.operacion = operacion;
    }
    async getData(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_obtenerCategoria_Dificultad`(?)', [this.operacion],
                (error, results) => {
                    if (error) reject(error);
                        console.log(results);
                        resolve(results);
                }
                );
            });
            return results;
        } catch (error) {
            console.log(error);
            console.log("Error al Obtener la Data")
        }
    }

}

module.exports = CategoriaNivel;