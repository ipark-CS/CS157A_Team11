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
INSERT INTO `Food` VALUES (1,'Asparagus'),(2,'Broccoli'),(3,'Carrots'),(4,'Cauliflower'),(5,'Celery'),(6,'Cherries'),(7,'Grapefruit'),(8,'Grapes'),(9,'Kiwis'),(10,'Lemons / Limes'),(11,'Bacon / Sausage'),(12,'Beef'),(13,'Chicken'),(14,'Ground beef / Turkey'),(15,'Ham / Pork'),(16,'Cheese'),(17,'Bread'),(18,'Noodle'),(19,'Tomatoes'),(20,'Flour'),(21,'Sugar'),(22,'Lettus'),(23,'Spinach'),(24,'Rosemary'),(25,'Galic '),(26,'Canola Oil'),(27,'Eggs'),(28,'Walnut'),(29,'Apple'),(30,'Beans'),(31,'Potatoes');
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
INSERT INTO `Food_has_Nutrient` VALUES (1,6001,2.60,'asparagus has 2.6g carbohydrates'),(1,6003,1.50,'asparagus has 1.5g protein'),(1,6004,0.10,'asparagus has 1.5g fat'),(1,6005,1.40,'asparagus has 1.4g fiber'),(1,6019,0.00,'asparagus has 0.38mg vitamin C'),(2,6001,2.60,'has 2.6g carbohydrates'),(2,6003,1.50,'has 1.5g protein'),(2,6004,0.10,'has 1.5g fat'),(3,6005,1.40,'has 1.4g fiber'),(3,6019,0.00,'has 0.38mg vitamin C'),(4,6001,2.60,'has 2.6g carbohydrates'),(4,6012,0.27,'have 268mg potassium'),(5,6003,1.50,'has 1.5g protein'),(6,6001,19.00,'cherries have 19g carbohydrates'),(6,6003,1.60,'cherries have 1.6g protein'),(6,6005,2.50,'cherries have 2.5g fiber'),(6,6012,0.27,'cherries have 268mg potassium'),(7,6001,2.60,'has 2.6g carbohydrates'),(7,6003,1.50,'has 1.5g protein'),(7,6012,0.27,'have 268mg potassium'),(8,6004,0.10,'has 1.5g fat'),(9,6001,10.00,'kiwi has 10g carbohydrates'),(9,6004,0.40,'kiwi has 0.4g fat'),(9,6012,0.22,'kiwi has 215mg potassium'),(10,6005,1.40,'has 1.4g fiber'),(10,6012,0.27,'have 268mg potassium'),(10,6019,0.00,'has 0.38mg vitamin C'),(11,6003,2.90,'bacon has 2.9g protein'),(11,6004,3.50,'bacon has 3.5g fat'),(11,6012,0.04,'bacon has 44mg potassium'),(11,6014,0.18,'bacon has 178mg sodium'),(11,6017,0.01,'bacon has 9mg cholesterol'),(12,6001,2.60,'has 2.6g carbohydrates'),(13,6003,1.50,'has 1.5g protein'),(14,6004,0.10,'has 1.5g fat'),(14,6005,1.40,'has 1.4g fiber'),(14,6019,0.00,'has 0.38mg vitamin C'),(15,6012,0.27,'have 268mg potassium'),(16,6001,2.60,'has 2.6g carbohydrates'),(17,6003,1.50,'has 1.5g protein'),(18,6004,0.10,'has 1.5g fat'),(19,6005,1.40,'has 1.4g fiber'),(19,6012,0.27,'have 268mg potassium'),(19,6019,0.00,'has 0.38mg vitamin C'),(20,6001,2.60,'has 2.6g carbohydrates'),(21,6003,1.50,'has 1.5g protein'),(22,6004,0.10,'has 1.5g fat'),(23,6005,1.40,'has 1.4g fiber'),(24,6012,0.27,'have 268mg potassium'),(24,6019,0.00,'has 0.38mg vitamin C'),(25,6001,2.60,'has 2.6g carbohydrates'),(25,6003,1.50,'has 1.5g protein'),(25,6004,0.10,'has 1.5g fat'),(26,6005,1.40,'has 1.4g fiber'),(27,6019,0.00,'has 0.38mg vitamin C'),(28,6012,0.27,'have 268mg potassium'),(29,6001,2.60,'has 2.6g carbohydrates'),(29,6003,1.50,'has 1.5g protein'),(29,6004,0.10,'has 1.5g fat'),(30,6005,1.40,'has 1.4g fiber'),(31,6012,0.27,'have 268mg potassium'),(31,6019,0.00,'has 0.38mg vitamin C');
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
INSERT INTO `Food_in_Category` VALUES (1,7009,'asparagus in produce fruits'),(2,7009,'broccoli in produce fruits'),(3,7009,'carrots in produce fruits'),(4,7009,'cauliflower in produce fruits'),(5,7009,'celery in produce fruits'),(6,7008,'cherries in produce fruits'),(7,7008,'graphfruite in produce fruits'),(8,7008,'graphes in produce fruits'),(9,7008,'kiwis in produce fruits'),(10,7008,'lemon/lime in produce fruits'),(11,7016,'bacon/sausage in processed meat'),(12,7007,'beef in raw meat'),(13,7007,'chicken in raw meat'),(14,7007,'grounded beef/turkey in raw meat'),(15,7016,'ham/pork in processed meat');
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
INSERT INTO `Food_lists_GroceryList` VALUES (1,12),(1,13),(1,100),(1,210),(2,12),(2,100),(2,210),(3,12),(3,14),(3,100),(4,13),(4,200),(5,14),(6,210),(7,14),(7,210),(8,13),(9,12),(9,210),(10,14),(11,12),(11,14),(12,13),(13,12),(14,210),(15,14),(15,200),(17,210),(25,200),(26,200),(27,200);
/*!40000 ALTER TABLE `Food_lists_GroceryList` ENABLE KEYS */;
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
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
-- Table structure for table `grocerylist`
--

