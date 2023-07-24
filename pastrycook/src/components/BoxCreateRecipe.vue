<template>
    <div>
        <input v-model="titulo">
        <div>
            <div class="flex items-center mb-4">
                <input v-model="tipo" id="country-option-1" type="radio" name="countries" value="USA" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600" checked>
                <label for="country-option-1" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                Gratis
                </label>
            </div>

            <div class="flex items-center mb-4">
                <input v-model="tipo" id="country-option-2" type="radio" name="countries" value="Germany" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300 dark:focus:ring-blue-600 dark:focus:bg-blue-600 dark:bg-gray-700 dark:border-gray-600">
                <label for="country-option-2" class="block ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">
                Premium
                </label>
            </div>
        </div>
        <input v-model="ingrediente">
        <textarea v-model="descripcion"></textarea>
        <input @change="selectFile" class="block w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 dark:text-gray-400 focus:outline-none dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400" aria-describedby="user_avatar_help" type="file">
        <label v-mode="autor"></label>
        <select v-model="categoria">
            <option v-for="cat in categorias" :key="cat.id_P" :value="cat.id_P">{{ cat.postre }}</option>
        </select>
        <input v-model="nivel">
        <input v-model="fecha">

        <button @click.prevent="createReceipe">Guardar</button>

    </div>
</template>

<script>
import { mapGetters } from "vuex";
import {get} from '../utils';

export default {

    computed: {
        ...mapGetters(["token", "id", "type_account"]),
        },

    data: () => {
        return {
            titulo: '',
            tipo: '',
            ingrediente: '',
            descripcion: '',
            autor: '',
            cate : '',
            nivel: [],
            listCategoria: [],
            planes: []
            

        }
    },
    async created() {
        const response = await get('http://localhost:3000/categorias?op=C');
        //this.categorias = Array.from(response);
        /*const tipo = await get('http://localhost:3000/categorias?op=D');
        const planes = await get('http://localhost:3000/planes?op=C&idU=0&idP=0&desc=0');*/

        /*this.listCategoria = response;
        this.planes = planes;
        this.nivel = tipo;*/

        console.log(response);
    
    },
    method: {
        selectFile(event){
            this.fileValue = event.target.files[0]
        },

        async createReceipe() {

        console.log(this.categorias, this.planes, this.nivel);
            const jsonData = {
                "operacion": "A", 
                "id_Usuario": this.id,
                "id_Receta": 0,
                "titulo_": this.titulo, 
                "ingre_": this.ingrediente, 
                "descrp_": this.descripcion, 
                //"id_Postres": categoria.id_P, //categoria
                //"id_Dificultad": tipo.id, //tipoDificultad
                "idtipoPlan_": this.type_account 
            }
            console.log(jsonData);
           /* const formData = new FormData();
            formData.append('data', JSON.stringify(jsonData))

            formData.append('foto', this.fileValue)

            const response = await fetch(`http://localhost:3000/recipe/${this.id}`, {
                method: "POST",
                body: formData,
                headers: {
                    "Content-type": "application/json; charset=UTF-8",
                    'authorization': this.token
                },
            });
            console.log(response);*/
        }
    }
}
//EN TEORIA DEBERIA FUNCIONARRRRRR, FALTA PONER LOS DATOSSSSSSSSSSSS

</script>