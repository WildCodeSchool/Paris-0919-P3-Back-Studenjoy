DROP DATABASE IF EXISTS studen_joy;
CREATE DATABASE studen_joy;
USE studen_joy; 

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) UNIQUE NOT NULL,
    last_name VARCHAR(255) UNIQUE NOT NULL
);



CREATE TABLE school (
    id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) UNIQUE NOT NULL,
    city VARCHAR(255) UNIQUE NOT NULL
);


CREATE TABLE speciality (
  id INT AUTO_INCREMENT PRIMARY KEY,
  speciality_name VARCHAR(255) NOT NULL
);



CREATE TABLE doc_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(255) UNIQUE NOT NULL
);

-- Cette table permet éventuellement de savoit quelles sont les spécialités qui existent dans une école 
CREATE TABLE school_speciality (
  speciality_id INT NOT NULL,
  school_id INT NOT NULL,
  FOREIGN KEY(speciality_id) REFERENCES speciality(id),
  FOREIGN KEY(school_id) REFERENCES school(id)
);

-- eco id 1
-- math id 2
-- comp science id 4
-- foreign id 3
-- data science id 5
-- Paradide propose economy et math id 1 
-- Rocity propose economy et computer science id 4
-- Silver_track propose data science et foreign language id 2

INSERT INTO school_speciality (speciality_id,school_id) VALUES(1,1), (2,1), (1,4), (4,4), (4,2), (3,2);

-- Une personne peut avoir plusieurs candidatures mais une canditure est forcément liée à la fois à une école, une personne et une spécialité
CREATE TABLE application (
    student_id INT NOT NULL,
    school_id INT NOT NULL,
    speciality_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(id),
    FOREIGN KEY(school_id) REFERENCES school(id),
    FOREIGN KEY(speciality_id) REFERENCES speciality(id)
);

-- Jule choices [Paradide eco] [Rocity economy computer science] id 1
-- Julie choices [Rocity computer science] [Paradide math] id 2
-- Bob choices [Silver_track foreign language] [Paradide math] id 4


INSERT INTO application (student_id, school_id, speciality_id) 
    VALUES(1,1,1), (1,4,1), (1,4,4),
    (2,4,4), (2,1,2),
    (4,2,3), (4,1,2);


CREATE TABLE doc_admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_link VARCHAR(255) NOT NULL,
    doc_type_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY(doc_type_id) REFERENCES doc_type(id),
    FOREIGN KEY(student_id) REFERENCES student(id)
);


INSERT INTO doc_admin (doc_link, doc_type_id, student_id) 
    VALUES('http://localhost/:1',3,1),
    ('http://localhost/:3',4,2),
    ('http://localhost/:7',4,2),
    ('http://localhost/:6',2,4);




-- les différentes spécialités choisies par un élève

-- Voir les spécialités choisies par un étudiant pour chaque école 
SELECT 
    first_name, speciality_name, school_name
FROM
    student
        INNER JOIN
    application ON application.student_id = student.id
        INNER JOIN
    speciality ON speciality.id = application.speciality_id
        INNER JOIN
    school ON school.id = application.school_id;

-- Les choix de Jule
SELECT 
    first_name, speciality_name, school_name
FROM
    student
        INNER JOIN
    application ON application.student_id = student.id
        INNER JOIN
    speciality ON speciality.id = application.speciality_id
        INNER JOIN
    school ON school.id = application.school_id
WHERE
    student.id = 1;