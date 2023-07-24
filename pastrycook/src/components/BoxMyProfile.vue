<template>
        <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <div class="mt-0"> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-sans font-light mb-8">Mi Perfil</h3>
            
        </div>
    
    <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <!-- class="sm:mx-auto sm:w-full sm:max-w-sm"-->
    
        <!-- md:mx-auto md:w-full md:max-w-md -->
        <div class="mt-10 w-5/6 md:mx-auto">
            <form  class="space-y-6 w-full p-8 rounded-md border-0 ring-gray-300 ring-1 ring-inset bg-white shadow-md " action="" method="PUT">
                <div class="grid grid-cols-2 gap-9">

                    <!-- DIV 1 -->

                    <div class="group relative">
                        <div class="my-6">
                            <label for="name" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Nombre Completo</label>
                            <div class="mt-2 flex">
                                <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/usuario.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                                <input v-model="name" id="name" name="name" required="required" type="text" placeholder="Introduce nombre completo" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="my-6">
                            <label for="user" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Usuario</label>
                            <div class="mt-2 flex">
                                <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/usuario.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                                <input v-model="user" id="user" name="user" required="required" type="text" placeholder="Introduce usuario" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>
                        
                        <div class="my-6">
                            <label for="email" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Correo Electrónico</label>
                            <div class="mt-2 flex">
                                <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/correo.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                                <input  v-model="email" id="email" name="email" required="required" type="email" placeholder="Introduce correo electrónico" class="block w-full rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="my-6">
                            <label for="password" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Contraseña</label>
                            <div class="mt-2 flex">
                                <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/bloquear.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                                <input v-model="pass" id="password" name="password" required="required" type="password" placeholder="Introduce contraseña" class="block w-full rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                    </div>

                    <!-- DIV 2 -->
                    <div class="group relative" >

                        <div class="my-6 mx-32">
                            <img  class="mx-auto h-64 w-auto bg-pink-300  " :src="icon" alt="ImgProfile" />
                            <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white" for="user_avatar">Upload file</label>
                            <input @change="selectFile" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" type="file">
                            <div class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="user_avatar_help">A profile picture is useful to confirm your are logged into your account</div>

                        </div>

                        <div class="my-6">
                            <label for="phone" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Telefono</label>
                            <div class="mt-2 flex">
                                <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/bloquear.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                                <input v-model="phone" id="phone" name="phone" required="required" type="tel" placeholder="Ingrese el numero de celular" class="block w-full rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>

                        <div class="flex justify-center">
                            <!-- <router-link to="/login" type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Iniciar Sesión</router-link> -->
                            <button  @click.prevent="updateInfo" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Guardar</button>
                            <button type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Cerrar</button>
                        </div>
                    </div>
                </div>
                    
            </form>
        </div>  
    </div>
</div>
</template>
  
  
  
<script>

import {put, get} from '../utils';
import { mapGetters } from "vuex";

export default {
    computed: {
    ...mapGetters(["id", "token"])
  },
    data: () => {
        return{
            name: "",
            user: "",
            email: "",
            pass: "",
            icon: "",
            phone: "",
            fileValue: null
        }
    },
    async created(){
        try{
                const {icono, email, id_U, nombreCompleto, telefono, username} = await get(`http://localhost:3000/perfil?id=${this.id}`, 
                {
                    method: 'GET',
                    headers: {
                        'authorization': this.token
                    }
                })
                this.id = id_U
                this.name = nombreCompleto;
                this.user =  username;
                this.email = email;
                this.phone = telefono;
                // this.pass = contrasena;
                this.icon = 'http://localhost:3000/'+ icono;

                console.log(this.id, this.name, this.user,  this.email, this.phone)

        }catch(error){
            console.log(error);
        }

    },
    methods: {
        // async showInfo(){
            
            
        // },
        selectFile(event){
            this.fileValue = event.target.files[0]
        },

        async updateInfo(){
            try {
                const jsonData = {
                    "idUsuario": this.id,
                    "nameUser": this.user, 
                    "correo": this.email, 
                    "contrasena": this.pass, 
                    "nombreUsuario": this.name,
                    "telef": this.phone 
                }
                
                const formData = new FormData();
                formData.append('data', JSON.stringify(jsonData))

                formData.append('foto', this.fileValue)

                const {msj, affected} = await put(`http://localhost:3000/actualizar-perfil`, formData, this.token);
                console.log(msj, affected); 

            } catch (error) {
                console.error(error);
            }
        }
    }


}
</script>