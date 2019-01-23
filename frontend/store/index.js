import Vuex from 'vuex'
const fetch = require('node-fetch')

const createStore = () => {
  return new Vuex.Store({
    state: () => ({
      counter: 0,
      posts: []
    }),
    getters: {
      posts: state => state.posts
    },
    mutations: {
      increment(state) {
        state.counter++
      },
      setPosts(state, payload) {
        state.posts = payload
      }
    },
    actions: {
      getPosts(store) {
        fetch('http://' + window.location.hostname + '/strapi/posts')
          .then(response => response.json())
          .then(json => {
            store.commit('setPosts', json)
            console.log(json)
          })
      }
    }
  })
}

export default createStore
