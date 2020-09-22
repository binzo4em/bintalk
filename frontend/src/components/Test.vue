<template>
  <div>
      {{ msg }}
  </div>
</template>

<script>
import axios from 'axios'

const uri = '/api/test'

export default {
  data () {
    return {
      msg: ''
    }
  },
  created () {
    console.log(process.env)
    axios.get(`${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}${uri}`)
      .then(res => {
        console.log(res)
        this.msg = res.data.sentence
      })
  }
}
</script>

<style>

</style>
