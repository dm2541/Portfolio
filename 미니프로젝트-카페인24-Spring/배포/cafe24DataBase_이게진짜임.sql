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
INSERT INTO `cafe` VALUES ('100-001','투썸플레이스 신논현역점','서울특별시 강남구 논현동 강남대로 476 어반 하이브 1 2층','02-540-2388',4.4,'ATwosomePlace.png'),('100-002','투썸플레이스강남KI타워점','서울특별시 서초구 강남대로69길 8','02-593-2388',4.2,'ATwosomePlace.png'),('100-003','할리스커피','서울특별시 강남구 논현동 강남대로 478','02-545-6077',4.2,'Hollys.png'),('100-004','쿄베이커리','서울특별시 서초구 사평대로58길 6','02-536-2838',4.3,'KyoBakery.PNG'),('100-005','달콤커피 ','서울특별시 서초구 반포1동 강남대로 495','02-511-9101',4.0,'dalkommCoffee.png'),('100-006','탐앤탐스 강남역점','서울특별시 서초구 서초4동 서울 77 번 도로 55 1 층','02-532-0620',3.4,'tomntoms.jpg'),('100-007','엔젤리너스 강남역 사거리점',' 서울특별시 강남구 역삼동 테헤란로 116','02-3453-4172',3.8,'angelinus.jpg');
/*!40000 ALTER TABLE `cafe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `cnum` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `cafe_code` varchar(50) NOT NULL,
  `content` varchar(500) DEFAULT '내용 없음',
  `comment_date` varchar(50) NOT NULL,
  `user_star` decimal(10,1) DEFAULT '0.0',
  PRIMARY KEY (`cnum`),
  KEY `fk_comment_user_user_id_idx` (`user_id`),
  KEY `fk_comment_cafe_cafe_code_idx` (`cafe_code`),
  CONSTRAINT `fk_comment_cafe_cafe_code` FOREIGN KEY (`cafe_code`) REFERENCES `cafe` (`cafe_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (5,'123','100-002','좌석이편해요','2020.04.1',3.5),(6,'jangmi','100-005','화장실이 깨끗해요','2020.03.31',4.5),(7,'lee','100-004','좌석이불편해요','2020.03.23',4.0),(8,'123','100-003','라떼맛있어요','2020.03.30',5.0),(9,'lee','100-001','깨끗해요','2020.03.22',5.0),(10,'lee','100-002','조용해서공부하기 좋아요','2020.03.21',4.0),(11,'lee','100-003','스텝이 친절해요','2020.03.19',4.5),(12,'zzanggu','100-001','콘센트가 부족해요','2020.03.01',4.0),(13,'zzanggu','100-002','콘센트 넉넉해서 좋아요','2020.03.03',4.0),(14,'zzanggu','100-003','음료들 맛있어요','2020.03.17',5.0),(15,'dongdong','100-001','음료양이많아요','2020.02.20',4.0),(16,'dongdong','100-002','공부하기 좋은환경','2020.03.01',5.0),(17,'dongdong','100-003','라떼맛이 좋습니다','2020.03.03',5.0),(18,'dongdong','100-004','그럭저럭','2020.03.13',3.5),(19,'dongdong','100-006','사장님이 친절해요','2020.03.14',4.0),(25,'jinbohyung','100-001','조용해서좋았어요','2020.03.04',4.0),(26,'jinbohyung','100-002','오렌지주스맛집','2020.03.08',4.0),(27,'jinbohyung','100-003','사장님 친절해요','2020.03.10',5.0),(28,'jinbohyung','100-004','커피맛있어요','2020.03.14',4.0),(29,'jinbohyung','100-005','음료가너무늦게나옴','2020.03.17',2.0),(30,'hou','100-001','분위기좋아요','2020.03.20',4.0),(31,'hou','100-003','음료맛이좋아요','2020.03.11',4.5),(32,'123','100-003','fgggggg','2020.04.06',3.0);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderlist` (
  `order_code` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `product_code` varchar(20) NOT NULL,
  `cafe_name` varchar(45) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  PRIMARY KEY (`order_code`),
  KEY `fk_order_user_user_id_idx` (`user_id`),
  KEY `fk_order_product_product_code_idx` (`product_code`),
  CONSTRAINT `fk_order_product_product_code` FOREIGN KEY (`product_code`) REFERENCES `product` (`product_code`),
  CONSTRAINT `fk_order_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_pw` varchar(45) NOT NULL,
  `user_nickName` varchar(45) NOT NULL,
  `user_tel` varchar(13) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123','123','뽀야','010-2264-8519'),('234','234','234','010-2222-2222'),('cy0815','1234','LeeCY','010-3080-8433'),('dongdong','1234','선보러가요','010-8888-8888'),('hou','1234','호우주의보','010-5555-5555'),('jangmi','1234','백장미','010-9999-9999'),('jinbohyung','1234','보버땡','010-2264-8519'),('lee','1234','LCY','010-1234-1234'),('zzanggu','1234','김짱구','010-3333-3333');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `wish_num` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `cafe_code` varchar(50) NOT NULL,
  `cafe_name` varchar(45) NOT NULL,
  `cafe_addr` varchar(100) NOT NULL,
  PRIMARY KEY (`wish_num`),
  KEY `fk_wish_user_user_id_idx` (`user_id`),
  KEY `fk_wish_cafe_cafe_code_idx` (`cafe_code`),
  CONSTRAINT `fk_wish_cafe_cafe_code` FOREIGN KEY (`cafe_code`) REFERENCES `cafe` (`cafe_code`),
  CONSTRAINT `fk_wish_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
INSERT INTO `wish` VALUES (1,'123','100-001','투썸플레이스 신논현역점','서울특별시 강남구 논현동 강남대로 476 어반 하이브 1 2층');
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-06 19:00:42
