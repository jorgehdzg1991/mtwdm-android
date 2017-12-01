-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 52.224.233.167    Database: proyectofinal4
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

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
-- Table structure for table `catalogosdetalle`
--

DROP TABLE IF EXISTS `catalogosdetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogosdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CatalogoMaestroId` int(11) NOT NULL DEFAULT '0',
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogosdetalle`
--

LOCK TABLES `catalogosdetalle` WRITE;
/*!40000 ALTER TABLE `catalogosdetalle` DISABLE KEYS */;
INSERT INTO `catalogosdetalle` VALUES (1,1,'Administrador',''),(2,1,'Operador',''),(3,2,'Gasolina',''),(4,2,'Casetas',''),(5,2,'Alimentos',''),(6,2,'Hospedaje',''),(7,2,'Otros',''),(8,3,'Iniciado',''),(9,3,'Entregado',''),(10,3,'Terminado',''),(11,3,'No iniciado','');
/*!40000 ALTER TABLE `catalogosdetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogosmaestro`
--

DROP TABLE IF EXISTS `catalogosmaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogosmaestro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogosmaestro`
--

LOCK TABLES `catalogosmaestro` WRITE;
/*!40000 ALTER TABLE `catalogosmaestro` DISABLE KEYS */;
INSERT INTO `catalogosmaestro` VALUES (1,'Usuarios',''),(2,'Gastos',''),(3,'Estatus de viaje','');
/*!40000 ALTER TABLE `catalogosmaestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordenadas`
--

DROP TABLE IF EXISTS `coordenadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordenadas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Latitud` double NOT NULL DEFAULT '0',
  `Longitud` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordenadas`
--

LOCK TABLES `coordenadas` WRITE;
/*!40000 ALTER TABLE `coordenadas` DISABLE KEYS */;
INSERT INTO `coordenadas` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `coordenadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesviaje`
--

DROP TABLE IF EXISTS `detallesviaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallesviaje` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `FechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FechaFin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `KilometrajeInicial` double NOT NULL DEFAULT '0',
  `KilometrajeFinal` double NOT NULL DEFAULT '0',
  `Observaciones` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesviaje`
--

