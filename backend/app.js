const express = require("express");
const bodyParser = require('body-parser');
const dbPool = require('./dbPool.js');
const cors = require('cors')

//Express 서버를 생성
const app = express();

// json 형대로 오는 요청의 본문을 해석
app.use(bodyParser.json());

// 크로스 오리진 허용
app.use(cors());

app.get('/', (req, res) => {
    res.sendStatus(200);
})

app.get('/api/test', (req, res) => {
    dbPool.getTestSentence()
        .then((rows) => {
            res.status(200).send(rows)
        })
        .catch((errMsg) => {
            console.log(errMsg);
        });
})

app.get('/api/getRandomQuestion', (req, res) => {
    dbPool.GetRandomQuestion()
        .then((rows) => {
            res.status(200).send(rows);
        })
        .catch((errMsg) => {
            console.log(errMsg);
        });
})

const port = process.env.PORT || 3000;

app.listen(port, 'localhost', () => {
  console.log(`listening on ${port}`);
});
