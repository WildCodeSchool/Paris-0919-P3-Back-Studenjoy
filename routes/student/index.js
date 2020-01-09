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
  // Vérifier si ce qu'on veut modifier existe dans la table
  const updates = Object.keys(req.body);
  // Je n'ai que ces deux valeurs pour le moment dans ma table, on pourra rajouter les autres après
  const allowedUpdates = ['first_name', 'last_name'];
  const isValidOperation = updates.every(update =>
    allowedUpdates.includes(update)
  );
  // Si on veut mettre à jour une donnée qui n'existe pas dans la table, on aura un message d'erreur
  if (!isValidOperation) {
    return res.status(400).send({ error: 'Invalid updates' });
  }
  const values = Object.values(req.body);
  values.push(req.params.id);
  const setValues = updates
    .map((elt, i) => (i !== updates.length - 1 ? `${elt} = ?,` : `${elt} = ?`))
    .join('');
  connection.query(
    `UPDATE student SET ${setValues}  WHERE id = ?`,
    values,
    (err, results) => {
      if (err) {
        res.send(err).status(500);
      } else {
        res.json(results);
      }
    }
  );
});

module.exports = router;
