use spring_app_db ;

DROP TABLE IF EXISTS `bank`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` VALUES (1,'SBI'),(2,'HDFC'),(3,'CANARA'),(4,'AXIS'),(5,'ANDHRA'),(6,'PNB'),(7,'PB'),(8,'PCB');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `pin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1012,'siriseri',NULL,'TamilNadu','chennai','654987'),(1014,'siriseri',NULL,'TamilNadu','chennai','654987'),(1016,'akp','pka','up','psv','215605'),(1017,'siriseri',NULL,'TamilNadu','chennai','654987'),(1019,'siriseri',NULL,'TamilNadu','chennai','654987'),(1020,'siriseri',NULL,'TamilNadu','chennai','654987'),(1021,'siriseri',NULL,'TamilNadu','chennai','654987'),(1022,'gp',NULL,'mb','nhb','654'),(1023,'Hafeezpet',NULL,'TS','HYD','501078'),(1024,'Hafeezpet',NULL,'TS','HYD','501078'),(1025,'Hafeezpet',NULL,'TS','HYD','501078'),(1026,'Hafeezpet',NULL,'TS','HYD','501078'),(1027,'madhurawada',NULL,'ap','vsp','506512'),(1028,'MVP',NULL,'ap','vsp','500042'),(1029,'Nizampet','','TS','HYD','500045'),(1030,'Nizampet','','TS','HYD','500045'),(1031,'MVP',NULL,'ap','vsp','500042'),(1032,'Nizampet','','TS','HYD','500045'),(1033,'Hafeezpet',NULL,'TS','PMY','501078'),(1034,'Miyapur','','TS','HYD','500045'),(1035,'Nizampet','','TS','HYD','500045'),(1036,'Nizampet','','TS','HYD','500045');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `branch` (
  `branch_code` int(11) NOT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `branch_type` varchar(45) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`branch_code`),
  UNIQUE KEY `address_id_UNIQUE` (`address_id`),
  KEY `ref_address_rel_idx` (`address_id`),
  KEY `reference_bank_relation_idx` (`bank_id`),
  CONSTRAINT `ref_address_rel` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `reference_bank_relation` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (100002,'CorporateBranch','Urban',1012,2),(100003,'CorporateBranch','Urban',1014,5),(100004,'CorporateBranch','Urban',1017,4),(100008,'CorporateBranch','Urban',1021,3),(100010,'CorporateBranch','Urban',1022,2),(100012,'VIKAS','RURAL',1016,1),(100013,'NIVAS','URBAN',1029,2),(100014,'NIVAS','URBAN',1030,2),(100015,'NIVAS','URBAN',1032,2),(100016,'NIVASBranch','Rural',1033,3),(100017,'NIVAS','URBAN',1035,2);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `contact_number` int(11) NOT NULL,
  `aadhar_number` varchar(45) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `branch_code` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `reference_add_relation_idx` (`address_id`),
  KEY `ref_branch_rel_idx` (`branch_code`),
  CONSTRAINT `ref_branch_rel` FOREIGN KEY (`branch_code`) REFERENCES `branch` (`branch_code`),
  CONSTRAINT `reference_add_relation` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'abc','def','abc@gmail.com',98437,'8734y5',1020,100002),(2,'SRK','TANARI','SRK@gmail.com',874565,'65498132',1027,100010),(3,'kumar','saladi','ku,mar@gmail.com',9876465,'1234566',1023,100002),(4,'kumar','saladi','ku,mar@gmail.com',9876465,'1234566',1024,100002),(9,'KRS','IRANTAN','KRS@gmail.com',565478,'32189468',1028,100010),(10,'KRS','IRANTAN','KRS@gmail.com',565478,'32189468',1031,100010),(11,'abc','def','abc@gmail.com',98437,'8734y5',1034,100010),(12,'abc','def','abc@gmail.com',98437,'8734y5',1036,100010);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `account_id_UNIQUE` (`account_id`),
  KEY `acc_cust_rel_idx` (`customer_id`),
  CONSTRAINT `acc_cust_rel` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (101,'Savings',821.5,'Active','2015-05-05',NULL,1),(102,'Current',1389.75,'Active','2016-06-06',NULL,1),(103,'Savings',1600,'Active','2016-06-06',NULL,3),(104,'Current',3120,'Active','2019-04-02',NULL,4),(105,'SAVINGS',2000,'Active','2019-05-02',NULL,2),(106,'CURRENT',2000,'Active','2019-05-25',NULL,2),(107,'CURRENT',2880,'Active','2019-05-25','2019-06-25',10),(108,'SAVINGS',2000,'Active','2019-05-25',NULL,10);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `to_account` int(11) DEFAULT NULL,
  `transaction_amount` double DEFAULT NULL,
  `transaction_type` varchar(45) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `transaction_description` varchar(555) DEFAULT NULL,
  `merchant_id` varchar(45) DEFAULT NULL,
  `transaction_mode` varchar(10) DEFAULT NULL,
  `transaction_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `ref_account_rel_idx` (`account_id`),
  CONSTRAINT `ref_account_rel` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (0,107,0,500,'WITHDRAWL','2018-05-05','WithDrawl of amount 500.0is success and current balance is : 2880.0',NULL,'RTGS','Successful'),(111,101,103,25.21,'WITHDRAWL','2018-05-05',NULL,NULL,'RTGS','Success'),(112,101,103,250.54,'WITHDRAWL','2018-05-05','Amount withDrawl Successfully completed and current balance is - 711.25',NULL,'RTGS','Successful'),(113,104,103,250.54,'WITHDRAWL','2018-05-05','Amount withDrawl Successfully completed and current balance is - 4749.46',NULL,'RTGS','Successful'),(114,103,0,160.25,'WITHDRAWL','2018-05-05','Amount withDrawl Successfully completed and current balance is - 1339.75',NULL,'RTGS','Successful'),(115,103,0,250.25,'DEPOSIT','2018-05-05','Amount deposit Successfully completed and current balance is - 1590.0',NULL,'RTGS','Successful'),(116,104,0,250.54,'DEPOSIT','2018-05-05','Amount deposit Successfully completed and current balance is - 5000.0',NULL,'RTGS','Successful'),(117,104,103,10,'TRANSFER','2018-05-05','Transaction with ACC_ID: 103had successfully completed and current balance is :4990.0',NULL,'RTGS','Successful'),(118,102,101,110.25,'TRANSFER','2018-05-05','Transaction with ACC_ID: 101 had successfully completed and current balance is :1389.75',NULL,'RTGS','Successful'),(119,107,0,500,'WITHDRAWL','2018-05-05','WithDrawl of amount 500.0is success and current balance is : 1500.0',NULL,'RTGS','Successful'),(120,107,104,100,'TRANSFER','2018-05-05','Transaction with ACC_ID: 104 had successfully completed and current balance is :1400.0',NULL,'RTGS','Successful'),(121,104,107,1980,'TRANSFER','2018-05-05','Transaction with ACC_ID: 107 had successfully completed and current balance is :3120.0',NULL,'RTGS','Successful');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;