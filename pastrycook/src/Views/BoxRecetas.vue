<template>
    <div class="container flex mx-auto px-5 py-2 lg:px-32 lg:pt-12">
            <div class="-m-1 flex flex-wrap md:-m-2" v-for="po in polla" v-bind:key="po.id">
            <a href="#" class="flex flex-col items-center bg-white border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
            <img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-l-lg" src="../../public/img/Pastel.png" alt="">
                <div class="flex flex-col justify-between p-4 leading-normal">
        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ po.titulo }}</h5>
        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">{{ po.descripcion }}</p>
    </div>
</a>
</div>
</div>

</template>

    <script>
    export default {
        name: 'BoxRecetas',
        props: {
            msg: String,
            polla: Array,
            

            
        }
       
    }
        
    </script>
