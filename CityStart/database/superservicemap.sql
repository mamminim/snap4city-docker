CREATE SCHEMA `SuperServiceMap` DEFAULT CHARACTER SET utf8;
GRANT ALL ON SuperServiceMap.* TO 'user'@'%';

USE SuperServiceMap;

-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 192.168.1.121    Database: SuperServiceMap
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0+deb9u1

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `serviceUri` varchar(150) NOT NULL,
  `idServiceMap` varchar(45) NOT NULL,
  `insertTime` varchar(45) NOT NULL,
  `lastAccessTime` varchar(45) NOT NULL,
  `temporary` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`serviceUri`,`idServiceMap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `graph`
--

DROP TABLE IF EXISTS `graph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(100) NOT NULL,
  `boundingBox` varchar(1000) DEFAULT NULL,
  `municipalities` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idUri_UNIQUE` (`id`),
  UNIQUE KEY `uri_UNIQUE` (`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graph`
--

LOCK TABLES `graph` WRITE;
/*!40000 ALTER TABLE `graph` DISABLE KEYS */;
/*!40000 ALTER TABLE `graph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemapgraph`
--

DROP TABLE IF EXISTS `servicemapgraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicemapgraph` (
  `idServiceMapUri` int(11) NOT NULL AUTO_INCREMENT,
  `serviceMap` varchar(45) NOT NULL,
  `graph` int(11) NOT NULL,
  PRIMARY KEY (`idServiceMapUri`),
  KEY `serviceMap_idx` (`serviceMap`),
  KEY `uri_idx` (`graph`),
  CONSTRAINT `serviceMap` FOREIGN KEY (`serviceMap`) REFERENCES `servicemaps` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uri` FOREIGN KEY (`graph`) REFERENCES `graph` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemapgraph`
--

LOCK TABLES `servicemapgraph` WRITE;
/*!40000 ALTER TABLE `servicemapgraph` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicemapgraph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemaps`
--

