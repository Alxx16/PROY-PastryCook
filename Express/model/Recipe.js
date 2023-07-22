const {connection} = require("../config.db");

class Recipe {
 
    constructor({operacion}){
        this.operacion = operacion;

    }
    async getTargetRecipe(){
        try {
            const results = await new Promise((resolve, reject) => {
                connection.query('CALL `sp`(?)', 
                                [this.operacion],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results)
                            resolve(results);
                    }
                );
            });
            return 0;
        } catch (error) {
            console.log(error);
            console.log("Error")
        }
        return 0;
    }
}