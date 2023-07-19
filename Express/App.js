const express = require ("express");
const morgan = require("morgan");
const dotenv = require("dotenv");
const app = express();
dotenv.config({path: '.env'});

app.use(morgan('dev'));
//nos ayuda a analizar el cuerpo de la solicitud POST
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(require('./routers/post.js'));


const server = app.listen(process.env.PORT, (error) => {
    if (error) return console.log(`Error: ${error}`);
    console.log(`Servidor iniciado en el puerto ${server.address().port}`);
});