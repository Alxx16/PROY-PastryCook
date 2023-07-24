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
      },
      UPDATE_TYPE_ACCOUNT(state, payload){
        state.type_account = payload
      }
    },
    actions: {
      addId(context, payload) {
      context.commit('UPDATE_ID', payload)
      },
      
      addToken(context, payload) {
      context.commit('UPDATE_TOKEN', payload)
      },

      addTypeAccount(context, payload) {
        context.commit('UPDATE_TYPE_ACCOUNT', payload)
        }
      
    },
    getters: {
      token: (state) => {
        return state.token
      },
      id: (state) => {
        return state.id
      }, 
      type_account: (state) =>{
        return state.type_account
      }
    },
})