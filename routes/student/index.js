const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();

router.get('/students', (req, res) => {
  connection.query(`SELECT * FROM student`, (err, results) => {
    if (err) {
      res
        .send('Erreur lors de la récupération de la liste des étudiants')
        .status(500);
    } else {
      res.json(results);
    }
  });
});

// GET student infos

//afficher les information d'un élève'
router.get('/students/:id', (req, res) => {
  connection.query(
    `SELECT * FROM student WHERE id=${req.params.id}`,
    (err, results) => {
      if (err) {
        res
          .send("Erreur lors de la récupération des infos de l'étudiant")
          .status(500);
      } else {
        res.json(results);
      }
    }
  );
});

// UPDATE student infos

router.put('/students/:id', (req, res) => {
  const idStudent = req.params.id;
  const formData = req.body;
  connection.query(
    'UPDATE student SET ? WHERE id = ?',
    [formData, idStudent],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status(500).send('Erreur lors de la modification des données');
      } else {
        res.json(results);
      }
    }
  );
});

module.exports = router;
