export default {
    namespaced: true,
    state: () => ({
      soundOn: true,
    }),
    mutations: {
      setSoundOn (state, payload) {
        state.soundOn = payload;
      },
    }
  }