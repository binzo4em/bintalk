import axios from 'axios'

export default {
  namespaced: true,
  state: () => ({
    engDatas: {},
    showHint: false,
    soundOff: false,
    showAnswer: false,
    showEffect: false,
    myAnswer: '',
    correctAnswer: ''
  }),
  mutations: {
    setEngDatas (state, payload) {
      state.engDatas = payload;
    },
    setShowHint (state, payload) {
      state.showHint = payload;
    },
    setSoundOff (state, payload) {
      state.soundOff = payload;
    },
    setShowAnswer (state, payload) {
      state.showAnswer = payload;
    },
    setShowEffect (state, payload) {
      state.showEffect = payload;
    },
    setMyAnswer (state, payload) {
      state.myAnswer = payload;
    },
    setCorrectAnswer (state, payload) {
      state.correctAnswer = payload;
    }
  },
  actions: { // 비동기 실행은 actions에서 수행
    getRandomQuestion ({ commit }) {
      axios.get(`${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}/api/getRandomQuestion`)
        .then(res => {
          commit('setEngDatas', res.data);
        })
    }
  }
}
