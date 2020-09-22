<template>
    <div class="settingArea">
        <v-sheet class="pa-5">
            <v-switch v-model="checked" color="info" inset :label="`소리 끄기`"></v-switch>
        </v-sheet>
    </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'

export default {
  computed: {
    ...mapState('english', [
      'soundOff'
    ]),
    checked: {
      get () {
        return this.soundOff
      },
      set (checked) {
        this.setSoundOff(checked)
      }
    }
  },
  methods: {
    ...mapMutations('english', [
      'setSoundOff'
    ])
  }
}
</script>

<style lang="scss">
.settingArea {
    width: 200px;
    margin: 0 auto;
}
</style>
