-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-10-2021 a las 11:20:56
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `achievement`
--

CREATE TABLE `achievement` (
  `AchievementID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Type` enum('Tren Inferior','Pectorales','Abdominales','Biceps','Triceps','Hombros','Constancia') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity`
--

CREATE TABLE `activity` (
  `ActivityID` int(11) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `Point` int(11) DEFAULT NULL,
  `Difficulty` enum('Facil','Medio','Dificil') DEFAULT NULL,
  `Type` enum('Compromiso','Progresion') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `exercise`
--

CREATE TABLE `exercise` (
  `ActivityID` int(11) NOT NULL,
  `Type` enum('Tren Inferior','Pectorales','Abdominales','Biceps','Triceps','Hombros') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Age` smallint(6) NOT NULL,
  `Height` smallint(6) NOT NULL,
  `Weight` float NOT NULL,
  `Gender` enum('Masculino','Femenino','Otro') NOT NULL,
  `Point` int(11) NOT NULL,
  `PointShop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`UserID`, `Email`, `Password`, `Name`, `LastName`, `Age`, `Height`, `Weight`, `Gender`, `Point`, `PointShop`) VALUES
(1, 'antonio@gmail.com', '12345', 'Antonio', 'Moreno Talero', 22, 192, 73, 'Masculino', 100, 100),
(2, 'pablo@gmail.com', '12345', 'Pablo', 'Ruiz Gonzales', 20, 180, 70, 'Masculino', 2000, 500),
(3, 'jp@gmail.com', '12345', 'Juan Pedro', 'Canton Cordero', 21, 178, 80, 'Masculino', 140, 100),
(4, 'carlos@gmail.com', '12345', 'Carlos', 'Cuevas Baliñas', 22, 180, 80, 'Masculino', 100, 100),
(5, 'marco@gmail.com', '12345', 'Marco', 'Moriche Calvo', 22, 180, 80, 'Masculino', 100, 100),
(6, 'pedro@gmail.com', '12345', 'Pedro', 'Blasco España', 22, 180, 80, 'Masculino', 100, 100),
(7, 'victor@gmail.com', '12345', 'Victor', 'Martin Lupion', 22, 180, 80, 'Masculino', 100, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_achievement`
--

CREATE TABLE `user_achievement` (
  `UserID` int(11) NOT NULL,
  `AchievementID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_activity`
--

CREATE TABLE `user_activity` (
  `UserID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_product`
--

CREATE TABLE `user_product` (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `achievement`
--
ALTER TABLE `achievement`
  ADD PRIMARY KEY (`AchievementID`);

--
-- Indices de la tabla `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`ActivityID`);

--
-- Indices de la tabla `exercise`
--
ALTER TABLE `exercise`
  ADD KEY `ActivityID` (`ActivityID`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indices de la tabla `user_achievement`
--
ALTER TABLE `user_achievement`
  ADD PRIMARY KEY (`UserID`,`AchievementID`),
  ADD KEY `AchievementID` (`AchievementID`);

--
-- Indices de la tabla `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`UserID`,`ActivityID`),
  ADD KEY `ActivityID` (`ActivityID`);

--
-- Indices de la tabla `user_product`
--
ALTER TABLE `user_product`
  ADD PRIMARY KEY (`UserID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `achievement`
--
ALTER TABLE `achievement`
  MODIFY `AchievementID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `activity`
--
ALTER TABLE `activity`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `exercise`
--
ALTER TABLE `exercise`
  ADD CONSTRAINT `exercise_ibfk_1` FOREIGN KEY (`ActivityID`) REFERENCES `activity` (`ActivityID`);

--
-- Filtros para la tabla `user_achievement`
--
ALTER TABLE `user_achievement`
  ADD CONSTRAINT `user_achievement_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `user_achievement_ibfk_2` FOREIGN KEY (`AchievementID`) REFERENCES `achievement` (`AchievementID`);

--
-- Filtros para la tabla `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `user_activity_ibfk_2` FOREIGN KEY (`ActivityID`) REFERENCES `activity` (`ActivityID`);

--
-- Filtros para la tabla `user_product`
--
ALTER TABLE `user_product`
  ADD CONSTRAINT `user_product_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `user_product_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
