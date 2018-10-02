CREATE DATABASE  IF NOT EXISTS `lecture_improve` /*!40100 DEFAULT CHARACTER SET cp1250 COLLATE cp1250_croatian_ci */;
USE `lecture_improve`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lecture_improve
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `survey_feedback_type`
--

DROP TABLE IF EXISTS `survey_feedback_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_feedback_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `InputTitle` varchar(255) COLLATE cp1250_croatian_ci NOT NULL,
  `OutputTitle` varchar(255) COLLATE cp1250_croatian_ci NOT NULL,
  `Description` varchar(600) COLLATE cp1250_croatian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=cp1250 COLLATE=cp1250_croatian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_feedback_type`
--

LOCK TABLES `survey_feedback_type` WRITE;
/*!40000 ALTER TABLE `survey_feedback_type` DISABLE KEYS */;
INSERT INTO `survey_feedback_type` VALUES (1,'2017-02-23 00:20:48','Komentari u pogledu nastave ovog kolegija','Pitanja u pogledu nastave ovog kolegija','Povratna informacija studenata.'),(2,'2017-02-23 00:20:48','Odgovori na komentare u pogledu nastave ovog kolegija','Odgovori na pitanja u pogledu nastave ovog kolegija','Pitanje studenata upućeno profesorima.');
/*!40000 ALTER TABLE `survey_feedback_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-24  3:46:17
