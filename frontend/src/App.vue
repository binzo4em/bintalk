<template>
  <v-app>
    <div class="body__container">

    <!-- HEADER -->
    <header class="section">
      HEADER
    </header>

    <!-- SETTING AREA -->
    <section class="section section--setting">
      <SettingArea/>
    </section>

    <!-- CONTENT AREA -->
    <section class="section section--content">
      <ContentArea/>
    </section>

    <!-- HINT AREA -->
    <section v-if="showHint" class="section section--hint">
      <HintArea/>
    </section>

    <!-- INPUT AREA -->
    <section class="section section--input">
      <InputArea/>
    </section>

    <!-- FOOTER -->
    <footer class="section">
      FOOTER
    </footer>

  </div>
  </v-app>
</template>

<script>
import SettingArea from '@/components/SettingArea'
import ContentArea from '@/components/ContentArea'
import HintArea from '@/components/HintArea'
import InputArea from '@/components/InputArea'
import { mapState } from 'vuex'

export default {
  name: 'App',

  components: {
    SettingArea,
    ContentArea,
    HintArea,
    InputArea
  },
  computed: {
    ...mapState('english', [
      'showHint'
    ]),
  }
}
</script>

<style lang="scss">
@charset "UTF-8";
// 공통 적용
.body__container {
    font-size: 16px;
    font-family: 'Roboto', sans-serif;
    font-weight: 400;
    color: #333; /* 글자 색상 */
}
.section {
  border: 1px solid grey;
  margin-top: 10px;
}
.section .section--content{
  display: block;
}
header {
  color: red;
}
footer {
  color: red;
}
</style>