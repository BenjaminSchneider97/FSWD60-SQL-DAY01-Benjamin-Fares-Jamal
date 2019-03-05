-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Mrz 2019 um 14:40
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
(2, 'Joanne Kathleen Rowling', '1965-07-31', 'Yate UK');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `title` varchar(25) DEFAULT NULL,
  `genre` varchar(25) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `numberOfPages` varchar(5) DEFAULT NULL,
  `fk_author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'Benjamin Schneider');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reading`
--

CREATE TABLE `reading` (
  `reading_id` int(11) NOT NULL,
  `startReading` date DEFAULT NULL,
  `endReading` date DEFAULT NULL,
  `fk_book_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `store`
--

CREATE TABLE `store` (
  `store_id` int(11) NOT NULL,
  `location` varchar(55) DEFAULT NULL,
  `storeName` varchar(55) DEFAULT NULL,
  `fk_purchase_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `fk_author_id` (`fk_author_id`);

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
  ADD KEY `fk_book_id` (`fk_book_id`);

--
-- Indizes für die Tabelle `reading`
--
ALTER TABLE `reading`
  ADD PRIMARY KEY (`reading_id`),
  ADD KEY `fk_book_id` (`fk_book_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `fk_purchase_id` (`fk_purchase_id`);

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
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`);

--
-- Constraints der Tabelle `reading`
--
ALTER TABLE `reading`
  ADD CONSTRAINT `reading_ibfk_1` FOREIGN KEY (`fk_book_id`) REFERENCES `book` (`book_id`),
  ADD CONSTRAINT `reading_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `store`
--
ALTER TABLE `store`
  ADD CONSTRAINT `store_ibfk_1` FOREIGN KEY (`fk_purchase_id`) REFERENCES `purchase` (`purchase_id`);

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
