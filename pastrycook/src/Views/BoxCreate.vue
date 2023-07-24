<template>
 
  <div class="flex min-h-full relative flex-1 flex-col items-center justify-center ">
    <!-- Barra superior -->
    
      <div class="mt-0 w-full "> 
            <h3 class="uppercase p-5 bg-violet-200 w-full text-center text-2xl font-bold leading-9 tracking-tight  mb-8">Crea tu Receta</h3>
            <img class="mx-auto h-20 w-auto" src="../assets/img/logo.png" alt="PastryCook" />
        </div>
    
    <!--form de Crear Recetas-->
    <div class="relative flex min-h-full flex-1 flex-col items-center justify-center">
  <!-- Barra superior -->
  <div></div>

  <!--form de Crear Recetas-->

  <form class="w-25 space-y-6 rounded-md border-0 bg-violet-100 p-10 shadow-md ring-1 ring-inset ring-gray-300">
    <!-- Radio button -->
    <div class="mb-6">
      <fieldset class="mr-2 flex">
        <legend class="sr-only">Tipo de Receta</legend>
        <div class="mb-4 flex">
          <input id="Gratis" type="radio" value="Gratis" class="focus:ring:blue-300 dark:focus-ring-blue-600 h-6 w-4 border-gray-300 focus:ring-2 dark:border-gray-600 dark:bg-gray-700" />
          <label for="Gratis" class="ml-2 block text-sm font-medium text-gray-900 dark:text-gray-300"> Gratis </label>
        </div>

        <div class="mb-4 flex">
          <input id="Premiun" type="radio" value="Premium" class="focus:ring:blue-300 dark:focus-ring-blue-600 ml-2 h-6 w-4 border-gray-300 focus:ring-2 dark:border-gray-600 dark:bg-gray-700" />
          <label for="Premiun" class="ml-2 block text-sm font-medium text-gray-900 dark:text-gray-300"> Premium </label>
        </div>
      </fieldset>
    </div>
    <!--fin boton Radio button-->

       <!--Form de Crear-->
    <div class="-mx-3 mb-6 flex flex-col">
      <div class="group relative z-0 mb-6 w-full">
        <input type="text" name="NameReceta" id="NameReceta" class="peer block w-full appearance-none border-0 border-b-2 border-gray-300 bg-transparent px-0 py-2.5 text-sm text-gray-900 focus:border-blue-600 focus:outline-none focus:ring-0 dark:border-gray-600 dark:text-white dark:focus:border-blue-500" placeholder=" " required />
        <label for="NameReceta" class="absolute top-3 -z-10 origin-[0] -translate-y-6 scale-75 transform text-sm text-gray-500 duration-300 peer-placeholder-shown:translate-y-0 peer-placeholder-shown:scale-100 peer-focus:left-0 peer-focus:-translate-y-6 peer-focus:scale-75 peer-focus:font-medium peer-focus:text-blue-600 dark:text-gray-400 peer-focus:dark:text-blue-500">Nombre de la receta</label>
      </div>
      <div class="-mx-3 mb-6 flex flex-wrap">
        <div class="w-full px-3">
          <label for="message" class="font-large mb-2 block text-sm font-semibold text-gray-900 dark:text-white">Ingredientes</label>
          <textarea id="message" rows="4" class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm font-semibold text-gray-900 focus:border-blue-500 focus:ring-blue-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:placeholder-gray-400 dark:focus:border-blue-500 dark:focus:ring-blue-500" placeholder="Sabemos que será delicioso"></textarea>
        </div>
      </div>
      <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white" for="file_input">Sube una foto de tu creación</label>
      <input class="block w-full cursor-pointer rounded-lg border border-gray-300 bg-gray-50 text-sm text-gray-900 focus:outline-none dark:border-gray-600 dark:bg-gray-700 dark:text-gray-400 dark:placeholder-gray-400" aria-describedby="file_input_help" id="file_input" type="file" />
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-300" id="file_input_help">SVG, PNG, JPG or GIF (MAX. 800x400px).</p>
    </div>

    <div class="-mx-3 mb-2 flex flex-wrap">
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700" for="grid-level"> Nivel de dificultad </label>
        <div class="relative">
          <select class="block w-full appearance-none rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700 focus:border-gray-500 focus:bg-white focus:outline-none" id="grid-state">
            <option>Facil</option>
            <option>Medio</option>
            <option>Avanzado</option>
          </select>
          <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
            <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
          </div>
        </div>
      </div>
      <div class="mb-6 w-full px-3 md:mb-0 md:w-1/3">
        <label class="mb-2 block text-xs font-bold uppercase tracking-wide text-gray-700" for="grid-level"> Categoria </label>
        <div class="relative">
          <select class="block w-full appearance-none rounded border border-gray-200 bg-gray-200 px-4 py-3 pr-8 leading-tight text-gray-700 focus:border-gray-500 focus:bg-white focus:outline-none" id="grid-state">
            <option>Postres Frios</option>
            <option>Postres calientes</option>
            <option>Galletas</option>
            <option>Donas</option>
            <option>pasteles</option>
          </select>
          <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
            <svg class="h-4 w-4 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" /></svg>
          </div>
        </div>
      </div>
      <div class="mb-0 ml-4 flex flex-col">
        <div id="Avatar_user" role="tooltip" class="tooltip invisible absolute z-10 inline-block rounded-lg bg-gray-900 px-3 py-2 text-sm font-medium text-white opacity-0 shadow-sm transition-opacity duration-300 dark:bg-gray-700">
          Tu avatar
          <div class="tooltip-arrow" data-popper-arrow></div>
        </div>
        <img data-tooltip-target="tooltip-jese" class="h-12 w-12 rounded" src="/docs/images/people/profile-picture-5.jpg" alt="Avatar" />
      </div>
      <div>
        <button type="submit" class="dark:bg-rose ml-2 mt-10 w-full rounded-lg bg-amber-300 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:hover:bg-blue-700 dark:focus:ring-blue-800 sm:w-auto">Cargar Receta</button>
        <button type="submit" class="ml-2 mt-10 w-full rounded-lg bg-rose-200 px-5 py-2.5 text-center text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 sm:w-auto">Cancelar</button>
      </div>
    </div>
  </form>
</div>
  
</div>
</template>



<script>
</script>




<!-- <template>
  <div class="flex min-h-full relative flex-1 flex-col items-center justify-center ">
   
    
    
    <form class="space-y-6 w-25 p-10 rounded-md border-0 ring-gray-300 ring-1 ring-inset  shadow-md  bg-teal-400">
     
      
      <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
            Titulo de la Receta
          </label>
          <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" placeholder="Pastel de queso">
          <p class="text-red-500 text-xs italic">Upps! Parece que te falto este campo</p>
        </div>
        
      

        <div class="w-full md:w-1/2 px-3">
          <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
            Last Name
          </label>
          <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-last-name" type="text" placeholder="Doe">
        </div>
      </div>
      
     
  </div>
</template> -->
