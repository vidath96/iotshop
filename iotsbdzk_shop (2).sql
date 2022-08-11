-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 18, 2020 at 03:26 AM
-- Server version: 10.3.24-MariaDB-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vivodbms_db`
--
CREATE DATABASE IF NOT EXISTS `vivodbms_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `vivodbms_db`;

DELIMITER $$
--
-- Procedures
--
$$

$$

$$

$$

$$

$$

$$

--
-- Functions
--
$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `before_request_item`
--

CREATE TABLE `before_request_item` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `branch_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bill_history`
--

CREATE TABLE `bill_history` (
  `bill_no` varchar(8) NOT NULL,
  `branch` enum('branch1','branch2') NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `cashier_id` varchar(8) NOT NULL,
  `type` enum('cash','credit') NOT NULL,
  `bill_date` date NOT NULL,
  `amount` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_history`
--

INSERT INTO `bill_history` (`bill_no`, `branch`, `customer_id`, `cashier_id`, `type`, `bill_date`, `amount`) VALUES
('1', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-28', 359850.00),
('10', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00),
('11', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00),
('12', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 6500.00),
('13', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-29', 110000.00),
('14', 'branch1', '111111150v', 'user tes', 'credit', '2020-07-30', 32000.00),
('15', 'branch1', '111111150v', 'user tes', 'credit', '2020-07-30', 32000.00),
('16', 'branch1', '465666771v', 'user tes', 'credit', '2020-07-30', 32000.00),
('17', 'branch1', ' 465666771v', 'user tes', 'credit', '2020-07-30', 32000.00),
('18', 'branch1', '465666771v', 'user tes', 'credit', '2020-07-30', 32000.00),
('19', 'branch1', '963323409v', 'user tes', 'cash', '2020-09-21', 2750.00),
('2', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-28', 359850.00),
('20', 'branch1', '963323409v', 'user tes', 'credit', '2020-09-21', 1100.00),
('21', 'branch1', '947787452v', 'user tes', 'credit', '2020-09-21', 1100.00),
('22', 'branch1', '111111111v', 'user tes', 'cash', '2020-09-22', 110000.00),
('23', 'branch1', '963323409v', 'user tes', 'cash', '2020-09-22', 22000.00),
('24', 'branch1', '963323409v', 'user tes', 'cash', '2020-09-22', 22000.00),
('3', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-28', 359850.00),
('4', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-28', 5500.00),
('5', 'branch1', '111111111v', 'user tes', 'cash', '2020-07-28', 3250.00),
('6', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00),
('7', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00),
('8', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00),
('9', 'branch1', '963323409v', 'user tes', 'credit', '2020-07-28', 185050.00);

-- --------------------------------------------------------

--
-- Table structure for table `bill_item`
--

CREATE TABLE `bill_item` (
  `bill_no` varchar(8) NOT NULL,
  `item_code` char(9) NOT NULL,
  `quantity` int(3) NOT NULL,
  `branch` enum('branch1','branch2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_item`
--

INSERT INTO `bill_item` (`bill_no`, `item_code`, `quantity`, `branch`) VALUES
('1', 'PRCM001', 5, 'branch1'),
('1', 'PRCM002', 2, 'branch1'),
('2', 'PRCM001', 5, 'branch1'),
('2', 'PRCM002', 2, 'branch1'),
('3', 'PRCM001', 5, 'branch1'),
('3', 'PRCM002', 2, 'branch1'),
('4', 'PRCM001', 10, 'branch1'),
('5', 'PRCM003', 1, 'branch1'),
('6', 'PRCM003', 2, 'branch1'),
('6', 'PRCM002', 1, 'branch1'),
('7', 'PRCM003', 2, 'branch1'),
('7', 'PRCM002', 1, 'branch1'),
('8', 'PRCM003', 2, 'branch1'),
('8', 'PRCM002', 1, 'branch1'),
('9', 'PRCM003', 2, 'branch1'),
('9', 'PRCM002', 1, 'branch1'),
('10', 'PRCM003', 2, 'branch1'),
('10', 'PRCM002', 1, 'branch1'),
('11', 'PRCM003', 2, 'branch1'),
('11', 'PRCM002', 1, 'branch1'),
('12', 'PRCM003', 2, 'branch1'),
('13', 'PRMB002', 5, 'branch1'),
('14', 'PRMB001', 1, 'branch1'),
('15', 'PRMB001', 1, 'branch1'),
('16', 'PRMB001', 1, 'branch1'),
('17', 'PRMB001', 1, 'branch1'),
('18', 'PRMB001', 1, 'branch1'),
('19', 'PRCM001', 5, 'branch1'),
('20', 'PRCM001', 2, 'branch1'),
('21', 'PRCM001', 2, 'branch1'),
('22', 'PRMB002', 5, 'branch1'),
('23', 'PRMB002', 1, 'branch1'),
('24', 'PRMB002', 1, 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(3) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `address` varchar(225) NOT NULL,
  `contact_no` int(10) NOT NULL,
  `mac` char(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `address`, `contact_no`, `mac`) VALUES
(1, 'branch1', 'Walasmulla, Matara', 414578954, '23f57afe8e6831a4f6987df66754210e'),
(2, 'branch2', 'No45, Matara', 414587965, '410c3e1b62a684c37dfa8710eac9246c'),
(3, 'branch3', 'No:23,Deniyaya', 771233456, '537208d7c3247b2d6efe9068a6ac9400');

-- --------------------------------------------------------

--
-- Table structure for table `branch1_monthly_sales`
--

CREATE TABLE `branch1_monthly_sales` (
  `year` year(4) NOT NULL,
  `month` varchar(20) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `branch1_sales_history`
-- (See below for the actual view)
--
CREATE TABLE `branch1_sales_history` (
`bill_no` varchar(8)
,`customer_id` varchar(11)
,`cashier_id` varchar(8)
,`type` enum('cash','credit')
,`bill_date` date
,`amount` decimal(9,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `branch2_monthly_sales`
--

CREATE TABLE `branch2_monthly_sales` (
  `year` year(4) NOT NULL,
  `month` varchar(20) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `branch2_sales_history`
-- (See below for the actual view)
--
CREATE TABLE `branch2_sales_history` (
`bill_no` varchar(8)
,`customer_id` varchar(11)
,`cashier_id` varchar(8)
,`type` enum('cash','credit')
,`bill_date` date
,`amount` decimal(9,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `branch_1_store`
-- (See below for the actual view)
--
CREATE TABLE `branch_1_store` (
`item_code` varchar(9)
,`item_name` varchar(50)
,`item_description` varchar(225)
,`whole_sale_price` decimal(8,2)
,`retail_price` decimal(8,2)
,`stock` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `branch_2_sales_histry`
--

CREATE TABLE `branch_2_sales_histry` (
  `bill_no` varchar(8) DEFAULT NULL,
  `customer_id` varchar(11) DEFAULT NULL,
  `cashier_id` varchar(8) DEFAULT NULL,
  `type` enum('cash','credit') DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `branch_2_store`
-- (See below for the actual view)
--
CREATE TABLE `branch_2_store` (
`item_code` varchar(9)
,`item_name` varchar(50)
,`item_description` varchar(225)
,`whole_sale_price` decimal(8,2)
,`retail_price` decimal(8,2)
,`stock` int(4)
);

-- --------------------------------------------------------

--
-- Table structure for table `branch_sales_histry`
--

CREATE TABLE `branch_sales_histry` (
  `bill_no` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `nic` varchar(11) NOT NULL,
  `title` enum('Mr','Mrs','Miss','Ms') NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `address` varchar(240) NOT NULL,
  `dob` date NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `contact_no` int(10) NOT NULL,
  `contact_no_2` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`nic`, `title`, `full_name`, `nick_name`, `address`, `dob`, `gender`, `contact_no`, `contact_no_2`) VALUES
('181936565v', 'Miss', 'G.Sepalika Sandamali', 'Sanda', 'No:380 , Kaburupitiya , Matara', '2000-01-01', 'male', 711223578, 254785632),
('456665457v', 'Mr', 'k.l.kasun sameera', 'liyanage', 'No.2 ratnapura.', '1996-12-25', 'male', 711834260, 455587945),
('465666771v', 'Mr', 'Sajula Ravindu Illangasinghe', 'Sajja', 'Ravindu Hardware , Anuradhapura ', '1996-08-14', 'male', 712770953, 254601837),
('947787452v', 'Mr', 'Vidath Hasantha', 'Vidath', 'No45,Jaffna.', '1994-04-01', 'male', 714587895, 774587895),
('986578451v', 'Mrs', 'Kavindya Hingurage', 'Kavi', 'Kadawatha, Colombo.', '1996-11-27', 'female', 779872145, 714568541);

-- --------------------------------------------------------

--
-- Table structure for table `debitor`
--

CREATE TABLE `debitor` (
  `customer_id` varchar(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(150) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `amount` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `debitor_history`
--

CREATE TABLE `debitor_history` (
  `bill_no` varchar(8) NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `billed_date` date NOT NULL,
  `settled_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `debitor_history`
--

INSERT INTO `debitor_history` (`bill_no`, `customer_id`, `billed_date`, `settled_date`) VALUES
('B1000001', '947787452v', '2020-01-01', '2020-01-03'),
('B2000001', '986578451v', '2020-01-03', '2020-01-04');

-- --------------------------------------------------------

--
-- Table structure for table `grn_data`
--

CREATE TABLE `grn_data` (
  `id` int(11) NOT NULL,
  `grn_no` int(11) NOT NULL,
  `bill_no` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `branch` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grn_data`
--

INSERT INTO `grn_data` (`id`, `grn_no`, `bill_no`, `user_id`, `branch`) VALUES
(1, 1, 10415, 'user test', 'branch1'),
(2, 2, 10416, 'user test', 'branch1'),
(3, 3, 78012, 'user test', 'branch1'),
(4, 4, 45, 'user test', 'branch1'),
(5, 5, 1310, 'user test', 'branch1'),
(6, 6, 7, 'user test', 'branch1'),
(7, 7, 789, 'user test', 'branch1'),
(8, 8, 10, 'user test', 'branch1'),
(9, 9, 135, 'user test', 'branch1'),
(10, 10, 49, 'user test', 'branch1'),
(11, 11, 5, 'user test', 'branch1'),
(12, 12, 135, 'user test', 'branch1'),
(13, 13, 7, 'user test', 'branch1'),
(14, 14, 2, 'user test', 'branch1'),
(15, 15, 112, 'user test', 'branch1'),
(16, 16, 1, 'user test', 'branch1'),
(17, 17, 135, 'user test', 'branch1'),
(18, 18, 222336, 'user test', 'branch1'),
(19, 19, 10105, 'user test', 'branch1'),
(20, 20, 12, 'user test', 'branch1'),
(21, 21, 12356, 'user test', 'branch1'),
(22, 22, 10101010, 'user test', 'branch1'),
(23, 23, 232, 'user test', 'branch1'),
(24, 24, 123, 'user test', 'branch1'),
(25, 25, 1919, 'user test', 'branch1'),
(26, 26, 1010, 'user test', 'branch1'),
(27, 27, 123111, 'user test', 'branch1'),
(28, 28, 10, 'user test', 'branch1'),
(29, 29, 55, 'user test', 'branch1'),
(30, 30, 785, 'user test', 'branch1'),
(31, 31, 12564, 'user test', 'branch1'),
(32, 32, 7856, 'user test', 'branch1'),
(33, 32, 7856, 'user test', 'branch1'),
(34, 32, 7856, 'user test', 'branch1'),
(35, 32, 7856, 'user test', 'branch1'),
(36, 32, 7856, 'user test', 'branch1'),
(37, 37, 12456, 'user test', 'branch1'),
(38, 38, 102546, 'user test', 'branch1'),
(39, 39, 8975123, 'user test', 'branch1'),
(40, 40, 102369, 'user test', 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `grn_item`
--

CREATE TABLE `grn_item` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(100) NOT NULL,
  `whole_sale` int(11) NOT NULL,
  `retail` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `grn_no` varchar(50) NOT NULL,
  `branch_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grn_item`
--

INSERT INTO `grn_item` (`id`, `code`, `name`, `description`, `whole_sale`, `retail`, `qty`, `grn_no`, `branch_name`) VALUES
(1, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 1, '1', 'branch1'),
(2, 'PRDK001', 'Data cable', '5m', 75, 120, 30, '1', 'branch1'),
(3, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 5, '1', 'branch1'),
(4, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 2, '1', 'branch1'),
(5, 'PRKB001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 10, '2', 'branch1'),
(6, 'PRSP001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 3, '2', 'branch1'),
(7, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 2, '2', 'branch1'),
(8, 'PRDK001', 'Data cable', '5m', 75, 120, 10, '3', 'branch1'),
(9, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 3, '3', 'branch1'),
(10, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 7, '3', 'branch1'),
(11, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 1, '4', 'branch1'),
(12, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 1, '4', 'branch1'),
(13, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 1, '5', 'branch1'),
(14, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 1, '6', 'branch1'),
(15, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 1, '7', 'branch1'),
(16, 'PRDK001', 'Data cable', '5m', 75, 120, 5, '7', 'branch1'),
(17, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 8, '7', 'branch1'),
(18, 'PRKB001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 5, '8', 'branch1'),
(19, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 10, '8', 'branch1'),
(20, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 10, '9', 'branch1'),
(21, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 5, '9', 'branch1'),
(22, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 5, '10', 'branch1'),
(23, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 2, '11', 'branch1'),
(24, 'PRDK001', 'Data cable', '5m', 75, 120, 5, '12', 'branch1'),
(25, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 7, '13', 'branch1'),
(26, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 2, '14', 'branch1'),
(27, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 1, '15', 'branch1'),
(28, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 1, '16', 'branch1'),
(29, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 10, '17', 'branch1'),
(30, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 5, '17', 'branch1'),
(31, 'PRSP001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 4, '18', 'branch1'),
(32, 'PRDK001', 'Data cable', '5m', 75, 120, 10, '19', 'branch1'),
(33, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 5, '20', 'branch1'),
(34, 'PRKB001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 5, '21', 'branch1'),
(35, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 5, '22', 'branch1'),
(36, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 2, '23', 'branch1'),
(37, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 2, '23', 'branch1'),
(38, 'PRMN001', 'Samsung LCD Monitor', '17\" used. import from korian', 1750, 3250, 2, '23', 'branch1'),
(39, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 1, '24', 'branch1'),
(40, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 1, '24', 'branch1'),
(41, 'PRMB006', 'Apple 6s', 'with full set', 24000, 29500, 5, '25', 'branch1'),
(42, 'PRKB001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 10, '25', 'branch1'),
(43, 'PRMB006', 'Apple 6s', 'with full set', 24000, 29500, 1, '26', 'branch1'),
(44, 'PRSP001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 9, '27', 'branch1'),
(45, 'PRSP002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 45, '29', 'branch1'),
(46, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 3, '29', 'branch1'),
(47, 'PRMB006', 'Apple 6s', 'with full set', 24000, 29500, 3, '30', 'branch1'),
(48, 'PRMB002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 1, '31', 'branch1'),
(49, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 1, '31', 'branch1'),
(50, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 3, '32', 'branch1'),
(51, 'PRMB002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 2, '32', 'branch1'),
(52, 'PRCM001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 8, '37', 'branch1'),
(53, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 9, '37', 'branch1'),
(54, 'PRCM001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 3, '38', 'branch1'),
(55, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 1, '38', 'branch1'),
(56, 'PRMB002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 18000, 22000, 1, '39', 'branch1'),
(57, 'PRCM001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 5, '39', 'branch1'),
(58, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 1, '40', 'branch1'),
(59, 'PRCM001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 375, 550, 5, '40', 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `grn_main_data`
--

CREATE TABLE `grn_main_data` (
  `id` int(11) NOT NULL,
  `grn_no` int(11) NOT NULL,
  `sup_bill_no` varchar(20) NOT NULL,
  `user_id` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grn_main_data`
--

INSERT INTO `grn_main_data` (`id`, `grn_no`, `sup_bill_no`, `user_id`) VALUES
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 1, '5411', 'IOTSM01'),
(0, 20, '454', 'IOTSM01');

-- --------------------------------------------------------

--
-- Table structure for table `grn_main_items`
--

CREATE TABLE `grn_main_items` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(100) NOT NULL,
  `whole_sale` int(11) NOT NULL,
  `retail` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `grn_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grn_main_items`
--

INSERT INTO `grn_main_items` (`id`, `code`, `name`, `description`, `whole_sale`, `retail`, `qty`, `grn_no`) VALUES
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRCM002', 'Asus Laptop', 'core i7 laptop', 130000, 178550, -1, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, 0, '1'),
(0, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 29000, 32000, -2, '20');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_code` varchar(9) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(225) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `whole_sale_price` decimal(8,2) NOT NULL,
  `retail_price` decimal(8,2) NOT NULL,
  `category` varchar(10) NOT NULL,
  `status` varchar(7) NOT NULL,
  `qr_code` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_code`, `item_name`, `item_description`, `cost`, `whole_sale_price`, `retail_price`, `category`, `status`, `qr_code`) VALUES
('PRCM001', 'Keyboard Bluetooth', 'havic Keyboard Bluetooth', 216.50, 375.00, 550.00, 'computer', 'active', 'public/assets/qr_image/117677995.png'),
('PRCM002', 'Asus Laptop', 'core i7 laptop', 78930.00, 130000.00, 178550.00, 'computer', 'active', 'public/assets/qr_image/610757702.png'),
('PRCM003', 'Samsung LCD Monitor', '17\" used. import from Korea', 410.75, 1750.00, 3250.00, 'computer', 'active', 'public/assets/qr_image/1654092341.png'),
('PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 28000.00, 29000.00, 32000.00, 'mobile', 'active', 'public/assets/qr_image/1129453401.png'),
('PRMB002', 'Samsung S4', 'Storage 32gb, Ram 3gb', 16000.00, 18000.00, 22000.00, 'mobile', 'deleted', 'public/assets/qr_image/491170230.png'),
('PRMB003', 'Apple 6s', 'dadsadad', 100000.00, 100000.00, 119000.00, 'mobile', 'deleted', 'public/assets/qr_image/1941820213.png');

--
-- Triggers `item`
--
DELIMITER $$
CREATE TRIGGER `after_item_delete` AFTER DELETE ON `item` FOR EACH ROW BEGIN
INSERT INTO itemdel_log (item_code, item_name, item_description, cost, whole_sale_price, retail_price, category) VALUES(old.item_code, old.item_name, old.item_description, old.cost, old.whole_sale_price, old.retail_price, old.category);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `itemdel_log`
--

CREATE TABLE `itemdel_log` (
  `item_code` varchar(9) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(225) NOT NULL,
  `cost` decimal(8,2) NOT NULL,
  `whole_sale_price` decimal(8,2) NOT NULL,
  `retail_price` decimal(8,2) NOT NULL,
  `category` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemdel_log`
--

INSERT INTO `itemdel_log` (`item_code`, `item_name`, `item_description`, `cost`, `whole_sale_price`, `retail_price`, `category`) VALUES
('PRCM007', 'acer i3 cpu', 'import from china', 14785.50, 26500.00, 34550.00, 'computer');

-- --------------------------------------------------------

--
-- Stand-in structure for view `main_store`
-- (See below for the actual view)
--
CREATE TABLE `main_store` (
`item_code` varchar(9)
,`item_name` varchar(50)
,`item_description` varchar(225)
,`whole_sale_price` decimal(8,2)
,`retail_price` decimal(8,2)
,`stock` int(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `request_data`
--

CREATE TABLE `request_data` (
  `id` int(11) NOT NULL,
  `request_no` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `request_date` date NOT NULL,
  `approved_date` date NOT NULL,
  `status` enum('Pending','Settled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_data`
--

INSERT INTO `request_data` (`id`, `request_no`, `user_id`, `branch`, `request_date`, `approved_date`, `status`) VALUES
(1, 5, 'user test', 'branch1', '2020-07-31', '2020-09-21', 'Settled'),
(2, 5, 'user test', 'branch1', '2020-07-31', '2020-09-21', 'Settled'),
(3, 5, 'user test', 'branch1', '2020-07-31', '2020-09-21', 'Settled'),
(4, 10, 'user test', 'branch1', '2020-09-22', '2020-09-22', 'Settled');

-- --------------------------------------------------------

--
-- Table structure for table `request_data_temp`
--

CREATE TABLE `request_data_temp` (
  `id` int(11) NOT NULL,
  `request_no` int(11) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `request_date` date NOT NULL,
  `status` enum('Pending','Settled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_data_temp`
--

INSERT INTO `request_data_temp` (`id`, `request_no`, `user_id`, `branch`, `request_date`, `status`) VALUES
(1, 1, 'user test', 'branch1', '2020-07-31', 'Pending'),
(2, 2, 'user test', 'branch1', '2020-07-31', 'Pending'),
(3, 3, 'user test', 'branch1', '2020-07-31', 'Pending'),
(4, 3, 'user test', 'branch1', '2020-07-31', 'Pending'),
(6, 8, 'user test', 'branch1', '2020-09-21', 'Pending'),
(7, 9, 'user test', 'branch1', '2020-09-21', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `request_item`
--

CREATE TABLE `request_item` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `qty` int(11) NOT NULL,
  `request_no` varchar(50) NOT NULL,
  `branch_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_item`
--

INSERT INTO `request_item` (`id`, `code`, `name`, `qty`, `request_no`, `branch_name`) VALUES
(1, 'PRTB001', 'Samsung Tab', 17, '21', 'branch1'),
(2, 'PRCM002', 'Asus Laptop', 1, '5', 'branch1'),
(3, 'PRCM002', 'Asus Laptop', 1, '5', 'branch1'),
(4, 'PRCM002', 'Asus Laptop', 1, '5', 'branch1'),
(5, 'PRMB001', 'Huawei Nova 2i', 2, '10', 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `request_item_temp`
--

CREATE TABLE `request_item_temp` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `qty` int(11) NOT NULL,
  `request_no` varchar(50) NOT NULL,
  `branch_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_item_temp`
--

INSERT INTO `request_item_temp` (`id`, `code`, `name`, `qty`, `request_no`, `branch_name`) VALUES
(1, 'PRCM002', 'Asus Laptop', 1, '1', 'branch1'),
(2, 'PRCM003', 'Samsung LCD Monitor', 1, '2', 'branch1'),
(3, 'PRCM002', 'Asus Laptop', 3, '2', 'branch1'),
(7, 'PRMB002', 'Samsung S4', 3, '8', 'branch1'),
(8, 'PRCM002', 'Asus Laptop', 1, '8', 'branch1'),
(9, 'PRCM002', 'Asus Laptop', 3, '9', 'branch1'),
(10, 'PRCM003', 'Samsung LCD Monitor', 1, '9', 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `request_sup_data`
--

CREATE TABLE `request_sup_data` (
  `id` int(11) NOT NULL,
  `sbill_no` int(11) NOT NULL,
  `item_code` char(7) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `new_qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_sup_data`
--

INSERT INTO `request_sup_data` (`id`, `sbill_no`, `item_code`, `item_name`, `new_qty`) VALUES
(1, 1, 'PRMB001', 'Huawei Nova 2i', 15),
(2, 2, 'PRMB001', 'Huawei Nova 2i', 15),
(3, 3, 'PRMB001', 'Huawei Nova 2i', 10),
(4, 4, 'PRMB001', 'Huawei Nova 2i', 15),
(5, 5, 'PRMB001', 'Huawei Nova 2i', 15),
(6, 6, 'PRMB001', 'Huawei Nova 2i', 15),
(7, 7, 'PRMB001', 'Huawei Nova 2i', 10),
(8, 8, 'PRMB001', 'Huawei Nova 2i', 10),
(9, 9, 'PRMB001', 'Huawei Nova 2i', 10),
(10, 10, 'PRMB001', 'Huawei Nova 2i', 10),
(11, 11, 'PRMB001', 'Huawei Nova 2i', 10),
(12, 12, 'PRMB001', 'Huawei Nova 2i', 15),
(13, 13, 'PRMB001', 'Huawei Nova 2i', 11),
(14, 14, 'PRMB001', 'Huawei Nova 2i', 50);

-- --------------------------------------------------------

--
-- Table structure for table `request_sup_stock`
--

CREATE TABLE `request_sup_stock` (
  `sbill_no` int(11) NOT NULL,
  `recipient_name` varchar(225) NOT NULL,
  `recipient_mail` varchar(225) NOT NULL,
  `company_name` varchar(225) NOT NULL,
  `deliver_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request_sup_stock`
--

INSERT INTO `request_sup_stock` (`sbill_no`, `recipient_name`, `recipient_mail`, `company_name`, `deliver_date`) VALUES
(1, 'Vidath', 'vidathhasantha96@gmail.com', 'Test New', '2020-09-21 20:39:00'),
(2, 'sdfsfd', 'vidathhasantha96@gmail.com', 'Newcomp', '2020-09-21 20:53:00'),
(3, 'Vidath', 'vidathhasantha96@gmail.com', 'Newcomp', '2020-09-21 22:50:00'),
(4, 'sdfsf', 'vidathhasantha96@gmail.com', 'Newcomp', '2020-09-21 23:08:00'),
(5, 'sdfsf', 'vidathhasantha96@gmail.com', 'Newcomp', '2020-09-21 23:08:00'),
(6, 'sdfsf', 'vidathhasantha96@gmail.com', 'Newcomp', '2020-09-21 23:08:00'),
(7, 'sdgsg', 'vidathhasantha96@gmai.com', 'ABC', '2020-09-21 23:34:00'),
(8, 'sdgsg', 'vidathhasantha96@gmai.com', 'ABC', '2020-09-21 23:34:00'),
(9, 'sdgsg', 'vidathhasantha96@gmai.com', 'ABC', '2020-09-21 23:34:00'),
(10, 'sdgsg', 'vidathhasantha96@gmail.com', 'ABC', '2020-09-21 23:34:00'),
(11, 'sdgsg', 'vidathhasantha96@gmail.com', 'ABC', '2020-09-21 23:34:00'),
(12, 'Vidath', 'vidathhasantha96@gmail.com', 'ABC', '2020-09-21 23:41:00'),
(13, 'zcz', 'vidathhasantha69@gmail.com', 'sd', '2020-09-21 23:43:00'),
(14, 'Vidath', 'vidathhasantha96@gmail.com', 'VHS', '2020-09-22 14:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `return_sale`
--

CREATE TABLE `return_sale` (
  `id` int(11) NOT NULL,
  `srn_no` int(11) NOT NULL,
  `bill_no` varchar(8) NOT NULL,
  `reason` varchar(225) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `return_sale_item`
--

CREATE TABLE `return_sale_item` (
  `bill_no` varchar(8) NOT NULL,
  `item_code` char(9) NOT NULL,
  `quantity` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `return_sale_item`
--

INSERT INTO `return_sale_item` (`bill_no`, `item_code`, `quantity`) VALUES
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1),
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1),
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1),
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1),
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1),
('B1000001', 'PRSP001', 2),
('B2000001', 'PRSP002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `return_sale_temp`
--

CREATE TABLE `return_sale_temp` (
  `id` int(11) NOT NULL,
  `item_code` char(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `branch` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_mac`
--

CREATE TABLE `shop_mac` (
  `b_id` int(11) NOT NULL,
  `s_mac` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `item_code` char(9) NOT NULL,
  `main` int(5) NOT NULL,
  `branch_1` int(4) NOT NULL,
  `branch_2` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`item_code`, `main`, `branch_1`, `branch_2`) VALUES
('PRCM001', 1200, 102, 10),
('PRCM002', 318, 77, 11),
('PRCM003', 520, 39, 30),
('PRMB001', 6, 15, 14),
('PRMB002', 120, 12, 29);

-- --------------------------------------------------------

--
-- Table structure for table `temp_bill`
--

CREATE TABLE `temp_bill` (
  `id` int(11) NOT NULL,
  `item_code` varchar(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `branch` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_bill`
--

INSERT INTO `temp_bill` (`id`, `item_code`, `name`, `description`, `price`, `qty`, `total`, `branch`) VALUES
(11, 'PRMB001', 'Huawei Nova 2i', 'Storage 64gb, Ram 4gb', 32000.00, 1, 32000.00, 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `temp_grn`
--

CREATE TABLE `temp_grn` (
  `id` int(11) NOT NULL,
  `item_code` varchar(7) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(150) NOT NULL,
  `whole_sale_price` double NOT NULL,
  `retail_price` double NOT NULL,
  `branch` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_main_stock`
--

CREATE TABLE `temp_main_stock` (
  `id` int(11) NOT NULL,
  `item_code` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_main_stock`
--

INSERT INTO `temp_main_stock` (`id`, `item_code`) VALUES
(0, 'PRMB001');

-- --------------------------------------------------------

--
-- Table structure for table `temp_request`
--

CREATE TABLE `temp_request` (
  `id` int(11) NOT NULL,
  `item_code` varchar(7) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_description` varchar(150) NOT NULL,
  `whole_sale_price` double NOT NULL,
  `retail_price` double NOT NULL,
  `branch` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_request`
--

INSERT INTO `temp_request` (`id`, `item_code`, `item_name`, `item_description`, `whole_sale_price`, `retail_price`, `branch`) VALUES
(1, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 'branch1'),
(2, 'PRTB001', 'Samsung Tab', 'S301 samsung tab 10\"', 24350, 31500, 'branch1'),
(3, 'PRLP001', 'Asus Laptop', 'core i7 laptop', 130000, 178550, 'branch1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` char(7) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `nic` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` int(10) NOT NULL,
  `password` varchar(225) NOT NULL,
  `position` varchar(15) NOT NULL,
  `status` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `nic`, `address`, `gender`, `email`, `contact_no`, `password`, `position`, `status`) VALUES
('IOTAD01', 'HAritha', 'Praneeth', '963323409v', 'Walasmulla,Matara.', 'male', 'kavindupraneeth@gmail.com', 2147483647, '0192023a7bbd73250516f069df18b500', 'Admin', 'active'),
('IOTCA01', 'Bhathiya', 'Prakash', '963323408v', 'Walasmulla, Matara', 'male', 'bathiyaprakash96@gmail.com', 778975462, '136989baac262ea3f560297aab280c8d', 'Cashier', 'active'),
('IOTSM01', 'Vidath', 'Senadeera', '963323403v', 'Walasmulla,Matara.', 'male', 'kavindupraneeth@gmail.com', 711834260, 'dd7d940e5e6641cd61bc79a127c35412', 'SManager', 'active');

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `after_user_update` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
INSERT INTO userup_log (user_id, first_name, last_name, nic, address, gender, email, contact_no, password, position) VALUES(old.user_id, old.first_name, old.last_name, old.nic, old.address, old.gender, old.email, old.contact_no, old.password, old.position);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `userup_log`
--

CREATE TABLE `userup_log` (
  `user_id` char(7) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `nic` varchar(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` int(10) NOT NULL,
  `password` varchar(225) NOT NULL,
  `position` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userup_log`
--

INSERT INTO `userup_log` (`user_id`, `first_name`, `last_name`, `nic`, `address`, `gender`, `email`, `contact_no`, `password`, `position`) VALUES
('IOTAD01', 'Kavindu', 'Praneeth', '963323409v', 'Walasmulla,Matara.', 'male', 'kavindupraneeth@gmail.com', 2147483647, '0192023a7bbd73250516f069df18b500', 'Admin'),
('IOTSM01', 'Vidath', 'Senadeera', '963323403v', 'Walasmulla,Matara.', 'male', 'kavindupraneeth@gmail.com', 711834260, '0192023a7bbd73250516f069df18b500', 'Admin'),
('IOTSM01', 'Vidath', 'Senadeera', '963323403v', 'Walasmulla,Matara.', 'male', 'kavindupraneeth@gmail.com', 711834260, 'dd7d940e5e6641cd61bc79a127c35412', 'Admin');

-- --------------------------------------------------------

--
-- Structure for view `branch1_sales_history`
--
DROP TABLE IF EXISTS `branch1_sales_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`iotsbdzk`@`localhost` SQL SECURITY DEFINER VIEW `branch1_sales_history`  AS  select `bh`.`bill_no` AS `bill_no`,`bh`.`customer_id` AS `customer_id`,`bh`.`cashier_id` AS `cashier_id`,`bh`.`type` AS `type`,`bh`.`bill_date` AS `bill_date`,`bh`.`amount` AS `amount` from (`bill_history` `bh` join `return_sale` `rs`) where `bh`.`bill_no` <> `rs`.`bill_no` and `bh`.`branch` = 'Branch_1' ;

-- --------------------------------------------------------

--
-- Structure for view `branch2_sales_history`
--
DROP TABLE IF EXISTS `branch2_sales_history`;

CREATE ALGORITHM=UNDEFINED DEFINER=`iotsbdzk`@`localhost` SQL SECURITY DEFINER VIEW `branch2_sales_history`  AS  select `bh`.`bill_no` AS `bill_no`,`bh`.`customer_id` AS `customer_id`,`bh`.`cashier_id` AS `cashier_id`,`bh`.`type` AS `type`,`bh`.`bill_date` AS `bill_date`,`bh`.`amount` AS `amount` from (`bill_history` `bh` join `return_sale` `rs`) where `bh`.`bill_no` <> `rs`.`bill_no` and `bh`.`branch` = 'Branch_2' ;

-- --------------------------------------------------------

--
-- Structure for view `branch_1_store`
--
DROP TABLE IF EXISTS `branch_1_store`;

CREATE ALGORITHM=UNDEFINED DEFINER=`iotsbdzk`@`localhost` SQL SECURITY DEFINER VIEW `branch_1_store`  AS  select `it`.`item_code` AS `item_code`,`it`.`item_name` AS `item_name`,`it`.`item_description` AS `item_description`,`it`.`whole_sale_price` AS `whole_sale_price`,`it`.`retail_price` AS `retail_price`,`st`.`branch_1` AS `stock` from (`item` `it` join `stock` `st`) where `it`.`item_code` = `st`.`item_code` and `st`.`branch_1` > 0 ;

-- --------------------------------------------------------

--
-- Structure for view `branch_2_store`
--
DROP TABLE IF EXISTS `branch_2_store`;

CREATE ALGORITHM=UNDEFINED DEFINER=`iotsbdzk`@`localhost` SQL SECURITY DEFINER VIEW `branch_2_store`  AS  select `it`.`item_code` AS `item_code`,`it`.`item_name` AS `item_name`,`it`.`item_description` AS `item_description`,`it`.`whole_sale_price` AS `whole_sale_price`,`it`.`retail_price` AS `retail_price`,`st`.`branch_2` AS `stock` from (`item` `it` join `stock` `st`) where `it`.`item_code` = `st`.`item_code` and `st`.`branch_2` > 0 ;

-- --------------------------------------------------------

--
-- Structure for view `main_store`
--
DROP TABLE IF EXISTS `main_store`;

CREATE ALGORITHM=UNDEFINED DEFINER=`iotsbdzk`@`localhost` SQL SECURITY DEFINER VIEW `main_store`  AS  select `it`.`item_code` AS `item_code`,`it`.`item_name` AS `item_name`,`it`.`item_description` AS `item_description`,`it`.`whole_sale_price` AS `whole_sale_price`,`it`.`retail_price` AS `retail_price`,`st`.`main` AS `stock` from (`item` `it` join `stock` `st`) where `it`.`item_code` = `st`.`item_code` and `st`.`main` > 0 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `before_request_item`
--
ALTER TABLE `before_request_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_history`
--
ALTER TABLE `bill_history`
  ADD PRIMARY KEY (`bill_no`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`nic`);

--
-- Indexes for table `debitor`
--
ALTER TABLE `debitor`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `debitor_history`
--
ALTER TABLE `debitor_history`
  ADD PRIMARY KEY (`bill_no`);

--
-- Indexes for table `grn_data`
--
ALTER TABLE `grn_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grn_item`
--
ALTER TABLE `grn_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_code`);

--
-- Indexes for table `request_data`
--
ALTER TABLE `request_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_data_temp`
--
ALTER TABLE `request_data_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_item`
--
ALTER TABLE `request_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_item_temp`
--
ALTER TABLE `request_item_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_sup_data`
--
ALTER TABLE `request_sup_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_sup_stock`
--
ALTER TABLE `request_sup_stock`
  ADD PRIMARY KEY (`sbill_no`);

--
-- Indexes for table `return_sale`
--
ALTER TABLE `return_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_sale_temp`
--
ALTER TABLE `return_sale_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_mac`
--
ALTER TABLE `shop_mac`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`item_code`);

--
-- Indexes for table `temp_bill`
--
ALTER TABLE `temp_bill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_grn`
--
ALTER TABLE `temp_grn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_request`
--
ALTER TABLE `temp_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `nic` (`nic`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `before_request_item`
--
ALTER TABLE `before_request_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `grn_data`
--
ALTER TABLE `grn_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `grn_item`
--
ALTER TABLE `grn_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `request_data`
--
ALTER TABLE `request_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request_data_temp`
--
ALTER TABLE `request_data_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `request_item`
--
ALTER TABLE `request_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `request_item_temp`
--
ALTER TABLE `request_item_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_sup_data`
--
ALTER TABLE `request_sup_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `request_sup_stock`
--
ALTER TABLE `request_sup_stock`
  MODIFY `sbill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `return_sale`
--
ALTER TABLE `return_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_sale_temp`
--
ALTER TABLE `return_sale_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_bill`
--
ALTER TABLE `temp_bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `temp_grn`
--
ALTER TABLE `temp_grn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `temp_request`
--
ALTER TABLE `temp_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`iotsbdzk`@`localhost` EVENT `branch1_sales_of_month` ON SCHEDULE EVERY 1 MONTH STARTS '2020-08-01 00:00:01' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	DECLARE total_sales DECIMAL(10,2);
	SELECT SUM(amount) INTO  total_sales FROM bill_history 
	WHERE bill_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH,'%Y-%m-01') 
	AND bill_date < DATE_FORMAT(CURDATE(),'%Y-%m-01') AND branch = 'Branch_1'; 

	INSERT INTO branch1_monthly_sales VALUES (YEAR(CURDATE()),MONTHNAME(CURDATE() - INTERVAL 1 MONTH) , total_sales );
	
END$$

CREATE DEFINER=`iotsbdzk`@`localhost` EVENT `branch2_sales_of_month` ON SCHEDULE EVERY 1 MONTH STARTS '2020-08-01 00:00:01' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	DECLARE total_sales DECIMAL(12,2);
	SELECT SUM(amount) INTO  total_sales FROM bill_history 
	WHERE bill_date >= DATE_FORMAT(CURDATE() - INTERVAL 1 MONTH,'%Y-%m-01') 
	AND bill_date < DATE_FORMAT(CURDATE(),'%Y-%m-01')  AND branch = 'Branch_2'; 

	INSERT INTO branch2_monthly_sales VALUES (YEAR(CURDATE()),MONTHNAME(CURDATE() - INTERVAL 1 MONTH) , total_sales );
	
END$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
