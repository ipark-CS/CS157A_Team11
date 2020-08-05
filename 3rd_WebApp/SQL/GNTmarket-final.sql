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
INSERT INTO `dish` VALUES (1,'Basic Salad','Assorted vegetables tossed together'),(2,'Hamburger','Basic American Burger'),(3,'Stir-fry Veggies','Assorted Grilled Vegetables'),(4,'Mashed Potatoes','Potatoes mashed together'),(5,'Vegetable Juice','Blended Vegetable Juice'),(6,'Pasta','Basic Pasta Dish'),(7,'Roasted Chicken','Baked Chicken'),(8,'Ham & Eggs','Ham with Eggs'),(9,'Carrot Juice','Blended Carrot Juice'),(10,'Grape Juice','Blended Grape Juice'),(11,'Brococli Soup','Assorted veggie soup'),(12,'Cherry Pie','Baked pie with cherries'),(13,'Lemonade','Classic Lemon Drink'),(14,'Steamed Asparagus','Steamed up asparagus'),(15,'Beef & Broccoli','Cooked beef and broccoli');
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
  `food_id` int NOT NULL,
  PRIMARY KEY (`dish_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish_has_food`
--

LOCK TABLES `dish_has_food` WRITE;
/*!40000 ALTER TABLE `dish_has_food` DISABLE KEYS */;
INSERT INTO `dish_has_food` VALUES (1,2),(1,3),(1,4),(1,22),(1,23),(2,14),(2,16),(2,17),(3,1),(3,2),(3,3),(3,5),(3,26),(4,4),(4,25),(5,5),(5,19),(5,23),(6,11),(6,14),(6,18),(6,19),(7,13),(7,24),(8,15),(8,26),(8,27),(9,3),(9,29),(10,8),(10,9),(11,2),(11,16),(11,20),(12,6),(12,20),(12,21),(13,10),(13,21),(14,1),(14,25),(14,26),(15,2),(15,12),(15,25);
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
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Asparagus'),(2,'Broccoli'),(3,'Carrots'),(4,'Cauliflower'),(5,'Celery'),(6,'Cherries'),(7,'Grapefruit'),(8,'Grapes'),(9,'Kiwis'),(10,'Lemons / Limes'),(11,'Bacon / Sausage'),(12,'Beef'),(13,'Chicken'),(14,'Ground beef / Turkey'),(15,'Ham / Pork'),(16,'Cheese'),(17,'Bread'),(18,'Noodle'),(19,'Tomatoes'),(20,'Flour'),(21,'Sugar'),(22,'Lettus'),(23,'Spinach'),(24,'Rosemary'),(25,'Galic '),(26,'Canola Oil'),(27,'Eggs'),(28,'Walnut'),(29,'Apple'),(30,'Beans'),(31,'Potatoes');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_has_nutrient`
--

DROP TABLE IF EXISTS `food_has_nutrient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_has_nutrient` (
  `food_id` int NOT NULL,
  `nutrient_id` int NOT NULL,
  `quantity` decimal(5,2) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`,`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_has_nutrient`
--

LOCK TABLES `food_has_nutrient` WRITE;
/*!40000 ALTER TABLE `food_has_nutrient` DISABLE KEYS */;
INSERT INTO `food_has_nutrient` VALUES (1,6001,2.60,'asparagus has 2.6g carbohydrates'),(1,6003,1.50,'asparagus has 1.5g protein'),(1,6004,0.10,'asparagus has 1.5g fat'),(1,6005,1.40,'asparagus has 1.4g fiber'),(1,6019,0.00,'asparagus has 0.38mg vitamin C'),(2,6001,2.60,'has 2.6g carbohydrates'),(2,6003,1.50,'has 1.5g protein'),(2,6004,0.10,'has 1.5g fat'),(3,6005,1.40,'has 1.4g fiber'),(3,6019,0.00,'has 0.38mg vitamin C'),(4,6001,2.60,'has 2.6g carbohydrates'),(4,6012,0.27,'have 268mg potassium'),(5,6003,1.50,'has 1.5g protein'),(6,6001,19.00,'cherries have 19g carbohydrates'),(6,6003,1.60,'cherries have 1.6g protein'),(6,6005,2.50,'cherries have 2.5g fiber'),(6,6012,0.27,'cherries have 268mg potassium'),(7,6001,2.60,'has 2.6g carbohydrates'),(7,6003,1.50,'has 1.5g protein'),(7,6012,0.27,'have 268mg potassium'),(8,6004,0.10,'has 1.5g fat'),(9,6001,10.00,'kiwi has 10g carbohydrates'),(9,6004,0.40,'kiwi has 0.4g fat'),(9,6012,0.22,'kiwi has 215mg potassium'),(10,6005,1.40,'has 1.4g fiber'),(10,6012,0.27,'have 268mg potassium'),(10,6019,0.00,'has 0.38mg vitamin C'),(11,6003,2.90,'bacon has 2.9g protein'),(11,6004,3.50,'bacon has 3.5g fat'),(11,6012,0.04,'bacon has 44mg potassium'),(11,6014,0.18,'bacon has 178mg sodium'),(11,6017,0.01,'bacon has 9mg cholesterol'),(12,6001,2.60,'has 2.6g carbohydrates'),(13,6003,1.50,'has 1.5g protein'),(14,6004,0.10,'has 1.5g fat'),(14,6005,1.40,'has 1.4g fiber'),(14,6019,0.00,'has 0.38mg vitamin C'),(15,6012,0.27,'have 268mg potassium'),(16,6001,2.60,'has 2.6g carbohydrates'),(17,6003,1.50,'has 1.5g protein'),(18,6004,0.10,'has 1.5g fat'),(19,6005,1.40,'has 1.4g fiber'),(19,6012,0.27,'have 268mg potassium'),(19,6019,0.00,'has 0.38mg vitamin C'),(20,6001,2.60,'has 2.6g carbohydrates'),(21,6003,1.50,'has 1.5g protein'),(22,6004,0.10,'has 1.5g fat'),(23,6005,1.40,'has 1.4g fiber'),(24,6012,0.27,'have 268mg potassium'),(24,6019,0.00,'has 0.38mg vitamin C'),(25,6001,2.60,'has 2.6g carbohydrates'),(25,6003,1.50,'has 1.5g protein'),(25,6004,0.10,'has 1.5g fat'),(26,6005,1.40,'has 1.4g fiber'),(27,6019,0.00,'has 0.38mg vitamin C'),(28,6012,0.27,'have 268mg potassium'),(29,6001,2.60,'has 2.6g carbohydrates'),(29,6003,1.50,'has 1.5g protein'),(29,6004,0.10,'has 1.5g fat'),(30,6005,1.40,'has 1.4g fiber'),(31,6012,0.27,'have 268mg potassium'),(31,6019,0.00,'has 0.38mg vitamin C');
/*!40000 ALTER TABLE `food_has_nutrient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_lists_grocerylist`
--

DROP TABLE IF EXISTS `food_lists_grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_lists_grocerylist` (
  `food_id` int NOT NULL,
  `list_id` int NOT NULL,
  PRIMARY KEY (`food_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_lists_grocerylist`
--

LOCK TABLES `food_lists_grocerylist` WRITE;
/*!40000 ALTER TABLE `food_lists_grocerylist` DISABLE KEYS */;
INSERT INTO `food_lists_grocerylist` VALUES (1,12),(1,13),(1,16),(1,17),(1,19),(1,20),(1,33),(1,34),(1,35),(1,100),(1,210),(2,12),(2,26),(2,27),(2,28),(2,29),(2,30),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,100),(3,12),(3,14),(3,23),(3,24),(3,52),(3,54),(3,100),(4,13),(4,22),(4,31),(4,200),(5,14),(5,27),(5,28),(5,29),(5,30),(5,37),(5,38),(5,39),(5,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(5,49),(5,50),(5,51),(5,52),(5,54),(6,21),(6,36),(6,210),(7,14),(7,24),(7,210),(8,13),(8,25),(8,55),(9,12),(9,29),(9,30),(9,37),(9,38),(9,39),(9,40),(9,41),(9,42),(9,43),(9,44),(9,45),(9,46),(9,47),(9,48),(9,49),(9,50),(9,55),(9,56),(9,210),(10,14),(11,12),(11,14),(12,13),(12,40),(12,41),(12,42),(12,43),(12,44),(12,45),(12,46),(12,47),(12,48),(12,49),(12,50),(12,55),(13,12),(13,34),(13,53),(13,54),(14,18),(14,22),(14,34),(14,53),(14,57),(15,14),(15,200),(16,18),(16,22),(16,53),(16,57),(17,18),(17,22),(17,53),(17,57),(17,210),(18,47),(18,48),(18,49),(18,50),(18,54),(21,53),(22,53),(23,49),(23,50),(23,56),(25,22),(25,48),(25,49),(25,50),(25,57),(25,200),(26,32),(26,200),(27,200),(29,50),(29,52),(29,53),(29,54);
/*!40000 ALTER TABLE `food_lists_grocerylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grocerylist`
--

DROP TABLE IF EXISTS `grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grocerylist` (
  `list_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grocerylist`
--

LOCK TABLES `grocerylist` WRITE;
/*!40000 ALTER TABLE `grocerylist` DISABLE KEYS */;
INSERT INTO `grocerylist` VALUES (1,'2020-07-05 16:12:36'),(2,'2020-07-05 16:12:41'),(3,'2020-07-05 16:12:45'),(4,'2020-07-05 16:12:48'),(5,'2020-07-05 16:12:53'),(6,'2020-07-05 16:12:56'),(7,'2020-07-05 16:12:59'),(8,'2020-07-05 16:13:02'),(9,'2020-07-05 16:13:09'),(10,'2020-07-05 16:13:11'),(11,'2020-07-05 16:13:14'),(12,'2020-07-05 16:13:17'),(13,'2020-07-05 16:13:20'),(14,'2020-07-05 16:13:25'),(15,'2020-07-05 16:13:31'),(16,'2020-08-01 23:32:26'),(17,'2020-08-01 23:32:37'),(18,'2020-08-01 23:33:32'),(19,'2020-08-01 23:33:50'),(20,'2020-08-01 23:34:09'),(21,'2020-08-01 23:34:50'),(22,'2020-08-01 23:35:35'),(23,'2020-08-02 09:57:33'),(24,'2020-08-02 09:57:59'),(25,'2020-08-02 10:07:16'),(26,'2020-08-02 10:14:38'),(27,'2020-08-02 12:31:52'),(28,'2020-08-02 12:41:37'),(29,'2020-08-02 12:42:10'),(30,'2020-08-02 12:42:27'),(31,'2020-08-02 14:58:17'),(32,'2020-08-02 15:17:21'),(33,'2020-08-02 15:41:38'),(34,'2020-08-02 15:42:22'),(35,'2020-08-02 15:43:17'),(36,'2020-08-02 15:50:11'),(37,'2020-08-02 17:58:22'),(38,'2020-08-02 17:58:32'),(39,'2020-08-02 17:58:49'),(40,'2020-08-02 18:55:18'),(41,'2020-08-02 18:55:30'),(42,'2020-08-02 18:55:41'),(43,'2020-08-02 18:56:00'),(44,'2020-08-02 19:08:53'),(45,'2020-08-02 19:09:00'),(46,'2020-08-02 19:09:47'),(47,'2020-08-02 19:11:22'),(48,'2020-08-02 19:12:12'),(49,'2020-08-02 19:13:23'),(50,'2020-08-02 19:13:40'),(51,'2020-08-03 00:21:28'),(52,'2020-08-03 00:22:22'),(53,'2020-08-03 00:23:18'),(54,'2020-08-03 21:11:06'),(55,'2020-08-03 21:44:04'),(56,'2020-08-04 11:58:51'),(57,'2020-08-04 22:54:33');
/*!40000 ALTER TABLE `grocerylist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrient`
--

DROP TABLE IF EXISTS `nutrient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrient` (
  `nutrient_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrient`
--

LOCK TABLES `nutrient` WRITE;
/*!40000 ALTER TABLE `nutrient` DISABLE KEYS */;
INSERT INTO `nutrient` VALUES (6001,'Carbohydrate'),(6002,'Polyunsaturated fat'),(6003,'Protein'),(6004,'Saturated Fat'),(6005,'Total Dietary Fiber'),(6006,'Calcium'),(6007,'Fluoride'),(6008,'Iron'),(6009,'Magnesium'),(6010,'Manganese'),(6011,'Phosphorus'),(6012,'Potassium'),(6013,'Selenium'),(6014,'Sodium'),(6015,'Zinc'),(6016,'Caffeine'),(6017,'Cholesterol'),(6018,'Omega-3 Fatty Acid'),(6019,'Vitamin C'),(6020,'Vitamin B'),(6021,'Vitamin D'),(6023,'Vitamin E'),(6024,'Water'),(6025,'Vitamine A');
/*!40000 ALTER TABLE `nutrient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutrient_helps_bodysystem`
--

DROP TABLE IF EXISTS `nutrient_helps_bodysystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutrient_helps_bodysystem` (
  `nutrient_id` int NOT NULL,
  `body_sys_id` int NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`,`body_sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutrient_helps_bodysystem`
--

LOCK TABLES `nutrient_helps_bodysystem` WRITE;
/*!40000 ALTER TABLE `nutrient_helps_bodysystem` DISABLE KEYS */;
INSERT INTO `nutrient_helps_bodysystem` VALUES (6004,414,'protein helps skin/hair/nails'),(6005,402,'fiber helps digestive system'),(6006,406,'calcium helps skeletal system'),(6006,407,'calcium helps muscle system'),(6006,414,'calcium helps skin/hair/nails'),(6007,406,'fluoride helps skeletal system'),(6008,405,'iron helps blood cells'),(6012,401,'potassium helps nervous system'),(6012,407,'potassium helps muscle system'),(6015,412,'zinc helps immune system'),(6019,412,'vitamin C helps immune system'),(6020,412,'vitamin D helps immune system'),(6021,412,'vitamin E helps immune system'),(6024,415,'water helps circulatory system'),(6025,413,'vitamin A helps eyes');
/*!40000 ALTER TABLE `nutrient_helps_bodysystem` ENABLE KEYS */;
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
INSERT INTO `user_creates_grocerylist` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,15),(8,14),(9,13),(10,12),(11,11),(12,10),(13,9),(14,8),(15,7),(NULL,1),(NULL,2),(NULL,3),(NULL,4),(NULL,5),(NULL,6),(NULL,7),(NULL,8),(NULL,9),(NULL,10),(NULL,11),(NULL,12),(NULL,13),(NULL,14),(NULL,15),(NULL,1),(NULL,2),(NULL,3),(NULL,4),(NULL,5),(NULL,6),(NULL,7),(NULL,8),(NULL,9),(NULL,10),(NULL,11),(NULL,12),(NULL,13),(NULL,14),(NULL,15),(16,16),(16,17),(16,18),(16,19),(16,20),(16,21),(16,22),(16,23),(16,24),(16,25),(16,26),(16,27),(16,28),(16,29),(16,30),(5,31),(5,32),(7,33),(7,34),(7,35),(2,36),(16,37),(16,38),(16,39),(16,40),(16,41),(16,42),(16,43),(16,44),(16,45),(16,46),(16,47),(16,48),(16,49),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,50),(16,51),(16,52),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(23,54),(24,55),(24,55),(24,55),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(16,53),(23,54),(23,54),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(25,56),(16,53),(16,53),(16,53),(16,53),(26,57),(26,57);
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
INSERT INTO `user_marks_food` VALUES (1,1,0,1),(2,1,0,0),(3,3,1,0),(1,11,1,0),(4,5,0,1),(5,5,0,1),(7,6,0,1),(9,4,0,1),(9,5,0,1),(10,9,0,1),(11,12,1,0),(4,8,1,0),(12,12,0,1),(13,11,1,0),(15,15,0,1),(100,30007,1,0),(100,30009,0,1),(100,NULL,1,0),(100,30013,0,1),(100,30009,0,1),(100,30006,0,1),(100,30005,1,0),(100,30014,1,0),(100,30006,1,0),(100,30012,0,1),(100,30004,0,1),(100,30007,1,0),(100,30006,0,1),(100,30003,0,1),(100,30010,0,1),(100,30010,0,1),(100,30006,0,1),(100,30010,1,0),(100,30006,0,1),(100,30008,1,0),(100,30005,0,1),(100,30004,1,0),(100,30005,0,1),(100,30006,0,1),(100,30006,1,0),(100,30009,0,1),(100,30010,1,0),(100,30002,0,1),(100,6,0,1),(100,4,1,0),(100,5,0,1),(100,7,1,0),(100,15,1,0),(100,15,0,1),(100,6,1,0),(100,12,1,0),(100,19,0,1),(100,17,0,1),(21,2,0,1),(21,2,0,1),(21,11,0,1),(21,14,0,1),(21,19,0,1),(21,14,1,0),(21,16,0,1),(21,29,0,1),(21,3,1,0),(21,29,0,1),(21,16,1,0),(21,3,0,1),(16,6,0,1),(16,13,0,1),(16,13,0,1),(16,24,1,0),(16,13,0,1),(16,24,1,0),(16,24,0,1),(16,14,0,0),(16,16,1,0),(16,14,0,1),(16,6,0,1),(16,11,0,1),(8,3,0,1),(8,14,0,1),(8,16,1,0),(8,17,0,1),(16,2,0,1),(16,2,0,1),(16,15,0,1),(16,3,0,1),(16,1,0,1),(16,1,0,1),(16,2,0,1),(16,1,0,1),(16,14,0,1),(16,16,1,0),(16,4,1,0),(16,25,0,1),(16,3,1,0),(16,7,0,1),(16,8,1,0),(16,8,0,1),(16,3,0,1),(16,2,0,1),(16,2,0,0),(16,9,0,1),(5,4,1,0),(5,4,0,1),(5,4,1,0),(5,26,0,1),(5,26,0,1),(5,26,1,0),(5,26,0,1),(16,5,0,1),(7,18,1,0),(7,1,1,0),(7,14,0,1),(7,13,1,0),(2,6,1,0),(16,2,0,0),(16,2,0,1),(16,2,0,1),(16,2,0,1),(16,2,0,1),(16,5,1,0),(16,2,0,1),(16,9,1,0),(16,18,0,1),(16,25,1,0),(16,23,0,1),(16,28,0,1),(16,28,1,0),(16,25,1,0),(16,25,0,1),(16,2,0,1),(16,12,0,0),(16,12,0,1),(16,2,0,1),(16,12,0,1),(16,29,0,0),(16,29,0,1),(16,5,0,1),(16,5,1,0),(16,3,0,1),(16,29,0,0),(16,26,0,1),(16,29,0,1),(16,26,1,0),(16,1,0,1),(16,3,1,0),(16,14,0,1),(16,14,0,0),(16,10,0,1),(16,21,0,1),(16,14,0,1),(16,14,0,1),(16,16,1,0),(16,17,1,0),(16,29,0,0),(16,29,0,1),(16,21,1,0),(16,1,0,0),(16,22,0,1),(16,22,0,0),(16,22,0,1),(16,13,0,1),(16,13,0,1),(16,13,1,0),(22,5,0,1),(23,7,0,0),(23,7,0,1),(23,3,0,1),(23,3,0,1),(23,29,0,1),(23,26,1,0),(23,10,0,1),(24,8,0,1),(24,9,0,1),(24,9,1,0),(16,10,1,0),(16,1,0,1),(23,29,0,1),(23,29,1,0),(25,28,1,0),(25,8,1,0),(16,21,1,0),(26,17,1,0),(26,16,1,0);
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
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'testuser1@example.com','passtest123','First Last'),(2,'testuser2@example.com','pass90',NULL),(3,'testuser3@example.com','sqlop90',NULL),(4,'testuser4@example.com','f4fopi5',NULL),(5,'testuser5@example.com','fiver',NULL),(6,'testuser6@example.com','qrghbdsed52',NULL),(7,'testuser7@example.com','septem',NULL),(8,'testuser8@example.com','passtest123',NULL),(9,'testuser9@example.com','sjsucs157a',NULL),(10,'testuser10@example.com','encrypted',NULL),(11,'testuser11@example.com','password',NULL),(12,'testuser12@example.com','defend',NULL),(13,'testuser13@example.com','the',NULL),(14,'testuser14@example.com','east',NULL),(15,'testuser15@example.com','wall!',NULL),(16,'test@bah.com','pass123','Test Man'),(17,'hi@test.com','passlolo','okman'),(18,'hello@test.com','abc','ABC'),(19,'hi@test.com','hi123','hi bye'),(20,'testoh@test.com','testoh123','Test Oh'),(21,'mii@test.com','mii','Mii Wii'),(22,'root','admin','admin'),(23,'hello@me.com','me','Me'),(24,'lubu@test.com','lubu','Lu Bu'),(25,'person@test.com','per','Person'),(26,'bobdave@test.com','bob','Bob Dave');
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

-- Dump completed on 2020-08-04 23:03:03
