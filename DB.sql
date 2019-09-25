-- MySQL dump 10.13  Distrib 5.6.44, for Win64 (x86_64)
--
-- Host: localhost    Database: movietogether
-- ------------------------------------------------------
-- Server version	5.6.44-log

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `board` (
  `num` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `file` varchar(50) DEFAULT NULL,
  `re_ref` int(11) DEFAULT NULL,
  `re_lev` int(11) DEFAULT NULL,
  `re_seq` int(11) DEFAULT NULL,
  `readcount` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'hong gil dong','asdf','asdf','asdf',NULL,1,0,0,1,'2019-06-16 06:00:24','0:0:0:0:0:0:0:1'),(2,'asdf','asdf','asdf','asdf',NULL,2,0,0,4,'2019-06-16 06:01:17','0:0:0:0:0:0:0:1'),(3,'hong gil dong','asdf','ffff','asdf',NULL,3,0,0,2,'2019-06-16 06:01:27','0:0:0:0:0:0:0:1'),(4,'이승학','dd','[답글]','dd',NULL,2,1,4,3,'2019-06-16 06:15:25','0:0:0:0:0:0:0:1'),(5,'hong gil dong','asdf','[답글]','asdf',NULL,2,2,5,0,'2019-06-16 06:38:33','0:0:0:0:0:0:0:1'),(6,'hong gil dong','asdf','[답글]','asdf',NULL,1,1,1,1,'2019-06-16 06:38:51','0:0:0:0:0:0:0:1'),(7,'hong gil dong','asdf','[답글]asdf','asdf',NULL,1,2,2,1,'2019-06-16 06:38:58','0:0:0:0:0:0:0:1'),(8,'ef','ef','[답글]ef','ef',NULL,2,1,1,5,'2019-06-16 06:39:13','0:0:0:0:0:0:0:1'),(9,'hong gil dong','asb','eb','aeb',NULL,9,0,0,1,'2019-06-16 06:41:56','0:0:0:0:0:0:0:1'),(10,'db','asdb','asdb','asdb',NULL,10,0,0,0,'2019-06-16 06:42:08','0:0:0:0:0:0:0:1'),(11,'hong gil dong','asdf','[답글]asdf','asdf',NULL,2,2,3,1,'2019-06-16 06:42:56','0:0:0:0:0:0:0:1'),(12,'hong gil dong','asg','asg','asg',NULL,12,0,0,2,'2019-06-16 06:43:16','0:0:0:0:0:0:0:1'),(13,'hong gil dong','ef','[답글]','ef',NULL,2,2,2,1,'2019-06-16 07:08:56','0:0:0:0:0:0:0:1'),(14,'hong gil dong','wef','wef','ef',NULL,14,0,0,1,'2019-06-16 08:08:40','0:0:0:0:0:0:0:1'),(15,'hong gil dong3','asdf','asdf','asdf',NULL,15,0,0,2,'2019-06-16 08:11:51','0:0:0:0:0:0:0:1'),(16,'hong gil dong','asdf','asdf','qwf','인쇄6.png',16,0,0,2,'2019-06-16 08:20:17','0:0:0:0:0:0:0:1'),(17,'asdf','asdf','asdf','asdf','asdfsdf.txt',17,0,0,3,'2019-06-16 08:30:01','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `addr` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin2','hong gil dong','admin2',12,'경남 양산시 갓넘길 1','las2706@naver.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-16 21:11:16
