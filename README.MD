# Node.js Version
- v12.16.2

## 2020.10.01 (목) - 3번째 수정
## 작업 내역
- 시작 시 input에 포커스 설정

## 2020.10.01 (목) - 2번째 수정
## 작업 내역
- 정답 확인, 힌트 보기, 갱신 하기 버튼을 a 태그로 변경
- 정답 확인 시 input 창으로 포커스

## 2020.10.01 (목) - 정리
## 작업 내역
- Vuetify 제거
- HTML, CSS 가이드 라인 적용

## 2020.09.22 (화) - 정리
## 작업 내역
- vuetify 초기 적용

## 2020.09.09 (수) - 정리
## 작업 내역
- github 저장소 이름 Speak-Korean-To-English 로 변경
- 작업 폴더의 set-frontend, set-backend 이름을 skte-로 변경
- 힌트 가져오기 기능 추가
- 소리 끄기, 켜기 기능 추가

## 2020.09.08 (화) - 정리
## 작업 내역
- getRandomQuestion()을 english 스토어의 actions 부분에 구현
- 입력과 정답이 동일한 경우 사운드 재생

## 2020.09.03 (목) - 정리
## 작업 내역
- 웹 페이지 접속 시 API 서버에서 랜덤하게 질문과 정답을 받아와서 웹 페이지에 출력한다.
- .env에 개발 시 사용할 HOST와 PORT 정의

## .env 사용법
환경변수 파일들이 있다.
패키징 환경(개발 or 배포)에 따라 특정 변수를 다르게 사용할 수 있다.

.env는 모든 환경에서 적용되고
.env.development 는 개발 패키징 환경에서,
.env.production 은 배포 패키징 환경에서 적용된다

vue-cli-service serve 커맨드 사용 시 -> 환경변수들이 development 모드로 로드
vue-cli-service build 커맨드 사용 시 -> 환경변수들이 production 모드로 로드

  "scripts": {
    "dev": "vue-cli-service serve --mode development",
  },

.env.development를 사용하기 위해서는 --mode development를 사용해야 한다.
-> 다시 테스트 결과 --mode development 안해도 됨

.env.development 파일에는 VUE_APP_파라미터이름 = 값 형태로 작성해야 한다.
예)
VUE_APP_BACKEND_HOST="http://localhost"

이 환경변수들은 소스코드에서 process.env 객체로 접근할 수 있다 *
예)
process.env.VUE_APP_BACKEND_HOST

프로젝트의 실행 '모드'에 따라 어떤 파일의 env variables들이 로드될지 결정된다.

# axios.get에서 주소 설정 시 사용법
아래 url 입력 부분은 한줄로 작성해야 한다. 다음줄에 이어서 작성 시 에러 발생
axios.get(`${process.env.VUE_APP_BACKEND_HOST}:${process.env.VUE_APP_BACKEND_PORT}${uri}`)


# 2020.09.02 (수) - 정리
## 작업내역
- frontend -> backend -> mariadb 샘플 연동 테스트
- 웹 페이지 접속 시 backend에 api를 요청하여 mariadb에서 샘플 데이터를 가져와 브라우저에 출력

## MariaDB 커넥터 설치
npm install --save mariadb

## Access-Control-Allow-Origin 오류
No 'Access-Control-Allow-Origin' header is present on the requested resource.
> 로컬 개발 환경에서 프론트엔드와 백엔드를 동시에 개발 시 발생

node.js에서 아래와 같이 조치

npm install --save cors

const cors = require('cors')

app.use(cors());
