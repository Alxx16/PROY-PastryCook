const dotenv = require("dotenv");
dotenv.config({path: '.env'});

const mysql = require('mysql2');
let connection;

try{
    connection = mysql.createConnection({
        host: process.env.DBHOST,
        user: process.env.DBUSER,
        password: process.env.DBPASS,
        database: process.env.DBNAME
    });
}catch (error){
    console.log("Error en la conexión a la base de datos");
}
module.exports = {connection};