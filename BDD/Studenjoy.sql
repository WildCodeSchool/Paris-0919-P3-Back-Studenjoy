-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: Studenjoy
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `Doc_Admin`
--

DROP TABLE IF EXISTS `Doc_Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doc_Admin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `update_date` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doc_Admin`
--

LOCK TABLES `Doc_Admin` WRITE;
/*!40000 ALTER TABLE `Doc_Admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Doc_Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Docs_Types`
--

DROP TABLE IF EXISTS `Docs_Types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Docs_Types` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Docs_Types`
--

LOCK TABLES `Docs_Types` WRITE;
/*!40000 ALTER TABLE `Docs_Types` DISABLE KEYS */;
/*!40000 ALTER TABLE `Docs_Types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schools`
--

DROP TABLE IF EXISTS `Schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schools` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `country` varchar(150) NOT NULL,
  `adress` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schools`
--

LOCK TABLES `Schools` WRITE;
/*!40000 ALTER TABLE `Schools` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schools_has_Speciality`
--

DROP TABLE IF EXISTS `Schools_has_Speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schools_has_Speciality` (
  `Schools_id` int(11) DEFAULT NULL,
  `Speciality_id` int(11) DEFAULT NULL,
  KEY `Schools_id` (`Schools_id`),
  KEY `Speciality_id` (`Speciality_id`),
  CONSTRAINT `Schools_has_Speciality_ibfk_1` FOREIGN KEY (`Schools_id`) REFERENCES `Schools` (`ID`),
  CONSTRAINT `Schools_has_Speciality_ibfk_2` FOREIGN KEY (`Speciality_id`) REFERENCES `Speciality` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schools_has_Speciality`
--

LOCK TABLES `Schools_has_Speciality` WRITE;
/*!40000 ALTER TABLE `Schools_has_Speciality` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schools_has_Speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Speciality`
--

DROP TABLE IF EXISTS `Speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Speciality` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Speciality`
--

LOCK TABLES `Speciality` WRITE;
/*!40000 ALTER TABLE `Speciality` DISABLE KEYS */;
/*!40000 ALTER TABLE `Speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `status_profil` tinyint(1) DEFAULT '0',
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_has_Speciality`
--

DROP TABLE IF EXISTS `Student_has_Speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_has_Speciality` (
  `Student_id` int(11) DEFAULT NULL,
  `Speciality_id` int(11) DEFAULT NULL,
  KEY `Student_id` (`Student_id`),
  KEY `Speciality_id` (`Speciality_id`),
  CONSTRAINT `Student_has_Speciality_ibfk_1` FOREIGN KEY (`Student_id`) REFERENCES `Student` (`ID`),
  CONSTRAINT `Student_has_Speciality_ibfk_2` FOREIGN KEY (`Speciality_id`) REFERENCES `Speciality` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_has_Speciality`
--

LOCK TABLES `Student_has_Speciality` WRITE;
/*!40000 ALTER TABLE `Student_has_Speciality` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student_has_Speciality` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-17 17:37:58
