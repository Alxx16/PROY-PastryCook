<template>
  <!-- Boton  -->
  <div>
  <nav id="Navbar" class="flex items-center justify-between bg-rose-300 p-4">
    <router-link to="/inicio" class="flex items-center flex-shrink-0 text-white mr-6">
      <img src="../assets/img/logo.png" alt="logo" class="h-24 ">
    </router-link>
    <router-link to="/login" v-if="!token" class="btn btn-block btn-primary  bg-amber-300 rounded-lg border-black text-black hover:text-white font-semibold py-2 px-4 hidden md:block shadow-lg shadow-black-500/50">
       Acceder
  </router-link>

  <!-- Boton de Inicio -->
  <div v-if="token" class="relative group" >
    <button >
    <img @click.prevent="nombre" class="rounded-full" style="height: 50px; width: 50px" alt="Avatar" loading="lazy" src="https://sgaissert.files.wordpress.com/2009/09/lilaccloseup.jpg" >
  </button>
     <div class="absolute z-10 bg-grey-200  place-items-center" :class="{'hidden':!showDropDown}">
       <div class="px-2 pt-2 pb-4 bg-red-200 shadow-lg">
            <div  class=" absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
              <ul  class="py-1">
              <li> <a href="#" class=" dropdown-item">Mis Datos</a> </li>
              <li> <a href="#" class=" dropdown-item">Logout</a> </li>
              </ul>
            </div>
          </div>
      </div>
    </div>
      <!-- FIN BOTON -->
  
  </nav>
     <!-- Filtro  arriba -->
     <nav v-if="token" class="relative flex w-full items-center bg-white py-2 ">
      <div class="flex w-full  items-center justify-center  px-3">
      <!-- Necesito arreglar xxm -->
      <div class="flex">
        <ul class="flex flex-col md:flex-row justify-between text-justify">
          <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <router-link to="/Profile" class="" href="">Inicio 
          </router-link>
          </li>
          <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <a class="scale-100" href="#features">Buscar</a>
          </li>
          <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <router-link to="/Favorite" class=" ">Favoritos</router-link>
        </li>
        <li class="mb-2 md:mb-0 mx-10">
          <a class=" " href="#about">Recetas</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
   <!-- Fin filtro -->
</div>
</template>



<script>

// import {token} from '../router'
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters(["token"])
  },
  data: ()=>{
    return{
      showDropDown: false
    }
  },
  methods:{
    nombre(){
      this.showDropDown = !this.showDropDown;
    }
  }
   
};
</script>



<div class="absolute bottom-0 right-0 bg-gray-400 text-white px-2 py-1 text-xs font-bold rounded-tl">{{ fecha }}</div>

