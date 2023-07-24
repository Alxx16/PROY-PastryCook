import { createRouter, createWebHistory } from 'vue-router'

const routes = [

    {
      path: '/',
      name: 'Home',
      component: () => import('../components/BoxBody.vue')
     },

    {
      path: '/inicio',
      name: 'inicio',
      component: () => import('@/Views/BoxPrincipal.vue')
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('@/components/BoxLogin.vue')
    },
    {
      path: '/SingUp',
      name: 'SingUp',
      component: () => import('@/components/BoxSingUp.vue')
    },
    {
     path: '/Create',
     name: 'Create',
     component: () => import('@/Views/BoxCreate.vue')
   },
   {
    path: '/Profile',
    name: 'Profile',
    component: () => import('@/components/BoxMyProfile.vue')
  },
  {
   path: '/Favorite',
   name: 'Favorite',
   component: () => import('@/Views/BoxFav.vue')
 },
 {
  path: '/Xuxa',
  name: 'Xuxa',
  component: () => import('@/Views/BoxRecetas.vue')
},
{
  path: '/hola',
  name: 'hola',
  component: () => import('@/components/BoxViewRecipe.vue')
}
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
