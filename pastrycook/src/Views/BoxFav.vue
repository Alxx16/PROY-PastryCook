<template>
 <!-- Recetas -->
  <div>
  <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <div class="mt-0"> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-left text-2xl text-center font-sans font-light mb-8">Recetas</h3> 
        </div>
    <div class="container mx-auto px-5 py-2 lg:px-32 lg:pt-12 padding-top: 0px;">
  <div class="-m-1 flex flex-wrap md:-m-2">
     <!-- Recetas -->
    <div class="flex w-1/3 flex-wrap relative">
      <div class="w-full p-1 md:p-2 relative">
        <img alt="gallery"
          class="block h-full w-full rounded-lg object-cover object-center"
          src="../../public/img/Pastel.png" />

          <p class="position: absolute; text-base font-semibold text-gray-900">La mejor manera de entrar en calor en un día frío</p>
      </div>
    </div>
    <div class="flex w-1/3 flex-wrap relative ">
      <div class="w-full p-1 md:p-2">
        <img
          alt="gallery"
          class="block h-full w-full rounded-lg object-cover object-center"
          src="../../public/img/Pastel.png" />

          <p class=" font-semibold pt-15 text-gray-900">La mejor manera de entrar en calor en un día frío</p>
      </div>
    </div>
    <div class="flex w-1/3 flex-wrap">
      <div class="w-full p-1 md:p-2">
        <img
          alt="gallery"
          class="block h-full w-full rounded-lg object-cover object-center"
          src="../../public/img/Pastel.png" />
          
          <p class="text-base font-semibold text-gray-900">La mejor manera de entrar en calor en un día frío</p>
      </div>
    </div>
  
  </div>
</div>
</div>

</div>
    </template>

<script>
    export default{
        namePages: 'Favorite',
        data(){
            return{
                imgFavorite:[
            {
                  id:1,
                  name:"imag1",
                  url:"Carru1.jpg",
                  description:"Es una imagen xd",
            },
            {
                  id:2,
                  name:"imag2",
                  url:"carr2.jpg",
                  description:" Es otra imagen xd",
            }
            
          ],
        }
            
    }}
</script>

