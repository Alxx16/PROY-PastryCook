const {Router} = require ("express");
const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
dotenv.config({path: '.env'});
const router = Router();
const {getApi} = require("./API/get");
const {postApi} = require("./API/post")
const {putApi} = require("./API/put")
const {deleteApi} = require("./API/delete")


//Middelware
const middelware = (req, res, next) => {
    const token = req.headers.authorization;
    try {
        jwt.verify(token, process.env.JWT_KEY) 
        next()
    } catch (error) {
        return res.status(500).json({msj: "TOKEN INVÁLIDO"})
    }
}

//APIS PETICIÓN GET--------
router.get('/perfil', middelware, getApi.getUser);
router.get('/all-recetas', getApi.seeDataRecipe);

//APIS PETICIÓN POST--------
router.post('/registro', postApi.signUp);
router.post('/login', postApi.login);
router.post('/agregarFavorito', postApi.postFavorite);

//APIS PETICIÓN PUT--------
router.put('/actualizar-perfil', putApi.editUser)

//APIS PETICIÓN DELETE--------
router.delete('/eliminarFavorito', deleteApi.deleteFavorite);




module.exports = router;