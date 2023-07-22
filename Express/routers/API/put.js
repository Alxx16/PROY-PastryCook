const User = require("../../model/User")

//Raíz
module.exports = {
    putApi : {
        async editUser (request, response) {
            const reqEdit = request.body;
            const user = new User(reqEdit);
            const resultEdit = await user.updateDataUser();

            if(resultEdit !== 0 ){
                response.status(201).json({"Datos Actualizados": resultEdit})
            }else{
                response.status(400).json({"Error al Actualizar los Datos": resultEdit})
            }
        }
    }
}


