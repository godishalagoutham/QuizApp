CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.4.1

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `answer` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'France',1),(2,1,'Croatia',0),(3,1,'Brazil',0),(4,1,'Germany',0),(5,2,'11',1),(6,2,'9',0),(7,2,'12',0),(8,2,'7',0),(9,3,'Football',1),(10,3,'Basketball',0),(11,3,'Cricket',0),(12,3,'Tennis',0),(13,4,'Barry Bonds',1),(14,4,'Hank Aaron',0),(15,4,'Babe Ruth',0),(16,4,'Sammy Sosa',0),(17,5,'50 meters',1),(18,5,'25 meters',0),(19,5,'100 meters',0),(20,5,'75 meters',0),(21,6,'Japan',1),(22,6,'China',0),(23,6,'Korea',0),(24,6,'Thailand',0),(25,7,'Basketball',1),(26,7,'Football',0),(27,7,'Volleyball',0),(28,7,'Tennis',0),(29,8,'Kareem Abdul-Jabbar',1),(30,8,'Michael Jordan',0),(31,8,'LeBron James',0),(32,8,'Kobe Bryant',0),(33,9,'Golf',1),(34,9,'Baseball',0),(35,9,'Basketball',0),(36,9,'Soccer',0),(37,10,'Hockey',1),(38,10,'Football',0),(39,10,'Cricket',0),(40,10,'Tennis',0),(41,11,'Au',1),(42,11,'Ag',0),(43,11,'Pb',0),(44,11,'Fe',0),(45,12,'Mars',1),(46,12,'Venus',0),(47,12,'Jupiter',0),(48,12,'Saturn',0),(49,13,'Mitochondria',1),(50,13,'Nucleus',0),(51,13,'Ribosome',0),(52,13,'Endoplasmic Reticulum',0),(53,14,'Carbon Dioxide',1),(54,14,'Oxygen',0),(55,14,'Nitrogen',0),(56,14,'Hydrogen',0),(57,15,'Diamond',1),(58,15,'Ruby',0),(59,15,'Sapphire',0),(60,15,'Emerald',0),(61,16,'Albert Einstein',1),(62,16,'Isaac Newton',0),(63,16,'Niels Bohr',0),(64,16,'Galileo Galilei',0),(65,17,'Ag',1),(66,17,'Au',0),(67,17,'Pb',0),(68,17,'Fe',0),(69,18,'Nitrogen',1),(70,18,'Oxygen',0),(71,18,'Carbon Dioxide',0),(72,18,'Hydrogen',0),(73,19,'299,792,458 meters per second',1),(74,19,'150,000,000 meters per second',0),(75,19,'500,000,000 meters per second',0),(76,19,'1,000,000 meters per second',0),(77,20,'Isaac Newton',1),(78,20,'Albert Einstein',0),(79,20,'Galileo Galilei',0),(80,20,'Niels Bohr',0),(81,21,'Leonardo da Vinci',1),(82,21,'Vincent van Gogh',0),(83,21,'Pablo Picasso',0),(84,21,'Claude Monet',0),(85,22,'A night sky',1),(86,22,'A field of flowers',0),(87,22,'A portrait of a woman',0),(88,22,'A cityscape',0),(89,23,'Salvador Dalí',1),(90,23,'Pablo Picasso',0),(91,23,'Henri Matisse',0),(92,23,'Claude Monet',0),(93,24,'Impressionism',1),(94,24,'Surrealism',0),(95,24,'Cubism',0),(96,24,'Realism',0),(97,25,'Michelangelo',1),(98,25,'Donatello',0),(99,25,'Leonardo da Vinci',0),(100,25,'Raphael',0),(101,26,'Andy Warhol',1),(102,26,'Roy Lichtenstein',0),(103,26,'Jackson Pollock',0),(104,26,'Willem de Kooning',0),(105,27,'The Creation of Adam',1),(106,27,'The Last Judgment',0),(107,27,'The School of Athens',0),(108,27,'The Birth of Venus',0),(109,28,'Abstract Expressionism',1),(110,28,'Impressionism',0),(111,28,'Realism',0),(112,28,'Cubism',0),(113,29,'Pablo Picasso',1),(114,29,'Henri Matisse',0),(115,29,'Salvador Dalí',0),(116,29,'Gustav Klimt',0),(117,30,'Pablo Picasso',1),(118,30,'Francisco Goya',0),(119,30,'Diego Rivera',0),(120,30,'Joan Miró',0),(121,31,'George Washington',1),(122,31,'Thomas Jefferson',0),(123,31,'John Adams',0),(124,31,'James Madison',0),(125,32,'The Declaration of Independence',1),(126,32,'The Constitution',0),(127,32,'The Bill of Rights',0),(128,32,'The Federalist Papers',0),(129,33,'Winston Churchill',1),(130,33,'Neville Chamberlain',0),(131,33,'Clement Attlee',0),(132,33,'Anthony Eden',0),(133,34,'South Africa',1),(134,34,'Switzerland',0),(135,34,'India',0),(136,34,'Canada',0),(137,35,'Margaret Thatcher',1),(138,35,'Theresa May',0),(139,35,'Priti Patel',0),(140,35,'Emily Thornberry',0),(141,36,'Amendment',1),(142,36,'Ratification',0),(143,36,'Legislation',0),(144,36,'Abrogation',0),(145,37,'Republican Party',0),(146,37,'Democratic Party',1),(147,37,'Libertarian Party',0),(148,37,'Green Party',0),(149,38,'Nikita Khrushchev',1),(150,38,'Leonid Brezhnev',0),(151,38,'Joseph Stalin',0),(152,38,'Mikhail Gorbachev',0),(153,39,'Direct Democracy',1),(154,39,'Constitutional Monarchy',0),(155,39,'Parliamentary Democracy',0),(156,39,'Federal Republic',0),(157,40,'United Nations',1),(158,40,'NATO',0),(159,40,'European Union',0),(160,40,'World Trade Organization',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (1,'Beginner'),(2,'Intermediate'),(3,'Professional');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `topic_id` int DEFAULT NULL,
  `level_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `level_id` (`level_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Which country won the FIFA World Cup in 2018?',1,1),(2,'What is the maximum number of players on a football team?',1,1),(3,'Which sport is known as \"the beautiful game\"?',1,2),(4,'Who holds the record for the most home runs in Major League Baseball?',1,2),(5,'What is the length of an Olympic swimming pool?',1,3),(6,'Which country is known for originating the sport of Judo?',1,3),(7,'In which sport would you perform a slam dunk?',1,1),(8,'Who is the all-time top scorer in the NBA?',1,2),(9,'What is the only sport to have been played on the moon?',1,3),(10,'Which sport is known for the term \"hat-trick\"?',1,1),(11,'What is the chemical symbol for Gold?',2,1),(12,'What planet is known as the Red Planet?',2,1),(13,'What is the powerhouse of the cell?',2,2),(14,'What gas do plants use for photosynthesis?',2,2),(15,'What is the hardest natural substance on Earth?',2,3),(16,'Who developed the theory of relativity?',2,3),(17,'What is the chemical symbol for Silver?',2,1),(18,'What is the most abundant gas in the Earth\'s atmosphere?',2,2),(19,'What is the speed of light?',2,2),(20,'Who is known as the father of modern physics?',2,3),(21,'Who painted the Mona Lisa?',3,1),(22,'What is the main subject of the painting \"Starry Night\"?',3,1),(23,'Which artist is known for the work \"The Persistence of Memory\"?',3,2),(24,'What art movement is Claude Monet associated with?',3,2),(25,'Who sculpted the statue of David?',3,3),(26,'Which artist is famous for his works \"Campbell\'s Soup Cans\" and \"Marilyn Diptych\"?',3,3),(27,'What is the name of the famous fresco painted by Michelangelo on the ceiling of the Sistine Chapel?',3,1),(28,'What is the main style of Jackson Pollock\'s paintings?',3,2),(29,'Who is known for his \"Blue Period\" paintings?',3,2),(30,'Which artist painted \"Guernica\"?',3,3),(31,'Who was the first President of the United States?',4,1),(32,'Which document declared American independence from Britain?',4,1),(33,'Who was the British Prime Minister during World War II?',4,2),(34,'Which country has the highest number of official languages?',4,2),(35,'Who was the first female Prime Minister of the United Kingdom?',4,3),(36,'What is the name of the process used to change a constitution?',4,3),(37,'Which political party is known for its red color in the United States?',4,1),(38,'Who was the leader of the Soviet Union during the Cuban Missile Crisis?',4,2),(39,'What type of government does Switzerland have?',4,3),(40,'Which international organization was established after World War II to prevent future conflicts?',4,1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (3,'Arts'),(4,'Politics'),(2,'Science & Technology'),(1,'Sports');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-15 18:46:27
