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
   }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
