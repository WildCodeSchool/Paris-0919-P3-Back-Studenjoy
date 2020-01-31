const express = require('express');
const connection = require('../../helpers/db');
const router = express.Router();
const multer = require('multer');
const upload = multer({ dest: 'public/' });
const fs = require('fs');
const auth = require('../../middlewares/auth');

// Routes

router.post(
  '/students/documents/',
  upload.array('file'),
  auth,
  (req, res, next) => {
    const idStudent = req.id;
    req.files.map(file => {
      // Tu récupères le timestamp unique
      let Timestamp = Math.round(new Date().getTime() / 1000);
      // Tu recupères le nom orinal du fichier
      let FileName = file.originalname;
      // Regex pour supprimer les espaces
      let regex1 = /\’\”/gi;
      // Ici on change le nom du fichier
      let NewFileName = FileName.replace(regex1, '')
        .split(' ')
        .join('')
        .toLowerCase();

      // A partir d'ici on envoie le/les files en BDD
      // FS change le nom du fichier en y ajoutant le chemin vers dossier public
      fs.rename(file.path, 'public/' + Timestamp + file.originalname, err => {
        if (err) {
          console.log('err1', err);
          return res.send('Problem during travel').status(500);
        } else {
          // Ici on construit "l'objet" qui sera stocké en BDD
          const objectFile = {
            doc_name: 'public/' + file.originalname,
            student_id: idStudent
          };
          // Puis on insert en BDD
          connection.query(
            'INSERT INTO doc_admin SET ?',
            objectFile,
            (err, result) => {
              if (err) {
                console.log('err', err);
                return res.send('Error ocurred').status(500);
              }
            }
          );
        }
      });
    });
    return res.send('Files uploaded sucessfully').status(200);
  }
);

router.get('/students/doc/:id', (req, res) => {
  connection.query(
    'select * from doc_admin where student_id = ?',
    req.params.id,
    (err, results) => {
      if (err) {
        console.log(err);
        return res.send('Error ocurred').status(500);
      } else {
        console.log(results);
        return res.send(results).status(200);
      }
    }
  );
});

router.delete('/students/documents/:id', (req, res) => {
  connection.query(
    `DELETE FROM doc_admin WHERE student_id=${req.params.id}`,
    err => {
      if (err) {
        console.log(err);
        return res.send("N'a pas été supprimé").status(500);
      } else {
        return res.send('Files deleted sucessfully').status(200);
      }
    }
  );
});

module.exports = router;
