-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 27, 2023 at 04:58 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `code` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` float NOT NULL, 'discount' float NOT NULL DEFAULT 0,
  PRIMARY KEY (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`code`, `name`, `price`, 'discount',) VALUES
(1, 'Chitato Snack Potato Chips', 9000, 0.1),
(2, 'Qtela Keripik Singkong', 10000),
(3, 'Happytos Snack Tortilla', 12000, 0.3),
(4, 'Garuda Kacang Telur', 11000),
(5, 'Dua Kelinci Snack Pilus', 7000),
(6, 'Roti Tawar Sari Roti', 20000),
(7, 'Ultra Teh Kotak', 6000, 0.15),
(8, 'Yakult', 23000, 0.4),
(9, 'Energen Cereal', 13000),
(10, 'SilverQueen Almond', 12000),
(11, 'Wafer Chocolate', 7000, 0.1),
(12, 'Good Time Cookies', 8000),
(13, 'Yupi Breakfast', 14000, 0.3),
(14, 'Ice Cream Cornetto', 14000),
(15, 'Cha Cha', 8000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int NOT NULL,
  `total_harga` float NOT NULL,
  `total_bayar` float NOT NULL,
  `total_kembalian` int NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `total_harga`, `total_bayar`, `total_kembalian`) VALUES
(97332, 35000, 50000, 15000),
(419672, 27000, 30000, 3000),
(773459, 82000, 85000, 3000),
(190262, 8000, 15000, 7000),
(657129, 441000, 500000, 59000),
(384187, 63000, 65000, 2000),
(925595, 91000, 100000, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_barang`
--

DROP TABLE IF EXISTS `transaksi_barang`;
CREATE TABLE IF NOT EXISTS `transaksi_barang` (
  `id_transaksi` int NOT NULL,
  `id_barang` int NOT NULL,
  `jumlah_barang` int DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`,`id_barang`),
  KEY `id_barang` (`id_barang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id_transaksi`, `id_barang`, `jumlah_barang`) VALUES
(848181, 1, 1),
(199978, 2, 1),
(997931, 2, 1),
(997931, 3, 1),
(97332, 14, 1),
(97332, 5, 3),
(419672, 1, 3),
(773459, 13, 5),
(773459, 3, 1),
(190262, 12, 1),
(657129, 7, 8),
(657129, 13, 20),
(657129, 15, 3),
(657129, 9, 5),
(657129, 10, 2),
(384187, 13, 4),
(384187, 5, 1),
(925595, 3, 7),
(925595, 5, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
