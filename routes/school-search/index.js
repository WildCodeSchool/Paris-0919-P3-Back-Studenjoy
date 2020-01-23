const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();

// GET schools selon speciality et/ou ville et/ou school name

router.get('/results', (req, res) => {
  const school = `(school_name = "${req.query.school}")`;
  const city = `(city = "${req.query.city}")`;
  const speciality = `speciality_name = "${req.query.speciality}"`;
  const and = 'AND';
  const query = `SELECT
  *
FROM
  school as sco
      JOIN
  school_speciality scos ON sco.id = scos.school_id
      JOIN
  speciality as spe ON spe.id = scos.speciality_id
WHERE
  ${req.query.speciality ? speciality : ''}
  ${
    (req.query.speciality && req.query.school) ||
    (req.query.speciality && req.query.city)
      ? and
      : ''
  }
  
  ${req.query.school ? school : ''}
  ${req.query.school && req.query.city && req.query.speciality ? and : ''}

  ${req.query.city ? city : ''}`;

  connection.query(query, (err, results) => {
    if (err) {
      console.log(err);
      res
        .status(500)
        .send('Erreur lors de la récupération de la liste des étudiants');
    } else {
      res.json(results);
    }
  });
});

// All school
router.get('/schools', (req, res) => {
  connection.query(`SELECT * FROM school`, (err, results) => {
    if (err) {
      res
        .status(500)
        .send('Erreur lors de la récupération de la liste des écoles');
    } else {
      console.log(results);
      res.json(results);
    }
  });
});
module.exports = router;
