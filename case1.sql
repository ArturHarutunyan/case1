-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 25 2018 г., 22:08
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `case1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `addresbook`
--

CREATE TABLE `addresbook` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL,
  `firstName` varchar(250) NOT NULL,
  `city` int(50) NOT NULL,
  `street` varchar(250) NOT NULL,
  `zipCode` varchar(50) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `addresbook`
--

INSERT INTO `addresbook` (`id`, `name`, `firstName`, `city`, `street`, `zipCode`, `deleted`) VALUES
(1, '', 'тест', 1, 'asdfaa', '0056', 0),
(2, '', 'тест', 1, 'asdfe', '0056', 0),
(3, 'Artur', 'Harutunyan', 1, 'Shiraki 13, 35', '0065', 0),
(4, 'harutunyan', 'Artur', 1, 'Shiraki 13, 35', '0055', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id` int(250) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cities`
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
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `addresbook`
--
ALTER TABLE `addresbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresbook_ibfk_1` (`city`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `addresbook`
--
ALTER TABLE `addresbook`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(250) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `addresbook`
--
ALTER TABLE `addresbook`
  ADD CONSTRAINT `addresbook_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
