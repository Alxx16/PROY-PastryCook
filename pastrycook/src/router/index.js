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
    }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
