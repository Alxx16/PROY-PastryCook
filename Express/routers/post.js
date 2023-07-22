const {Router} = require ("express");
const router = Router();
const User = require("../model/UserActions")

//Raíz
const signUp = async (request, response) =>{
    const reqRegistro = request.body;
    const user = new User(reqRegistro);
    const registroUser = await user.registerUser();

    if(registroUser !== 0 ){
        response.status(201).json({"Registro Exitoso": registroUser})
    }else{
        response.status(400).json({"Registro No Exitoso: Nombre de Usuario Existente": registroUser})
    }
}
const login = async (request, response) => {
    const reqLogin = request.body;
    const user = new User(reqLogin);
    const {resulRes, idUsu} = await user.loginUser();

    if(resulRes !== 0 ){
        response.status(200).json({"¡Bienvenido!": idUsu})
    }else{
        response.status(400).json({"Fallo al Iniciar Sesión": idUsu})
    }
}
const editUser = async (request, response) =>{
    const reqEdit = request.body;
    const user = new User(reqEdit);
   // const resultEdit = await user.loginUser();

}
const postRecipe = async (request, response) =>{
    
}
router.post('/registro', signUp);
router.post('/login', login);

module.exports = router;