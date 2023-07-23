<template>
    <div class="flex min-h-full flex-1 flex-col justify-center pb-3 padding-top: 0px;">
        <div> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 mb-8">Iniciar Sesión</h3>
            
            <div v-if="showAlertGood" class="bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md" role="alert">
                <div class="flex text-left">
                    <div class="py-1 mx-9">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 text-teal-500">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <div>
                        <p class="font-bold">¡Exito!</p>
                        <p class="text-sm">{{ msj }}</p>
                    </div>
                </div>               
            </div>


            <div v-else-if="showAlertBad" class="bg-red-100 border-t-4 border-red-500 rounded-b text-red-900 px-4 py-3 shadow-md" role="alert">
                <div class="flex text-left">
                    <div class="py-1 mx-9">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8 text-red-500">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <div>
                        <p class="font-bold">¡Error!</p>
                        <p class="text-sm">{{ msj }}</p>
                    </div>
                </div>               
            </div>

            
            <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
        </div>
    
    <div class="flex min-h-full flex-1 flex-col justify-center">
     
        <div class="mt-1 md:mx-auto md:w-full md:max-w-md">
            <form v-on:submit.prevent="login" class="space-y-6 w-full p-10 rounded-md border-0 ring-gray-300 ring-1 ring-inset bg-white shadow-md " action="" method="POST">
                    <div>
                        <label for="user" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Usuario</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/correo.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input v-model="user" id="user" name="user" required="required" type="text" placeholder="Introduce nombre" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div>

                        <label for="password" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Contraseña</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/bloquear.png" class=" h-13 w-12 mx-0 inline" alt=""></span>
                            <input v-model="pass" id="password" name="password" required="required" autocomplete="current-password" type="password" placeholder="Introduce contraseña" class="block w-full rounded-md border-0 py-1.5 text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                    <div class="flex justify-cenBOXter">
                        <!-- <router-link to="/inicio" type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Iniciar Sesión</router-link> -->
                        <button type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 m-auto px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Iniciar Sesión</button>
                    </div>

                    <p class="mt-10 text-center text-sm text-gray-500">
                        ¿No tienes una cuenta?
                        <router-link to="/SingUp" class="font-semibold leading-6 text-indigo-600 hover:text-indigo-500">Registrate aquí</router-link>
                    </p>
            </form>
        </div>  

    </div>
</div>
</template>


<script>
import {post} from '../utils';
import { mapActions } from 'vuex';

export default {

    data: () => {
        return{
            user: "",
            pass: "",
            showAlertGood: false,
            showAlertBad: false

        }
    },
    methods: {
        ...mapActions(['addId', 'addToken']),

        async login(){
            const jsonData = {
                "operacion": "I", 
                "idUsuario": 0, 
                "nameUser": this.user, 
                "contrasena": this.pass
            }
            console.log(jsonData);

            try {
                const {id, msj, token, estado} = await post(`http://localhost:3000/login`, jsonData);
                this.msj = msj;

                console.log(estado)
                if(estado == 1){
                    this.addId(id);
                    this.addToken(token);

                    this.showAlertGood = true
                    this.$router.push('/inicio');
                }else{
                    this.showAlertBad = true
                } 
            } catch (error) {
                console.error(error);
            }
        }
    }
}
</script>