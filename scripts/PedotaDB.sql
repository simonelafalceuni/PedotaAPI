-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: pedotadb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `campo`
--

DROP TABLE IF EXISTS `campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campo` (
  `Id` int NOT NULL auto_increment,
  `Nome` varchar(45) NOT NULL,
  `CentroSportivo_Id` int NOT NULL,
  PRIMARY KEY (`Id`,`CentroSportivo_Id`),
  KEY `fk_Campo_CentroSportivo_idx` (`CentroSportivo_Id`),
  CONSTRAINT `fk_Campo_CentroSportivo` FOREIGN KEY (`CentroSportivo_Id`) REFERENCES `centrosportivo` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campo`
--

LOCK TABLES `campo` WRITE;
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` VALUES (1,'Rosso',1),(1,'Nord',2),(1,'Aniene',3),(2,'Verde',1),(2,'Sud',2),(2,'Tevere',3),(3,'Bianco',1),(3,'Est',2),(4,'Ovest',2);
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centrosportivo`
--

DROP TABLE IF EXISTS `centrosportivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centrosportivo` (
  `Id` int NOT NULL auto_increment,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centrosportivo`
--

LOCK TABLES `centrosportivo` WRITE;
/*!40000 ALTER TABLE `centrosportivo` DISABLE KEYS */;
INSERT INTO `centrosportivo` VALUES (1,'New Green Hill'),(2,'Salaria Sport Village'),(3,'La Mirage');
/*!40000 ALTER TABLE `centrosportivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenotazione`
--

DROP TABLE IF EXISTS `prenotazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenotazione` (
  `Id` int NOT NULL auto_increment,
  `DataInizio` datetime NOT NULL,
  `DataFine` datetime NOT NULL,
  `Campo_Id` int NOT NULL,
  `Utente_Id` int NOT NULL,
  PRIMARY KEY (`Id`,`DataInizio`,`DataFine`,`Campo_Id`),
  KEY `fk_Prenotazione_Campo1_idx` (`Campo_Id`),
  KEY `fk_Prenotazione_Utente1_idx` (`Utente_Id`),
  CONSTRAINT `fk_Prenotazione_Campo1` FOREIGN KEY (`Campo_Id`) REFERENCES `campo` (`Id`),
  CONSTRAINT `fk_Prenotazione_Utente1` FOREIGN KEY (`Utente_Id`) REFERENCES `utente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenotazione`
--

LOCK TABLES `prenotazione` WRITE;
/*!40000 ALTER TABLE `prenotazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenotazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `Id` int NOT NULL auto_increment,
  `Email` varchar(45) DEFAULT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cognome` varchar(45) DEFAULT NULL,
  `Cellulare` varchar(45) DEFAULT NULL,
  `Livello` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'simonelafalceuni@gmail.com','Simone','La Falce','0123456789','Base');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-24 14:43:47
