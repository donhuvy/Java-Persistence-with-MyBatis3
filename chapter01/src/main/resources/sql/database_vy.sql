CREATE DATABASE  IF NOT EXISTS `elearning` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `elearning`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: elearning
-- ------------------------------------------------------
-- Server version	5.7.15

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
-- Table structure for table `ADDRESSES`
--

DROP TABLE IF EXISTS `ADDRESSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADDRESSES` (
  `ADDR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STREET` varchar(50) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `COUNTRY` varchar(50) NOT NULL,
  PRIMARY KEY (`ADDR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESSES`
--

LOCK TABLES `ADDRESSES` WRITE;
/*!40000 ALTER TABLE `ADDRESSES` DISABLE KEYS */;
INSERT INTO `ADDRESSES` VALUES (1,'4891 Pacific Hwy','San Diego','CA','92110','San Diego'),(2,'2400 N Jefferson St','Perry','FL','32347','Taylor'),(3,'710 N Cable Rd','Lima','OH','45825','Allen'),(4,'5108 W Gore Blvd','Lawton','OK','32365','Comanche');
/*!40000 ALTER TABLE `ADDRESSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COURSES`
--

DROP TABLE IF EXISTS `COURSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COURSES` (
  `COURSE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `TUTOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`),
  KEY `FK_COURSE_TUTOR` (`TUTOR_ID`),
  CONSTRAINT `FK_COURSE_TUTOR` FOREIGN KEY (`TUTOR_ID`) REFERENCES `TUTORS` (`TUTOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSES`
--

LOCK TABLES `COURSES` WRITE;
/*!40000 ALTER TABLE `COURSES` DISABLE KEYS */;
INSERT INTO `COURSES` VALUES (1,'Quickstart Core Java','Core Java Programming','2013-03-01','2013-04-15',1),(2,'Quickstart JavaEE6','Enterprise App Development using JavaEE6','2013-04-01','2013-08-30',1),(3,'MyBatis3 Premier','MyBatis 3 framework','2013-06-01','2013-07-15',2);
/*!40000 ALTER TABLE `COURSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COURSE_ENROLLMENT`
--

DROP TABLE IF EXISTS `COURSE_ENROLLMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COURSE_ENROLLMENT` (
  `COURSE_ID` int(11) NOT NULL,
  `STUD_ID` int(11) NOT NULL,
  PRIMARY KEY (`COURSE_ID`,`STUD_ID`),
  KEY `FK_ENROLLMENT_STUD` (`STUD_ID`),
  CONSTRAINT `FK_ENROLLMENT_COURSE` FOREIGN KEY (`COURSE_ID`) REFERENCES `COURSES` (`COURSE_ID`),
  CONSTRAINT `FK_ENROLLMENT_STUD` FOREIGN KEY (`STUD_ID`) REFERENCES `STUDENTS` (`STUD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COURSE_ENROLLMENT`
--

LOCK TABLES `COURSE_ENROLLMENT` WRITE;
/*!40000 ALTER TABLE `COURSE_ENROLLMENT` DISABLE KEYS */;
INSERT INTO `COURSE_ENROLLMENT` VALUES (1,1),(1,2),(2,2);
/*!40000 ALTER TABLE `COURSE_ENROLLMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STUDENTS`
--

DROP TABLE IF EXISTS `STUDENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STUDENTS` (
  `STUD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BIO` longtext,
  `PIC` blob,
  `ADDR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`STUD_ID`),
  KEY `FK_STUDENTS_ADDR` (`ADDR_ID`),
  CONSTRAINT `FK_STUDENTS_ADDR` FOREIGN KEY (`ADDR_ID`) REFERENCES `ADDRESSES` (`ADDR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STUDENTS`
--

LOCK TABLES `STUDENTS` WRITE;
/*!40000 ALTER TABLE `STUDENTS` DISABLE KEYS */;
INSERT INTO `STUDENTS` VALUES (1,'Timothy','timothy@gmail.com','123-123-1234','1988-04-25',NULL,NULL,3),(2,'student_2','student_2gmail.com','789-456-1234','2016-11-16',NULL,NULL,4),(4,'student_4','student_4gmail.com',NULL,'2016-11-16',NULL,NULL,NULL);
/*!40000 ALTER TABLE `STUDENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TUTORS`
--

DROP TABLE IF EXISTS `TUTORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TUTORS` (
  `TUTOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PHONE` varchar(15) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `BIO` longtext,
  `PIC` blob,
  `ADDR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TUTOR_ID`),
  KEY `FK_TUTORS_ADDR` (`ADDR_ID`),
  CONSTRAINT `FK_TUTORS_ADDR` FOREIGN KEY (`ADDR_ID`) REFERENCES `ADDRESSES` (`ADDR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TUTORS`
--

LOCK TABLES `TUTORS` WRITE;
/*!40000 ALTER TABLE `TUTORS` DISABLE KEYS */;
INSERT INTO `TUTORS` VALUES (1,'John','john@gmail.com','111-222-3333','1980-05-20',NULL,NULL,1),(2,'Paul','paul@gmail.com','123-321-4444','1981-03-15',NULL,NULL,2);
/*!40000 ALTER TABLE `TUTORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PICS`
--

DROP TABLE IF EXISTS `USER_PICS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PICS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `PIC` blob,
  `BIO` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PICS`
--

LOCK TABLES `USER_PICS` WRITE;
/*!40000 ALTER TABLE `USER_PICS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_PICS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-16 22:57:48
