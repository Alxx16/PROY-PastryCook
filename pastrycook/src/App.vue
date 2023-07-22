<template>
    <div class="bg-white h-screen" >
    <BoxNab/>
    <BoxTitle/>
    <router-view/>
   
    <BoxFoot/>
  </div>
  
</template>

<script>
import BoxNab from './components/BoxNav.vue';
import BoxFoot from './components/BoxFoot.vue';
//import BoxBody from './components/BoxBody.vue';
import BoxTitle from './components/BoxTitle.vue';

export default {
  name: 'App',
  components: {
    BoxNab,
    BoxFoot,
    //BoxBody,
    BoxTitle
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}
</style>
