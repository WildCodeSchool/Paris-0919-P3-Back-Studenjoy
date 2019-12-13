const mysql = require('mysql');

const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '', // INSERT YOUR PASSWORD HERE
  database : '' // INSERT YOUR DATABASE NAME HERE 
});

module.exports = connection;