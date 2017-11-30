-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ProyectoFinal4
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `CatalogosDetalle`
--

DROP TABLE IF EXISTS `CatalogosDetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalogosDetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CatalogoMaestroId` int(11) NOT NULL DEFAULT '0',
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CatalogosDetalle`
--

LOCK TABLES `CatalogosDetalle` WRITE;
/*!40000 ALTER TABLE `CatalogosDetalle` DISABLE KEYS */;
INSERT INTO `CatalogosDetalle` VALUES (1,1,'Administrador',''),(2,1,'Operador',''),(3,2,'Gasolina',''),(4,2,'Casetas',''),(5,2,'Alimentos',''),(6,2,'Hospedaje',''),(7,2,'Otros',''),(8,3,'Iniciado',''),(9,3,'Entregado',''),(10,3,'Terminado',''),(11,3,'No iniciado','');
/*!40000 ALTER TABLE `CatalogosDetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CatalogosMaestro`
--

DROP TABLE IF EXISTS `CatalogosMaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CatalogosMaestro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CatalogosMaestro`
--

LOCK TABLES `CatalogosMaestro` WRITE;
/*!40000 ALTER TABLE `CatalogosMaestro` DISABLE KEYS */;
INSERT INTO `CatalogosMaestro` VALUES (1,'Usuarios',''),(2,'Gastos',''),(3,'Estatus de viaje','');
/*!40000 ALTER TABLE `CatalogosMaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coordenadas`
--

DROP TABLE IF EXISTS `Coordenadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coordenadas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Latitud` double NOT NULL DEFAULT '0',
  `Longitud` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coordenadas`
--

