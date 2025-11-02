-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2024 at 06:01 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crmsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'Admin', 'admin', 7898799720, 'tester1@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '2024-02-02 06:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `tblapplyjob`
--

CREATE TABLE `tblapplyjob` (
  `ID` int(10) NOT NULL,
  `UserId` int(10) DEFAULT NULL,
  `JobId` int(10) DEFAULT NULL,
  `Resume` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `Message` mediumtext NOT NULL,
  `Remark` varchar(200) NOT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ResponseDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblapplyjob`
--

INSERT INTO `tblapplyjob` (`ID`, `UserId`, `JobId`, `Resume`, `ApplyDate`, `Message`, `Remark`, `Status`, `ResponseDate`) VALUES
(1, 1, 3, 'c8655d07599e03ce75ad25ed078d6b741567663469.pdf', '2024-02-05 06:04:29', 'Comes with original documents', '', 'Sorted', '2024-02-14 09:43:37'),
(2, 1, 4, 'c8655d07599e03ce75ad25ed078d6b741567663734.pdf', '2024-02-05 06:04:29', 'hgfhfhfh', '', 'Rejected', '2024-02-14 09:46:10'),
(3, 2, 4, 'c8655d07599e03ce75ad25ed078d6b741567668198.pdf', '2024-02-05 06:04:29', 'Come with your original documents', '', 'Sorted', '2024-02-14 09:46:21'),
(4, 2, 5, 'c8655d07599e03ce75ad25ed078d6b741567668243.pdf', '2024-02-05 06:04:29', 'ghiuiui', '', 'Sorted', '2024-02-14 09:46:13'),
(5, 1, 3, 'd41d8cd98f00b204e9800998ecf8427e1567746238.pdf', '2024-02-06 05:03:58', '', '', NULL, '2024-02-14 09:46:35'),
(6, 1, 6, 'd41d8cd98f00b204e9800998ecf8427e1568013929.pdf', '2024-02-07 07:25:29', 'This is sample text for testing.', '', 'Rejected', '2024-02-17 09:46:51'),
(7, 1, 12, 'd41d8cd98f00b204e9800998ecf8427e1568371755.pdf', '2024-02-08 10:49:15', '', '', NULL, '2024-02-14 09:47:20'),
(8, 5, 13, 'd41d8cd98f00b204e9800998ecf8427e1570475698.doc', '2024-02-08 10:49:15', '', '', NULL, '2024-02-14 09:47:29'),
(9, 6, 13, 'd41d8cd98f00b204e9800998ecf8427e1570640146.doc', '2024-02-09 16:55:46', '', '', NULL, '2024-02-14 09:48:00'),
(10, 6, 14, 'd41d8cd98f00b204e9800998ecf8427e1570640600.doc', '2024-02-09 17:03:20', 'Your application is sort listed.', '', 'Sorted', '2024-02-14 09:48:11'),
(11, 6, 3, 'd41d8cd98f00b204e9800998ecf8427e1708168087.pdf', '2024-02-17 11:08:07', 'Your are selected for this position. CONGRATS', '', 'Selected', '2024-02-17 16:59:07'),
(12, 7, 17, 'd41d8cd98f00b204e9800998ecf8427e1708190639.pdf', '2024-02-17 17:23:59', 'Congrats, Your are selected for the job.', '', 'Selected', '2024-02-17 17:26:47');

-- --------------------------------------------------------

--
-- Table structure for table `tblcompany`
--

CREATE TABLE `tblcompany` (
  `ID` int(10) NOT NULL,
  `CompanyName` varchar(120) DEFAULT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `CompanyUrl` varchar(200) DEFAULT NULL,
  `CompanyAddress` mediumtext DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `CompanyEmail` varchar(200) DEFAULT NULL,
  `CompanyLogo` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `CompanyRegdate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcompany`
--

INSERT INTO `tblcompany` (`ID`, `CompanyName`, `ContactPerson`, `CompanyUrl`, `CompanyAddress`, `MobileNumber`, `CompanyEmail`, `CompanyLogo`, `Password`, `CompanyRegdate`) VALUES
(1, 'Infosys Pvt Ltd', 'Sanjana Jha', 'www.infosytem.com', 'h-123, banglore behind Aswgandha park', 8956232528, 'infosys@gmail.com', '02822fc031d560839f95fa6eb21f86111568180093.png', '202cb962ac59075b964b07152d234b70', '2024-02-04 13:29:51'),
(2, 'HCL Pvt lt', 'Sneha', 'www.hcl.com', 'g-123, sector- 63 noida', 8989898989, 'hcl@gmail.com', 'b64810fde7027715e614449aff1d595f1567485537.png', '202cb962ac59075b964b07152d234b70', '2024-02-04 13:29:51'),
(3, 'TCS pvt ltd', 'Sudhir Sharma', 'www.tcs.com', 'fgfgfguytutuyujytu', 8889898989, 'support@gmail.com', 'c26be60cfd1ba40772b5ac48b95ab19b1567753271.png', '202cb962ac59075b964b07152d234b70', '2024-02-04 13:29:51'),
(4, 'Religare Pvt Ltd', 'Mahesh Kumar', 'www.religare.com', 'H-321 Sector 4 Noida', 8956247994, 'religare@gmail.com', 'b9fb9d37bdf15a699bc071ce49baea531568302051.jpg', '202cb962ac59075b964b07152d234b70', '2024-02-04 13:29:51'),
(5, 'HSBC', 'Anuj Kumar', 'hsbc.com', 'New Delhi', 2345235423, 'anuj@hsbc.com', '41b586905e6233e72b076191f8bf95121708018954.png', 'f925916e2754e5e03f75dd58a5733251', '2024-02-04 13:29:51'),
(6, 'Amazon India', 'Amit Kumar', 'amazon.in', 'Bangalore India', 1425362514, 'info@amazon.in', '900f53f4274b62426298909232c24ed61708190431.png', 'f925916e2754e5e03f75dd58a5733251', '2024-02-17 17:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbleducation`
--

CREATE TABLE `tbleducation` (
  `ID` int(10) NOT NULL,
  `UserID` int(10) DEFAULT NULL,
  `SecondaryBoard` varchar(100) DEFAULT NULL,
  `SecondaryBoardyop` varchar(120) DEFAULT NULL,
  `SecondaryBoardper` varchar(120) DEFAULT NULL,
  `SecondaryBoardcgpa` varchar(120) DEFAULT NULL,
  `SSecondaryBoard` varchar(120) DEFAULT NULL,
  `SSecondaryBoardyop` varchar(120) DEFAULT NULL,
  `SSecondaryBoardper` varchar(120) DEFAULT NULL,
  `SSecondaryBoardcgpa` varchar(120) DEFAULT NULL,
  `GraUni` varchar(120) DEFAULT NULL,
  `GraUniyop` varchar(120) DEFAULT NULL,
  `GraUnidper` varchar(120) DEFAULT NULL,
  `GraUnicgpa` varchar(120) DEFAULT NULL,
  `PGUni` varchar(120) DEFAULT NULL,
  `PGUniyop` varchar(120) DEFAULT NULL,
  `PGUniper` varchar(120) DEFAULT NULL,
  `PGUnicgpa` varchar(120) DEFAULT NULL,
  `ExtraCurriculars` varchar(120) DEFAULT NULL,
  `OtherAchivement` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbleducation`
--

INSERT INTO `tbleducation` (`ID`, `UserID`, `SecondaryBoard`, `SecondaryBoardyop`, `SecondaryBoardper`, `SecondaryBoardcgpa`, `SSecondaryBoard`, `SSecondaryBoardyop`, `SSecondaryBoardper`, `SSecondaryBoardcgpa`, `GraUni`, `GraUniyop`, `GraUnidper`, `GraUnicgpa`, `PGUni`, `PGUniyop`, `PGUniper`, `PGUnicgpa`, `ExtraCurriculars`, `OtherAchivement`) VALUES
(3, 1, 'CBSE', '2010', '80', '8', 'CBSE', '2012', '76', '7.6', 'B.TEch', '2016', '75', '7.5', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA'),
(4, 5, 'CBSE', '2010', '80', '8', 'CBSE', '2012', '76', '7.6', 'B.TEch', '2016', '75', '7.5', 'NA', 'NA', 'NA', 'NA', 'NA', 'NA'),
(6, 6, 'CBSE', '2015', '91', '9', 'CBSE', '2017', '85', '8', 'LPU', '2021', '75', '7', 'LPU', '2023', '75', '7', 'NA', 'NA'),
(7, 7, 'CBSE', '2008', '85', '8', 'CBSE', '2010', '90', '9', 'BITS Pilani', '2014', '74', '7', 'BITS Pilani', '2016', '85', '8', 'NA', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `tblmessage`
--

CREATE TABLE `tblmessage` (
  `ID` int(10) NOT NULL,
  `AppID` int(10) DEFAULT NULL,
  `Message` mediumtext DEFAULT NULL,
  `Status` varchar(120) DEFAULT NULL,
  `ResponseDate` timestamp NULL DEFAULT current_timestamp(),
  `IsRead` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblmessage`
--

INSERT INTO `tblmessage` (`ID`, `AppID`, `Message`, `Status`, `ResponseDate`, `IsRead`) VALUES
(1, 8, ' This is sample text for testing.', 'Rejected', '2024-02-14 17:06:09', '1'),
(2, 10, ' Your application is sort listed.', 'Sorted', '2024-02-14 17:06:09', '1'),
(3, 6, 'Application rejected ', 'Rejected', '2024-02-17 05:13:07', '1'),
(4, 11, ' Application sorted. Ready for next round.', 'Sorted', '2024-02-17 12:24:00', '1'),
(5, 11, ' Your are selected for this position. CONGRATS', 'Selected', '2024-02-17 16:59:07', '1'),
(6, 11, ' Your are selected for this position. CONGRATS', 'Selected', '2024-02-17 17:00:27', NULL),
(7, 11, ' Your are selected for this position. CONGRATS', 'Selected', '2024-02-17 17:00:42', NULL),
(8, 12, ' Your Are sor listed for the next round.', 'Sorted', '2024-02-17 17:26:12', '1'),
(9, 12, ' Congrats, Your are selected for the job.', 'Selected', '2024-02-17 17:26:47', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(120) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`) VALUES
(1, 'aboutus', 'About Us', '                We are pleased to introduce ourselves as Spiderfocus, a professional placement services organization. We are a prominent Recruitment Firm offering out of the box Campus recruitment solutions to Institutes and colleges. With a vision to explore and harness the talents of young leaders, we have come up with a concept of Campus recruitment and promotion of institutes and colleges looking to place their fresh candidates.<div><br></div>', NULL, NULL, '2024-02-05 07:30:56'),
(2, 'contactus', 'Contact Us', '                H-126, By-Pass Road<div>New Delhi India</div>', 'info@gmail.com', 8988858695, '2024-02-05 07:30:56');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `StudentID` varchar(120) DEFAULT NULL,
  `Gender` varchar(120) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `Age` int(5) DEFAULT NULL,
  `DOB` varchar(120) DEFAULT NULL,
  `Image` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `UserRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `StudentID`, `Gender`, `Address`, `Age`, `DOB`, `Image`, `Password`, `UserRegdate`) VALUES
(1, 'Rahul Saxena', 'rahul@gmail.com', 8989898989, '567945', 'Male', 'H-456 Mayur Vihar', 26, '1990-05-01', '7fdc1a630c238af0815181f9faa190f51568183396.jpg', '202cb962ac59075b964b07152d234b70', '2024-02-08 06:08:37'),
(2, 'Farha Akthar', 'farha@gmail.com', 2525252525, '5657767', 'Female', '', 0, '', '', '202cb962ac59075b964b07152d234b70', '2024-02-08 06:08:37'),
(3, 'Akash Jain', 'jain@gmail.com', 6544646544, '667886768', 'Male', '', 0, '', '', '202cb962ac59075b964b07152d234b70', '2024-02-08 06:08:37'),
(4, 'Ginni Mishra', 'ginni@gmail.com', 3636363663, '7877878', 'Female', 'NA', 0, '2001-10-07', 'b4a648e83f2d35f1286e8d139c4f74e11570468215.jpg', '202cb962ac59075b964b07152d234b70', '2024-02-08 06:08:37'),
(5, 'Anuj kumar', 'ak@gmail.com', 6174512546, 'HGH32321', 'Male', '', 0, '', '', 'f925916e2754e5e03f75dd58a5733251', '2024-02-08 06:08:37'),
(6, 'ABC', 'abctest@gmail.com', 123458900, '2275462354', 'male', 'NA', 24, '2000-01-02', 'cdca08e46db5e08f28426946b9c1b8471570640216.png', 'f925916e2754e5e03f75dd58a5733251', '2024-02-08 06:08:37'),
(7, 'John Deo', 'johnde12@gmail.com', 1425632145, '10809125', 'Male', 'NA', 35, '1990-02-03', '2cc3663decc53df4367d8090dfee8a391708190742.png', 'f925916e2754e5e03f75dd58a5733251', '2024-02-17 17:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `tblvacancy`
--

CREATE TABLE `tblvacancy` (
  `ID` int(10) NOT NULL,
  `CompanyID` int(10) DEFAULT NULL,
  `JobTitle` varchar(200) DEFAULT NULL,
  `MonthlySalary` varchar(120) DEFAULT NULL,
  `JobDescriptions` mediumtext DEFAULT NULL,
  `NoofOpenings` varchar(50) DEFAULT NULL,
  `JobLocation` varchar(120) DEFAULT NULL,
  `ApplyDate` varchar(120) DEFAULT NULL,
  `LastDate` varchar(120) DEFAULT NULL,
  `JobpostingDate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvacancy`
--

INSERT INTO `tblvacancy` (`ID`, `CompanyID`, `JobTitle`, `MonthlySalary`, `JobDescriptions`, `NoofOpenings`, `JobLocation`, `ApplyDate`, `LastDate`, `JobpostingDate`) VALUES
(3, 2, 'Software Engineer/Senior Software Engineer C++', '10K-25K', 'Job Description\r\nSoftware Engineer/ Senior Software Engineer C++, Noida, India \r\n\r\nGeneral Description: \r\n\r\nObtaining in- depth understanding of design and implementation of existing software product. \r\n\r\nDesign, implement and deliver new features required in the product as per deadlines. \r\n\r\nApplying innovation and creativity in design and implementation of features. \r\n\r\nResolve issues observed during testing and usage of the product. \r\n\r\nDocument code consistently throughout the development process, perform thorough testing and take ownership. \r\n\r\nCandidate should be self- driven, motivated, innovative, good team player and open to feedback. \r\n\r\nWork Experience Requirements \r\n\r\nC++, VC++, Windows or Linux/ Unix Platform (C++ must). \r\n\r\nShould have strong programming skills in C++. \r\n\r\nShould be good in Software Design and Architecture. \r\n\r\nShould have very good Analytical skills \r\n\r\nResearch orientation in the area of Image/ Video Processing, Computer Vision, Pattern recognition and related domain. \r\n\r\nHave hands- on working experience in the area of Image/ Video Processing, Computer Vision, pattern Recognition and related domain (Preferred). \r\n', '10', 'Noida', '15-02-2024', '16-12-2024', '2024-02-08 13:06:15'),
(4, 2, 'Software Engineer, Senior Software Engineer, Module Lead', '25k-35k', 'ob Description\r\nBlue Prism Professionals | Xavient | Next- Gen Digital Solutions for Integrated Customer Experience Blue Prism Professionals - Total vacancies: 25 \r\n\r\nProposed Designation: Software Engineer, Senior Software Engineer, Module Lead \r\n\r\nDescription: Identifying and communicating the technical infrastructure requirements. Designing Blue Prism process solutions in accordance with standard Blue Prism design principles and conventions. \r\n\r\nConfiguring new Blue Prism processes and objects using core workflow principles that are efficient, well structured, maintainable and easy to understand. \r\n\r\nSupporting existing processes and implementing change requirements as part of a structured change control process. \r\n\r\nProblem solving issues that arise in day to day running of Blue Prism processes and providing timely responses and solutions as required. \r\n\r\nCommunicating with Blue Prism on software related issues, suggested improvements and participating with other users in the Blue Prism community. \r\n', '25', 'Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(5, 1, 'Sql Server Database Administrator', '15k-35k', 'The SQL Server DBA will be responsible for the implementation, configuration, maintenance, and performance of critical SQL Server RDBMS systems, to ensure the database availability catering to various applications. Provide 24x7 support for critical production systems Perform scheduled maintenance and support release deployment activities after hours. Skills and Qualifications 3 to 5 years MS SQL Server Administration experience required Excellent hand on managing SQL Server version 2005 to 2017 Experience with Performance Tuning and Optimization (PTO), using native monitoring and troubleshooting tools ( tracing, DMV, resource monitor etc. Experience with backups, restores and recovery models Experience with all kind of SQL Server troubleshooting activities Knowledge of All High Availability (HA) and Disaster Recovery (DR) options for SQL Server Excellent written and verbal communication Flexible, team player, get-it-done personality \r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: troubleshooting,  databases Other Skills: sql server,  ms sql server', '10', 'Jhandewalan ICICI Buliding, Delhi', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(6, 1, 'SQL QEUFM Software', '10K-25K', 'Job Description\r\nWe at HT Media are hiring developers who are good in python and data structures. Key skills required for the job are:1) Good knowledge of data structures 2) Aggregate of 65 in Academics in Xth, XII and B Tech 3) Must be a graduate in computer science.\r\n\r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: structures,  academics,  automata,  dbms,  addie,  sql,  python Other Skills: algorithm design,  new hire orientations,  algorithm analysis,  data structures,  theory of computation,  career development,  behavioral training,  project administration,  source insight,  training delivery,  socket programming,  gnu debugger,  discrete mathematics,  training needs analysis', '52', 'H-125 Shudha Buliding Banglore ', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(7, 3, 'Software Developer(Java/.Net/PHP)', '25k-35k', 'Job Description\r\nSoftware Engineer/ Senior Software Engineer C++, Noida, India \r\n\r\nGeneral Description: \r\n\r\nObtaining in- depth understanding of design and implementation of existing software product. \r\n\r\nDesign, implement and deliver new features required in the product as per deadlines. \r\n\r\nApplying innovation and creativity in design and implementation of features. \r\n\r\nResolve issues observed during testing and usage of the product. \r\n\r\nDocument code consistently throughout the development process, perform thorough testing and take ownership. \r\n\r\nCandidate should be self- driven, motivated, innovative, good team player and open to feedback. \r\n\r\nWork Experience Requirements \r\n\r\nC++, VC++, Windows or Linux/ Unix Platform (C++ must). \r\n\r\nShould have strong programming skills in C++. \r\n\r\nShould be good in Software Design and Architecture. \r\n\r\nShould have very good Analytical skills \r\n\r\nResearch orientation in the area of Image/ Video Processing, Computer Vision, Pattern recognition and related domain. \r\n\r\nHave hands- on working experience in the area of Image/ Video Processing, Computer Vision, pattern Recognition and related domain (Preferred). \r\n', '3', 'H-476 Noida Sector-12', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(8, 3, 'Sql Server Database Administrator', '10K-25K', 'The SQL Server DBA will be responsible for the implementation, configuration, maintenance, and performance of critical SQL Server RDBMS systems, to ensure the database availability catering to various applications. Provide 24x7 support for critical production systems Perform scheduled maintenance and support release deployment activities after hours. Skills and Qualifications 3 to 5 years MS SQL Server Administration experience required Excellent hand on managing SQL Server version 2005 to 2017 Experience with Performance Tuning and Optimization (PTO), using native monitoring and troubleshooting tools ( tracing, DMV, resource monitor etc. Experience with backups, restores and recovery models Experience with all kind of SQL Server troubleshooting activities Knowledge of All High Availability (HA) and Disaster Recovery (DR) options for SQL Server Excellent written and verbal communication Flexible, team player, get-it-done personality \r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: troubleshooting,  databases Other Skills: sql server,  ms sql server', '23', 'J-123 Sector 136 Greater Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(9, 3, 'SQL QEUFM Software', '10K-25K', 'Job Description\r\nWe at HT Media are hiring developers who are good in python and data structures. Key skills required for the job are:1) Good knowledge of data structures 2) Aggregate of 65 in Academics in Xth, XII and B Tech 3) Must be a graduate in computer science.\r\n\r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: structures,  academics,  automata,  dbms,  addie,  sql,  python Other Skills: algorithm design,  new hire orientations,  algorithm analysis,  data structures,  theory of computation,  career development,  behavioral training,  project administration,  source insight,  training delivery,  socket programming,  gnu debugger,  discrete mathematics,  training needs analysis', '12', 'K-12345, Sector 234 XYZ Banglore', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(10, 4, 'Software Engineer/Senior Software Engineer C++', '15k-35k', 'Job Description\r\nSoftware Engineer/ Senior Software Engineer C++, Noida, India \r\n\r\nGeneral Description: \r\n\r\nObtaining in- depth understanding of design and implementation of existing software product. \r\n\r\nDesign, implement and deliver new features required in the product as per deadlines. \r\n\r\nApplying innovation and creativity in design and implementation of features. \r\n\r\nResolve issues observed during testing and usage of the product. \r\n\r\nDocument code consistently throughout the development process, perform thorough testing and take ownership. \r\n\r\nCandidate should be self- driven, motivated, innovative, good team player and open to feedback. \r\n\r\nWork Experience Requirements \r\n\r\nC++, VC++, Windows or Linux/ Unix Platform (C++ must). \r\n\r\nShould have strong programming skills in C++. \r\n\r\nShould be good in Software Design and Architecture. \r\n\r\nShould have very good Analytical skills \r\n\r\nResearch orientation in the area of Image/ Video Processing, Computer Vision, Pattern recognition and related domain. \r\n\r\nHave hands- on working experience in the area of Image/ Video Processing, Computer Vision, pattern Recognition and related domain (Preferred). \r\n', '10', 'H-321 Sector 4 Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(11, 4, 'Software Engineer, Senior Software Engineer, Module Lead', '25k-35k', 'Job Description\r\nBlue Prism Professionals | Xavient | Next- Gen Digital Solutions for Integrated Customer Experience Blue Prism Professionals - Total vacancies: 25 \r\n\r\nProposed Designation: Software Engineer, Senior Software Engineer, Module Lead \r\n\r\nDescription: Identifying and communicating the technical infrastructure requirements. Designing Blue Prism process solutions in accordance with standard Blue Prism design principles and conventions. \r\n\r\nConfiguring new Blue Prism processes and objects using core workflow principles that are efficient, well structured, maintainable and easy to understand. \r\n\r\nSupporting existing processes and implementing change requirements as part of a structured change control process. \r\n\r\nProblem solving issues that arise in day to day running of Blue Prism processes and providing timely responses and solutions as required. \r\n\r\nCommunicating with Blue Prism on software related issues, suggested improvements and participating with other users in the Blue Prism community. \r\n', '10', 'H-321 Sector 4 Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(12, 4, 'Sql Server Database Administrator', '10K-25K', 'The SQL Server DBA will be responsible for the implementation, configuration, maintenance, and performance of critical SQL Server RDBMS systems, to ensure the database availability catering to various applications. Provide 24x7 support for critical production systems Perform scheduled maintenance and support release deployment activities after hours. Skills and Qualifications 3 to 5 years MS SQL Server Administration experience required Excellent hand on managing SQL Server version 2005 to 2017 Experience with Performance Tuning and Optimization (PTO), using native monitoring and troubleshooting tools ( tracing, DMV, resource monitor etc. Experience with backups, restores and recovery models Experience with all kind of SQL Server troubleshooting activities Knowledge of All High Availability (HA) and Disaster Recovery (DR) options for SQL Server Excellent written and verbal communication Flexible, team player, get-it-done personality \r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: troubleshooting,  databases Other Skills: sql server,  ms sql server', '25', 'H-321 Sector 4 Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(13, 4, 'SQL QEUFM Software', '10K-25K', 'Job Description\r\nWe at HT Media are hiring developers who are good in python and data structures. Key skills required for the job are:1) Good knowledge of data structures 2) Aggregate of 65 in Academics in Xth, XII and B Tech 3) Must be a graduate in computer science.\r\n\r\nOther details\r\nDepartment: Application Programming / Maintenance Industry: IT - Software Skills: structures,  academics,  automata,  dbms,  addie,  sql,  python Other Skills: algorithm design,  new hire orientations,  algorithm analysis,  data structures,  theory of computation,  career development,  behavioral training,  project administration,  source insight,  training delivery,  socket programming,  gnu debugger,  discrete mathematics,  training needs analysis', '10', 'H-321 Sector 4 Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(14, 5, 'Web Developer', '$25-30 k', 'PHP (Must)\r\nMySQL (Must)\r\nShould have knowledge of HTML,Bootstrap, and CSS ', '2', 'New Delhi India', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(15, 5, 'PHP Developer', '125641', 'Bachelor\'s degree in computer science or a similar field.\r\nKnowledge of PHP web frameworks including Yii, Laravel, and CodeIgniter\r\nKnowledge of front-end technologies including CSS3, JavaScript, and HTML5.\r\nUnderstanding of object-oriented PHP programming.\r\nPrevious experience creating scalable applications.\r\nFamiliarity with SQL/NoSQL databases.\r\nGood problem-solving skills.\r\nBasic understanding of NodeJS\r\nSomeone who is passionate about creating awesome user experiences and who loves to\r\ncode - A multifaceted role with a high degree of ownership and a broad spectrum of\r\nopportunities.', '2', 'Noida', '10-02-2024', '31-12-2024', '2024-02-08 13:06:15'),
(17, 6, 'WordPress Developer', '2000-3000k USD', 'WordPress Developer\r\nTheme Customization\r\nPlugin Development\r\n', '6', 'Bangalore India', '17-02-2024', '30-08-2024', '2024-02-17 22:52:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblapplyjob`
--
ALTER TABLE `tblapplyjob`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblcompany`
--
ALTER TABLE `tblcompany`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbleducation`
--
ALTER TABLE `tbleducation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblmessage`
--
ALTER TABLE `tblmessage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvacancy`
--
ALTER TABLE `tblvacancy`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblapplyjob`
--
ALTER TABLE `tblapplyjob`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcompany`
--
ALTER TABLE `tblcompany`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbleducation`
--
ALTER TABLE `tbleducation`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblmessage`
--
ALTER TABLE `tblmessage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblvacancy`
--
ALTER TABLE `tblvacancy`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
