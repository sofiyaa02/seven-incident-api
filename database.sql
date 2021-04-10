-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 10, 2021 at 08:47 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seven_tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `incident_category`
--

DROP TABLE IF EXISTS `incident_category`;
CREATE TABLE IF NOT EXISTS `incident_category` (
  `icategory_id` int(50) NOT NULL AUTO_INCREMENT,
  `icategory_name` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icategory_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`icategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incident_category`
--

INSERT INTO `incident_category` (`icategory_id`, `icategory_name`, `icategory_created`) VALUES
(1, 'Security', '2021-04-09 19:11:56'),
(2, 'Health & Safety', '2021-04-09 19:11:56'),
(3, 'Loss Prevention', '2021-04-09 19:12:11');

-- --------------------------------------------------------

--
-- Table structure for table `incident_details`
--

DROP TABLE IF EXISTS `incident_details`;
CREATE TABLE IF NOT EXISTS `incident_details` (
  `incident_id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `incident_cat_id` int(11) NOT NULL,
  `incident_lant` double NOT NULL,
  `incident_long` double NOT NULL,
  `incident_comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `incident_date` datetime NOT NULL,
  `incident_cdate` datetime NOT NULL,
  `incident_mdate` datetime NOT NULL,
  PRIMARY KEY (`incident_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `incident_details`
--

INSERT INTO `incident_details` (`incident_id`, `incident_title`, `incident_cat_id`, `incident_lant`, `incident_long`, `incident_comment`, `incident_date`, `incident_cdate`, `incident_mdate`) VALUES
(1, 'incident title 1', 1, 12.9231501, 74.7818517, 'This is a string of comments one', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(2, 'incident title 2', 1, 12.9231501, 74.7818517, 'This is a string of comments one', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(3, 'incident title 3', 1, 12.9231501, 74.7818517, 'This is a string of comments one', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(4, 'incident title 4', 1, 12.9231501, 74.7818517, 'This is a string of comments one', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59'),
(5, 'test title', 0, 0, 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'incident title', 2, 2, 2, 'This is a string of comments', '2020-09-01 13:26:00', '2021-04-10 07:53:02', '2020-09-01 13:32:59'),
(8, 'incident title', 1, 12.9231501, 74.7818517, 'This is a string of comments', '2020-09-01 13:26:00', '2020-09-01 13:32:59', '2020-09-01 13:32:59');

-- --------------------------------------------------------

--
-- Table structure for table `people_details`
--

DROP TABLE IF EXISTS `people_details`;
CREATE TABLE IF NOT EXISTS `people_details` (
  `p_id` int(50) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_incident_id` int(11) NOT NULL,
  `p_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `people_details`
--

INSERT INTO `people_details` (`p_id`, `p_name`, `p_type`, `p_incident_id`, `p_created`) VALUES
(1, 'Sofiya', 'staff', 1, '0000-00-00 00:00:00'),
(2, 'Sunil', 'witness', 1, '0000-00-00 00:00:00'),
(3, 'Manoj', 'staff', 1, '0000-00-00 00:00:00'),
(4, 'Sofiya', 'staff', 2, '0000-00-00 00:00:00'),
(5, 'Sunil', 'witness', 2, '0000-00-00 00:00:00'),
(6, 'Manoj', 'staff', 2, '0000-00-00 00:00:00'),
(7, 'Sofiya', 'staff', 3, '0000-00-00 00:00:00'),
(8, 'Sunil', 'witness', 3, '0000-00-00 00:00:00'),
(9, 'Manoj', 'staff', 3, '0000-00-00 00:00:00'),
(10, 'Sofiya', 'staff', 4, '0000-00-00 00:00:00'),
(11, 'Sunil', 'witness', 4, '0000-00-00 00:00:00'),
(12, 'Manoj', 'staff', 4, '0000-00-00 00:00:00'),
(16, 'Name of person', 'staff', 7, '0000-00-00 00:00:00'),
(17, 'Name of person', 'witness', 7, '0000-00-00 00:00:00'),
(18, 'Name of person', 'staff', 7, '0000-00-00 00:00:00'),
(19, 'Name of person', 'staff', 8, '2021-04-11 01:25:59'),
(20, 'Name of person', 'witness', 8, '2021-04-11 01:26:00'),
(21, 'Name of person', 'staff', 8, '2021-04-11 01:26:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
