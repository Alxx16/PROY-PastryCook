<template>
  <div class="flex flex-col items-center justify-center min-h-screen py-2">
        <BoxRecetas :msg="msg" :Pastry="Pastry" @id-clicked="handleIdClicked"/>

      <!-- fin barra -->
      <div class="relative flex min-h-full flex-1 flex-col items-center justify-center">
  <!-- Barra superior -->
  <div class="mt-0 w-full">
    <h3 class="mb-8 w-full bg-violet-200 p-5 text-center text-2xl font-bold uppercase leading-9 tracking-tight">Tus Recetas</h3>
    <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
  </div>
  <!-- Contenedor del formulario y botón -->
  <div class="relative flex min-h-full flex-1 flex-row items-start justify-between">

        <span v-if="isPremium" class="absolute top-0 right-0 bg-yellow-400 text-black px-2 py-1 text-xs font-bold rounded-bl">Premium</span>
        <span v-else class="absolute top-0 right-0 bg-blue-400 text-white px-2 py-1 text-xs font-bold rounded-bl">No Premium</span>
      <div  class="w-25 space-y-6 rounded-md border-0 bg-violet-100 p-10 shadow-md ring-1 ring-inset ring-gray-300">
      <!-- <div class="w-full h-10 bg-cover bg-center" :style="{ 'background-image': 'url(' + imagen + ')' }"></div> -->



      <!--Form de Crear-->
    <div class="mb-6">
      <h2 class="text-2xl font-bold">{{ titulo }}</h2>
    </div>
      <div class="-mx-3 mb-6 flex flex-wrap">
        <div class="w-full px-3">
          <label for="message" class="font-large mb-2 block text-sm font-semibold text-gray-900 dark:text-white">Ingredientes</label>
          <p class="block w-full rounded-lg p-2.5 text-sm font-semibold text-gray-900 dark:text-white">{{ ingredientes }}</p>

        </div>
        
      </div>
      <div class="-mx-3 mb-6 flex flex-wrap">
        <div class="w-full px-3">
          <label for="descripcion" class="font-large mb-2 block text-sm font-semibold text-gray-900 dark:text-white">Descripcion</label>
          <div class="group relative z-0 mb-6 mt-3 w-full">
            <p class="block w-full rounded-lg p-2.5 text-sm font-semibold text-gray-900 dark:text-white">{{ descripcion }}</p>
          </div>
        </div>
      </div>

      <div>
         <div class="-mx-3 mb-2 flex flex-wrap">

            <div class="mb-0 ml-4 flex flex-col">
        <div id="Avatar_user" role="tooltip" class="tooltip invisible absolute z-10 inline-block rounded-lg bg-gray-900 px-3 py-2 text-sm font-medium text-white opacity-0 shadow-sm transition-opacity duration-300 dark:bg-gray-700">
          Tu avatar
          <div class="tooltip-arrow" data-popper-arrow></div>
        </div>
        <img data-tooltip-target="tooltip-jese" class="h-12 w-12 rounded" src="imagen.jpg" alt="Avatar" />
        <span class="mt-2 inline-block rounded-full px-2 py-1 text-sm font-medium text-white bg-blue-500">{{ username }}</span>
      </div>
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700">Nivel de dificultad</label>
        <strong class="block w-full rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700">{{ tipoDificultad }}</strong>
      </div>
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700" for="grid-level">{{ postre }}</label>
        <div class="relative">
        <strong class="block w-full rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700">{{ categoria }}</strong>
      </div>

      </div>
     
    </div>
      </div>

      </div>

        <div class="absolute bottom-0 right-0 bg-gray-400 text-white px-2 py-1 text-xs font-bold rounded-tl">{{ fecha }}</div>
    </div>
    <div>
      <button class="ml-2 mt-10 w-full rounded-lg bg-red-500 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-4 focus:ring-red-300 dark:bg-red-600 dark:hover:bg-red-800 dark:focus:ring-red-800 sm:w-auto">Cerrar</button>
    </div>
 
    </div>
 

      <!-- fin barra -->


      <!-- <h3></h3>
      <span>{{ id_r }}</span>
      <p></p>
      <p></p>
      <p></p>
      <p>{{ imagen }}</p>
      <p></p>
      <p></p>
      <p></p>-->

    </div> 
  </template>
  
  <script>
    import BoxRecetas from '../Views/BoxRecetas';
    import { mapGetters } from "vuex";
    import { get } from "../utils";
  
  export default {
    components: {
        BoxRecetas,
    },
    computed: {
      ...mapGetters(["token", "id", "type_account"]),
    },
    data: () => {
      return {
        id_r: "",
        username: "",
        titulo: "",
        ingredientes: "",
        descripcion: "",
        imagen: "",
        postre: "",
        tipoDificultad: "",
        fecha: "",
        idForR: null,
        idForU: null
      };
    },
    handleIdClicked(id) {
      this.idForR = id;
      
    },
    async created() {
      try {
        const response = await get(
          `http://localhost:3000/all-recetas?op=D&idU=0&idR=${this.idForR}`,
          this.token
        );
  
        // {descripción,id_R, fecha, imagen, ingredientes, postre, tipoDificultad, titulo, username }
        this.id_r = response[0].id_R;
        this.username = response[0].username;
        this.titulo = response[0].titulo;
        this.ingredientes = response[0].ingredientes;
        this.descripcion = response[0].descripción;
        this.imagen = response[0].imagen;
        this.postre = response[0].postre;
        this.tipoDificultad = response[0].tipoDificultad;
        this.fecha = response[0].fecha;
  
        console.log(
          this.id_r,
          this.username,
          this.titulo,
          this.ingredientes,
          this.descripcion,
          this.imagen,
          this.postre,
          this.tipoDificultad,
          this.fecha
        );
        console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
  };
  </script>
  



  


  