

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
      console.log(results);
      res.json(results);
    }
  });
});

// POST student infos

router.post('/students', (req, res) => {
  const formData = req.body;
  connection.query(`INSERT INTO student SET ?`, formData, (err, results) => {
    if (err) {
      res.send('Erreur lors de la sauvegarde des données').status(500);
    } else {
      console.log(formData);

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

// DELETE student infos

router.delete('/students/:id', (req, res) => {
  const idStudent = req.params.id;

  connection.query('DELETE FROM student WHERE id = ?', [idStudent], err => {
    if (err) {
      // If an error has occurred, then the user is informed of the error
      console.log(err);
      res.status(500).send("Error deleting student's info");
    } else {
      // If everything went well, we send a status "ok".
      res.sendStatus(200);
    }
  });
});

// GET student all documents
router.get('/students/documents/:id', (req, res) => {
  const studentId = req.params.id;
  const query = `SELECT 
  first_name, last_name,doc_name, doc_link
FROM
  doc_admin as doc
      JOIN
  student ON student.id = doc.student_id
      JOIN
  doc_type ON doc_type.id = doc.doc_type_id
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

// Add more documents
// router.post('/students/documents/:id', (req, res) => {
//   const formData = req.body;
//   connection.query(`INSERT INTO doc_admin SET ?`, formData, (err, results) => {
//     if (err) {
//       res.send('Erreur lors de la sauvegarde des données').status(500);
//     } else {
//       console.log(formData);

//       res.json(results);
//     }
//   });
// });

module.exports = router;
