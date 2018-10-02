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
-- Table structure for table `survey_element`
--

DROP TABLE IF EXISTS `survey_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Type` int(11) NOT NULL,
  `InputText` text COLLATE cp1250_croatian_ci NOT NULL,
  `OutputText` text COLLATE cp1250_croatian_ci NOT NULL,
  `OrderInType` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Type` (`Type`),
  CONSTRAINT `survey_element_ibfk_1` FOREIGN KEY (`Type`) REFERENCES `survey_element_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=cp1250 COLLATE=cp1250_croatian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_element`
--

LOCK TABLES `survey_element` WRITE;
/*!40000 ALTER TABLE `survey_element` DISABLE KEYS */;
INSERT INTO `survey_element` VALUES (1,'2017-02-23 00:20:48',1,'Ocijenite kvalitetu zadržavanja u prostoru u smislu količine privatnog prostora prilikom sjedenja i rasprostranjenosti prirodnog svjetla.','Fokusirati se na poboljšavanje kvalitete zadržavanja u prostoru putem organiziranja stolaca tako da svaki član publike može imati što više privatnog pastora i putem organiziranja prozora tako da vanjsko svjetlo ravnomjerno obasjava prostoriju.',1),(2,'2017-02-23 00:20:48',1,'Ocijenite kvalitetu umjetnog osvjetljenja u smislu raspoređenosti rasvjete i usklađenosti te rasvjete i boje zidova od kojih se ista reflektira.','Fokusirati se na poboljšavanje kvalitete umjetnog osvjetljenja putem ravnomjernije raspoređenosti rasvjete dok se ima u vidu boja zidova od koje će se to svjetlo reflektirati.',2),(3,'2017-02-23 00:20:48',1,'Ocijenite kvalitetu temperature prostora u smislu ravnomjernosti postavljanja klima uređaja, radijatora i ostalih uređaja za regulaciju temperature u prostoriji.','Fokusirati se na poboljšavanje temperature prostora putem ravnomjernog postavljanja klima uređaja, radijatora i ostalih uređaja za regulaciju temperature u prostoriji.',3),(4,'2017-02-23 00:20:48',1,'Ocijenite kvalitetu konzumiranja nastave u smislu vidljivosti pozornice i lakoće slušanja zvuka koji dolazi s pozornice.','Fokusirati se na uvjete konzumiranja nastave putem bolje organizacije odnose sjedišta i pozornice te putem osiguravanja dobre ozvučenosti prostorije putem ravnomjernog postavljanja zvučnika dok se ima u vidu kako se zvuk reflektira od zidova.',4),(5,'2017-02-23 00:20:48',1,'Ocijenite uvjete izvođenja nastave u smislu organiziranosti prostora pozornice u svrhu demonstracije gradiva i prostora sjedišta u svrhu interakcije s članovima publike.','Fokusirati se na uvjete izvođenje nastave putem praktičnijeg dizajna pozornice u svrhu demonstracije gradiva i putem ostavljanja mjesta za kretanje prostorom publike radi interakcije s članovima publike.  !!!! dodati opremu samu (računala i drugo) ovdje ili na neki drugi stadij, ažurirati sustav potom',5),(6,'2017-02-23 00:20:48',2,'Ocijenite kvalitetu prijenosa znanja koje je se očekuje da usvojite tijekom studija uzevši u obzir koliko se nastavnici trude da vas zainteresiraju za iste.','Fokusirati se na poboljšanje kvalitete prijenosa znanja studentima i održavanje interesa studenata za sadržaj nastave.',1),(7,'2017-02-23 00:20:48',2,'Ocijenite koliko vas nastavnici usmjeravaju prema vašim interesima/željama uzevši obzir koliko vam pomažu da iste uskladite s zahtjevima studija.','Fokusirati se na usmjeravanje studenata prema njegovim interesima/željama i pomoći mu da iste uskladi s zahtjevima studija.',2),(8,'2017-02-23 00:20:48',2,'Ocijenite koliko vas osoblje obrazovne ustanove tretira jednako sebi uzevši u obzir koliko vi to isto osoblje trenirate jednako sebi.','Fokusirati te sa na tretiranje studenta kao jednakog sebi, pogotovo tijekom rješavanja konfliktnih situacija.',3),(9,'2017-02-23 00:20:48',2,'Ocijenite količinu odnosno kvalitetu ne-nastavnog znanja koji vam nastavnici prenesu radi lakšeg uspjeha u vašem daljnjem životu. ','Fokusirati se na prijenos svog životnog iskustva studentima kako bi se lakše snašli u svom budućem životu.',4),(10,'2017-02-23 00:20:48',2,'Ocijenite kvalitetu nastavnika kao uzora u pogledu njihovog zanimanja odnosno u pogledu njihovog života općenito.','Fokusirati se da primjerom vlastitog života pružate studentima stabilan i pouzdan uzor u njihovom životu.',5),(11,'2017-02-23 00:20:48',3,'Ocijenite kvalitete u prezentacija kolegija u smislu količine teksta, preglednosti i važnosti gradiva koji se prezentira, uzevši u obzir zahtjeve kolegija.','Fokusirati se na to da se prezentacije kolegija učine što preglednijima, manje teksta i samo najvažnije gradivo na njima.',1),(12,'2017-02-23 00:20:48',3,'Ocijenite kvalitetu skripti kolegija u smislu sveobuhvatnosti gradiva kolegija i toga koliko dobro je sažeto i organizirano to gradivo unutar skripte.','Fokusirati se na to da se u skriptama kolegija što preglednije i sažetije prezentira svo gradivo kolegija.',2),(13,'2017-02-23 00:20:48',3,'Ocijenite kvalitetu stručnih i drugih literatura na temu kolegija koje su preporučene i/ili kojima imate omogućen pristup od strane izvođača kolegija.','Fokusirati se na to da se studentima omogući pristup što kvalitetnijim stručnim i drugim literaturama u pogledu kolegija.',3),(14,'2017-02-23 00:20:48',3,'Ocijenite kvalitetu javno objavljenih radova na temu kolegija kojima vam je omogućen pristup u smislu uzora za vlastiti rad na temu kolegija.','Fokusirati se na to da se studentima omogući pristup što kvalitetnijim radovima koji su povezani s kolegijom i mogu biti uzor na radove na temu kolegija.',4),(15,'2017-02-23 00:20:48',3,'Ocijenite kvalitetu online i drugih sadržaji koji su vam preporučeni i/ili je omogućen vam pristup istima, uzevši u obzir to koliko vam pomažu savladati gradivo kolegija.','Fokusirati se na to da se studentima omogući pristup što kvalitetnijim online i drugih sadržajima vezanim uz temu kolegija, pogotovo ukoliko olakšavaju savladavanje kolegija.',5);
/*!40000 ALTER TABLE `survey_element` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-24  3:46:14
