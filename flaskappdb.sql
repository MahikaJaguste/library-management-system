-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: assignment_6
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Authors` (
  `author_ID` int NOT NULL,
  `author_name` varchar(225) NOT NULL,
  PRIMARY KEY (`author_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Auth`
--

DROP TABLE IF EXISTS `Book_Auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Auth` (
  `book_ID` int NOT NULL,
  `author_ID` int NOT NULL,
  PRIMARY KEY (`book_ID`,`author_ID`),
  KEY `book_auth_auth_ID_idx` (`author_ID`),
  CONSTRAINT `book_auth_auth_ID` FOREIGN KEY (`author_ID`) REFERENCES `Authors` (`author_ID`),
  CONSTRAINT `book_auth_book_ID` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Auth`
--

LOCK TABLES `Book_Auth` WRITE;
/*!40000 ALTER TABLE `Book_Auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_Auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Genre`
--

DROP TABLE IF EXISTS `Book_Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Genre` (
  `book_ID` int NOT NULL,
  `genre_ID` int NOT NULL,
  PRIMARY KEY (`book_ID`,`genre_ID`),
  KEY `genre_genre_ID_idx` (`genre_ID`),
  CONSTRAINT `genre_book_ID` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`),
  CONSTRAINT `genre_genre_ID` FOREIGN KEY (`genre_ID`) REFERENCES `Genres` (`genre_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Genre`
--

LOCK TABLES `Book_Genre` WRITE;
/*!40000 ALTER TABLE `Book_Genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Issue`
--

DROP TABLE IF EXISTS `Book_Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Issue` (
  `transaction_ID` int NOT NULL,
  `book_ID` int NOT NULL,
  PRIMARY KEY (`transaction_ID`),
  KEY `issue_ID_book_idx` (`book_ID`),
  CONSTRAINT `issue_ID_book` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`),
  CONSTRAINT `issue_ID_trans` FOREIGN KEY (`transaction_ID`) REFERENCES `Transaction` (`transaction_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Issue`
--

LOCK TABLES `Book_Issue` WRITE;
/*!40000 ALTER TABLE `Book_Issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_Issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Location`
--

DROP TABLE IF EXISTS `Book_Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Location` (
  `book_ID` int NOT NULL,
  `shelf_ID` varchar(45) NOT NULL,
  `shelf_section` varchar(45) NOT NULL,
  PRIMARY KEY (`book_ID`),
  KEY `location_shelf_section_idx` (`shelf_ID`,`shelf_section`),
  CONSTRAINT `location_book_ID` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`),
  CONSTRAINT `location_shelf_section` FOREIGN KEY (`shelf_ID`, `shelf_section`) REFERENCES `Location` (`shelf_ID`, `shelf_section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Location`
--

LOCK TABLES `Book_Location` WRITE;
/*!40000 ALTER TABLE `Book_Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book_Pub`
--

DROP TABLE IF EXISTS `Book_Pub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Book_Pub` (
  `book_ID` int NOT NULL,
  `publisher_ID` int NOT NULL,
  PRIMARY KEY (`book_ID`),
  KEY `book_ID_pub_idx` (`publisher_ID`),
  CONSTRAINT `book_ID_book` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`),
  CONSTRAINT `book_ID_pub` FOREIGN KEY (`publisher_ID`) REFERENCES `Publishers` (`publisher_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book_Pub`
--

LOCK TABLES `Book_Pub` WRITE;
/*!40000 ALTER TABLE `Book_Pub` DISABLE KEYS */;
/*!40000 ALTER TABLE `Book_Pub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Books` (
  `book_ID` int NOT NULL,
  `book_name` varchar(225) NOT NULL,
  `num_pages` int NOT NULL,
  `availability` varchar(45) NOT NULL DEFAULT 'True',
  PRIMARY KEY (`book_ID`),
  CONSTRAINT `books_chk_1` CHECK ((`num_pages` > 0)),
  CONSTRAINT `books_chk_2` CHECK ((`availability` in (_utf8mb4'True',_utf8mb4'False')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books_Purchase`
--

DROP TABLE IF EXISTS `Books_Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Books_Purchase` (
  `purchase_ID` int NOT NULL,
  `price` int NOT NULL,
  `purchase_date` datetime DEFAULT NULL,
  PRIMARY KEY (`purchase_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books_Purchase`
--

LOCK TABLES `Books_Purchase` WRITE;
/*!40000 ALTER TABLE `Books_Purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books_Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Faculty` (
  `user_ID` int NOT NULL,
  `dept_name` varchar(45) NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  CONSTRAINT `user_ID_faculty` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genres`
--

DROP TABLE IF EXISTS `Genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genres` (
  `genre_ID` int NOT NULL,
  `genre_name` varchar(45) NOT NULL,
  PRIMARY KEY (`genre_ID`),
  UNIQUE KEY `genre_name_UNIQUE` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genres`
--

LOCK TABLES `Genres` WRITE;
/*!40000 ALTER TABLE `Genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `Genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Salary`
--

DROP TABLE IF EXISTS `Job_Salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Job_Salary` (
  `job_profile` varchar(225) NOT NULL,
  `salary` int DEFAULT NULL,
  PRIMARY KEY (`job_profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Salary`
--

LOCK TABLES `Job_Salary` WRITE;
/*!40000 ALTER TABLE `Job_Salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `Job_Salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Staff`
--

DROP TABLE IF EXISTS `Library_Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library_Staff` (
  `user_ID` int NOT NULL,
  `lib_dept` varchar(225) NOT NULL,
  KEY `user_ID_lib_idx` (`user_ID`),
  CONSTRAINT `user_ID_lib` FOREIGN KEY (`user_ID`) REFERENCES `Staff` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Staff`
--

LOCK TABLES `Library_Staff` WRITE;
/*!40000 ALTER TABLE `Library_Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library_Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Staff_Working_Hours`
--

DROP TABLE IF EXISTS `Library_Staff_Working_Hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library_Staff_Working_Hours` (
  `user_ID` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`user_ID`,`start_time`),
  CONSTRAINT `lib_user_ID` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `library_staff_working_hours_chk_1` CHECK ((`start_time` < `end_time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Staff_Working_Hours`
--

LOCK TABLES `Library_Staff_Working_Hours` WRITE;
/*!40000 ALTER TABLE `Library_Staff_Working_Hours` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library_Staff_Working_Hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Systems`
--

DROP TABLE IF EXISTS `Library_Systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Library_Systems` (
  `system_ID` int NOT NULL,
  `system_specs` text NOT NULL,
  PRIMARY KEY (`system_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Systems`
--

LOCK TABLES `Library_Systems` WRITE;
/*!40000 ALTER TABLE `Library_Systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `Library_Systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Location` (
  `shelf_ID` varchar(45) NOT NULL,
  `shelf_section` varchar(45) NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`shelf_ID`,`shelf_section`),
  CONSTRAINT `location_chk_1` CHECK ((`capacity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Other_Staff`
--

DROP TABLE IF EXISTS `Other_Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Other_Staff` (
  `user_ID` int NOT NULL,
  `working_hours` int NOT NULL,
  KEY `user_ID_other_idx` (`user_ID`),
  CONSTRAINT `user_ID_other` FOREIGN KEY (`user_ID`) REFERENCES `Staff` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `other_staff_chk_1` CHECK ((`working_hours` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Other_Staff`
--

LOCK TABLES `Other_Staff` WRITE;
/*!40000 ALTER TABLE `Other_Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Other_Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Penalties`
--

DROP TABLE IF EXISTS `Penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Penalties` (
  `fee_receipt_ID` int NOT NULL,
  `description` varchar(225) NOT NULL,
  PRIMARY KEY (`fee_receipt_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Penalties`
--

LOCK TABLES `Penalties` WRITE;
/*!40000 ALTER TABLE `Penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `Penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers`
--

DROP TABLE IF EXISTS `Publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publishers` (
  `publisher_ID` int NOT NULL,
  `publisher_name` varchar(225) NOT NULL,
  `street_num` varchar(45) DEFAULT NULL,
  `street_name` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`publisher_ID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers`
--

LOCK TABLES `Publishers` WRITE;
/*!40000 ALTER TABLE `Publishers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publishers_Phone`
--

DROP TABLE IF EXISTS `Publishers_Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Publishers_Phone` (
  `publisher_ID` int NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`publisher_ID`,`phone_number`),
  CONSTRAINT `publisher_ID_phone` FOREIGN KEY (`publisher_ID`) REFERENCES `Publishers` (`publisher_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publishers_Phone`
--

LOCK TABLES `Publishers_Phone` WRITE;
/*!40000 ALTER TABLE `Publishers_Phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Publishers_Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Purchase` (
  `book_ID` int NOT NULL,
  `purchase_ID` int DEFAULT NULL,
  PRIMARY KEY (`book_ID`),
  KEY `purchase_ID_purchase_idx` (`purchase_ID`),
  CONSTRAINT `purchase_ID_book` FOREIGN KEY (`book_ID`) REFERENCES `Books` (`book_ID`),
  CONSTRAINT `purchase_ID_purchase` FOREIGN KEY (`purchase_ID`) REFERENCES `Books_Purchase` (`purchase_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `user_ID` int NOT NULL,
  `job_profile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_ID`),
  CONSTRAINT `user_ID_staff` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Strike`
--

DROP TABLE IF EXISTS `Strike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Strike` (
  `fee_receipt_ID` int NOT NULL,
  `transaction_ID` int NOT NULL,
  `days` int NOT NULL,
  `fee_paid` int NOT NULL,
  PRIMARY KEY (`fee_receipt_ID`),
  UNIQUE KEY `transaction_ID_UNIQUE` (`transaction_ID`),
  KEY `strike_trans_ID_idx` (`transaction_ID`),
  CONSTRAINT `strike_receipt_ID` FOREIGN KEY (`fee_receipt_ID`) REFERENCES `Penalties` (`fee_receipt_ID`),
  CONSTRAINT `strike_trans_ID` FOREIGN KEY (`transaction_ID`) REFERENCES `Transaction` (`transaction_ID`),
  CONSTRAINT `strike_chk_1` CHECK ((`days` > 0)),
  CONSTRAINT `strike_chk_2` CHECK ((`fee_paid` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Strike`
--

LOCK TABLES `Strike` WRITE;
/*!40000 ALTER TABLE `Strike` DISABLE KEYS */;
/*!40000 ALTER TABLE `Strike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `user_ID` int NOT NULL,
  `programme` varchar(45) NOT NULL,
  PRIMARY KEY (`user_ID`),
  CONSTRAINT `user_ID_student` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `System_Allocation`
--

DROP TABLE IF EXISTS `System_Allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `System_Allocation` (
  `user_ID` int NOT NULL,
  `system_ID` int NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `system_ID_UNIQUE` (`system_ID`),
  CONSTRAINT `system_system_ID` FOREIGN KEY (`system_ID`) REFERENCES `Library_Systems` (`system_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `system_user_ID` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `System_Allocation`
--

LOCK TABLES `System_Allocation` WRITE;
/*!40000 ALTER TABLE `System_Allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `System_Allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transaction` (
  `transaction_ID` int NOT NULL,
  `issue_date` datetime NOT NULL,
  `expected_return_date` datetime NOT NULL,
  `actual_return_date` datetime DEFAULT NULL,
  PRIMARY KEY (`transaction_ID`),
  CONSTRAINT `transaction_chk_1` CHECK ((`issue_date` <= `expected_return_date`)),
  CONSTRAINT `transaction_chk_2` CHECK ((((`actual_return_date` is not null) and (`issue_date` <= `actual_return_date`)) or (`actual_return_date` is null)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Issue`
--

DROP TABLE IF EXISTS `User_Issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Issue` (
  `transaction_ID` int NOT NULL,
  `user_ID` int NOT NULL,
  PRIMARY KEY (`transaction_ID`),
  KEY `user_ID_user_idx` (`user_ID`),
  CONSTRAINT `user_ID_trans` FOREIGN KEY (`transaction_ID`) REFERENCES `Transaction` (`transaction_ID`),
  CONSTRAINT `user_ID_user` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Issue`
--

LOCK TABLES `User_Issue` WRITE;
/*!40000 ALTER TABLE `User_Issue` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Issue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_ID` int NOT NULL,
  `User_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users_Phone`
--

DROP TABLE IF EXISTS `Users_Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users_Phone` (
  `user_ID` int NOT NULL,
  `phone_number` int NOT NULL,
  PRIMARY KEY (`user_ID`,`phone_number`),
  CONSTRAINT `user_ID` FOREIGN KEY (`user_ID`) REFERENCES `Users` (`user_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users_Phone`
--

LOCK TABLES `Users_Phone` WRITE;
/*!40000 ALTER TABLE `Users_Phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users_Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'assignment_6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27 17:21:50
