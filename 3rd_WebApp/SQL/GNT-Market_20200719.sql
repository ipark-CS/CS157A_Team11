-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gnt-market
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Basic Salad','Assorted vegetables tossed together'),(2,'Hamburger','Basic American Burger'),(3,'Stir-fry Veggies','Assorted Grilled Vegetables'),(4,'Mashed Califlower','Califlower mashed together'),(5,'Vegetable Juice','Blended Vegetable Juice'),(6,'Pasta','Basic Pasta Dish'),(7,'Roasted Chicken','Baked Chicken'),(8,'Ham & Eggs','Ham with Eggs'),(9,'Carrot Juice','Blended Carrot Juice'),(10,'Grape Juice','Blended Grape Juice'),(11,'Vegetable Soup','Assorted veggie soup'),(12,'Cherry Pie','Baked pie with cherries'),(13,'Lemonade','Classic Lemon Drink'),(14,'Steamed Asparagus','Steamed up asparagus'),(15,'Beef & Broccoli','Cooked beef and broccoli');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish_has_food`
--

DROP TABLE IF EXISTS `dish_has_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish_has_food` (
  `dish_id` int NOT NULL,
  `food_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_has_food`
--

LOCK TABLES `dish_has_food` WRITE;
/*!40000 ALTER TABLE `dish_has_food` DISABLE KEYS */;
INSERT INTO `dish_has_food` VALUES (1,2),(1,3),(1,4),(3,1),(3,2),(3,3),(2,14),(4,4),(14,1),(6,11),(6,14),(12,6),(9,3),(15,2),(15,12);
/*!40000 ALTER TABLE `dish_has_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Asparagus'),(2,'Broccoli'),(3,'Carrots'),(4,'Cauliflower'),(5,'Celery'),(6,'Cherries'),(7,'Grapefruit'),(8,'Grapes'),(9,'Kiwis'),(10,'Lemons / Limes'),(11,'Bacon / Sausage'),(12,'Beef'),(13,'Chicken'),(14,'Ground beef / Turkey'),(15,'Ham / Pork');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocerylist`
--

DROP TABLE IF EXISTS `grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grocerylist` (
  `list_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocerylist`
--

LOCK TABLES `grocerylist` WRITE;
/*!40000 ALTER TABLE `grocerylist` DISABLE KEYS */;
INSERT INTO `grocerylist` VALUES (1,'2020-07-05 16:12:36'),(2,'2020-07-05 16:12:41'),(3,'2020-07-05 16:12:45'),(4,'2020-07-05 16:12:48'),(5,'2020-07-05 16:12:53'),(6,'2020-07-05 16:12:56'),(7,'2020-07-05 16:12:59'),(8,'2020-07-05 16:13:02'),(9,'2020-07-05 16:13:09'),(10,'2020-07-05 16:13:11'),(11,'2020-07-05 16:13:14'),(12,'2020-07-05 16:13:17'),(13,'2020-07-05 16:13:20'),(14,'2020-07-05 16:13:25'),(15,'2020-07-05 16:13:31');
/*!40000 ALTER TABLE `grocerylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_adds_food`
--

DROP TABLE IF EXISTS `user_adds_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_adds_food` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_adds_food`
--

LOCK TABLES `user_adds_food` WRITE;
/*!40000 ALTER TABLE `user_adds_food` DISABLE KEYS */;
INSERT INTO `user_adds_food` VALUES (1,1),(4,5),(5,5),(7,6),(9,4),(9,5),(10,9),(12,12),(15,15),(11,2),(13,3),(14,7),(12,8),(15,5),(2,2);
/*!40000 ALTER TABLE `user_adds_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_creates_grocerylist`
--

DROP TABLE IF EXISTS `user_creates_grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_creates_grocerylist` (
  `user_id` int DEFAULT NULL,
  `list_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_creates_grocerylist`
--

LOCK TABLES `user_creates_grocerylist` WRITE;
/*!40000 ALTER TABLE `user_creates_grocerylist` DISABLE KEYS */;
INSERT INTO `user_creates_grocerylist` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,15),(8,14),(9,13),(10,12),(11,11),(12,10),(13,9),(14,8),(15,7),(NULL,1),(NULL,2),(NULL,3),(NULL,4),(NULL,5),(NULL,6),(NULL,7),(NULL,8),(NULL,9),(NULL,10),(NULL,11),(NULL,12),(NULL,13),(NULL,14),(NULL,15),(NULL,1),(NULL,2),(NULL,3),(NULL,4),(NULL,5),(NULL,6),(NULL,7),(NULL,8),(NULL,9),(NULL,10),(NULL,11),(NULL,12),(NULL,13),(NULL,14),(NULL,15);
/*!40000 ALTER TABLE `user_creates_grocerylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_marks_food`
--

DROP TABLE IF EXISTS `user_marks_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_marks_food` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_marks_food`
--

LOCK TABLES `user_marks_food` WRITE;
/*!40000 ALTER TABLE `user_marks_food` DISABLE KEYS */;
INSERT INTO `user_marks_food` VALUES (1,1,0,1),(2,1,0,0),(3,3,1,0),(1,11,1,0),(4,5,0,1),(5,5,0,1),(7,6,0,1),(9,4,0,1),(9,5,0,1),(10,9,0,1),(11,12,1,0),(4,8,1,0),(12,12,0,1),(13,11,1,0),(15,15,0,1);
/*!40000 ALTER TABLE `user_marks_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selects_dish`
--

DROP TABLE IF EXISTS `user_selects_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_selects_dish` (
  `user_id` int NOT NULL,
  `dish_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_selects_dish`
--

LOCK TABLES `user_selects_dish` WRITE;
/*!40000 ALTER TABLE `user_selects_dish` DISABLE KEYS */;
INSERT INTO `user_selects_dish` VALUES (1,1),(1,2),(2,2),(3,5),(6,4),(4,4),(8,3),(9,11),(14,12),(12,10),(13,13),(11,9),(13,10),(14,14),(15,15);
/*!40000 ALTER TABLE `user_selects_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'testuser1@example.com','passtest123','First Last'),(2,'testuser2@example.com','pass90',NULL),(3,'testuser3@example.com','sqlop90',NULL),(4,'testuser4@example.com','f4fopi5',NULL),(5,'testuser5@example.com','fiver',NULL),(6,'testuser6@example.com','qrghbdsed52',NULL),(7,'testuser7@example.com','septem',NULL),(8,'testuser8@example.com','passtest123',NULL),(9,'testuser9@example.com','sjsucs157a',NULL),(10,'testuser10@example.com','encrypted',NULL),(11,'testuser11@example.com','password',NULL),(12,'testuser12@example.com','defend',NULL),(13,'testuser13@example.com','the',NULL),(14,'testuser14@example.com','east',NULL),(15,'testuser15@example.com','wall!',NULL);
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

-- Dump completed on 2020-07-19 20:02:37
