<template>
  <div class="inner">
    <div class="summary">
        <h2 class="summary__title" ref="mainH2Tag">
            {{ mainText }}
        </h2>
        <p class="summary__description">
            {{ subText }}
        </p>
    </div>

    <div class="input-group">
      <ul>
        <li>
          <input 
            type="text" 
            class="input--text" 
            placeholder="영어 문장을 입력하세요"
            ref="inputText"
            v-on:keypress.enter="getCorrectAnswer"
            v-on:input="bindText" 
            label="영어 문장을 입력하세요"
            >
        </li>
        <!-- <li><button class="btn btn--transparent" v-on:click="getCorrectAnswer">정답 확인</button></li>
        <li><button class="btn btn--transparent" v-on:click="showHint">힌트 보기</button></li>
        <li><button class="btn btn--transparent" v-on:click="refresh">갱신 하기</button></li> -->
        <li><a href="#" class="btn btn--transparent" v-on:click="getCorrectAnswer">정답 확인</a></li>
        <li><a href="#" class="btn btn--transparent" v-on:click="showHint">힌트 보기</a></li>
        <li><a href="#" class="btn btn--transparent" v-on:click="refresh">갱신 하기</a></li>
      </ul>
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
      defaultSubText: '위 한국어를 영어로 작성해 보세요.',
      defaultWarnText: '영어 문장을 입력하세요!',
      subText: '위 한국어를 영어로 작성해 보세요.',
      audio: new Audio(require('@/assets/audio/yeah.mp3')),
      isCorrect: false
    }
  },
  created() {
    this.getRandomQuestion();
  },
  mounted() {
    this.$refs.inputText.focus();
  },
  computed: {
    ...mapState('english', [
      'engDatas',
      'mainText'
    ]),
    ...mapState('options', [
      'soundOn'
    ])
  },
  methods: {
    ...mapMutations('english', [
      'setEngDatas',
      'setMainText',
    ]),
    ...mapActions('english', [
      'getRandomQuestion'
    ]),
    bindText(event) {
      if(event.target.value.length == 0) {
        this.subText = this.defaultSubText;
      }else {
        this.subText = event.target.value;
      }
    },
    getCorrectAnswer() {
      const inputText = this.$refs.inputText.value;
      if (inputText.length == 0) {
        this.subText = this.defaultWarnText;
        this.$refs.inputText.focus();
        return;
      }

      this.setMainText(this.engDatas.answer_1);

      if (inputText !== '') {
        // .(마침표) 공백으로 변경, trim으로 앞뒤 공백 잘라내기
        if (inputText.replace('.', '').trim() === this.engDatas.answer_1.replace('.', '').trim()) {
          this.isCorrect = true;
          this.$refs.mainH2Tag.style.color = 'yellow';

          if (this.soundOn) {
            this.audio.volume = 0.5;
            this.audio.play();
          }
        }else {
          this.$refs.mainH2Tag.style.color = 'red';
        }
      }

      this.$refs.inputText.focus();
    },
    showHint() {
      this.subText = `"${this.engDatas.hint}"`;
      this.$refs.inputText.focus();
    },
    refresh() {
      this.subText = this.defaultSubText;
      this.getRandomQuestion();
      this.$refs.inputText.value = '';
      this.$refs.inputText.focus();
      this.$refs.mainH2Tag.style.color = '#fff';
      this.isCorrect = false;
    }
  }
}
</script>

<style lang="scss">

</style>
