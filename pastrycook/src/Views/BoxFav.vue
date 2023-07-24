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
          ratind:3,
          fecha: "2021-06-01",
          nombre_tipo: "Gratis"
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
          ratind:5,
          fecha: "2021-06-01",
          nombre_tipo: "Gratis"
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
          ratind:5,
          fecha: "2021-06-01",
          nombre_tipo: "Gratis"
        }

      ]
        }
            
    }}
</script>

