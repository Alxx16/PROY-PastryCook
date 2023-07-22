<template>
  <nav id="Navbar" class="flex items-center justify-between bg-rose-300 p-4">
    <a href="../assets/img/logo.png" class="flex items-center text-white">
      <img src="../assets/img/logo.png" alt="logo" class="h-24 ">
      <!-- <span class="font-semibold text-xl tracking-tight"></span> -->
    </a>
    <router-link to="/inicio" class="bg-amber-300 rounded-lg border-black text-black hover:text-white font-semibold py-2 px-4 hidden md:block shadow-lg shadow-black-500/50">
    
       Acceder
    
  </router-link>
    <button class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded md:hidden">
      <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
        <path
          fill-rule="evenodd"
          d="M3 4a1 1 0 100 2h14a1 1 0 100-2H3zm0 5a1 1 0 100 2h14a1 1 0 100-2H3zm0 5a1 1 0 100 2h14a1 1 0 100-2H3z"
          clip-rule="evenodd"
        ></path>
      </svg>
    </button>
  </nav>
</template>



<script>  

export default {
  
}

</script>
