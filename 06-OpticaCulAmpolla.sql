CREATE DATABASE  IF NOT EXISTS `OpticaCulAmpolla` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `OpticaCulAmpolla`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: OpticaCulAmpolla
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `id_Address` int(11) NOT NULL AUTO_INCREMENT,
  `street_Name` varchar(45) DEFAULT NULL,
  `street_Number` varchar(45) DEFAULT NULL,
  `floor` varchar(45) DEFAULT NULL,
  `door_Number` varchar(45) DEFAULT NULL,
  `postal_Code` varchar(45) DEFAULT NULL,
  `City_id_City` int(11) NOT NULL,
  `Supplier_id_Supplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Address`),
  UNIQUE KEY `id_Address_UNIQUE` (`id_Address`),
  KEY `fk_Address_City1_idx` (`City_id_City`),
  KEY `fk_Address_Supplier1_idx` (`Supplier_id_Supplier`),
  CONSTRAINT `fk_Address_City1` FOREIGN KEY (`City_id_City`) REFERENCES `City` (`id_City`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Address_Supplier1` FOREIGN KEY (`Supplier_id_Supplier`) REFERENCES `Supplier` (`id_Supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Avinguda de Madrid','150','6','3','08523',1,NULL),(2,'Gefund str','200','3','1','D1254F',2,NULL);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `City` (
  `id_City` int(11) NOT NULL AUTO_INCREMENT,
  `city_Name` varchar(45) NOT NULL,
  `city_Short` varchar(3) NOT NULL,
  `Country_id_Country` int(11) NOT NULL,
  PRIMARY KEY (`id_City`),
  UNIQUE KEY `id_City_UNIQUE` (`id_City`),
  KEY `fk_City_Country1_idx` (`Country_id_Country`),
  CONSTRAINT `fk_City_Country1` FOREIGN KEY (`Country_id_Country`) REFERENCES `Country` (`id_Country`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Barcelona','BCN',1),(2,'Saarland','SLD',2);
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `id_Country` int(11) NOT NULL AUTO_INCREMENT,
  `country_Name` varchar(45) NOT NULL,
  `country_Short` varchar(3) NOT NULL,
  PRIMARY KEY (`id_Country`),
  UNIQUE KEY `id_Country_UNIQUE` (`id_Country`),
  UNIQUE KEY `country_Name_UNIQUE` (`country_Name`),
  UNIQUE KEY `country_Short_UNIQUE` (`country_Short`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Spain','ESP'),(2,'Germany','GER'),(3,'France','FR');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `id_Employee` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) DEFAULT NULL,
  `Person_id` int(11) NOT NULL,
  PRIMARY KEY (`id_Employee`),
  UNIQUE KEY `id_Employee_UNIQUE` (`id_Employee`),
  KEY `fk_Employee_Person_idx` (`Person_id`),
  CONSTRAINT `fk_Employee_Person` FOREIGN KEY (`Person_id`) REFERENCES `Person` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,1,1);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Glasses` (
  `id_Glasses` int(11) NOT NULL AUTO_INCREMENT,
  `graduation_Rght` decimal(5,2) DEFAULT NULL,
  `graduation_Lft` decimal(5,2) DEFAULT NULL,
  `glass_Color_Rght` varchar(45) DEFAULT NULL,
  `glass_Color_Lft` varchar(45) DEFAULT NULL,
  `frame_type` enum('floating','paste','metallic') NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `Employee_id_Employee` int(11) NOT NULL,
  `Trademark_id_Trademark` int(11) NOT NULL,
  PRIMARY KEY (`id_Glasses`),
  UNIQUE KEY `id_Glasses_UNIQUE` (`id_Glasses`),
  KEY `fk_Glasses_Employee1_idx` (`Employee_id_Employee`),
  KEY `fk_Glasses_Trademark1_idx` (`Trademark_id_Trademark`),
  CONSTRAINT `fk_Glasses_Employee1` FOREIGN KEY (`Employee_id_Employee`) REFERENCES `Employee` (`id_Employee`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Trademark1` FOREIGN KEY (`Trademark_id_Trademark`) REFERENCES `Trademark` (`id_Trademark`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
INSERT INTO `Glasses` VALUES (1,1.26,2.50,'RED','RED','floating',96.36,1,1),(2,1.21,1.20,'Black','Black','paste',200.56,1,2),(3,0.90,0.40,'TRANS','TRANS','metallic',156.25,1,3);
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `id_Person` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surename` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `registration` datetime DEFAULT NULL,
  `Person_id_Person` int(11) DEFAULT NULL,
  `Address_id_Address` int(11) NOT NULL,
  PRIMARY KEY (`id_Person`),
  UNIQUE KEY `id_Client_UNIQUE` (`id_Person`),
  KEY `fk_Person_Person1_idx` (`Person_id_Person`),
  KEY `fk_Person_Address1_idx` (`Address_id_Address`),
  CONSTRAINT `fk_Person_Address1` FOREIGN KEY (`Address_id_Address`) REFERENCES `Address` (`id_Address`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Person1` FOREIGN KEY (`Person_id_Person`) REFERENCES `Person` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES (1,'Angel','Calzada','936524152','pepito@hotmail.com','2020-08-05 10:23:52',NULL,1),(2,'cliente1','comprador','936525852','client@hotmail.com','2020-03-21 17:25:43',NULL,2);
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Supplier` (
  `id_Supplier` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `nif` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Supplier`),
  UNIQUE KEY `id_Supplier_UNIQUE` (`id_Supplier`),
  UNIQUE KEY `nif_UNIQUE` (`nif`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Monturas raimundo','93652145','643216473213','B6652236'),(2,'Gafas la ostia','656236985','67365435473423','H98474837'),(3,'Mirada sensual','666232325','687432435473','G45212563');
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trademark`
--

DROP TABLE IF EXISTS `Trademark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trademark` (
  `id_Trademark` int(11) NOT NULL AUTO_INCREMENT,
  `date_Relationship` datetime DEFAULT NULL,
  `trademark_Name` varchar(45) DEFAULT NULL,
  `Supplier_id_Supplier` int(11) NOT NULL,
  PRIMARY KEY (`id_Trademark`),
  UNIQUE KEY `id_Trademark_UNIQUE` (`id_Trademark`),
  KEY `fk_Trademark_Supplier1_idx` (`Supplier_id_Supplier`),
  CONSTRAINT `fk_Trademark_Supplier1` FOREIGN KEY (`Supplier_id_Supplier`) REFERENCES `Supplier` (`id_Supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trademark`
--

LOCK TABLES `Trademark` WRITE;
/*!40000 ALTER TABLE `Trademark` DISABLE KEYS */;
INSERT INTO `Trademark` VALUES (1,'2020-08-08 10:00:00','Gucci',1),(2,'2020-08-08 10:00:00','Rayban',1),(3,'2020-08-08 10:00:00','Adolfa Dominguez',1),(4,'2020-08-08 10:00:00','Chin Chin Aflelou',2),(5,'2020-08-08 10:00:00','Lacoste',2),(6,'2020-08-08 10:00:00','Tomy Highfield',3);
/*!40000 ALTER TABLE `Trademark` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-05 19:20:52
