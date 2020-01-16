const express = require('express');
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');
const studentRouter = require('./routes/student');
const choicesRouter = require('./routes/student_choices');
const searchRouter = require('./routes/school-search');
const connection = require('./helpers/db'); //CONNECTION TO DATABASE
const port = process.env.PORT;
// const util = require('util');

app.use(cors());
app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true
  })
);
app.use(studentRouter);
app.use(choicesRouter);
app.use(searchRouter);

app.listen(port, err => {
  if (err) {
    throw new Error('Something bad happened...');
  }
  console.log(`Server is listening on ${port}`);
});
