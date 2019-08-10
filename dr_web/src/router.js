import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/Index.vue'
import Products from './views/Products.vue'
import Details from './views/Details.vue'
import Login from './views/Login.vue'
import NotFound from './views/NotFound.vue'
Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Index},
    {path:'/Products',component:Products},
    {path:'/Details',component:Details},
    {path:'/Login',component:Login},
    {path:'*',component:NotFound},
  ]
})
