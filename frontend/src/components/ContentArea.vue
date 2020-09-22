<template>
  <div>
    <div class="text-center">
      <v-chip
        class="ma-2"
        color="primary"
        text-color="white"
      >
        <v-avatar left>
          <v-icon>mdi-account-circle</v-icon>
        </v-avatar>
        {{ question }}
      </v-chip>
    </div>

    <div v-if="showAnswer" class="resultArea text-center">
      <div>
        [입력] {{ myAnswer }}
      </div>
      <div>
        [정답] {{ correctAnswer }}
      </div>
    </div>

    <div v-if="showEffect" class="resultEffect text-center">
      Perfect!!
    </div>

  </div>
</template>

<script>
import { mapActions, mapMutations, mapState } from 'vuex'
import axios from 'axios'

const uri = '/api/getRandomQuestion'

export default {
  data() {
    return {
      answer: '',
    }
  },
  created () {
    this.getRandomQuestion()
  },
  computed: {
    ...mapState('english', [
      'engDatas',
      'showAnswer',
      'showEffect',
      'myAnswer',
      'correctAnswer'
    ]),
    question: {
      get () {
        return this.engDatas.question
      }
    },
  },
  methods: {
    ...mapMutations('english', [
      'setEngDatas'
    ]),
    ...mapActions('english', [
      'getRandomQuestion'
    ])
  }
}
</script>

<style lang="scss">
.content-area {
  display: block;
}
</style>
