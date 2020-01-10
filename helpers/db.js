const mysql = require('mysql');

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PWD, // INSERT YOUR PASSWORD HERE
  database: process.env.DB_NAME // INSERT YOUR DATABASE NAME HERE
});

module.exports = connection;
