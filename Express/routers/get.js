const {Router} = require ("express");
const router = Router();
const User = require("../model/UserActions")

//Raíz
const getUser = async (request, response) => {
    const reqGetU = {operacion: 'T', idUsuario: request.query.id, nameUser: ' ',
                    correo: ' ', contrasena: ' ', nombreUsuario: ' ', icono: ' '};
    console.log(reqGetU);
    const user = new User(reqGetU);
    const resultsData = await user.getDataUser();
    response.status(200).json(resultsData)
}
const seeRecipe = async (request, response) =>{

}
const seeRecipeDetails = async (request, response) =>{
    
}

router.get('/perfil', getUser);

module.exports = router;