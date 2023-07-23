import { createStore } from 'vuex'

export default createStore({
    state: {
      id: null,
      token: null,
      type_account: null,
    },

    mutations: {
      UPDATE_ID(state, payload) {
        state.id = payload
      },
      UPDATE_TOKEN(state, payload) {
        state.token = payload
      }
    },
    actions: {
      addId(context, payload) {
        // const id = context.state.id
      // id.push(payload)
      console.log({context, payload})
      context.commit('UPDATE_ID', payload)
      },
      
      addToken(context, payload) {
      //   const token = context.state.token
      // token.push(payload)
      context.commit('UPDATE_TOKEN', payload)
      }
      
    },
    getters: {
      token: (state) => {
        return state.token
      },
      id: (state) => {
        return state.id
      }
    },
})