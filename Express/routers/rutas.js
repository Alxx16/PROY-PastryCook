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
router.get('/categorias', getApi.getCategNivel)
router.get('/planes', getApi.getPlanes)
router.get('/planesUsuario', middelware, getApi.getPlanes)

//APIS PETICIÓN POST--------
router.post('/registro', postApi.signUp); //no lleva midl
router.post('/login', postApi.login); // no lleva midl
router.post('/agregarFavorito', middelware, postApi.postFavorite);

//APIS PETICIÓN PUT--------
router.put('/actualizar-perfil', [middelware, upload.single('foto')], putApi.editUser) //buscar como hacer el put

//APIS PETICIÓN DELETE--------
router.delete('/eliminarFavorito', middelware, deleteApi.deleteFavorite); 

//



module.exports = router;