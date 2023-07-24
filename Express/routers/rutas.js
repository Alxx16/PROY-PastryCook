const {Router} = require ("express");
const jwt = require("jsonwebtoken");
const dotenv = require("dotenv");
dotenv.config({path: '.env'});
const router = Router();
const {getApi} = require("./API/get");
const {postApi} = require("./API/post")
const {putApi} = require("./API/put")
const {deleteApi} = require("./API/delete")
const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/img'); // Reemplaza 'ruta_de_la_carpeta' por la ruta donde deseas guardar las imágenes
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
        const fileExtension = path.extname(file.originalname);
        cb(null, file.fieldname + '-' + uniqueSuffix + fileExtension);
    }
  });
  const upload = multer({ storage: storage });
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
router.get('/categorias', getApi.getCategNivel)//no lleva midl
router.get('/planes', getApi.getPlanes)//no lleva midl
router.get('/planesUsuario', middelware, getApi.getPlanes)
router.get('/busquedaRecetas', middelware, getApi.getSearchRecipe);
router.get('/detallesPlan', getApi.getDatailPlan)//no lleva midl
router.get('/tipo-pago', getApi.getPagosTipo)//no lleva midl
//APIS PETICIÓN POST--------
router.post('/registro', postApi.signUp); //no lleva midl
router.post('/login', postApi.login); // no lleva midl
router.post('/agregarFavorito', middelware, postApi.postFavorite);
router.post('/crearReceta', [middelware, upload.single('foto')], postApi.postRecipe); //almac de img
router.post('/payment/create', middelware, postApi.postPaypal)
//APIS PETICIÓN PUT--------
router.put('/actualizar-perfil', [middelware, upload.single('foto')], putApi.editUser) //almac de img
router.put('/editarReceta', [middelware, upload.single('foto')], putApi.editRecipe); //almac de img
router.put('/actualizarPlan', middelware, putApi.actPlanUsu); 
//APIS PETICIÓN DELETE--------
router.delete('/eliminarFavorito', middelware, deleteApi.deleteFavorite); 
router.delete('/eliminarReceta', middelware, deleteApi.deleteRecipe); 

module.exports = router;