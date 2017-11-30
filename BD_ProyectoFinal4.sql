/*
MySQL Backup
Source Server Version: 10.1.25
Source Database: proyectofinal4
Date: 30/11/2017 15:52:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `catalogosdetalle`
-- ----------------------------
DROP TABLE IF EXISTS `catalogosdetalle`;
CREATE TABLE `catalogosdetalle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CatalogoMaestroId` int(11) NOT NULL DEFAULT '0',
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `catalogosmaestro`
-- ----------------------------
DROP TABLE IF EXISTS `catalogosmaestro`;
CREATE TABLE `catalogosmaestro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL DEFAULT '',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `coordenadas`
-- ----------------------------
DROP TABLE IF EXISTS `coordenadas`;
CREATE TABLE `coordenadas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Latitud` double NOT NULL DEFAULT '0',
  `Longitud` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `detallesviaje`
-- ----------------------------
DROP TABLE IF EXISTS `detallesviaje`;
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

-- ----------------------------
--  Table structure for `gastosviajes`
-- ----------------------------
DROP TABLE IF EXISTS `gastosviajes`;
CREATE TABLE `gastosviajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `TipoGastoId` int(11) NOT NULL DEFAULT '0',
  `Monto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `posicionesviaje`
-- ----------------------------
DROP TABLE IF EXISTS `posicionesviaje`;
CREATE TABLE `posicionesviaje` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ViajeId` int(11) NOT NULL DEFAULT '0',
  `CoordenadaId` int(11) NOT NULL DEFAULT '0',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL DEFAULT '',
  `Correo` varchar(45) NOT NULL DEFAULT '',
  `Contrasena` varchar(45) NOT NULL DEFAULT '',
  `TipoUsuarioId` int(11) NOT NULL DEFAULT '0',
  `Estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `viajes`
-- ----------------------------
DROP TABLE IF EXISTS `viajes`;
CREATE TABLE `viajes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OperadorId` int(11) NOT NULL DEFAULT '0',
  `Origen` varchar(45) NOT NULL DEFAULT '',
  `Destino` varchar(45) NOT NULL DEFAULT '',
  `Fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `EstatusViaje` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Procedure definition for `proc_detallesviajes_Ins`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_detallesviajes_Ins`;
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

end
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_gastosviajes_Ins`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_gastosviajes_Ins`;
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

end
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_posicionesviaje_Ins`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_posicionesviaje_Ins`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_usuarios_Obt_Credenciales`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_usuarios_Obt_Credenciales`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_viajes_ActualizarEstatusViaje`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_viajes_ActualizarEstatusViaje`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_viajes_Obt`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_viajes_Obt`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_viajes_Obt_Detalle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_viajes_Obt_Detalle`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Procedure definition for `proc_viajes_Obt_Operador`
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_viajes_Obt_Operador`;
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

END
;;
DELIMITER ;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `catalogosdetalle` VALUES ('1','1','Administrador',''), ('2','1','Operador',''), ('3','2','Gasolina',''), ('4','2','Casetas',''), ('5','2','Alimentos',''), ('6','2','Hospedaje',''), ('7','2','Otros',''), ('8','3','Iniciado',''), ('9','3','Entregado',''), ('10','3','Terminado',''), ('11','3','No iniciado','');
INSERT INTO `catalogosmaestro` VALUES ('1','Usuarios',''), ('2','Gastos',''), ('3','Estatus de viaje','');
INSERT INTO `coordenadas` VALUES ('1','1','1'), ('2','2','2'), ('3','3','3'), ('4','1','1'), ('5','2','2'), ('6','3','3');
INSERT INTO `detallesviaje` VALUES ('1','1','2017-11-30 00:00:00','2017-11-30 00:00:00','60000','60450','Se me ponchó una llanta en el camino.');
INSERT INTO `gastosviajes` VALUES ('1','1','3','1000'), ('2','1','4','500'), ('3','1','5','200');
INSERT INTO `posicionesviaje` VALUES ('1','1','1','2017-11-30 10:00:00'), ('2','1','2','2017-11-30 10:01:00'), ('3','1','3','2017-11-30 10:02:00'), ('4','1','4','2017-11-30 10:00:00'), ('5','1','5','2017-11-30 10:01:00'), ('6','1','6','2017-11-30 10:02:00');
INSERT INTO `usuarios` VALUES ('1','Jorge Hernandez','jorgehdzg1991@gmail.com','0192023A7BBD73250516F069DF18B500','1',''), ('2','Carlos Pozo','carlitros@gmail.com','CC03E747A6AFBBCBF8BE7668ACFEBEE5','2','');
INSERT INTO `viajes` VALUES ('1','2','Desde aquí','Hasta allá','2017-11-30 13:15:17','10'), ('2','2','León, Gto','CDMX','2017-11-30 13:15:19','11');
