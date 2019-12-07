-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 05:54 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rlmdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `StudentID` int(11) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `EndDate` date DEFAULT NULL,
  `Teacher` int(11) NOT NULL,
  `Level` int(11) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Code` int(11) NOT NULL,
  `StartDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `Kind` varchar(50) NOT NULL,
  `NumberOfPieces` int(11) NOT NULL,
  `ADate` date NOT NULL,
  `Recieved` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `helpreceived`
--

CREATE TABLE `helpreceived` (
  `StudntID` int(11) NOT NULL,
  `Helpkind` varchar(50) NOT NULL,
  `HelpDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `ADate` date NOT NULL,
  `ClassID` int(11) NOT NULL,
  `VolunteerID` int(11) NOT NULL,
  `VolunteerAttended` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `SSN` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Job` varchar(50) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Gender` varchar(50) NOT NULL,
  `TelephoneNumber` int(11) NOT NULL,
  `CurrentLevel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `studentclass`
--

CREATE TABLE `studentclass` (
  `StudentID` int(11) NOT NULL,
  `ClassID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentlesson`
--

CREATE TABLE `studentlesson` (
  `StudentID` int(11) NOT NULL,
  `LessonDate` date NOT NULL,
  `ClassID` int(11) NOT NULL,
  `Attended` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `studentlevels`
--

CREATE TABLE `studentlevels` (
  `StudentID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Level` int(11) NOT NULL,
  `Grade` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `times`
--

CREATE TABLE `times` (
  `Day` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timestudent`
--

CREATE TABLE `timestudent` (
  `StudentID` int(11) NOT NULL,
  `Day` varchar(10) NOT NULL,
  `From` time NOT NULL,
  `To` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timevolunteer`
--

CREATE TABLE `timevolunteer` (
  `VolunteerID` int(11) NOT NULL,
  `Day` varchar(10) NOT NULL,
  `From` time NOT NULL,
  `To` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `ID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Job` varchar(50) DEFAULT NULL,
  `RegulatoryStatus` varchar(50) NOT NULL,
  `TelephoneNumber` int(11) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`StudentID`,`ID`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Code`),
  ADD KEY `CLASS_fk0` (`Teacher`);


--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`Kind`,`ADate`),
  ADD KEY `ADate` (`ADate`);

--
-- Indexes for table `helpreceived`
--
ALTER TABLE `helpreceived`
  ADD PRIMARY KEY (`StudntID`,`Helpkind`,`HelpDate`),
  ADD KEY `HELPRECEIVED_fk1` (`Helpkind`),
  ADD KEY `HelpDate` (`HelpDate`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`ADate`,`ClassID`),
  ADD KEY `LESSON_fk0` (`ClassID`),
  ADD KEY `LESSON_fk1` (`VolunteerID`);


--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `CurrentLevel` (`CurrentLevel`);

--
-- Indexes for table `studentclass`
--
ALTER TABLE `studentclass`
  ADD PRIMARY KEY (`StudentID`,`ClassID`),
  ADD KEY `STUDENTCLASS_fk1` (`ClassID`);

--
-- Indexes for table `studentlesson`
--
ALTER TABLE `studentlesson`
  ADD PRIMARY KEY (`StudentID`,`LessonDate`,`ClassID`),
  ADD KEY `STUDENTLESSON_fk1` (`LessonDate`),
  ADD KEY `STUDENTLESSON_fk2` (`ClassID`);

--
-- Indexes for table `studentlevels`
--
ALTER TABLE `studentlevels`
  ADD PRIMARY KEY (`StudentID`,`StartDate`,`EndDate`,`Level`,`Grade`),
  ADD KEY `Level` (`Level`);

--
-- Indexes for table `times`
--
ALTER TABLE `times`
  ADD PRIMARY KEY (`Day`,`Time`,`Code`),
  ADD KEY `TIMES_fk0` (`Code`);

--
-- Indexes for table `timestudent`
--
ALTER TABLE `timestudent`
  ADD PRIMARY KEY (`StudentID`,`Day`,`From`,`To`);

--
-- Indexes for table `timevolunteer`
--
ALTER TABLE `timevolunteer`
  ADD PRIMARY KEY (`VolunteerID`,`Day`,`From`,`To`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`ID`);


--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `Code` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;


--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `CHILD_fk0` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SSN`);

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `CLASS_fk0` FOREIGN KEY (`Teacher`) REFERENCES `volunteer` (`ID`);

--
-- Constraints for table `helpreceived`
--
ALTER TABLE `helpreceived`
  ADD CONSTRAINT `HELPRECEIVED_fk0` FOREIGN KEY (`StudntID`) REFERENCES `student` (`SSN`),
  ADD CONSTRAINT `HELPRECEIVED_fk1` FOREIGN KEY (`Helpkind`) REFERENCES `help` (`Kind`),
  ADD CONSTRAINT `HELPRECEIVED_fk2` FOREIGN KEY (`HelpDate`) REFERENCES `help` (`ADate`);

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `LESSON_fk0` FOREIGN KEY (`ClassID`) REFERENCES `class` (`Code`),
  ADD CONSTRAINT `LESSON_fk1` FOREIGN KEY (`VolunteerID`) REFERENCES `volunteer` (`ID`);

--
-- Constraints for table `studentclass`
--
ALTER TABLE `studentclass`
  ADD CONSTRAINT `STUDENTCLASS_fk0` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SSN`),
  ADD CONSTRAINT `STUDENTCLASS_fk1` FOREIGN KEY (`ClassID`) REFERENCES `class` (`Code`);

--
-- Constraints for table `studentlesson`
--
ALTER TABLE `studentlesson`
  ADD CONSTRAINT `STUDENTLESSON_fk0` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SSN`),
  ADD CONSTRAINT `STUDENTLESSON_fk1` FOREIGN KEY (`LessonDate`) REFERENCES `lesson` (`ADate`),
  ADD CONSTRAINT `STUDENTLESSON_fk2` FOREIGN KEY (`ClassID`) REFERENCES `lesson` (`ClassID`);

--
-- Constraints for table `studentlevels`
--
ALTER TABLE `studentlevels`
  ADD CONSTRAINT `StudentLevels_fk0` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SSN`);

--
-- Constraints for table `times`
--
ALTER TABLE `times`
  ADD CONSTRAINT `TIMES_fk0` FOREIGN KEY (`Code`) REFERENCES `class` (`Code`);

--
-- Constraints for table `timestudent`
--
ALTER TABLE `timestudent`
  ADD CONSTRAINT `TIMESTUDENT_fk0` FOREIGN KEY (`StudentID`) REFERENCES `student` (`SSN`);

--
-- Constraints for table `timevolunteer`
--
ALTER TABLE `timevolunteer`
  ADD CONSTRAINT `TIMEVOLUNTEER_fk0` FOREIGN KEY (`VolunteerID`) REFERENCES `volunteer` (`ID`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;