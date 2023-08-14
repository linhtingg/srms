-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2023 at 03:58 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2022-01-01 10:30:57');

-- --------------------------------------------------------

--
-- Stand-in structure for view `classsubject`
-- (See below for the actual view)
--
CREATE TABLE `classsubject` (
`ClassID` int(11)
,`Semester` varchar(6)
,`Description` varchar(200)
,`SubjectName` varchar(100)
,`SubjectCode` varchar(11)
,`Percentage` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `resultclasssubject`
-- (See below for the actual view)
--
CREATE TABLE `resultclasssubject` (
`StudentID` int(11)
,`ClassID` int(11)
,`FinalPoint` double
,`AssetPoint` double
,`Grade` double
,`SubjectName` varchar(100)
,`SubjectCode` varchar(11)
,`Percentage` double
);

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `ClassID` int(11) NOT NULL,
  `SubjectCode` varchar(11) DEFAULT NULL,
  `Semester` varchar(6) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`ClassID`, `SubjectCode`, `Semester`, `Description`) VALUES
(138000, 'IT3210', '20223', 'Thursday Morning'),
(138001, 'IT3220', '20222', 'Monday Afternoon'),
(138002, 'IT4593E', '20221', 'Wednesday Morning'),
(138003, 'IT4593E', '20221', 'Tuesday Morning'),
(138004, 'IT3210', '20223', 'Thursday Morning'),
(138005, 'IT3456', '20231', 'Friday Morning');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotice`
--

CREATE TABLE `tblnotice` (
  `id` int(11) NOT NULL,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblnotice`
--

