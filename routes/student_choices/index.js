const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();

// Post student choice
router.post('/students/application', (req, res) => {
  const formData = req.body;
  connection.query(
    `INSERT INTO application SET ?`,
    formData,
    (err, results) => {
      if (err) {
        res.send('Erreur lors de la sauvegarde des données').status(500);
      } else {
        res.json(results);
      }
    }
  );
});

// Get all student choices

router.get('/students/application/:id', (req, res) => {
  const studentId = req.params.id;
  const query = `SELECT 
  first_name, last_name, speciality_name, school_name
  FROM
  student
      INNER JOIN
  application ON application.student_id = student.id
      INNER JOIN
  speciality ON speciality.id = application.speciality_id
      INNER JOIN
  school ON school.id = application.school_id
WHERE
  student.id = ${studentId}`;
  connection.query(query, (err, results) => {
    if (err) {
      res
        .send("Erreur lors de la récupération des infos de l'étudiant")
        .status(500);
    } else {
      res.json(results);
    }
  });
});

module.exports = router;
