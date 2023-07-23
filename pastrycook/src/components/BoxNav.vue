<template>
  <!-- Boton  -->
  <nav id="Navbar" class="flex items-center justify-between bg-rose-300 p-4">
    <router-link to="/inicio" class="flex items-center flex-shrink-0 text-white mr-6">
      <img src="../assets/img/logo.png" alt="logo" class="h-24 ">
    </router-link>
    <router-link to="/login" v-if="!showButton" class="btn btn-block btn-primary  bg-amber-300 rounded-lg border-black text-black hover:text-white font-semibold py-2 px-4 hidden md:block shadow-lg shadow-black-500/50">
       Acceder
  </router-link>

  <!-- Boton de Inicio -->
  <div v-if="showButton" class="relative group" >
    <button>
    <img class="rounded-full" style="height: 50px; width: 50px" alt="Avatar" loading="lazy" src="https://sgaissert.files.wordpress.com/2009/09/lilaccloseup.jpg" >
  </button>
     <div class="absolute z-10 hidden bg-grey-200 group-hover:block">
       <div class="px-2 pt-2 pb-4 bg-red-200 shadow-lg">
            <div class="dropdown-menu">
              <ul>
              <li> <a href="/first" class=" dropdown-item">Logout</a> </li>
              <li> <a href="/first" class=" dropdown-item">Datos</a> </li>
              <li> <a href="/first" class=" dropdown-item">Mis ganancias</a> </li>
              
              </ul>
            </div>
          </div>
      </div>
    </div>
      <!-- FIN BOTON -->
  
  </nav>
</template>



<script>

export default {
    
  data() {
   return {
  showButton:true // Variable de estado para controlar la visibilidad del botón
   };
 },
  methods: {
    toggleButton() {
      this.showButton = !this.showButton; // Cambiar el estado de la variable al hacer clic
    }
  }
};
</script>


