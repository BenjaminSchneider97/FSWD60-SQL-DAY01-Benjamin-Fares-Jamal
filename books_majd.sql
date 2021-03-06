-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2019 at 02:21 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books_majd`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `authorName` varchar(32) DEFAULT NULL,
  `authorBDay` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`authorID`, `authorName`, `authorBDay`) VALUES
(1, 'Winston Graham', '1908-06-03'),
(2, 'Agatha Christe', '1890-09-15'),
(3, 'Carl Marx', '1818-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `bookID` int(11) NOT NULL,
  `fk_typeID` int(11) DEFAULT NULL,
  `bookName` varchar(35) DEFAULT NULL,
  `fk_authorID` int(11) DEFAULT NULL,
  `bookDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookID`, `fk_typeID`, `bookName`, `fk_authorID`, `bookDate`) VALUES
(0, 11, 'Poldark The Black Moon', 1, NULL),
(1, 1, 'Marx on Economics', 3, '1963-06-01'),
(2, 2, 'The Communist Manifesto', 3, '1988-07-01'),
(3, 3, 'Murder on the Orient Express', 2, '1934-01-01'),
(4, 11, 'Ross Poldark ', 1, '2008-01-01'),
(6, 11, 'Bella Poldark', NULL, NULL),
(21, NULL, 'Poldark Warleggen', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bookshop`
--

CREATE TABLE `bookshop` (
  `bookShopID` int(11) NOT NULL,
  `fk_orderID` int(11) DEFAULT NULL,
  `fk_customerID` int(11) DEFAULT NULL,
  `fk_bookID` int(11) NOT NULL,
  `fk_onlineShopID` int(11) NOT NULL,
  `phoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE `creditcard` (
  `IBAN` int(11) NOT NULL,
  `password1` int(11) DEFAULT NULL,
  `memberName` varchar(32) DEFAULT NULL,
  `CardDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`IBAN`, `password1`, `memberName`, `CardDate`) VALUES
(94, 1234, 'almajdfares', '2019-02-04'),
(95, 1232, 'benjamin_schneider', '2018-12-11'),
(96, 1231, 'jamalAhmad', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `fk_orderID`, `fk_bookShopID`, `fk_onlineShopID`, `fk_IBAN`, `customerEmail`, `memberName`, `accountUserName`) VALUES
(1, 1234, 1, 94, 94, 'fares@gmail.com', 'almajdfares', 'majd666'),
(2, 1212, 2, 95, 95, 'Schnider@post.de', 'BenjaminScnider', 'Benjamin777'),
(3, 2212, 2, 96, 96, 'ahmad@hotmail.com', 'AHMADJAMAL', 'jamal123');

-- --------------------------------------------------------

--
-- Table structure for table `onlineshop`
--

CREATE TABLE `onlineshop` (
  `onlineShopID` int(11) NOT NULL,
  `webSite` varchar(45) DEFAULT NULL,
  `accountName` varchar(29) DEFAULT NULL,
  `accountPass` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `onlineshop`
--

INSERT INTO `onlineshop` (`onlineShopID`, `webSite`, `accountName`, `accountPass`) VALUES
(94, 'www.online.com', 'almajdfares', 0),
(95, 'www.Benjamin.at', 'schnider', 666),
(96, 'www.jamal.org', 'Jamal', 212);

-- --------------------------------------------------------

--
-- Table structure for table `order1`
--

CREATE TABLE `order1` (
  `fk_customerID` int(11) DEFAULT NULL,
  `fk_bookID` int(11) DEFAULT NULL,
  `orderID` int(11) NOT NULL,
  `payment` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `typeofbook`
--

CREATE TABLE `typeofbook` (
  `typeID` int(11) NOT NULL,
  `fk_bookID` int(11) DEFAULT NULL,
  `authorID` int(11) DEFAULT NULL,
  `genre` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `typeofbook`
--

INSERT INTO `typeofbook` (`typeID`, `fk_bookID`, `authorID`, `genre`) VALUES
(1, 1, 3, 'Economist'),
(2, 2, 3, 'political '),
(3, 1, 2, 'Murder Mystery'),
(11, 1, 1, 'historical');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `fk_authorID` (`fk_authorID`),
  ADD KEY `fk_typeID` (`fk_typeID`);

--
-- Indexes for table `bookshop`
--
ALTER TABLE `bookshop`
  ADD PRIMARY KEY (`bookShopID`),
  ADD KEY `fk_orderID` (`fk_orderID`),
  ADD KEY `fk_customerID` (`fk_customerID`),
  ADD KEY `fk_bookID` (`fk_bookID`),
  ADD KEY `fk_onlineShopID` (`fk_onlineShopID`);

--
-- Indexes for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`IBAN`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `fk_IBAN` (`fk_IBAN`),
  ADD KEY `fk_onlineShopID` (`fk_onlineShopID`);

--
-- Indexes for table `onlineshop`
--
ALTER TABLE `onlineshop`
  ADD PRIMARY KEY (`onlineShopID`);

--
-- Indexes for table `order1`
--
ALTER TABLE `order1`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `fk_customerID` (`fk_customerID`);

--
-- Indexes for table `typeofbook`
--
ALTER TABLE `typeofbook`
  ADD PRIMARY KEY (`typeID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`fk_authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`fk_typeID`) REFERENCES `typeofbook` (`typeID`);

--
-- Constraints for table `bookshop`
--
ALTER TABLE `bookshop`
  ADD CONSTRAINT `bookshop_ibfk_1` FOREIGN KEY (`fk_orderID`) REFERENCES `order1` (`orderID`),
  ADD CONSTRAINT `bookshop_ibfk_2` FOREIGN KEY (`fk_customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `bookshop_ibfk_3` FOREIGN KEY (`fk_bookID`) REFERENCES `book` (`bookID`),
  ADD CONSTRAINT `bookshop_ibfk_4` FOREIGN KEY (`fk_onlineShopID`) REFERENCES `onlineshop` (`onlineShopID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_IBAN`) REFERENCES `creditcard` (`IBAN`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_onlineShopID`) REFERENCES `onlineshop` (`onlineShopID`);

--
-- Constraints for table `order1`
--
ALTER TABLE `order1`
  ADD CONSTRAINT `order1_ibfk_1` FOREIGN KEY (`fk_customerID`) REFERENCES `customer` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
