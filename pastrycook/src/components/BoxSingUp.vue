<template>
    <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <!-- class="sm:mx-auto sm:w-full sm:max-w-sm"-->
        <div> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 mb-8">Registrate</h3>
            <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
        </div>
        
        <div class="mt-10 md:mx-auto md:w-full md:max-w-md">
            <form v-on:submit.prevent="singUp" class="space-y-6 w-full p-10 rounded-md border-0 ring-gray-300 ring-1 ring-inset bg-white shadow-md " action="" method="POST">
                    <div>
                        <label for="name" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Nombre Completo</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/usuario.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input v-model="name" id="name" name="name" required="required" type="text" placeholder="Introduce nombre completo" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div>
                        <label for="user" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Usuario</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/usuario.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input v-model="user" id="user" name="user" required="required" type="text" placeholder="Introduce usuario" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                    
                    <div>
                        <label for="email" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Correo Electrónico</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/correo.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input  v-model="email" id="email" name="email" required="required" type="email" placeholder="Introduce correo electrónico" class="block w-full rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div>

                        <label for="password" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Contraseña</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/bloquear.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input v-model="pass" id="password" name="password" required="required" type="password" placeholder="Introduce contraseña" class="block w-full rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <!-- <router-link to="/login" type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Iniciar Sesión</router-link> -->
                        <button type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Registrarse</button>
                    </div>
            </form>
        </div>  
    </div>
</template>
  
  
  
<script>

import {post} from '../utils';

export default {

    data: function(){
        return{
            name: "",
            user: "",
            email: "",
            pass: ""
        }
    },
    methods: {
        async singUp(){
            const jsonData = {
                "operacion": "R", 
                "idUsuario": 0, 
                "nameUser": this.user, 
                "correo": this.email , 
                "contrasena": this.pass, 
                "nombreUsuario": this.name
            }
            
            console.log(jsonData);

            try {
            const response = await post(`http://localhost:3001/registro`, jsonData);
            console.log(response); 

            } catch (error) {
                console.error(error);
            }
        }
    }


}
  
</script>