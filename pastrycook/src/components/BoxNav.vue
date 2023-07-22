<template>
  <nav id="Navbar" class="flex items-center justify-between bg-rose-300 p-4">
    <router-link to="/inicio" class="flex items-center flex-shrink-0 text-white mr-6">
      <img src="../assets/img/logo.png" alt="logo" class="h-24 ">
    </router-link>
    <router-link to="/login" class="btn btn-block btn-primary  bg-amber-300 rounded-lg border-black text-black hover:text-white font-semibold py-2 px-4 hidden md:block shadow-lg shadow-black-500/50">
  
       Acceder
    
  </router-link>
  </nav>
</template>

<script>  

export default {
  
}

</script>
