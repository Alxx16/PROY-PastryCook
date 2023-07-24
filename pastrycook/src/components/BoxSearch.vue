<template>
    <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <div class="mt-0"> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-sans font-light mb-8">Mi Perfil</h3>
            
        </div>

        <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
            <h2> ¡Busca Tus Postres Favoritos Aquí!</h2>
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
data: function(){
    return{
        name: "",
        user: "",
        email: "",
        pass: "",
        icon: "",
        phone: "",
    }
},
methods: {
    async showInfo(){
        try{
            const {email, icono, id_U, nombreCompleto, telefono, username} = await get(`http://localhost:3000/perfil?id=${this.id}`, 
            {
                method: 'GET',
                headers: {
                    'authorization': this.token
                }
            })
            this.id = id_U
            this.name = username;
            this.user = nombreCompleto;
            this.email = email;
            this.phone = telefono;
            //  this.pass = contrasena;
            this.icon = icono;

        }catch(error){
            console.log(error);
        }
        
    },

    async updateInfo(){
        try {
            const jsonData = {
                "idUsuario": this.id,
                "nameUser": this.user, 
                "correo": this.email, 
                "contrasena": this.pass, 
                "nombreUsuario": this.name,
                "icono": this.icon,
                "telef": this.phone 
            }
            
            const {msj, affected} = await put(`http://localhost:3000/actualizar-perfil`, jsonData);
            console.log(msj, affected); 

        } catch (error) {
            console.error(error);
        }
    }
}


}
</script>