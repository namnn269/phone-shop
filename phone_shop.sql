-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: shoppingdb
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `user_mail` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `account_role` varchar(45) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_phone` varchar(15) DEFAULT NULL,
  `registered` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('nam1@gmail.com','12345678','0','nam1','tb1','0333273003',_binary '');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_mail` varchar(45) DEFAULT NULL,
  `order_status` bit(1) DEFAULT NULL,
  `order_discount_code` varchar(45) DEFAULT NULL,
  `order_address` varchar(45) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`),
  KEY `mail_pk_idx` (`user_mail`),
  CONSTRAINT `mail_pk` FOREIGN KEY (`user_mail`) REFERENCES `account` (`user_mail`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'nam1@gmail.com',_binary '\0',NULL,'tb1','2022-12-23 19:53:51'),(3,'nam1@gmail.com',_binary '\0',NULL,'tb1','2022-12-23 19:53:51'),(4,'nam1@gmail.com',_binary '\0',NULL,'tb1','2022-12-23 19:54:22'),(5,'nam1@gmail.com',_binary '\0',NULL,'tb1','2022-12-23 20:05:26'),(6,'nam1@gmail.com',_binary '\0',NULL,'tb1','2022-12-23 20:08:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_detail`
--

DROP TABLE IF EXISTS `orders_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_detail` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `amount` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  KEY `order_pk_idx` (`order_id`),
  KEY `product_pk_idx` (`product_id`),
  CONSTRAINT `order_pk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `product_pk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_detail`
--

LOCK TABLES `orders_detail` WRITE;
/*!40000 ALTER TABLE `orders_detail` DISABLE KEYS */;
INSERT INTO `orders_detail` VALUES (3,2,1,37.99),(4,2,4,37.99),(5,3,1,32.99),(6,7,3,17.99);
/*!40000 ALTER TABLE `orders_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `img_src` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `brand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'iPhone 11 Pro Max 512GB','Màn hình: 6.5\", Super Retina XDR\nHĐH: iOS 13\nCPU: Apple A13 Bionic 6 nhân\nRAM: 4 GB, ROM: 512 GB\nCamera: 3 camera 12 MP, Selfie: 12 MP',43.99,'https://cdn.tgdd.vn/Products/Images/42/210654/iphone-11-pro-max-512gb-gold-600x600.jpg','cellphone','apple'),(2,'iPhone 11 Pro Max 256GB','Màn hình: 6.5\", Super Retina XDR\nHĐH: iOS 13\nCPU: Apple A13 Bionic 6 nhân\nRAM: 4 GB, ROM: 512 GB\nCamera: 3 camera 12 MP, Selfie: 12 MP',37.99,'https://cdn.tgdd.vn/Products/Images/42/210653/iphone-11-pro-max-256gb-black-600x600.jpg','cellphone','apple'),(3,'iPhone Xs Max 256GB','Màn hình: 6.5\", Super Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 4 GB, ROM: 256 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',32.99,'https://cdn.tgdd.vn/Products/Images/42/190322/iphone-xs-max-256gb-white-600x600.jpg','cellphone','apple'),(4,'iPhone X 256GB','Màn hình: 5.8\", Super Retina\nHĐH: iOS 12\nCPU: Apple A11 Bionic 6 nhân\nRAM: 3 GB, ROM: 256 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',27.99,'https://cdn.tgdd.vn/Products/Images/42/190324/iphone-xs-256gb-white-600x600.jpg','cellphone','apple'),(5,'iPhone Xs 64GB','Màn hình: 5.8\", Super Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 4 GB, ROM: 64 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',24.99,'https://cdn.tgdd.vn/Products/Images/42/190321/iphone-xs-max-gold-600x600.jpg','cellphone','apple'),(6,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 3 GB, ROM: 128 GB\nCamera: 12 MP, Selfie: 7 MP',17.99,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(7,'iPhone Xr 128GB','Màn hình: 6.1\", Liquid Retina\nHĐH: iOS 12\nCPU: Apple A12 Bionic 6 nhân\nRAM: 3 GB, ROM: 128 GB\nCamera: 12 MP, Selfie: 7 MP',17.99,'https://cdn.tgdd.vn/Products/Images/42/191483/iphone-xr-128gb-red-600x600.jpg','cellphone','apple'),(8,'iPhone 8 Plus 64GB','Màn hình: 5.5\", Retina HD\nHĐH: iOS 12\nCPU: Apple A11 Bionic 6 nhân\nRAM: 3 GB, ROM: 64 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',16.59,'https://cdn.tgdd.vn/Products/Images/42/114110/iphone-8-plus-hh-600x600.jpg','cellphone','apple'),(9,'iPhone 7 Plus 32GB','Màn hình: 5.5\", Retina HD\nHĐH: iOS 12\nCPU: Apple A10 Fusion 4 nhân 64-bit\nRAM: 3 GB, ROM: 32 GB\nCamera: Chính 12 MP & Phụ 12 MP, Selfie: 7 MP',12.49,'https://cdn.tgdd.vn/Products/Images/42/78124/iphone-7-plus-32gb-gold-600x600.jpg','cellphone','apple'),(10,'iPhone 7 32GB','Màn hình: 4.7\", Retina HD\nHĐH: iOS 12\nCPU: Apple A10 Fusion 4 nhân 64-bit\nRAM: 2 GB, ROM: 32 GB\nCamera: 12 MP, Selfie: 7 MP',10.49,'https://cdn.tgdd.vn/Products/Images/42/74110/iphone-7-gold-600x600.jpg','cellphone','apple');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-24  3:10:23
