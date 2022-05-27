-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: restaunrantdb
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.4-MariaDB

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
-- Table structure for table `producto`
--
DROP DATABASE IF EXISTS restaunrantdb;
CREATE DATABASE restaunrantdb;

USE restaunrantdb;

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `descripcion` varchar(150) NOT NULL,
    `tipo_producto` int(2) NOT NULL,
    `precio` double NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Solomillo al Whisky',2,4.5),(2,'Secreto Ibérico',2,5),(3,'Pincho de Tortilla',1,2),(4,'Ensaladilla Rusa',1,2),(5,'Frito Variado',3,5),(6,'Tarta de Queso',4,3.5),(7,'Cerveza',0,1.2),(8,'Combinados',0,5),(9,'Copa de Vino',0,1.5),(10,'Lagartitos',2,4.5),(11,'Presa con Jamón',2,5.5),(12,'Dorada al Horno',3,3.5),(13,'Merluza a la Marinera',3,4.2),(20,'Ensaladilla de Marisco',1,2),(21,'Croquetas',1,1.5),(22,'Pincho de Pollo',1,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codigo_empleado` varchar(5) DEFAULT NULL,
  `tipo_empleado` int(1) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'CC1',0,'Luis','Lopez'),(2,'CC2',1,'Antonio ','Salas');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'CC1','José Antonio','Martín','jmartin@gmail.com',NULL),(2,'CC2','Pepe Manuel ','López','','958745784');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_comanda`
--

DROP TABLE IF EXISTS `linea_comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_comanda` (
  `id_comanda` int(10) NOT NULL,
  `id_producto` int(10) NOT NULL,
  `cantidad_pedida` int(10) NOT NULL,
  `candidad_servida` int(10) NOT NULL DEFAULT 0,
  KEY `linea_comanda_fk1` (`id_comanda`),
  KEY `linea_comanda_fk2` (`id_producto`),
  CONSTRAINT `linea_comanda_fk1` FOREIGN KEY (`id_comanda`) REFERENCES `comanda` (`id`),
  CONSTRAINT `linea_comanda_fk2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_comanda`
--

LOCK TABLES `linea_comanda` WRITE;
/*!40000 ALTER TABLE `linea_comanda` DISABLE KEYS */;
INSERT INTO `linea_comanda` VALUES (1,1,7,7),(1,3,1,1),(1,5,1,1),(2,1,5,0),(2,2,2,0),(4,2,7,0),(4,4,2,0),(4,8,2,0),(4,5,3,0),(5,21,2,0),(5,10,6,0);
/*!40000 ALTER TABLE `linea_comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `identificador` varchar(50) NOT NULL,
  `id_mesa` int(10) NOT NULL,
  `id_cliente` int(10) NOT NULL,
  `id_tramo_horario` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_cliente_fk` (`id_cliente`),
  KEY `reserva_tramo_fk` (`id_mesa`),
  CONSTRAINT `reserva_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  CONSTRAINT `reserva_mesa_fk` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id`),
  CONSTRAINT `reserva_tramo_fk` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramo_horario`
--

DROP TABLE IF EXISTS `tramo_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tramo_horario` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `dia_semana` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramo_horario`
--

LOCK TABLES `tramo_horario` WRITE;
/*!40000 ALTER TABLE `tramo_horario` DISABLE KEYS */;
INSERT INTO `tramo_horario` VALUES (1,'20:00:00','21:00:00','L'),(2,'21:00:00','22:00:00','L'),(3,'22:00:00','23:00:00','L'),(4,'20:00:00','21:00:00','M'),(5,'21:00:00','22:00:00','M'),(6,'22:00:00','23:00:00','M');
/*!40000 ALTER TABLE `tramo_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesa` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `num_mesa` int(10) DEFAULT NULL,
    `esta_ocupada` tinyint(4) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,1,0),(2,2,0),(3,3,0),(4,4,0),(5,5,0),(6,6,0),(7,7,0),(8,8,0);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comanda` (
    `id` int(10) NOT NULL AUTO_INCREMENT,
    `codigo_comanda` varchar(10) NOT NULL,
    `id_empleado` int(10) NOT NULL,
    `id_mesa` int(10) NOT NULL,
    `historico` int(1) DEFAULT 0,
    PRIMARY KEY (`id`),
    KEY `comanda_fk1` (`id_empleado`),
    KEY `comanda_fk2` (`id_mesa`),
    CONSTRAINT `comanda_fk1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`),
    CONSTRAINT `comanda_fk2` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'C_1',1,1,1),(2,'C_2',1,2,0),(3,'C_3',1,1,0),(4,'C_5',2,5,0),(5,'C_8',2,8,0);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-20 14:16:30