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
  const id = req.id;
  console.log('id', id);
  // console.log('req.id', req.id);
  const query = `SELECT 
  first_name, last_name, speciality_name, school_name, school_address,school.id as school_id, speciality.id as speciality_id, school.city, school.phone, school.email
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

// Delete specific student choice 
router.delete('/students/application', auth, (req, res) => {
  console.log("req.body",req)
  const schoolId = req.body.school_id;
  const specialityId = req.body.speciality_id;
  const query = `DELETE
  FROM
    application
  WHERE
    school_id = ${schoolId} 
    AND
    speciality_id= ${specialityId}
    AND
    student_id= ${req.id}
  `;
  // console.log('req.id', req.id);
  connection.query(query, (err, results) => {
    if (err) {
      res
        .send(err)
        .status(500);
    } else {
      res
        .json(results)
        .send(req.body)
    }
  });
});


module.exports = router;
