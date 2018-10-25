CREATE DATABASE IF NOT EXISTS test
use test

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE TABLE `addresbook` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `city` int(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `zipCode` varchar(50) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `cities` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `addresbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresbook_ibfk_1` (`city`);
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `addresbook`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `cities`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
ALTER TABLE `addresbook`
  ADD CONSTRAINT `addresbook_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);
