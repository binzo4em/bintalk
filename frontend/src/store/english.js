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
  actions: { // 비동기 실행은 actions에서 수행, commit을 이용하여 mutations의 메서드를 호출한다. 
    getRandomQuestion ({ commit }) {
      console.log('getRandomQuestion is called');
      axios.get(`${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}/api/getRandomQuestion`)
        .then(res => {
          commit('setEngDatas', res.data);
          commit('setMainText', res.data.question);
        })
    }
  }
}
