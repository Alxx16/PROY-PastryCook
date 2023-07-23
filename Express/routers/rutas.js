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
router.get('/all-recetas', middelware, getApi.getDataRecipe);
router.get("/categorias", getApi.getCategNivel)

//APIS PETICIÓN POST--------
router.post('/registro', postApi.signUp); //no lleva midl
router.post('/login', postApi.login); // no lleva midl
router.post('/agregarFavorito', middelware, postApi.postFavorite);

//APIS PETICIÓN PUT--------
router.put('/actualizar-perfil', middelware, putApi.editUser)

//APIS PETICIÓN DELETE--------
router.delete('/eliminarFavorito', middelware, deleteApi.deleteFavorite);




module.exports = router;