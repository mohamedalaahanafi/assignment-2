-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2019 at 05:08 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `se`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `ID` int(11) NOT NULL,
  `attributeName` text NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`ID`, `attributeName`, `type`) VALUES
(1, 'driver license', 'text'),
(2, 'car Plate', 'int'),
(3, 'experience', 'text'),
(4, 'ayhaga', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `full name` text NOT NULL,
  `userType` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `full name`, `userType`) VALUES
(1, 'hamada', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `ID` int(11) NOT NULL,
  `type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`ID`, `type`) VALUES
(1, 'Driver'),
(2, 'assistant');

-- --------------------------------------------------------

--
-- Table structure for table `usertypeattributes`
--

CREATE TABLE `usertypeattributes` (
  `ID` int(11) NOT NULL,
  `userTypeID` int(11) NOT NULL,
  `attributeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertypeattributes`
--

INSERT INTO `usertypeattributes` (`ID`, `userTypeID`, `attributeID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 1, 3),
(5, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `uservalues`
--

CREATE TABLE `uservalues` (
  `ID` int(11) NOT NULL,
  `uniqueUserAttributeID` int(11) NOT NULL,
  `value` text NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uservalues`
--

INSERT INTO `uservalues` (`ID`, `uniqueUserAttributeID`, `value`, `userID`) VALUES
(1, 1, '555', 1),
(2, 4, 'dancing', 1),
(3, 5, 'hagat', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userType` (`userType`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `usertypeattributes`
--
ALTER TABLE `usertypeattributes`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userTypeID` (`userTypeID`),
  ADD KEY `attributeID` (`attributeID`);

--
-- Indexes for table `uservalues`
--
ALTER TABLE `uservalues`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `uniqueUserAttributeID` (`uniqueUserAttributeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usertypeattributes`
--
ALTER TABLE `usertypeattributes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `uservalues`
--
ALTER TABLE `uservalues`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `usertype` (`ID`);

--
-- Constraints for table `usertypeattributes`
--
ALTER TABLE `usertypeattributes`
  ADD CONSTRAINT `usertypeattributes_ibfk_1` FOREIGN KEY (`userTypeID`) REFERENCES `usertype` (`ID`),
  ADD CONSTRAINT `usertypeattributes_ibfk_2` FOREIGN KEY (`attributeID`) REFERENCES `attribute` (`ID`);

--
-- Constraints for table `uservalues`
--
ALTER TABLE `uservalues`
  ADD CONSTRAINT `uservalues_ibfk_1` FOREIGN KEY (`uniqueUserAttributeID`) REFERENCES `usertypeattributes` (`ID`),
  ADD CONSTRAINT `uservalues_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
