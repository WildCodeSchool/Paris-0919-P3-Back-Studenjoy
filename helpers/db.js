const mysql = require('mysql');
const bdd_name = 'studen_joy';
const port = 3306;

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PWD, // INSERT YOUR PASSWORD HERE
  database: process.env.DB_NAME // INSERT YOUR DATABASE NAME HERE
});

connection.connect(function(err) {
  if (!err) {
    console.log(`## 🤙 MySQL is connected to ${bdd_name} on port ${port}`);
  } else {
    console.log('### 👎 Error connecting database', err);
  }
});

module.exports = connection;
