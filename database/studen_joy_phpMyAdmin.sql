-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 05, 2019 at 09:03 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studen_joy`
--

-- --------------------------------------------------------

--
-- Table structure for table `application`
--

CREATE TABLE `application` (
  `student_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `speciality_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `application`
--

INSERT INTO `application` (`student_id`, `school_id`, `speciality_id`) VALUES
(1, 1, 1),
(1, 4, 1),
(1, 4, 4),
(2, 4, 4),
(2, 1, 2),
(4, 2, 3),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doc_admin`
--

CREATE TABLE `doc_admin` (
  `id` int(11) NOT NULL,
  `doc_link` varchar(255) NOT NULL,
  `doc_type_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_admin`
--

INSERT INTO `doc_admin` (`id`, `doc_link`, `doc_type_id`, `student_id`) VALUES
(1, 'http://localhost/:1', 3, 1),
(2, 'http://localhost/:3', 4, 2),
(3, 'http://localhost/:7', 4, 2),
(4, 'http://localhost/:6', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `doc_type`
--

CREATE TABLE `doc_type` (
  `id` int(11) NOT NULL,
  `doc_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doc_type`
--

INSERT INTO `doc_type` (`id`, `doc_name`) VALUES
(3, 'bachelor degree'),
(1, 'identity card'),
(4, 'master degree'),
(2, 'passport');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `school_name`, `city`) VALUES
(1, 'Paradide', 'Paris'),
(2, 'Silver_track', 'Pau'),
(3, 'Medecinard', 'Strasbourg'),
(4, 'Rocity', 'Toulouse'),
(5, 'Lumineon', 'Lyon');

-- --------------------------------------------------------

--
-- Table structure for table `school_speciality`
--

CREATE TABLE `school_speciality` (
  `speciality_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_speciality`
--

INSERT INTO `school_speciality` (`speciality_id`, `school_id`) VALUES
(1, 1),
(2, 1),
(1, 4),
(4, 4),
(4, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
  `id` int(11) NOT NULL,
  `speciality_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speciality`
--

INSERT INTO `speciality` (`id`, `speciality_name`) VALUES
(1, 'economy'),
(2, 'math'),
(3, 'foreign language'),
(4, 'computer science'),
(5, 'data science');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `first_name`, `last_name`) VALUES
(1, 'Jule', 'Corea'),
(2, 'Julie', 'Smith'),
(3, 'Paul', 'Becky'),
(4, 'Bob', 'Dylan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application`
--
ALTER TABLE `application`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `school_id` (`school_id`),
  ADD KEY `speciality_id` (`speciality_id`);

--
-- Indexes for table `doc_admin`
--
ALTER TABLE `doc_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doc_type_id` (`doc_type_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `doc_type`
--
ALTER TABLE `doc_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doc_name` (`doc_name`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `school_name` (`school_name`),
  ADD UNIQUE KEY `city` (`city`);

--
-- Indexes for table `school_speciality`
--
ALTER TABLE `school_speciality`
  ADD KEY `speciality_id` (`speciality_id`),
  ADD KEY `school_id` (`school_id`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `first_name` (`first_name`),
  ADD UNIQUE KEY `last_name` (`last_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doc_admin`
--
ALTER TABLE `doc_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `doc_type`
--
ALTER TABLE `doc_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `speciality`
--
ALTER TABLE `speciality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `application_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  ADD CONSTRAINT `application_ibfk_3` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`);

--
-- Constraints for table `doc_admin`
--
ALTER TABLE `doc_admin`
  ADD CONSTRAINT `doc_admin_ibfk_1` FOREIGN KEY (`doc_type_id`) REFERENCES `doc_type` (`id`),
  ADD CONSTRAINT `doc_admin_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `school_speciality`
--
ALTER TABLE `school_speciality`
  ADD CONSTRAINT `school_speciality_ibfk_1` FOREIGN KEY (`speciality_id`) REFERENCES `speciality` (`id`),
  ADD CONSTRAINT `school_speciality_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
