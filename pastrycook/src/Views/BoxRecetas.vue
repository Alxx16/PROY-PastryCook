<template>
    <div>

    <div class="flex justify-center items-center ">

        <div class="container grid grid-rows-2  grid-cols-3 gap-10 my-6   flex justify-center items-center">
            <div class="-m-1 flex flex-wrap md:-m-2" v-for="po in paginatedData" v-bind:key="po.id">
                <a @click="emitId(po.id_R)" href="#" class="w-full  bg-white  border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-blue-300 dark:border-gray-700 dark:bg-blue-300 dark:hover:bg-blue-500">
                    <div class="w-full h-60">
                        <div class="relative w-full h-full">
                            <img class="relative object-cover w-full h-full object-fit rounded-lg " src="../../public/img/Pastel.png" alt="">
                        </div>
                    </div>
                    <div class="flex flex-col justify-between p-4 leading-normal">
                        <h5 class=" mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">{{ po.titulo }}</h5>
                        <div>
                            <div class="flex justify-between">
                                <div class="rating flex items-center mt-2.5 mb-5">
                                    <svg v-for="i in po.ratind" :key="i" class="w-4 h-4 text-yellow-300 mr-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                        <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                    </svg>
                                    
                                    <span class="bg-blue-100 text-blue-800 text-xs font-semibold mr-2 px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ml-3">{{ po.reating }}</span>
                                </div>
                                <div class="flex items-center text-white">
                                    <strong>Dificultad: </strong>   {{ po.tipoDificultad }}
                                </div>
                            </div>
                            <div class="flex justify-between text-white">
                                <div>
                                    <strong>Publicacion:</strong> {{ po.fecha }}
                                </div>
                                <div>
                                    <strong>Tipo:</strong> {{ po.nombre_tipo }}
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="pagination">
            <nav aria-label="Page navigation example">
                <ul class="inline-flex -space-x-px text-sm">
                    <li>
                        <a href="#" @click="previousPage" :disabled="currentPage === 1" class="flex items-center justify-center px-3 h-8 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 rounded-l-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Previous</a>
                    </li>
                    <li v-for="page in totalPages" :key="page">
                        <a href="#" @click="goToPage(page)" :class="{ 'text-blue-600 bg-blue-50': currentPage === page }"  class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">{{ page }}</a>
                    </li>
                    
                    <li>
                        <a href="#" @click="nextPage" :disabled="currentPage === totalPages" class="flex items-center justify-center px-3 h-8 leading-tight text-gray-500 bg-white border border-gray-300 rounded-r-lg hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    
    </div>

</template>



<script>
export default {
    name: 'BoxRecetas',
    props: {
        msg: String,
        Pastry: Array,
    },
    data() {
        return {
            currentPage: 1,
            itemsPerPage: 6,
        };
    },
    computed: {
        totalPages() {
            return Math.ceil(this.Pastry.length / this.itemsPerPage);
        },
        paginatedData() {
            const start = (this.currentPage - 1) * this.itemsPerPage;
            const end = start + this.itemsPerPage;
            return this.Pastry.slice(start, end);
        },
    },
    methods: {
        nextPage() {
            if (this.currentPage < this.totalPages) {
                this.currentPage++;
            }
        },
        previousPage() {
            if (this.currentPage > 1) {
                this.currentPage--;
            }
        },
        goToPage(page) {
            this.currentPage = page;
        },
    },
};
</script>
