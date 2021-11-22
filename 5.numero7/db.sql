-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-11-2021 a las 21:56:53
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mensaje`
--
CREATE DATABASE IF NOT EXISTS `mensaje` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mensaje`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_mensaje7`
--

DROP TABLE IF EXISTS `c_mensaje7`;
CREATE TABLE IF NOT EXISTS `c_mensaje7` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `c_mensaje7`
--

INSERT INTO `c_mensaje7` (`id`, `mensaje`) VALUES
(1, 'Este mensaje desde la base de datos, se muestra al oprimir la tecla 7. ');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