DROP TABLE IF EXISTS `grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_adds_food` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_adds_food`
--

LOCK TABLES `user_adds_food` WRITE;
/*!40000 ALTER TABLE `user_adds_food` DISABLE KEYS */;
INSERT INTO `user_adds_food` VALUES (1,1),(2,2),(4,5),(5,5),(7,6),(9,4),(9,5),(10,9),(11,2),(12,8),(12,12),(13,3),(14,7),(15,5),(15,15);
/*!40000 ALTER TABLE `user_adds_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_creates_grocerylist`
--

DROP TABLE IF EXISTS `user_creates_grocerylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_marks_food` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`food_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_marks_food`
--

LOCK TABLES `user_marks_food` WRITE;
/*!40000 ALTER TABLE `user_marks_food` DISABLE KEYS */;
INSERT INTO `user_marks_food` VALUES (3,3,1,0),(5,5,1,0),(7,6,0,1),(10,9,0,1),(11,12,1,0),(12,12,0,1),(13,11,1,0),(15,11,1,0),(15,15,0,1),(16,17,1,0);
/*!40000 ALTER TABLE `user_marks_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_selects_dish`
--

DROP TABLE IF EXISTS `user_selects_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `users` VALUES (1,'testuser1@example.com','passtest123','First Last'),(2,'testuser2@example.com','pass90',NULL),(3,'testuser3@example.com','sqlop90',NULL),(4,'testuser4@example.com','f4fopi5',NULL),(5,'testuser5@example.com','fiver',NULL),(6,'testuser6@example.com','qrghbdsed52',NULL),(7,'testuser7@example.com','septem',NULL),(8,'testuser8@example.com','passtest123',NULL),(9,'testuser9@example.com','sjsucs157a',NULL),(10,'testuser10@example.com','encrypted',NULL),(11,'testuser11@example.com','password',NULL),(12,'testuser12@example.com','defend',NULL),(13,'testuser13@example.com','the',NULL),(14,'testuser14@example.com','east',NULL),(15,'inhee@sjsu.edu','team11','inhee'),(16,'park@sjsu.edu','team11','park');
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

-- Dump completed on 2020-08-01  1:40:16
