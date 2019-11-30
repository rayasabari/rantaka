-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 30, 2019 at 09:34 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rantaka`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
CREATE TABLE IF NOT EXISTS `activations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `token`, `ip_address`, `created_at`, `updated_at`) VALUES
(1, 3, '2LMAZQyj1njBss5bcxU6E079ea2r0kroSb2qOrWwjiXUieoNek5xuLLO16TsCS1G', '127.0.0.1', '2019-11-27 06:10:06', '2019-11-27 06:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE IF NOT EXISTS `booking` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_properti` int(11) NOT NULL,
  `kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dp` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cicilan` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tgl_book` datetime NOT NULL,
  `tgl_expired` datetime NOT NULL,
  `id_status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `id_properti`, `kode`, `nama`, `alamat`, `no_hp`, `email`, `dp`, `cicilan`, `tgl_book`, `tgl_expired`, `id_status`, `created_at`, `updated_at`) VALUES
(4, 2, 'RHR191130064025', 'Raya Sabari', 'Jln. M. Kahfi II RT 004 RW 004\r\nCiganjur, Jagakarsa', '089630413336', 'rayavexed@gmail.com', '20', '5', '2019-11-30 18:40:25', '2019-11-30 21:40:25', 1, '2019-11-30 11:40:25', '2019-11-30 11:40:25'),
(3, 1, 'RHR191128091530', 'Raya Sabari', 'Jln. M. Kahfi II RT 004 RW 004\r\nCiganjur, Jagakarsa', '089630413336', 'rayavexed@gmail.com', '10', '10', '2019-11-28 21:15:30', '2019-11-29 00:15:30', 1, '2019-11-28 14:15:30', '2019-11-28 14:15:30'),
(5, 4, 'RHR191130091006', 'Raya Sabari', 'Jln. M. Kahfi II RT 004 RW 004\r\nCiganjur, Jagakarsa', '089630413336', 'rayavexed@gmail.com', '30', '25', '2019-11-30 21:10:06', '2019-12-01 00:10:06', 1, '2019-11-30 14:10:06', '2019-11-30 14:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel2step`
--

DROP TABLE IF EXISTS `laravel2step`;
CREATE TABLE IF NOT EXISTS `laravel2step` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `authCode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authCount` int(11) NOT NULL,
  `authStatus` tinyint(1) NOT NULL DEFAULT '0',
  `authDate` datetime DEFAULT NULL,
  `requestDate` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `laravel2step_userid_index` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laravel_blocker`
--

DROP TABLE IF EXISTS `laravel_blocker`;
CREATE TABLE IF NOT EXISTS `laravel_blocker` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `typeId` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci,
  `userId` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_value_unique` (`value`),
  KEY `laravel_blocker_typeid_index` (`typeId`),
  KEY `laravel_blocker_userid_index` (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_blocker`
--

INSERT INTO `laravel_blocker` (`id`, `typeId`, `value`, `note`, `userId`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'test.com', 'Block all domains/emails @test.com', NULL, '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(2, 3, 'test.ca', 'Block all domains/emails @test.ca', NULL, '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(3, 3, 'fake.com', 'Block all domains/emails @fake.com', NULL, '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(4, 3, 'example.com', 'Block all domains/emails @example.com', NULL, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(5, 3, 'mailinator.com', 'Block all domains/emails @mailinator.com', NULL, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laravel_blocker_types`
--

DROP TABLE IF EXISTS `laravel_blocker_types`;
CREATE TABLE IF NOT EXISTS `laravel_blocker_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `laravel_blocker_types_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_blocker_types`
--

INSERT INTO `laravel_blocker_types` (`id`, `slug`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'email', 'E-mail', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(2, 'ipAddress', 'IP Address', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(3, 'domain', 'Domain Name', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(4, 'user', 'User', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(5, 'city', 'City', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(6, 'state', 'State', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(7, 'country', 'Country', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(8, 'countryCode', 'Country Code', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(9, 'continent', 'Continent', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL),
(10, 'region', 'Region', '2019-11-27 04:12:19', '2019-11-27 04:12:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laravel_logger_activity`
--

DROP TABLE IF EXISTS `laravel_logger_activity`;
CREATE TABLE IF NOT EXISTS `laravel_logger_activity` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `userType` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `route` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` longtext COLLATE utf8mb4_unicode_ci,
  `methodType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laravel_logger_activity`
--

INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Logged In', 'Registered', 4, 'http://rantaka.local/register', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/register', 'POST', '2019-11-27 06:11:43', '2019-11-27 06:11:43', NULL),
(2, 'Viewed activate', 'Registered', 4, 'http://rantaka.local/activate', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/register', 'GET', '2019-11-27 06:11:43', '2019-11-27 06:11:43', NULL),
(3, 'Viewed activate/u2vaRXFF1ytePTDR5P9lXhyUtuGTEsQOQ0TGNw2dBOl8iMCd38uyhTiz9oMJy6kf', 'Registered', 4, 'http://rantaka.local/activate/u2vaRXFF1ytePTDR5P9lXhyUtuGTEsQOQ0TGNw2dBOl8iMCd38uyhTiz9oMJy6kf', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-27 06:12:01', '2019-11-27 06:12:01', NULL),
(4, 'Viewed home', 'Registered', 4, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-27 06:12:02', '2019-11-27 06:12:02', NULL),
(5, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-27 19:42:18', '2019-11-27 19:42:18', NULL),
(6, 'Viewed activate', 'Registered', 1, 'http://rantaka.local/activate', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-27 19:42:18', '2019-11-27 19:42:18', NULL),
(7, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-27 19:42:19', '2019-11-27 19:42:19', NULL),
(8, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-28 01:57:32', '2019-11-28 01:57:32', NULL),
(9, 'Logged Out', 'Registered', 1, 'http://rantaka.local/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'POST', '2019-11-28 01:57:36', '2019-11-28 01:57:36', NULL),
(10, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-28 01:58:06', '2019-11-28 01:58:06', NULL),
(11, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-28 01:58:06', '2019-11-28 01:58:06', NULL),
(12, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-29 03:53:58', '2019-11-29 03:53:58', NULL),
(13, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 03:53:58', '2019-11-29 03:53:58', NULL),
(14, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 03:54:43', '2019-11-29 03:54:43', NULL),
(15, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 03:54:50', '2019-11-29 03:54:50', NULL),
(16, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 03:55:45', '2019-11-29 03:55:45', NULL),
(17, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 03:56:00', '2019-11-29 03:56:00', NULL),
(18, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 03:58:16', '2019-11-29 03:58:16', NULL),
(19, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 04:13:14', '2019-11-29 04:13:14', NULL),
(20, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 04:17:21', '2019-11-29 04:17:21', NULL),
(21, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 04:21:07', '2019-11-29 04:21:07', NULL),
(22, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 04:22:12', '2019-11-29 04:22:12', NULL),
(23, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 04:27:22', '2019-11-29 04:27:22', NULL),
(24, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:16:35', '2019-11-29 06:16:35', NULL),
(25, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:18:14', '2019-11-29 06:18:14', NULL),
(26, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:19:21', '2019-11-29 06:19:21', NULL),
(27, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:21:20', '2019-11-29 06:21:20', NULL),
(28, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:23:26', '2019-11-29 06:23:26', NULL),
(29, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:25:06', '2019-11-29 06:25:06', NULL),
(30, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:25:09', '2019-11-29 06:25:09', NULL),
(31, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:26:16', '2019-11-29 06:26:16', NULL),
(32, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:26:31', '2019-11-29 06:26:31', NULL),
(33, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:26:52', '2019-11-29 06:26:52', NULL),
(34, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:26:54', '2019-11-29 06:26:54', NULL),
(35, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:27:16', '2019-11-29 06:27:16', NULL),
(36, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:27:38', '2019-11-29 06:27:38', NULL),
(37, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:36:26', '2019-11-29 06:36:26', NULL),
(38, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:38:08', '2019-11-29 06:38:08', NULL),
(39, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:38:28', '2019-11-29 06:38:28', NULL),
(40, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:40:21', '2019-11-29 06:40:21', NULL),
(41, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:43:54', '2019-11-29 06:43:54', NULL),
(42, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:45:07', '2019-11-29 06:45:07', NULL),
(43, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:47:55', '2019-11-29 06:47:55', NULL),
(44, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:48:16', '2019-11-29 06:48:16', NULL),
(45, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:49:05', '2019-11-29 06:49:05', NULL),
(46, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:49:07', '2019-11-29 06:49:07', NULL),
(47, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:50:28', '2019-11-29 06:50:28', NULL),
(48, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:50:40', '2019-11-29 06:50:40', NULL),
(49, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:51:00', '2019-11-29 06:51:00', NULL),
(50, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:51:14', '2019-11-29 06:51:14', NULL),
(51, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 06:52:15', '2019-11-29 06:52:15', NULL),
(52, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:07:09', '2019-11-29 07:07:09', NULL),
(53, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:17:41', '2019-11-29 07:17:41', NULL),
(54, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:19:16', '2019-11-29 07:19:16', NULL),
(55, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:20:42', '2019-11-29 07:20:42', NULL),
(56, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:21:00', '2019-11-29 07:21:00', NULL),
(57, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:21:41', '2019-11-29 07:21:41', NULL),
(58, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:40:08', '2019-11-29 07:40:08', NULL),
(59, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:40:40', '2019-11-29 07:40:40', NULL),
(60, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:41:19', '2019-11-29 07:41:19', NULL),
(61, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:42:28', '2019-11-29 07:42:28', NULL),
(62, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:45:37', '2019-11-29 07:45:37', NULL),
(63, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:53:33', '2019-11-29 07:53:33', NULL),
(64, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:54:55', '2019-11-29 07:54:55', NULL),
(65, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:56:18', '2019-11-29 07:56:18', NULL),
(66, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:56:23', '2019-11-29 07:56:23', NULL),
(67, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:58:56', '2019-11-29 07:58:56', NULL),
(68, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 07:59:02', '2019-11-29 07:59:02', NULL),
(69, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 08:00:28', '2019-11-29 08:00:28', NULL),
(70, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 08:01:57', '2019-11-29 08:01:57', NULL),
(71, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:01:59', '2019-11-29 08:01:59', NULL),
(72, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 08:03:50', '2019-11-29 08:03:50', NULL),
(73, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:03:53', '2019-11-29 08:03:53', NULL),
(74, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:04:13', '2019-11-29 08:04:13', NULL),
(75, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:05:14', '2019-11-29 08:05:14', NULL),
(76, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:06:02', '2019-11-29 08:06:02', NULL),
(77, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:06:07', '2019-11-29 08:06:07', NULL),
(78, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 08:06:10', '2019-11-29 08:06:10', NULL),
(79, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:06:33', '2019-11-29 08:06:33', NULL),
(80, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:08:20', '2019-11-29 08:08:20', NULL),
(81, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:08:25', '2019-11-29 08:08:25', NULL),
(82, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:09:06', '2019-11-29 08:09:06', NULL),
(83, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:09:09', '2019-11-29 08:09:09', NULL),
(84, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:09:19', '2019-11-29 08:09:19', NULL),
(85, 'Viewed themes', 'Registered', 1, 'http://rantaka.local/themes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:09:31', '2019-11-29 08:09:31', NULL),
(86, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:09:35', '2019-11-29 08:09:35', NULL),
(87, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:09:42', '2019-11-29 08:09:42', NULL),
(88, 'Viewed themes', 'Registered', 1, 'http://rantaka.local/themes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:10:47', '2019-11-29 08:10:47', NULL),
(89, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/themes', 'GET', '2019-11-29 08:10:50', '2019-11-29 08:10:50', NULL),
(90, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:11:21', '2019-11-29 08:11:21', NULL),
(91, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:12:07', '2019-11-29 08:12:07', NULL),
(92, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:12:21', '2019-11-29 08:12:21', NULL),
(93, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:12:57', '2019-11-29 08:12:57', NULL),
(94, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:14:08', '2019-11-29 08:14:08', NULL),
(95, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:14:32', '2019-11-29 08:14:32', NULL),
(96, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:15:41', '2019-11-29 08:15:41', NULL),
(97, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:24:12', '2019-11-29 08:24:12', NULL),
(98, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:27:13', '2019-11-29 08:27:13', NULL),
(99, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:27:22', '2019-11-29 08:27:22', NULL),
(100, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:27:38', '2019-11-29 08:27:38', NULL),
(101, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:28:26', '2019-11-29 08:28:26', NULL),
(102, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:31:29', '2019-11-29 08:31:29', NULL),
(103, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:32:03', '2019-11-29 08:32:03', NULL),
(104, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:12', '2019-11-29 08:32:12', NULL),
(105, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:16', '2019-11-29 08:32:16', NULL),
(106, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:19', '2019-11-29 08:32:19', NULL),
(107, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:32:22', '2019-11-29 08:32:22', NULL),
(108, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:24', '2019-11-29 08:32:24', NULL),
(109, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:32:27', '2019-11-29 08:32:27', NULL),
(110, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:51', '2019-11-29 08:32:51', NULL),
(111, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:54', '2019-11-29 08:32:54', NULL),
(112, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:32:57', '2019-11-29 08:32:57', NULL),
(113, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:33:54', '2019-11-29 08:33:54', NULL),
(114, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:33:57', '2019-11-29 08:33:57', NULL),
(115, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:34:02', '2019-11-29 08:34:02', NULL),
(116, 'Viewed activity', 'Registered', 1, 'http://rantaka.local/activity', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:34:08', '2019-11-29 08:34:08', NULL),
(117, 'Viewed phpinfo', 'Registered', 1, 'http://rantaka.local/phpinfo', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/activity', 'GET', '2019-11-29 08:34:14', '2019-11-29 08:34:14', NULL),
(118, 'Viewed active-users', 'Registered', 1, 'http://rantaka.local/active-users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/phpinfo', 'GET', '2019-11-29 08:34:17', '2019-11-29 08:34:17', NULL),
(119, 'Viewed blocker', 'Registered', 1, 'http://rantaka.local/blocker', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/active-users', 'GET', '2019-11-29 08:34:20', '2019-11-29 08:34:20', NULL),
(120, 'Viewed routes', 'Registered', 1, 'http://rantaka.local/routes', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/blocker', 'GET', '2019-11-29 08:34:36', '2019-11-29 08:34:36', NULL),
(121, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/routes', 'GET', '2019-11-29 08:35:17', '2019-11-29 08:35:17', NULL),
(122, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:35:20', '2019-11-29 08:35:20', NULL),
(123, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:35:22', '2019-11-29 08:35:22', NULL),
(124, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:45:08', '2019-11-29 08:45:08', NULL),
(125, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:45:38', '2019-11-29 08:45:38', NULL),
(126, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:45:40', '2019-11-29 08:45:40', NULL),
(127, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:45:50', '2019-11-29 08:45:50', NULL),
(128, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:45:52', '2019-11-29 08:45:52', NULL),
(129, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:46:45', '2019-11-29 08:46:45', NULL),
(130, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:47:01', '2019-11-29 08:47:01', NULL),
(131, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:47:04', '2019-11-29 08:47:04', NULL),
(132, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:47:07', '2019-11-29 08:47:07', NULL),
(133, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:48:53', '2019-11-29 08:48:53', NULL),
(134, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:49:02', '2019-11-29 08:49:02', NULL),
(135, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:49:04', '2019-11-29 08:49:04', NULL),
(136, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:49:06', '2019-11-29 08:49:06', NULL),
(137, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:49:47', '2019-11-29 08:49:47', NULL),
(138, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:50:34', '2019-11-29 08:50:34', NULL),
(139, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:51:35', '2019-11-29 08:51:35', NULL),
(140, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:52:23', '2019-11-29 08:52:23', NULL),
(141, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:53:23', '2019-11-29 08:53:23', NULL),
(142, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:53:34', '2019-11-29 08:53:34', NULL),
(143, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:53:46', '2019-11-29 08:53:46', NULL),
(144, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:55:29', '2019-11-29 08:55:29', NULL),
(145, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:56:02', '2019-11-29 08:56:02', NULL),
(146, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 08:57:00', '2019-11-29 08:57:00', NULL),
(147, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:57:08', '2019-11-29 08:57:08', NULL),
(148, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:57:10', '2019-11-29 08:57:10', NULL),
(149, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:57:19', '2019-11-29 08:57:19', NULL),
(150, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 08:59:17', '2019-11-29 08:59:17', NULL),
(151, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:59:33', '2019-11-29 08:59:33', NULL),
(152, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 08:59:41', '2019-11-29 08:59:41', NULL),
(153, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 08:59:43', '2019-11-29 08:59:43', NULL),
(154, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:00:59', '2019-11-29 09:00:59', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(155, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:01:09', '2019-11-29 09:01:09', NULL),
(156, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:01:12', '2019-11-29 09:01:12', NULL),
(157, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:07:39', '2019-11-29 09:07:39', NULL),
(158, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:07:57', '2019-11-29 09:07:57', NULL),
(159, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:08:22', '2019-11-29 09:08:22', NULL),
(160, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:08:27', '2019-11-29 09:08:27', NULL),
(161, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:08:38', '2019-11-29 09:08:38', NULL),
(162, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:08:57', '2019-11-29 09:08:57', NULL),
(163, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:09:09', '2019-11-29 09:09:09', NULL),
(164, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:09:14', '2019-11-29 09:09:14', NULL),
(165, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:09:16', '2019-11-29 09:09:16', NULL),
(166, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:10:04', '2019-11-29 09:10:04', NULL),
(167, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:10:16', '2019-11-29 09:10:16', NULL),
(168, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:10:24', '2019-11-29 09:10:24', NULL),
(169, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:10:26', '2019-11-29 09:10:26', NULL),
(170, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:10:44', '2019-11-29 09:10:44', NULL),
(171, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:10:46', '2019-11-29 09:10:46', NULL),
(172, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:10:50', '2019-11-29 09:10:50', NULL),
(173, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:10:52', '2019-11-29 09:10:52', NULL),
(174, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:12:02', '2019-11-29 09:12:02', NULL),
(175, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:12:28', '2019-11-29 09:12:28', NULL),
(176, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:12:30', '2019-11-29 09:12:30', NULL),
(177, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:12:32', '2019-11-29 09:12:32', NULL),
(178, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:13:30', '2019-11-29 09:13:30', NULL),
(179, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:13:34', '2019-11-29 09:13:34', NULL),
(180, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:13:35', '2019-11-29 09:13:35', NULL),
(181, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:13:40', '2019-11-29 09:13:40', NULL),
(182, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:13:43', '2019-11-29 09:13:43', NULL),
(183, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:13:46', '2019-11-29 09:13:46', NULL),
(184, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:13:46', '2019-11-29 09:13:46', NULL),
(185, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:13:56', '2019-11-29 09:13:56', NULL),
(186, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:13:59', '2019-11-29 09:13:59', NULL),
(187, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:14:00', '2019-11-29 09:14:00', NULL),
(188, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:14:02', '2019-11-29 09:14:02', NULL),
(189, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:14:06', '2019-11-29 09:14:06', NULL),
(190, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:15:33', '2019-11-29 09:15:33', NULL),
(191, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:18:05', '2019-11-29 09:18:05', NULL),
(192, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 09:19:06', '2019-11-29 09:19:06', NULL),
(193, 'Logged Out', 'Registered', 1, 'http://rantaka.local/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'POST', '2019-11-29 09:19:13', '2019-11-29 09:19:13', NULL),
(194, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-29 09:19:28', '2019-11-29 09:19:28', NULL),
(195, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 09:19:28', '2019-11-29 09:19:28', NULL),
(196, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 09:21:43', '2019-11-29 09:21:43', NULL),
(197, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 09:21:52', '2019-11-29 09:21:52', NULL),
(198, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 09:22:02', '2019-11-29 09:22:02', NULL),
(199, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 09:22:26', '2019-11-29 09:22:26', NULL),
(200, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:22:29', '2019-11-29 09:22:29', NULL),
(201, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:22:31', '2019-11-29 09:22:31', NULL),
(202, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:22:39', '2019-11-29 09:22:39', NULL),
(203, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:22:58', '2019-11-29 09:22:58', NULL),
(204, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:23:07', '2019-11-29 09:23:07', NULL),
(205, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:23:16', '2019-11-29 09:23:16', NULL),
(206, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:24:34', '2019-11-29 09:24:34', NULL),
(207, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:24:46', '2019-11-29 09:24:46', NULL),
(208, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:26:43', '2019-11-29 09:26:43', NULL),
(209, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:27:49', '2019-11-29 09:27:49', NULL),
(210, 'Edited users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'PUT', '2019-11-29 09:28:26', '2019-11-29 09:28:26', NULL),
(211, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:28:26', '2019-11-29 09:28:26', NULL),
(212, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:28:39', '2019-11-29 09:28:39', NULL),
(213, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:30:00', '2019-11-29 09:30:00', NULL),
(214, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:30:19', '2019-11-29 09:30:19', NULL),
(215, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:30:46', '2019-11-29 09:30:46', NULL),
(216, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:33:01', '2019-11-29 09:33:01', NULL),
(217, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:33:14', '2019-11-29 09:33:14', NULL),
(218, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:33:18', '2019-11-29 09:33:18', NULL),
(219, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:34:40', '2019-11-29 09:34:40', NULL),
(220, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:39:34', '2019-11-29 09:39:34', NULL),
(221, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:42:57', '2019-11-29 09:42:57', NULL),
(222, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:43:11', '2019-11-29 09:43:11', NULL),
(223, 'Edited users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'PUT', '2019-11-29 09:43:21', '2019-11-29 09:43:21', NULL),
(224, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:43:22', '2019-11-29 09:43:22', NULL),
(225, 'Edited users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'PUT', '2019-11-29 09:43:31', '2019-11-29 09:43:31', NULL),
(226, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:43:32', '2019-11-29 09:43:32', NULL),
(227, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:43:47', '2019-11-29 09:43:47', NULL),
(228, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:44:14', '2019-11-29 09:44:14', NULL),
(229, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:44:18', '2019-11-29 09:44:18', NULL),
(230, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:45:07', '2019-11-29 09:45:07', NULL),
(231, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:45:21', '2019-11-29 09:45:21', NULL),
(232, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:45:21', '2019-11-29 09:45:21', NULL),
(233, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:45:24', '2019-11-29 09:45:24', NULL),
(234, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:45:50', '2019-11-29 09:45:50', NULL),
(235, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:45:54', '2019-11-29 09:45:54', NULL),
(236, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:45:55', '2019-11-29 09:45:55', NULL),
(237, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:46:09', '2019-11-29 09:46:09', NULL),
(238, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:47:14', '2019-11-29 09:47:14', NULL),
(239, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Mobile Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:47:42', '2019-11-29 09:47:42', NULL),
(240, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:48:32', '2019-11-29 09:48:32', NULL),
(241, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:48:52', '2019-11-29 09:48:52', NULL),
(242, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:49:02', '2019-11-29 09:49:02', NULL),
(243, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:49:24', '2019-11-29 09:49:24', NULL),
(244, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 09:49:36', '2019-11-29 09:49:36', NULL),
(245, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:49:38', '2019-11-29 09:49:38', NULL),
(246, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:50:18', '2019-11-29 09:50:18', NULL),
(247, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:50:23', '2019-11-29 09:50:23', NULL),
(248, 'Edited users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'PUT', '2019-11-29 09:50:27', '2019-11-29 09:50:27', NULL),
(249, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:50:28', '2019-11-29 09:50:28', NULL),
(250, 'Edited users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'PUT', '2019-11-29 09:50:34', '2019-11-29 09:50:34', NULL),
(251, 'Viewed users/1/edit', 'Registered', 1, 'http://rantaka.local/users/1/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:50:34', '2019-11-29 09:50:34', NULL),
(252, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:50:41', '2019-11-29 09:50:41', NULL),
(253, 'Viewed users/1', 'Registered', 1, 'http://rantaka.local/users/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:51:10', '2019-11-29 09:51:10', NULL),
(254, 'Viewed users/2', 'Registered', 1, 'http://rantaka.local/users/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:51:29', '2019-11-29 09:51:29', NULL),
(255, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/1/edit', 'GET', '2019-11-29 09:52:33', '2019-11-29 09:52:33', NULL),
(256, 'Deleted users/4', 'Registered', 1, 'http://rantaka.local/users/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'DELETE', '2019-11-29 09:52:39', '2019-11-29 09:52:39', NULL),
(257, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:52:39', '2019-11-29 09:52:39', NULL),
(258, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:52:45', '2019-11-29 09:52:45', NULL),
(259, 'Created search-users', 'Registered', 1, 'http://rantaka.local/search-users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'POST', '2019-11-29 09:52:49', '2019-11-29 09:52:49', NULL),
(260, 'Viewed profile/constance00/edit', 'Registered', 1, 'http://rantaka.local/profile/constance00/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/profile/constance00', 'GET', '2019-11-29 09:53:39', '2019-11-29 09:53:39', NULL),
(261, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 09:53:47', '2019-11-29 09:53:47', NULL),
(262, 'Viewed profile/constance00', 'Registered', 1, 'http://rantaka.local/profile/constance00', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/roles', 'GET', '2019-11-29 09:53:55', '2019-11-29 09:53:55', NULL),
(263, 'Viewed profile/admin', 'Registered', 1, 'http://rantaka.local/profile/admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 09:54:01', '2019-11-29 09:54:01', NULL),
(264, 'Viewed profile/admin/edit', 'Registered', 1, 'http://rantaka.local/profile/admin/edit', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/profile/admin', 'GET', '2019-11-29 09:54:05', '2019-11-29 09:54:05', NULL),
(265, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 09:54:38', '2019-11-29 09:54:38', NULL),
(266, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 10:01:03', '2019-11-29 10:01:03', NULL),
(267, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 10:01:40', '2019-11-29 10:01:40', NULL),
(268, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 10:01:42', '2019-11-29 10:01:42', NULL),
(269, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 10:03:02', '2019-11-29 10:03:02', NULL),
(270, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 10:03:30', '2019-11-29 10:03:30', NULL),
(271, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 10:03:46', '2019-11-29 10:03:46', NULL),
(272, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 10:03:51', '2019-11-29 10:03:51', NULL),
(273, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 10:04:22', '2019-11-29 10:04:22', NULL),
(274, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 10:04:47', '2019-11-29 10:04:47', NULL),
(275, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 10:04:51', '2019-11-29 10:04:51', NULL),
(276, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 10:04:51', '2019-11-29 10:04:51', NULL),
(277, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 10:04:54', '2019-11-29 10:04:54', NULL),
(278, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 10:04:55', '2019-11-29 10:04:55', NULL),
(279, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 10:04:57', '2019-11-29 10:04:57', NULL),
(280, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 10:04:58', '2019-11-29 10:04:58', NULL),
(281, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-29 12:28:47', '2019-11-29 12:28:47', NULL),
(282, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 12:28:47', '2019-11-29 12:28:47', NULL),
(283, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', NULL, 'GET', '2019-11-29 12:30:26', '2019-11-29 12:30:26', NULL),
(284, 'Logged Out', 'Registered', 1, 'http://rantaka.local/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'POST', '2019-11-29 12:30:29', '2019-11-29 12:30:29', NULL),
(285, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-29 12:38:19', '2019-11-29 12:38:19', NULL),
(286, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 12:38:19', '2019-11-29 12:38:19', NULL),
(287, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 12:38:32', '2019-11-29 12:38:32', NULL),
(288, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 12:38:34', '2019-11-29 12:38:34', NULL),
(289, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 12:38:44', '2019-11-29 12:38:44', NULL),
(290, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 12:44:40', '2019-11-29 12:44:40', NULL),
(291, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 12:45:09', '2019-11-29 12:45:09', NULL),
(292, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 12:45:23', '2019-11-29 12:45:23', NULL),
(293, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 12:45:24', '2019-11-29 12:45:24', NULL),
(294, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:45:33', '2019-11-29 12:45:33', NULL),
(295, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 12:45:41', '2019-11-29 12:45:41', NULL),
(296, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:47:34', '2019-11-29 12:47:34', NULL),
(297, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 12:47:42', '2019-11-29 12:47:42', NULL),
(298, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:47:44', '2019-11-29 12:47:44', NULL),
(299, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:47:56', '2019-11-29 12:47:56', NULL),
(300, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:48:36', '2019-11-29 12:48:36', NULL),
(301, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:48:55', '2019-11-29 12:48:55', NULL),
(302, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:49:00', '2019-11-29 12:49:00', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(303, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:49:36', '2019-11-29 12:49:36', NULL),
(304, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:49:46', '2019-11-29 12:49:46', NULL),
(305, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:49:57', '2019-11-29 12:49:57', NULL),
(306, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:52:37', '2019-11-29 12:52:37', NULL),
(307, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:52:49', '2019-11-29 12:52:49', NULL),
(308, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:56:08', '2019-11-29 12:56:08', NULL),
(309, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:56:17', '2019-11-29 12:56:17', NULL),
(310, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:56:33', '2019-11-29 12:56:33', NULL),
(311, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 12:59:50', '2019-11-29 12:59:50', NULL),
(312, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:00:04', '2019-11-29 13:00:04', NULL),
(313, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:00:19', '2019-11-29 13:00:19', NULL),
(314, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:00:34', '2019-11-29 13:00:34', NULL),
(315, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:00:49', '2019-11-29 13:00:49', NULL),
(316, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:01:05', '2019-11-29 13:01:05', NULL),
(317, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:01:32', '2019-11-29 13:01:32', NULL),
(318, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=2', 'GET', '2019-11-29 13:01:34', '2019-11-29 13:01:34', NULL),
(319, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=3', 'GET', '2019-11-29 13:01:38', '2019-11-29 13:01:38', NULL),
(320, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=3', 'GET', '2019-11-29 13:01:49', '2019-11-29 13:01:49', NULL),
(321, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=4', 'GET', '2019-11-29 13:02:18', '2019-11-29 13:02:18', NULL),
(322, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-29 13:03:16', '2019-11-29 13:03:16', NULL),
(323, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 13:03:23', '2019-11-29 13:03:23', NULL),
(324, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:03:55', '2019-11-29 13:03:55', NULL),
(325, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 13:03:57', '2019-11-29 13:03:57', NULL),
(326, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 13:11:10', '2019-11-29 13:11:10', NULL),
(327, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:11:11', '2019-11-29 13:11:11', NULL),
(328, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:11:26', '2019-11-29 13:11:26', NULL),
(329, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-29 13:12:02', '2019-11-29 13:12:02', NULL),
(330, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:15:25', '2019-11-29 13:15:25', NULL),
(331, 'Viewed users/create', 'Registered', 1, 'http://rantaka.local/users/create', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:15:27', '2019-11-29 13:15:27', NULL),
(332, 'Viewed users', 'Registered', 1, 'http://rantaka.local/users', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users/create', 'GET', '2019-11-29 13:15:43', '2019-11-29 13:15:43', NULL),
(333, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/users', 'GET', '2019-11-29 13:16:11', '2019-11-29 13:16:11', NULL),
(334, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-29 13:17:25', '2019-11-29 13:17:25', NULL),
(335, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:18:24', '2019-11-29 13:18:24', NULL),
(336, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:19:09', '2019-11-29 13:19:09', NULL),
(337, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:19:46', '2019-11-29 13:19:46', NULL),
(338, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:19:54', '2019-11-29 13:19:54', NULL),
(339, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:21:21', '2019-11-29 13:21:21', NULL),
(340, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:22:45', '2019-11-29 13:22:45', NULL),
(341, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:24:02', '2019-11-29 13:24:02', NULL),
(342, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:26:32', '2019-11-29 13:26:32', NULL),
(343, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:33:00', '2019-11-29 13:33:00', NULL),
(344, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:33:37', '2019-11-29 13:33:37', NULL),
(345, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:45:54', '2019-11-29 13:45:54', NULL),
(346, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:48:49', '2019-11-29 13:48:49', NULL),
(347, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-29 13:49:07', '2019-11-29 13:49:07', NULL),
(348, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:49:11', '2019-11-29 13:49:11', NULL),
(349, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-29 13:49:13', '2019-11-29 13:49:13', NULL),
(350, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:49:15', '2019-11-29 13:49:15', NULL),
(351, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:51:09', '2019-11-29 13:51:09', NULL),
(352, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:52:56', '2019-11-29 13:52:56', NULL),
(353, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:54:42', '2019-11-29 13:54:42', NULL),
(354, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:55:41', '2019-11-29 13:55:41', NULL),
(355, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:56:20', '2019-11-29 13:56:20', NULL),
(356, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:56:39', '2019-11-29 13:56:39', NULL),
(357, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 13:57:06', '2019-11-29 13:57:06', NULL),
(358, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:01:22', '2019-11-29 14:01:22', NULL),
(359, 'Logged Out', 'Registered', 1, 'http://rantaka.local/logout', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-29 14:02:12', '2019-11-29 14:02:12', NULL),
(360, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-29 14:02:27', '2019-11-29 14:02:27', NULL),
(361, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-29 14:02:27', '2019-11-29 14:02:27', NULL),
(362, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:02:30', '2019-11-29 14:02:30', NULL),
(363, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:04:11', '2019-11-29 14:04:11', NULL),
(364, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:04:58', '2019-11-29 14:04:58', NULL),
(365, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:07:18', '2019-11-29 14:07:18', NULL),
(366, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-29 14:07:46', '2019-11-29 14:07:46', NULL),
(367, 'Logged In', 'Registered', 1, 'http://rantaka.local/login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'POST', '2019-11-30 06:13:15', '2019-11-30 06:13:15', NULL),
(368, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/login', 'GET', '2019-11-30 06:13:15', '2019-11-30 06:13:15', NULL),
(369, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-30 06:13:19', '2019-11-30 06:13:19', NULL),
(370, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:13:26', '2019-11-30 06:13:26', NULL),
(371, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:14:16', '2019-11-30 06:14:16', NULL),
(372, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:17:53', '2019-11-30 06:17:53', NULL),
(373, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:20:08', '2019-11-30 06:20:08', NULL),
(374, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:20:14', '2019-11-30 06:20:14', NULL),
(375, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:23:10', '2019-11-30 06:23:10', NULL),
(376, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:24:07', '2019-11-30 06:24:07', NULL),
(377, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:28:33', '2019-11-30 06:28:33', NULL),
(378, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:28:57', '2019-11-30 06:28:57', NULL),
(379, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 06:30:00', '2019-11-30 06:30:00', NULL),
(380, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:30:03', '2019-11-30 06:30:03', NULL),
(381, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:30:11', '2019-11-30 06:30:11', NULL),
(382, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=2', 'GET', '2019-11-30 06:30:57', '2019-11-30 06:30:57', NULL),
(383, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:31:35', '2019-11-30 06:31:35', NULL),
(384, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 06:33:37', '2019-11-30 06:33:37', NULL),
(385, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 06:33:38', '2019-11-30 06:33:38', NULL),
(386, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:45:06', '2019-11-30 06:45:06', NULL),
(387, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:48:41', '2019-11-30 06:48:41', NULL),
(388, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:52:01', '2019-11-30 06:52:01', NULL),
(389, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:53:51', '2019-11-30 06:53:51', NULL),
(390, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:54:37', '2019-11-30 06:54:37', NULL),
(391, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 06:57:16', '2019-11-30 06:57:16', NULL),
(392, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 06:59:59', '2019-11-30 06:59:59', NULL),
(393, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:00:01', '2019-11-30 07:00:01', NULL),
(394, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:01:06', '2019-11-30 07:01:06', NULL),
(395, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:01:07', '2019-11-30 07:01:07', NULL),
(396, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:01:21', '2019-11-30 07:01:21', NULL),
(397, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:01:21', '2019-11-30 07:01:21', NULL),
(398, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:01:39', '2019-11-30 07:01:39', NULL),
(399, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:01:40', '2019-11-30 07:01:40', NULL),
(400, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:01:48', '2019-11-30 07:01:48', NULL),
(401, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:01:48', '2019-11-30 07:01:48', NULL),
(402, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:02:56', '2019-11-30 07:02:56', NULL),
(403, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:03:51', '2019-11-30 07:03:51', NULL),
(404, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:03:53', '2019-11-30 07:03:53', NULL),
(405, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:04:03', '2019-11-30 07:04:03', NULL),
(406, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:04:04', '2019-11-30 07:04:04', NULL),
(407, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:07:13', '2019-11-30 07:07:13', NULL),
(408, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:07:14', '2019-11-30 07:07:14', NULL),
(409, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:09:08', '2019-11-30 07:09:08', NULL),
(410, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:09:21', '2019-11-30 07:09:21', NULL),
(411, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:09:22', '2019-11-30 07:09:22', NULL),
(412, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:13:27', '2019-11-30 07:13:27', NULL),
(413, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:13:32', '2019-11-30 07:13:32', NULL),
(414, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:13:32', '2019-11-30 07:13:32', NULL),
(415, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:13:41', '2019-11-30 07:13:41', NULL),
(416, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:13:42', '2019-11-30 07:13:42', NULL),
(417, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:13:48', '2019-11-30 07:13:48', NULL),
(418, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:13:48', '2019-11-30 07:13:48', NULL),
(419, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:13:52', '2019-11-30 07:13:52', NULL),
(420, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:13:53', '2019-11-30 07:13:53', NULL),
(421, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 07:14:25', '2019-11-30 07:14:25', NULL),
(422, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:14:25', '2019-11-30 07:14:25', NULL),
(423, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:15:12', '2019-11-30 07:15:12', NULL),
(424, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:15:22', '2019-11-30 07:15:22', NULL),
(425, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:15:24', '2019-11-30 07:15:24', NULL),
(426, 'Viewed properti/edit/111', 'Registered', 1, 'http://rantaka.local/properti/edit/111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 07:15:28', '2019-11-30 07:15:28', NULL),
(427, 'Viewed properti/edit/111', 'Registered', 1, 'http://rantaka.local/properti/edit/111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 07:20:56', '2019-11-30 07:20:56', NULL),
(428, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/111', 'GET', '2019-11-30 07:21:01', '2019-11-30 07:21:01', NULL),
(429, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/111', 'GET', '2019-11-30 07:21:01', '2019-11-30 07:21:01', NULL),
(430, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:21:03', '2019-11-30 07:21:03', NULL),
(431, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:21:30', '2019-11-30 07:21:30', NULL),
(432, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:52:36', '2019-11-30 07:52:36', NULL),
(433, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:52:40', '2019-11-30 07:52:40', NULL),
(434, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 07:52:42', '2019-11-30 07:52:42', NULL),
(435, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:52:44', '2019-11-30 07:52:44', NULL),
(436, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:52:55', '2019-11-30 07:52:55', NULL),
(437, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:55:13', '2019-11-30 07:55:13', NULL),
(438, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:55:29', '2019-11-30 07:55:29', NULL),
(439, 'Viewed properti/edit/2', 'Registered', 1, 'http://rantaka.local/properti/edit/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 07:55:35', '2019-11-30 07:55:35', NULL),
(440, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:56:37', '2019-11-30 07:56:37', NULL),
(441, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:56:59', '2019-11-30 07:56:59', NULL),
(442, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:08', '2019-11-30 07:57:08', NULL),
(443, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:15', '2019-11-30 07:57:15', NULL),
(444, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:18', '2019-11-30 07:57:18', NULL),
(445, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:37', '2019-11-30 07:57:37', NULL),
(446, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:51', '2019-11-30 07:57:51', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(447, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:57:56', '2019-11-30 07:57:56', NULL),
(448, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:58:02', '2019-11-30 07:58:02', NULL),
(449, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:58:10', '2019-11-30 07:58:10', NULL),
(450, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:59:35', '2019-11-30 07:59:35', NULL),
(451, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:59:41', '2019-11-30 07:59:41', NULL),
(452, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 07:59:55', '2019-11-30 07:59:55', NULL),
(453, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 08:00:15', '2019-11-30 08:00:15', NULL),
(454, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 08:00:37', '2019-11-30 08:00:37', NULL),
(455, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 08:00:50', '2019-11-30 08:00:50', NULL),
(456, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:01:21', '2019-11-30 08:01:21', NULL),
(457, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:01:45', '2019-11-30 08:01:45', NULL),
(458, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:15:23', '2019-11-30 08:15:23', NULL),
(459, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 08:15:29', '2019-11-30 08:15:29', NULL),
(460, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:15:31', '2019-11-30 08:15:31', NULL),
(461, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 08:15:36', '2019-11-30 08:15:36', NULL),
(462, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:17:45', '2019-11-30 08:17:45', NULL),
(463, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:17:49', '2019-11-30 08:17:49', NULL),
(464, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:17:54', '2019-11-30 08:17:54', NULL),
(465, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:18:05', '2019-11-30 08:18:05', NULL),
(466, 'Viewed properti/edit/111', 'Registered', 1, 'http://rantaka.local/properti/edit/111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 08:18:19', '2019-11-30 08:18:19', NULL),
(467, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:18:40', '2019-11-30 08:18:40', NULL),
(468, 'Viewed properti/edit/107', 'Registered', 1, 'http://rantaka.local/properti/edit/107', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 08:18:43', '2019-11-30 08:18:43', NULL),
(469, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:27:53', '2019-11-30 08:27:53', NULL),
(470, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:28:20', '2019-11-30 08:28:20', NULL),
(471, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:29:28', '2019-11-30 08:29:28', NULL),
(472, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:30:51', '2019-11-30 08:30:51', NULL),
(473, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:31:11', '2019-11-30 08:31:11', NULL),
(474, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:31:17', '2019-11-30 08:31:17', NULL),
(475, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:31:43', '2019-11-30 08:31:43', NULL),
(476, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:32:20', '2019-11-30 08:32:20', NULL),
(477, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 08:32:25', '2019-11-30 08:32:25', NULL),
(478, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:32:28', '2019-11-30 08:32:28', NULL),
(479, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:34:01', '2019-11-30 08:34:01', NULL),
(480, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:35:12', '2019-11-30 08:35:12', NULL),
(481, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:35:54', '2019-11-30 08:35:54', NULL),
(482, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 08:40:28', '2019-11-30 08:40:28', NULL),
(483, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 09:06:16', '2019-11-30 09:06:16', NULL),
(484, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 09:07:03', '2019-11-30 09:07:03', NULL),
(485, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 09:07:04', '2019-11-30 09:07:04', NULL),
(486, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 09:07:07', '2019-11-30 09:07:07', NULL),
(487, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 09:07:32', '2019-11-30 09:07:32', NULL),
(488, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 09:07:41', '2019-11-30 09:07:41', NULL),
(489, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:22:05', '2019-11-30 10:22:05', NULL),
(490, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:25:35', '2019-11-30 10:25:35', NULL),
(491, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:25:38', '2019-11-30 10:25:38', NULL),
(492, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:26:39', '2019-11-30 10:26:39', NULL),
(493, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:27:47', '2019-11-30 10:27:47', NULL),
(494, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:28:00', '2019-11-30 10:28:00', NULL),
(495, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:28:05', '2019-11-30 10:28:05', NULL),
(496, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:28:15', '2019-11-30 10:28:15', NULL),
(497, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:29:10', '2019-11-30 10:29:10', NULL),
(498, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:29:22', '2019-11-30 10:29:22', NULL),
(499, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:29:43', '2019-11-30 10:29:43', NULL),
(500, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:30:02', '2019-11-30 10:30:02', NULL),
(501, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:30:03', '2019-11-30 10:30:03', NULL),
(502, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:30:56', '2019-11-30 10:30:56', NULL),
(503, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:30:58', '2019-11-30 10:30:58', NULL),
(504, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:30:59', '2019-11-30 10:30:59', NULL),
(505, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:31:22', '2019-11-30 10:31:22', NULL),
(506, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:31:26', '2019-11-30 10:31:26', NULL),
(507, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:31:27', '2019-11-30 10:31:27', NULL),
(508, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:31:30', '2019-11-30 10:31:30', NULL),
(509, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:31:31', '2019-11-30 10:31:31', NULL),
(510, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:31:35', '2019-11-30 10:31:35', NULL),
(511, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:31:35', '2019-11-30 10:31:35', NULL),
(512, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:31:36', '2019-11-30 10:31:36', NULL),
(513, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:31:57', '2019-11-30 10:31:57', NULL),
(514, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:32:00', '2019-11-30 10:32:00', NULL),
(515, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:32:04', '2019-11-30 10:32:04', NULL),
(516, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:32:05', '2019-11-30 10:32:05', NULL),
(517, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:32:08', '2019-11-30 10:32:08', NULL),
(518, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:32:09', '2019-11-30 10:32:09', NULL),
(519, 'Created properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'POST', '2019-11-30 10:32:15', '2019-11-30 10:32:15', NULL),
(520, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:32:15', '2019-11-30 10:32:15', NULL),
(521, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/edit/1', 'GET', '2019-11-30 10:32:44', '2019-11-30 10:32:44', NULL),
(522, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:32:50', '2019-11-30 10:32:50', NULL),
(523, 'Created properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'POST', '2019-11-30 10:32:52', '2019-11-30 10:32:52', NULL),
(524, 'Viewed properti/add', 'Registered', 1, 'http://rantaka.local/properti/add', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 10:32:53', '2019-11-30 10:32:53', NULL),
(525, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti/add', 'GET', '2019-11-30 10:43:45', '2019-11-30 10:43:45', NULL),
(526, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:43:49', '2019-11-30 10:43:49', NULL),
(527, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:45:15', '2019-11-30 10:45:15', NULL),
(528, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:45:16', '2019-11-30 10:45:16', NULL),
(529, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:46:34', '2019-11-30 10:46:34', NULL),
(530, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:46:48', '2019-11-30 10:46:48', NULL),
(531, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:49:31', '2019-11-30 10:49:31', NULL),
(532, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:49:45', '2019-11-30 10:49:45', NULL),
(533, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:49:51', '2019-11-30 10:49:51', NULL),
(534, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:50:47', '2019-11-30 10:50:47', NULL),
(535, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:51:26', '2019-11-30 10:51:26', NULL),
(536, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:51:30', '2019-11-30 10:51:30', NULL),
(537, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:51:39', '2019-11-30 10:51:39', NULL),
(538, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 10:51:48', '2019-11-30 10:51:48', NULL),
(539, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 11:26:38', '2019-11-30 11:26:38', NULL),
(540, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 11:26:44', '2019-11-30 11:26:44', NULL),
(541, 'Deleted properti/delete/111', 'Registered', 1, 'http://rantaka.local/properti/delete/111', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'DELETE', '2019-11-30 11:26:49', '2019-11-30 11:26:49', NULL),
(542, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 11:26:49', '2019-11-30 11:26:49', NULL),
(543, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 11:27:08', '2019-11-30 11:27:08', NULL),
(544, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 11:28:57', '2019-11-30 11:28:57', NULL),
(545, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 11:29:35', '2019-11-30 11:29:35', NULL),
(546, 'Viewed properti/edit/4', 'Registered', 1, 'http://rantaka.local/properti/edit/4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:29:41', '2019-11-30 11:29:41', NULL),
(547, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=5', 'GET', '2019-11-30 11:30:04', '2019-11-30 11:30:04', NULL),
(548, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:30:09', '2019-11-30 11:30:09', NULL),
(549, 'Viewed properti/edit/2', 'Registered', 1, 'http://rantaka.local/properti/edit/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:30:13', '2019-11-30 11:30:13', NULL),
(550, 'Viewed properti/edit/1', 'Registered', 1, 'http://rantaka.local/properti/edit/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:30:18', '2019-11-30 11:30:18', NULL),
(551, 'Viewed properti/edit/5', 'Registered', 1, 'http://rantaka.local/properti/edit/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:30:22', '2019-11-30 11:30:22', NULL),
(552, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:35:47', '2019-11-30 11:35:47', NULL),
(553, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 11:44:05', '2019-11-30 11:44:05', NULL),
(554, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 12:16:02', '2019-11-30 12:16:02', NULL),
(555, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 12:16:30', '2019-11-30 12:16:30', NULL),
(556, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 12:16:34', '2019-11-30 12:16:34', NULL),
(557, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=3', 'GET', '2019-11-30 12:16:38', '2019-11-30 12:16:38', NULL),
(558, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=3', 'GET', '2019-11-30 12:33:12', '2019-11-30 12:33:12', NULL),
(559, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti?page=1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=3', 'GET', '2019-11-30 12:34:01', '2019-11-30 12:34:01', NULL),
(560, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 12:34:03', '2019-11-30 12:34:03', NULL),
(561, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 12:36:04', '2019-11-30 12:36:04', NULL),
(562, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:11:01', '2019-11-30 13:11:01', NULL),
(563, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:11:19', '2019-11-30 13:11:19', NULL),
(564, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:13:52', '2019-11-30 13:13:52', NULL),
(565, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:14:56', '2019-11-30 13:14:56', NULL),
(566, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:15:54', '2019-11-30 13:15:54', NULL),
(567, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:16:47', '2019-11-30 13:16:47', NULL),
(568, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:20:28', '2019-11-30 13:20:28', NULL),
(569, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:20:30', '2019-11-30 13:20:30', NULL),
(570, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:20:44', '2019-11-30 13:20:44', NULL),
(571, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:20:53', '2019-11-30 13:20:53', NULL),
(572, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:21:14', '2019-11-30 13:21:14', NULL),
(573, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:21:28', '2019-11-30 13:21:28', NULL),
(574, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti?page=1', 'GET', '2019-11-30 13:21:53', '2019-11-30 13:21:53', NULL),
(575, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:21:56', '2019-11-30 13:21:56', NULL),
(576, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:03', '2019-11-30 13:22:03', NULL),
(577, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:10', '2019-11-30 13:22:10', NULL),
(578, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:13', '2019-11-30 13:22:13', NULL),
(579, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:17', '2019-11-30 13:22:17', NULL),
(580, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:22', '2019-11-30 13:22:22', NULL),
(581, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:22:39', '2019-11-30 13:22:39', NULL),
(582, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:08', '2019-11-30 13:23:08', NULL),
(583, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:20', '2019-11-30 13:23:20', NULL),
(584, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:39', '2019-11-30 13:23:39', NULL),
(585, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:45', '2019-11-30 13:23:45', NULL),
(586, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:50', '2019-11-30 13:23:50', NULL),
(587, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:23:53', '2019-11-30 13:23:53', NULL),
(588, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:25:26', '2019-11-30 13:25:26', NULL),
(589, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:25:51', '2019-11-30 13:25:51', NULL);
INSERT INTO `laravel_logger_activity` (`id`, `description`, `userType`, `userId`, `route`, `ipAddress`, `userAgent`, `locale`, `referer`, `methodType`, `created_at`, `updated_at`, `deleted_at`) VALUES
(590, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:25:59', '2019-11-30 13:25:59', NULL),
(591, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:26:50', '2019-11-30 13:26:50', NULL),
(592, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:27:20', '2019-11-30 13:27:20', NULL),
(593, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:27:32', '2019-11-30 13:27:32', NULL),
(594, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:27:43', '2019-11-30 13:27:43', NULL),
(595, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:40:26', '2019-11-30 13:40:26', NULL),
(596, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:40:42', '2019-11-30 13:40:42', NULL),
(597, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:43:43', '2019-11-30 13:43:43', NULL),
(598, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:43:55', '2019-11-30 13:43:55', NULL),
(599, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:44:01', '2019-11-30 13:44:01', NULL),
(600, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:44:21', '2019-11-30 13:44:21', NULL),
(601, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:44:25', '2019-11-30 13:44:25', NULL),
(602, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:45:27', '2019-11-30 13:45:27', NULL),
(603, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:45:43', '2019-11-30 13:45:43', NULL),
(604, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:46:32', '2019-11-30 13:46:32', NULL),
(605, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:46:53', '2019-11-30 13:46:53', NULL),
(606, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:47:06', '2019-11-30 13:47:06', NULL),
(607, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:47:36', '2019-11-30 13:47:36', NULL),
(608, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:48:04', '2019-11-30 13:48:04', NULL),
(609, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:48:19', '2019-11-30 13:48:19', NULL),
(610, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:48:26', '2019-11-30 13:48:26', NULL),
(611, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:48:43', '2019-11-30 13:48:43', NULL),
(612, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:48:59', '2019-11-30 13:48:59', NULL),
(613, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:56:57', '2019-11-30 13:56:57', NULL),
(614, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 13:57:12', '2019-11-30 13:57:12', NULL),
(615, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:06:57', '2019-11-30 14:06:57', NULL),
(616, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:11:20', '2019-11-30 14:11:20', NULL),
(617, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:15:05', '2019-11-30 14:15:05', NULL),
(618, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:15:45', '2019-11-30 14:15:45', NULL),
(619, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:18:17', '2019-11-30 14:18:17', NULL),
(620, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:18:47', '2019-11-30 14:18:47', NULL),
(621, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:19:02', '2019-11-30 14:19:02', NULL),
(622, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:20:04', '2019-11-30 14:20:04', NULL),
(623, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:20:17', '2019-11-30 14:20:17', NULL),
(624, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:20:27', '2019-11-30 14:20:27', NULL),
(625, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:20:29', '2019-11-30 14:20:29', NULL),
(626, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:20:41', '2019-11-30 14:20:41', NULL),
(627, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:22:00', '2019-11-30 14:22:00', NULL),
(628, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:22:16', '2019-11-30 14:22:16', NULL),
(629, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:22:52', '2019-11-30 14:22:52', NULL),
(630, 'Viewed booking', 'Registered', 1, 'http://rantaka.local/booking', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-30 14:22:57', '2019-11-30 14:22:57', NULL),
(631, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/booking', 'GET', '2019-11-30 14:22:58', '2019-11-30 14:22:58', NULL),
(632, 'Viewed home', 'Registered', 1, 'http://rantaka.local/home', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/properti', 'GET', '2019-11-30 14:23:00', '2019-11-30 14:23:00', NULL),
(633, 'Viewed properti', 'Registered', 1, 'http://rantaka.local/properti', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'en-GB,en;q=0.9,en-US;q=0.8,id;q=0.7', 'http://rantaka.local/home', 'GET', '2019-11-30 14:23:07', '2019-11-30 14:23:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_15_105324_create_roles_table', 1),
(4, '2016_01_15_114412_create_role_user_table', 1),
(5, '2016_01_26_115212_create_permissions_table', 1),
(6, '2016_01_26_115523_create_permission_role_table', 1),
(7, '2016_02_09_132439_create_permission_user_table', 1),
(8, '2017_03_09_082449_create_social_logins_table', 1),
(9, '2017_03_09_082526_create_activations_table', 1),
(10, '2017_03_20_213554_create_themes_table', 1),
(11, '2017_03_21_042918_create_profiles_table', 1),
(12, '2017_11_04_103444_create_laravel_logger_activity_table', 1),
(13, '2017_12_09_070937_create_two_step_auth_table', 1),
(14, '2019_02_19_032636_create_laravel_blocker_types_table', 1),
(15, '2019_02_19_045158_create_laravel_blocker_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_11_28_065101_create_properti_table', 2),
(18, '2019_11_28_065408_create_properti_table', 3),
(19, '2019_11_28_073852_create_properti_table', 4),
(20, '2019_11_28_102141_create_status_properti_table', 5),
(21, '2019_11_28_125847_create_booking_table', 6),
(22, '2019_11_30_143850_create_project_table', 7),
(23, '2019_11_30_150244_create_tipe_rumah_table', 8),
(24, '2019_11_30_210106_create_status_booking_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `slug`, `description`, `model`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Can View Users', 'view.users', 'Can view users', 'Permission', '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(2, 'Can Create Users', 'create.users', 'Can create new users', 'Permission', '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(3, 'Can Edit Users', 'edit.users', 'Can edit users', 'Permission', '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(4, 'Can Delete Users', 'delete.users', 'Can delete users', 'Permission', '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(2, 2, 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(3, 3, 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(4, 4, 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `theme_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `twitter_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `github_username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profiles_theme_id_foreign` (`theme_id`),
  KEY `profiles_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `theme_id`, `location`, `bio`, `twitter_username`, `github_username`, `avatar`, `avatar_status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-27 04:12:20', '2019-11-27 04:12:20'),
(2, 2, 1, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-27 04:12:20', '2019-11-27 04:12:20'),
(3, 4, 1, NULL, NULL, NULL, NULL, NULL, 0, '2019-11-27 06:12:02', '2019-11-27 06:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Green Valley Estate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `properti`
--

DROP TABLE IF EXISTS `properti`;
CREATE TABLE IF NOT EXISTS `properti` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_project` int(11) NOT NULL,
  `blok` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_unit` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jml_lantai` int(11) DEFAULT NULL,
  `luas_tanah` int(11) DEFAULT NULL,
  `luas_bangunan` int(11) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL,
  `pembeli` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `properti`
--

INSERT INTO `properti` (`id`, `id_project`, `blok`, `no_unit`, `tipe`, `jml_lantai`, `luas_tanah`, `luas_bangunan`, `harga`, `id_status`, `pembeli`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'A', '1', '1', 1, 60, 30, 279000000, 2, NULL, NULL, NULL, '2019-11-30 10:32:09'),
(2, 1, 'A', '2', '1', 1, 60, 30, 279000000, 2, NULL, NULL, NULL, '2019-11-30 11:40:25'),
(3, 1, 'A', '3', '1', 1, 60, 30, 279000000, 3, NULL, NULL, NULL, NULL),
(4, 1, 'A', '4', '1', 1, 60, 30, 279000000, 2, NULL, NULL, NULL, '2019-11-30 14:10:06'),
(5, 1, 'A', '5', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(6, 1, 'A', '6', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(7, 1, 'A', '7', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(8, 1, 'A', '8', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(9, 1, 'A', '9', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(10, 1, 'A', '10', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(11, 1, 'A', '11', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(12, 1, 'A', '12', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(13, 1, 'A', '13', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(14, 1, 'A', '14', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(15, 1, 'A', '15', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(16, 1, 'A', '16', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(17, 1, 'A', '17', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(18, 1, 'A', '18', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(19, 1, 'B', '1', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(20, 1, 'B', '2', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(21, 1, 'B', '3', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(22, 1, 'B', '4', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(23, 1, 'B', '5', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(24, 1, 'B', '6', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(25, 1, 'B', '7', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(26, 1, 'B', '8', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(27, 1, 'B', '9', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(28, 1, 'B', '10', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(29, 1, 'B', '11', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(30, 1, 'B', '12', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(31, 1, 'B', '13', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(32, 1, 'B', '14', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(33, 1, 'B', '15', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(34, 1, 'B', '16', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(35, 1, 'B', '17', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(36, 1, 'B', '18', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(37, 1, 'C', '1', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(38, 1, 'C', '2', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(39, 1, 'C', '3', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(40, 1, 'C', '4', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(41, 1, 'C', '5', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(42, 1, 'C', '6', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(43, 1, 'C', '7', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(44, 1, 'C', '8', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(45, 1, 'C', '9', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(46, 1, 'C', '10', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(47, 1, 'C', '11', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(48, 1, 'C', '12', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(49, 1, 'C', '13', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(50, 1, 'C', '14', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(51, 1, 'C', '15', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(52, 1, 'C', '16', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(53, 1, 'D', '1', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(54, 1, 'D', '2', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(55, 1, 'D', '3', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(56, 1, 'D', '4', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(57, 1, 'D', '5', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(58, 1, 'D', '6', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(59, 1, 'D', '7', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(60, 1, 'D', '8', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(61, 1, 'D', '9', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(62, 1, 'D', '10', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(63, 1, 'D', '11', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(64, 1, 'D', '12', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(65, 1, 'D', '13', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(66, 1, 'D', '14', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(67, 1, 'D', '15', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(68, 1, 'D', '16', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(69, 1, 'D', '17', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(70, 1, 'D', '18', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(71, 1, 'D', '19', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(72, 1, 'D', '20', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(73, 1, 'D', '21', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(74, 1, 'D', '22', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(75, 1, 'D', '23', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(76, 1, 'D', '24', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(77, 1, 'D', '25', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(78, 1, 'D', '26', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(79, 1, 'D', '27', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(80, 1, 'D', '28', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(81, 1, 'D', '29', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(82, 1, 'D', '30', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(83, 1, 'E', '1', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(84, 1, 'E', '2', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(85, 1, 'E', '3', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(86, 1, 'E', '4', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(87, 1, 'E', '5', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(88, 1, 'E', '6', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(89, 1, 'E', '7', '1', 1, 60, 30, 279000000, 1, NULL, NULL, NULL, NULL),
(90, 1, 'F', '1', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(91, 1, 'F', '2', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(92, 1, 'F', '3', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(93, 1, 'F', '4', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(94, 1, 'F', '5', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(95, 1, 'F', '6', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(96, 1, 'F', '7', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(97, 1, 'F', '8', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(98, 1, 'F', '9', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(99, 1, 'F', '10', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(100, 1, 'F', '11', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(101, 1, 'F', '12', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(102, 1, 'F', '13', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(103, 1, 'F', '14', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(104, 1, 'F', '15', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(105, 1, 'F', '16', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(106, 1, 'F', '17', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(107, 1, 'F', '18', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL),
(108, 1, 'F', '19', '2', 1, 60, 60, 385000000, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin', 'Admin Role', 5, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(2, 'User', 'user', 'User Role', 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(3, 'Unverified', 'unverified', 'Unverified Role', 0, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, 1, 1, '2019-11-29 09:50:34', '2019-11-29 09:50:34', NULL),
(2, 2, 2, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(3, 3, 3, '2019-11-27 06:10:06', '2019-11-27 06:10:06', NULL),
(5, 2, 4, '2019-11-27 06:12:02', '2019-11-27 06:12:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
CREATE TABLE IF NOT EXISTS `social_logins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `social_id` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `social_logins_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_booking`
--

DROP TABLE IF EXISTS `status_booking`;
CREATE TABLE IF NOT EXISTS `status_booking` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_booking`
--

INSERT INTO `status_booking` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, 'Unpaid', NULL, NULL),
(2, 'Paid', NULL, NULL),
(3, 'Expired', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `status_properti`
--

DROP TABLE IF EXISTS `status_properti`;
CREATE TABLE IF NOT EXISTS `status_properti` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_properti`
--

INSERT INTO `status_properti` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, 'Available', NULL, NULL),
(2, 'Waiting', NULL, NULL),
(3, 'Booked', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `themes_name_unique` (`name`),
  UNIQUE KEY `themes_link_unique` (`link`),
  KEY `themes_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  KEY `themes_id_index` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `link`, `notes`, `status`, `taggable_type`, `taggable_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Default', 'null', NULL, 1, 'theme', 1, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(2, 'Darkly', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/darkly/bootstrap.min.css', NULL, 1, 'theme', 2, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(3, 'Cyborg', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cyborg/bootstrap.min.css', NULL, 1, 'theme', 3, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(4, 'Cosmo', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cosmo/bootstrap.min.css', NULL, 1, 'theme', 4, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(5, 'Cerulean', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css', NULL, 1, 'theme', 5, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(6, 'Flatly', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/flatly/bootstrap.min.css', NULL, 1, 'theme', 6, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(7, 'Journal', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/journal/bootstrap.min.css', NULL, 1, 'theme', 7, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(8, 'Lumen', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lumen/bootstrap.min.css', NULL, 1, 'theme', 8, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(9, 'Paper', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/paper/bootstrap.min.css', NULL, 1, 'theme', 9, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(10, 'Readable', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/readable/bootstrap.min.css', NULL, 1, 'theme', 10, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(11, 'Sandstone', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sandstone/bootstrap.min.css', NULL, 1, 'theme', 11, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(12, 'Simplex', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/simplex/bootstrap.min.css', NULL, 1, 'theme', 12, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(13, 'Slate', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/slate/bootstrap.min.css', NULL, 1, 'theme', 13, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(14, 'Spacelab', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/spacelab/bootstrap.min.css', NULL, 1, 'theme', 14, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(15, 'Superhero', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/superhero/bootstrap.min.css', NULL, 1, 'theme', 15, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(16, 'United', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/united/bootstrap.min.css', NULL, 1, 'theme', 16, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(17, 'Yeti', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/yeti/bootstrap.min.css', NULL, 1, 'theme', 17, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(18, 'Bootstrap 4.3.1', 'https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css', NULL, 1, 'theme', 18, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(19, 'Materialize', 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.css', NULL, 1, 'theme', 19, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(20, 'Material Design for Bootstrap (MDB) 4.8.7', 'https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.7/css/mdb.css', NULL, 1, 'theme', 20, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(21, 'mdbootstrap', 'https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.1/css/mdb.min.css', NULL, 1, 'theme', 21, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(22, 'Litera', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css', NULL, 1, 'theme', 22, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(23, 'Lux', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/lux/bootstrap.min.css', NULL, 1, 'theme', 23, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(24, 'Materia', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/materia/bootstrap.min.css', NULL, 1, 'theme', 24, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(25, 'Minty', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/minty/bootstrap.min.css', NULL, 1, 'theme', 25, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(26, 'Pulse', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/pulse/bootstrap.min.css', NULL, 1, 'theme', 26, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(27, 'Sketchy', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/sketchy/bootstrap.min.css', NULL, 1, 'theme', 27, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(28, 'Solar', 'https://maxcdn.bootstrapcdn.com/bootswatch/4.3.1/solar/bootstrap.min.css', NULL, 1, 'theme', 28, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tipe_rumah`
--

DROP TABLE IF EXISTS `tipe_rumah`;
CREATE TABLE IF NOT EXISTS `tipe_rumah` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `text` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipe_rumah`
--

INSERT INTO `tipe_rumah` (`id`, `text`, `created_at`, `updated_at`) VALUES
(1, '36', NULL, NULL),
(2, '60', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signup_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_confirmation_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_sm_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `activated`, `token`, `signup_ip_address`, `signup_confirmation_ip_address`, `signup_sm_ip_address`, `admin_ip_address`, `updated_ip_address`, `deleted_ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Admin', 'Rantaka', 'admin@admin.com', '$2y$10$GjALk8MUAgsy61KAHzApZO.WQIrvVmlm.oZgzm59H0/b35tcrbGQi', NULL, 1, 'EuqTYZhFbpu6bxNB8Xtq9NCoBJXSeUQgUAZgIRA1h36DWyo4TpBvw29P2cYAlKyY', NULL, '91.97.193.210', NULL, '245.41.40.210', '127.0.0.1', NULL, '2019-11-27 04:12:20', '2019-11-29 09:50:34', NULL),
(2, 'ejacobs', 'Werner', 'Cronin', 'user@user.com', '$2y$10$Xj9CZkUiQHtbHXmBR8xHZ./buhW4mUyUEYbnhqQfFGNKPvkNH/5FG', NULL, 1, 'jGz4O1C8W7GsOiDCqgyFcaKgpmgIT4tW2V73W4tsgElSlxVKvKOnGy9xniwymi38', '70.102.136.154', '253.122.45.0', NULL, NULL, NULL, NULL, '2019-11-27 04:12:20', '2019-11-27 04:12:20', NULL),
(4, 'raya', 'Raya', 'Sabari', 'raya.sabari@rhr.co.id', '$2y$10$AeHbw4cZBm5yWGOUZuWb7OhQG/R2QZfS1R0J3PEPw05mylEd1KjxS', NULL, 1, 'mkdSPYDoXyxYZuCD1X9u3lfJ3WI5nhryPtm33rBfveM6U3csbfLF0dZAITDDKiOt', '127.0.0.1', '127.0.0.1', NULL, NULL, NULL, '127.0.0.1', '2019-11-27 06:11:40', '2019-11-29 09:52:39', '2019-11-29 09:52:39');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
