-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: groupomania_database
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int DEFAULT NULL,
  `PostId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `PostId` (`PostId`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`PostId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (24,'Great post ! la photo est magnifique ! ','2022-10-24 11:54:37','2022-10-24 11:54:37',13,39),(25,'Super post\n','2022-10-24 12:41:51','2022-10-24 12:41:51',10,41),(26,'très jolie post','2022-10-24 13:38:41','2022-10-24 13:38:41',1,42),(27,'salut je suis un commentaires','2022-10-25 06:10:47','2022-10-25 06:10:47',10,39),(28,'jolie post','2022-10-25 07:10:14','2022-10-25 07:10:14',12,42),(29,'je t\'ai modifie la photo','2022-10-25 07:10:56','2022-10-25 07:10:56',1,41);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int DEFAULT NULL,
  `PostId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  KEY `PostId` (`PostId`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`PostId`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (43,'2022-10-24 11:26:16','2022-10-24 11:26:16',1,38),(44,'2022-10-24 11:27:38','2022-10-24 11:27:38',10,39),(46,'2022-10-24 11:28:23','2022-10-24 11:28:23',12,39),(47,'2022-10-24 11:28:25','2022-10-24 11:28:25',12,38),(48,'2022-10-24 11:30:05','2022-10-24 11:30:05',13,41),(50,'2022-10-24 11:30:07','2022-10-24 11:30:07',13,39),(51,'2022-10-24 11:30:08','2022-10-24 11:30:08',13,38),(52,'2022-10-24 12:41:45','2022-10-24 12:41:45',10,41),(54,'2022-10-24 13:38:35','2022-10-24 13:38:35',1,42),(57,'2022-10-25 06:12:22','2022-10-25 06:12:22',1,41),(59,'2022-10-25 07:10:08','2022-10-25 07:10:08',12,42),(60,'2022-10-27 09:45:51','2022-10-27 09:45:51',14,50);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (38,'Bonjour et bienvenue à tous et à toutes sur Groupomania, le réseau social de notre entreprise','http://localhost:3000/images/7064924.jpg1666610772796.jpg',NULL,'2022-10-24 11:26:12','2022-10-24 11:26:12',1),(39,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vestibulum nisi vel odio sagittis malesuada. Phasellus faucibus accumsan arcu eu luctus. Nulla aliquet enim at efficitur eleifend. Quisque euismod sed tellus at faucibus. Donec ac magna at purus fringilla elementum eget tempus magna. Ut sodales sollicitudin consectetur. Donec vel dolor. hello','http://localhost:3000/images/7064927.jpg1666610856073.jpg',NULL,'2022-10-24 11:27:36','2022-10-24 13:39:33',10),(41,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vestibulum nisi vel odio sagittis malesuada. Phasellus faucibus accumsan arcu eu luctus. Nulla aliquet enim at efficitur eleifend. Quisque euismod sed tellus at faucibus. Donec ac magna at purus fringilla elementum eget tempus magna. Ut sodales sollicitudin consectetur. Donec vel dolor.','http://localhost:3000/images/7064907.jpg1666681840109.jpg',NULL,'2022-10-24 11:29:40','2022-10-25 07:10:40',13),(42,'salut à tous','http://localhost:3000/images/7064925.jpg1666615346661.jpg',NULL,'2022-10-24 12:42:26','2022-10-24 12:43:48',10),(49,'hfjdhfjksldfsf','http://localhost:3000/images/7064924.jpg1666682431660.jpg',NULL,'2022-10-25 07:20:31','2022-10-25 07:20:31',1),(50,'Bonjour à tous','http://localhost:3000/images/7064925.jpg1666863948753.jpg',NULL,'2022-10-27 09:45:48','2022-10-27 09:45:48',14);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `lastName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Compte','Admin','admin@groupomania.com','$2b$10$qiojgxiXG/2mxhItTj5ZL.C5On4pIkHhtjWKmlvFbjX.LORSVuN1K',1,'jhdsklfhdsjkqfgldqgfjldfjkldsqlfgdsgfjldgfjlgdqslfgdlsqgfdsqjlfgdshlqfghdsqgfhlgsdqhfgsdqgfs','http://localhost:3000/images/7064839.jpg1662302946472.jpg','2021-09-23 12:44:01','2022-09-09 09:31:57'),(4,'Smith','Jean-Marc','JMSmith','jm.smith@gmail.com','$2a$10$GG4r7yOfKGtZK.6R1470QumoSaLpKTy2tieiOcx15dA/XmmWDlLmS',0,'testing profil','http://localhost:3000/images/6853032.jpg1662553814114.jpg','2022-09-07 12:24:25','2022-09-07 12:30:14'),(6,'New','Employee','newUSer','newuser@gmail.com','$2a$10$F0mmPNXRtfaVGX7Dt9nq1OyheHlnS5X3t3DGnfMEYhEnAJHlzB3t.',0,NULL,NULL,'2022-09-07 12:49:46','2022-09-07 12:49:46'),(7,'Errante','Vincent','Vincent','contact@errantevincent.com','$2a$10$iuMPM/DeJG02Dj6950vLHOSOoaTN4nLzy05LLMzN3U2bp7lhCvwIG',0,NULL,NULL,'2022-09-13 08:12:07','2022-09-13 08:12:07'),(9,'Barjo','Romain','romainbarjo','romainbarjo@gmail.com','$2a$10$//1jVq0EF93WkzfFyKn1B.eQMgeQc2edMmZCTpQ7BEIGJCFdQ2ky6',0,NULL,'http://localhost:3000/images/6737082.jpg1663242954559.jpg','2022-09-15 11:55:28','2022-09-15 11:55:54'),(10,'Pince','helene','Hélène','helenepince@gmail.com','$2a$10$V4W6b3.OY8VaGo4xav7G0OZ.Vil.F8PUJrUbSB4Ctv80K3UblNZBu',0,'je m\'amuse bien','http://localhost:3000/images/7064936.jpg1666678307287.jpg','2022-09-16 11:35:22','2022-10-25 06:11:47'),(11,'PINCE','Marie','mariepince','marie.pince@gmail.com','$2a$10$zM8leDftx6kd2CHqaYQbDOClnjJpU9Jdo4FrRWZfvrzMX.WHo0hoe',0,NULL,'http://localhost:3000/images/wp6100628.jpg1663599844458.jpg','2022-09-19 15:03:32','2022-09-19 15:04:04'),(12,'jesus','christ','Jesus','jesuschrist@gmail.com','$2a$10$pboSmQs0JSjjp/Matl.ubeqSJc3pf3YuPV07PTEVkg.1q5n9got7a',0,NULL,'http://localhost:3000/images/7064918.png1666681784911.png','2022-10-17 14:02:02','2022-10-25 07:09:44'),(13,'jean','Smith','jmSmith','jean.smith@gmail.com','$2a$10$dZvQZtrnceun2YLO8J7opegiS8a1nbxwJ76b1ASJtF2WbNAvazuf6',0,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vestibulum nisi vel odio sagittis malesuada. Phasellus faucibus accumsan arcu eu luctus. Nulla aliquet enim at efficitur eleifend. Quisque euismod sed tellus at faucibus. Donec ac magna at purus fringilla elementum eget tempus magna. Ut sodales sollicitudin consectetur. Donec vel dolor.','http://localhost:3000/images/6626651.jpg1666610989976.jpg','2022-10-24 11:29:22','2022-10-24 11:29:53'),(14,'Pince','Remi','Osiris70cl','remi.pince@outlook.com','$2a$10$yBEDpWy8DMDyC4q6f36X3e48wzIUFYK5EkAwNrSBWka2V/AiAmZWW',0,NULL,NULL,'2022-10-27 09:45:12','2022-10-27 09:45:12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-29 12:33:05
