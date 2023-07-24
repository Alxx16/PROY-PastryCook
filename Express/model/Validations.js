const bcrypt = require("bcryptjs");

module.exports = {
    Validate : {
        async encryptPassword(password){
            const rondasSal = 10;
            const passEncry = await bcrypt.hash(password, rondasSal);
            return passEncry;
        },
        async validarPassword(password, passwordEncrypt){
            const passVali = await bcrypt.compare(password, passwordEncrypt);
            return passVali;
        },
        validateEmail(email){
           const validEmail =  /^\w+([.-_+]?\w+)*@\w+([.-]?\w+)*(\.\w{2,10})+$/;
           const respEmail =  validEmail.test(email) ? 1 : 0;
           return respEmail;
        }
    }



}