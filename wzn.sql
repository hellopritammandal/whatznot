-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2021 at 01:51 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wzn`
--

-- --------------------------------------------------------

--
-- Table structure for table `getquote`
--

CREATE TABLE `getquote` (
  `sno` int(11) NOT NULL,
  `Name` varchar(80) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `mobile` text DEFAULT NULL,
  `msg` text DEFAULT NULL,
  `req` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `getquote`
--

INSERT INTO `getquote` (`sno`, `Name`, `email`, `mobile`, `msg`, `req`) VALUES
(2, 'test', 'test@gmail.com', '1236547890', 'Hey this is test', ''),
(3, 'test', 'test@gmail.com', '1236547890', 'Hey this is test', ''),
(4, 'pritam', 'pmihub@gmail.com', '2147483647', 'gjkabjkfjas', ''),
(5, 'cbxvbb', 'sdfsd@sfd.com', '458745', 'sdsafd', ''),
(6, 'ysdfydfsay', 'afdasf@hga.com', '456987', 'ouagdfiudas', ''),
(7, 'natta da', 'natta@gmail.com', '2147483647', 'test test test test test test test test test test ', ''),
(8, 'pritam', 'pmihub@gmail.com', '2147483647', 'test mail', ''),
(9, 'pritam', 'pmihub@gmail.com', '2147483647', 'test mail', ''),
(11, 'pritam', 'pmiha@gmail.com', '2147483647', 'test', ''),
(12, 'pritam', 'pmiha@gmail.com', '2147483647', 'test', ''),
(19, 'pritam', 'pmihub@gmail.com', '2147483647', 'this is test', ''),
(20, 'raj', 'raj@gmail.com', '123456', 'kjgfsgd', ''),
(24, 'pritam', 'pritamm246@gmail.com', '2147483647', 'hello', ''),
(25, 'ajob', 'ajob@bahutajob.com', '2147483647', 'hello', ''),
(26, 'asdg', 'ga@agd.com', '9735151074', 's;jfds', ''),
(27, 'jtyud', 'ukyf', '8436327900', 'ukyhf', ''),
(28, 'Pritam Mandal', 'mandal@pritam.com', '7908106907', 'How are you ? Good Morning .', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `getquote`
--
ALTER TABLE `getquote`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `getquote`
--
ALTER TABLE `getquote`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
