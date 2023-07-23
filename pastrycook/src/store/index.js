import { createStore } from 'vuex'

export default createStore({
    state: {
      id: null,
      token: null,
      type_account: null,
    },

    mutations: {
      UPDATE_TOKEN(state, payload) {
        state.token = payload
      }
    },
    actions: {
      addToken(context, payload) {
        const token = context.state.token
      token.push(payload)
      context.commit('UPDATE_TOKEN', token)
      }
    },
    getters: {
      token: (state) => {
        return `${state.token}`
      }
    },
})