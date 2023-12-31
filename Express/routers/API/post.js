const User = require("../../model/User")
const Favorite = require("../../model/Favorite")
const Recipe = require("../../model/Recipe")
const { createOrder } = require('../../model/Paypal');
const dotenv = require("dotenv");
dotenv.config({path: '.env'});
const jwt = require("jsonwebtoken");

//Raíz
module.exports = {
    postApi : {
        async signUp (request, response) {
            const reqRegistro = request.body;
            const user = new User(reqRegistro);
            const registroUser = await user.registerUser();

            if(registroUser !== 0 ){
                response.status(201).json({msj: "Registro Exitoso", affected: registroUser})
            }else{
                response.status(400).json({msj: "Registro No Exitoso: Nombre de Usuario Existente", affected: registroUser})
            }
        },
        async login (request, response) {
            const reqLogin = request.body;
            const user = new User(reqLogin);
            const {resulRes, idUsu, idPlan} = await user.loginUser();
            
            if(resulRes !== 0 ){
                const token = jwt.sign(reqLogin, process.env.JWT_KEY)
                response.status(200).json({msj: "¡Bienvenido!", id: idUsu, token: token, idPlan: idPlan,estado: resulRes})
            }else{
                response.status(400).json({msj: "Fallo al Iniciar Sesión", id: idUsu, idPlan: idPlan, estado: resulRes})
            }
        },
        async postRecipe (request, response) {
            const reqAdd = request.body;
           // reqAdd["operacion"] = ' ';
           // reqAdd["icono"] = request.file.destination.split("/")[1] +'/'+ request.file.filename
            const recipe = new Recipe(reqAdd);
            const [results] = await recipe.processRecipe();

            if(results !== 0){
                response.status(200).json({msj: "Receta Creada", estado: results})
            }else{
                response.status(400).json({msj: "Fallo al publicar la receta", estado: results} )
            }
        },
        async postFavorite (request, response) {
            const reqFav = request.body;
            const recetaFav = new Favorite(reqFav);
            const {resulRes, idReceta} = await recetaFav.getProcessFavorite();
  
            if(resulRes !== 0){
                response.status(200).json({msj: "Añadido a Favoritos", idR: idReceta, estado: resulRes})
            }else{
                response.status(400).json({msj: "Fallo al Añadir a Favoritos", idR: idReceta, estado: resulRes} )
            }
        },
        async postPaypal(request, response) {
            const order = await createOrder();
            if(order){
                response.status(200).json(order);
            }else{
                response.status(400).json({msj: "Fallo al Realizar el Pago"} )
            }  
        }
          
    }   
}


