<template>
    <div>
        <BoxRecetas :msg="msg" :Pastry="Pastry" @id-clicked="handleIdClicked"/>
      <h3>{{ titulo }}</h3>
      <span>{{ id_r }}</span>
      <p>{{ username }}</p>
      <p>{{ ingredientes }}</p>
      <p>{{ descripcion }}</p>
      <p>{{ imagen }}</p>
      <p>{{ postre }}</p>
      <p>{{ tipoDificultad }}</p>
      <p>{{ fecha }}</p>
    </div>
  </template>
  
  <script>
    import BoxRecetas from '../views/BoxRecetas';
    import { mapGetters } from "vuex";
    import { get } from "../utils";
  
  export default {
    components: {
        BoxRecetas,
    },
    computed: {
      ...mapGetters(["token", "id", "type_account"]),
    },
    data: () => {
      return {
        id_r: "",
        username: "",
        titulo: "",
        ingredientes: "",
        descripcion: "",
        imagen: "",
        postre: "",
        tipoDificultad: "",
        fecha: "",
        idForR: null,
        idForU: null
      };
    },
    handleIdClicked(id) {
      this.idForR = id;
      
    },
    async created() {
      try {
        const response = await get(
          `http://localhost:3000/all-recetas?op=D&idU=0&idR=${this.idForR}`,
          this.token
        );
  
        // {descripción,id_R, fecha, imagen, ingredientes, postre, tipoDificultad, titulo, username }
        this.id_r = response[0].id_R;
        this.username = response[0].username;
        this.titulo = response[0].titulo;
        this.ingredientes = response[0].ingredientes;
        this.descripcion = response[0].descripción;
        this.imagen = response[0].imagen;
        this.postre = response[0].postre;
        this.tipoDificultad = response[0].tipoDificultad;
        this.fecha = response[0].fecha;
  
        console.log(
          this.id_r,
          this.username,
          this.titulo,
          this.ingredientes,
          this.descripcion,
          this.imagen,
          this.postre,
          this.tipoDificultad,
          this.fecha
        );
        console.log(response);
      } catch (error) {
        console.log(error);
      }
    },
  };
  </script>
  

