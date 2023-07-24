<template>
 <!-- Recetas -->
  <div>
    <BoxRecetas :Pastry="recetas"/>
  </div>
</template>

<script>
import BoxRecetas from './BoxRecetas.vue';


    export default{
        namePages: 'Favorite',
        components:{
          BoxRecetas
        },
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
          recetas : [
        {
          id:1,
          descripcion:"La mejor manera de refrescarse en un día caluroso",
          titulo:"Recetas frias",
          autor:"Pastry Cook",
          costo:"$ 100",
          ingredientes:"una polla caliente",
          categoria:"Frias",
          nivel:"Principiante",

        },
        {
          id:2,
          descripcion:"La mejor manera de entrar en calor en un día frío",
          titulo:"Receta calientes",
          autor:"cocinero 1",
          costo:"$ 200",
          ingredientes:"una polla fria",
          categoria:"Calientes",
          nivel:"Avanzado", 
        },
        {
          id:3,
          descripcion:"aslkdnasd",
          titulo:"asdasdaqsdas",
          autor:"coasdasd",
          costo:"$ 20220",
          ingredientes:"uasdas",
          categoria:"Csadasd",
          nivel:"asdasd", 
        },
        {
          id:1,
          descripcion:"La mejor manera de refrescarse en un día caluroso",
          titulo:"Recetas frias",
          autor:"Pastry Cook",
          costo:"$ 100",
          ingredientes:"una polla caliente",
          categoria:"Frias",
          nivel:"Principiante",

        },
        {
          id:2,
          descripcion:"La mejor manera de entrar en calor en un día frío",
          titulo:"Receta calientes",
          autor:"cocinero 1",
          costo:"$ 200",
          ingredientes:"una polla fria",
          categoria:"Calientes",
          nivel:"Avanzado", 
        },
        {
          id:3,
          descripcion:"aslkdnasd",
          titulo:"asdasdaqsdas",
          autor:"coasdasd",
          costo:"$ 20220",
          ingredientes:"uasdas",
          categoria:"Csadasd",
          nivel:"asdasd", 
        },
        {
          id:1,
          descripcion:"La mejor manera de refrescarse en un día caluroso",
          titulo:"Recetas frias",
          autor:"Pastry Cook",
          costo:"$ 100",
          ingredientes:"una polla caliente",
          categoria:"Frias",
          nivel:"Principiante",

        },
        {
          id:2,
          descripcion:"La mejor manera de entrar en calor en un día frío",
          titulo:"Receta calientes",
          autor:"cocinero 1",
          costo:"$ 200",
          ingredientes:"una polla fria",
          categoria:"Calientes",
          nivel:"Avanzado", 
        },
        {
          id:3,
          descripcion:"aslkdnasd",
          titulo:"asdasdaqsdsssssssas",
          autor:"coasdasd",
          costo:"$ 20220",
          ingredientes:"uasdas",
          categoria:"Csadasd",
          nivel:"asdasd", 
        },
        {
          id:1,
          descripcion:"La mejor manera de refrescarse en un día caluroso",
          titulo:"Recetas friassssssss",
          autor:"Pastry Cook",
          costo:"$ 100",
          ingredientes:"una polla caliente",
          categoria:"Frias",
          nivel:"Principiante",

        },
        {
          id:2,
          descripcion:"La mejor manera de entrar en calor en un día frío",
          titulo:"Receta calientesssssss",
          autor:"cocinero 1",
          costo:"$ 200",
          ingredientes:"una polla fria",
          categoria:"Calientes",
          nivel:"Avanzado", 
        },
        {
          id:3,
          descripcion:"aslkdnasd",
          titulo:"asdasdaqsdassssssss",
          autor:"coasdasd",
          costo:"$ 20220",
          ingredientes:"uasdas",
          categoria:"Csadasd",
          nivel:"asdasd", 
        },
        {
          id:2,
          descripcion:"La mejor manera de entrar en calor en un día frío",
          titulo:"Receta calientes",
          autor:"cocinero 1",
          costo:"$ 200",
          ingredientes:"una polla fria",
          categoria:"Calientes",
          nivel:"Avanzado", 
        },
        {
          id:3,
          descripcion:"aslkdnasd",
          titulo:"asdasdaqsdsssssssas",
          autor:"coasdasd",
          costo:"$ 20220",
          ingredientes:"uasdas",
          categoria:"Csadasd",
          nivel:"asdasd", 
        },

      ]
        }
            
    }}
</script>

