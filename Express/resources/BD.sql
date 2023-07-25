-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: pastrycook_bd
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `dificultadreceta`
--

DROP TABLE IF EXISTS `dificultadreceta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dificultadreceta` (
  `id_D` int NOT NULL AUTO_INCREMENT,
  `tipoDificultad` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_D`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dificultadreceta`
--

LOCK TABLES `dificultadreceta` WRITE;
/*!40000 ALTER TABLE `dificultadreceta` DISABLE KEYS */;
INSERT INTO `dificultadreceta` VALUES (1,'Normal'),(2,'Media'),(3,'Difícil'),(4,'Avanzada');
/*!40000 ALTER TABLE `dificultadreceta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoritos` (
  `id_R` int NOT NULL,
  `id_U` int NOT NULL,
  PRIMARY KEY (`id_R`,`id_U`),
  UNIQUE KEY `id_R` (`id_R`,`id_U`),
  KEY `favoritos_ibfk_2` (`id_U`),
  CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_R`) REFERENCES `recetas` (`id_R`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_U`) REFERENCES `usuarios` (`id_U`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoritos`
--

LOCK TABLES `favoritos` WRITE;
/*!40000 ALTER TABLE `favoritos` DISABLE KEYS */;
INSERT INTO `favoritos` VALUES (3,1),(7,1),(4,10),(7,10),(14,11),(3,24);
/*!40000 ALTER TABLE `favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganancias_pastrycook`
--

DROP TABLE IF EXISTS `ganancias_pastrycook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganancias_pastrycook` (
  `año` int NOT NULL,
  `mes` int NOT NULL,
  `ganancias` double DEFAULT NULL,
  PRIMARY KEY (`año`,`mes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganancias_pastrycook`
--

LOCK TABLES `ganancias_pastrycook` WRITE;
/*!40000 ALTER TABLE `ganancias_pastrycook` DISABLE KEYS */;
INSERT INTO `ganancias_pastrycook` VALUES (2023,7,0);
/*!40000 ALTER TABLE `ganancias_pastrycook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id_plan` int NOT NULL AUTO_INCREMENT,
  `tipo_plan` varchar(50) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `costo` double DEFAULT NULL,
  `descount` double DEFAULT NULL,
  PRIMARY KEY (`id_plan`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'GRATIS','Sin subscripción',0,0),(2,'1 MES','Subscripción por 30 días',5.99,0),(3,'6 MESES','Subscriçión por 182 días',35.94,0),(4,'1 AÑO','Subscriçión por 365 días',71.88,0);
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_recetas`
--

DROP TABLE IF EXISTS `planes_recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_recetas` (
  `id_tipoPlan` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(8) NOT NULL,
  PRIMARY KEY (`id_tipoPlan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_recetas`
--

LOCK TABLES `planes_recetas` WRITE;
/*!40000 ALTER TABLE `planes_recetas` DISABLE KEYS */;
INSERT INTO `planes_recetas` VALUES (1,'Gratis'),(2,'Premium');
/*!40000 ALTER TABLE `planes_recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes_usuarios`
--

DROP TABLE IF EXISTS `planes_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes_usuarios` (
  `id_U` int NOT NULL,
  `id_plan` int NOT NULL,
  PRIMARY KEY (`id_U`,`id_plan`),
  KEY `fk_id_plan` (`id_plan`),
  CONSTRAINT `fk_id_plan` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id_plan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_id_U` FOREIGN KEY (`id_U`) REFERENCES `usuarios` (`id_U`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes_usuarios`
--

LOCK TABLES `planes_usuarios` WRITE;
/*!40000 ALTER TABLE `planes_usuarios` DISABLE KEYS */;
INSERT INTO `planes_usuarios` VALUES (1,1),(2,1),(24,1),(26,1),(27,1),(11,2);
/*!40000 ALTER TABLE `planes_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `id_R` int NOT NULL AUTO_INCREMENT,
  `id_U` int NOT NULL,
  `titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ingredientes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `descripción` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imagen` text,
  `id_P` int NOT NULL,
  `id_D` int NOT NULL,
  `fecha` date NOT NULL,
  `id_tipoPlan` int NOT NULL,
  `reating` double NOT NULL,
  PRIMARY KEY (`id_R`),
  KEY `frk_id_tipoPlan_idx` (`id_tipoPlan`),
  KEY `fk_idU` (`id_U`),
  KEY `fk_idP` (`id_P`),
  KEY `fk_idD` (`id_D`),
  CONSTRAINT `fk_idD` FOREIGN KEY (`id_D`) REFERENCES `dificultadreceta` (`id_D`),
  CONSTRAINT `fk_idP` FOREIGN KEY (`id_P`) REFERENCES `tipospostre` (`id_P`),
  CONSTRAINT `fk_idPlan` FOREIGN KEY (`id_tipoPlan`) REFERENCES `planes_recetas` (`id_tipoPlan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idU` FOREIGN KEY (`id_U`) REFERENCES `usuarios` (`id_U`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
INSERT INTO `recetas` VALUES (3,2,'Batido de Fresa','1 Lata Leche Evaporada CARNATION® CLAVEL®\r\n1 Taza Fresa limpias\r\n2 Cucharaditas Esencia de vainilla\r\n1/2 Lata Leche Condensada LA LECHERA®','Licúa las fresas con la Leche Evaporada CARNATION® CLAVEL® y Leche Condensada LA LECHERA®. Sirve con hielos.','../img/imgRecetas/dear/',3,1,'2022-12-10',1,0),(4,2,'Galletas de Mantequilla','2 huevos\r\n2 1/2 tazas de harina, (350 g)\r\n1 cucharadita de vainilla líquida\r\n1 cucharadita de polvo para hornear\r\n100 gramos de mantequilla\r\n1 taza de azúcar, (200 g)','Para empezar con la preparación de las galletas caseras de mantequilla coge un recipiente y mezcla la mantequilla con el azúcar. Este proceso lo puedes hacer a mano con una espátula, verás como la mantequilla se va aclarando, formando una masa muy cremosa.\r\n\r\nEl siguiente paso es añadir los huevos y la vainilla. Continua removiendo con la espátula hasta conseguir que estos se integren por completo. Si se te hace muy complicado amasar las galletas de mantequilla a mano puedes usar una varillas eléctricas, pero no deberías tener problemas.\r\n\r\nDeja el bowl con la masa a un lado y a parte, cierne la harina junto con el polvo de hornear. Este paso es muy importante porque esto es lo que nos asegurará que no queden grumos y obtengamos una masa suave y homogénea.\r\n\r\nVe añadiendo poco a poco la harina en la preparación y revuelve hasta que se integre todo por completo. El siguiente paso será envolverla en papel transparente y guardarla en la nevera durante una media hora aproximadamente. Lo ideal es formar una bola o varias pequeñas.\r\n\r\nPasado este tiempo, ya podrás sacar la masa de la nevera. Para trabajar, esparce un poco de harina sobre una superficie plana y extiéndela con ayuda de un rodillo. Haz las galletas del grosor que quieras y córtalas con ayuda de un corta pastas con la forma que más te guste o con un vaso para hacer galletas de mantequilla redondas. Ve precalentando el horno a 180ºC.\r\n\r\nColoca las galletas sobre una bandeja de horno forrada con papel vegetal y hornéalas durante 15 minutos, o hasta que estén doradas. Las galletas de mantequilla se hacen muy rápido, por lo que deberás vigilar el horno por si requieren de menos tiempo. Si tu horno tiene la opción, coloca calor arriba y abajo.\r\n\r\nCuando estén listas, saca la bandeja del horno. Notarás que las galletas están un poco blandas, no te preocupes porque es normal. Lo mejor es dejarlas enfriar sobre una rejilla, ya verás en cuanto se enfrían se tornan crujientes. Eso si, ten cuidado de no quemarte, así que usa siempre una espátula para sacar las galletas recién hechas de la bandeja.','../img/imgRecetas/dear/galletaM.jpg',2,3,'2022-12-10',2,0),(7,1,'Arroz con leche','(1200 ml.) 5 tazas de agua\r\n(0.5 g.) 1 raja de canela\r\n(2 g.) ½ cucharadita de ralladura de limón\r\n(147 g.) ¾ taza de arroz crudo\r\n(315 g.) 1 Lata de Leche Evaporada IDEAL®\r\n(395 g.) 1 Lata Leche Condensada LA LECHERA®\r\n(165 g.) 1 taza de pasitas\r\nCanela en Polvo De La Huerta MAGGI® para decorar','\r\n1.  En una cacerola a fuego alto, colocar el agua, la canela, la ralladura de limón y cocinar hasta que hierva. Añadir el arroz, bajar el fuego y cocinar por 15 minutos o hasta que el arroz esté suave.\r\n\r\n2.  Verter la Leche Evaporada IDEAL® 0% Grasa, la Leche Condensada LA LECHERA® y cocinar por 5 minutos revolviendo constantemente.\r\n\r\n3.  Retirar la raja de canela, agregar las pasitas y cocinar 5 minutos más revolviendo constantemente.\r\n\r\n4.  Apagar el fuego y dejar reposar a temperatura ambiente por 10 minutos.\r\n\r\n5.  Porcionar en vasitos individuales y dejar reposar a temperatura ambiente o refrigerar.\r\n\r\n6.  Servir y disfrutar.','../img/imgRecetas/dear/arrozConLeche.jfif',8,1,'2022-12-01',1,0),(12,10,'Cheescake de fresa','(220 g.) 1 taza de galletas María molidas\r\n(80 g.) 4 cucharadas de mantequilla derretida\r\n(454 g.) 2 barras de queso crema a temperatura ambiente\r\n(395 g.) 1 lata de Leche Condensada LA LECHERA®\r\n(100 g.) 2 huevos\r\n(227 g.) 1 ½ taza de fresas cortadas a la mitad\r\n(100 g.) 1/2 taza de azúcar\r\n(30 ml.) 2 cucharadas de ron','\r\n1.  Precalentar el horno a 200° C.\r\n\r\n2.  En un tazón, mezclar las galletas María molidas con la mantequilla. Verter la mezcla un molde desmontable y presionar para que se adhiera al fondo. Refrigerar.\r\n\r\n3.  En otro tazón, batir el queso crema y la Leche Condensada LA LECHERA® hasta que esté sin grumos. Agregar los huevos y batir hasta tener una mezcla uniforme.\r\n\r\n4.  Verter la mezcla del queso en el molde con la corteza de galleta y hornear en baño María a 175° C por 45 minutos.\r\n\r\n5.  Retirar el molde del horno y dejar enfriar a temperatura ambiente.\r\n\r\n6.  En una cacerola a fuego bajo, colocar las fresas, el azúcar, el ron y cocinar hasta que se forme un sirope.\r\n\r\n7.  Desmontar el dulce del molde, cubrir con el sirope de fresas. Servir y disfrutar.','../img/imgRecetas/Psiclon/cheescake.jfif',8,3,'2022-12-01',1,0),(13,1,'Pay de Queso','- 1 taza de frambuesas\r\n- 1/4 de taza de agua\r\n- 2 cucharadas de azúcar\r\n- 1 cucharadita de jugo de limón\r\n- 60 galletas dulces, trituradas\r\n- 1 1/2 barras de mantequilla fundida\r\n- 1 cucharada de grenetina\r\n- 1/3 de taza de agua fría\r\n- 500 g de queso crema\r\n- 1 1/2 tazas de azúcar\r\n- 2 huevos\r\n- 1 cucharadita de esencia de vainilla\r\n- 1 1/2 tazas de crema\r\n- 1 taza de pulpa de guanábana\r\n- 1/2 taza de frambuesas','1. Licua todos los ingredientes de la salsa hasta obtener una mezcla ligeramente espesa. Reserva.\r\n\r\n2. Mezcla los ingredientes de la base hasta formar una pasta grumosa. Cubre con ella la base de un molde para tarta, hornéala por 10 minutos a 180 ºC. Reserva.\r\n\r\n3. Hidrata la grenetina en 1/3 de taza de agua, reposa dos minutos y funde a baño María. Reserva.\r\n\r\n4. Bate el queso con el azúcar hasta que suavice. Incorpora los huevos uno a uno y añade el extracto de vainilla, la crema y la pulpa de guanábana.\r\n\r\n5. Vierte la mezcla sobre la base de galletas. Hornea a 100 ºC por 1.5 horas o hasta que al introducir un palillo, salga limpio. Sácalo del horno, permite que enfríe, refrigera por tres horas.\r\n\r\n6.Retira el cheesecake del refrigerador, cubre la superficie con la salsa y decora con frambuesas.','../img/imgRecetas/dear/pay.jpg',4,2,'2022-12-10',2,0),(14,1,'Batido de Limon','xd','xd2','../img/imgRecetas/dear/pastelcafe.jpg',3,1,'2022-12-12',1,0),(15,11,'Pay de Nance','- Nance','- Hervir agua','../img/imgRecetas/dear/BokuNoHero (1).jpeg',4,2,'2023-06-27',1,0),(19,26,'Pay de Queso','Queso','Rayar','',4,2,'2023-07-24',1,0),(20,26,'Pay de Queso','Queso','Rayar','',4,2,'2023-07-24',1,0);
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `id_tipoPago` int NOT NULL AUTO_INCREMENT,
  `nombre_tipoPago` varchar(15) NOT NULL,
  PRIMARY KEY (`id_tipoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'PayPal');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipospostre`
--

DROP TABLE IF EXISTS `tipospostre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipospostre` (
  `id_P` int NOT NULL AUTO_INCREMENT,
  `postre` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id_P`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipospostre`
--

LOCK TABLES `tipospostre` WRITE;
/*!40000 ALTER TABLE `tipospostre` DISABLE KEYS */;
INSERT INTO `tipospostre` VALUES (1,'Pasteles'),(2,'Galletas'),(3,'Bebidas'),(4,'Pay'),(5,'Gelatinas'),(6,'Helados'),(7,'Cupcakes'),(8,'Postres Fríos'),(9,'Postres calientes');
/*!40000 ALTER TABLE `tipospostre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_U` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `contraseña` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `icono` text,
  `nombreCompleto` varchar(60) NOT NULL,
  PRIMARY KEY (`id_U`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'dear31','daniela_3102@outlook.com','$2y$10$kHLYZTfqT/4zoJFZyOKhI.XNH.3WhxddhojvglEMdUtmluQODESpm',NULL,'0000-00-00',NULL,''),(2,'santy123','santy@gmail.com','$2y$10$KCK/6VuRdSnfqVADt04wFeoW6UuBSb5FWkp20NxUI1AihxZatOvDi',NULL,'0000-00-00',NULL,''),(10,'Psiclon','dag243002@hotmail.com','$2y$10$1Bo7S6AIzdRoqhuAKVsiruhsthnholHNR8EOOzlyTQatYG5czxs1.',NULL,'0000-00-00',NULL,''),(11,'daniela','star@gmail.com','$2y$10$/J/YLu71hbUAt3iX8CxN/esXqqLvKD1Ejdw4Qu8kyO/JBIMt1k5UC',NULL,'0000-00-00',NULL,''),(12,'chimi','xirrus@gmail.com','xirrus',NULL,'2023-07-01',NULL,'Chimi Rodriguez'),(24,'Iam','prueba@pb.com','$2a$10$dth8t7wSFaH9QSOM4ZgJx.sEaGvlUdGYs3zxY0J/P3.JRiQ11TqGG',NULL,'2023-07-21',NULL,'iamXD'),(26,'Mari','prueba@pb.com','$2a$10$LAvE5WaHi3np0q5Gl0vMDuAPul8m4hRYbLN6VD6mFueyTi.fb9SjK',NULL,'2023-07-23',NULL,'Maridalia'),(27,'prueba','prueba@pb.com','$2a$10$6L3diNVtZzStfg.ruzQhOOjaYQsvbKp9.I5cvljfL/oUEC2QnP98.',NULL,'2023-07-24',NULL,'Maridalia');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_ganancias`
--

DROP TABLE IF EXISTS `usuarios_ganancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_ganancias` (
  `id_U` int NOT NULL,
  `id_R` int NOT NULL,
  `gananciasXvisitas` decimal(10,0) DEFAULT NULL,
  `gananciasXfav` decimal(10,0) DEFAULT NULL,
  `gananciasTotales` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_U`,`id_R`),
  KEY `fk_idRecetasGan_idx` (`id_R`),
  CONSTRAINT `fk_idRecetasGan` FOREIGN KEY (`id_R`) REFERENCES `recetas` (`id_R`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idUsuariosGan` FOREIGN KEY (`id_U`) REFERENCES `usuarios` (`id_U`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_ganancias`
--

LOCK TABLES `usuarios_ganancias` WRITE;
/*!40000 ALTER TABLE `usuarios_ganancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_ganancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pastrycook_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_editarUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_editarUsuario`(
	IN id_Usuario int,
    IN nameuser VARCHAR(30),
    IN correo VARCHAR(60),
    IN pass text,
    IN telef VARCHAR(10),
    IN iconoU TEXT,
    IN nombreC VARCHAR(60)
)
BEGIN
	IF pass = " " then
		 UPDATE usuarios
		 SET username = nameuser
			 , email = correo
             , telefono = telef
			 , icono = iconoU
			 , nombreCompleto = nombreC
		 WHERE id_U = id_Usuario;
	 ELSE 
		 UPDATE usuarios
		 SET username = nameuser
			 , email = correo
			 , contraseña = pass
             , telefono = telef
			 , icono = iconoU
			 , nombreCompleto = nombreC
		 WHERE id_U = id_Usuario;
     END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filtrarBusqueda` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtrarBusqueda`(
	IN operacion char(1),
	IN titulo_ VARCHAR(100),
	IN id_Postre INT,
	IN id_dificultad INT,
    IN id_tipoPlan_ INT
)
BEGIN
-- Operacion A: la búsqueda se hace o por input o por filtro
	IF operacion = 'A' THEN
		IF titulo_ = " " THEN
			SET @instr = CONCAT("SELECT re.id_R, u.icono, re.titulo 
										, t.postre, d.tipoDificultad
										, pr.nombre_tipo, re.reating
					   FROM recetas re, usuarios u
							, tipospostre t, dificultadreceta d
							, planes_recetas pr
					   WHERE (re.id_P =", id_Postre," OR re.id_D =", id_dificultad," 
								  OR re.id_tipoPlan=", id_tipoPlan_,") 
							 AND (t.id_P =", id_Postre," OR d.id_D =", id_dificultad," 
								  OR pr.id_tipoPlan=", id_tipoPlan_,")
							 AND (t.id_P =re.id_P OR d.id_D =re.id_D
								  OR pr.id_tipoPlan = re.id_tipoPlan)
							 AND (re.id_P = t.id_P AND re.id_D = d.id_D
								  AND re.id_tipoPlan = pr.id_tipoPlan)
							 AND re.id_U = u.id_U
					   ORDER BY re.id_R");
		ELSE
			SET @instr = CONCAT("SELECT re.id_R, u.icono, re.titulo
									, t.postre, d.tipoDificultad
									, pr.nombre_tipo, re.reating
								FROM recetas re, usuarios u
									 , tipospostre t, dificultadreceta d
									 , planes_recetas pr
								WHERE re.titulo like '%",titulo_,"%'
										AND (re.id_P = t.id_P AND re.id_D = d.id_D)
										AND re.id_U = u.id_U
										AND pr.id_tipoPlan = re.id_tipoPlan
								ORDER BY re.id_R");
			END IF;
			PREPARE stmt FROM @instr;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END IF;
-- Operacion B: La búsqueda se hace tanto por filtros como por input
        IF operacion = 'B' THEN
			SET @instr = CONCAT("SELECT re.id_R, u.icono, re.titulo
									, t.postre, d.tipoDificultad
									, pr.nombre_tipo, re.reating
								FROM recetas re, usuarios u
									 , tipospostre t, dificultadreceta d
									 , planes_recetas pr
								WHERE re.titulo like '%",titulo_,"%'
										AND (re.id_P =", id_Postre," OR re.id_D =", id_dificultad," 
											  OR re.id_tipoPlan=", id_tipoPlan_,") 
										AND (t.id_P =", id_Postre," OR d.id_D =", id_dificultad," 
											  OR pr.id_tipoPlan=", id_tipoPlan_,")
										AND (t.id_P =re.id_P OR d.id_D =re.id_D
											  OR pr.id_tipoPlan = re.id_tipoPlan)
										AND (re.id_P = t.id_P AND re.id_D = d.id_D)
										AND (re.id_U = u.id_U AND pr.id_tipoPlan = re.id_tipoPlan)
								ORDER BY re.id_R");

			PREPARE stmt FROM @instr;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mostrar_recetas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mostrar_recetas`(
	IN operacion char(1),
    IN id_Usuario INT,
    IN id_Receta INT
)
Begin
-- Operación 'A': Mostrar mis recetas (creadas por mí)
	IF operacion = 'A' THEN 
		SELECT re.id_R, re.titulo, t.postre
               , d.tipoDificultad, pr.nombre_tipo
               , re.reating, DATE_FORMAT(re.fecha, '%Y-%m-%d') as fecha
        FROM recetas re, usuarios u, tipospostre t
             , dificultadreceta d, planes_recetas pr
        WHERE ( u.id_U = re.id_U AND re.id_U = id_Usuario)
              AND (re.id_P = t.id_P AND re.id_D = d.id_D)
              AND pr.id_tipoPlan = re.id_tipoPlan
		ORDER BY re.id_R DESC;
	END IF;  
-- Operación 'B': Mostrar 6 recetas (inicio)
    IF operacion = 'B' THEN 
		SELECT  re.id_R, re.titulo, t.postre
               , d.tipoDificultad, pr.nombre_tipo
               , re.reating, DATE_FORMAT(re.fecha, '%Y-%m-%d') as fecha
        FROM recetas re, usuarios u
             , tipospostre t, dificultadreceta d
             , planes_recetas pr
        WHERE re.id_U = u.id_U 
        	  AND (re.id_P = t.id_P AND re.id_D = d.id_D)
              AND pr.id_tipoPlan = 1
			  ORDER BY re.id_R DESC
		LIMIT 6;
    END IF;
-- Operación 'C': Mostrar todos los Favoritos
    IF operacion = 'C' THEN 
		SELECT   re.id_R, re.titulo, t.postre
               , d.tipoDificultad, pr.nombre_tipo
               , re.reating, DATE_FORMAT(re.fecha, '%Y-%m-%d') as fecha
        FROM recetas re, favoritos fav
             , usuarios u, tipospostre t
             , dificultadreceta d, planes_recetas pr
        WHERE  re.id_R = fav.id_R
              AND (fav.id_U = id_Usuario AND u.id_U = re.id_U)
              AND (re.id_P = t.id_P AND re.id_D = d.id_D)
              AND pr.id_tipoPlan = re.id_tipoPlan;
    END IF;
-- Operación 'D': Mostrar LA receta
    IF operacion = 'D' THEN 
	 SELECT r.id_R, u.username, r.titulo
            , r.ingredientes, r.descripción
            , r.imagen, t.postre
            , d.tipoDificultad, DATE_FORMAT(r.fecha, '%Y-%m-%d') as fecha
     FROM usuarios u, recetas r
          , tipospostre t, dificultadreceta d
     WHERE r.id_R = id_Receta
     	   AND r.id_U = u.id_U
           AND (r.id_P = t.id_P AND r.id_D = d.id_D);
    END IF;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_obtenerCategoria_Dificultad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_obtenerCategoria_Dificultad`(
	IN operacion char(1)
)
Begin
-- Operación 'C': Obtener Categorías
	IF operacion = 'C' THEN 
		 SELECT id_P, postre
		 FROM tipospostre;
	END IF;  
-- Operación 'D': Obtener Dificultades
	IF operacion = 'D' THEN 
		SELECT id_D, tipoDificultad
		FROM dificultadreceta;
    END IF;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_procesos_favorito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_procesos_favorito`(
	IN operacion char(1),
    IN id_Receta INT,
    IN id_Usuario INT
)
Begin
-- Operación 'A': Agregar a Favoritos
	IF operacion = 'A' THEN 
		INSERT INTO favoritos
        VALUES(id_Receta, id_Usuario);
	END IF;  
    IF operacion = 'E' THEN -- Operación 'E': Eliminar de favoritos
		DELETE FROM favoritos
        WHERE id_R = id_Receta AND id_U = id_Usuario;
    END IF;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_procesos_planes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_procesos_planes`(
	IN operacion char(1),
    IN id_user INT,
    IN id_plan_ INT,
    IN total DOUBLE
)
BEGIN
-- Operación E: Especial - obtener detalles de compra de un plan
	IF operacion = 'E' THEN
		-- Almacenar los valores necesarios en variables
		SELECT costo, descount INTO @costo, @descount
		FROM pastrycook_bd.planes
		WHERE id_plan = id_plan_;
		
		-- se hace el descuento si es necesario
		IF @descount > 0 THEN
			SET @descuento = (@costo * @descount) / 100;
			SET @total = @costo - @descuento;
		ELSE 
			SET @total = @costo;
		END IF;
		
		-- se selecciona los datos del plan
		SELECT id_plan, tipo_plan, descripcion, @costo as costo, @descount as descount, @total as total
		FROM pastrycook_bd.planes
		WHERE id_plan = id_plan_;
	END IF;
-- Operación A: Subscripción de Planes
	IF operacion = 'A' THEN
		IF YEAR(NOW()) and MONTH(NOW()) NOT IN (SELECT año, mes 
										FROM  pastrycook_bd.ganancias_pastrycook 
										WHERE  año = YEAR(NOW()) and mes = MONTH(NOW()))
        THEN
			INSERT pastrycook_bd.ganancias_pastrycook(año, mes, ganancias)
            VALUES(YEAR(NOW()), MONTH(NOW()), total);
        ELSE
			UPDATE pastrycook_bd.ganancias_pastrycook
			SET ganancias = ganancias + total
			WHERE año = YEAR(NOW())
				  and mes = MONTH(NOW());
        END IF;
	-- Actualizar el plan relacionado al usuario
        UPDATE pastrycook_bd.planes_usuarios
        SET id_plan = id_plan_
        WHERE id_U = id_user;
	END IF;
-- Operación B: Obtener Plan Actual del usuario
	IF operacion = 'B' THEN
		SELECT pu.id_plan,
			   p.tipo_plan
        FROM planes_usuarios pu
			 , planes p
             , usuarios u
		WHERE u.id_U = pu.id_U
			  AND p.id_plan = pu.id_plan
              AND pu.id_U = id_user;
	END IF;
 -- Operación C: Obtener Plan para las recetas
	 IF operacion = 'C' THEN
			SELECT id_tipoPlan, nombre_tipo
			FROM planes_recetas;
	END IF; 
 -- Operación D: Obtener Plande Subscripciones
	IF operacion = 'D' THEN
			SELECT id_plan, tipo_plan, descripcion
			FROM planes;
	END IF; 
 -- Operacion F: Obtener tipo de Pago
	IF operacion = 'F' THEN
			SELECT id_tipoPago, nombre_tipoPago
			FROM tipo_pago;
	END IF; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_procesos_recetas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_procesos_recetas`(
	IN operacion char(1),
    IN id_Usuario INT,
    IN id_Receta INT,
	IN titulo_ VARCHAR(100), 
	IN ingre_ TEXT,
	IN descrp_ TEXT, 
	IN img_ TEXT, 
	IN id_Postres INT, 
	IN id_Dificultad INT,
    IN idtipoPlan_ INT 
)
Begin
-- Operación 'A': Agregar Receta
    IF operacion = 'A' THEN 
		INSERT INTO recetas (id_U, titulo, ingredientes, descripción, imagen, id_P, id_D, fecha, id_tipoPlan, reating)
		VALUES(id_Usuario, titulo_, ingre_, descrp_, img_, id_Postres, id_Dificultad, now(), idtipoPlan_, 0);
	END IF;
-- Operación 'B': Editar Receta
    IF operacion = 'B' THEN 
		UPDATE recetas
		SET titulo = titulo_,
			ingredientes= ingre_,
			descripción = descrp_,
			imagen = img_,
			id_P = id_Postres,
			id_D = id_Dificultad,
			fecha = now(),
			id_tipoPlan = idtipoPlan_
		WHERE id_R = id_Receta;
	END IF;
-- Operación 'C': Eliminar Receta
    IF operacion = 'C' THEN 
		DELETE FROM recetas
		WHERE id_R = id_Receta;
	END IF;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_procesos_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_procesos_usuario`(
	IN operacion char(1),
    IN idUsuario INT,
    IN nameUser varchar(30),
    IN correo varchar(60), 
    IN contrasena TEXT,
    IN nombreUsuario varchar(60)
)
Begin
	-- Operación 'R': Registrar Usuario
	IF operacion = 'R' THEN 
		IF nameUser NOT IN (select username from pastrycook_bd.usuarios where username = nameUser) THEN
			INSERT INTO `pastrycook_bd`.`usuarios` (`username`,`email`,`contraseña`,`nombreCompleto`, `fecha_creacion`)
			VALUES (nameUser, correo, contrasena, nombreUsuario, curdate());
			-- suscribir por default al plan gratis
            IF nameUser IN (select username from pastrycook_bd.usuarios where username = nameUser) THEN
                INSERT INTO pastrycook_bd.planes_usuarios (id_U, id_plan)
				SELECT id_U, 1
				FROM pastrycook_bd.usuarios
				WHERE username = nameUser;
			END IF;
		END IF;
    END IF;
    -- Operación 'I': Iniciar Sesión
    IF operacion = 'I' THEN 
		SELECT u.id_U, u.contraseña, p.id_plan
        FROM pastrycook_bd.usuarios u,
			 pastrycook_bd.planes_usuarios p
        WHERE u.username = nameUser 
			  and u.id_U = p.id_U; 
    END IF;
    -- Operación 'T': Traer datos del usuario
    IF operacion = 'T' THEN 
		SELECT id_U, username, email, telefono, 
			   icono, nombreCompleto
        FROM pastrycook_bd.usuarios
        WHERE id_U = idUsuario;
    END IF;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_proceso_ganancia_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_proceso_ganancia_usuario`(
	
)
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-25 14:23:09
