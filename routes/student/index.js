const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();
const cors = require('cors');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const auth = require('../../middlewares/auth');

// router.get('/students', auth, (req, res) => {
//   connection.query(`SELECT * FROM student`, (err, results) => {
//     if (err) {
//       res
//         .send('Erreur lors de la récupération de la liste des étudiants test')
//         .status(500);
//     } else {
//       console.log(req.id);
//       res.json(results);
//     }
//   });
// });

// POST student infos

router.post('/students', auth, (req, res) => {
  const formData = req.body;
  connection.query(`INSERT INTO student SET ?`, formData, (err, results) => {
    if (err) {
      res.send('Erreur lors de la sauvegarde des données').status(500);
    } else {
      console.log(formData);

      res.status(201).json(results);
    }
  });
});

// GET student infos

//afficher les information d'un élève'
router.get('/students/', auth, (req, res) => {
  connection.query(
    `SELECT * FROM student WHERE id=${req.id}`,
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

router.put('/students/', auth, (req, res) => {
  const idStudent = req.id;
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

router.delete('/students/', auth, (req, res) => {
  const idStudent = req.id;

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
router.get('/students/documents/:id', auth, (req, res) => {
  const studentId = req.id;
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

// DELETE student school choice

router.delete('/students/:schoolid/:specialityid', auth, (req, res) => {
  const idStudent = req.id;
  const idSchool = req.params.schoolid;
  const idSpeciality = req.params.specialityid;

  connection.query(
    `DELETE FROM application WHERE student_id = ${idStudent} AND school_id = ${idSchool} AND speciality_id = ${idSpeciality}`,
    err => {
      if (err) {
        // If an error has occurred, then the user is informed of the error
        console.log(err);
        res.status(500).send("Error deleting student's info");
      } else {
        // If everything went well, we send a status "ok".
        res.sendStatus(200);
      }
    }
  );
});

// SignIn

router.post('/signin', (req, res) => {
  const email = req.body.email;
  const password = req.body.student_password;
  connection.query(
    `SELECT * FROM student WHERE email='${email}'`,
    (err, results) => {
      if (results[0]) {
        const storedPassword = results[0].student_password;
        bcrypt.compare(password, storedPassword, function(err, isMatch) {
          if (err) {
            console.log(err);
            res.json(err);
          } else if (isMatch) {
            console.log('Logged', results[0].id);
            jwt.sign(
              { id: results[0].id },
              process.env.JWT_SECRET,
              { expiresIn: '10h' },
              (err, token) => {
                res.json({
                  token
                });
              }
            );
            // res.json(results[0]);
          } else {
            console.log("message: 'password does not match'");
            res.sendStatus(403);
          }
        });
      } else {
        res.json(results);
      }
    }
  );
});

// SIGNUP

router.post('/signup', (req, res) => {
  const formData = req.body;
  const email = req.body.email;
  connection.query(
    `SELECT * FROM student WHERE email='${email}'`,
    (err, results) => {
      if (!results[0]) {
        bcrypt.hash(req.body.student_password, 10, function(err, hash) {
          formData.student_password = hash;
          connection.query(
            `INSERT INTO student SET ?`,
            formData,
            (err, results) => {
              if (err) {
                console.log('err', err);
                res
                  .status(500)
                  .send('Erreur lors de la sauvegarde des données');
              } else {
                console.log('cool');
                jwt.sign(
                  { id: results.insertId },
                  process.env.JWT_SECRET,
                  { expiresIn: '10h' },
                  (err, token) => {
                    res.json({
                      token,
                      results
                    });
                  }
                );
              }
            }
          );
          console.log(formData);
        });
      } else {
        res.json(results);
      }
    }
  );
});

module.exports = router;
