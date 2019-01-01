import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const module = {
  namespaced: true,
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  }
}

const store = new Vuex.Store({
  modules: {
    module  : module,
  }
})

export default store