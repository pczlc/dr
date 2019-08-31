import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    indexBg:'url(img/index/back_r_o.jpg)'
  },
  mutations: {
    changeBg(state,str){
      state.indexBg = str
    }
  },
  actions: {

  }
})
