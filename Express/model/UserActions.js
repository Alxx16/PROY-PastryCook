//conexión con la base de datos
const {connection} = require("../config.db");

class User {
 
    constructor({operacion, idUsuario, nameUser, correo, contrasena, nombreUsuario}){
        this.operacion = operacion;
        this.idUsuario = idUsuario;
        this.nameUser = nameUser;
        this.correo = correo;
        this.contrasena = contrasena;
        this.nombreUsuario = nombreUsuario;
    }
    registerUser(){
        let responseRegistro;
        try {
            responseRegistro = connection.query('CALL `sp_procesos_usuario`(?,?,?,?,?,?)', [this.operacion, this.idUsuario
                , this.nameUser, this.correo, this.contrasena, this.nombreUsuario],
            (error, results) => {
                if(error)
                    throw error;
                    console.log("Error = ",results)
            });
        } catch (error) {
            console.log(error);
            console.log("Error al registrar al Usuario")
        }
        return responseRegistro;
    }
    loginUser(){
        try {
            
        } catch (error) {
            
        }
    }
}

module.exports = User;