-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-05-2022 a las 05:57:35
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `BitacoraIncidenciasDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientsusers`
--

CREATE TABLE `clientsusers` (
  `Id` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE `images` (
  `Id` int(11) NOT NULL,
  `IdReference` int(11) NOT NULL,
  `ReferenceTable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidences`
--

CREATE TABLE `incidences` (
  `Id` int(11) NOT NULL,
  `IdInformer` int(11) NOT NULL,
  `IdResponsible` int(11) NOT NULL,
  `IdSubproject` int(11) NOT NULL,
  `IdSameIncidence` int(11) DEFAULT NULL,
  `Identification` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Title` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Explanation` text COLLATE utf8_spanish_ci NOT NULL,
  `Priority` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `IsInternalIncidence` bit(1) NOT NULL,
  `IsSolved` bit(1) NOT NULL,
  `Branch` int(11) NOT NULL,
  `Steps` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observations`
--

CREATE TABLE `observations` (
  `Id` int(11) NOT NULL,
  `IdIncidence` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Note` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `Id` int(11) NOT NULL,
  `IdClient` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solutions`
--

CREATE TABLE `solutions` (
  `Id` int(11) NOT NULL,
  `IdIncidence` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `Commit` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solutionsfiles`
--

CREATE TABLE `solutionsfiles` (
  `Id` int(11) NOT NULL,
  `IdSolution` int(11) NOT NULL,
  `File` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ModifiedType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subprojects`
--

CREATE TABLE `subprojects` (
  `Id` int(11) NOT NULL,
  `IdProject` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `clientsusers`
--
ALTER TABLE `clientsusers`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdClient` (`IdClient`),
  ADD KEY `IdUser` (`IdUser`);

--
-- Indices de la tabla `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `incidences`
--
ALTER TABLE `incidences`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Identification` (`Identification`),
  ADD KEY `IdInformer` (`IdInformer`),
  ADD KEY `IdResponsible` (`IdResponsible`),
  ADD KEY `IdSubproject` (`IdSubproject`),
  ADD KEY `IdSameIncidence` (`IdSameIncidence`);

--
-- Indices de la tabla `observations`
--
ALTER TABLE `observations`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdIncidence` (`IdIncidence`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdClient` (`IdClient`);

--
-- Indices de la tabla `solutions`
--
ALTER TABLE `solutions`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdIncidence` (`IdIncidence`);

--
-- Indices de la tabla `solutionsfiles`
--
ALTER TABLE `solutionsfiles`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdSolution` (`IdSolution`);

--
-- Indices de la tabla `subprojects`
--
ALTER TABLE `subprojects`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IdProject` (`IdProject`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientsusers`
--
ALTER TABLE `clientsusers`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `images`
--
ALTER TABLE `images`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `observations`
--
ALTER TABLE `observations`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subprojects`
--
ALTER TABLE `subprojects`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `incidences`
--
ALTER TABLE `incidences`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solutions`
--
ALTER TABLE `solutions`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solutionsfiles`
--
ALTER TABLE `solutionsfiles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientsusers`
--
ALTER TABLE `clientsusers`
  ADD CONSTRAINT `clientsusers_ibfk_1` FOREIGN KEY (`IdClient`) REFERENCES `clients` (`Id`),
  ADD CONSTRAINT `clientsusers_ibfk_2` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`);

--
-- Filtros para la tabla `incidences`
--
ALTER TABLE `incidences`
  ADD CONSTRAINT `incidences_ibfk_1` FOREIGN KEY (`IdInformer`) REFERENCES `users` (`Id`),
  ADD CONSTRAINT `incidences_ibfk_2` FOREIGN KEY (`IdResponsible`) REFERENCES `users` (`Id`),
  ADD CONSTRAINT `incidences_ibfk_3` FOREIGN KEY (`IdSubproject`) REFERENCES `subprojects` (`Id`),
  ADD CONSTRAINT `incidences_ibfk_4` FOREIGN KEY (`IdSameIncidence`) REFERENCES `incidences` (`Id`);

--
-- Filtros para la tabla `observations`
--
ALTER TABLE `observations`
  ADD CONSTRAINT `observations_ibfk_1` FOREIGN KEY (`IdIncidence`) REFERENCES `incidences` (`Id`);

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`IdClient`) REFERENCES `clients` (`Id`);

--
-- Filtros para la tabla `solutions`
--
ALTER TABLE `solutions`
  ADD CONSTRAINT `solutions_ibfk_1` FOREIGN KEY (`IdIncidence`) REFERENCES `incidences` (`Id`);

--
-- Filtros para la tabla `solutionsfiles`
--
ALTER TABLE `solutionsfiles`
  ADD CONSTRAINT `solutionsfiles_ibfk_1` FOREIGN KEY (`IdSolution`) REFERENCES `solutions` (`Id`);

--
-- Filtros para la tabla `subprojects`
--
ALTER TABLE `subprojects`
  ADD CONSTRAINT `subprojects_ibfk_1` FOREIGN KEY (`IdProject`) REFERENCES `projects` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