DROP TABLE IF EXISTS `servicemaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicemaps` (
  `id` varchar(45) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `competenceArea` text NOT NULL,
  `urlPrefix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemaps`
--

LOCK TABLES `servicemaps` WRITE;
/*!40000 ALTER TABLE `servicemaps` DISABLE KEYS */;
INSERT INTO `servicemaps` VALUES ('asm-200','192.168.0.200','POLYGON((9.811827111885577 44.12897032284091,9.630552697823077 44.40040051115729,9.949156213448077 44.54934859918097,10.542417932198077 44.25107226561579,11.108213830635577 44.10530847218031,11.415831018135577 44.3100630365027,11.899229455635577 44.08558302537316,11.684996057198077 44.00266429933336,12.064024377510577 43.765114203668695,12.316709924385577 43.80477166514793,12.355162072823077 43.65790765345753,12.091490197823077 43.42297421413886,12.228819299385577 43.303165501901525,11.915708947823077 43.114989558248126,11.976133752510577 42.85781672211206,11.641050744698077 42.437617236765774,11.426817346260577 42.35648431495071,10.959898400948077 42.173551809038706,9.855772424385577 42.324001777744655,9.658018518135577 43.5226340483339,9.811827111885577 44.12897032284091))','https://servicemap.km4city.org/WebAppGrafo'),('sm-201','192.168.0.201','MULTIPOLYGON(((4.2252 51.1898,4.1730 51.2964,4.2431 51.3521,4.2239 51.37448,4.34063 51.37534,4.34200 51.3590,4.3941 51.3573,4.4271 51.3796,4.6207 51.3007,4.4518 51.1109,4.2252 51.1898)),((24.9085 60.1435,24.8604 60.1440,24.8484 60.1577,24.8549 60.172600,24.88722 60.1693,24.9119 60.17823,24.9019 60.1843,24.9006 60.1964,24.95031 60.2005,25.00601 60.18779,24.99811 60.17191,24.9768 60.1492,24.94151 60.14466,24.9085 60.1435)))','https://www.snap4city.org/ServiceMap'),('sm-202','192.168.0.202','MULTIPOLYGON(((7.841292003535273 41.235158734821894,9.511213878535273 41.342474337544395,10.137434581660273 40.46229799081978,9.862776378535273 39.298907437551605,9.533186534785273 38.889632976620554,8.214827159785273 38.74411247174105,7.841292003535273 41.235158734821894)),((9.668366207993472 44.37793861282335,9.195954098618472 44.63649407658046,9.311310543930972 45.123039213040855,10.338532223618472 45.01441069457593,11.579987301743472 44.909466247310654,11.225105357514735 45.02470461323002,10.642829966889735 45.353772528524935,10.609870982514735 45.627182840764256,10.851570201264735 45.830412773152894,10.950447154389735 45.703960251043,11.214119029389735 45.81127172599984,11.340461802827235 46.044342962172884,11.911750865327235 46.13958105870905,11.670051646577235 46.45080784606746,12.098518443452235 46.688719871893646,12.456312041769024 46.688719871893646,12.791395049581524 46.63971236245317,12.560682158956524 46.477294052805604,12.401380401144024 46.219453973518505,12.445325713644024 45.96803406835529,12.648572783956524 45.81510046186579,13.027601104269024 45.883972698049696,13.109998565206524 45.64638706541541,12.450818877706524 45.373070219035235,12.654065948019024 44.849721968978805,12.758436065206524 44.0221366928713,12.714490752706524 43.85204439870854,12.527723174581524 43.89164416406159,12.511243682394024 43.99448040657098,12.390394073019024 43.962857432470614,12.362928252706524 43.88768537157976,12.236585479269024 43.748961875242735,11.912488799581524 43.78863004708257,11.681775908956524 43.962857432470614,11.747693877706524 44.12080387230808,11.418104033956524 44.22324323642567,11.253309112081524 44.089248271716244,10.951185088644024 44.13657535580992,10.671033721456524 44.156283788051766,10.423841338644024 44.235051712954565,9.978895049581524 44.38834631231674,9.978895049581524 44.45896261381225,9.797620635519024 44.46680360404309,9.668366207993472 44.37793861282335)),((-8.6320116 42.8241442,-8.6320116 42.989631,-8.3896425 42.989631,-8.3896425 42.8241442,-8.6320116 42.8241442)))','https://www.disit.org/smosm'),('sm-local','192.168.1.121','POLYGON((9.811827111885577 44.12897032284091,9.630552697823077 44.40040051115729,9.949156213448077 44.54934859918097,10.542417932198077 44.25107226561579,11.108213830635577 44.10530847218031,11.415831018135577 44.3100630365027,11.899229455635577 44.08558302537316,11.684996057198077 44.00266429933336,12.064024377510577 43.765114203668695,12.316709924385577 43.80477166514793,12.355162072823077 43.65790765345753,12.091490197823077 43.42297421413886,12.228819299385577 43.303165501901525,11.915708947823077 43.114989558248126,11.976133752510577 42.85781672211206,11.641050744698077 42.437617236765774,11.426817346260577 42.35648431495071,10.959898400948077 42.173551809038706,9.855772424385577 42.324001777744655,9.658018518135577 43.5226340483339,9.811827111885577 44.12897032284091))','http://localhost/ServiceMap');
/*!40000 ALTER TABLE `servicemaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicemaps_priority`
--

DROP TABLE IF EXISTS `servicemaps_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicemaps_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicemaps_id` varchar(45) DEFAULT NULL,
  `api` varchar(45) DEFAULT NULL,
  `format` varchar(45) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicemaps_priority`
--

LOCK TABLES `servicemaps_priority` WRITE;
/*!40000 ALTER TABLE `servicemaps_priority` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicemaps_priority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-31 11:17:55
