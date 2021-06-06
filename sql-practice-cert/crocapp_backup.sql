-- MySQL dump 10.17  Distrib 10.3.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: crocapp
-- ------------------------------------------------------
-- Server version	10.3.21-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `crocapp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `crocapp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `crocapp`;

--
-- Table structure for table `userapps`
--

DROP TABLE IF EXISTS `userapps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userapps` (
  `appname` varchar(50) NOT NULL,
  `appyear` year(4) NOT NULL,
  `applastupdate` date NOT NULL,
  `appcode` varchar(50) NOT NULL,
  `userexperience` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapps`
--

LOCK TABLES `userapps` WRITE;
/*!40000 ALTER TABLE `userapps` DISABLE KEYS */;
INSERT INTO `userapps` VALUES ('call or ruty',2016,'2017-06-01','x32y85','expert',1),('prubj',2019,'2020-01-01','k98o21','noob',2),('worl',2020,'2020-04-01','er54q12','mid',3),('exfel',2016,'2018-08-01','r45p21','expert',4),('libre',2018,'2019-02-01','u45p21','mid',5),('wpz',2019,'2020-02-01','m98p21','mid',6),('cclearer',2015,'2019-01-01','g21f43','noob',7),('drawerx',2016,'2016-12-01','h54j76','expert',8);
/*!40000 ALTER TABLE `userapps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userbirth`
--

DROP TABLE IF EXISTS `userbirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userbirth` (
  `usermonth` varchar(50) NOT NULL,
  `useryear` year(4) NOT NULL,
  `userhospitalvalue` int(11) NOT NULL,
  `usersign` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userbirth`
--

LOCK TABLES `userbirth` WRITE;
/*!40000 ALTER TABLE `userbirth` DISABLE KEYS */;
INSERT INTO `userbirth` VALUES ('Jan',1997,56,'Capr',1),('Mar',1985,32,'Arie',2),('Oct',1993,88,'Libr',3),('Aug',1991,99,'Leo',4),('Sep',1983,100,'Virg',5),('Apr',1989,15,'Arie',6),('May',1991,77,'Taur',7),('May',1989,38,'Taur',8);
/*!40000 ALTER TABLE `userbirth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdetails`
--

DROP TABLE IF EXISTS `userdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdetails` (
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `property1` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdetails`
--

LOCK TABLES `userdetails` WRITE;
/*!40000 ALTER TABLE `userdetails` DISABLE KEYS */;
INSERT INTO `userdetails` VALUES ('kayla','nreggs','76 goku st','431991','JSH',1),('gemma','skar','89 gohan ave','431999','RMQ',2),('miss','niafit','110 trunks rd','431991','UUY',3),('queen','trazy','334 picollo st','432883','OPA',4),('lucious','nanci','887 bulma ave','431441','IKM',5),('amourde','lavie','549 veget rd','432552','VVB',6),('sophie','zelfies','781 goten rd','4319001','MEZ',7),('yinet','baesh','331 chichi ln','432552','FRT',8);
/*!40000 ALTER TABLE `userdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useros`
--

DROP TABLE IF EXISTS `useros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userosx` varchar(50) NOT NULL,
  `userversion` varchar(50) NOT NULL,
  `userexpertise` varchar(50) NOT NULL,
  `userostheme` varchar(50) NOT NULL,
  `useroscost` int(11) NOT NULL DEFAULT 10,
  PRIMARY KEY (`id`),
  UNIQUE KEY `useros_uniq1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useros`
--

LOCK TABLES `useros` WRITE;
/*!40000 ALTER TABLE `useros` DISABLE KEYS */;
INSERT INTO `useros` VALUES (1,'Linux','4.26','expert','gnome',100),(2,'Ruindows','10','noob','traditional',30),(3,'Ruindows','7','mid','traditional',20),(4,'Linux','5.3','expert','kde',45),(5,'Mac','12','mid','traditional',22),(6,'Linux','5.1','mid','fluxbox',200),(7,'Mac','12','noob','dark',500),(8,'Linux','4.9','expert','mate',30);
/*!40000 ALTER TABLE `useros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(60) NOT NULL,
  `userpassword` varchar(50) NOT NULL,
  `userrandomkey` int(11) NOT NULL,
  `useremail` varchar(50) DEFAULT NULL,
  `useralias` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('kneggs','123qwe',234,'kn@davs.tech','goku21',1),('gstar','123asd',567,'gs@davs.tech','gohan21',2),('mfit','234qwe',543,'mf@davs.tech','trunks21',3),('qtrazy','234asd',8876,'qt@davs.tech','picollo21',4),('nanci1','345qwe',441,'ln@davs.tech','bulma21',5),('alavie','345zxc',234,'al@davs.tech','veget21',6),('selfies','345asd',736,'sp@davs.tech','goten21',7),('ybaesh','456qwe',227,'yb@davs.tech','chichi21',8);
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

-- Dump completed on 2020-06-14 20:32:07
