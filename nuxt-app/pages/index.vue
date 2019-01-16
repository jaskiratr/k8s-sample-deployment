<template lang='pug'>
section.container
  div
    logo
    h1.title nuxt-app
    h2.subtitle Strapi-Nuxt
    .links
      a.button--green(href='https://nuxtjs.org/' target='_blank') Documentation
      a.button--grey(href='https://github.com/nuxt/nuxt.js' target='_blank') GitHub
    p {{posts}}
</template>

<script>
// import axios from 'axios'
import Logo from '~/components/Logo.vue'
import { mapGetters } from 'vuex'
export default {
  // async fetch({ store }) {
  //   console.log('ASYNC')
  //   await axios
  //     .get('http://localhost:8080/posts', {
  //       params: { _sort: 'createdAt:desc' }
  //     })
  //     .then(response => {
  //       console.log('Here is the list of posts: ', response.data)
  //       return null
  //     })
  //     .catch(error => {
  //       console.error('======ERROR=====', error)
  //     })
  // },
  components: {
    Logo
  },
  data() {
    return {
      // posts: []
    }
  },
  computed: {
    ...mapGetters(['posts'])
  },
  mounted() {
    console.log('created')
    this.$store.dispatch('getPosts')
    // fetch('http://nginx:8080/posts')
    //   .then(response => response.json())
    //   .then(json => {
    //     this.posts = json
    //     console.log(json)
    //   })
    // axios.defaults.withCredentials = true
    // axios
    //   .get('http://nginx:8080/posts', {
    //     params: { _sort: 'createdAt:desc' }
    //   })
    //   .then(response => {
    //     console.log('Well done, here is the list of posts: ', response.data)
    //     this.posts = response.data
    //   })
    //   .catch(error => {
    //     console.log('An error occurred:', error)
    //   })
  }
}
</script>

<style lang='sass'>
.container 
  min-height: 100vh
  display: flex
  justify-content: center
  align-items: center
  text-align: center


.title 
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif
  display: block
  font-weight: 300
  font-size: 100px
  color: #35495e
  letter-spacing: 1px


.subtitle 
  font-weight: 300
  font-size: 42px
  color: #526488
  word-spacing: 5px
  padding-bottom: 15px


.links 
  padding-top: 15px

</style>
