<template>
    <div class="flex min-h-full flex-1 flex-col justify-center pb-12 padding-top: 0px;">
        <!-- class="sm:mx-auto sm:w-full sm:max-w-sm"-->
        <div> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 mb-8">Iniciar Sesión</h3>
            <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
        </div>
        
        <div class="mt-10 md:mx-auto md:w-full md:max-w-md">
            <form class="space-y-6 w-full p-10 rounded-md border-0 ring-gray-300 ring-1 ring-inset bg-white shadow-md " action="" method="POST">
                    <div>
                        <label for="user" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Usuario</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/correo.png" class="h-13 w-12 mx-0 inline" alt=""></span>
                            <input id="user" name="user" required="required" type="text" placeholder="Introduce nombre" class="block w-full h-10 rounded-md border-0  text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>

                    <div>

                        <label for="password" class="uppercase block text-sm font-medium leading-6 tex.text-gray-900">Contraseña</label>
                        <div class="mt-2 flex">
                            <span class=" py-1 px-3  mx-0 mr-3 h-10"><img src="../assets/icons/bloquear.png" class=" h-13 w-12 mx-0 inline" alt=""></span>
                            <input id="password" name="password" required="required" autocomplete="current-password" type="password" placeholder="Introduce contraseña" class="block w-full rounded-md border-0 py-1.5 text-gray-900 px-3 py-2 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                    <div class="flex justify-center">
                        <router-link to="/inicio" type="submit" class="tracking-widest uppercase w-52 rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Iniciar Sesión</router-link>
                    </div>

                    <p class="mt-10 text-center text-sm text-gray-500">
                        ¿No tienes una cuenta?
                        <RouterLink to="/SingUp" class="font-semibold leading-6 text-indigo-600 hover:text-indigo-500">Registrate aquí</RouterLink>
                    </p>
            </form>
        </div>  
    </div>
</template>


<script>
export default {

}
  
</script>