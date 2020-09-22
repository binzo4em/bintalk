import Vue from 'vue'
import Vuex from 'vuex'
import english from './english'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    english
  }
})
