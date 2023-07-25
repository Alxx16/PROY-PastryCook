<template>
    <!-- Recetas -->
    <div class="relative flex min-h-full flex-1 flex-col items-center justify-center">
  <!-- Barra superior -->
  <div class="mt-0 w-full">
    <h3 class="mb-8 w-full bg-violet-200 p-5 text-center text-2xl font-bold uppercase leading-9 tracking-tight">Tus Recetas</h3>
    <img class="mx-auto mb-12 h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
  </div>
  <!-- Contenedor del formulario y botón -->
  <div class="relative mt-30 flex min-h-full flex-1 flex-row items-start justify-between">
    <!--form de Crear Recetas-->
    <div v-if="recetas.length > 0">
      <div v-for="(receta, index) in recetas" :key="index" class="w-25 space-y-6 rounded-md border-0 bg-violet-100 p-10 shadow-md ring-1 ring-inset ring-gray-300">
        <a href="#" class="flex flex-col items-center rounded-lg border border-gray-200 bg-white shadow hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700 md:max-w-xl md:flex-row">
          <router-link to="/verReceta" class="h-96 w-full rounded-t-lg object-cover md:h-auto md:w-48 md:rounded-none md:rounded-l-lg" src="/docs/images/blog/image-4.jpg" alt="" />
          <div class="flex flex-col justify-between p-4 leading-normal">
            <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">Noteworthy technology acquisitions 2021</h5>
            <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.</p>
            <div class="hover-content">
              <p class="text-sm text-gray-700 dark:text-gray-400">Dificultad: {{ receta.dificultad }}</p>
              <p class="text-sm text-gray-700 dark:text-gray-400">Rating: {{ receta.rating }}</p>
              <p class="text-sm text-gray-700 dark:text-gray-400">Categoría: {{ receta.categoria }}</p>
            </div>
          </div>
        </a>
      </div>
    </div>
    <div v-else class="w-25 space-y-6 rounded-md border-0 bg-violet-100 p-10 shadow-md ring-1 ring-inset ring-gray-300">
      <p>No hay nada que ver aquí Unu.</p>
    </div>
    <div class="ml-20 mr-0">
      <RouterLink to="/Create" type="button" class="mb-2 ml-40 mr-2 rounded-lg border border-gray-200 bg-amber-300 px-12 py-2.5 text-sm font-medium text-gray-900 hover:bg-amber-200 hover:text-blue-700 focus:z-10 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:border-gray-600 dark:bg-gray-800 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white dark:focus:ring-gray-700">Crear</RouterLink>
      <!--  enlaces de interes -->
      <div class="mt-4 flex-row space-y-2 text-right">
        <a href="#" class="block text-blue-500 hover:underline">Consejos para una mejor redacción</a>
        <a href="#" class="block text-blue-500 hover:underline">¿Comó crear recetas fantasticas?</a>
        <a href="#" class="block text-blue-500 hover:underline">¿Por que Odio Tailwind?</a>
        <!--  enlaces de interes -->
      </div>
    </div>
  </div>
</div>
</template>

   
  <script>
export default {
  data() {
    return {
      recetas: [], // Inicialmente vacío
      // Otros datos...
    };
  },
  // Otros métodos, computadas, etc...
};
</script>


<style src="../assets/tailwind.css"></style>