-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cafe
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `cafe`
--

DROP TABLE IF EXISTS `cafe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafe` (
  `cafe_code` varchar(50) NOT NULL,
  `cafe_name` varchar(45) NOT NULL,
  `cafe_addr` varchar(100) NOT NULL,
  `cafe_tel` varchar(30) DEFAULT '',
  `cafe_star` decimal(10,1) DEFAULT '0.0',
  `cafe_img` varchar(50) NOT NULL,
  PRIMARY KEY (`cafe_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafe`
--

LOCK TABLES `cafe` WRITE;
/*!40000 ALTER TABLE `cafe` DISABLE KEYS */;
INSERT INTO `cafe` VALUES ('100-001','투썸플레이스 신논현역점','서울특별시 강남구 논현동 강남대로 476 어반 하이브 1 2층','02-540-2388',4.4,'ㅇㅇ'),('100-002','투썸플레이스강남KI타워점','서울특별시 서초구 강남대로69길 8','02-593-2388',4.2,'ㅇ'),('100-003','할리스커피','서울특별시 강남구 논현동 강남대로 478','02-545-6077',4.2,'ㅇㄹㅇㄹ'),('100-004','쿄베이커리','서울특별시 서초구 사평대로58길 6','02-536-2838',4.3,'ㅇㄹㅇㅇㄹ'),('100-005','달콤커피 ','서울특별시 서초구 반포1동 강남대로 495','02-511-9101',4.0,'ㅇㄹㅇ'),('100-006','탐앤탐스 강남역점','서울특별시 서초구 서초4동 서울 77 번 도로 55 1 층','02-532-0620',3.4,'ㅇㄹㅇ'),('100-007','엔젤리너스 강남역 사거리점',' 서울특별시 강남구 역삼동 테헤란로 116','02-3453-4172',3.8,'ㅇㄹㅇㄹㅇ');
/*!40000 ALTER TABLE `cafe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 14:26:17
