const {Router} = require ("express");
const router = Router();

//Raíz
router.get('/', (request, response) =>{
    response.send("Enrutamiento listo")
})


module.exports = router;