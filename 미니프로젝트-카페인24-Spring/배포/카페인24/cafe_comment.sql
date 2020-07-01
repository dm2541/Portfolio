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
  CONSTRAINT `fk_comment_cafe_cafe_code` FOREIGN KEY (`cafe_code`) REFERENCES `cafe` (`cafe_code`),
  CONSTRAINT `fk_comment_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'123','100-001','맛없어요','2020.04.05',2.0),(5,'123','100-002','좌석이편해요','2020.04.1',3.5),(6,'jangmi','100-005','화장실이 깨끗해요','2020.03.31',4.5),(7,'lee','100-004','좌석이불편해요','2020.03.23',4.0),(8,'123','100-003','라떼맛있어요','2020.03.30',5.0),(9,'lee','100-001','깨끗해요','2020.03.22',5.0),(10,'lee','100-002','조용해서공부하기 좋아요','2020.03.21',4.0),(11,'lee','100-003','스텝이 친절해요','2020.03.19',4.5),(12,'zzanggu','100-001','콘센트가 부족해요','2020.03.01',4.0),(13,'zzanggu','100-002','콘센트 넉넉해서 좋아요','2020.03.03',4.0),(14,'zzanggu','100-003','음료들 맛있어요','2020.03.17',5.0),(15,'dongdong','100-001','음료양이많아요','2020.02.20',4.0),(16,'dongdong','100-002','공부하기 좋은환경','2020.03.01',5.0),(17,'dongdong','100-003','라떼맛이 좋습니다','2020.03.03',5.0),(18,'dongdong','100-004','그럭저럭','2020.03.13',3.5),(19,'dongdong','100-006','사장님이 친절해요','2020.03.14',4.0),(25,'jinbohyung','100-001','조용해서좋았어요','2020.03.04',4.0),(26,'jinbohyung','100-002','오렌지주스맛집','2020.03.08',4.0),(27,'jinbohyung','100-003','사장님 친절해요','2020.03.10',5.0),(28,'jinbohyung','100-004','커피맛있어요','2020.03.14',4.0),(29,'jinbohyung','100-005','음료가너무늦게나옴','2020.03.17',2.0),(30,'hou','100-001','분위기좋아요','2020.03.20',4.0),(31,'hou','100-003','음료맛이좋아요','2020.03.11',4.5);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
