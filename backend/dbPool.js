const mariadb = require('mariadb')

const pool = mariadb.createPool({
    host: process.env.MYSQL_HOST, 
    port: process.env.MYSQL_PORT,
    user: process.env.MYSQL_USER, 
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    connectionLimit: 5
});
 
async function GetTestSentence(){
    let conn, rows;
    try{
        conn = await pool.getConnection();
        //conn.query('USE english_training');
        rows = await conn.query('SELECT * FROM test_pattern');
    }
    catch(err){
        throw err;
    }
    finally{
        if (conn) conn.end();
        return rows[0];
    }
}

async function GetRandomQuestion() {
    let conn, rows;
    try{
        console.log('GetRandomQuestion is called')
        conn = await pool.getConnection();
        rows = await conn.query("show tables like 'tb%'");
        // 0 ~ 테이블 총 개수 사이의 정수 난수 생성
        // Math.random() : 0이상 1미만의 난수 생성, Math.floor() : 소수점 버림
        const randomIndex = Math.floor(Math.random() * (rows.length));
        const key = Object.keys(rows[randomIndex])[0];
        const tableName = rows[randomIndex][key];

        rows = await conn.query(`SELECT * FROM ${tableName}`);
    }
    catch(err){
        throw err;
    }
    finally{
        if (conn) conn.end();
        return rows[0];
    }
}
 
module.exports = {
    GetTestSentence,
    GetRandomQuestion
}
