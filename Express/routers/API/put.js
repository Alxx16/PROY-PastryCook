const User = require("../../model/User")

//Raíz
module.exports = {
    putApi : {
        async editUser (request, response) {
            let reqEdit = JSON.parse(request.body.data);
            reqEdit["operacion"] = '';
            reqEdit["icono"] = request.file.destination.split("/")[1] +'/'+ request.file.filename
            console.log(request.file.destination.split("/"));
            console.log(reqEdit)
            const user = new User(reqEdit);
            const resultEdit = await user.updateDataUser();

            if(resultEdit !== 0 ){
                response.status(201).json({msj: "Datos Actualizados", affected: resultEdit})
            }else{
                response.status(400).json({msj: "Error al Actualizar los Datos", affected: resultEdit})
            }
        }
    }
}


