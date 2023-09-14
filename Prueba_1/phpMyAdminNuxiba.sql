-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2023 a las 07:45:40
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nuxiba`
--

CREATE DATABASE nuxiba;
USE nuxiba;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `userId` varchar(100) NOT NULL,
  `sueldo` double DEFAULT NULL,
  `fechaIngreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`userId`, `sueldo`, `fechaIngreso`) VALUES
('user01', 8837, '2000-01-11'),
('user02', 8837, '2000-01-11'),
('user03', 15000, '2000-01-11'),
('user04', 15000, '2000-01-11'),
('user05', 7812, '2000-01-18'),
('user06', 7812, '2000-01-18'),
('user07', 10200, '2000-01-18'),
('user08', 10200, '2000-01-18'),
('user09', 13800, '2001-05-20'),
('user10', 13800, '2001-05-20'),
('user11', 18880, '2001-05-20'),
('user12', 18880, '2001-05-20'),
('user13', 8000, '2001-07-13'),
('user14', 8000, '2001-07-13'),
('user15', 6000, '2001-07-13'),
('user16', 19470, '2001-07-13'),
('user17', 19470, '2001-07-13'),
('user18', 10200, '2001-07-16'),
('user19', 10200, '2001-07-16'),
('user20', 25000, '2001-07-16'),
('user21', 7812, '2001-07-16'),
('user22', 7812, '2001-07-16'),
('user23', 12210, '2001-11-24'),
('user24', 12210, '2001-11-24'),
('user25', 7500, '2001-11-24'),
('user26', 15020, '2001-11-24'),
('user27', 15020, '2001-11-24'),
('user28', 25000, '2001-11-24'),
('user29', 7812, '2001-11-24'),
('user30', 15020, '2001-12-12'),
('user31', 15020, '2001-12-12'),
('user32', 12210, '2001-12-12'),
('user33', 12210, '2001-12-12'),
('user34', 19470, '2008-08-17'),
('user35', 19470, '2008-08-17'),
('user36', 8000, '2008-08-17'),
('user37', 8000, '2008-08-17'),
('user38', 18880, '2009-06-11'),
('user39', 18880, '2009-06-11'),
('user40', 14000, '2009-06-11'),
('user41', 13800, '2009-06-11'),
('user42', 13800, '2009-06-11'),
('user43', 15000, '2009-10-06'),
('user44', 15000, '2009-10-06'),
('user45', 13000, '2009-10-06'),
('user46', 8837, '2009-10-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `userId` varchar(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `paterno` varchar(100) DEFAULT NULL,
  `materno` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`userId`, `nombre`, `paterno`, `materno`) VALUES
('user01', 'BERE', 'NARANJO', 'GONZALEZ'),
('user02', 'ALEXIS', 'CAMPOS', 'NARANJO'),
('user03', 'SERGIO ALEJANDRO', 'CAMPOS', 'HERNANDEZ'),
('user04', 'DIEGO ISMAEL', 'BERUMEN', 'CEDILLO'),
('user05', 'AURORA', 'ESCALANTE', 'PALAFOX'),
('user06', 'JOYCELENE FABIOLA', 'ESTRADA', 'BARBA'),
('user07', 'FRANCISCO', 'ESTRADA', 'GOMEZ'),
('user08', 'LEONARDO DANIEL', 'FARIAS', 'ROSAS'),
('user09', 'RAMON ANDRES', 'FIERROS', 'ROBLES'),
('user10', 'EDGAR ANDRES', 'FLORES', 'OLIVARES'),
('user11', 'MARIA FERNANDA', 'FRANCO', 'ESQUIVEL'),
('user12', 'ALEJANDRO', 'GALVAN', 'MUÑIZ'),
('user13', 'MARTHA ALICIA', 'GUTIERREZ', 'ORTIZ'),
('user14', 'JOSAFAT GERARDO', 'HERNANDEZ', 'SAUCEDO'),
('user15', 'ROSALIA', 'JIMENEZ', 'GONZALEZ'),
('user16', 'LAURA CELENE', 'JIMENEZ', 'RIOS'),
('user17', 'ANGELICA', 'LOPEZ', 'CORTES'),
('user18', 'CRISTIAN IVAN', 'LOPEZ', 'GOMEZ'),
('user19', 'MARLENE GABRIELA', 'LOPEZ', 'MEZA'),
('user20', 'ALEJANDRA', 'MEDINA', 'IBARRA'),
('user21', 'CONSUELO YURIDIANA THALIA', 'MEJIA', 'ALVAREZ'),
('user22', 'JAVIER ADRIAN', 'MEJIA', 'ALVAREZ'),
('user23', 'JUAN CARLOS EVARISTO', 'PEÑA', 'GUTIERREZ'),
('user24', 'JAZMIN ALEJANDRA', 'PEREZ', 'VELEZ'),
('user25', 'GUSTAVO', 'RAMIREZ', 'RIVERA'),
('user26', 'CARLOS NIVARDO', 'RODRIGUEZ', 'ASCENCIO'),
('user27', 'KARLA JOHANA', 'ROMERO', 'LUEVANOS'),
('user28', 'YESSICA YOSELINNE', 'RUIZ', 'HERNANDEZ'),
('user29', 'CHRISTIAN EDUARDO', 'SALAS', 'SANCHEZ'),
('user30', 'LUIS ROBERTO', 'SALDAÑA', 'ESPINOZA'),
('user31', 'ADRIAN', 'SANCHEZ', 'ORTIZ'),
('user32', 'EDUARDO YAIR', 'SUAREZ', 'HERNANDEZ'),
('user33', 'JUAN FRANCISCO', 'TABAREZ', 'GARCIA'),
('user34', 'ZULEICA ELIZABETH', 'TERAN', 'TORRES'),
('user35', 'ADRIANA YUNUHEN', 'VARGAS', 'AYALA'),
('user36', 'OSCAR URIEL', 'VELAZQUEZ', 'ALVAREZ'),
('user37', 'ERICK DE JESUS', 'CORONA', 'DIAZ'),
('user38', 'MARIA GUADALUPE', 'RAMOS', 'HERNANDEZ'),
('user39', 'JESSICA NOEMI', 'JIMENEZ', 'VENTURA'),
('user40', 'FLOR MARGARITA', 'ROJAS', 'HERNANDEZ'),
('user41', 'LUIS ANTONIO', 'ALVARADO', 'VALENCIA'),
('user42', 'EDGAR IVAN', 'AGUILAR', 'PADILLA'),
('user43', 'LUIS ALFONSO', 'MICHEL', 'SANCHEZ'),
('user44', 'JOSE CARLOS', 'SILVA', 'ROCHA'),
('user45', 'JUDITH', 'RODRIGUEZ', 'REYES'),
('user46', 'BRENDA SORAYA', 'CHAVEZ', 'GARCIA'),
('user47', 'ALMA ROSA', 'MARQUEZ', 'AGUILA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`userId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`userId`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `usuario` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
