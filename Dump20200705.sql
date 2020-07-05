-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: GNTmarket
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BodySystem`
--

DROP TABLE IF EXISTS `BodySystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BodySystem` (
  `body_sys_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`body_sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BodySystem`
--

LOCK TABLES `BodySystem` WRITE;
/*!40000 ALTER TABLE `BodySystem` DISABLE KEYS */;
INSERT INTO `BodySystem` VALUES (401,'respiratory system'),(402,'digestive system'),(403,'cardiovascular system'),(404,'urinary system'),(405,'integumentary system'),(406,'skeletal system'),(407,'muscular system'),(408,'endocrine system'),(409,'lymphatic system'),(410,'nervous system'),(411,'reproductive system'),(412,'immune system'),(413,'eyes'),(414,'skin/hair'),(415,'heart');
/*!40000 ALTER TABLE `BodySystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `category_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (7001,'Beverages'),(7002,'Bread/Bakery '),(7003,'Canned/Jarred Goods/Soups'),(7004,'Dairy/Eggs/Cheese'),(7005,'Dry/Baking Goods '),(7006,'Frozen Foods'),(7007,'Raw Meat'),(7008,'Produce Fruits'),(7009,'Produce Vegetables'),(7010,'Deli & Signature Cafe'),(7011,'Breakfast/Cereal'),(7012,'Condiments/Spices'),(7013,'Seafood'),(7014,'Beer/Wine'),(7015,'Cookies/Snacks/Candy');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dish` (
  `dish_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food`
--

DROP TABLE IF EXISTS `Food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food` (
  `food_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food`
--

LOCK TABLES `Food` WRITE;
/*!40000 ALTER TABLE `Food` DISABLE KEYS */;
INSERT INTO `Food` VALUES (30001,'Asparagus'),(30002,'BroccoliBroccoli'),(30003,'Carrots'),(30004,'Cauliflower'),(30005,'Celery'),(30006,'Cherries'),(30007,'Grapefruit'),(30008,'Grapes'),(30009,'Kiwis'),(30010,'Lemons / Limes'),(30011,'Bacon / Sausage'),(30012,'Beef'),(30013,'Chicken'),(30014,'Ground beef / Turkey'),(30015,'Ham / Pork');
/*!40000 ALTER TABLE `Food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_has_Nutrient`
--

DROP TABLE IF EXISTS `Food_has_Nutrient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food_has_Nutrient` (
  `food_id` int NOT NULL,
  `nutrient_id` int NOT NULL,
  PRIMARY KEY (`food_id`,`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_has_Nutrient`
--

LOCK TABLES `Food_has_Nutrient` WRITE;
/*!40000 ALTER TABLE `Food_has_Nutrient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_has_Nutrient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_in_Category`
--

DROP TABLE IF EXISTS `Food_in_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food_in_Category` (
  `food_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`food_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_in_Category`
--

LOCK TABLES `Food_in_Category` WRITE;
/*!40000 ALTER TABLE `Food_in_Category` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_in_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food_lists_GroceryList`
--

DROP TABLE IF EXISTS `Food_lists_GroceryList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Food_lists_GroceryList` (
  `food_id` int NOT NULL,
  `list_id` int NOT NULL,
  PRIMARY KEY (`food_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_lists_GroceryList`
--

LOCK TABLES `Food_lists_GroceryList` WRITE;
/*!40000 ALTER TABLE `Food_lists_GroceryList` DISABLE KEYS */;
/*!40000 ALTER TABLE `Food_lists_GroceryList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroceryList`
--

DROP TABLE IF EXISTS `GroceryList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroceryList` (
  `list_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroceryList`
--

LOCK TABLES `GroceryList` WRITE;
/*!40000 ALTER TABLE `GroceryList` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroceryList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nutrient`
--

DROP TABLE IF EXISTS `Nutrient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nutrient` (
  `nutrient_id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nutrient`
--

LOCK TABLES `Nutrient` WRITE;
/*!40000 ALTER TABLE `Nutrient` DISABLE KEYS */;
INSERT INTO `Nutrient` VALUES (6001,'Carbohydrate'),(6002,'Polyunsaturated fat'),(6003,'Protein'),(6004,'Saturated Fat'),(6005,'Total Dietary Fiber'),(6006,'Calcium'),(6007,'Fluoride'),(6008,'Iron'),(6009,'Magnesium'),(6010,'Manganese'),(6011,'Phosphorus'),(6012,'Potassium'),(6013,'Selenium'),(6014,'Sodium'),(6015,'Zinc'),(6016,'Caffeine'),(6017,'Cholesterol'),(6018,'Fatty Acid'),(6019,'Vitamin C'),(6020,'Vitamin B'),(6021,'Vitamin D'),(6023,'Vitamin E'),(6024,'Vitamin K');
/*!40000 ALTER TABLE `Nutrient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nutrient_helps_BodySystem`
--

DROP TABLE IF EXISTS `Nutrient_helps_BodySystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nutrient_helps_BodySystem` (
  `nutrient_id` int NOT NULL,
  `body_sys_id` int NOT NULL,
  PRIMARY KEY (`nutrient_id`,`body_sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nutrient_helps_BodySystem`
--

LOCK TABLES `Nutrient_helps_BodySystem` WRITE;
/*!40000 ALTER TABLE `Nutrient_helps_BodySystem` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nutrient_helps_BodySystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-05 16:11:13
