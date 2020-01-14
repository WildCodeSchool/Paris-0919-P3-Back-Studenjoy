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

module.exports = router;
