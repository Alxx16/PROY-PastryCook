const express = require ("express");
const morgan = require("morgan");
const dotenv = require("dotenv");
const app = express();
dotenv.config({path: '.env'});

app.use(morgan('dev'));
//nos ayuda a analizar el cuerpo de la solicitud POST
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Authorization, Content-Type');
    next();
  });

app.use(require('./routers/rutas'));

const server = app.listen(process.env.PORT, (error) => {
    if (error) return console.log(`Error: ${error}`);
    console.log(`Servidor iniciado en el puerto ${server.address().port}`);
});