-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: south_property_db
-- ------------------------------------------------------
-- Server version       8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_logs`
--

DROP TABLE IF EXISTS `book_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_logs` (
  `book_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_book_logs_post_time` (`post_id`,`book_date`,`deleted_at`),
  CONSTRAINT `book_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `book_logs_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posters` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_logs`
--

LOCK TABLES `book_logs` WRITE;
/*!40000 ALTER TABLE `book_logs` DISABLE KEYS */;
INSERT INTO `book_logs` VALUES ('bk-3bdcb981-9d0c-496a-be7f-42bef84cd420','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','2025-09-01 16:00:00','2025-08-16 12:26:54',NULL,NULL);
/*!40000 ALTER TABLE `book_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landmarks`
--

DROP TABLE IF EXISTS `landmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landmarks` (
  `landmark_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance_km` decimal(10,2) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`landmark_id`),
  KEY `idx_landmarks_post` (`post_id`),
  CONSTRAINT `landmarks_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posters` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `landmarks_chk_1` CHECK ((`latitude` between -(90) and 90)),
  CONSTRAINT `landmarks_chk_2` CHECK ((`longitude` between -(180) and 180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landmarks`
--

LOCK TABLES `landmarks` WRITE;
/*!40000 ALTER TABLE `landmarks` DISABLE KEYS */;
INSERT INTO `landmarks` VALUES ('lmk-c89e518f-1ba9-4770-bc3c-d12f0d93a0e6','pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','BTS Siam',1.20,13.7466000,100.5328000,'2025-08-16 12:17:58','2025-08-16 12:17:58',NULL);
/*!40000 ALTER TABLE `landmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages_logs`
--

DROP TABLE IF EXISTS `messages_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages_logs` (
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message_text` text COLLATE utf8mb4_unicode_ci,
  `sent_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`),
  KEY `receiver_id` (`receiver_id`),
  CONSTRAINT `messages_logs_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `messages_logs_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages_logs`
--

LOCK TABLES `messages_logs` WRITE;
/*!40000 ALTER TABLE `messages_logs` DISABLE KEYS */;
INSERT INTO `messages_logs` VALUES ('msg-af0bbefb-cf43-471f-b28d-7276273aef69','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','Hello','2025-08-16 14:13:40'),('msg-c7c309cb-b15f-495d-8121-ede87a8db75a','usr-fbd3d949-805a-4403-8b68-c6456489684a','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','สวสดจาก user1','2025-08-16 13:48:46');
/*!40000 ALTER TABLE `messages_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_boosts`
--

DROP TABLE IF EXISTS `post_boosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_boosts` (
  `boost_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` enum('active','expire','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`boost_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_boosts_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posters` (`post_id`),
  CONSTRAINT `post_boosts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_boosts`
--

LOCK TABLES `post_boosts` WRITE;
/*!40000 ALTER TABLE `post_boosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_boosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_image`
--

DROP TABLE IF EXISTS `post_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_image` (
  `image_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `image_url` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `idx_post_image_post` (`post_id`),
  CONSTRAINT `post_image_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posters` (`post_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_image`
--

LOCK TABLES `post_image` WRITE;
/*!40000 ALTER TABLE `post_image` DISABLE KEYS */;
INSERT INTO `post_image` VALUES ('img_njxV7_gea74t','post_GhZazaKWrmc4','รูปน้าบี้','https://drive.google.com/file/d/1pa-LBGqOPTCZeexdqjjP2ZaY_MM6hwq9/view?usp=drive_link','2025-08-17 21:59:09',NULL),('img_UnXP3fUYGX0y','post_KEjrmd7ll7f8','รูปบ้าน','https://drive.google.com/file/d/1pa-LBGqOPTCZeexdqjjP2ZaY_MM6hwq9/view?usp=drive_link','2025-08-18 07:50:09',NULL),('img-68e05c5b-4106-4de5-8c8f-7f7263331a15','pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','front','https://picsum.photos/seed/condo/800/600','2025-08-16 12:17:58',NULL);
/*!40000 ALTER TABLE `post_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_likes`
--

DROP TABLE IF EXISTS `post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_likes` (
  `like_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `post_id` (`post_id`),
  KEY `idx_post_likes_user_post` (`user_id`,`post_id`),
  CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posters` (`post_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_likes`
--

LOCK TABLES `post_likes` WRITE;
/*!40000 ALTER TABLE `post_likes` DISABLE KEYS */;
INSERT INTO `post_likes` VALUES ('like-26343f06-add8-4789-bf26-c4343d7dfcc6','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','2025-08-16 12:24:03','2025-08-16 12:25:31');
/*!40000 ALTER TABLE `post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posters`
--

DROP TABLE IF EXISTS `posters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posters` (
  `post_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `post_type` enum('sale','rent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property_type` enum('house','condo','land','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `status` enum('active','inactive','sold') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `boost_date` datetime DEFAULT NULL,
  `land_area` decimal(15,2) DEFAULT NULL,
  `feasibility` text COLLATE utf8mb4_unicode_ci,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `bed_room` tinyint unsigned DEFAULT NULL,
  `bath_room` tinyint unsigned DEFAULT NULL,
  `kitchen_room` tinyint unsigned DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `viewer` int unsigned DEFAULT '0',
  `landmark_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`),
  KEY `idx_posters_status_created` (`status`,`created_at`),
  CONSTRAINT `posters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `posters_chk_1` CHECK ((`latitude` between -(90) and 90)),
  CONSTRAINT `posters_chk_2` CHECK ((`longitude` between -(180) and 180))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posters`
--

LOCK TABLES `posters` WRITE;
/*!40000 ALTER TABLE `posters` DISABLE KEYS */;
INSERT INTO `posters` VALUES ('post_5d4SzTso44mT','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04',NULL,'บ้านน้าบี้','ทดสอบบระบบ','sale','house',200000.00,'active',NULL,NULL,NULL,7.2185000,100.5985000,1,1,1,NULL,0,NULL,'2025-08-17 18:34:27','2025-08-17 18:34:27',NULL),('post_BqYkDPnoDisc','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04',NULL,'บ้านน้าบี้','ทดสอบระบบว่าสามมารถบันทึก โพสตืได้ไหม','rent','house',200000.00,'active',NULL,NULL,NULL,7.2185000,100.5985000,1,1,1,NULL,0,NULL,'2025-08-17 18:50:32','2025-08-17 18:50:32',NULL),('post_GhZazaKWrmc4','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04',NULL,'บ้านน้าบี้สุดหรูหรา','บ้านน้าบี้สุดหรูหราแพงจัดๆ','sale','house',1500000.00,'active',NULL,NULL,NULL,7.5151000,100.5484000,1,1,1,NULL,0,NULL,'2025-08-17 21:59:09','2025-08-17 21:59:09',NULL),('post_KEjrmd7ll7f8','usr-f7059b7c-519c-4830-80a5-510cac7d7dd1',NULL,'บ้่านหรูใจกลางเมืองสงขลา','บ้่านหรูใจกลางเมืองสงขลาใกล้ทะเล','sale','house',2000000.00,'active',NULL,NULL,NULL,7.5122000,100.2578000,1,1,1,NULL,0,NULL,'2025-08-18 07:50:09','2025-08-18 07:50:09',NULL),('post_mlTzHxBYy1sd','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04',NULL,'บ้านน้าบี้','ทดพสอบระบบ','sale','house',200000.00,'active',NULL,NULL,NULL,7.2185000,100.5985000,1,1,1,NULL,0,NULL,'2025-08-17 18:14:27','2025-08-18 07:26:20','2025-08-18 07:26:20'),('pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','usr-fbd3d949-805a-4403-8b68-c6456489684a',NULL,'คอนโดกลางเมือง','วิวสวย ทำเลดี ใกล้รถไฟฟ้า','sale','condo',2850000.00,'active',NULL,NULL,NULL,13.7563000,100.5018000,1,1,1,NULL,0,NULL,'2025-08-16 12:17:58','2025-08-18 07:59:00','2025-08-18 07:59:00');
/*!40000 ALTER TABLE `posters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scopes`
--

DROP TABLE IF EXISTS `scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scopes` (
  `scope_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`scope_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scopes`
--

LOCK TABLES `scopes` WRITE;
/*!40000 ALTER TABLE `scopes` DISABLE KEYS */;
INSERT INTO `scopes` VALUES ('scp-5ff804ce-e7ce-4276-b1df-ca671fe473b0','customer','2025-08-16 11:12:36','2025-08-16 11:12:36',NULL),('scp-d9299f7a-8582-40cf-94bd-28c76e1663e9','vendor','2025-08-16 11:12:36','2025-08-16 11:12:36',NULL),('scp-ed9a5932-be4e-41a7-8238-29ec609ab1cb','admin','2025-08-16 11:12:36','2025-08-16 11:12:36',NULL);
/*!40000 ALTER TABLE `scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_change_logs`
--

DROP TABLE IF EXISTS `user_change_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_change_logs` (
  `log_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `changed_field` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `updated-at` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_change_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_change_logs`
--

LOCK TABLES `user_change_logs` WRITE;
/*!40000 ALTER TABLE `user_change_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_change_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_scopes`
--

DROP TABLE IF EXISTS `user_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_scopes` (
  `user_sc_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_sc_id`),
  UNIQUE KEY `uniq_user_scope` (`user_id`,`scope_id`),
  KEY `scope_id` (`scope_id`),
  CONSTRAINT `user_scopes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_scopes_ibfk_2` FOREIGN KEY (`scope_id`) REFERENCES `scopes` (`scope_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_scopes`
--

LOCK TABLES `user_scopes` WRITE;
/*!40000 ALTER TABLE `user_scopes` DISABLE KEYS */;
INSERT INTO `user_scopes` VALUES ('uscp-662ed774-f6c1-4769-8969-d2b7cd4d0ec0','usr-fbd3d949-805a-4403-8b68-c6456489684a','scp-5ff804ce-e7ce-4276-b1df-ca671fe473b0',1,'2025-08-16 12:05:08',NULL,NULL),('uscp-792d019a-5202-41ab-913e-69baeff74136','usr-f1eb8999-14c4-4db6-89f2-80e871928a3a','scp-5ff804ce-e7ce-4276-b1df-ca671fe473b0',1,'2025-08-18 07:53:02',NULL,NULL),('uscp-7ab16df6-4874-4e09-9a46-7e520174ece4','usr-f7059b7c-519c-4830-80a5-510cac7d7dd1','scp-5ff804ce-e7ce-4276-b1df-ca671fe473b0',1,'2025-08-17 21:28:39',NULL,NULL),('uscp-d198b712-dbea-41e4-90b8-d2884ff07e60','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','scp-ed9a5932-be4e-41a7-8238-29ec609ab1cb',3,'2025-08-16 11:12:36','2025-08-18 04:21:58',NULL);
/*!40000 ALTER TABLE `user_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_th` enum('นาย','นางสาว','นาง') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_th` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_th` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` enum('Mr.','Ms.','Mrs.') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `cid_hash` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_status` enum('verified','pending','unverified') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `cid_hash` (`cid_hash`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `line` (`line`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('13f23d55-7903-11f0-975d-ca05c68852e7','user99','$2b$12$8XlpHdK0Ztrav7.p.j5nkeN66ZYH0BCMxMBuxi7IOLqPwb58z3Ekm','นาย','ทดสอบ','เพิ่มใหม่',NULL,NULL,NULL,'0812345678',NULL,'1999-12-31','ea701a4f412b8a9244dd64816d012a90a7173bb0bcc7eef65e723561c6b1eb43','user99@example.com','user99_line','pending','add by admin','2025-08-14 11:37:37','2025-08-14 11:40:13','2025-08-14 11:40:13'),('69d272cc-81d4-47ad-bb64-68b2807802c6','bosseiei','$2b$12$uijbqqy1rUYHMI6gmIsD0eSQKY7DDV1iBguZquH3ERbCmaODSZfuy','นาย','บอสอัปเดทใหม่','ทดสอบระบบใหม่','Mr.','Bos','Testsystem','0855994456','/uploads/avatars/69d272cc-81d4-47ad-bb64-68b2807802c6-1755264899870-532260005_1450877850173812_854422024884293715_n.jpg','2020-09-10','e326ad07d1641393f4e525a106d9b8ec57de20b22613e3660a7403699a4baffa','bossjie@example.com','bossja55+','verified','ทดสอบระบบ','2025-08-15 09:09:43','2025-08-18 07:22:37',NULL),('6eb23563-228e-443a-9ceb-dabad49b76f1','Boskub','$2b$12$OCQ3qt.opQGS2UJPz79S.egVKUl2.wZHK15QfWchTZbSICpH.O5Q.','นาย','บอส','ทดสอบ','Mr.','Bosco','Cobos','0872455588',NULL,'2006-05-16','2c25ef1020b11ebc389f98b69d5b50cc99fb01a912461b8b483d0a56fbecbf56','Bass475@gmail.com','Boseeiei','pending','ทดสอบระบบ','2025-08-14 13:21:30','2025-08-18 07:23:54','2025-08-18 07:23:54'),('ee8077c4-9516-4fed-b2ab-f3002216f792','boss433','$2b$12$BoFr2AS2akOTKQNH4vFnP.bpa.TJGVHIpW89Ur/WPWES2lHLraHxm','นาย','บอส','สุขใจ','Mr.','Boss','Happy','0890000000',NULL,'2000-01-01','080baba5d641fe9cd6c88e1b9ef109ee0b3e1b30aeb9adfd62ddec15ede3ac96','boss433@example.com','boss_line_unique','verified','สมัครทดสอบ','2025-08-14 10:30:23','2025-08-18 07:47:48',NULL),('f2e80e15-f609-424e-936a-5881819ae8e2','bosscool','$2b$12$kgJelcFUXPLRTFjVLmLxTeqMSQWnAKoz9dJ7QguCVVi6Q0JCh1Ir.','นาย','บอส','อัปเดต','Mr.','Songpol','Innosuwan','0801112222',NULL,'1999-12-31','b1946ac92492d2347c6235b4d2611184f0e4a3b1b2c3d4e5f6a7b8c9d0e1f2a3','boss@example.com','Boss433','verified','TestSystem','2025-08-14 08:58:21','2025-08-14 11:38:49',NULL),('usr-0a3065a7-b3d6-4582-9558-00d2038d7d04','admin','$2b$12$mr.iSbb60C8pbAxdMq3Aju5O6C09xPHHwg9vmkvqf0BQYbX9asSHC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'$2b$12$q.XJa8qwKkcDVk5oUH2z3u34nUmnZg6E07GqHK8RRn.vUpF874N4y','admin@example.com',NULL,'verified',NULL,'2025-08-16 11:12:36','2025-08-18 07:27:08',NULL),('usr-f1eb8999-14c4-4db6-89f2-80e871928a3a','bossco999','$2b$12$js17lK4tw6e4H9UAy9/b8Oe8MfZ0s9hEOibVYgnHMlQnXVyDQQEE6','นาย','สมาชิก','สมาชิก',NULL,NULL,NULL,'0952244422',NULL,NULL,'$2b$12$XHGvPjPo6OwNKf.Ilgnim.Ab43RHl4gMkQy4zYDc3LuevtQt8k69C','bossco999@example.com',NULL,'pending',NULL,'2025-08-18 07:53:02','2025-08-18 07:53:02',NULL),('usr-f7059b7c-519c-4830-80a5-510cac7d7dd1','bossco888','$2b$12$GCd8uTYXLxAX/7jRjTdcYOcPu9BvthBCMEL.vIiu9e0bvntmzxRSG','นาย','บอส','ทดลอง',NULL,NULL,NULL,'0988899988',NULL,NULL,'$2b$12$aJzgEPSd97ACB5DiFhThv.ZwTxZ1spl15Z6cGEo4/eM09IIbwe7ei','bossco888@example.com',NULL,'verified',NULL,'2025-08-17 21:28:39','2025-08-18 07:27:15',NULL),('usr-fbd3d949-805a-4403-8b68-c6456489684a','user1','$2b$12$zqZ0IfgleY71VEG/Bw2YJ.nxP9L97x/oVfOTWdYIpJybAOkUGOVVK','นาย','สมชาย','ทดลอง',NULL,NULL,NULL,'0812345678',NULL,NULL,'$2b$12$yT8I.PDOgAGXhuuOdp7fzuki8jFizDGzFcP3CdlenVtGS4qg6WbFq','u1@example.com',NULL,'verified',NULL,'2025-08-16 12:05:08','2025-08-16 12:13:10',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_transactions`
--

DROP TABLE IF EXISTS `wallet_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet_transactions` (
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wallet_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `transaction_type` enum('topup','post','boost','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `mean_detail` enum('เติมเงิน','ใช้เงินเพื่อโพสต์ประกาศ','ใช้เงินเพื่อดันประกาศ','เงินคืน') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `wallet_id` (`wallet_id`),
  KEY `idx_wallet_tx_user_time` (`user_id`,`created_at`),
  CONSTRAINT `wallet_transactions_ibfk_1` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`wallet_id`) ON DELETE CASCADE,
  CONSTRAINT `wallet_transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_transactions`
--

LOCK TABLES `wallet_transactions` WRITE;
/*!40000 ALTER TABLE `wallet_transactions` DISABLE KEYS */;
INSERT INTO `wallet_transactions` VALUES ('txn-56cb26c5-db31-45b7-8a63-f6ca554cbda5','wal-248d68f3-043c-444b-aea2-fe7351a23c68','usr-fbd3d949-805a-4403-8b68-c6456489684a',500.00,'topup','เติมเงิน',NULL,'2025-08-16 12:15:54'),('txn-9b5289d4-7b79-4653-a38e-9e7f91a3c9eb','wal-248d68f3-043c-444b-aea2-fe7351a23c68','usr-fbd3d949-805a-4403-8b68-c6456489684a',49.00,'post','ใช้เงินเพื่อโพสต์ประกาศ','Post fee for pst-8ac86fd2-5751-4d83-bfdf-f625716dc205','2025-08-16 12:17:58');
/*!40000 ALTER TABLE `wallet_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `wallet_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(15,2) DEFAULT '0.00',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wallet_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `idx_wallets_user` (`user_id`),
  CONSTRAINT `wallets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES ('wal-1fbb7cba-c30b-4199-97cb-b84b099b6c5c','usr-f7059b7c-519c-4830-80a5-510cac7d7dd1',0.00,'2025-08-17 21:28:39'),('wal-248d68f3-043c-444b-aea2-fe7351a23c68','usr-fbd3d949-805a-4403-8b68-c6456489684a',451.00,'2025-08-16 12:17:58'),('wal-372d988e-9bf6-459e-988a-d2d55b8d1ff4','usr-f1eb8999-14c4-4db6-89f2-80e871928a3a',0.00,'2025-08-18 07:53:02'),('wal-f0a16b34-b96c-45e8-bb63-c6c206a46198','usr-0a3065a7-b3d6-4582-9558-00d2038d7d04',10000.00,'2025-08-16 11:12:36');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-24 11:34:03