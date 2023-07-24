<template>
    <div>

    <div class="flex justify-center items-center ">

        <div class="container grid grid-rows-3  grid-cols-3 gap-10 my-6   flex justify-center items-center">
            <div class="-m-1 flex flex-wrap md:-m-2" v-for="po in paginatedData" v-bind:key="po.id">
                <a href="#" class="w-full flex flex-col items-center bg-white  border border-gray-200 rounded-lg shadow md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700">
                    <img class="object-cover w-full rounded-t-lg h-96 md:h-auto md:w-48 md:rounded-none md:rounded-l-lg" src="../../public/img/Pastel.png" alt="">
                    <div class="flex flex-col justify-between p-4 leading-normal">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">{{ po.titulo }}</h5>
                        <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">{{ po.descripcion }}</p>
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