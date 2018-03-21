-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-03-2018 a las 00:00:55
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crudcine`
--
CREATE DATABASE IF NOT EXISTS `crudcine` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crudcine`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--
-- Creación: 20-03-2018 a las 19:00:43
--

DROP TABLE IF EXISTS `evento`;
CREATE TABLE IF NOT EXISTS `evento` (
  `codevento` int(11) NOT NULL AUTO_INCREMENT,
  `lugar` varchar(20) CHARACTER SET utf8 NOT NULL,
  `ciudad` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT 'Málaga',
  `fecpeli` date NOT NULL,
  `codpelicula` int(11) DEFAULT NULL,
  PRIMARY KEY (`codevento`),
  KEY `codpelicula` (`codpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `evento`:
--   `codpelicula`
--       `peliula` -> `codpeli`
--

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`codevento`, `lugar`, `ciudad`, `fecpeli`, `codpelicula`) VALUES
(17, 'Vialia', 'Málaga', '2018-03-31', 17),
(18, 'Rosaleda', 'Málaga', '2018-03-28', 15),
(19, 'Vialia', 'Málaga', '2018-03-25', 18),
(20, 'Eroski', 'Málaga', '2018-03-24', 17),
(21, 'Misericordia', 'Málaga', '2018-07-28', 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliula`
--
-- Creación: 20-03-2018 a las 18:42:29
--

DROP TABLE IF EXISTS `peliula`;
CREATE TABLE IF NOT EXISTS `peliula` (
  `codpeli` int(11) NOT NULL AUTO_INCREMENT,
  `nompeli` varchar(40) NOT NULL,
  `despeli` text CHARACTER SET utf8,
  PRIMARY KEY (`codpeli`),
  UNIQUE KEY `nompeli` (`nompeli`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `peliula`:
--

--
-- Volcado de datos para la tabla `peliula`
--

INSERT INTO `peliula` (`codpeli`, `nompeli`, `despeli`) VALUES
(15, 'Shrek', 'Ogro que salva a princesa'),
(16, 'Spiderman', 'Superhéroe mitad araña'),
(17, 'Torrente 1', 'El brazo tonto de la ley'),
(18, 'Titanic', 'Historia amorosa en un barco');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`codpelicula`) REFERENCES `peliula` (`codpeli`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla evento
--

--
-- Metadatos para la tabla peliula
--

--
-- Metadatos para la base de datos crudcine
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
