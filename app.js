const express = require('express');
const morgan = require('morgan')
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const studentRouter = require('./routes/student');
const uploading = require('./routes/student/uploading')
const dotenv = require('dotenv').config();
// const connection = require('./helpers/db'); //CONNECTION TO DATABASE

const port = 5000;


// const util = require('util');

app.use(cors());
app.use(morgan('dev'))
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true
  })

);


app.use(studentRouter);
app.use(uploading);
app.listen(port, err => {
  if (err) {
    throw new Error('Something bad happened...');
  }
  console.log(`Server is listening on ${port}`);
});