INSERT INTO `tblnotice` (`id`, `noticeTitle`, `noticeDetails`, `postingDate`) VALUES
(2, 'Notice regarding result Delearation', 'Hạn cập nhật điểm thi các học phần kỳ 2 năm học 2022-2023', '2022-01-01 14:34:58'),
(3, 'Test Notice', 'This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  This is for testing purposes only.  ', '2022-01-01 14:48:32'),
(5, 'Nghỉ hè hihi', 'Thi cuối kỳ xong rồi thì nghỉ hè', '2023-08-11 06:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `tblresult`
--

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `ClassID` int(11) DEFAULT NULL,
  `FinalPoint` double DEFAULT NULL,
  `ValidTil` date DEFAULT current_timestamp(),
  `AssetPoint` double DEFAULT NULL,
  `Grade` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblresult`
--

INSERT INTO `tblresult` (`id`, `StudentID`, `ClassID`, `FinalPoint`, `ValidTil`, `AssetPoint`, `Grade`) VALUES
(2, 20205093, 138000, 5, '2023-12-31', 5, 5),
(3, 20205094, 138003, 6, '2023-12-31', 9, 7.2),
(4, 20205096, 138001, 7.8, '2023-12-31', 6.8, 7.4),
(5, 20205093, 138003, 5, '2023-12-31', 6, 5.4),
(6, 20205094, 138002, 9, '2023-12-31', 8, 8.6),
(7, 20205097, 138001, 7.5, '2023-12-31', 9, 8.1),
(11, 20205092, 138002, 9, '2023-12-31', 7, 8.2),
(12, 20205095, 138001, 5.5, '2023-12-31', 4.5, 5.1),
(24, 20205098, 138002, 9, '2023-08-10', 3, 6.6),
(25, 20205096, 138000, 6, NULL, 3, 5.1),
(33, 20205091, 138001, NULL, '2023-08-13', NULL, NULL),
(42, 20205090, 138000, 0, '2023-08-13', 0, NULL),
(43, 20205092, 138001, NULL, '2023-08-13', NULL, NULL),
(46, 20205052, 138002, 7, '2023-08-14', 6, 6.6),
(47, 20205096, 138005, 5, '2023-08-14', 8, 6.2);

-- --------------------------------------------------------

--
-- Table structure for table `tblstudent`
--

CREATE TABLE `tblstudent` (
  `StudentID` int(11) NOT NULL,
  `StudentName` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `Cohort` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblstudent`
--

INSERT INTO `tblstudent` (`StudentID`, `StudentName`, `StudentEmail`, `Gender`, `DOB`, `Cohort`) VALUES
(20205052, 'Nguyễn Đức Anh', 'and20202@sis.hust.com', 'Male', '', NULL),
(20205090, 'Vũ Đức An', 'linhhoangmaithuy@gmail.com', 'Male', '', NULL),
(20205091, 'Mã Văn Chung', 'linhhoangmaithuy@gmail.com', 'Male', '', NULL),
(20205092, 'Trần Thu Trang', NULL, 'Female', NULL, 65),
(20205093, 'Hoàng Linh', 'adkdkjff@gmail.com', 'Female', '1995-03-03', NULL),
(20205094, 'Nguyễn Việt Anh', 'anuj@gmail.co', 'Male', '1995-02-02', NULL),
(20205095, 'Nguyễn Hải Nam', 'amit@gmail.com', 'Male', '2014-08-06', NULL),
(20205096, 'Hoàng Anh', 'rahul01@gmail.com', 'Male', '2001-02-03', NULL),
(20205097, 'Nguyễn Thu Hường', 'sanjeev01@gmail.com', 'Male', '2002-02-03', NULL),
(20205098, 'Phạm Thùy Dương', 'shiv34534@gmail.com', 'Male', '2007-01-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubject`
--

CREATE TABLE `tblsubject` (
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(11) NOT NULL,
  `Credit` int(11) DEFAULT NULL,
  `Percentage` double DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblsubject`
--

INSERT INTO `tblsubject` (`SubjectName`, `SubjectCode`, `Credit`, `Percentage`, `id`) VALUES
('Applied Algorithms', 'IT3170E', 3, 0.7, 1),
('C Programming Language', 'IT3210', 2, 0.7, 2),
('C Programming Language lab', 'IT3220', 2, 0.6, 3),
('Data structures and algorithms LAB', 'IT3230E', 2, 0.6, 4),
('Data Structures and Algorithms', 'IT3312E', 3, 0.7, 5),
('Embedded System', 'IT3456', 3, 0.6, 9),
('Software Engineering', 'IT4082E', 2, 0.5, 6),
('Introduction to Communication\nEngineering', 'IT4593E', 2, 0.6, 7);

-- --------------------------------------------------------

--
-- Structure for view `classsubject`
--
DROP TABLE IF EXISTS `classsubject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `classsubject`  AS SELECT `tblclass`.`ClassID` AS `ClassID`, `tblclass`.`Semester` AS `Semester`, `tblclass`.`Description` AS `Description`, `tblsubject`.`SubjectName` AS `SubjectName`, `tblsubject`.`SubjectCode` AS `SubjectCode`, `tblsubject`.`Percentage` AS `Percentage` FROM (`tblclass` join `tblsubject` on(`tblclass`.`SubjectCode` = `tblsubject`.`SubjectCode`)) ;

-- --------------------------------------------------------

--
-- Structure for view `resultclasssubject`
--
DROP TABLE IF EXISTS `resultclasssubject`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `resultclasssubject`  AS SELECT `tblresult`.`StudentID` AS `StudentID`, `tblresult`.`ClassID` AS `ClassID`, `tblresult`.`FinalPoint` AS `FinalPoint`, `tblresult`.`AssetPoint` AS `AssetPoint`, `tblresult`.`Grade` AS `Grade`, `classsubject`.`SubjectName` AS `SubjectName`, `classsubject`.`SubjectCode` AS `SubjectCode`, `classsubject`.`Percentage` AS `Percentage` FROM (`tblresult` join `classsubject` on(`tblresult`.`ClassID` = `classsubject`.`ClassID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`ClassID`),
  ADD KEY `SubjectCode` (`SubjectCode`);

--
-- Indexes for table `tblnotice`
--
ALTER TABLE `tblnotice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ClassID` (`ClassID`);

--
-- Indexes for table `tblstudent`
--
ALTER TABLE `tblstudent`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `tblsubject`
--
ALTER TABLE `tblsubject`
  ADD PRIMARY KEY (`SubjectCode`),
  ADD UNIQUE KEY `subjectid` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `ClassID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138006;

--
-- AUTO_INCREMENT for table `tblnotice`
--
ALTER TABLE `tblnotice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblresult`
--
ALTER TABLE `tblresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `tblstudent`
--
ALTER TABLE `tblstudent`
  MODIFY `StudentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20205099;

--
-- AUTO_INCREMENT for table `tblsubject`
--
ALTER TABLE `tblsubject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD CONSTRAINT `tblclass_ibfk_1` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_2` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_3` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_4` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_5` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_6` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`),
  ADD CONSTRAINT `tblclass_ibfk_7` FOREIGN KEY (`SubjectCode`) REFERENCES `tblsubject` (`SubjectCode`);

--
-- Constraints for table `tblresult`
--
ALTER TABLE `tblresult`
  ADD CONSTRAINT `resultfk1` FOREIGN KEY (`ClassID`) REFERENCES `tblclass` (`ClassID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
