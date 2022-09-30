CREATE DATABASE  IF NOT EXISTS `kando` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `kando`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: kando
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `attachement`
--

DROP TABLE IF EXISTS `attachement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachement` (
  `AttachmentID` int NOT NULL AUTO_INCREMENT,
  `Attachement` longblob,
  PRIMARY KEY (`AttachmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachement`
--

LOCK TABLES `attachement` WRITE;
/*!40000 ALTER TABLE `attachement` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `BoardID` int NOT NULL AUTO_INCREMENT,
  `BoardName` varchar(255) NOT NULL,
  `BoardDesc` varchar(255) NOT NULL,
  PRIMARY KEY (`BoardID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'Product launch','A kando board for the launch of our new exciting product'),(2,'Decorate this house','We need to redecorate our house');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_invite`
--

DROP TABLE IF EXISTS `board_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_invite` (
  `InviteID` int NOT NULL AUTO_INCREMENT,
  `BoardID` int NOT NULL,
  `UserID` int NOT NULL,
  `InviteAccepted` tinyint(1) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `DateSent` datetime DEFAULT NULL,
  PRIMARY KEY (`InviteID`),
  KEY `InviteBoardID_FK_idx` (`BoardID`),
  KEY `InviteUserID_KF_idx` (`UserID`),
  CONSTRAINT `InviteBoardID_FK` FOREIGN KEY (`BoardID`) REFERENCES `board` (`BoardID`),
  CONSTRAINT `InviteUserID_KF` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_invite`
--

LOCK TABLES `board_invite` WRITE;
/*!40000 ALTER TABLE `board_invite` DISABLE KEYS */;
INSERT INTO `board_invite` VALUES (1,1,1,1,'gbexon1@shop-pro.jp','2021-01-04 10:02:00'),(2,1,2,1,'jwarder2@google.fr','2021-01-04 10:00:00'),(3,1,1,1,'jmarvell3@cpanel.net','2021-01-04 10:01:30'),(4,1,2,1,'jmcillroy4@globo.com','2021-01-04 10:01:00'),(5,1,2,1,'myitzovitz5@wikipedia.org','2021-01-04 10:01:34'),(6,1,2,0,'dberre7@simplemachines.org','2021-01-04 10:04:21'),(7,1,1,0,'adacombe9@usda.gov','2021-01-04 10:10:19'),(8,1,2,0,'piacovoj@spiegel.de','2021-01-04 10:05:20'),(9,2,29,1,'mbenoit19@columbia.edu','2021-01-04 10:03:23'),(10,2,29,0,'aames11@rakuten.co.jp','2021-01-04 10:05:54');
/*!40000 ALTER TABLE `board_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_member`
--

DROP TABLE IF EXISTS `board_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_member` (
  `BoardID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`BoardID`,`UserID`),
  KEY `userid_fk_idx` (`UserID`),
  CONSTRAINT `boardid2_fk` FOREIGN KEY (`BoardID`) REFERENCES `board` (`BoardID`),
  CONSTRAINT `member_fk` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_member`
--

LOCK TABLES `board_member` WRITE;
/*!40000 ALTER TABLE `board_member` DISABLE KEYS */;
INSERT INTO `board_member` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,29),(2,46);
/*!40000 ALTER TABLE `board_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_owner`
--

DROP TABLE IF EXISTS `board_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_owner` (
  `BoardID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`BoardID`,`UserID`),
  KEY `userid_fk_idx` (`UserID`),
  CONSTRAINT `boardid_fk` FOREIGN KEY (`BoardID`) REFERENCES `board` (`BoardID`),
  CONSTRAINT `userid_fk` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_owner`
--

LOCK TABLES `board_owner` WRITE;
/*!40000 ALTER TABLE `board_owner` DISABLE KEYS */;
INSERT INTO `board_owner` VALUES (1,1),(1,2),(2,29);
/*!40000 ALTER TABLE `board_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `CardID` int NOT NULL AUTO_INCREMENT,
  `ColumnID` int NOT NULL,
  `CardTitle` varchar(255) NOT NULL,
  `Creator` int NOT NULL,
  `CardPos` int NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Duedate` datetime DEFAULT NULL,
  `Colour` char(6) DEFAULT NULL,
  PRIMARY KEY (`CardID`),
  KEY `colid_fk_idx` (`ColumnID`),
  KEY `creator_fk_idx` (`Creator`),
  CONSTRAINT `colid_fk` FOREIGN KEY (`ColumnID`) REFERENCES `column` (`ColumnID`),
  CONSTRAINT `creator_fk` FOREIGN KEY (`Creator`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (1,3,'Planning and strategy',1,0,'Tasks required for the planning and strategy required for our product launch','2021-10-04 12:00:00','0ad143'),(2,3,'Product research',2,1,'Tasks related to product development','2021-10-07 15:00:00','e9417e'),(3,3,'Contact Justin',1,2,'Contact the product designer Justin to get his input','2021-10-02 12:00:00','3b45a3'),(4,2,'Logo design',1,0,'Create a new logo for the product','2021-12-14 15:00:00','0e9c50'),(5,1,'Prototype development',1,0,'Prototype product development tasks','2022-01-07 10:00:00','e9417e'),(6,1,'Focus group testing',1,1,'We need to test the prototype with focus groups','2021-02-01 14:00:00','030bfc'),(7,1,'Buy 3D printer',3,2,'We should buy a 3D printer for prototyping tasks it would be really useful. ','2021-12-10 10:00:00','0ee644'),(8,5,'Determine themes',29,0,'Determine the themes for each of the rooms in the house','2021-12-15 10:00:00','8319e6'),(9,5,'Get quotes',29,1,'Get quotes from local painters','2021-12-17 14:00:00','1109e8'),(10,6,'Review mags',29,1,'Review house magazines to get inspiration','2021-12-15 14:00:00','8319e6'),(11,6,'Create scrapbook',29,2,'Create a scrapbook with cool ideas for decorating the house','2021-12-15 14:00:00','8319e6'),(12,5,'Paint samples',29,2,'Get paint samples once we agree colour schemes','2021-12-20 10:00:00','1109e8'),(13,5,'Fabric samples',29,3,'Get fabric samples for the living room furniture','2021-12-23 11:00:00','8319e6'),(14,6,'Convince you',29,0,'Convince you that we need to redecorate the house','2021-10-01 10:00:00','8319e6');
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_assignment`
--

DROP TABLE IF EXISTS `card_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_assignment` (
  `CardID` int NOT NULL,
  `UserID` int NOT NULL,
  PRIMARY KEY (`CardID`,`UserID`),
  KEY `cardAddUID_fk_idx` (`UserID`),
  CONSTRAINT `cardAddUID_fk` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `cardAssID_fk` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_assignment`
--

LOCK TABLES `card_assignment` WRITE;
/*!40000 ALTER TABLE `card_assignment` DISABLE KEYS */;
INSERT INTO `card_assignment` VALUES (1,1),(7,1),(2,2),(5,2),(2,3),(5,3),(7,3),(3,4),(6,5),(4,6),(8,29),(10,29),(11,29),(13,29),(14,29),(9,46),(12,46);
/*!40000 ALTER TABLE `card_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_attachments`
--

DROP TABLE IF EXISTS `card_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_attachments` (
  `CardID` int NOT NULL,
  `AttachementID` int NOT NULL,
  PRIMARY KEY (`CardID`,`AttachementID`),
  KEY `attachmentid_fk_idx` (`AttachementID`),
  CONSTRAINT `attachmentid_fk` FOREIGN KEY (`AttachementID`) REFERENCES `attachement` (`AttachmentID`),
  CONSTRAINT `cardattachement_fk` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_attachments`
--

LOCK TABLES `card_attachments` WRITE;
/*!40000 ALTER TABLE `card_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_comment`
--

DROP TABLE IF EXISTS `card_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_comment` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `CardID` int NOT NULL,
  `Author` int NOT NULL,
  `Comment` varchar(512) NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `commentcardid_fk_idx` (`CardID`),
  KEY `commentauthorid_fk_idx` (`Author`),
  CONSTRAINT `commentauthorid_fk` FOREIGN KEY (`Author`) REFERENCES `user` (`UserID`),
  CONSTRAINT `commentcardid_fk` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_comment`
--

LOCK TABLES `card_comment` WRITE;
/*!40000 ALTER TABLE `card_comment` DISABLE KEYS */;
INSERT INTO `card_comment` VALUES (1,2,1,'Does anyone have any ideas how we go about researching a new product?','2021-10-01 10:23:00'),(2,2,2,'Good question maybe we should find a problem or gap in the market?','2021-10-01 12:24:14'),(3,2,4,'I know a great product designer called Justin who can mock up our idea once we have one','2021-10-01 13:23:34'),(4,2,1,'Great, Juditha I have added a task for you to contact Justin and assigned it to you','2021-10-01 13:30:31'),(5,2,4,'I had a great talk with Justin, he has some fantastic ideas and will show us his portfolio','2021-10-03 12:34:54'),(6,4,6,'What do we want out logo to say?','2021-10-04 09:12:43'),(8,5,1,'Who wants to lead up the product development?','2021-10-03 08:57:21'),(9,5,3,'I will take that task onboard Jillayne','2021-10-03 10:37:12'),(10,6,5,'How do you want to run the focus groups?','2021-10-02 12:47:12'),(11,6,6,'Identify the demographics, send them a prototype and get some feedback','2021-10-03 10:41:57'),(12,3,4,'Justin said he would be delighted to input into the project. He has some great initial ideas','2021-10-04 12:34:54'),(13,3,1,'This is fantastic news, can you add a summary of his initial thoughts to the card please Juditha.','2021-10-04 13:23:24'),(14,3,4,'Justin thinks we need to do some initial focus groups and apply some design thinking to get a good picture of user needs.','2021-10-05 10:11:08'),(15,1,1,'Well Gusta, it looks like it is just you and I on this project at the minute. How do you think we should proceed?','2021-09-26 11:45:27'),(16,1,2,'Hi Jillayne, I think we need to get some more team members and determine our plan and strategy. I will create a checklist with some initial tasks','2021-09-26 12:01:57'),(17,1,1,'Thanks Gusta, I knew I could depend on you to get this project started. Thanks again.','2021-09-26 14:47:16'),(18,4,2,'I suppose essence of your brand, An immediate and honest impression of our business philosophy. Impact. ','2021-11-04 12:35:43'),(19,4,6,'Gusta, that is a lot to get across in a visual design. I will get started with some prototypes and get back to you. ','2021-11-04 12:44:24'),(20,4,2,'Hi Marie, how are you getting on with the logo design, do you have any initial prototypes to show us? ','2021-11-08 09:05:11'),(21,4,6,'I should be ready to show the team my initial concepts by this afternoon if that works for you Gusta?','2021-11-08 11:32:43'),(22,4,2,'That is fantastic, Marie. I am really excited to see what you have come up with','2021-11-08 11:34:51');
/*!40000 ALTER TABLE `card_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_label`
--

DROP TABLE IF EXISTS `card_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_label` (
  `CardLabelID` int NOT NULL AUTO_INCREMENT,
  `LabelTitle` varchar(255) NOT NULL,
  `Colour` char(6) NOT NULL,
  PRIMARY KEY (`CardLabelID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_label`
--

LOCK TABLES `card_label` WRITE;
/*!40000 ALTER TABLE `card_label` DISABLE KEYS */;
INSERT INTO `card_label` VALUES (1,'Science','fcba03'),(2,'Nature','5a9c88'),(3,'Essential','677385'),(4,'Urgent','1a65d6'),(5,'Resources','3c6e64'),(6,'KPIs','cc5523'),(7,'Core task','1b50ab'),(8,'Delegated','c217cf'),(9,'DIY','23c238'),(10,'Done','030408'),(11,'Action required','fa2802'),(12,'Feature request','0ad143');
/*!40000 ALTER TABLE `card_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list`
--

DROP TABLE IF EXISTS `check_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list` (
  `CheckListID` int NOT NULL AUTO_INCREMENT,
  `CardID` int NOT NULL,
  `Title` varchar(255) NOT NULL,
  `ListPos` int NOT NULL,
  PRIMARY KEY (`CheckListID`),
  KEY `checklistCardID_fk_idx` (`CardID`),
  CONSTRAINT `checklistCardID_fk` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list`
--

LOCK TABLES `check_list` WRITE;
/*!40000 ALTER TABLE `check_list` DISABLE KEYS */;
INSERT INTO `check_list` VALUES (1,1,'Planning and strategy checklist',0),(2,5,'Product development tasks',0),(3,6,'Focus group testing tasks',0),(4,2,'Product research tasks',0),(5,4,'Logo design tasks',0),(6,4,'Revise logo design tasks',1),(7,5,'Define prototyping constraints',0),(8,5,'Evaluate rendering providers',1),(9,5,'Evaluate prototype providers',2),(10,12,'Get paints',0);
/*!40000 ALTER TABLE `check_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_item`
--

DROP TABLE IF EXISTS `check_list_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_list_item` (
  `CheckListItemID` int NOT NULL AUTO_INCREMENT,
  `CheckListID` int NOT NULL,
  `ItemText` varchar(255) NOT NULL,
  `AssignedTo` int DEFAULT NULL,
  `Completed` tinyint(1) NOT NULL,
  `ItemPos` int NOT NULL,
  PRIMARY KEY (`CheckListItemID`,`Completed`),
  KEY `checklistid_fk_idx` (`CheckListID`),
  KEY `assignedto_fk_idx` (`AssignedTo`),
  CONSTRAINT `assignedto_fk` FOREIGN KEY (`AssignedTo`) REFERENCES `user` (`UserID`),
  CONSTRAINT `checklistid_fk` FOREIGN KEY (`CheckListID`) REFERENCES `check_list` (`CheckListID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_item`
--

LOCK TABLES `check_list_item` WRITE;
/*!40000 ALTER TABLE `check_list_item` DISABLE KEYS */;
INSERT INTO `check_list_item` VALUES (1,1,'Brainstorm product ideas',1,1,1),(2,1,'Conduct market research to validate our ideas',2,1,2),(3,1,'Give product catchy name',2,1,3),(4,1,'Determine a realistic launch date',1,1,4),(5,2,'Create a prototype',2,0,0),(6,2,'Test prototype device',2,0,1),(7,2,'Get user feedback on the prototype',2,0,2),(8,3,'Identify focus group demographics',5,1,0),(9,3,'Set date and time for focus groups',5,0,1),(10,3,'Send invites to focus group members',5,0,2),(11,3,'Send prototype products to focus group members',6,0,3),(12,1,'Add more members to the team',2,1,0),(13,4,'Research the existing market',3,1,0),(14,4,'Identify top selling products',3,0,1),(15,4,'Analyse product reviews for insights',3,1,2),(16,4,'Identify top trends within the marketplace for these types of prodcuts',3,1,3),(17,5,'Research initial logo concepts from other big brands',6,1,0),(18,5,'Select and review logo colour scheme ',6,1,1),(19,5,'Sketch initial concepts',6,1,2),(20,5,'Share concepts with team on sharepoint',6,0,3),(21,5,'Arrange team meeting to review logo concepts',2,0,4),(22,6,'Summarise team feedback on logo design',2,0,0),(23,6,'Redesign logo based on team feedback',6,0,1),(24,6,'Share logo design with wider company for feedback',2,0,2),(25,6,'Get feedback from brand consultant',2,0,3),(26,7,'Determine and agree on prototype objectives',1,0,0),(27,7,'Agree budget for prototyping task',1,0,1),(28,7,'Identify 3D product rendering providers',2,0,2),(29,7,'Identify physical prototying providers',2,0,3),(30,8,'Create rendering contract',3,0,0),(31,8,'Issue invitation for rendering contract bid packages',3,0,1),(32,8,'Evaluate rendering submissions from external companies',2,0,2),(33,8,'Select provider and award contract',1,0,3),(34,9,'Create contract for prototyping supplies',2,0,0),(35,9,'Advertise contract on company website',3,0,1),(36,9,'Review submissions from prototyping companies',1,0,2),(37,9,'Select prototyping provider and issue contract',2,0,3),(38,10,'Get paint samples from Dulux',46,0,0),(39,10,'Get paint samples from Johnstones paint',46,0,1),(40,10,'Get paint samples from Crown paint trade centre',46,0,2);
/*!40000 ALTER TABLE `check_list_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `column`
--

DROP TABLE IF EXISTS `column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `column` (
  `ColumnID` int NOT NULL AUTO_INCREMENT,
  `BoardID` int NOT NULL,
  `ColumnTitle` varchar(45) NOT NULL,
  `ColumnPos` int NOT NULL,
  `WIP` int DEFAULT NULL,
  PRIMARY KEY (`ColumnID`),
  KEY `boardcol_fk_idx` (`BoardID`),
  CONSTRAINT `boardcol_fk` FOREIGN KEY (`BoardID`) REFERENCES `board` (`BoardID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column`
--

LOCK TABLES `column` WRITE;
/*!40000 ALTER TABLE `column` DISABLE KEYS */;
INSERT INTO `column` VALUES (1,1,'Requested',0,5),(2,1,'In Progress',1,8),(3,1,'Done',3,NULL),(4,1,'Under review',2,2),(5,2,'To do',0,NULL),(6,2,'Doing ',1,NULL),(7,2,'Done',2,NULL);
/*!40000 ALTER TABLE `column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labelled_cards`
--

DROP TABLE IF EXISTS `labelled_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `labelled_cards` (
  `CardLabelID` int NOT NULL,
  `CardID` int NOT NULL,
  PRIMARY KEY (`CardLabelID`,`CardID`),
  KEY `labelledcardid_fk_idx` (`CardID`),
  CONSTRAINT `cardlabelid_fk` FOREIGN KEY (`CardLabelID`) REFERENCES `card_label` (`CardLabelID`),
  CONSTRAINT `labelledcardid_fk` FOREIGN KEY (`CardID`) REFERENCES `card` (`CardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labelled_cards`
--

LOCK TABLES `labelled_cards` WRITE;
/*!40000 ALTER TABLE `labelled_cards` DISABLE KEYS */;
INSERT INTO `labelled_cards` VALUES (3,1),(7,1),(3,2),(7,2),(4,3),(8,4),(7,5),(8,6),(8,7);
/*!40000 ALTER TABLE `labelled_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(255) NOT NULL,
  `Sname` varchar(255) NOT NULL,
  `UserName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `ProfilePic` longblob,
  `AccountValidated` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jillayne','Bremen','jbremen0','jbremen0@marriott.com','Ke6TNv',NULL,1),(2,'Gusta','Bexon','gbexon1','gbexon1@shop-pro.jp','Om1XBf2',NULL,1),(3,'Jorgan','Warder','jwarder2','jwarder2@google.fr','u0NR0mDhf1ld',NULL,1),(4,'Juditha','Marvell','jmarvell3','jmarvell3@cpanel.net','zEk3isM',NULL,1),(5,'Jasmin','McIllroy','jmcillroy4','jmcillroy4@globo.com','otuE14uZk6n',NULL,1),(6,'Marie','Yitzovitz','myitzovitz5','myitzovitz5@wikipedia.org','82G5eznG',NULL,1),(7,'Anita','Fruen','afruen6','afruen6@mtv.com','tmsW1h1f',NULL,1),(8,'Doretta','Berre','dberre7','dberre7@simplemachines.org','vCHP6D',NULL,0),(9,'Gothart','Renzullo','grenzullo8','grenzullo8@narod.ru','YfVqj0SycR',NULL,1),(10,'Antonella','Dacombe','adacombe9','adacombe9@usda.gov','LuRExurV',NULL,0),(11,'Gaby','Trinbey','gtrinbeya','gtrinbeya@spotify.com','OO2x0F1rQ',NULL,0),(12,'Boote','O\'Dougherty','bodoughertyb','bodoughertyb@opera.com','mCBbWahvNwMJ',NULL,1),(13,'Kin','Losty','klostyc','klostyc@i2i.jp','iG3rHZAQp',NULL,0),(14,'Tiler','Castleman','tcastlemand','tcastlemand@businesswire.com','7ojZPDfdvEM',NULL,1),(15,'Coleen','Fitzackerley','cfitzackerleye','cfitzackerleye@unicef.org','AaSFhw7r0KRC',NULL,1),(16,'Libbey','Lightwing','llightwingf','llightwingf@ask.com','RUvNO5z9',NULL,1),(17,'Courtnay','Vigours','cvigoursg','cvigoursg@constantcontact.com','GTpvew5Xjoqe',NULL,1),(18,'Brooke','Vinten','bvintenh','bvintenh@dion.ne.jp','f11K6tCSD',NULL,0),(19,'Waite','Bellingham','wbellinghami','wbellinghami@naver.com','pF8hhh',NULL,1),(20,'Paton','Iacovo','piacovoj','piacovoj@spiegel.de','7F5ZeIU',NULL,0),(21,'Waiter','Bloor','wbloork','wbloork@baidu.com','xL60CH',NULL,1),(22,'Candide','Stewart','cstewartl','cstewartl@theglobeandmail.com','RZtGg9P2L',NULL,1),(23,'Dominga','Barkway','dbarkwaym','dbarkwaym@amazon.co.jp','G6RHOU',NULL,0),(24,'Claudette','Pringour','cpringourn','cpringourn@java.com','emluu8eNuN',NULL,1),(25,'Zorina','Sorby','zsorbyo','zsorbyo@ebay.com','7ns6sfc3',NULL,1),(26,'Siouxie','Found','sfoundp','sfoundp@economist.com','vz5nYHq4J',NULL,0),(27,'Virgina','Newey','vneweyq','vneweyq@state.gov','x4mToufZpHV',NULL,0),(28,'Constancia','McGerr','cmcgerrr','cmcgerrr@dot.gov','GVzfde0',NULL,1),(29,'Jana','Kail','jkails','jkails@1688.com','RDlDvg',NULL,1),(30,'Kiersten','Fishlock','kfishlockt','kfishlockt@noaa.gov','3PhcElvRvYCX',NULL,1),(31,'Austina','De Andreis','adeandreisu','adeandreisu@drupal.org','Gih20T',NULL,0),(32,'Philippe','Leppingwell','pleppingwellv','pleppingwellv@whitehouse.gov','CJQgxKc',NULL,1),(33,'Trudey','Clorley','tclorleyw','tclorleyw@dion.ne.jp','LN7b9moI98U',NULL,1),(34,'Jacklin','Brane','jbranex','jbranex@marketwatch.com','wYQXLisGqO8A',NULL,1),(35,'Mohandis','Gammack','mgammacky','mgammacky@aboutads.info','99IZRt',NULL,0),(36,'Nora','Buss','nbussz','nbussz@umn.edu','cfinaQ7',NULL,0),(37,'Blayne','Schoales','bschoales10','bschoales10@topsy.com','de2yQTvpD',NULL,0),(38,'Abigale','Ames','aames11','aames11@rakuten.co.jp','IJZmuUOljmhi',NULL,0),(39,'Mace','MacDermand','mmacdermand12','mmacdermand12@vimeo.com','Lpdmtw',NULL,1),(40,'Danni','Saladino','dsaladino13','dsaladino13@soup.io','BXwnYbetg',NULL,1),(41,'Ingaborg','Wartonby','iwartonby14','iwartonby14@fotki.com','RxTMeNwl5KnB',NULL,1),(42,'Amalita','Worsnip','aworsnip15','aworsnip15@sourceforge.net','Tddd0CZ',NULL,0),(43,'Donica','Almack','dalmack16','dalmack16@csmonitor.com','wgNFncDve',NULL,0),(44,'Sapphire','Figure','sfigure17','sfigure17@apple.com','RfQqffV',NULL,0),(45,'Aggi','Gibbeson','agibbeson18','agibbeson18@marketwatch.com','9rAz64a',NULL,0),(46,'Marti','Benoit','mbenoit19','mbenoit19@columbia.edu','oJ7mTIqqqC',NULL,1),(47,'Maggie','Onyon','monyon1a','monyon1a@ameblo.jp','u3QDvFEDAuWf',NULL,1),(48,'Reuben','Migheli','rmigheli1b','rmigheli1b@cbslocal.com','rVX3AFI',NULL,0),(49,'Sydney','Forbes','sforbes1c','sforbes1c@example.com','69V42dJvrP',NULL,1),(50,'Daffi','Pentycost','dpentycost1d','dpentycost1d@ted.com','5O3AkJoo',NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-24  9:46:33
