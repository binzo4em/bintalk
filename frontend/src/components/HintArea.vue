<template>
  <div>
    <div>
      [힌트]
    </div>
    <div>
      {{ hint }}
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  data () {
    return {
      hint: ''
    }
  },
  created () {
    if (this.showHint) {
      this.hint = `"${this.engDatas.hint}"`
    }
  },
  computed: {
    ...mapState('english', [
      'engDatas',
      'showHint'
    ])
  }
}
</script>

<style>

</style>
