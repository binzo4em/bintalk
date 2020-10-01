<template>
    <div class="inner clearfix">

        <div class="icon-group float--left">
            <div class="logo">
                <a href="#">GitHub</a>
            </div>
            <div class="sound" v-bind:class="{ soundOff: !soundOn }" v-on:click="toggleSoundImage">

            </div>
        </div>
        
        <div class="menu-group float--left">
            <ul class="main-menu toggle">
                <li><a href="#">Personal</a></li>
                <li><a href="#">Open source</a></li>
                <li><a href="#">Business</a></li>
                <li><a href="#">Explore</a></li>
            </ul>
        </div>

        <div class="sign-group float--right toggle">
            <div class="btn-group">
                <a href="#" class="btn sign-in">Sign in</a>
                <a href="#" class="btn btn--primary sign-up">Sign up</a>
            </div>
            <form id="search-form" method="post" action="">
                <input type="text" id="search" class="input--text" placeholder="Search GitHub">
                <input type="submit" value="Submit">
            </form>
            <ul class="sub-menu">
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Support</a></li>
            </ul>
        </div>

        <div id="toggle-btn" v-on:click="toggleElements">Header Menu Toggle Button</div>

    </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex'

export default {
    data() {
        return {
            toggles: ''
        }
    },
    mounted() {
        this.toggles = document.querySelectorAll('.toggle')

        // window : 브라우저를 의미, resize : 브라우저 크기가 늘어나가 줄어들 때 발생하는 이벤트
        window.addEventListener('resize', this.offElements);
    },
    computed: {
        ...mapState('options', [
            'soundOn'
        ])
    },
    methods: {
        ...mapMutations('options', [
            'setSoundOn'
        ]),
        toggleSoundImage() {
            this.setSoundOn(!this.soundOn);
            //this.soundOn = !this.soundOn;
        },
        toggleElements() {
            // toggles를 반복 실행하면서 실행할 함수를 정의
            [].forEach.call(this.toggles, function (toggle) {
                // class=""에 on을 추가
                toggle.classList.toggle('on')
            })
        },
        offElements() {
            if(window.innerWidth > 1024) {
                [].forEach.call(this.toggles, function (toggle) {
                    // class=""에 on을 추가
                    toggle.classList.remove('on')
                })
            }
        }
    }
}
</script>