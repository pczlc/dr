import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
//引入axios 第三方ajax模块
import axios from 'axios'
//配置axios 基础路径
axios.defaults.baseURL='http://127.0.0.1:5050/'
//配置axios 保存session信息
axios.defaults.withCredentials=true
//将axios 注册到vue实例中
  //由于axios不支持use，所以将实例添加到原型上
Vue.prototype.axios=axios
//引入qs模块
import qs from 'qs'
//将qs添加到vue的原型中
Vue.prototype.qs=qs
// 引入并注册懒加载组件
import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload)

Vue.config.productionTip = false

// 路由跳转后跳转后返回页面顶部
router.afterEach((to,from,next) => {
  window.scrollTo(0,0);
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