LOCK TABLES `Coordenadas` WRITE;
/*!40000 ALTER TABLE `Coordenadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Coordenadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetallesViaje`
--

DROP TABLE IF EXISTS `DetallesViaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DetallesViaje` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `FechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaFin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `KilometrajeInicial` double NOT NULL DEFAULT '0',
  `KilometrajeFinal` double NOT NULL DEFAULT '0',
  `Observaciones` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetallesViaje`
--

LOCK TABLES `DetallesViaje` WRITE;
/*!40000 ALTER TABLE `DetallesViaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetallesViaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GastosViajes`
--

DROP TABLE IF EXISTS `GastosViajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GastosViajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `TipoGastoId` int(11) NOT NULL DEFAULT '0',
  `Monto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GastosViajes`
--

LOCK TABLES `GastosViajes` WRITE;
/*!40000 ALTER TABLE `GastosViajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `GastosViajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PosicionesViaje`
--

DROP TABLE IF EXISTS `PosicionesViaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PosicionesViaje` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `CoordenadaId` int(11) NOT NULL DEFAULT '0',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PosicionesViaje`
--

LOCK TABLES `PosicionesViaje` WRITE;
/*!40000 ALTER TABLE `PosicionesViaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `PosicionesViaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Correo` varchar(45) NOT NULL DEFAULT '',
  `Contrasena` varchar(45) NOT NULL DEFAULT '',
  `TipoUsuarioId` int(11) NOT NULL DEFAULT '0',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Jorge Hernandez','jorgehdzg1991@gmail.com','0192023a7bbd73250516f069df18b500',1,''),(2,'Carlos Pozo','carlitros@gmail.com','cc03e747a6afbbcbf8be7668acfebee5',2,'');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viajes`
--

DROP TABLE IF EXISTS `Viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Viajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OperadorId` int(11) NOT NULL DEFAULT '0',
  `Origen` varchar(45) NOT NULL DEFAULT '',
  `Destino` varchar(45) NOT NULL DEFAULT '',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstatusViaje` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viajes`
--

LOCK TABLES `Viajes` WRITE;
/*!40000 ALTER TABLE `Viajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ProyectoFinal4'
--

--
-- Dumping routines for database 'ProyectoFinal4'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_DetallesViajes_Ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_DetallesViajes_Ins`(
	p_ViajesId int
    , p_FechaInicio datetime
    , p_FechaFin datetime
    , p_KilometrajeInicial double
    , p_KilometrajeFinal double
    , p_Observaciones varchar(255)
)
begin

	insert into ProyectoFinal4.GastosViajes
	(
		ViajeId
        , FechaInicio
        , FechaFin
        , KilometrajeInicial
        , KilometrajeFinal
        , Observaciones
	)
	values
	(
		p_ViajesId
		, p_FechaInicio
		, p_FechaFin
		, p_KilometrajeInicial
		, p_KilometrajeFinal
		, p_Observaciones
	);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_GastosViajes_Ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_GastosViajes_Ins`(
	p_ViajesId int
    , p_TipoGastoId int
    , p_Monto double
)
begin

	insert into ProyectoFinal4.GastosViajes
	(
		ViajeId
		, TipoGastoId
		, Monto
	)
	values
	(
		p_ViajesId
		, p_TipoGastoId
		, p_Monto
	);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Usuarios_Obt_Credenciales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Usuarios_Obt_Credenciales`(
	p_Correo varchar(45)
    , p_Contrasena varchar(45)
)
BEGIN

	select
		Id as 'UsuarioId'
		, Nombre
		, Correo
		, Contrasena
		, TipoUsuarioId as 'ClaveTipoUsuario'
		, Estatus
	from
		ProyectoFinal4.Usuarios
	where
		Correo = p_Correo
		and Contrasena = p_Contrasena
        and EstatusViaje <> 10;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Viajes_ActualizarEstatusViaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Viajes_ActualizarEstatusViaje`(
	p_ViajesId int
    , p_EstatusViaje int
)
BEGIN

	update
		ProyectoFinal4.Viajes
	set
		EstatusViaje = p_EstatusViaje
	where
		Id = p_ViajesId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Viajes_Obt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Viajes_Obt`()
BEGIN

	select
		Id as 'ViajeId'
		, OperadorId
		, Origen
		, Destino
		, Fecha
		, EstatusViaje as 'ClaveEstatusViaje'
	from
		ProyectoFinal4.Viajes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Viajes_Obt_Detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Viajes_Obt_Detalle`(
	p_ViajesId int
)
BEGIN

	select
		Id as 'ViajeId'
		, OperadorId
		, Origen
		, Destino
		, Fecha
		, EstatusViaje as 'ClaveEstatusViaje'
	from
		ProyectoFinal4.Viajes
	where
		Id = p_ViajesId;
        
	select
		Id as 'DetalleViajeId'
		, ViajeId
		, FechaInicio
		, FechaFin
		, KilometrajeInicial
		, KilometrajeFinal
		, Observaciones
	from
		ProyectoFinal4.DetallesViaje
	where
		ViajeId = p_ViajesId;
		
	select
		Id as 'GastoViajeId'
		, ViajeId
		, TipoGastoId as 'ClaveTipoGasto'
		, Monto
	from
		ProyectoFinal4.GastosViajes
	where
		ViajeId = p_ViajesId;
		
	select
		pos.Id as 'PosicionViajeId'
		, pos.ViajeId
		, pos.CoordenadaId
		, pos.Fecha
		, coo.Id as 'CoordenadaId'
		, coo.Latitud
		, coo.Longitud
	from
		ProyectoFinal4.PosicionesViaje as pos
		inner join
			ProyectoFinal4.Coordenadas as coo
		on
			coo.Id = pos.CoordenadaId
	where
		ViajeId = p_ViajesId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Viajes_Obt_Operador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Viajes_Obt_Operador`(
	p_OperadorId int
)
BEGIN

	select
		Id as 'ViajeId'
		, OperadorId
		, Origen
		, Destino
		, Fecha
		, EstatusViaje as 'ClaveEstatusViaje'
	from
		ProyectoFinal4.Viajes
	where
		OperadorId = p_OperadorId;

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

-- Dump completed on 2017-11-30 12:43:16
