-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: localhost    Database: soccer
-- ------------------------------------------------------
-- Server version	9.0.1
CREATE DATABASE soccer;
USE soccer;



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
-- Table structure for table `award_type`
--

DROP TABLE IF EXISTS `award_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `award_type` (
  `award_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`award_type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_type`
--

LOCK TABLES `award_type` WRITE;
/*!40000 ALTER TABLE `award_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `award_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'London',1),(2,'Manchester',1),(3,'Liverpool',1),(4,'Madrid',2),(5,'Barcelona',2);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `team_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `registration_date` date NOT NULL,
  `status_id` int NOT NULL,
  `wages` decimal(15,2) NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `player_id` (`player_id`),
  KEY `team_id` (`team_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `contract_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1,1,'2023-07-01','2026-06-30','2023-07-01',1,300000.00),(2,2,2,'2022-07-01','2025-06-30','2022-07-01',1,350000.00),(3,3,3,'2021-07-01','2024-06-30','2021-07-01',1,280000.00),(4,4,4,'2023-07-01','2026-06-30','2023-07-01',1,400000.00),(5,5,5,'2022-07-01','2025-06-30','2022-07-01',1,375000.00),(6,6,3,'2023-07-01','2026-06-30','2023-07-01',1,280000.00),(7,7,2,'2023-07-01','2026-06-30','2023-07-01',1,290000.00),(8,8,4,'2023-07-01','2025-06-30','2023-07-01',1,350000.00),(9,9,5,'2023-07-01','2025-06-30','2023-07-01',1,325000.00),(10,10,4,'2023-07-01','2028-06-30','2023-07-01',1,400000.00),(11,11,7,'2023-07-01','2027-06-30','2023-07-01',1,250000.00),(12,12,1,'2023-07-01','2027-06-30','2023-07-01',1,230000.00),(13,13,4,'2023-07-01','2027-06-30','2023-07-01',1,350000.00),(14,14,7,'2023-07-01','2027-06-30','2023-07-01',1,280000.00),(15,15,3,'2023-07-01','2026-06-30','2023-07-01',1,250000.00);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_status`
--

DROP TABLE IF EXISTS `contract_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_status`
--

LOCK TABLES `contract_status` WRITE;
/*!40000 ALTER TABLE `contract_status` DISABLE KEYS */;
INSERT INTO `contract_status` VALUES (1,'Active'),(2,'Expired'),(5,'Loaned'),(4,'Pending'),(3,'Terminated');
/*!40000 ALTER TABLE `contract_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'England'),(4,'France'),(3,'Germany'),(5,'Italy'),(2,'Spain');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `football_match`
--

DROP TABLE IF EXISTS `football_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `football_match` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_date` datetime NOT NULL,
  `home_score` int NOT NULL DEFAULT '0',
  `away_score` int NOT NULL DEFAULT '0',
  `attendance` int NOT NULL,
  `stadium_id` int NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `stadium_id` (`stadium_id`),
  CONSTRAINT `football_match_ibfk_1` FOREIGN KEY (`stadium_id`) REFERENCES `stadium` (`stadium_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `football_match`
--

LOCK TABLES `football_match` WRITE;
/*!40000 ALTER TABLE `football_match` DISABLE KEYS */;
INSERT INTO `football_match` VALUES (1,'2024-01-01 15:00:00',2,1,55000,1),(2,'2024-01-02 17:30:00',3,3,70000,2),(3,'2024-01-03 20:00:00',1,0,50000,3),(4,'2024-01-04 20:45:00',4,2,75000,4),(5,'2024-01-05 21:00:00',2,2,85000,5),(6,'2024-02-01 15:00:00',3,1,58000,1),(7,'2024-02-08 17:30:00',2,2,72000,2),(8,'2024-02-15 20:00:00',4,0,51000,3),(9,'2024-02-22 20:45:00',1,2,77000,4),(10,'2024-03-01 21:00:00',3,3,88000,5),(11,'2024-03-05 15:00:00',2,1,62000,1),(12,'2024-03-12 17:30:00',3,3,69000,2),(13,'2024-03-19 20:00:00',4,2,53000,3),(14,'2024-03-26 20:45:00',2,0,79000,4),(15,'2024-04-02 21:00:00',1,1,82000,5);
/*!40000 ALTER TABLE `football_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury`
--

DROP TABLE IF EXISTS `injury`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injury` (
  `injury_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `injury_type_id` int NOT NULL,
  `injury_date` date NOT NULL,
  `severity_id` int NOT NULL,
  `treatment_plan` text NOT NULL,
  `expected_return` date NOT NULL,
  PRIMARY KEY (`injury_id`),
  KEY `player_id` (`player_id`),
  KEY `injury_type_id` (`injury_type_id`),
  KEY `severity_id` (`severity_id`),
  CONSTRAINT `injury_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `injury_ibfk_2` FOREIGN KEY (`injury_type_id`) REFERENCES `injury_type` (`injury_type_id`),
  CONSTRAINT `injury_ibfk_3` FOREIGN KEY (`severity_id`) REFERENCES `severity` (`severity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury`
--

LOCK TABLES `injury` WRITE;
/*!40000 ALTER TABLE `injury` DISABLE KEYS */;
INSERT INTO `injury` VALUES (1,1,1,'2023-09-15',2,'Physiotherapy and rest','2023-10-01'),(2,2,2,'2023-10-10',3,'Surgery and rehabilitation','2023-12-15'),(3,3,3,'2023-11-05',2,'Conservative treatment','2023-11-25'),(4,4,4,'2023-12-01',1,'Rest and recovery','2023-12-10'),(5,2,5,'2024-01-15',2,'Concussion protocol','2024-01-30'),(6,6,2,'2023-10-05',2,'Rehabilitation program','2023-10-25'),(7,7,3,'2023-11-15',3,'Surgery required','2024-01-10'),(8,8,1,'2023-09-20',1,'Rest and physiotherapy','2023-10-05'),(9,10,4,'2023-12-10',2,'Muscle strengthening','2023-12-30'),(10,12,5,'2024-01-05',1,'Concussion protocol','2024-01-15');
/*!40000 ALTER TABLE `injury` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `injury_type`
--

DROP TABLE IF EXISTS `injury_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `injury_type` (
  `injury_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) NOT NULL,
  PRIMARY KEY (`injury_type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `injury_type`
--

LOCK TABLES `injury_type` WRITE;
/*!40000 ALTER TABLE `injury_type` DISABLE KEYS */;
INSERT INTO `injury_type` VALUES (2,'Ankle Sprain'),(5,'Concussion'),(1,'Hamstring Strain'),(3,'Knee Injury'),(4,'Muscle Fatigue');
/*!40000 ALTER TABLE `injury_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English'),(4,'French'),(3,'German'),(5,'Italian'),(2,'Spanish');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `league` (
  `league_id` int NOT NULL AUTO_INCREMENT,
  `division_type` varchar(50) NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`league_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `league_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'Premier League',1),(2,'La Liga',2),(3,'Bundesliga',3),(4,'Ligue 1',4),(5,'Serie A',5);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `match_official`
--

DROP TABLE IF EXISTS `match_official`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `match_official` (
  `official_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nationality_id` int NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  PRIMARY KEY (`official_id`),
  KEY `nationality_id` (`nationality_id`),
  CONSTRAINT `match_official_ibfk_1` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `match_official`
--

LOCK TABLES `match_official` WRITE;
/*!40000 ALTER TABLE `match_official` DISABLE KEYS */;
INSERT INTO `match_official` VALUES (1,'Michael Oliver',1,180.00,75.00),(2,'Anthony Taylor',1,185.00,80.00),(3,'Felix Brych',3,182.00,78.00),(4,'Bjorn Kuipers',1,178.00,76.00),(5,'Daniele Orsato',5,183.00,77.00);
/*!40000 ALTER TABLE `match_official` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `official_assignment`
--

DROP TABLE IF EXISTS `official_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official_assignment` (
  `assignment_id` int NOT NULL AUTO_INCREMENT,
  `match_id` int NOT NULL,
  `official_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`assignment_id`),
  KEY `match_id` (`match_id`),
  KEY `official_id` (`official_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `official_assignment_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`),
  CONSTRAINT `official_assignment_ibfk_2` FOREIGN KEY (`official_id`) REFERENCES `match_official` (`official_id`),
  CONSTRAINT `official_assignment_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `official_assignment`
--

LOCK TABLES `official_assignment` WRITE;
/*!40000 ALTER TABLE `official_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `official_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `specialization_id` int NOT NULL,
  `join_date` date NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `role_id` (`role_id`),
  KEY `specialization_id` (`specialization_id`),
  CONSTRAINT `personnel_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `personnel_ibfk_2` FOREIGN KEY (`specialization_id`) REFERENCES `specialization` (`specialization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `nationality_id` int NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `height` decimal(5,2) NOT NULL,
  `position_id` int NOT NULL,
  `dominant_foot` varchar(5) NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `nationality_id` (`nationality_id`),
  KEY `position_id` (`position_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`nationality_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `player_ibfk_2` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  CONSTRAINT `player_ibfk_3` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Harry Kane','1993-07-28',1,86.00,188.00,5,'Right',1),(2,'Kevin De Bruyne','1991-06-28',2,76.00,181.00,3,'Right',3),(3,'Virgil van Dijk','1991-07-08',3,92.00,193.00,2,'Right',1),(4,'Kylian Mbappé','1998-12-20',4,73.00,178.00,4,'Right',2),(5,'Erling Haaland','2000-07-21',3,88.00,194.00,5,'Left',3),(6,'Mohamed Salah','1992-06-15',1,73.00,175.00,4,'Left',1),(7,'Bruno Fernandes','1994-09-08',2,75.00,179.00,3,'Right',2),(8,'Luka Modric','1985-09-09',3,66.00,172.00,3,'Right',3),(9,'Robert Lewandowski','1988-08-21',4,81.00,185.00,5,'Right',3),(10,'Jude Bellingham','2003-06-29',1,75.00,186.00,3,'Right',1),(11,'Phil Foden','2000-05-28',1,70.00,171.00,4,'Left',1),(12,'Bukayo Saka','2001-09-05',1,72.00,178.00,4,'Left',1),(13,'Vinicius Jr','2000-07-12',2,73.00,176.00,4,'Right',2),(14,'Rodri','1996-06-22',2,82.00,191.00,3,'Right',2),(15,'Trent Alexander-Arnold','1998-10-07',1,69.00,175.00,2,'Right',1);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_match_stats`
--

DROP TABLE IF EXISTS `player_match_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_match_stats` (
  `stat_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `match_id` int NOT NULL,
  `minutes_played` int NOT NULL,
  `goals_scored` int NOT NULL DEFAULT '0',
  `assists` int NOT NULL DEFAULT '0',
  `yellow_cards` int NOT NULL DEFAULT '0',
  `red_cards` int NOT NULL DEFAULT '0',
  `passes_completed` int NOT NULL DEFAULT '0',
  `distance_covered` decimal(5,2) NOT NULL,
  `number_of_shots` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `player_id` (`player_id`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `player_match_stats_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `player_match_stats_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `football_match` (`match_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_match_stats`
--

LOCK TABLES `player_match_stats` WRITE;
/*!40000 ALTER TABLE `player_match_stats` DISABLE KEYS */;
INSERT INTO `player_match_stats` VALUES (1,1,1,90,2,1,0,0,45,10.50,5),(2,1,2,85,1,0,1,0,35,9.80,4),(3,1,3,90,2,0,0,0,40,10.20,6),(4,2,1,88,0,2,0,0,78,11.20,2),(5,2,2,90,1,2,0,0,82,11.50,3),(6,2,3,75,0,1,1,0,65,9.80,1),(7,3,1,90,0,0,0,0,55,9.50,0),(8,3,2,90,1,0,1,0,58,9.80,1),(9,3,3,90,0,0,0,0,62,9.70,0),(10,4,1,85,2,1,0,0,35,10.80,6),(11,4,2,90,3,0,0,0,42,11.20,7),(12,4,3,78,1,1,0,0,38,9.50,4),(13,5,1,90,2,0,1,0,25,9.80,5),(14,5,2,90,2,1,0,0,28,10.20,6),(15,5,3,90,3,0,0,0,30,10.50,7),(16,6,1,90,2,1,0,0,42,10.20,5),(17,6,2,90,1,2,0,0,38,9.80,4),(18,6,3,85,2,0,1,0,35,9.50,6),(19,7,1,90,1,2,1,0,75,11.50,3),(20,7,2,90,0,3,0,0,82,11.80,2),(21,7,3,90,2,1,1,0,68,11.20,4),(22,8,1,75,0,2,0,0,89,10.50,1),(23,8,2,82,1,1,0,0,92,10.80,2),(24,8,3,90,0,2,0,0,95,11.00,1),(25,1,4,90,1,1,0,0,48,10.30,4),(26,1,5,85,2,0,1,0,42,9.90,5),(27,2,4,90,1,2,0,0,85,11.40,2),(28,2,5,88,0,1,1,0,78,11.00,1),(29,10,1,90,2,1,0,0,65,12.10,4),(30,10,2,90,1,1,1,0,72,11.80,3),(31,10,3,90,2,0,0,0,68,12.00,5),(32,11,1,85,1,2,0,0,45,10.50,3),(33,11,2,90,2,1,0,0,52,10.80,4),(34,11,3,78,1,1,1,0,48,10.20,3),(35,12,1,90,1,1,0,0,38,11.20,4),(36,12,2,90,2,2,0,0,42,11.50,5),(37,12,3,90,1,2,0,0,45,11.30,3);
/*!40000 ALTER TABLE `player_match_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(50) NOT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE KEY `position_name` (`position_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (2,'Defender'),(4,'Forward'),(1,'Goalkeeper'),(3,'Midfielder'),(5,'Striker');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (5,'Assistant Referee'),(2,'Coach'),(1,'Manager'),(3,'Medical Staff'),(4,'Referee');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `severity`
--

DROP TABLE IF EXISTS `severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `severity` (
  `severity_id` int NOT NULL AUTO_INCREMENT,
  `severity_level` varchar(50) NOT NULL,
  PRIMARY KEY (`severity_id`),
  UNIQUE KEY `severity_level` (`severity_level`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `severity`
--

LOCK TABLES `severity` WRITE;
/*!40000 ALTER TABLE `severity` DISABLE KEYS */;
INSERT INTO `severity` VALUES (4,'Critical'),(1,'Minor'),(2,'Moderate'),(5,'Season Ending'),(3,'Severe');
/*!40000 ALTER TABLE `severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialization`
--

DROP TABLE IF EXISTS `specialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialization` (
  `specialization_id` int NOT NULL AUTO_INCREMENT,
  `specialization_name` varchar(100) NOT NULL,
  PRIMARY KEY (`specialization_id`),
  UNIQUE KEY `specialization_name` (`specialization_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialization`
--

LOCK TABLES `specialization` WRITE;
/*!40000 ALTER TABLE `specialization` DISABLE KEYS */;
INSERT INTO `specialization` VALUES (2,'Assistant Coach'),(5,'Fitness Trainer'),(1,'Head Coach'),(3,'Physiotherapist'),(4,'Team Doctor');
/*!40000 ALTER TABLE `specialization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `stadium_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  `capacity` int NOT NULL,
  `pitch_length` decimal(5,2) NOT NULL,
  `pitch_width` decimal(5,2) NOT NULL,
  `open_date` date NOT NULL,
  PRIMARY KEY (`stadium_id`),
  UNIQUE KEY `name` (`name`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `stadium_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,'Emirates Stadium',1,60704,105.00,68.00,'2006-07-22'),(2,'Old Trafford',2,74140,105.00,68.00,'1910-02-19'),(3,'Anfield',3,53394,101.00,68.00,'1884-09-28'),(4,'Santiago Bernabeu',4,81044,105.00,68.00,'1947-12-14'),(5,'Camp Nou',5,99354,105.00,68.00,'1957-09-24');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(100) NOT NULL,
  `date_founded` date NOT NULL,
  `home_stadium_id` int NOT NULL,
  `color` varchar(50) NOT NULL,
  `market_value` decimal(15,2) NOT NULL,
  `league_id` int NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `team_name` (`team_name`),
  KEY `home_stadium_id` (`home_stadium_id`),
  KEY `league_id` (`league_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`home_stadium_id`) REFERENCES `stadium` (`stadium_id`),
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`league_id`) REFERENCES `league` (`league_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Arsenal','1886-10-01',1,'Red',800000000.00,1),(2,'Manchester United','1878-03-05',2,'Red',950000000.00,1),(3,'Liverpool FC','1892-06-03',3,'Red',900000000.00,1),(4,'Real Madrid','1902-03-06',4,'White',1000000000.00,2),(5,'Barcelona','1899-11-29',5,'Blue and Red',950000000.00,2),(6,'Chelsea','1905-03-10',1,'Blue',850000000.00,1),(7,'Manchester City','1880-04-16',2,'Sky Blue',1100000000.00,1),(8,'Tottenham','1882-09-05',3,'White',750000000.00,1),(9,'Bayern Munich','1900-02-27',4,'Red',950000000.00,3),(10,'PSG','1970-08-12',5,'Blue-Red',900000000.00,4);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `tournament_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tournament_type_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `prize` decimal(15,2) NOT NULL,
  PRIMARY KEY (`tournament_id`),
  KEY `tournament_type_id` (`tournament_type_id`),
  CONSTRAINT `tournament_ibfk_1` FOREIGN KEY (`tournament_type_id`) REFERENCES `tournament_type` (`tournament_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
INSERT INTO `tournament` VALUES (1,'Premier League 2023/24',1,'2023-08-11','2024-05-19',200000000.00),(2,'FA Cup 2024',2,'2024-01-06','2024-05-25',5000000.00),(3,'Champions League 2023/24',3,'2023-09-19','2024-06-01',100000000.00),(4,'Europa League 2023/24',4,'2023-09-20','2024-05-22',50000000.00),(5,'European Super Cup 2024',5,'2024-08-14','2024-08-14',1000000.00);
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_type`
--

DROP TABLE IF EXISTS `tournament_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_type` (
  `tournament_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`tournament_type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_type`
--

LOCK TABLES `tournament_type` WRITE;
/*!40000 ALTER TABLE `tournament_type` DISABLE KEYS */;
INSERT INTO `tournament_type` VALUES (3,'Champions League'),(2,'Cup'),(4,'Europa League'),(1,'League'),(5,'Super Cup'),(6,'World Cup');
/*!40000 ALTER TABLE `tournament_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `player_id` int NOT NULL,
  `transfer_type_id` int NOT NULL,
  `transfer_fee` decimal(15,2) NOT NULL,
  `transfer_date` date NOT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `team_id` (`team_id`),
  KEY `player_id` (`player_id`),
  KEY `transfer_type_id` (`transfer_type_id`),
  CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`transfer_type_id`) REFERENCES `transfer_type` (`transfer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
INSERT INTO `transfer` VALUES (1,1,1,1,85000000.00,'2023-07-15'),(2,2,2,1,75000000.00,'2023-08-01'),(3,3,3,1,65000000.00,'2023-06-30'),(4,4,4,2,10000000.00,'2023-07-01'),(5,5,5,4,15000000.00,'2023-08-15'),(6,1,3,3,0.00,'2024-01-01'),(7,2,4,3,0.00,'2024-02-01'),(8,3,5,5,25000000.00,'2023-12-15'),(9,4,1,4,20000000.00,'2024-01-15'),(10,5,2,2,8000000.00,'2024-02-15');
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer_type`
--

DROP TABLE IF EXISTS `transfer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer_type` (
  `transfer_type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`transfer_type_id`),
  UNIQUE KEY `type_name` (`type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer_type`
--

LOCK TABLES `transfer_type` WRITE;
/*!40000 ALTER TABLE `transfer_type` DISABLE KEYS */;
INSERT INTO `transfer_type` VALUES (3,'Free Transfer'),(2,'Loan'),(5,'Loan with Obligation to Buy'),(4,'Loan with Option to Buy'),(1,'Permanent Transfer');
/*!40000 ALTER TABLE `transfer_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 16:14:22
