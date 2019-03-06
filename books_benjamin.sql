-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Mrz 2019 um 14:24
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `books`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `authorName` varchar(55) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `authorName`, `birthday`, `country`) VALUES
(1, 'Stephen King', '1947-09-21', 'Portland USA'),
(2, 'Joanne Kathleen Rowling', '1965-07-31', 'Yate UK'),
(3, 'Mark Twain', '1885-11-30', 'Florida US');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(55) DEFAULT NULL,
  `genre` varchar(25) DEFAULT NULL,
  `description` varchar(55) DEFAULT NULL,
  `numberOfPages` varchar(5) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `fk_store_id` int(11) NOT NULL,
  `fk_author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`book_id`, `title`, `genre`, `description`, `numberOfPages`, `price`, `fk_store_id`, `fk_author_id`) VALUES
(1, 'The Adventures of Huckleberry Finn', 'children', 'book description here', '310', 7, 1, 3),
(2, 'The Adventures of Tom Sawyer', 'children', 'book description here', '320', 5, 2, 3),
(3, 'The Prince and the Pauper', 'children', 'book description here', '196', 8, 1, 3),
(4, 'It', 'horror', 'book description here', '1152', 10, 2, 1),
(5, 'The Green Mile', 'horror', 'book description here', '480', 13, 2, 1),
(6, 'The Waste Lands', 'fantasy', 'book description here', '640', 19, 2, 1),
(7, 'Harry Potter and the Prisoner of Azkaban', 'fantasy', 'book description here', '448', 15, 2, 2),
(8, 'Harry Potter and the Half-blood Prince', 'fantasy', 'book description here', '768', 10, 1, 2),
(9, 'Harry Potter And The Order Of The Phoenix', 'fantasy', 'book description here', '896', 11, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customerName` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customerName`) VALUES
(1, 'Jamal Ahmad'),
(2, 'Almjd Fares'),
(3, 'Benjamin Schneider'),
(4, 'Captain America'),
(5, 'Arnold Schwarzenegger');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `fk_store_id` int(11) NOT NULL,
  `fk_customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `purchaseDate`, `fk_book_id`, `fk_store_id`, `fk_customer_id`) VALUES
(1, '2019-03-04', 5, 2, 4),
(2, '2019-01-01', 8, 1, 1),
(3, '2019-05-01', 3, 1, 3),
(4, '2019-02-23', 1, 1, 5),
(5, '2019-03-17', 6, 2, 4),
(6, '2019-03-17', 7, 2, 4),
(7, '2019-02-10', 4, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `location` varchar(55) DEFAULT NULL,
  `storeName` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `store`
--

INSERT INTO `store` (`store_id`, `location`, `storeName`) VALUES
(1, 'Vienna', 'Thalia'),
(2, 'Graz', 'BookShop');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wish`
--

CREATE TABLE `wish` (
  `wish_id` int(11) NOT NULL,
  `dateOfWish` date DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `wish`
--

INSERT INTO `wish` (`wish_id`, `dateOfWish`, `fk_customer_id`, `fk_book_id`) VALUES
(1, '2019-03-03', 4, 5),
(2, '2019-03-16', 4, 7),
(3, '2019-03-16', 4, 6),
(4, '2019-01-01', 1, 8),
(5, '2019-04-20', 3, 3),
(6, '2019-02-22', 5, 1),
(7, '2019-02-09', 2, 4);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_author_id` (`fk_author_id`),
  ADD KEY `fk_store_id` (`fk_store_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`),
  ADD KEY `fk_book_id` (`fk_book_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_store_id` (`fk_store_id`);

--
-- Indizes für die Tabelle `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`);

--
-- Indizes für die Tabelle `wish`
--
ALTER TABLE `wish`
  ADD PRIMARY KEY (`wish_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints der Tabelle `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `purchase_ibfk_3` FOREIGN KEY (`fk_store_id`) REFERENCES `store` (`store_id`);

--
-- Constraints der Tabelle `wish`
--
ALTER TABLE `wish`
  ADD CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `wish_ibfk_2` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
