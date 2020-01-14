const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();

// Post student choice
router.post('/students/choices/:id', (req, res) => {
  const idStudent = req.params.id;
  const formData = req.body;
  connection.query(
    `INSERT INTO application SET ?`,
    formData,
    (err, results) => {
      if (err) {
        res.send('Erreur lors de la sauvegarde des données').status(500);
      } else {
        console.log(formData);

        res.json(results);
      }
    }
  );
});
