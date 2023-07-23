(() => {
    const {post} = require("./utils.js")
    const App = {
      init: () => {
        App.methods.singUP();
      },
      methods: {
        async singUP (){
        },

        async logIn(){

            const jsonData = {
                "operacion": "I", 
                "idUsuario": 0, 
                "nameUser": "Iam", 
                "contrasena": "123"
            }

            const data  = await post(`http://localhost:3000/login`, jsonData);

            console.log(data);

        }
        
      },
    };
    App.init();
  })();