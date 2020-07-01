-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: miniproject
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
  `product_code` varchar(9) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_price` int NOT NULL,
  `category` varchar(45) NOT NULL,
  `sell_id` varchar(20) NOT NULL,
  `product_img` varchar(900) NOT NULL,
  PRIMARY KEY (`product_code`),
  KEY `fk01_sell_id_idx` (`sell_id`),
  KEY `fk02_category_idx` (`category`),
  CONSTRAINT `fk01_sell_id` FOREIGN KEY (`sell_id`) REFERENCES `seller` (`sell_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('BB0001','꼭있어야되는바지',50000,'Bottom','admin','img/B_Musinsa.jpg'),('BJ0001','청바지를봐야됩니다',45000,'Bottom','admin','img/7654_shop1_882465.jpg'),('BL0001','이런스타일은어때요',40000,'Bottom','admin','img/484461_2_500.jpg'),('BT0001','이거입어도운동안함',50000,'Bottom','admin','img/S0121TFP30_BLK0_N01.jpg'),('OC0001','앙코트띠',70000,'Outer','admin','img/7621_shop1_434515.jpg'),('OC0002','검정코트',90000,'Outer','admin','img/7626_shop1_751133.jpg'),('OC0003','갈색코트',85000,'Outer','admin','img/7627_shop1_884752.jpg'),('OC0004','키큰사람만입는코트',90000,'Outer','admin','img/코트2.jpg'),('OJ0001','앙자켓띠',65000,'Outer','admin','img/7652_shop1_646088.jpg'),('OJ0002','유시진대위자켓',75000,'Outer','admin','img/O_Alpha.jpg'),('TH0001','COVERNAT후드띠',45000,'Top','admin','img/T_Covernat.jpg'),('TH0012','아무나소화못하는후드띠',47000,'Top','admin','img/자켓2_1.PNG'),('TT0001','앙긴팔띠',30000,'Top','admin','img/7362_shop1_615241.jpg'),('TT0002','앙긴팔띠22',35000,'Top','admin','img/7483_shop1_193002.jpg'),('TT0003','앙분홍긴팔띠',40000,'Top','admin','img/7535_shop1_204230.jpg'),('TT0004','OPENMIND',40000,'Top','admin','img/7537_shop1_588707.jpg'),('TT0012','이런옷이제일싫더라',34000,'Top','admin','img/캡처.PNG');
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

-- Dump completed on 2020-03-09  9:29:06
