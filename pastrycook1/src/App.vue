<template>
  <div class="bg-violet-100 h-screen" >
    <BoxNab/>
    <BoxBody/>

    <BoxFoot/>
  </div>
   
</template>

<script>
import BoxNab from './components/BoxNav.vue';
import BoxFoot from './components/BoxFoot.vue';
import BoxBody from './components/BoxBody.vue';

export default {
  name: 'App',
  components: {
    BoxNab,
    BoxFoot,
    BoxBody
  }
}
</script>

