const express = require("express");
const connection = require('../../helpers/db');
const router = express.Router();
const multer = require("multer");
const upload = multer({ dest: "public/" });
const fs = require("fs");


// Routes

router.post("/students/documents/:id", upload.array("file"), (req, res, next) => {
  req.files.map(file => {
    let Timestamp = Math.round(new Date().getTime() / 1000)
    let FileName = file.originalname
    let regex1 = /\’\”/gi;
    let NewFileName = FileName.replace(regex1,"").split(" ").join("").toLowerCase()
    console.log('name', FileName)
    console.log('newname', NewFileName)
    
    fs.rename(file.path, "public/" + file.originalname, err => {
      if (err) {
        console.log(err)
        return res.send("Problem during travel").status(500);
      } else {
        const objectFile = {
          doc_name : "public/" + file.originalname
        }
        connection.query("INSERT INTO doc_type SET ?", objectFile, err => {
          if (err) {
            console.log(err)
            return res.send("Error ocurred").status(500);
          }
        })
      }
    })
  })
  return res.send("Files uploaded sucessfully").status(200);
});












 router.post('/students/documents/:id', upload.array("file"), (req, res, next) => {
  // ici je récupère mes files 
  const files = req.files;
  const objectFile = ''
  // Je boucle sur tous les files pour changer leur nom et les placer dans le dossier public

  files.map(file => {
    fs.rename(file.path, "public/" + file.originalName, err => {
      if(err) {
        console.log(err)
        return res.send('Problem during rename').status(500);
      } else {
        const objectFile = {doc_name : "public/" + file.originalName}
      }
      connection.query("INSERT INTO doc_type SET ?", objectFile, err => {
        if(err) {
          console.log(err)
          return res.send('Error during uploading').status(500);
        }
      })
    })
    
  })
  return res.send('Success').status(200)
 })
   
//  router.put('/students/documents/:id', (req, res)=>{
//    const formData = req.body;
//    connection.query(`UPDATE docs_types SET ?`, formData, (err, results)=> {
//      if(err){
//        res.send('Erreur lors du telechagement de fichier').status(500);
//      }else{
//        res.send('le fichier a bien été télécharger').status(200)
//        console.log(results);
       
//      }

//    });
//  })
//  router.delete('/students/documents/: id', (req, res)=>{
//    const formData = req.body;
//    connection.query(`DELETE FROM docs_types SET ?`, formData, (err, results) => {
//      if(err){
//        res.send('Erreur lors de le suppression du fichier').status(500);
//      }else{
//        res.send('Le fichier a bien été supprimé').status(200)
       
//      }
//    })
//  })
 
  
module.exports = router;
 