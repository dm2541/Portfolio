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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_code` varchar(20) NOT NULL,
  `cafe_code` varchar(45) NOT NULL,
  `product_price` int NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_type` tinyint DEFAULT '0',
  `product_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_code`),
  KEY `fk3_cafe_code_idx` (`cafe_code`),
  CONSTRAINT `fk_product_cafe_cafe_code` FOREIGN KEY (`cafe_code`) REFERENCES `cafe` (`cafe_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('AM001','100-001',3500,'아메리카노',1,'ㅇ'),('AM001-1','100-001',3500,'아이스아메리카노',0,'ㅇ'),('AM002','100-002',3200,'아메리카노',1,'ㅇ'),('AM002-1','100-002',3200,'아이스아메리카노',0,'ㅇ'),('AM003','100-003',3000,'아메리카노',1,'ㅇ'),('AM003-1','100-003',3000,'아이스아메리카노',0,'ㅇ'),('AM004','100-004',2500,'아메리카노',1,'ㅇ'),('AM004-1','100-004',2500,'아이스아메리카노',0,'ㅇ'),('AM005','100-005',4000,'아메리카노',1,'ㅇ'),('AM005-1','100-005',4000,'아이스아메리카노',0,'ㅇ'),('AM006','100-006',4200,'아메리카노',1,'ㅇ'),('AM006-1','100-006',4200,'아이스아메리카노',0,'ㅇ'),('AM007','100-007',3800,'아메리카노',1,'ㅇ'),('AM007-1','100-007',3800,'아이스아메리카노',0,'ㅇ'),('GA001','100-001',3500,'자몽에이드',0,'ㅇ'),('GA002','100-002',3500,'자몽에이드',0,'ㅇ'),('GA003','100-003',3700,'자몽에이드',0,'ㅇ'),('GA004','100-004',4000,'자몽에이드',0,'ㅇ'),('GA005','100-005',3500,'자몽에이드',0,'ㅇ'),('GA006','100-006',3500,'자몽에이드',0,'ㅇ'),('GA007','100-007',3800,'자몽에이드',0,'ㅇ'),('LT001','100-001',4000,'아이스카페라떼',0,'ㅇ'),('LT001-1','100-001',3800,'카페라떼',1,'ㅇ'),('LT002','100-002',3800,'아이스카페라떼',0,'ㅇ'),('LT002-1','100-002',3500,'카페라떼',1,'ㅇ'),('LT003','100-003',3700,'아이스카페라떼',0,'ㅇ'),('LT003-1','100-003',3300,'카페라떼',1,'ㅇ'),('LT004','100-004',3300,'아이스카페라떼',0,'ㅇ'),('LT004-1','100-004',2800,'카페라떼',1,'ㅇ'),('LT005','100-005',4500,'아이스카페라떼',0,'ㅇ'),('LT005-1','100-005',4300,'카페라떼',1,'ㅇ'),('LT006','100-006',4800,'아이스카페라떼',0,'ㅇ'),('LT006-1','100-006',4500,'카페라떼',1,'ㅇ'),('LT007','100-007',4500,'아이스카페라떼',0,'ㅇ'),('LT007-1','100-007',4100,'카페라떼',1,'ㅇ'),('PR001','100-001',2800,'탄산수',0,'ㅇ'),('PR002','100-002',3000,'탄산수',0,'ㅇ'),('PR003','100-003',3200,'탄산수',0,'ㅇ'),('PR004','100-004',3500,'탄산수',0,'ㅇ'),('PR005','100-005',3000,'탄산수',0,'ㅇ'),('PR006','100-006',3000,'탄산수',0,'ㅇ'),('PR007','100-007',3300,'탄산수',0,'ㅇ'),('VL001','100-001',4000,'바닐라라떼',1,'ㅇ'),('VL001-1','100-001',4000,'아이스바닐라라떼',0,'ㅇ'),('VL002','100-002',3800,'바닐라라떼',1,'ㅇ'),('VL002-1','100-002',3800,'아이스바닐라라떼',0,'ㅇ'),('VL003','100-003',3700,'바닐라라떼',1,'ㅇ'),('VL003-1','100-003',3700,'아이스바닐라라떼',0,'ㅇ'),('VL004','100-004',3300,'바닐라라떼',1,'ㅇ'),('VL004-1','100-004',3300,'아이스바닐라라떼',0,'ㅇ'),('VL005','100-005',4500,'바닐라라떼',1,'ㅇ'),('VL005-1','100-005',4500,'아이스바닐라라떼',0,'ㅇ'),('VL006','100-006',4800,'바닐라라떼',1,'ㅇ'),('VL006-1','100-006',4800,'아이스바닐라라떼',0,'ㅇ'),('VL007','100-007',4500,'바닐라라떼',1,'ㅇ'),('VL007-1','100-007',4500,'아이스바닐라라떼',0,'ㅇ');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