LOCK TABLES `detallesviaje` WRITE;
/*!40000 ALTER TABLE `detallesviaje` DISABLE KEYS */;
INSERT INTO `detallesviaje` VALUES (1,1,'2017-11-30 00:00:00','2017-11-30 00:00:00',60000,60450,'Se me ponchó una llanta en el camino.');
/*!40000 ALTER TABLE `detallesviaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastosviajes`
--

DROP TABLE IF EXISTS `gastosviajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gastosviajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `TipoGastoId` int(11) NOT NULL DEFAULT '0',
  `Monto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastosviajes`
--

LOCK TABLES `gastosviajes` WRITE;
/*!40000 ALTER TABLE `gastosviajes` DISABLE KEYS */;
INSERT INTO `gastosviajes` VALUES (1,1,3,1000),(2,1,4,500),(3,1,5,200);
/*!40000 ALTER TABLE `gastosviajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicionesviaje`
--

DROP TABLE IF EXISTS `posicionesviaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posicionesviaje` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `CoordenadaId` int(11) NOT NULL DEFAULT '0',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicionesviaje`
--

LOCK TABLES `posicionesviaje` WRITE;
/*!40000 ALTER TABLE `posicionesviaje` DISABLE KEYS */;
INSERT INTO `posicionesviaje` VALUES (1,1,1,'2017-11-30 10:00:00'),(2,1,2,'2017-11-30 10:01:00'),(3,1,3,'2017-11-30 10:02:00');
/*!40000 ALTER TABLE `posicionesviaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
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
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Jorge Hernandez','jorgehdzg1991@gmail.com','0192023A7BBD73250516F069DF18B500',1,''),(2,'Carlos Pozo','carlitros@gmail.com','CC03E747A6AFBBCBF8BE7668ACFEBEE5',2,'');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OperadorId` int(11) NOT NULL DEFAULT '0',
  `Origen` varchar(45) NOT NULL DEFAULT '',
  `Destino` varchar(45) NOT NULL DEFAULT '',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstatusViaje` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (1,2,'León, Guanajuato','CDMX','2017-11-30 23:12:59',10);
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'proyectofinal4'
--

--
-- Dumping routines for database 'proyectofinal4'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_detallesviajes_Ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_detallesviajes_Ins`(p_viajesId int
    , p_FechaInicio datetime
    , p_FechaFin datetime
    , p_KilometrajeInicial double
    , p_KilometrajeFinal double
    , p_Observaciones varchar(255))
begin

	insert into proyectofinal4.detallesviaje
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
		p_viajesId
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
/*!50003 DROP PROCEDURE IF EXISTS `proc_gastosviajes_Ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_gastosviajes_Ins`(
	p_viajesId int
    , p_TipoGastoId int
    , p_Monto double
)
begin

	insert into proyectofinal4.gastosviajes
	(
		ViajeId
		, TipoGastoId
		, Monto
	)
	values
	(
		p_viajesId
		, p_TipoGastoId
		, p_Monto
	);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_posicionesviaje_Ins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_posicionesviaje_Ins`(IN `p_viajesId` int,IN `p_Fecha` datetime,IN `p_Latitud` double,IN `p_Longitud` double)
BEGIN

	declare
		v_IdCoordenada int;
	
	insert into coordenadas
	(
		Latitud
		, Longitud
	)
	values
	(
		p_Latitud
		, p_Longitud
	);

	set
		v_IdCoordenada = last_insert_id();

	insert into posicionesviaje
	(
		ViajeId
		, CoordenadaId
		, Fecha
	)
	values
	(
		p_viajesId
		, v_IdCoordenada
		, p_Fecha
	);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_usuarios_Obt_Credenciales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_usuarios_Obt_Credenciales`(p_Correo varchar(45)
    , p_Contrasena varchar(45))
BEGIN

	select
		Id as 'UsuarioId'
		, Nombre
		, Correo
		, Contrasena
		, TipoUsuarioId as 'ClaveTipoUsuario'
		, Estatus
	from
		proyectofinal4.usuarios
	where
		Correo = p_Correo
		and Contrasena = p_Contrasena
		and Estatus = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_viajes_ActualizarEstatusViaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_viajes_ActualizarEstatusViaje`(
	p_viajesId int
    , p_EstatusViaje int
)
BEGIN

	update
		proyectofinal4.viajes
	set
		EstatusViaje = p_EstatusViaje
	where
		Id = p_viajesId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_viajes_Obt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_viajes_Obt`()
BEGIN

	select
		Id as 'ViajeId'
		, OperadorId
		, Origen
		, Destino
		, Fecha
		, EstatusViaje as 'ClaveEstatusViaje'
	from
		proyectofinal4.viajes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_viajes_Obt_Detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_viajes_Obt_Detalle`(
	p_viajesId int
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
		proyectofinal4.viajes
	where
		Id = p_viajesId;
        
	select
		Id as 'DetalleViajeId'
		, ViajeId
		, FechaInicio
		, FechaFin
		, KilometrajeInicial
		, KilometrajeFinal
		, Observaciones
	from
		proyectofinal4.detallesviaje
	where
		ViajeId = p_viajesId;
		
	select
		Id as 'GastoViajeId'
		, ViajeId
		, TipoGastoId as 'ClaveTipoGasto'
		, Monto
	from
		proyectofinal4.gastosviajes
	where
		ViajeId = p_viajesId;
		
	select
		pos.Id as 'PosicionViajeId'
		, pos.ViajeId
		, pos.CoordenadaId
		, pos.Fecha
		, coo.Id as 'CoordenadaId'
		, coo.Latitud
		, coo.Longitud
	from
		proyectofinal4.posicionesviaje as pos
		inner join
			proyectofinal4.coordenadas as coo
		on
			coo.Id = pos.CoordenadaId
	where
		ViajeId = p_viajesId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_viajes_Obt_Operador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_viajes_Obt_Operador`(
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
		proyectofinal4.viajes
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

-- Dump completed on 2017-12-01 13:05:20
