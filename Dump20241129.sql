CREATE DATABASE  IF NOT EXISTS `recipe_corner` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe_corner`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe_corner
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Desserts'),(2,'Main Course'),(3,'Appetizers'),(4,'Vegetarian'),(5,'Vegan'),(6,'Breakfast');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `favorite_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `saved_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`favorite_id`),
  KEY `user_id` (`user_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,1,2,'2024-11-29 05:27:44'),(2,1,3,'2024-11-29 05:27:44'),(3,2,4,'2024-11-29 05:27:44'),(4,3,5,'2024-11-29 05:27:44'),(5,4,6,'2024-11-29 05:27:44'),(6,5,7,'2024-11-29 05:27:44'),(7,6,8,'2024-11-29 05:27:44'),(8,7,9,'2024-11-29 05:27:44');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `recipe_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ingredients` text NOT NULL,
  `instructions` text NOT NULL,
  `category_id` int DEFAULT NULL,
  `rating` float DEFAULT '0',
  `prep_time` int DEFAULT NULL,
  `cook_time` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Spaghetti Carbonara','200g spaghetti, 100g pancetta, 2 large eggs, 50g Parmesan cheese, Salt, Pepper','1. Boil spaghetti until al dente. 2. Fry pancetta until crisp. 3. Beat eggs with grated Parmesan. 4. Combine pasta, pancetta, and egg mixture. 5. Season and serve.',2,4.5,15,10,'2024-11-29 04:43:29','2024-11-29 05:07:08','https://www.youtube.com/watch?v=3AAdKl1UYZs'),(2,'Vegan Brownies','1 cup all-purpose flour, 1 cup sugar, 1/3 cup cocoa powder, 1/2 tsp baking soda, 1/2 cup almond milk, 1/2 cup coconut oil','1. Preheat oven to 350°F (175°C). 2. Mix dry ingredients. 3. Add wet ingredients and mix. 4. Pour into a baking tray. 5. Bake for 25 minutes.',5,4.7,10,25,'2024-11-29 04:43:29','2024-11-29 05:07:08','https://www.youtube.com/watch?v=D1df98ieREE'),(3,'Classic Pancakes','1 cup flour, 1 tbsp sugar, 1 tsp baking powder, 1/2 tsp salt, 1 cup milk, 1 egg, 2 tbsp melted butter','1. Combine dry ingredients. 2. Add milk, egg, and melted butter. Mix until smooth. 3. Heat a griddle and cook pancakes until golden brown.',6,4.8,10,20,'2024-11-29 04:43:29','2024-11-29 05:07:08','https://www.youtube.com/watch?v=7zR1r_iG-4A'),(4,'Guacamole','3 avocados, 1 lime, 1/2 tsp salt, 1/2 cup diced onion, 3 tbsp chopped cilantro, 2 diced tomatoes, 1 tsp minced garlic','1. Mash avocados in a bowl. 2. Mix in lime juice, salt, onion, cilantro, tomatoes, and garlic. 3. Serve immediately.',3,4.9,5,0,'2024-11-29 04:43:29','2024-11-29 05:07:08','https://www.youtube.com/watch?v=BTkA1a2A2JA'),(5,'Chocolate Lava Cake','1/2 cup unsalted butter, 170g dark chocolate, 1 cup powdered sugar, 2 large eggs, 2 large egg yolks, 6 tbsp flour','1. Preheat oven to 425°F (220°C). 2. Melt chocolate and butter. 3. Mix sugar, eggs, and flour. 4. Bake for 12 minutes.',1,4.6,15,12,'2024-11-29 04:43:29','2024-11-29 05:07:08','https://www.youtube.com/watch?v=s_kpgxx1FDk'),(6,'Beef Wellington','1.5 lb beef tenderloin, 8 oz mushrooms, 1 sheet puff pastry, 3 oz prosciutto, 2 egg yolks, Dijon mustard','1. Sear beef tenderloin. 2. Prepare mushroom duxelles. 3. Wrap beef with prosciutto and duxelles in puff pastry. 4. Bake at 400°F for 40 minutes.',2,4.8,30,40,'2024-11-29 04:57:04','2024-11-29 05:07:08','https://www.youtube.com/watch?v=PNyQXqPAgtg'),(7,'Tiramisu','6 egg yolks, 3/4 cup sugar, 2 cups mascarpone, 1 cup espresso, 1/4 cup coffee liqueur, 2 cups ladyfingers, Cocoa powder','1. Whisk egg yolks and sugar. 2. Fold in mascarpone. 3. Dip ladyfingers in espresso mix. 4. Layer with cream mixture. 5. Dust with cocoa.',1,4.9,20,0,'2024-11-29 04:57:04','2024-11-29 05:07:08','https://www.youtube.com/watch?v=djrC3G3n4YY'),(8,'Strawberry Shortcake','2 cups flour, 1/4 cup sugar, 1 tbsp baking powder, 1/2 cup butter, 2/3 cup milk, Fresh strawberries, Whipped cream','1. Prepare shortcake dough and bake. 2. Slice strawberries. 3. Layer shortcakes with strawberries and whipped cream.',1,4.7,25,15,'2024-11-29 04:57:04','2024-11-29 05:07:08','https://www.youtube.com/watch?v=5xlbdj4VrYE'),(9,'Vegan Ramen','4 cups vegetable broth, 2 tbsp miso paste, 1 tbsp soy sauce, 1 block tofu, 1 cup mushrooms, 1 cup bok choy, 2 packs ramen noodles','1. Simmer broth with miso and soy sauce. 2. Add mushrooms and bok choy. 3. Cook noodles. 4. Serve with tofu on top.',5,4.6,15,15,'2024-11-29 04:57:04','2024-11-29 05:07:08','https://www.youtube.com/watch?v=MzrYWDU-L_Y'),(10,'Buffalo Wings','2 lbs chicken wings, 1/2 cup hot sauce, 1/4 cup butter, 1 tsp garlic powder, Celery sticks, Blue cheese dip','1. Bake or fry wings. 2. Toss with hot sauce, butter, and garlic. 3. Serve with celery and dip.',2,4.8,10,25,'2024-11-29 04:57:04','2024-11-29 05:07:08','https://www.youtube.com/watch?v=GzQ8R3X5kuA'),(11,'Lomo Saltado','1 lb beef sirloin, 1 onion, 2 tomatoes, 1/4 cup soy sauce, 1 tbsp vinegar, 2 potatoes, Cooked rice','1. Stir fry beef, onions, and tomatoes. 2. Add soy sauce and vinegar. 3. Serve with fries and rice.',2,4.9,15,20,'2024-11-29 04:57:04','2024-11-29 05:07:22','https://www.youtube.com/watch?v=OYtrfndS9S4'),(12,'Waffles','2 cups flour, 2 tbsp sugar, 1 tbsp baking powder, 2 eggs, 1 3/4 cups milk, 1/2 cup melted butter','1. Mix dry ingredients. 2. Add eggs, milk, and butter. 3. Pour batter into waffle iron and cook until golden.',6,4.7,10,5,'2024-11-29 04:57:04','2024-11-29 05:07:22','https://www.youtube.com/watch?v=APmIebgO-64'),(13,'Pancakes','1 cup flour, 1 tbsp sugar, 1 tsp baking powder, 1/2 tsp salt, 1 cup milk, 1 egg, 2 tbsp melted butter','1. Mix dry ingredients. 2. Add milk, egg, and butter. 3. Cook pancakes on a griddle until golden.',6,4.8,10,20,'2024-11-29 04:57:04','2024-11-29 05:07:22','https://www.youtube.com/watch?v=7zR1r_iG-4A'),(14,'Vegetarian Lasagna','12 lasagna noodles, 2 cups ricotta, 2 cups spinach, 3 cups marinara sauce, 2 cups mozzarella, 1/2 cup Parmesan','1. Layer lasagna with sauce, cheese, and spinach. 2. Bake at 375°F for 40 minutes.',4,4.7,20,40,'2024-11-29 04:57:04','2024-11-29 05:07:22','https://www.youtube.com/watch?v=nQye6HdN6zI'),(15,'Vegan Buddha Bowl','1 cup quinoa, 1 cup chickpeas, 1 cup roasted sweet potatoes, 1 avocado, 1/2 cup tahini dressing','1. Cook quinoa. 2. Assemble bowl with chickpeas, sweet potatoes, and avocado. 3. Drizzle with tahini dressing.',5,4.8,15,20,'2024-11-29 04:57:04','2024-11-29 05:07:22','https://www.youtube.com/watch?v=FKo7ZShQYvU');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `recipe_id` (`recipe_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_chk_1` CHECK ((`rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,2,1,5,'\"This recipe is amazing! Easy to follow and the dish turned out perfectly. Highly recommend!\"','2024-11-29 05:01:00'),(2,3,2,4,'\"A bit too salty for my taste, but overall good. Will try again with less salt.\"','2024-11-29 05:05:00'),(3,4,3,3,'	\"Not bad, but could use more flavor. I will try again with some adjustments.\"','2024-11-29 05:10:00'),(4,4,3,5,'Delicious! The flavors were incredible, and the video helped a lot.','2024-11-29 05:23:53'),(5,5,4,3,'Not my favorite, but it’s still a decent recipe. The instructions were clear.','2024-11-29 05:23:53'),(6,6,5,4,'A tasty meal, though I felt the cook time was a bit longer than expected.','2024-11-29 05:23:53'),(7,7,6,5,'Absolutely loved it! My whole family enjoyed the dish. I will make this again soon.','2024-11-29 05:23:53'),(8,8,7,4,'Simple and delicious. I added some extra herbs for flavor, and it turned out great.','2024-11-29 05:23:53'),(9,9,8,3,'The recipe was easy to follow, but the result wasn’t as flavorful as I hoped.','2024-11-29 05:23:53'),(10,4,3,5,'Delicious! The flavors were incredible, and the video helped a lot.','2024-11-29 05:25:29'),(11,5,4,3,'Not my favorite, but it’s still a decent recipe. The instructions were clear.','2024-11-29 05:25:29'),(12,6,5,4,'A tasty meal, though I felt the cook time was a bit longer than expected.','2024-11-29 05:25:29'),(13,7,6,5,'Absolutely loved it! My whole family enjoyed the dish. I will make this again soon.','2024-11-29 05:25:29'),(14,8,7,4,'Simple and delicious. I added some extra herbs for flavor, and it turned out great.','2024-11-29 05:25:29'),(15,9,8,3,'The recipe was easy to follow, but the result wasn’t as flavorful as I hoped.','2024-11-29 05:25:29');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','john@example.com','password123',0,NULL,'2024-11-29 04:41:09'),(2,'Admin User','admin@example.com','hashedpassword2',1,NULL,'2024-11-29 04:41:09'),(3,'Mark Johnson','mark.johnson@example.com','password789',0,NULL,'2024-11-29 05:23:07'),(4,'Emily Davis','emily.davis@example.com','password101',0,NULL,'2024-11-29 05:23:07'),(5,'Michael Brown','michael.brown@example.com','password202',0,NULL,'2024-11-29 05:23:07'),(6,'Sarah Wilson','sarah.wilson@example.com','password303',0,NULL,'2024-11-29 05:23:07'),(7,'David Miller','david.miller@example.com','password404',0,NULL,'2024-11-29 05:23:07'),(8,'Olivia Taylor','olivia.taylor@example.com','password505',1,NULL,'2024-11-29 05:23:07'),(9,'Lucas Green','lucas.green@example.com','password606',0,NULL,'2024-11-29 05:24:30'),(10,'Sophia Adams','sophia.adams@example.com','password707',0,NULL,'2024-11-29 05:24:30'),(11,'James Lee','james.lee@example.com','password808',0,NULL,'2024-11-29 05:24:30'),(12,'Isabella Clark','isabella.clark@example.com','password909',1,NULL,'2024-11-29 05:24:30'),(13,'Ethan Walker','ethan.walker@example.com','password010',0,NULL,'2024-11-29 05:24:30'),(14,'Mia Harris','mia.harris@example.com','password111',0,NULL,'2024-11-29 05:24:30'),(15,'Alexander Moore','alexander.moore@example.com','password212',0,NULL,'2024-11-29 05:24:30'),(16,'Charlotte Scott','charlotte.scott@example.com','password313',1,NULL,'2024-11-29 05:24:30');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_views`
--

DROP TABLE IF EXISTS `video_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video_views` (
  `view_id` int NOT NULL AUTO_INCREMENT,
  `recipe_id` int NOT NULL,
  `viewed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`view_id`),
  KEY `recipe_id` (`recipe_id`),
  CONSTRAINT `video_views_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_views`
--

LOCK TABLES `video_views` WRITE;
/*!40000 ALTER TABLE `video_views` DISABLE KEYS */;
INSERT INTO `video_views` VALUES (1,2,'2024-11-29 05:13:12'),(2,4,'2024-11-29 05:13:12');
/*!40000 ALTER TABLE `video_views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29  1:15:52
