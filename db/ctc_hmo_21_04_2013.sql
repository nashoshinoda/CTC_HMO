-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-04-2013 a las 08:07:41
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ctc_hmo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonias`
--

CREATE TABLE IF NOT EXISTS `colonias` (
  `id_colonia` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NombreColonia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_nodos` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_colonia`),
  UNIQUE KEY `id_colonia` (`id_colonia`),
  KEY `fk_nodo` (`id_nodos`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `colonias`
--

INSERT INTO `colonias` (`id_colonia`, `NombreColonia`, `id_nodos`) VALUES
(1, '4 de Marzo', 1),
(2, 'Altares', 2),
(3, 'Bachoco', 3),
(4, 'Camino Real', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nodos`
--

CREATE TABLE IF NOT EXISTS `nodos` (
  `id_nodo` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `NumNodo` int(3) NOT NULL,
  `Ubicacion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `Nivel` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_nodo`),
  UNIQUE KEY `id_nodo` (`id_nodo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `nodos`
--

INSERT INTO `nodos` (`id_nodo`, `NumNodo`, `Ubicacion`, `Nivel`) VALUES
(1, 165, '1C', '18'),
(2, 43, 'HUB', 'HUB'),
(3, 19, '4E', '34'),
(4, 33, '5F', '18'),
(5, 44, 'HUB', 'HUB'),
(6, 115, 'HUB', 'HUB'),
(7, 143, 'HUB', 'HUB'),
(8, 204, 'HUB', 'HUB'),
(9, 210, 'HUB', 'HUB');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colonias`
--
ALTER TABLE `colonias`
  ADD CONSTRAINT `id_nodos` FOREIGN KEY (`id_nodos`) REFERENCES `nodos` (`id_nodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
