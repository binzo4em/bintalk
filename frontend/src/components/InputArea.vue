<template>
  <div>
      <div v-if="showAlert" class="showAlert text-center">
        <v-alert
          v-model="showAlert"
          dense
          outlined
          type="error"
          dismissible
        >
        영어 문장을 입력하세요!
        </v-alert>
      </div>

      <div class="inputArea">
        <v-text-field 
          :rules="rules"
          v-on:keypress.enter="getCorrectAnswer"
          v-bind:value="inputAnswer" 
          label="영어 문장을 입력하세요"
        />
      </div>

      <div class="btnArea">
        <div class="text-center">
          <v-btn v-on:click="getCorrectAnswer" rounded color="info" class="btnAnswer">정답 확인</v-btn>
          <v-btn v-on:click="toggleHint" rounded color="success" class="btnAnswer">힌트 보기</v-btn>
          <v-btn v-on:click="randomQuestion" rounded color="warning">갱신 하기</v-btn>
        </div>
      </div>
  </div>
</template>

<script>
import { mapActions, mapMutations, mapState } from 'vuex'

export default {
  data () {
    return {
      inputAnswer: '',
      showAlert: false,
      audio: new Audio(require('@/assets/audio/yeah.mp3')),
      rules: [
        value => this.inputAnswer = value
      ]
    }
  },
  computed: {
    // mapState는 computed에서 사용
    // this.$store.state.english.engDats로도 사용할 수 있으나
    // 아래와 같이 간단한 형태로 사용할 수 있음
    ...mapState('english', [
      'engDatas',
      'soundOff',
      'showAnswer',
      'showEffect',
      'myAnswer',
      'correctAnswer'
    ])
  },
  methods: {
    ...mapMutations('english', [
      'setShowHint',
      'setShowAnswer',
      'setShowEffect',
      'setMyAnswer',
      'setCorrectAnswer'
    ]),
    ...mapActions('english', [
      'getRandomQuestion'
    ]),
    bindInputAnswer (event) {
      this.inputAnswer = event.target.value;
    },
    getCorrectAnswer (event) {
      if (this.inputAnswer === '') {
        this.showAlert = true;
        return
      } else {
        this.showAlert = false;
      }

      this.setShowAnswer(true);
      this.setCorrectAnswer(this.engDatas.answer_1);
      this.setMyAnswer(this.inputAnswer);

      if (this.inputAnswer !== '') {
        // .(마침표) 공백으로 변경, trim으로 앞뒤 공백 잘라내기
        if (this.inputAnswer.replace('.', '').trim() === this.engDatas.answer_1.replace('.', '').trim()) {
          this.setShowEffect(true);

          if (!this.soundOff) {
            this.audio.volume = 0.5;
            this.audio.play();
          }
        }
      }

      this.inputAnswer = ''
    },
    randomQuestion () {
      this.setShowAnswer(false);
      this.setShowEffect(false);
      this.setShowHint(false);
      this.getRandomQuestion();
      this.showAlert = false;
    },
    toggleHint () {
      this.setShowHint(true);
    }
  }
}
</script>

<style lang="scss">
.showAlert {
  margin: 10px;
}
.inputArea {
  width: 300px;
  margin: 10px auto;
}
.btnArea {
  margin: 10px;
}
.btnAnswer {
  margin-right: 10px;
}
</style>
