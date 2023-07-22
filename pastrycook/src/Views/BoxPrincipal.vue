<template>
  <div>
  <nav class="relative flex w-full items-center justify-center bg-white py-2 text-neutral-600 shadow-lg hover:text-neutral-700 focus:text-neutral-700 dark:bg-neutral-600 dark:text-neutral-200 md:justify-between">
  <div class="flex w-full  items-center justify-center md:justify-between px-3">
    <!-- Necesito arreglar xxm -->
    <div class="flex items-center md:items-stretch justify-center">
      <ul class="flex flex-col md:flex-row">
        <li class="mb-4 md:mb-0 md:mr-4">
          <a class="block transition duration-150 ease-in-out hover:text-neutral-700 focus:text-neutral-700 dark:hover:text-white dark:focus:text-black" href="#home">Inicio</a>
        </li>
        <li class="mb-4 md:mb-0 md:mr-4">
          <a class="block transition duration-150 ease-in-out hover:text-neutral-700 focus:text-neutral-700 dark:hover:text-white dark:focus:text-black" href="#features">Buscar</a>
        </li>
        <li class="mb-4 md:mb-0 md:mr-4">
          <a class="block transition duration-150 ease-in-out hover:text-neutral-700 focus:text-neutral-700 dark:hover:text-white dark:focus:text-black" href="#pricing">Favoritos</a>
        </li>
        <li class="mb-2 md:mb-0">
          <a class="block transition duration-150 ease-in-out hover:text-neutral-700 focus:text-neutral-700 dark:hover:text-white dark:focus:text-black" href="#about">Recetas</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Carrusel -->
<div>
   <div class="flex flex-wrap w-full relative">
  <div class="absolute w-full" v-for="(color,index) in colors" :key="color">
    <transition name="fade">
      <div v-if="count==index" :class="color" style="height:350px">
    </div>
    </transition>
    
  </div>
  <div class="w-full" style="height:345px">
      <div class="absolute bottom-0 flex w-full justify-center">
        <div @click="makeActive(index)" v-for="(color,index) in colors" :key="color" :class="count==index?'bg-gray-600':'bg-yellow-800'" class="rounded-full h-4 w-4 mx-2 cursor-pointer"></div>
      </div>
      
  </div>

</div>

  </div>
<!-- Titulo -->
<section class="mb-12 bg-rose-300">
    <div class="w-full items-center justify-center bg-primary py-4 px-6 text-center md:flex md:text-left">
      <div class="mb-4 flex flex-wrap items-center justify-center md:mb-0 md:justify-start">
        <strong class="mr-1 text-black">Pastry Cook</strong> 
      </div>
    </div>
  </section>
  <!-- Categorias -->
  
  <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
    <div class="mx-auto max-w-2xl py-16 sm:py-24 lg:max-w-none lg:py-32">
      <h2 class="mb-12 text-center text-3xl font-bold">Categorias</h2>
      <div class="mt-6 space-y-12 lg:grid lg:grid-cols-3 lg:gap-x-6 lg:space-y-0">
        <div class="group relative">
          <div class="relative h-70 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://cdn2.cocinadelirante.com/sites/default/files/images/2019/04/recetas-de-postres-frios-con-galletas-faciles-y-rapidos-sin-horno.jpg" alt="Recetas frias" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
              Recetas frias
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900">que berga pongo aqui </p>
        </div>
        <div class="group relative">
          <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://e00-telva.uecdn.es/assets/multimedia/imagenes/2020/04/20/15873968588292.jpg" alt="Recetas calientes" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
                Recetas calientes
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900"> que berga pongo aquiX2 </p>
        </div>
        <div class="group relative">
          <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F21%2F2021%2F03%2F05%2FGettyImages-905563616-1-2000.jpg&q=60" alt="Galletas" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
               Recetas Galletas
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900"> que berga pongo aquix3</p>
        </div>
        <div class="group relative">
          <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://e00-telva.uecdn.es/assets/multimedia/imagenes/2020/04/20/15873968588292.jpg" alt="Recetas calientes" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
                Recetas calientes
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900"> que berga pongo aquiX2 </p>
        </div>
        <div class="group relative">
          <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://e00-telva.uecdn.es/assets/multimedia/imagenes/2020/04/20/15873968588292.jpg" alt="Recetas calientes" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
                Recetas calientes
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900"> que berga pongo aquiX2 </p>
        </div>
        <div class="group relative">
          <div class="relative h-80 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://e00-telva.uecdn.es/assets/multimedia/imagenes/2020/04/20/15873968588292.jpg" alt="Recetas calientes" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
                Recetas calientes
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900"> que berga pongo aquiX2 </p>
        </div>
      </div>
    </div>
    <!-- Recetas -->
  </div>


</div>
</template>



<script>
export default {
  name: 'SlideCarousel',
  props: {
    msg: String
  },
  data(){
    return{
      count:0,
      interval:"",
      colors:["bg-teal-300","bg-green-800","bg-pink-700"],
    }
  },
  methods:{
    makeActive:function(index){
      this.count=index;
    }
  },
  mounted(){
    this.interval=setInterval(()=>{
      this.count==2?this.count=0:this.count++;
      }, 2000);
  },
  beforeUnmount(){
    clearInterval(this.interval);
  }
}
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #0000;
}

.fade-enter-active,
.fade-leave-active {
  transition: all 1s ease;
}

.fade-enter-from{
  opacity: 0;
  transform:translateX(-100%);
}
.fade-leave-to {
  opacity: 0;
  transform:translateX(100%);
}
</style>