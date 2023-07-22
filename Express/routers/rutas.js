const {Router} = require ("express");
const router = Router();
const {getApi} = require("./API/get");
const {postApi} = require("./API/post")
const {putApi} = require("./API/put")
const {deleteApi} = require("./API/delete")

//APIS PETICIÓN GET--------
router.get('/perfil', getApi.getUser);
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