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
INSERT INTO `BodySystem` VALUES (401,'respiratory system'),(402,'digestive system'),(403,'cardiovascular system'),(404,'urinary system'),(405,'blood cells'),(406,'skeletal system'),(407,'muscular system'),(408,'endocrine system'),(409,'lymphatic system'),(410,'nervous system'),(411,'reproductive system'),(412,'immune system'),(413,'eyes'),(414,'skin/hair/nails'),(415,'heart');
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
INSERT INTO `Category` VALUES (7001,'Beverages'),(7002,'Bread/Bakery '),(7003,'Canned/Jarred Goods/Soups'),(7004,'Dairy/Eggs/Cheese'),(7005,'Dry/Baking Goods '),(7006,'Frozen Foods'),(7007,'Raw Meat'),(7008,'Produce Fruits'),(7009,'Produce Vegetables'),(7010,'Deli/Signature Cafe'),(7011,'Breakfast/Cereal'),(7012,'Condiments/Spices'),(7013,'Seafood'),(7014,'Beer/Wine'),(7015,'Cookies/Snacks/Candy'),(7016,'Processed Meat');
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
INSERT INTO `Food` VALUES (30001,'Asparagus'),(30002,'Broccoli'),(30003,'Carrots'),(30004,'Cauliflower'),(30005,'Celery'),(30006,'Cherries'),(30007,'Grapefruit'),(30008,'Grapes'),(30009,'Kiwis'),(30010,'Lemons / Limes'),(30011,'Bacon / Sausage'),(30012,'Beef'),(30013,'Chicken'),(30014,'Ground beef / Turkey'),(30015,'Ham / Pork');
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
  `quantity` decimal(5,2) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`,`nutrient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_has_Nutrient`
--

LOCK TABLES `Food_has_Nutrient` WRITE;
/*!40000 ALTER TABLE `Food_has_Nutrient` DISABLE KEYS */;
INSERT INTO `Food_has_Nutrient` VALUES (30001,6001,2.60,'asparagus has 2.6g carbohydrates'),(30001,6003,1.50,'asparagus has 1.5g protein'),(30001,6004,0.10,'asparagus has 1.5g fat'),(30001,6005,1.40,'asparagus has 1.4g fiber'),(30001,6019,0.00,'asparagus has 0.38mg vitamin C'),(30006,6001,19.00,'cherries have 19g carbohydrates'),(30006,6003,1.60,'cherries have 1.6g protein'),(30006,6005,2.50,'cherries have 2.5g fiber'),(30006,6012,0.27,'cherries have 268mg potassium'),(30009,6001,10.00,'kiwi has 10g carbohydrates'),(30009,6004,0.40,'kiwi has 0.4g fat'),(30009,6012,0.22,'kiwi has 215mg potassium'),(30011,6003,2.90,'bacon has 2.9g protein'),(30011,6004,3.50,'bacon has 3.5g fat'),(30011,6012,0.04,'bacon has 44mg potassium'),(30011,6014,0.18,'bacon has 178mg sodium'),(30011,6017,0.01,'bacon has 9mg cholesterol');
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
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food_in_Category`
--

LOCK TABLES `Food_in_Category` WRITE;
/*!40000 ALTER TABLE `Food_in_Category` DISABLE KEYS */;
INSERT INTO `Food_in_Category` VALUES (30001,7009,'asparagus in produce fruits'),(30002,7009,'broccoli in produce fruits'),(30003,7009,'carrots in produce fruits'),(30004,7009,'cauliflower in produce fruits'),(30005,7009,'celery in produce fruits'),(30006,7008,'cherries in produce fruits'),(30007,7008,'graphfruite in produce fruits'),(30008,7008,'graphes in produce fruits'),(30009,7008,'kiwis in produce fruits'),(30010,7008,'lemon/lime in produce fruits'),(30011,7016,'bacon/sausage in processed meat'),(30012,7007,'beef in raw meat'),(30013,7007,'chicken in raw meat'),(30014,7007,'grounded beef/turkey in raw meat'),(30015,7016,'ham/pork in processed meat');
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
INSERT INTO `Food_lists_GroceryList` VALUES (30001,12),(30001,13),(30002,12),(30003,12),(30003,14),(30004,13),(30005,14),(30007,14),(30008,13),(30009,12),(30010,14),(30011,12),(30011,14),(30012,13),(30013,12),(30015,14);
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
INSERT INTO `Nutrient` VALUES (6001,'Carbohydrate'),(6002,'Polyunsaturated fat'),(6003,'Protein'),(6004,'Saturated Fat'),(6005,'Total Dietary Fiber'),(6006,'Calcium'),(6007,'Fluoride'),(6008,'Iron'),(6009,'Magnesium'),(6010,'Manganese'),(6011,'Phosphorus'),(6012,'Potassium'),(6013,'Selenium'),(6014,'Sodium'),(6015,'Zinc'),(6016,'Caffeine'),(6017,'Cholesterol'),(6018,'Omega-3 Fatty Acid'),(6019,'Vitamin C'),(6020,'Vitamin B'),(6021,'Vitamin D'),(6023,'Vitamin E'),(6024,'Water'),(6025,'Vitamine A');
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
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nutrient_id`,`body_sys_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nutrient_helps_BodySystem`
--

LOCK TABLES `Nutrient_helps_BodySystem` WRITE;
/*!40000 ALTER TABLE `Nutrient_helps_BodySystem` DISABLE KEYS */;
INSERT INTO `Nutrient_helps_BodySystem` VALUES (6004,414,'protein helps skin/hair/nails'),(6005,402,'fiber helps digestive system'),(6006,406,'calcium helps skeletal system'),(6006,407,'calcium helps muscle system'),(6006,414,'calcium helps skin/hair/nails'),(6007,406,'fluoride helps skeletal system'),(6008,405,'iron helps blood cells'),(6012,401,'potassium helps nervous system'),(6012,407,'potassium helps muscle system'),(6015,412,'zinc helps immune system'),(6019,412,'vitamin C helps immune system'),(6020,412,'vitamin D helps immune system'),(6021,412,'vitamin E helps immune system'),(6024,415,'water helps circulatory system'),(6025,413,'vitamin A helps eyes');
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

-- Dump completed on 2020-07-05 20:00:17
