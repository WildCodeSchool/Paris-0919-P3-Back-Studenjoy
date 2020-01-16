const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();

// GET schools selon speciality et/ou ville et/ou school name

router.get('/results', (req, res) => {
  if (request.query.speciality && request.query.school && request.query.city) {
    const query = `SELECT 
    *
FROM
    school as sco
        JOIN
    school_speciality scos ON sco.id = scos.school_id
        JOIN
    speciality as spe ON spe.id = scos.speciality_id
 WHERE
    speciality_name = "economy"
    AND (school_name = "Universités de l'académie d'Aix-Marseille")
    AND (city = 'Marseille')`;

    connection.query(query, (err, results) => {
      if (err) {
        res
          .send('Erreur lors de la récupération de la liste des étudiants')
          .status(500);
      } else {
        console.log(results);
        res.json(results);
      }
    });
  }
});

module.exports = router;
