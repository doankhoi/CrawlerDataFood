-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2015 at 11:42 AM
-- Server version: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cook_at_home`
--

-- --------------------------------------------------------

--
-- Table structure for table `cachnau`
--

CREATE TABLE IF NOT EXISTS `cachnau` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cachnau_monan`
--

CREATE TABLE IF NOT EXISTS `cachnau_monan` (
  `CachNau_id` int(11) NOT NULL,
  `MonAn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dipnau`
--

CREATE TABLE IF NOT EXISTS `dipnau` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `LoaiDipNau_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dipnau_has_monan`
--

CREATE TABLE IF NOT EXISTS `dipnau_has_monan` (
  `DipNau_id` int(11) NOT NULL,
  `MonAn_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loaidipnau`
--

CREATE TABLE IF NOT EXISTS `loaidipnau` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `monan`
--

CREATE TABLE IF NOT EXISTS `monan` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `material` text COLLATE utf8_unicode_ci,
  `prepare` text COLLATE utf8_unicode_ci,
  `tutorial` text COLLATE utf8_unicode_ci,
  `suggestion` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cachnau`
--
ALTER TABLE `cachnau`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cachnau_monan`
--
ALTER TABLE `cachnau_monan`
  ADD PRIMARY KEY (`CachNau_id`,`MonAn_id`),
  ADD KEY `fk_CachNau_has_MonAn_MonAn1_idx` (`MonAn_id`),
  ADD KEY `fk_CachNau_has_MonAn_CachNau_idx` (`CachNau_id`);

--
-- Indexes for table `dipnau`
--
ALTER TABLE `dipnau`
  ADD PRIMARY KEY (`id`,`LoaiDipNau_id`),
  ADD KEY `fk_DipNau_LoaiDipNau1_idx` (`LoaiDipNau_id`);

--
-- Indexes for table `dipnau_has_monan`
--
ALTER TABLE `dipnau_has_monan`
  ADD PRIMARY KEY (`DipNau_id`,`MonAn_id`),
  ADD KEY `fk_DipNau_has_MonAn_MonAn1_idx` (`MonAn_id`),
  ADD KEY `fk_DipNau_has_MonAn_DipNau1_idx` (`DipNau_id`);

--
-- Indexes for table `loaidipnau`
--
ALTER TABLE `loaidipnau`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `monan`
--
ALTER TABLE `monan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cachnau`
--
ALTER TABLE `cachnau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dipnau`
--
ALTER TABLE `dipnau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `loaidipnau`
--
ALTER TABLE `loaidipnau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `monan`
--
ALTER TABLE `monan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cachnau_monan`
--
ALTER TABLE `cachnau_monan`
  ADD CONSTRAINT `fk_CachNau_has_MonAn_CachNau` FOREIGN KEY (`CachNau_id`) REFERENCES `cachnau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CachNau_has_MonAn_MonAn1` FOREIGN KEY (`MonAn_id`) REFERENCES `monan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dipnau`
--
ALTER TABLE `dipnau`
  ADD CONSTRAINT `fk_DipNau_LoaiDipNau1` FOREIGN KEY (`LoaiDipNau_id`) REFERENCES `loaidipnau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dipnau_has_monan`
--
ALTER TABLE `dipnau_has_monan`
  ADD CONSTRAINT `fk_DipNau_has_MonAn_DipNau1` FOREIGN KEY (`DipNau_id`) REFERENCES `dipnau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DipNau_has_MonAn_MonAn1` FOREIGN KEY (`MonAn_id`) REFERENCES `monan` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
