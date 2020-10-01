<template>
  <div class="body__container">
    <!-- HEADER -->
    <header class="section">
      <Header/>
    </header>

    <!-- CONTENT AREA -->
    <section class="section section--visual">
      <ContentArea/>
    </section>

    <!-- FOOTER -->
    <footer class="section">
      <Footer/>
    </footer>
  </div>
</template>

<script>
import Header from '@/components/Header'
import ContentArea from '@/components/ContentArea'
import Footer from '@/components/Footer'
import { mapState } from 'vuex'

export default {
  name: 'App',
  components: {
    Header,
    ContentArea,
    Footer
  },
  computed: {
    ...mapState('english', [
      'showHint'
    ]),
  }
}
</script>

<style lang="scss">
@import url('./assets/css/reset.css');
@import url('./assets/css/main.css');
@import url('./assets/css/main_medium.css') screen and (max-width: 1024px);
@import url('./assets/css/main_small.css') screen and (max-width: 768px);
</style>
