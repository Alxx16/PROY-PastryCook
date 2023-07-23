//conexión con la base de datos
const {connection} = require("../config.db");
const {Validate} = require("./Validations");

class User {
 
    constructor({operacion, idUsuario, nameUser, correo, contrasena, nombreUsuario, icono, telef}){
        this.operacion = operacion;
        this.idUsuario = idUsuario;
        this.nameUser = nameUser;
        this.correo = correo;
        this.contrasena = contrasena;
        this.nombreUsuario = nombreUsuario;
        this.icono = icono;
        this.telef = telef;
    }
    async registerUser(){
        try {
            const emailV = await Validate.validateEmail(this.correo);
            if(emailV){
                const encryPass = await Validate.encryptPassword(this.contrasena);
                const results = await new Promise((resolve, reject) => {
                    connection.query('CALL `sp_procesos_usuario`(?,?,?,?,?,?)', 
                                    [this.operacion, this.idUsuario, this.nameUser, this.correo, 
                                        encryPass, this.nombreUsuario],
                        (error, results) => {
                            if (error) reject(error);
                                console.log(results)
                                resolve(results);
                        }
                    );
                });
            
            return results.affectedRows;
            }else{
                return 0;
            }
        } catch (error) {
            console.log(error);
            console.log("Error al registrar al Usuario")
        }
        return 0;
    }
    async loginUser(){
        try {
            const [[results]] = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_usuario`(?,?,?,?,?,?)', 
                                [this.operacion, this.idUsuario, this.nameUser, this.correo, 
                                this.contrasena, this.nombreUsuario],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results);
                            resolve(results);
                    }
                );
            });
            //validaciones
            const resResponse = results ? 1 : 0
            const passwordEncr = (resResponse == 1) ? results['contraseña'] : " "
            const idUsu = (resResponse == 1) ? results['id_U'] : 0
            const idPlan = (resResponse == 1) ? results['id_plan'] : 0
            const validacion = await Validate.validarPassword(this.contrasena, passwordEncr);
            const valiResponse = validacion ? 1 : 0

            return {resulRes: valiResponse, idUsu: idUsu, idPlan: idPlan};
        } catch (error) {
            console.log(error);
            console.log("Error al Iniciar Sesión")
        }
    }
    async getDataUser(){
        try {
            const [[results]] = await new Promise((resolve, reject) => {
                connection.query('CALL `sp_procesos_usuario`(?,?,?,?,?,?)', 
                                [this.operacion, this.idUsuario, this.nameUser, this.correo, 
                                this.contrasena, this.nombreUsuario],
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
    async updateDataUser(){
        try {
            const emailV = await Validate.validateEmail(this.correo);
            if(emailV){
                const encryPass = await Validate.encryptPassword(this.contrasena);
                const passEdit = (this.contrasena !== " ") ? encryPass : " "
                
                const results = await new Promise((resolve, reject) => {
                    connection.query('CALL `sp_editarUsuario`(?,?,?,?,?,?,?)', 
                                    [this.idUsuario, this.nameUser, this.correo, passEdit, 
                                     this.telef, this.icono, this.nombreUsuario],
                    (error, results) => {
                        if (error) reject(error);
                            console.log(results)
                            resolve(results);
                    }
                    );
                });
                return results.affectedRows;
            }else{
                return 0;
            }
        } catch (error) {
            
        }
    }
}

module.exports = User;