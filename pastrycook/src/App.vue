<template>
  <div class="bg-white h-screen" >
    <BoxNab/>
    <BoxTitle/>
        <BoxBody/>
        <BoxFoot/>
        <BoxSingUp/>
  </div> 
</template>

<script>
import BoxNab from './components/BoxNav.vue';
import BoxFoot from './components/BoxFoot.vue';
import BoxTitle from './components/BoxTitle.vue';
import BoxBody from './components/BoxBody.vue';
import BoxSingUp from './components/BoxSingUp.vue';

export default {
  name: 'App',
  components: {
    BoxNab,
    BoxFoot,
    BoxBody,
    BoxTitle,
    BoxSingUp

  }
}
</script>

