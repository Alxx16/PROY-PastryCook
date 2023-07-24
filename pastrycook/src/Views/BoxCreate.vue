<template>
 
  <div class="flex min-h-full relative flex-1 flex-col items-center justify-center ">
    <!-- Barra superior -->
    
      <div class="mt-0 w-full "> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-bold leading-9 tracking-tight  mb-8">Crea tu Receta</h3>
            <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
        </div>
    
    <!--form de Crear Recetas-->
    <div class="relative flex min-h-full flex-1 flex-col items-center justify-center">
  <!-- Barra superior -->
  <div></div>

  <!--form de Crear Recetas-->

  <form class="w-25 space-y-6 rounded-md border-0 bg-violet-100 p-10 shadow-md ring-1 ring-inset ring-gray-300">

    <!-- Radio button -->
    <div class="mb-6">
      <fieldset class="mr-2 flex">
        <legend class="sr-only">Tipo de Receta</legend>
        <div v-for="plan in listPlanes" :key="plan.id_tipoPlan" class="mb-4 flex">
          <input v-model="tipoPlanSeleccionado"
                    :id="`plan-option-${plan.id_tipoPlan}`"
                    type="radio"
                    :name="`planes`"
                    :value="plan.id_tipoPlan" class="focus:ring:blue-300 dark:focus-ring-blue-600 h-6 w-4 border-gray-300 focus:ring-2 dark:border-gray-600 dark:bg-gray-700" />
          <label :for="`plan-option-${plan.id_tipoPlan}`" class="ml-2 block text-sm font-medium text-gray-900 dark:text-gray-300">  {{ plan.nombre_tipo }} </label>
        </div>
      </fieldset>
    </div>
    
    <!--fin boton Radio button-->

       <!--Form de Crear-->
    <div class="-mx-3 mb-6 flex flex-col">
      <div class="group relative z-0 mb-6 w-full">
        <input v-model="titulo" type="text" name="NameReceta" id="NameReceta" class="peer block w-full appearance-none border-0 border-b-2 border-gray-300 bg-transparent px-0 py-2.5 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0 dark:border-gray-600 dark:text-white dark:focus:border-blue-500" placeholder=" " required />
        <label for="NameReceta" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-500 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600 dark:text-gray-400 peer-focus:dark:text-blue-500">Nombre de la receta</label>
      </div>

      <div class="-mx-3 mb-6 flex flex-wrap">
        <div class="w-full px-3">
          <label for="message" class="font-large mb-2 block text-sm font-semibold text-gray-900 dark:text-white">Ingredientes</label>
          <textarea v-model="ingredientes" id="message" rows="4" class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm font-semibold text-gray-900 focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Sabemos que será delicioso"></textarea>
        </div>
        <div class="group relative z-0 mb-6 mt-3 w-full">
            <input type="text" name="Descrip" id="Descrip" class="peer block w-full appearance-none border-0 border-b-2 border-gray-300 bg-transparent px-0 py-2.5 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0 dark:border-gray-600 dark:text-white dark:focus:border-blue-500" placeholder=" " required />
            <label for="Descip" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-500 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600 dark:text-gray-400 peer-focus:dark:text-blue-500">Danos un descripción Breve</label>
          </div>
      </div>
      <div class="-mx-3 mb-6 flex flex-wrap">
        <div class="w-full px-3">
          <label for="descripcion" class="font-large mb-2 block text-sm font-semibold text-gray-900 dark:text-white">Descripcion</label>
          <textarea v-model="descripcion" id="descripcion" rows="3" class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm font-semibold text-gray-900 focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Sabemos que será delicioso"></textarea>
        </div>
      </div>

      <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sube una foto de tu creación</label>
      <input @change="selectFile" class="block w-full cursor-pointer rounded-lg border border-gray-300 bg-gray-50 text-sm text-gray-900 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-gray-400 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file" />
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG or GIF (MAX. 800x400px).</p>
    </div>

    <div class="-mx-3 mb-2 flex flex-wrap">
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700" for="grid-level"> Nivel de dificultad </label>
        <div class="relative">
          <select v-model="nivel" class="block w-full appearance-none rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700 focus:border-gray-500 focus:bg-white focus:outline-none" id="grid-state">
            <option v-for="nivel in listNivel" :key="nivel.id_D" :value="nivel.id_D">{{ nivel.tipoDificultad }}</option>
          </select>
          <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
            <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
          </div>
        </div>
      </div>
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700" for="grid-level"> Categoria </label>
        <div class="relative">
          <select v-model="categoria" class="block w-full appearance-none rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700 focus:border-gray-500 focus:bg-white focus:outline-none" id="grid-state">
            <option v-for="cat in listCategoria" :key="cat.id_P" :value="cat.id_P">{{ cat.postre }}</option>
          </select>
          <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
            <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
          </div>
        </div>
      </div>
      <div class="mb-0 ml-4 flex flex-col">
        <div id="Avatar_user" role="tooltip" class="tooltip invisible absolute z-10 inline-block rounded-lg bg-gray-900 px-3 py-2 text-sm font-medium text-white opacity-0 shadow-sm transition-opacity duration-300 dark:bg-gray-700">
          Tu avatar
          <div class="tooltip-arrow" data-popper-arrow></div>
        </div>
        <img data-tooltip-target="tooltip-jese" class="h-12 w-12 rounded" src="/docs/images/people/profile-picture-5.jpg" alt="Avatar" />
      </div>
      <div>
        <button @click.prevent="createReceipe" type="submit" class="dark:bg-rose ml-2 mt-10 w-full rounded-lg bg-amber-300 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:hover:bg-blue-700 dark:focus:ring-blue-800 sm:w-auto">Cargar Receta</button>
        <button type="submit" class="ml-2 mt-10 w-full rounded-lg bg-rose-200 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 sm:w-auto">Cancelar</button>
      </div>
    </div>
  </form>
</div>
  
</div>
</template>



<script>
import { mapGetters } from "vuex";
import {get, postC} from '../utils';

export default {

    computed: {
        ...mapGetters(["token", "id", "type_account"]),
        },

    data: () => {
        return {
            tipoPlanSeleccionado: '',
            titulo: '',
            ingrediente: '',
            descripcion: '',
            nivel: '',
            categoria: '',
            listNivel: [],
            listCategoria: [],
            listPlanes: [],
            fileValue: null
            

        }
    },
    async created() {
        const response = await get('http://localhost:3000/categorias?op=C');
        const tipo = await get('http://localhost:3000/categorias?op=D');
        const planes = await get('http://localhost:3000/planes?op=C&idU=0&idP=0&desc=0');

        this.listCategoria = response;
        this.listPlanes = planes;
        this.listNivel = tipo;

        console.log(response);
    
    },
    methods: {
        selectFile(event){
            this.fileValue = event.target.files[0]
        },

        async createReceipe() {

        try{

         console.log("entre aqui 1");
            const jsonData = {
                "operacion": "A", 
                "id_Usuario": this.id,
                "id_Receta": 0,
                "titulo_": this.titulo, 
                "ingre_": this.ingrediente, 
                "descrp_": this.descripcion, 
                //"img_": "",
                "id_Postres": this.categoria,
                "id_Dificultad": this.nivel,
                "idtipoPlan_": this.type_account 
            }
            console.log(jsonData);
            const formData = new FormData();
            formData.append('data', JSON.stringify(jsonData))

            formData.append('foto', this.fileValue)
            console.log(this.token);
            const response = await postC(`http://localhost:3000/crearReceta`, formData, this.token);
            console.log(response);

        }
        catch(e){
            console.log(e);
        }

        }
    }
}


</script>


