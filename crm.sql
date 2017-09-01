-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crm
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'customer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,19),(2,1,20),(3,1,21);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add role',6,'add_role'),(17,'Can change role',6,'change_role'),(18,'Can delete role',6,'delete_role'),(19,'Can add customer',7,'add_customer'),(20,'Can change customer',7,'change_customer'),(21,'Can delete customer',7,'delete_customer'),(22,'Can add payment record',8,'add_paymentrecord'),(23,'Can change payment record',8,'change_paymentrecord'),(24,'Can delete payment record',8,'delete_paymentrecord'),(25,'Can add course record',9,'add_courserecord'),(26,'Can change course record',9,'change_courserecord'),(27,'Can delete course record',9,'delete_courserecord'),(28,'Can add menu',10,'add_menu'),(29,'Can change menu',10,'change_menu'),(30,'Can delete menu',10,'delete_menu'),(31,'Can add source',11,'add_source'),(32,'Can change source',11,'change_source'),(33,'Can delete source',11,'delete_source'),(34,'Can add customer follow up',12,'add_customerfollowup'),(35,'Can change customer follow up',12,'change_customerfollowup'),(36,'Can delete customer follow up',12,'delete_customerfollowup'),(37,'Can add enrollment',13,'add_enrollment'),(38,'Can change enrollment',13,'change_enrollment'),(39,'Can delete enrollment',13,'delete_enrollment'),(40,'Can add tag',14,'add_tag'),(41,'Can change tag',14,'change_tag'),(42,'Can delete tag',14,'delete_tag'),(43,'Can add class list',15,'add_classlist'),(44,'Can change class list',15,'change_classlist'),(45,'Can delete class list',15,'delete_classlist'),(46,'Can add study record',16,'add_studyrecord'),(47,'Can change study record',16,'change_studyrecord'),(48,'Can delete study record',16,'delete_studyrecord'),(49,'Can add course',17,'add_course'),(50,'Can change course',17,'change_course'),(51,'Can delete course',17,'delete_course'),(52,'Can add account',18,'add_account'),(53,'Can change account',18,'change_account'),(54,'Can delete account',18,'delete_account'),(55,'Can add branch',19,'add_branch'),(56,'Can change branch',19,'change_branch'),(57,'Can delete branch',19,'delete_branch'),(58,'Can add contract',20,'add_contract'),(59,'Can change contract',20,'change_contract'),(60,'Can delete contract',20,'delete_contract'),(61,'Can add sub menu',21,'add_submenu'),(62,'Can change sub menu',21,'change_submenu'),(63,'Can delete sub menu',21,'delete_submenu'),(64,'Can add teacher test',22,'add_teachertest'),(65,'Can change teacher test',22,'change_teachertest'),(66,'Can delete teacher test',22,'delete_teachertest'),(67,'可以查看所有的luffyadmin的app',18,'web_table_index'),(68,'可以查看每张表里所有的数据',18,'web_table_list'),(69,'可以访问表里每条数据的修改页',18,'web_table_list_view'),(70,'可以对表里的每条数据进行修改',18,'web_table_list_change'),(71,'可以查看每张表里所有的数据filter',18,'web_table_list_filter');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_web_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_web_account_id` FOREIGN KEY (`user_id`) REFERENCES `web_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-12 09:59:24.382988','3','test@163.com',1,'[{\"added\": {}}]',18,1),(2,'2017-07-16 12:40:50.324572','1','客户管理',1,'[{\"added\": {}}]',10,1),(3,'2017-07-16 12:45:55.878852','2','班级管理',1,'[{\"added\": {}}]',10,1),(4,'2017-07-16 12:49:20.188296','3','我的班级',1,'[{\"added\": {}}]',10,1),(5,'2017-07-16 12:50:54.500358','1','客户信息',1,'[{\"added\": {}}]',21,1),(6,'2017-07-16 12:51:51.766154','2','需要跟进用户',1,'[{\"added\": {}}]',21,1),(7,'2017-07-16 12:52:50.650296','1','销售',1,'[{\"added\": {}}]',6,1),(8,'2017-07-16 12:52:54.660979','1','wangyufu@163.com',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',18,1),(9,'2017-07-16 12:53:32.149596','2','老师',1,'[{\"added\": {}}]',6,1),(10,'2017-07-16 13:47:42.855512','3','test',1,'[{\"added\": {}}]',21,1),(11,'2017-07-16 13:49:32.086204','3','啊啊啊啊',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',21,1),(12,'2017-07-16 13:49:47.056687','4','啊啊',1,'[{\"added\": {}}]',21,1),(13,'2017-07-16 13:50:44.656610','4','啊啊',3,'',21,1),(14,'2017-07-16 14:30:08.642660','3','啊啊啊啊',3,'',21,1),(15,'2017-07-18 11:45:44.141112','1','Source object',1,'[{\"added\": {}}]',11,1),(16,'2017-07-18 11:46:33.399588','2','Source object',1,'[{\"added\": {}}]',11,1),(17,'2017-07-18 11:49:28.610552','1','Tag object',1,'[{\"added\": {}}]',14,1),(18,'2017-07-18 11:53:49.968800','1','python',1,'[{\"added\": {}}]',17,1),(19,'2017-07-18 11:54:12.612154','2','go',1,'[{\"added\": {}}]',17,1),(20,'2017-07-18 11:57:54.170217','1','王宇夫',1,'[{\"added\": {}}]',7,1),(21,'2017-07-18 13:12:20.781388','2','测试1',1,'[{\"added\": {}}]',7,1),(22,'2017-07-18 13:13:22.960314','3','test2',1,'[{\"added\": {}}]',7,1),(23,'2017-07-30 10:44:08.218097','4','test123',1,'[{\"added\": {}}]',7,1),(24,'2017-08-02 11:48:24.391392','1','CustomerFollowUp object',1,'[{\"added\": {}}]',12,1),(25,'2017-08-03 03:19:32.415717','1','Branch object',1,'[{\"added\": {}}]',19,1),(26,'2017-08-03 03:19:50.322904','1','Contract object',1,'[{\"added\": {}}]',20,1),(27,'2017-08-03 03:20:02.631134','1','python(1)',1,'[{\"added\": {}}]',15,1),(28,'2017-08-03 03:20:16.446489','1','python(1)(1)-基础',1,'[{\"added\": {}}]',9,1),(29,'2017-08-03 03:20:29.156841','1','StudyRecord object',1,'[{\"added\": {}}]',16,1),(30,'2017-08-03 03:57:03.023915','1','PaymentRecord object',1,'[{\"added\": {}}]',8,1),(31,'2017-08-08 10:09:33.872737','1','customer',1,'[{\"added\": {}}]',2,1),(32,'2017-08-08 10:10:25.570920','3','test@163.com',2,'[]',18,1),(33,'2017-08-08 10:11:06.660568','3','test@163.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',18,1),(34,'2017-08-09 02:25:56.837950','3','test@163.com',2,'[]',18,1),(35,'2017-08-09 02:26:25.234024','3','test@163.com',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',18,1),(36,'2017-08-09 02:59:40.989906','3','test@163.com',2,'[]',18,1),(37,'2017-08-09 03:38:22.508074','3','test@163.com',2,'[]',18,1),(38,'2017-08-09 09:34:17.160242','3','test@163.com',2,'[]',18,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(22,'teacher','teachertest'),(18,'web','account'),(19,'web','branch'),(15,'web','classlist'),(20,'web','contract'),(17,'web','course'),(9,'web','courserecord'),(7,'web','customer'),(12,'web','customerfollowup'),(13,'web','enrollment'),(10,'web','menu'),(8,'web','paymentrecord'),(6,'web','role'),(11,'web','source'),(16,'web','studyrecord'),(21,'web','submenu'),(14,'web','tag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'web','0001_initial','2017-07-09 09:41:16.958468'),(2,'contenttypes','0001_initial','2017-07-09 09:41:17.005573'),(3,'admin','0001_initial','2017-07-09 09:41:17.200306'),(4,'admin','0002_logentry_remove_auto_add','2017-07-09 09:41:17.222340'),(5,'contenttypes','0002_remove_content_type_name','2017-07-09 09:41:17.334664'),(6,'auth','0001_initial','2017-07-09 09:41:17.701627'),(7,'auth','0002_alter_permission_name_max_length','2017-07-09 09:41:17.763780'),(8,'auth','0003_alter_user_email_max_length','2017-07-09 09:41:17.774808'),(9,'auth','0004_alter_user_username_opts','2017-07-09 09:41:17.787843'),(10,'auth','0005_alter_user_last_login_null','2017-07-09 09:41:17.799876'),(11,'auth','0006_require_contenttypes_0002','2017-07-09 09:41:17.803904'),(12,'auth','0007_alter_validators_add_error_messages','2017-07-09 09:41:17.814914'),(13,'auth','0008_alter_user_username_max_length','2017-07-09 09:41:17.825944'),(14,'sessions','0001_initial','2017-07-09 09:41:17.871645'),(15,'web','0002_auto_20170717_2041','2017-07-17 12:41:42.300298'),(16,'teacher','0001_initial','2017-07-18 11:45:10.508167'),(17,'web','0003_auto_20170718_1945','2017-07-18 11:45:10.608436'),(18,'web','0004_auto_20170808_1752','2017-08-08 09:52:20.658329'),(19,'web','0005_auto_20170808_1807','2017-08-08 10:07:17.480850'),(20,'web','0006_auto_20170809_1138','2017-08-09 03:38:11.415081');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1e5ezjelgr5cijgjf2xfw6zh00ptfe72','YTAyMmRjMDMyOTg0OWMzZGM3YjZmNGVkNWM0YmMzMGRmNjY5NTQ3Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-21 01:31:14.588753'),('5bmdblkt689de956ub0cjyn9poq8phbd','YTAyMmRjMDMyOTg0OWMzZGM3YjZmNGVkNWM0YmMzMGRmNjY5NTQ3Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-21 01:38:31.676663'),('dt3ao2olpp2fndm7ib7gydfnqpikek0g','ODk1ZDY3OTIwOWJjNGVjY2UyOTk4YzdlYjZmYmY2ODRhZWU4NzAzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzBiZTk0MjkxYzQwODQ3MGRhZGJjMTg2Yzk1NDEzOWZiN2Q2MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-31 02:37:44.031156'),('fth9bfgxkh6ah7nvbg2p0aonbgmsmxqa','MDliNzc4ZTA0MzI0ZjJjYTdhNDM3ZDg0MmFlZWFjOWNkODVkZmQxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-24 00:57:33.385982'),('g2no93wst6rzerl9j9jb8px4m06tjand','ZGZhOWUxMzA0YjAxMzdmMTZiY2NkNGExODUxNGE1MzRiMThlMzlmYTp7Il9hdXRoX3VzZXJfaGFzaCI6IjUxNzdmZmVmMGE1NGZhOThmZWFlYTExOGY5ZDRiYWE0NzRhOWQ1NGMiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-08-23 03:39:11.732975'),('kcn86oy9mfhv2qov7ml64vyaz3j9a2pg','ODk1ZDY3OTIwOWJjNGVjY2UyOTk4YzdlYjZmYmY2ODRhZWU4NzAzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzBiZTk0MjkxYzQwODQ3MGRhZGJjMTg2Yzk1NDEzOWZiN2Q2MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-08-14 09:09:24.841316'),('l9jvrsqinbko82wncg7tt34kxt9d11l9','ODk1ZDY3OTIwOWJjNGVjY2UyOTk4YzdlYjZmYmY2ODRhZWU4NzAzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzBiZTk0MjkxYzQwODQ3MGRhZGJjMTg2Yzk1NDEzOWZiN2Q2MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-31 02:59:01.186528'),('lpuazth106y43ul9tfej5jqard82v6qg','YTAyMmRjMDMyOTg0OWMzZGM3YjZmNGVkNWM0YmMzMGRmNjY5NTQ3Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-21 01:42:00.391529'),('mnm1iexsdfk1rybjjsw95l7rft0xsc4g','ODk1ZDY3OTIwOWJjNGVjY2UyOTk4YzdlYjZmYmY2ODRhZWU4NzAzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzBiZTk0MjkxYzQwODQ3MGRhZGJjMTg2Yzk1NDEzOWZiN2Q2MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-08-23 03:37:41.473866'),('ordr4ro7scl37iz53hf3ctmgw8pchefu','ODk1ZDY3OTIwOWJjNGVjY2UyOTk4YzdlYjZmYmY2ODRhZWU4NzAzZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjU1NzBiZTk0MjkxYzQwODQ3MGRhZGJjMTg2Yzk1NDEzOWZiN2Q2MDYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-31 02:35:18.267670'),('pywhmmnqf7r8l75fle6s0afsgh9dx0fv','MDliNzc4ZTA0MzI0ZjJjYTdhNDM3ZDg0MmFlZWFjOWNkODVkZmQxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-16 11:48:03.782404'),('qygz2s8cnodxscfsxxfqm4yv9stc4t5x','MDliNzc4ZTA0MzI0ZjJjYTdhNDM3ZDg0MmFlZWFjOWNkODVkZmQxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-16 10:19:04.432712'),('rlw03xh0bnq4wvgg48u3j2nfbwxo64xk','YTAyMmRjMDMyOTg0OWMzZGM3YjZmNGVkNWM0YmMzMGRmNjY5NTQ3Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-07-26 09:58:42.084054'),('rw68sowpgcsqoo8r5ic5p9ny00bn0549','MDliNzc4ZTA0MzI0ZjJjYTdhNDM3ZDg0MmFlZWFjOWNkODVkZmQxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-08-01 11:42:45.157619'),('wsh0yey4pdoveh01c2el7d7jkl7bpepg','MDliNzc4ZTA0MzI0ZjJjYTdhNDM3ZDg0MmFlZWFjOWNkODVkZmQxNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTcwYmU5NDI5MWM0MDg0NzBkYWRiYzE4NmM5NTQxMzlmYjdkNjA2In0=','2017-07-29 01:13:07.693070'),('zrrl4w0t52kzprs2bi38tvm5wb2mqa6v','ZDQ5MmUzNzBhZDUzOGQ1NmNlOGFkOGJiMDYxNTAzMGEzNTMzNWI4ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTU3MGJlOTQyOTFjNDA4NDcwZGFkYmMxODZjOTU0MTM5ZmI3ZDYwNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2017-07-24 09:21:00.125005');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teachertest`
--

DROP TABLE IF EXISTS `teacher_teachertest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_teachertest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teachertest`
--

LOCK TABLES `teacher_teachertest` WRITE;
/*!40000 ALTER TABLE `teacher_teachertest` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teachertest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_account`
--

DROP TABLE IF EXISTS `web_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(32) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `customer_id` (`customer_id`),
  KEY `web_account_role_id_94950020_fk_web_role_id` (`role_id`),
  CONSTRAINT `web_account_customer_id_12142646_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`),
  CONSTRAINT `web_account_role_id_94950020_fk_web_role_id` FOREIGN KEY (`role_id`) REFERENCES `web_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_account`
--

LOCK TABLES `web_account` WRITE;
/*!40000 ALTER TABLE `web_account` DISABLE KEYS */;
INSERT INTO `web_account` VALUES (1,'pbkdf2_sha256$36000$u57bfL2NEg8o$UgF5WkiGCbaYyKfdgkc/mFCNiQ2znnYnyynAUVXewZI=','2017-08-10 00:57:33.377960','wangyufu@163.com','王宇夫',1,1,NULL,1,1,1),(3,'pbkdf2_sha256$36000$kmC3xeW3DEXA$deMhYWTN9DRXN/Efmdd1vWoS3PXIazck4/pzgJrmaDs=','2017-08-09 09:34:31.378915','test@163.com','哈哈',1,0,NULL,1,1,0);
/*!40000 ALTER TABLE `web_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_account_groups`
--

DROP TABLE IF EXISTS `web_account_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_account_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_account_groups_account_id_group_id_91f5b15a_uniq` (`account_id`,`group_id`),
  KEY `web_account_groups_group_id_19dcc5e0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `web_account_groups_account_id_25aad791_fk_web_account_id` FOREIGN KEY (`account_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_account_groups_group_id_19dcc5e0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_account_groups`
--

LOCK TABLES `web_account_groups` WRITE;
/*!40000 ALTER TABLE `web_account_groups` DISABLE KEYS */;
INSERT INTO `web_account_groups` VALUES (1,3,1);
/*!40000 ALTER TABLE `web_account_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_account_user_permissions`
--

DROP TABLE IF EXISTS `web_account_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_account_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_account_user_permiss_account_id_permission_id_83521202_uniq` (`account_id`,`permission_id`),
  KEY `web_account_user_per_permission_id_1f3b4c9a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `web_account_user_per_account_id_be9e2278_fk_web_accou` FOREIGN KEY (`account_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_account_user_per_permission_id_1f3b4c9a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_account_user_permissions`
--

LOCK TABLES `web_account_user_permissions` WRITE;
/*!40000 ALTER TABLE `web_account_user_permissions` DISABLE KEYS */;
INSERT INTO `web_account_user_permissions` VALUES (5,3,67),(2,3,68),(3,3,69),(4,3,70),(6,3,71);
/*!40000 ALTER TABLE `web_account_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_branch`
--

DROP TABLE IF EXISTS `web_branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_branch`
--

LOCK TABLES `web_branch` WRITE;
/*!40000 ALTER TABLE `web_branch` DISABLE KEYS */;
INSERT INTO `web_branch` VALUES (1,'北京');
/*!40000 ALTER TABLE `web_branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_classlist`
--

DROP TABLE IF EXISTS `web_classlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_classlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semester` int(11) NOT NULL,
  `class_type` smallint(6) NOT NULL,
  `max_student_num` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `branch_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_classlist_course_id_branch_id_seme_08446b22_uniq` (`course_id`,`branch_id`,`semester`,`class_type`),
  KEY `web_classlist_branch_id_ac8d89da_fk_web_branch_id` (`branch_id`),
  KEY `web_classlist_contract_id_9bdc2dd7_fk_web_contract_id` (`contract_id`),
  CONSTRAINT `web_classlist_branch_id_ac8d89da_fk_web_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `web_branch` (`id`),
  CONSTRAINT `web_classlist_contract_id_9bdc2dd7_fk_web_contract_id` FOREIGN KEY (`contract_id`) REFERENCES `web_contract` (`id`),
  CONSTRAINT `web_classlist_course_id_0d0bb3df_fk_web_course_id` FOREIGN KEY (`course_id`) REFERENCES `web_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_classlist`
--

LOCK TABLES `web_classlist` WRITE;
/*!40000 ALTER TABLE `web_classlist` DISABLE KEYS */;
INSERT INTO `web_classlist` VALUES (1,1,0,80,'2017-08-03',NULL,1,1,1);
/*!40000 ALTER TABLE `web_classlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_classlist_teachers`
--

DROP TABLE IF EXISTS `web_classlist_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_classlist_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classlist_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_classlist_teachers_classlist_id_account_id_52e8232a_uniq` (`classlist_id`,`account_id`),
  KEY `web_classlist_teachers_account_id_13bbfbd4_fk_web_account_id` (`account_id`),
  CONSTRAINT `web_classlist_teachers_account_id_13bbfbd4_fk_web_account_id` FOREIGN KEY (`account_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_classlist_teachers_classlist_id_bf54a2d6_fk_web_classlist_id` FOREIGN KEY (`classlist_id`) REFERENCES `web_classlist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_classlist_teachers`
--

LOCK TABLES `web_classlist_teachers` WRITE;
/*!40000 ALTER TABLE `web_classlist_teachers` DISABLE KEYS */;
INSERT INTO `web_classlist_teachers` VALUES (1,1,3);
/*!40000 ALTER TABLE `web_classlist_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_contract`
--

DROP TABLE IF EXISTS `web_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_contract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `content` longtext NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_contract`
--

LOCK TABLES `web_contract` WRITE;
/*!40000 ALTER TABLE `web_contract` DISABLE KEYS */;
INSERT INTO `web_contract` VALUES (1,'合同','123','2017-08-03');
/*!40000 ALTER TABLE `web_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_course`
--

DROP TABLE IF EXISTS `web_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `period` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `outline` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_course`
--

LOCK TABLES `web_course` WRITE;
/*!40000 ALTER TABLE `web_course` DISABLE KEYS */;
INSERT INTO `web_course` VALUES (1,'python',1,9999,'python'),(2,'go',4,5555,'go语言');
/*!40000 ALTER TABLE `web_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_courserecord`
--

DROP TABLE IF EXISTS `web_courserecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_courserecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_num` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `has_homework` tinyint(1) NOT NULL,
  `homework_title` varchar(128) DEFAULT NULL,
  `homework_requirement` longtext,
  `date` datetime(6) NOT NULL,
  `class_list_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_courserecord_class_list_id_day_num_16352a6b_uniq` (`class_list_id`,`day_num`),
  KEY `web_courserecord_teacher_id_3d847927_fk_web_account_id` (`teacher_id`),
  CONSTRAINT `web_courserecord_class_list_id_1027f7bb_fk_web_classlist_id` FOREIGN KEY (`class_list_id`) REFERENCES `web_classlist` (`id`),
  CONSTRAINT `web_courserecord_teacher_id_3d847927_fk_web_account_id` FOREIGN KEY (`teacher_id`) REFERENCES `web_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_courserecord`
--

LOCK TABLES `web_courserecord` WRITE;
/*!40000 ALTER TABLE `web_courserecord` DISABLE KEYS */;
INSERT INTO `web_courserecord` VALUES (1,1,'基础',1,NULL,'','2017-08-03 03:20:16.443481',1,3);
/*!40000 ALTER TABLE `web_courserecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customer`
--

DROP TABLE IF EXISTS `web_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `qq` varchar(64) DEFAULT NULL,
  `weixin` varchar(64) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` smallint(6) NOT NULL,
  `date` datetime(6) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `referral_from_id` int(11) DEFAULT NULL,
  `source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qq` (`qq`),
  UNIQUE KEY `weixin` (`weixin`),
  UNIQUE KEY `phone` (`phone`),
  KEY `web_customer_consultant_id_e3c377b3_fk_web_account_id` (`consultant_id`),
  KEY `web_customer_referral_from_id_cba5a965_fk_web_account_id` (`referral_from_id`),
  KEY `web_customer_source_id_7cd489f8_fk_web_source_id` (`source_id`),
  CONSTRAINT `web_customer_consultant_id_e3c377b3_fk_web_account_id` FOREIGN KEY (`consultant_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_customer_referral_from_id_cba5a965_fk_web_account_id` FOREIGN KEY (`referral_from_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_customer_source_id_7cd489f8_fk_web_source_id` FOREIGN KEY (`source_id`) REFERENCES `web_source` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customer`
--

LOCK TABLES `web_customer` WRITE;
/*!40000 ALTER TABLE `web_customer` DISABLE KEYS */;
INSERT INTO `web_customer` VALUES (1,'王宇夫','123','123',123456,'aaa@123.com','不错',0,'2017-07-18 11:57:54.155179',1,NULL,2),(2,'测试1','380871254','15663435',123456688,'aaa@123.com','挺好a',0,'2017-07-18 13:12:20.763841',1,NULL,2),(3,'test2','1238437','1238437',15662030,'aaa@123.com','python',0,'2017-07-18 13:13:22.945777',3,NULL,2),(4,'test123',NULL,NULL,NULL,NULL,'啊啊啊',0,'2017-07-30 10:44:08.199046',1,NULL,1);
/*!40000 ALTER TABLE `web_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customer_consult_courses`
--

DROP TABLE IF EXISTS `web_customer_consult_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_customer_consult_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_customer_consult_courses_customer_id_course_id_0d19fae7_uniq` (`customer_id`,`course_id`),
  KEY `web_customer_consult_courses_course_id_96f82bc2_fk_web_course_id` (`course_id`),
  CONSTRAINT `web_customer_consult_courses_course_id_96f82bc2_fk_web_course_id` FOREIGN KEY (`course_id`) REFERENCES `web_course` (`id`),
  CONSTRAINT `web_customer_consult_customer_id_758cddc2_fk_web_custo` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customer_consult_courses`
--

LOCK TABLES `web_customer_consult_courses` WRITE;
/*!40000 ALTER TABLE `web_customer_consult_courses` DISABLE KEYS */;
INSERT INTO `web_customer_consult_courses` VALUES (1,1,1),(2,1,2),(7,2,2),(4,3,1),(12,3,2),(5,4,1);
/*!40000 ALTER TABLE `web_customer_consult_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customer_tags`
--

DROP TABLE IF EXISTS `web_customer_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_customer_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_customer_tags_customer_id_tag_id_516fbb68_uniq` (`customer_id`,`tag_id`),
  KEY `web_customer_tags_tag_id_2eabec80_fk_web_tag_id` (`tag_id`),
  CONSTRAINT `web_customer_tags_customer_id_e2835303_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`),
  CONSTRAINT `web_customer_tags_tag_id_2eabec80_fk_web_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `web_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customer_tags`
--

LOCK TABLES `web_customer_tags` WRITE;
/*!40000 ALTER TABLE `web_customer_tags` DISABLE KEYS */;
INSERT INTO `web_customer_tags` VALUES (1,2,1),(2,3,1);
/*!40000 ALTER TABLE `web_customer_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_customerfollowup`
--

DROP TABLE IF EXISTS `web_customerfollowup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_customerfollowup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_customerfollowup_consultant_id_b69d210f_fk_web_account_id` (`consultant_id`),
  KEY `web_customerfollowup_customer_id_5f49dd7f_fk_web_customer_id` (`customer_id`),
  CONSTRAINT `web_customerfollowup_consultant_id_b69d210f_fk_web_account_id` FOREIGN KEY (`consultant_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_customerfollowup_customer_id_5f49dd7f_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_customerfollowup`
--

LOCK TABLES `web_customerfollowup` WRITE;
/*!40000 ALTER TABLE `web_customerfollowup` DISABLE KEYS */;
INSERT INTO `web_customerfollowup` VALUES (1,'啊','2017-08-02 11:48:24.388384',5,1,1);
/*!40000 ALTER TABLE `web_customerfollowup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_enrollment`
--

DROP TABLE IF EXISTS `web_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `class_list_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_enrollment_account_id_b57e3cd0_fk_web_account_id` (`account_id`),
  KEY `web_enrollment_class_list_id_11fc766b_fk_web_classlist_id` (`class_list_id`),
  CONSTRAINT `web_enrollment_account_id_b57e3cd0_fk_web_account_id` FOREIGN KEY (`account_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_enrollment_class_list_id_11fc766b_fk_web_classlist_id` FOREIGN KEY (`class_list_id`) REFERENCES `web_classlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_enrollment`
--

LOCK TABLES `web_enrollment` WRITE;
/*!40000 ALTER TABLE `web_enrollment` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_menu`
--

DROP TABLE IF EXISTS `web_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url_type` int(10) unsigned NOT NULL,
  `url` varchar(128) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_menu_url_url_type_d4ab4bc7_uniq` (`url`,`url_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_menu`
--

LOCK TABLES `web_menu` WRITE;
/*!40000 ALTER TABLE `web_menu` DISABLE KEYS */;
INSERT INTO `web_menu` VALUES (1,'客户管理',1,'customer_info',0),(2,'班级管理',1,'class_info',0),(3,'我的班级',1,'my_class_info',1);
/*!40000 ALTER TABLE `web_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_paymentrecord`
--

DROP TABLE IF EXISTS `web_paymentrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_paymentrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method` smallint(6) NOT NULL,
  `payment_type` smallint(6) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `class_list_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_paymentrecord_account_id_e368f500_fk_web_account_id` (`account_id`),
  KEY `web_paymentrecord_class_list_id_9f0826ec_fk_web_classlist_id` (`class_list_id`),
  KEY `web_paymentrecord_customer_id_da57a16c_fk_web_customer_id` (`customer_id`),
  CONSTRAINT `web_paymentrecord_account_id_e368f500_fk_web_account_id` FOREIGN KEY (`account_id`) REFERENCES `web_account` (`id`),
  CONSTRAINT `web_paymentrecord_class_list_id_9f0826ec_fk_web_classlist_id` FOREIGN KEY (`class_list_id`) REFERENCES `web_classlist` (`id`),
  CONSTRAINT `web_paymentrecord_customer_id_da57a16c_fk_web_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `web_customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_paymentrecord`
--

LOCK TABLES `web_paymentrecord` WRITE;
/*!40000 ALTER TABLE `web_paymentrecord` DISABLE KEYS */;
INSERT INTO `web_paymentrecord` VALUES (1,0,0,16000,'2017-08-03 03:57:03.019904',3,1,1);
/*!40000 ALTER TABLE `web_paymentrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_role`
--

DROP TABLE IF EXISTS `web_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_role`
--

LOCK TABLES `web_role` WRITE;
/*!40000 ALTER TABLE `web_role` DISABLE KEYS */;
INSERT INTO `web_role` VALUES (2,'老师'),(1,'销售');
/*!40000 ALTER TABLE `web_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_role_menus`
--

DROP TABLE IF EXISTS `web_role_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_role_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_role_menus_role_id_menu_id_8a09088a_uniq` (`role_id`,`menu_id`),
  KEY `web_role_menus_menu_id_13012263_fk_web_menu_id` (`menu_id`),
  CONSTRAINT `web_role_menus_menu_id_13012263_fk_web_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `web_menu` (`id`),
  CONSTRAINT `web_role_menus_role_id_93d24524_fk_web_role_id` FOREIGN KEY (`role_id`) REFERENCES `web_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_role_menus`
--

LOCK TABLES `web_role_menus` WRITE;
/*!40000 ALTER TABLE `web_role_menus` DISABLE KEYS */;
INSERT INTO `web_role_menus` VALUES (1,1,1),(2,1,2),(3,2,3);
/*!40000 ALTER TABLE `web_role_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_source`
--

DROP TABLE IF EXISTS `web_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_source`
--

LOCK TABLES `web_source` WRITE;
/*!40000 ALTER TABLE `web_source` DISABLE KEYS */;
INSERT INTO `web_source` VALUES (1,'python'),(2,'qq');
/*!40000 ALTER TABLE `web_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_studyrecord`
--

DROP TABLE IF EXISTS `web_studyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_studyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `show_status` smallint(6) NOT NULL,
  `comment` longtext,
  `date` datetime(6) NOT NULL,
  `course_record_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_studyrecord_student_id_course_record_id_75e1226e_uniq` (`student_id`,`course_record_id`),
  KEY `web_studyrecord_course_record_id_a3162b0f_fk_web_courserecord_id` (`course_record_id`),
  CONSTRAINT `web_studyrecord_course_record_id_a3162b0f_fk_web_courserecord_id` FOREIGN KEY (`course_record_id`) REFERENCES `web_courserecord` (`id`),
  CONSTRAINT `web_studyrecord_student_id_a81eb429_fk_web_account_id` FOREIGN KEY (`student_id`) REFERENCES `web_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_studyrecord`
--

LOCK TABLES `web_studyrecord` WRITE;
/*!40000 ALTER TABLE `web_studyrecord` DISABLE KEYS */;
INSERT INTO `web_studyrecord` VALUES (1,100,0,'完美','2017-08-03 03:20:29.153812',1,1);
/*!40000 ALTER TABLE `web_studyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_submenu`
--

DROP TABLE IF EXISTS `web_submenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url_type` int(10) unsigned NOT NULL,
  `url` varchar(128) NOT NULL,
  `order` smallint(6) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_submenu_url_url_type_7bf18635_uniq` (`url`,`url_type`),
  KEY `web_submenu_menu_id_c951e707_fk_web_menu_id` (`menu_id`),
  CONSTRAINT `web_submenu_menu_id_c951e707_fk_web_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `web_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_submenu`
--

LOCK TABLES `web_submenu` WRITE;
/*!40000 ALTER TABLE `web_submenu` DISABLE KEYS */;
INSERT INTO `web_submenu` VALUES (1,'客户信息',1,'customer_list',0,1),(2,'需要跟进用户',0,'/crm/need_followup',1,1);
/*!40000 ALTER TABLE `web_submenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_tag`
--

DROP TABLE IF EXISTS `web_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_tag`
--

LOCK TABLES `web_tag` WRITE;
/*!40000 ALTER TABLE `web_tag` DISABLE KEYS */;
INSERT INTO `web_tag` VALUES (1,'喜欢');
/*!40000 ALTER TABLE `web_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-01 13:01:47
