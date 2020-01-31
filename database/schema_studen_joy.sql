DROP DATABASE IF EXISTS studen_joy;
CREATE DATABASE studen_joy;
USE studen_joy; 

CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(50) UNIQUE,
    gender VARCHAR(15),
    phone VARCHAR(50),
    student_password VARCHAR(255),
    date_of_birth DATE NOT NULL,
    status_profile tinyint(1) DEFAULT '0',  
    created_at TIMESTAMP DEFAULT NOW(),
    school VARCHAR(255),
    picture VARCHAR(255),
    speciality VARCHAR(255)
);



CREATE TABLE school (
    id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    email VARCHAR(50),
    school_address VARCHAR(50),
    phone VARCHAR(50)
);


CREATE TABLE speciality (
  id INT AUTO_INCREMENT PRIMARY KEY,
  speciality_name VARCHAR(255) NOT NULL
);

-- Une personne peut avoir plusieurs candidatures mais une canditure est forcément liée à la fois à une école, une personne et une spécialité
CREATE TABLE application (
    student_id INT NOT NULL,
    school_id INT NOT NULL,
    speciality_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(id),
    FOREIGN KEY(school_id) REFERENCES school(id),
    FOREIGN KEY(speciality_id) REFERENCES speciality(id)
);


-- Cette table permet éventuellement de savoir quelles sont les spécialités qui existent dans une école 
CREATE TABLE school_speciality (
  speciality_id INT NOT NULL,
  school_id INT NOT NULL,
  FOREIGN KEY(speciality_id) REFERENCES speciality(id),
  FOREIGN KEY(school_id) REFERENCES school(id)
);


-- CREATE TABLE doc_type (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     doc_name VARCHAR(255) UNIQUE NOT NULL
-- );


CREATE TABLE doc_admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_name VARCHAR(255) NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES student(id)
);
