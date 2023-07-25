<template>
  <div>
    <div>
      
    </div>
    <!-- Filtro  arriba -->
  <nav v-if="bar" class="relative flex w-full items-center bg-white py-2 ">
  <div class="flex w-full  items-center justify-center  px-3">
    <!-- Necesito arreglar xxm -->
    <div class="flex">
      <ul class="flex flex-col md:flex-row justify-between text-justify">
        <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <router-link to="/inicio" class="" href="">Inicio</router-link>
        </li>
        <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <router-link to="/Xuxa" class="scale-100">Buscar</router-link>
        </li>
        <li class="mb-4 md:mb-0 md:mr-4 mx-10">
          <router-link to="/Favorite" class=" ">Favoritos</router-link>
        </li>
        <li class="mb-2 md:mb-0 mx-10">
        <router-link to="/MyRecipe" class="" >Recetas</router-link>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Carrusel -->
<div class="bg-white w-full max-h-">
            <img class=" flex-none w-full h-full" src="../assets/img/banner2.jpg" alt="">
        </div> 
<!-- Titulo -->
<section class="mb-12 bg-rose-300">
    <div class="w-full items-center justify-center bg-primary py-4 px-6 text-center md:flex md:text-left">
      <div class="mb-4 flex flex-wrap items-center justify-center md:mb-0 md:justify-start">
        <strong class="mr-1 text-2xl text-black">Pastry Cook</strong>
      </div>
    </div>
  </section>
  <!-- Categorias -->
  <div class="bg-white mb pt-12">
  <div class="mx-auto max-w-4xl px-4 sm:px-9 lg:px-8">
    <div class="mx-auto max-w-8xl py-16 sm:py-10 lg:max-w-none lg:py-32">
      <h1 class="text-4xl font-bold text-gray-900">Categorías</h1>
      <div class="mt-6 space-y-12 lg:grid lg:grid-cols-3 lg:gap-x-6 lg:space-y-0">
        <div class="group relative">
          <div class="relative h-70 w-full overflow-hidden rounded-lg bg-white sm:aspect-h-1 sm:aspect-w-2 lg:aspect-h-1 lg:aspect-w-1 group-hover:opacity-75 sm:h-64">
            <img src="https://cdn2.cocinadelirante.com/sites/default/files/images/2019/04/recetas-de-postres-frios-con-galletas-faciles-y-rapidos-sin-horno.jpg" alt="Recetas frias" class="h-full w-full object-cover object-center">
          </div>
          <h3 class="mt-6 text-sm text-gray-500">
            <a href="#">
              <span class="absolute inset-0"></span>
              Recetas frías
            </a>
          </h3>
          <p class="text-base font-semibold text-gray-900">La mejor manera de refrescarse en un día caluroso</p>
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
          <p class="text-base font-semibold text-gray-900">La mejor manera de entrar en calor en un día frío</p>
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
          <p class="text-base font-semibold text-gray-900"> El plato perfecto para cualquier ocasión</p>
        </div>
      </div>
    </div>
  </div>
    <!-- Recetas -->
  </div >
<BoxRecetas :Pastry="recetas"/>
</div>
</template>



<script>
import BoxRecetas from './BoxRecetas.vue';

import { mapGetters } from "vuex";
import { $router } from '../router';
import {getH} from '../utils';

export default {
  name: 'SlideCarousel',
  components:{
    BoxRecetas
  },
  props: {
    msg: String
  },computed: {
    ...mapGetters(["token", "id", "type_account"])
  },
  data: ()=>{
    return{
      count:0,
      interval:"",
      recetas: [],
      image:["./img/img1.jpg","./img/img2.jpg","./img/img3.jpg"],
      bar:true,
    }
  },
  async created(){
        try{
            const response = await getH(`http://localhost:3000/all-recetas?op=B&idU=0&idR=0`, this.token)
            this.recetas = response;
            console.log(this.recetas);

            
          }catch(error){
              console.log(error);
          }

    },

  
  methods:{
    makeActive:function(index){
      this.count=index;
    },
    toggleButton() {
      this.bar = !this.bar;// Cambiar el estado de la variable al hacer clic
    }
  },
  mounted(){
    this.interval=setInterval(()=>{
      this.count==2?this.count=0:this.count++;
      }, 2000);

      if(this.token==false  ){
        $router.push("/");
      }
  },
  beforeUnmount(){
    clearInterval(this.interval);
  }
}
</script>