const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();
const auth = require('../../middlewares/auth');

// Post student choice
router.post('/students/application', auth, (req, res) => {
  const formData = req.body;
  const schoolId = req.body.school_id;
  const specialityId = req.body.speciality_id;
  const query = `SELECT
  *
  FROM
    application
  WHERE
    school_id = ${schoolId} 
    and
    speciality_id=${specialityId}
    and
    student_id=${req.id}
  `;
  connection.query(query, formData, (err, results) => {
    if (err) {
      res.status(500).send(err);
    } else {
      if (results.length) {
        return res.status(500).send('Cette candidature existe déjà');
      }
      connection.query(
        `INSERT INTO application SET ?`,
        formData,
        (err, results) => {
          if (err) {
            res.status(500).send(err);
          } else {
            res.json(results);
          }
        }
      );
    }
  });
});

// Get all student choices

router.get('/students/application', auth, (req, res) => {
  const studentId = req.params.id;
  const id = req.id;
  console.log('id', id);
  // console.log('req.id', req.id);
  const query = `SELECT 
  first_name, last_name, speciality_name, school_name, school_address, school.city, school.phone, school.email
  FROM
  student
      INNER JOIN
  application ON application.student_id = student.id
      INNER JOIN
  speciality ON speciality.id = application.speciality_id
      INNER JOIN
  school ON school.id = application.school_id
WHERE
  student.id = ${id}`;
  connection.query(query, (err, results) => {
    if (err) {
      res
        .send(
          err
        )
        .status(500);
    } else {
      res.json(results);
    }
  });
});

module.exports = router;
