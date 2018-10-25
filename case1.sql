-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2018 at 03:28 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `case1`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresbook`
--

CREATE TABLE `addresbook` (
  `id` int(250) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `city` int(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `zipCode` varchar(50) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresbook`
--

INSERT INTO `addresbook` (`id`, `firstName`, `city`, `street`, `zipCode`, `deleted`) VALUES
(1, 'тест', 1, 'asdf', '0056', 0),
(2, 'тест', 1, 'asdf', '0056', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Schaffhausen'),
(2, 'Aargau'),
(3, 'Glarus'),
(4, 'Zürich'),
(5, 'Jura'),
(6, 'Basel-Landschaft'),
(7, 'Basel-Stadt'),
(8, 'Solothurn'),
(9, 'Fribourg'),
(10, 'Zug'),
(11, 'Graubünden'),
(12, 'Obwalden'),
(13, 'Schwyz'),
(14, 'Luzern'),
(15, 'Neuchâtel'),
(16, 'Uri'),
(17, 'Bern'),
(18, 'Genève'),
(19, 'Vaud'),
(20, 'Bern'),
(21, 'Nidwalden'),
(22, 'Sankt Gallen'),
(23, 'Appenzell Innerrhoden'),
(24, 'Appenzell Ausserrhoden'),
(25, 'Thurgau'),
(26, 'Ticino'),
(27, 'Ticino'),
(28, 'Valais'),
(29, 'Schaffhausen'),
(30, 'Aargau'),
(31, 'Jura'),
(32, 'Solothurn');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresbook`
--
ALTER TABLE `addresbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresbook_ibfk_1` (`city`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresbook`
--
ALTER TABLE `addresbook`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresbook`
--
ALTER TABLE `addresbook`
  ADD CONSTRAINT `addresbook_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
