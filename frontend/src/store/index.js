import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from "vuex-persistedstate"

import english from './english'
import options from './options'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    english,
    options
  },

  plugins: [
    createPersistedState({
      paths: ["options"]
    })
  ]
})
