-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: costs
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB-0ubuntu0.17.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'purchase','2018-03-31 12:25:30','2018-03-31 12:25:30'),(2,'due','2018-03-31 12:25:30','2018-03-31 12:25:30'),(3,'lend','2018-03-31 12:25:30','2018-03-31 12:25:30'),(4,'Misc','2018-04-11 22:00:00','2018-04-11 22:00:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `items_category_id_foreign` (`category_id`),
  KEY `items_user_id_foreign` (`user_id`),
  CONSTRAINT `items_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'kamal','for future dream project',7000,2,1,'2018-03-31 12:43:09','2018-03-31 12:43:09'),(2,'monitor','hp 21.5 inch elite display',13000,1,1,'2018-03-31 12:43:36','2018-03-31 12:43:36'),(3,'samson dynamic microphone','samson dynamic microphone purchase through backpackbang',7000,1,1,'2018-03-31 12:44:13','2018-03-31 14:23:51'),(4,'samson go microphone and amplifier','samson go mic and winbridge sound amplifier',8500,1,1,'2018-03-31 12:46:23','2018-03-31 14:24:08'),(5,'folding table','folding table like sharif',800,1,1,'2018-03-31 12:47:16','2018-03-31 12:47:16'),(6,'regal laptop table','regal laptop table purchase from mohipal',900,1,1,'2018-03-31 12:47:54','2018-03-31 12:47:54'),(7,'computer table','computer table purchase through help of kamal',3200,1,1,'2018-03-31 12:48:25','2018-03-31 12:48:25'),(8,'rice cooker','rice cooker purchase from singer near the railroad feni',1800,1,1,'2018-03-31 12:49:05','2018-03-31 12:49:05'),(9,'rfl folding chair',NULL,550,1,1,'2018-03-31 12:49:30','2018-03-31 12:49:30'),(10,'swivel chair','swivel chair from a shop which is near samabai super market',3000,1,1,'2018-03-31 12:58:08','2018-03-31 12:58:08'),(11,'walton egg boiler','a risky egg boiler. I never going to use this',800,1,1,'2018-03-31 13:06:36','2018-03-31 13:06:36'),(12,'utensils','utensils including mug, bucket, pot, curry pot (2)',3000,1,1,'2018-03-31 13:07:28','2018-03-31 14:06:26'),(13,'casio watch','2 casio watch 800',850,1,1,'2018-03-31 13:07:55','2018-03-31 13:07:55'),(14,'xiaomi watch','xiaomi watch for sleep monitoring',2000,1,1,'2018-03-31 13:08:23','2018-03-31 13:08:23'),(15,'creative play soundcard','purchase from sourceedge mainul',2300,1,1,'2018-03-31 13:08:57','2018-03-31 13:08:57'),(16,'winter dress and pant','winter 2 jacket , pant, rajib pant',2000,1,1,'2018-03-31 13:09:53','2018-03-31 13:09:53'),(17,'sleeping blanket and pillow','sleeping blanket and pillow on the way from college',1500,1,1,'2018-03-31 13:10:25','2018-04-23 14:39:01'),(18,'laptop','thinkpad laptop',36000,1,1,'2018-03-31 13:11:52','2018-03-31 13:53:46'),(19,'laptop service','laptop service through imran - my student',1500,1,1,'2018-03-31 13:12:17','2018-03-31 13:12:17'),(20,'palash due','I give tk 9000 to palash to city bank account. outof 9k palash give 3650 to anik',9000,2,1,'2018-03-31 13:13:11','2018-04-05 20:30:08'),(21,'palash','I deposited 12000 in palash account. He sends me tk2000 in my bkash account',10000,3,1,'2018-03-31 13:17:28','2018-04-05 20:30:40'),(22,'ma','I send tk 10000 through subrata bkash account',10000,2,1,'2018-03-31 13:18:16','2018-03-31 13:18:16'),(23,'ma','sending tk 6k through sambu',6000,2,1,'2018-03-31 13:18:34','2018-03-31 13:44:44'),(24,'sambu','fm method course fee',4100,1,1,'2018-03-31 13:19:08','2018-03-31 13:19:08'),(25,'uttam dada','giving money to uttam dada bank asia',10000,2,1,'2018-03-31 13:19:42','2018-03-31 13:19:42'),(26,'police sumon','sending tk 12250 to his bkash account',12000,2,1,'2018-03-31 13:20:22','2018-03-31 13:20:22'),(27,'Rasel','sending tk 2k to rasel vi using bkash',2000,3,1,'2018-03-31 13:21:16','2018-03-31 13:21:16'),(28,'Rakesh','depositing tk 10k in his social islami bank account',10000,2,1,'2018-03-31 13:22:10','2018-03-31 13:22:10'),(29,'harun vi','purchasing domain, borrowed money and blinkist subscription  paid through dutch bangla bank',7500,2,1,'2018-03-31 13:23:27','2018-03-31 13:23:27'),(30,'dutch bangla bank account open','I have opened dutch bangla bank account which cost me tk6000',600,1,1,'2018-03-31 13:23:55','2018-04-20 05:15:38'),(31,'Domain and hosting','domain and hosting for ibauthor',1500,1,1,'2018-03-31 13:24:21','2018-03-31 13:24:21'),(32,'logitech k400 plus keyboard','purchase through bkash account',2700,1,1,'2018-03-31 13:24:58','2018-03-31 13:24:58'),(33,'dell keyboard','dell keyboard from samabai super market',570,1,1,'2018-03-31 13:25:17','2018-03-31 13:25:17'),(34,'memory card','32gb pny memory card',1150,1,1,'2018-03-31 13:25:43','2018-03-31 13:27:58'),(35,'x3 or x4 pendrive','x3 brooked. so replace with x4 and give more money',1000,1,1,'2018-03-31 13:26:58','2018-03-31 14:20:00'),(36,'Kingston pendrive','32gb Kingston memory card',950,1,1,'2018-03-31 13:27:28','2018-03-31 13:27:28'),(37,'2 multiplug','rfl multiplug and superstar multiplug',1200,1,1,'2018-03-31 13:28:45','2018-03-31 13:28:53'),(38,'pureit water purifier','purchase from homeplus',3000,1,1,'2018-03-31 13:29:20','2018-03-31 13:29:20'),(39,'apple laptop charger','purchase from daraz. generally price was 9k but getting discount due to shopping through port wallet',8100,1,1,'2018-03-31 13:30:10','2018-03-31 13:30:10'),(40,'xiaomi bluetooth headphone','purchase from pickaboo',2400,1,1,'2018-03-31 13:30:48','2018-03-31 13:30:48'),(41,'3 converter for macbook, thinkpad','purchase through neuron',1700,1,1,'2018-03-31 13:31:59','2018-03-31 13:31:59'),(42,'belkin headphone','belkin headphone from mshop - daraz',750,1,1,'2018-03-31 13:32:35','2018-03-31 14:19:13'),(43,'samsung headphone','samsung headphone purchase from main uddin vi. One of the biggest mistake I did',400,1,1,'2018-03-31 13:33:14','2018-03-31 13:33:14'),(44,'hush puppies sandal','hush puppies',2400,1,1,'2018-03-31 13:33:45','2018-03-31 13:33:45'),(45,'apex shoe, sandal, lotto sandal','apex shoe for winter, apex sandal for me, rajib and lotto sandal for sambu',1000,1,1,'2018-03-31 13:35:07','2018-03-31 13:35:07'),(46,'lynda.com','lynda.com fee from shoag',1000,1,1,'2018-03-31 13:35:37','2018-03-31 13:35:37'),(47,'trimmer','bad trimmer purchase from daraz',470,1,1,'2018-03-31 13:35:55','2018-03-31 14:17:45'),(48,'dental work','dental work from shibir people',11000,1,1,'2018-03-31 13:36:18','2018-03-31 13:36:18'),(49,'creative headphone','purchase from rayans pc. Its wasn\'t seal',1250,1,1,'2018-03-31 13:36:48','2018-03-31 13:36:48'),(50,'yoga mat','yoga mat from daraz',650,1,1,'2018-03-31 13:37:04','2018-03-31 13:37:04'),(51,'laptop sleeve','laptop sleeve for thinkpad laptop',350,1,1,'2018-03-31 13:37:28','2018-03-31 13:37:28'),(52,'2 philips bulb','2 philips bulb for room',600,1,1,'2018-03-31 13:37:56','2018-04-20 05:16:44'),(53,'fan','fan for room and installation in 2 different room',2200,1,1,'2018-03-31 13:38:39','2018-03-31 13:38:39'),(54,'singer water heater','singer water heater from singer. Lot of talk with manager',900,1,1,'2018-03-31 13:39:09','2018-03-31 13:39:09'),(55,'gym bill','gave tk 1000 to gym huzur and planning to do gym',1000,1,1,'2018-03-31 13:46:09','2018-03-31 13:46:09'),(56,'mosquito bat','rfl mosquito bat',420,1,1,'2018-03-31 13:46:42','2018-03-31 13:46:42'),(57,'hoco usb hub','hoco usb 3 hub from pickaboo',500,1,1,'2018-03-31 13:48:06','2018-03-31 13:48:06'),(58,'twinmos usb hub','twinmos usb hub',330,1,1,'2018-03-31 13:48:24','2018-03-31 13:48:46'),(59,'usb cable for mobile','I purchase bad quality cable for 3 times and final one was good. I have got a lesson',300,1,1,'2018-03-31 13:52:35','2018-03-31 13:52:35'),(60,'a4tech mouse','a4tech mouse with button',560,1,1,'2018-03-31 14:13:06','2018-03-31 14:20:21'),(61,'remax headphone','remax basic headphone which is daily driver for me along with belkin',400,1,1,'2018-03-31 14:13:56','2018-03-31 14:20:51'),(62,'chopping board and knife','chopping board and knife',500,1,1,'2018-03-31 14:14:34','2018-03-31 14:14:34'),(63,'remax microphoen stand','remax microphone stand',1250,1,1,'2018-03-31 14:14:57','2018-03-31 14:18:10'),(64,'goodnight + mosquito light','a light purchase from daraz and good night',350,1,1,'2018-03-31 14:17:22','2018-03-31 14:17:22'),(65,'eye musk','eye musk',130,1,1,'2018-03-31 14:18:48','2018-03-31 14:18:48'),(66,'awei bluetooth purchase and resale loss 450','purchase at 1050 and sell it at tk600',450,1,1,'2018-03-31 14:21:31','2018-03-31 14:21:31'),(67,'boya microphone','boya microphone costing with delivery charge',1800,1,1,'2018-03-31 14:23:23','2018-03-31 14:23:23'),(68,'hdmi cable','hdmi cable for connect laptop with pc',250,1,1,'2018-03-31 14:38:05','2018-03-31 14:38:05'),(69,'lock for door','strong lock purchase from mohipal',250,1,1,'2018-03-31 14:38:32','2018-04-01 22:44:41'),(70,'milky','lended tk200 through bkash',2000,3,1,'2018-04-01 19:26:13','2018-04-01 19:26:13'),(71,'kindle paper white','purchase from dhaka basundhara city',9000,1,1,'2018-04-12 02:20:23','2018-04-12 02:20:23'),(72,'keyboard','cougar mechanical keyboard',5600,1,1,'2018-04-12 02:20:44','2018-04-12 02:20:44'),(73,'kamal fd','for fd purpose',7000,2,1,'2018-04-12 02:22:29','2018-04-12 02:22:29'),(74,'feni <==> Dhaka','fare, uber, food',1500,4,1,'2018-04-12 02:24:46','2018-04-12 02:25:55'),(75,'Hasnath','giving 5k to hasnath',5000,3,1,'2018-04-12 02:25:36','2018-04-12 02:25:36'),(76,'Mouse mt750','Rapoo',3000,1,1,'2018-04-18 18:40:46','2018-04-18 18:40:46'),(77,'Pizza and failed chittagong fare','Went for visa purpose',1000,4,1,'2018-04-18 18:41:52','2018-04-20 05:18:45'),(78,'200 dollars endorsement','84.5 x 200 + 575',17500,4,1,'2018-04-18 18:44:28','2018-04-18 18:44:28'),(79,'Table','Table costing',4800,1,1,'2018-04-18 18:46:57','2018-04-23 14:37:50'),(80,'Remax usb cable and otg','230',230,1,1,'2018-04-20 05:17:56','2018-04-20 05:17:56'),(81,'Rfl folding table','To make it standing table',750,1,1,'2018-04-23 14:37:22','2018-04-23 14:37:22');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_03_29_231732_create_categories_table',1),(4,'2018_03_29_232013_create_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'polo','dev@gmail.com','$2y$10$FDGuMVzMAFksgmH2qPJa7eIkjSg/ZCtHmKyt5W98y9YVtsic.AMXO','vo4z6tfTpKc3kEpN214nlv4w7ABg0RccS0MivlLNeWR2dN6gKqlIunLdJMKS','2018-03-31 12:25:48','2018-03-31 12:25:48'),(2,'palash','palash@gmail.com','$2y$10$rOc9uw2/m3eStXMo7LIo4uhqEwy0fUNmM5rdgGBYMCpfGq5c5eq6K','YZGXFKH5gbNdN29v3AGf7nh8r1O0mpCpulplqWr49oLcecpkqT3wWcOaOf7H','2018-03-31 13:14:47','2018-03-31 13:14:47'),(3,'Polo2 may','dev2@gmail.com','$2y$10$KMIwVKCAioAAh.iUTXDJZ.YBqeCsswfVxF9X05pYr2bK3vUScOiwG','Fp2d80TiKrnCDUQeMBRck29nTyXj34aRIdotVuPlY8EIHFXDXwHpWWUZ5p5Q','2018-04-30 21:28:36','2018-04-30 21:28:36');
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

-- Dump completed on 2018-05-01  6:18:55
