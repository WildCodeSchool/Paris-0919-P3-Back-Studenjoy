-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: studen_test
-- ------------------------------------------------------
-- Server version	5.7.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `student_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `speciality_id` int(11) NOT NULL,
  KEY `student_id` (`student_id`),
  KEY `school_id` (`school_id`),
  KEY `speciality_id` (`speciality_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `application_ibfk_3` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,1,1),(1,4,1),(1,4,4),(2,4,4),(2,1,2),(4,2,3),(4,1,2);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_admin`
--

DROP TABLE IF EXISTS `doc_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_name` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `doc_admin_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_admin`
--

LOCK TABLES `doc_admin` WRITE;
/*!40000 ALTER TABLE `doc_admin` DISABLE KEYS */;
INSERT INTO `doc_admin` VALUES (1,'http://tennesseeledger.com/wp-content/uploads/2018/12/Masters.jpg',3),(2,'https://www.passeport.ma/images/passeport.png',2),(3,'https://consulat-creteil-algerie.fr/wp-content/uploads/2018/01/Passeport.png',2),(4,'http://lucadeparis.free.fr/copywrong/lutonadio/gedeon_lutonadio_cni.jpg',1);
/*!40000 ALTER TABLE `doc_admin` ENABLE KEYS */;
UNLOCK TABLES;

--


--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `school_address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_name` (`school_name`),
  UNIQUE KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Universités de l\'académie d\'Aix-Marseille','Marseille','marseille@gmail.com','5 Avenue de la victoire','04 91 39 65 00'),(2,'Universités de l\'académie de Bordeaux','Bordeaux','bordeaux@gmail.com','351 cours de la Libération','05 40 00 60 00'),(3,'Universités de l\'académie de Lyon','Lyon','lyon@gmail.com','43 boulevard du 11 novembre 1918','04.72.43.15.77'),(4,'Université Paris Dauphine','Paris','paris-dauphine@gmail.com','Place du Maréchal de-Lattre-de-Tassigny','01 44 05 44 05');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_speciality`
--

DROP TABLE IF EXISTS `school_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_speciality` (
  `speciality_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  KEY `speciality_id` (`speciality_id`),
  KEY `school_id` (`school_id`),
  CONSTRAINT `school_speciality_ibfk_1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`),
  CONSTRAINT `school_speciality_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_speciality`
--

LOCK TABLES `school_speciality` WRITE;
/*!40000 ALTER TABLE `school_speciality` DISABLE KEYS */;
INSERT INTO `school_speciality` VALUES (1,1),(2,1),(1,4),(4,4),(4,2),(3,2);
/*!40000 ALTER TABLE `school_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciality`
--

DROP TABLE IF EXISTS `speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `speciality_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciality`
--

LOCK TABLES `speciality` WRITE;
/*!40000 ALTER TABLE `speciality` DISABLE KEYS */;
INSERT INTO `speciality` VALUES (1,'economy'),(2,'math'),(3,'foreign language'),(4,'computer science'),(5,'data science');
/*!40000 ALTER TABLE `speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `student_password` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `status_profile` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `school` varchar(255) DEFAULT NULL,
  `speciality` varchar(255) DEFAULT NULL,
  `picture` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Jule','Corea','jule@gmail.com','mascculin','0707070707','cestmoijule','2005-12-20',0,'2020-01-12 18:21:12',NULL,NULL,NULL),(2,'Julie','Smith','julie@gmail.com','feminin','0723140707','cestmoijulie','2002-05-20',0,'2020-01-12 18:21:12',NULL,NULL,NULL),(3,'Paul','Becky','paul@gmail.com','mascculin','0707078765','cestmoipaul','2000-11-10',0,'2020-01-12 18:21:12',NULL,NULL,NULL),(4,'Bob','Dylan','bob@gmail.com','mascculin','0708775789','cestmoibob','2003-09-17',0,'2020-01-12 18:21:12',NULL,NULL,NULL),(5,'Ibra','Niass','ibra@gmail.com','masculin','0758325825','facile','1999-08-17',0,'2020-01-12 21:09:28',NULL,NULL,NULL),(6,'Louise','Corea','louise@gmail.com','féminin','0756545825','noway','1996-04-11',0,'2020-01-12 21:15:38',NULL,NULL,NULL),(8,'Silvia','Dacosta','silvia@gmail.com','féminin','0756005825','guessit','1994-09-21',0,'2020-01-12 22:09:23',NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-13  0:41:58
