const {Router} = require ("express");
const router = Router();
const User = require("../model/UserActions")

//Raíz
const registro = (request, response) =>{
    const reqRegistro = request.body;
    const user = new User(reqRegistro);
    user.registerUser();
}
router.post('/registro', registro);


module.exports = router;