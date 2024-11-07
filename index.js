const express = require('express');
const mysql = require('mysql');
require('dotenv').config()

const app = express();


const db = mysql.createConnection({
    host: 'localhost',
    user:process.env.user,
    password: process.env.password,
    database:"acme"
})

db.connect();

app.get('/users', (req,res)=>{
    const sql = "SELECT * FROM users";
    db.query(sql,(err, result)=>{
        if(err) throw err;
        res.send(result)
    })
})

app.listen(5000, () => console.log('Server Started'))