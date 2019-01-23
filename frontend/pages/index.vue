<template lang='pug'>
section.container
  div
    h1.title Postmate
    h2.subtitle Frontend service
    div(v-if='posts')
      div.post(v-for='post in posts')
        h2 {{post.title}}
        VueMarkdown {{post.content}}
        .date Created at: {{post.createdAt}}
        .date Updated at: {{post.updatedAt}}
</template>

<script>
import { mapGetters } from 'vuex'
import VueMarkdown from 'vue-markdown'
export default {
  components: {
    VueMarkdown
  },
  data() {
    return {}
  },
  computed: {
    ...mapGetters(['posts'])
  },
  beforeCreate() {
    this.$store.dispatch('getPosts')
  }
}
</script>

<style lang='sass'>
.container 
  min-height: 100vh
  display: flex
  justify-content: center
  align-items: center
  max-width: 1000px
  margin: auto
  padding: 0em 2em

.title 
  font-family: 'Quicksand', 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif
  display: block
  font-weight: 300
  font-size: 4em
  color: #35495e
  letter-spacing: 1px
  padding-top: 0.5em

.subtitle 
  font-weight: 300
  font-size: 3em
  color: #526488
  word-spacing: 5px
  padding-bottom: 1em

.post
  padding: 3em 0em
  border-top: 1px dotted grey
  p
    padding: 1em 0em
  img
    width: 100%

.date
  color: lightgrey
  float: right
  padding-right: 1em
  font-size: smaller

</style>
