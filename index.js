const express = require('express');
const mysql = require('mysql');
require('dotenv').config()

const app = express();


const db = mysql.createConnection({
    host: 'localhost',
    user:process.env.user,
    password: process.env.password,
})

app.listen(5000, () => console.log('Server Started'))