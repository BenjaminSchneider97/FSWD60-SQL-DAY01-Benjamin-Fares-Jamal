-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 05. Mrz 2019 um 11:18
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
  `authorID` int(11) NOT NULL,
  `authorName` varchar(35) DEFAULT NULL,
  `authorBDay` date DEFAULT NULL,
  `fk_bookID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `bookID` int(11) NOT NULL,
  `bookName` varchar(35) DEFAULT NULL,
  `bookDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fk_orderID` int(11) DEFAULT NULL,
  `fk_bookShopID` int(11) DEFAULT NULL,
  `fk_onlineShopID` int(11) DEFAULT NULL,
  `fk_IBAN` int(11) DEFAULT NULL,
  `customerEmail` varchar(50) DEFAULT NULL,
  `memberName` varchar(25) DEFAULT NULL,
  `accountUserName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `typeofbook`
--

CREATE TABLE `typeofbook` (
  `typeOfBookID` int(11) NOT NULL,
  `genre` varchar(25) DEFAULT NULL,
  `fk_bookID` int(11) DEFAULT NULL,
  `fk_authorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`),
  ADD KEY `fk_bookID` (`fk_bookID`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indizes für die Tabelle `typeofbook`
--
ALTER TABLE `typeofbook`
  ADD PRIMARY KEY (`typeOfBookID`),
  ADD KEY `fk_bookID` (`fk_bookID`),
  ADD KEY `fk_authorID` (`fk_authorID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`fk_bookID`) REFERENCES `book` (`bookID`);

--
-- Constraints der Tabelle `typeofbook`
--
ALTER TABLE `typeofbook`
  ADD CONSTRAINT `typeofbook_ibfk_1` FOREIGN KEY (`fk_bookID`) REFERENCES `book` (`bookID`),
  ADD CONSTRAINT `typeofbook_ibfk_2` FOREIGN KEY (`fk_authorID`) REFERENCES `author` (`AuthorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
