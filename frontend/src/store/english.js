import axios from 'axios'

export default {
  namespaced: true,
  state: () => ({
    engDatas: {},
    mainText: '',
    soundOn: true,
  }),
  mutations: {
    setEngDatas (state, payload) {
      state.engDatas = payload;
    },
    setMainText (state, payload) {
      state.mainText = payload;
    },
    setSoundOn (state, payload) {
      state.soundOn = payload;
    },
  },
  actions: { // 비동기 실행은 actions에서 수행
    getRandomQuestion ({ commit }) {
      console.log('getRandomQuestion is called');
      axios.get('http://localhost:3000/api/getRandomQuestion')
        .then(res => {
          commit('setEngDatas', res.data);
          commit('setMainText', res.data.question);
        })
      // axios.get(`${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}/api/getRandomQuestion`)
      //   .then(res => {
      //     commit('setEngDatas', res.data);
      //     commit('setMainText', res.data.question);
      //   })
    }
  }
}
