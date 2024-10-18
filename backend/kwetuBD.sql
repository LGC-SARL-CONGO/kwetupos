-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 18 oct. 2024 à 08:06
-- Version du serveur : 10.6.17-MariaDB-cll-lve
-- Version de PHP : 8.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `c2397409c_kwetuBD`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `account_details` text DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) DEFAULT NULL,
  `event` varchar(191) DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) DEFAULT NULL,
  `properties` text DEFAULT NULL,
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 15:30:15', '2024-07-11 15:30:15'),
(2, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 15:47:36', '2024-07-11 15:47:36'),
(3, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 15:48:08', '2024-07-11 15:48:08'),
(4, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 16:21:30', '2024-07-11 16:21:30'),
(5, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 16:23:52', '2024-07-11 16:23:52'),
(6, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 12:50:41', '2024-07-11 12:50:41'),
(7, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 14:04:59', '2024-07-11 14:04:59'),
(8, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 14:06:49', '2024-07-11 14:06:49'),
(9, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 14:45:41', '2024-07-11 14:45:41'),
(10, 'default', 'added', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Charles Matoumoueni\"}', NULL, '2024-07-11 14:48:44', '2024-07-11 14:48:44'),
(11, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-11 14:49:49', '2024-07-11 14:49:49'),
(12, 'default', 'added', 3, 'App\\User', NULL, 1, 2, 'App\\User', '{\"name\":\"M LGC SARL\"}', NULL, '2024-07-11 15:14:04', '2024-07-11 15:14:04'),
(13, 'default', 'login', 3, 'App\\User', NULL, 1, 3, 'App\\User', '[]', NULL, '2024-07-11 15:14:52', '2024-07-11 15:14:52'),
(14, 'default', 'added', 2, 'App\\Transaction', NULL, 1, 3, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-11 15:18:43', '2024-07-11 15:18:43'),
(15, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 15:42:24', '2024-07-11 15:42:24'),
(16, 'default', 'login', 4, 'App\\User', NULL, 2, 4, 'App\\User', '[]', NULL, '2024-07-11 16:08:07', '2024-07-11 16:08:07'),
(17, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-11 20:38:03', '2024-07-11 20:38:03'),
(18, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-11 20:55:33', '2024-07-11 20:55:33'),
(19, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-11 21:27:40', '2024-07-11 21:27:40'),
(20, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-11 21:35:20', '2024-07-11 21:35:20'),
(21, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-11 21:38:39', '2024-07-11 21:38:39'),
(22, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 06:45:44', '2024-07-12 06:45:44'),
(23, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 11:12:31', '2024-07-12 11:12:31'),
(24, 'default', 'added', 3, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-12 11:15:23', '2024-07-12 11:15:23'),
(25, 'default', 'added', 4, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-12 11:17:42', '2024-07-12 11:17:42'),
(26, 'default', 'added', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-12 11:18:51', '2024-07-12 11:18:51'),
(27, 'default', 'added', 6, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Daouda SINAYOKO\"}', NULL, '2024-07-12 14:00:53', '2024-07-12 14:00:53'),
(28, 'default', 'login', 6, 'App\\User', NULL, 1, 6, 'App\\User', '[]', NULL, '2024-07-12 14:01:47', '2024-07-12 14:01:47'),
(29, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 14:53:52', '2024-07-12 14:53:52'),
(30, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 16:57:15', '2024-07-12 16:57:15'),
(31, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 17:26:54', '2024-07-12 17:26:54'),
(32, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 17:27:10', '2024-07-12 17:27:10'),
(33, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 17:27:20', '2024-07-12 17:27:20'),
(34, 'default', 'added', 4, 'App\\Contact', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 17:46:18', '2024-07-12 17:46:18'),
(35, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-12 17:47:25', '2024-07-12 17:47:25'),
(36, 'default', 'added', 7, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-12 17:50:48', '2024-07-12 17:50:48'),
(37, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 06:46:52', '2024-07-15 06:46:52'),
(38, 'default', 'added', 7, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Erjon Tolaj\"}', NULL, '2024-07-15 06:51:54', '2024-07-15 06:51:54'),
(39, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-15 06:53:39', '2024-07-15 06:53:39'),
(40, 'default', 'edited', 7, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Erjon Tolaj\"}', NULL, '2024-07-15 08:18:50', '2024-07-15 08:18:50'),
(41, 'default', 'logout', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-15 08:19:10', '2024-07-15 08:19:10'),
(42, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-15 08:19:12', '2024-07-15 08:19:12'),
(43, 'default', 'edited', 7, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Erjon Tolaj\"}', NULL, '2024-07-15 08:20:59', '2024-07-15 08:20:59'),
(44, 'default', 'edited', 7, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Erjon Tolaj\"}', NULL, '2024-07-15 08:23:47', '2024-07-15 08:23:47'),
(45, 'default', 'logout', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-15 08:24:08', '2024-07-15 08:24:08'),
(46, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-15 08:24:10', '2024-07-15 08:24:10'),
(47, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 08:56:01', '2024-07-15 08:56:01'),
(48, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 09:01:14', '2024-07-15 09:01:14'),
(49, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 11:23:13', '2024-07-15 11:23:13'),
(50, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 11:23:20', '2024-07-15 11:23:20'),
(51, 'default', 'edited', 2, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Charles Matoumoueni\"}', NULL, '2024-07-15 11:27:39', '2024-07-15 11:27:39'),
(52, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-15 11:31:37', '2024-07-15 11:31:37'),
(53, 'default', 'added', 5, 'App\\Contact', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-15 11:37:25', '2024-07-15 11:37:25'),
(54, 'default', 'added', 9, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-15 11:37:38', '2024-07-15 11:37:38'),
(55, 'default', 'added', 10, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":14500}}', NULL, '2024-07-15 11:41:06', '2024-07-15 11:41:06'),
(56, 'default', 'sell_deleted', 10, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":10,\"invoice_no\":\"2024-0007\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:22', '2024-07-15 12:54:22'),
(57, 'default', 'sell_deleted', 9, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":9,\"invoice_no\":\"2024-0006\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:30', '2024-07-15 12:54:30'),
(58, 'default', 'sell_deleted', 7, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":7,\"invoice_no\":\"0005\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:33', '2024-07-15 12:54:33'),
(59, 'default', 'sell_deleted', 5, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":5,\"invoice_no\":\"0004\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:37', '2024-07-15 12:54:37'),
(60, 'default', 'sell_deleted', 3, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":3,\"invoice_no\":\"0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:41', '2024-07-15 12:54:41'),
(61, 'default', 'sell_deleted', 4, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":4,\"invoice_no\":\"0003\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:45', '2024-07-15 12:54:45'),
(62, 'default', 'sell_deleted', 2, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"id\":2,\"invoice_no\":\"0001\",\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"14500.0000\"}}', NULL, '2024-07-15 12:54:48', '2024-07-15 12:54:48'),
(63, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-07-15 15:17:10', '2024-07-15 15:17:10'),
(64, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-15 16:44:55', '2024-07-15 16:44:55'),
(65, 'default', 'login', 6, 'App\\User', NULL, 1, 6, 'App\\User', '[]', NULL, '2024-07-15 16:47:06', '2024-07-15 16:47:06'),
(66, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 05:37:38', '2024-07-16 05:37:38'),
(67, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-16 05:42:06', '2024-07-16 05:42:06'),
(68, 'default', 'login', 6, 'App\\User', NULL, 1, 6, 'App\\User', '[]', NULL, '2024-07-16 08:03:19', '2024-07-16 08:03:19'),
(69, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-16 10:30:38', '2024-07-16 10:30:38'),
(70, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 12:00:17', '2024-07-16 12:00:17'),
(71, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 12:09:44', '2024-07-16 12:09:44'),
(72, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 12:09:53', '2024-07-16 12:09:53'),
(73, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 12:10:45', '2024-07-16 12:10:45'),
(74, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 13:02:29', '2024-07-16 13:02:29'),
(75, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 13:12:22', '2024-07-16 13:12:22'),
(76, 'default', 'added', 8, 'App\\User', NULL, 3, 5, 'App\\User', '{\"name\":\" Makelekele \"}', NULL, '2024-07-16 13:23:44', '2024-07-16 13:23:44'),
(77, 'default', 'added', 9, 'App\\User', NULL, 3, 5, 'App\\User', '{\"name\":\" Bacongo \"}', NULL, '2024-07-16 13:25:21', '2024-07-16 13:25:21'),
(78, 'default', 'added', 10, 'App\\User', NULL, 3, 5, 'App\\User', '{\"name\":\" Poto-Poto \"}', NULL, '2024-07-16 13:26:30', '2024-07-16 13:26:30'),
(79, 'default', 'added', 11, 'App\\User', NULL, 3, 5, 'App\\User', '{\"name\":\" Mongali \"}', NULL, '2024-07-16 13:27:46', '2024-07-16 13:27:46'),
(80, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 13:38:18', '2024-07-16 13:38:18'),
(81, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 13:40:50', '2024-07-16 13:40:50'),
(82, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-16 13:41:11', '2024-07-16 13:41:11'),
(83, 'default', 'added', 6, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-16 13:43:47', '2024-07-16 13:43:47'),
(84, 'default', 'added', 49, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":85000}}', NULL, '2024-07-16 13:45:21', '2024-07-16 13:45:21'),
(85, 'default', 'added', 50, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":125000}}', NULL, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(86, 'default', 'added', 51, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":42500}}', NULL, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(87, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-16 13:49:29', '2024-07-16 13:49:29'),
(88, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 13:50:03', '2024-07-16 13:50:03'),
(89, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-16 13:55:28', '2024-07-16 13:55:28'),
(90, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-16 13:55:45', '2024-07-16 13:55:45'),
(91, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-16 13:56:03', '2024-07-16 13:56:03'),
(92, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 17:24:18', '2024-07-16 17:24:18'),
(93, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 18:37:22', '2024-07-16 18:37:22'),
(94, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-16 20:56:09', '2024-07-16 20:56:09'),
(95, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-17 05:39:18', '2024-07-17 05:39:18'),
(96, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 07:01:46', '2024-07-17 07:01:46'),
(97, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 07:05:31', '2024-07-17 07:05:31'),
(98, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 07:08:38', '2024-07-17 07:08:38'),
(99, 'default', 'added', 58, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":62500}}', NULL, '2024-07-17 07:11:26', '2024-07-17 07:11:26'),
(100, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 08:44:20', '2024-07-17 08:44:20'),
(101, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 09:36:10', '2024-07-17 09:36:10'),
(102, 'default', 'added', 7, 'App\\Contact', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 10:11:11', '2024-07-17 10:11:11'),
(103, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 10:12:51', '2024-07-17 10:12:51'),
(104, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 10:13:39', '2024-07-17 10:13:39'),
(105, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 10:15:29', '2024-07-17 10:15:29'),
(106, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 10:19:38', '2024-07-17 10:19:38'),
(107, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-17 10:24:52', '2024-07-17 10:24:52'),
(108, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 10:25:20', '2024-07-17 10:25:20'),
(109, 'default', 'added', 8, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 10:39:34', '2024-07-17 10:39:34'),
(110, 'default', 'added', 66, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":43750}}', NULL, '2024-07-17 10:42:19', '2024-07-17 10:42:19'),
(111, 'default', 'added', 67, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":106250}}', NULL, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(112, 'default', 'payment_edited', 66, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"43750.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"43750.0000\"}}', NULL, '2024-07-17 10:45:20', '2024-07-17 10:45:20'),
(113, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-17 10:51:17', '2024-07-17 10:51:17'),
(114, 'default', 'login', 7, 'App\\User', NULL, 1, 7, 'App\\User', '[]', NULL, '2024-07-18 05:04:14', '2024-07-18 05:04:14'),
(115, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 08:51:50', '2024-07-18 08:51:50'),
(116, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 09:28:22', '2024-07-18 09:28:22'),
(117, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 09:48:09', '2024-07-18 09:48:09'),
(118, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 10:01:34', '2024-07-18 10:01:34'),
(119, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 10:02:06', '2024-07-18 10:02:06'),
(120, 'default', 'added', 73, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":425000}}', NULL, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(121, 'default', 'added', 9, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 10:13:07', '2024-07-18 10:13:07'),
(122, 'default', 'added', 74, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":105000}}', NULL, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(123, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 10:16:54', '2024-07-18 10:16:54'),
(124, 'default', 'login', 11, 'App\\User', NULL, 3, 11, 'App\\User', '[]', NULL, '2024-07-18 10:17:12', '2024-07-18 10:17:12'),
(125, 'default', 'logout', 11, 'App\\User', NULL, 3, 11, 'App\\User', '[]', NULL, '2024-07-18 10:28:38', '2024-07-18 10:28:38'),
(126, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:29:44', '2024-07-18 11:29:44'),
(127, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:29:45', '2024-07-18 11:29:45'),
(128, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:30:18', '2024-07-18 11:30:18'),
(129, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 11:32:04', '2024-07-18 11:32:04'),
(130, 'default', 'added', 10, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 11:33:29', '2024-07-18 11:33:29'),
(131, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:36:58', '2024-07-18 11:36:58'),
(132, 'default', 'added', 75, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":42500}}', NULL, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(133, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:38:14', '2024-07-18 11:38:14'),
(134, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:39:03', '2024-07-18 11:39:03'),
(135, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:40:09', '2024-07-18 11:40:09'),
(136, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-18 11:50:41', '2024-07-18 11:50:41'),
(137, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 11:51:21', '2024-07-18 11:51:21'),
(138, 'default', 'added', 76, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":42500}}', NULL, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(139, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-18 12:13:35', '2024-07-18 12:13:35'),
(140, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-21 10:56:46', '2024-07-21 10:56:46'),
(141, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-22 10:21:08', '2024-07-22 10:21:09'),
(142, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-22 12:16:09', '2024-07-22 12:16:09'),
(143, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-07-22 12:23:58', '2024-07-22 12:23:58'),
(144, 'default', 'login', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-22 12:24:47', '2024-07-22 12:24:47'),
(145, 'default', 'added', 11, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-22 12:31:21', '2024-07-22 12:31:21'),
(146, 'default', 'added', 12, 'App\\Contact', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-22 12:31:21', '2024-07-22 12:31:21'),
(147, 'default', 'added', 77, 'App\\Transaction', NULL, 3, 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":85000}}', NULL, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(148, 'default', 'logout', 9, 'App\\User', NULL, 3, 9, 'App\\User', '[]', NULL, '2024-07-22 16:23:24', '2024-07-22 16:23:24'),
(149, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-24 06:10:17', '2024-07-24 06:10:17'),
(150, 'default', 'added', 12, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"M Carlie Feno\"}', NULL, '2024-07-24 06:11:54', '2024-07-24 06:11:54'),
(151, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-07-24 06:13:37', '2024-07-24 06:13:37'),
(152, 'default', 'added', 13, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"M Johnny NIAMBA\"}', NULL, '2024-07-24 06:32:05', '2024-07-24 06:32:05'),
(153, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-27 07:56:31', '2024-07-27 07:56:31'),
(154, 'default', 'added', 13, 'App\\Contact', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-27 08:08:00', '2024-07-27 08:08:00'),
(155, 'default', 'added', 80, 'App\\Transaction', NULL, 1, 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":190000}}', NULL, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(156, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-07-31 17:56:54', '2024-07-31 17:56:54'),
(157, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-05 06:12:48', '2024-08-05 06:12:48'),
(158, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-05 06:23:14', '2024-08-05 06:23:14'),
(159, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-05 06:38:23', '2024-08-05 06:38:23'),
(160, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 05:12:05', '2024-08-12 05:12:05'),
(161, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-12 09:06:07', '2024-08-12 09:06:07'),
(162, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-12 09:11:55', '2024-08-12 09:11:55'),
(163, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 09:12:20', '2024-08-12 09:12:20'),
(164, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 09:16:48', '2024-08-12 09:16:48'),
(165, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-12 12:25:07', '2024-08-12 12:25:07'),
(166, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 12:49:51', '2024-08-12 12:49:51'),
(167, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-12 13:18:48', '2024-08-12 13:18:48'),
(168, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 15:00:06', '2024-08-12 15:00:06'),
(169, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 15:35:41', '2024-08-12 15:35:41'),
(170, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-12 15:37:01', '2024-08-12 15:37:01'),
(171, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 15:59:05', '2024-08-12 15:59:05'),
(172, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 16:03:28', '2024-08-12 16:03:28'),
(173, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:09:20', '2024-08-12 16:09:20'),
(174, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:11:23', '2024-08-12 16:11:23'),
(175, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:11:44', '2024-08-12 16:11:44'),
(176, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:12:11', '2024-08-12 16:12:11'),
(177, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 16:24:03', '2024-08-12 16:24:03'),
(178, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 16:24:42', '2024-08-12 16:24:42'),
(179, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:25:46', '2024-08-12 16:25:46'),
(180, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-12 16:37:09', '2024-08-12 16:37:09'),
(181, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 16:37:30', '2024-08-12 16:37:30'),
(182, 'default', 'added', 81, 'App\\Transaction', NULL, 3, 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":1225}}', NULL, '2024-08-12 16:41:44', '2024-08-12 16:41:44'),
(183, 'default', 'sell_deleted', 81, 'App\\Transaction', NULL, 3, 5, 'App\\User', '{\"id\":81,\"invoice_no\":\"2024\\/0002\",\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":\"1225.0000\"}}', NULL, '2024-08-12 16:42:24', '2024-08-12 16:42:24'),
(184, 'default', 'added', 87, 'App\\Transaction', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:07:09', '2024-08-12 17:07:09'),
(185, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:09:45', '2024-08-12 17:09:45'),
(186, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:10:08', '2024-08-12 17:10:08'),
(187, 'default', 'edited', 87, 'App\\Transaction', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:13:37', '2024-08-12 17:13:37'),
(188, 'default', 'shipping_edited', 87, 'App\\Transaction', NULL, 3, 5, 'App\\User', '{\"update_note\":null}', NULL, '2024-08-12 17:15:57', '2024-08-12 17:15:57'),
(189, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:57:11', '2024-08-12 17:57:11'),
(190, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 17:58:06', '2024-08-12 17:58:06'),
(191, 'default', 'added', 88, 'App\\Transaction', NULL, 3, 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":0}}', NULL, '2024-08-12 18:16:53', '2024-08-12 18:16:53'),
(192, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-12 18:22:48', '2024-08-12 18:22:48'),
(193, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-13 06:05:06', '2024-08-13 06:05:06'),
(194, 'default', 'added', 91, 'App\\Transaction', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-13 06:12:44', '2024-08-13 06:12:44'),
(195, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-13 09:25:42', '2024-08-13 09:25:42'),
(196, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-13 09:40:40', '2024-08-13 09:40:40'),
(197, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-14 10:54:03', '2024-08-14 10:54:04'),
(198, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-15 06:54:30', '2024-08-15 06:54:30'),
(199, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-15 08:08:23', '2024-08-15 08:08:23'),
(200, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-15 08:09:49', '2024-08-15 08:09:49'),
(201, 'default', 'login', 14, 'App\\User', NULL, 4, 14, 'App\\User', '[]', NULL, '2024-08-15 09:15:39', '2024-08-15 09:15:39'),
(202, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-15 10:38:48', '2024-08-15 10:38:48'),
(203, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-15 10:43:06', '2024-08-15 10:43:06'),
(204, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-20 06:41:04', '2024-08-20 06:41:04'),
(205, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-20 09:57:37', '2024-08-20 09:57:37'),
(206, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-21 09:01:24', '2024-08-21 09:01:24'),
(207, 'default', 'deleted', 13, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"M Johnny NIAMBA\",\"id\":13}', NULL, '2024-08-21 15:58:01', '2024-08-21 15:58:01'),
(208, 'default', 'deleted', 7, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Erjon Tolaj\",\"id\":7}', NULL, '2024-08-21 15:58:05', '2024-08-21 15:58:05'),
(209, 'default', 'deleted', 6, 'App\\User', NULL, 1, 1, 'App\\User', '{\"name\":\"Mr Daouda SINAYOKO\",\"id\":6}', NULL, '2024-08-21 15:58:08', '2024-08-21 15:58:09'),
(210, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-22 07:54:57', '2024-08-22 07:54:57'),
(211, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-22 07:55:58', '2024-08-22 07:55:58'),
(212, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 08:43:06', '2024-08-22 08:43:06'),
(213, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 08:47:58', '2024-08-22 08:47:58'),
(214, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-22 08:52:47', '2024-08-22 08:52:47'),
(215, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-22 08:53:46', '2024-08-22 08:53:47'),
(216, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 08:56:48', '2024-08-22 08:56:48'),
(217, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:06:00', '2024-08-22 11:06:00'),
(218, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:07:30', '2024-08-22 11:07:30'),
(219, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:09:13', '2024-08-22 11:09:13'),
(220, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:17:31', '2024-08-22 11:17:31'),
(221, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:18:03', '2024-08-22 11:18:04'),
(222, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:26:54', '2024-08-22 11:26:55'),
(223, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:27:17', '2024-08-22 11:27:17'),
(224, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:28:16', '2024-08-22 11:28:17'),
(225, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:28:48', '2024-08-22 11:28:48'),
(226, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:42:21', '2024-08-22 11:42:21'),
(227, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 11:58:01', '2024-08-22 11:58:02'),
(228, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-22 12:13:41', '2024-08-22 12:13:41'),
(229, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 13:40:49', '2024-08-22 13:40:49'),
(230, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-22 13:40:59', '2024-08-22 13:40:59'),
(231, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-22 13:41:24', '2024-08-22 13:41:24'),
(232, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-22 13:41:54', '2024-08-22 13:41:54'),
(233, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-22 15:33:11', '2024-08-22 15:33:11'),
(234, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-22 15:46:16', '2024-08-22 15:46:16'),
(235, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-22 16:18:14', '2024-08-22 16:18:14'),
(236, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-22 17:24:06', '2024-08-22 17:24:06'),
(237, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-23 16:47:09', '2024-08-23 16:47:09'),
(238, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-24 17:36:56', '2024-08-24 17:36:56'),
(239, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 08:52:34', '2024-08-26 08:52:34'),
(240, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 12:07:48', '2024-08-26 12:07:48'),
(241, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 12:08:08', '2024-08-26 12:08:08'),
(242, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 14:25:05', '2024-08-26 14:25:05'),
(243, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 17:14:54', '2024-08-26 17:14:54'),
(244, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 17:17:04', '2024-08-26 17:17:04'),
(245, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-26 17:55:49', '2024-08-26 17:55:49'),
(246, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-26 17:56:43', '2024-08-26 17:56:43'),
(247, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-26 17:56:54', '2024-08-26 17:56:54'),
(248, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-26 18:40:15', '2024-08-26 18:40:15'),
(249, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-26 18:59:30', '2024-08-26 18:59:30'),
(250, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-27 05:55:10', '2024-08-27 05:55:11'),
(251, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-27 10:14:24', '2024-08-27 10:14:24'),
(252, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-27 12:55:01', '2024-08-27 12:55:02'),
(253, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-27 13:34:39', '2024-08-27 13:34:39'),
(254, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-27 13:34:55', '2024-08-27 13:34:55'),
(255, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-27 17:17:08', '2024-08-27 17:17:08'),
(256, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-28 05:48:40', '2024-08-28 05:48:40'),
(257, 'default', 'added', 92, 'App\\Transaction', NULL, 1, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":471250}}', NULL, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(258, 'default', 'added', 93, 'App\\Transaction', NULL, 1, 12, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":447688}}', NULL, '2024-08-28 05:49:56', '2024-08-28 05:49:56'),
(259, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-29 08:54:39', '2024-08-29 08:54:39'),
(260, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-08-29 09:00:47', '2024-08-29 09:00:47'),
(261, 'default', 'edited', 9, 'App\\User', NULL, 3, 5, 'App\\User', '{\"name\":\" Bacongo toto\"}', NULL, '2024-08-29 09:02:48', '2024-08-29 09:02:48'),
(262, 'default', 'added', 94, 'App\\Transaction', NULL, 3, 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"final_total\":1250}}', NULL, '2024-08-29 09:11:59', '2024-08-29 09:11:59'),
(263, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-29 09:13:28', '2024-08-29 09:13:28'),
(264, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-29 09:17:46', '2024-08-29 09:17:46'),
(265, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-29 09:19:34', '2024-08-29 09:19:34'),
(266, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-08-29 09:20:59', '2024-08-29 09:20:59'),
(267, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-08-29 09:21:25', '2024-08-29 09:21:25'),
(268, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-30 06:18:12', '2024-08-30 06:18:12'),
(269, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-08-30 08:58:06', '2024-08-30 08:58:06'),
(270, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-02 15:11:36', '2024-09-02 15:11:36'),
(271, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-02 16:50:59', '2024-09-02 16:50:59'),
(272, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-03 05:10:12', '2024-09-03 05:10:12'),
(273, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-03 09:57:58', '2024-09-03 09:57:58'),
(274, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-03 10:46:11', '2024-09-03 10:46:11'),
(275, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-03 13:50:11', '2024-09-03 13:50:11'),
(276, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-03 14:50:12', '2024-09-03 14:50:12'),
(277, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-09-04 10:57:36', '2024-09-04 10:57:36'),
(278, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-09-04 11:11:47', '2024-09-04 11:11:47'),
(279, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:17:07', '2024-09-05 07:17:07'),
(280, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:48:48', '2024-09-05 07:48:48'),
(281, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:49:13', '2024-09-05 07:49:13'),
(282, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-05 07:51:34', '2024-09-05 07:51:34'),
(283, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:53:31', '2024-09-05 07:53:31'),
(284, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:57:55', '2024-09-05 07:57:55'),
(285, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 07:58:45', '2024-09-05 07:58:45'),
(286, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-09-05 07:59:12', '2024-09-05 07:59:12'),
(287, 'default', 'added', 95, 'App\\Transaction', NULL, 1, 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4350}}', NULL, '2024-09-05 08:04:22', '2024-09-05 08:04:22'),
(288, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-05 08:42:11', '2024-09-05 08:42:11'),
(289, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 09:42:27', '2024-09-05 09:42:27'),
(290, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 09:43:25', '2024-09-05 09:43:25'),
(291, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 09:44:18', '2024-09-05 09:44:18'),
(292, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 10:06:14', '2024-09-05 10:06:14'),
(293, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 10:41:17', '2024-09-05 10:41:17'),
(294, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-05 11:06:05', '2024-09-05 11:06:05'),
(295, 'default', 'logout', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-09-05 12:02:41', '2024-09-05 12:02:41'),
(296, 'default', 'login', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 12:55:30', '2024-09-05 12:55:30'),
(297, 'default', 'logout', 5, 'App\\User', NULL, 3, 5, 'App\\User', '[]', NULL, '2024-09-05 15:15:17', '2024-09-05 15:15:17'),
(298, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-05 17:20:36', '2024-09-05 17:20:36'),
(299, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-06 06:35:24', '2024-09-06 06:35:24'),
(300, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-06 10:23:51', '2024-09-06 10:23:51'),
(301, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-06 10:26:03', '2024-09-06 10:26:03'),
(302, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-06 10:26:14', '2024-09-06 10:26:14'),
(303, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-06 19:33:05', '2024-09-06 19:33:05'),
(304, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-08 16:44:18', '2024-09-08 16:44:18'),
(305, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 06:37:54', '2024-09-09 06:37:54'),
(306, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 07:36:31', '2024-09-09 07:36:31'),
(307, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 07:53:33', '2024-09-09 07:53:33'),
(308, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 07:53:41', '2024-09-09 07:53:41'),
(309, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 12:52:13', '2024-09-09 12:52:13'),
(310, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-09 16:37:08', '2024-09-09 16:37:08'),
(311, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-10 06:06:42', '2024-09-10 06:06:42'),
(312, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-10 15:17:46', '2024-09-10 15:17:46'),
(313, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-10 18:19:58', '2024-09-10 18:19:58'),
(314, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-10 18:56:05', '2024-09-10 18:56:05'),
(315, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-11 03:15:24', '2024-09-11 03:15:24'),
(316, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-11 04:03:02', '2024-09-11 04:03:02'),
(317, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-11 09:01:25', '2024-09-11 09:01:25'),
(318, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-11 19:23:43', '2024-09-11 19:23:43'),
(319, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-11 19:23:53', '2024-09-11 19:23:53'),
(320, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-12 12:16:20', '2024-09-12 12:16:20'),
(321, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-12 12:38:21', '2024-09-12 12:38:21'),
(322, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-13 16:21:47', '2024-09-13 16:21:47'),
(323, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-14 07:13:40', '2024-09-14 07:13:40'),
(324, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-14 08:29:10', '2024-09-14 08:29:10'),
(325, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-14 13:42:33', '2024-09-14 13:42:33'),
(326, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-14 19:40:25', '2024-09-14 19:40:25'),
(327, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-14 20:16:19', '2024-09-14 20:16:19'),
(328, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-15 14:20:51', '2024-09-15 14:20:51'),
(329, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-15 14:33:33', '2024-09-15 14:33:33'),
(330, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-15 15:32:32', '2024-09-15 15:32:32'),
(331, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-16 02:09:08', '2024-09-16 02:09:08'),
(332, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-16 12:54:27', '2024-09-16 12:54:27'),
(333, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-17 04:08:47', '2024-09-17 04:08:47'),
(334, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-17 06:28:31', '2024-09-17 06:28:31'),
(335, 'default', 'login', 2, 'App\\User', NULL, 1, 2, 'App\\User', '[]', NULL, '2024-09-17 06:34:50', '2024-09-17 06:34:50'),
(336, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-17 06:35:20', '2024-09-17 06:35:20'),
(337, 'default', 'logout', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-17 06:40:25', '2024-09-17 06:40:25'),
(338, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-17 06:40:32', '2024-09-17 06:40:32'),
(339, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-17 06:41:01', '2024-09-17 06:41:01'),
(340, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-17 07:19:32', '2024-09-17 07:19:32'),
(341, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-17 08:05:37', '2024-09-17 08:05:37'),
(342, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-17 15:41:15', '2024-09-17 15:41:16'),
(343, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-18 05:50:21', '2024-09-18 05:50:21'),
(344, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-18 10:52:46', '2024-09-18 10:52:46'),
(345, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-18 11:24:17', '2024-09-18 11:24:17'),
(346, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-18 14:20:12', '2024-09-18 14:20:12'),
(347, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-18 14:42:12', '2024-09-18 14:42:12'),
(348, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-18 21:29:52', '2024-09-18 21:29:52'),
(349, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-19 05:55:11', '2024-09-19 05:55:11'),
(350, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-20 07:47:29', '2024-09-20 07:47:29'),
(351, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 08:42:18', '2024-09-20 08:42:18'),
(352, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-20 09:07:47', '2024-09-20 09:07:47'),
(353, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:21:49', '2024-09-20 09:21:49'),
(354, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:22:11', '2024-09-20 09:22:11'),
(355, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:22:28', '2024-09-20 09:22:28'),
(356, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:22:46', '2024-09-20 09:22:46'),
(357, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:23:31', '2024-09-20 09:23:31'),
(358, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:25:01', '2024-09-20 09:25:01'),
(359, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:25:31', '2024-09-20 09:25:31'),
(360, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-20 09:39:46', '2024-09-20 09:39:46'),
(361, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-23 06:38:37', '2024-09-23 06:38:37');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `event`, `business_id`, `causer_id`, `causer_type`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(362, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-25 12:52:16', '2024-09-25 12:52:16'),
(363, 'default', 'added', 15, 'App\\User', NULL, 1, 12, 'App\\User', '{\"name\":\"M Daouda SINAYOGO\"}', NULL, '2024-09-25 12:53:49', '2024-09-25 12:53:49'),
(364, 'default', 'login', 15, 'App\\User', NULL, 1, 15, 'App\\User', '[]', NULL, '2024-09-25 12:55:44', '2024-09-25 12:55:44'),
(365, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-30 12:36:29', '2024-09-30 12:36:29'),
(366, 'default', 'added', 16, 'App\\User', NULL, 1, 12, 'App\\User', '{\"name\":\"M Reda assemghor\"}', NULL, '2024-09-30 12:41:30', '2024-09-30 12:41:30'),
(367, 'default', 'login', 16, 'App\\User', NULL, 1, 16, 'App\\User', '[]', NULL, '2024-09-30 12:43:54', '2024-09-30 12:43:54'),
(368, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-09-30 13:24:16', '2024-09-30 13:24:16'),
(369, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-30 13:53:25', '2024-09-30 13:53:25'),
(370, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-30 16:25:34', '2024-09-30 16:25:34'),
(371, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-09-30 18:43:45', '2024-09-30 18:43:45'),
(372, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-10-01 07:12:28', '2024-10-01 07:12:28'),
(373, 'default', 'login', 16, 'App\\User', NULL, 1, 16, 'App\\User', '[]', NULL, '2024-10-01 07:17:33', '2024-10-01 07:17:33'),
(374, 'default', 'login', 16, 'App\\User', NULL, 1, 16, 'App\\User', '[]', NULL, '2024-10-02 09:45:11', '2024-10-02 09:45:11'),
(375, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-02 11:48:53', '2024-10-02 11:48:53'),
(376, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-02 11:49:15', '2024-10-02 11:49:15'),
(377, 'default', 'logout', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-02 12:07:06', '2024-10-02 12:07:06'),
(378, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-10-02 13:04:29', '2024-10-02 13:04:29'),
(379, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-04 15:57:56', '2024-10-04 15:57:56'),
(380, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-07 20:24:02', '2024-10-07 20:24:02'),
(381, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-08 08:20:23', '2024-10-08 08:20:23'),
(382, 'default', 'login', 1, 'App\\User', NULL, 1, 1, 'App\\User', '[]', NULL, '2024-10-11 16:35:10', '2024-10-11 16:35:10'),
(383, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-10-17 08:05:51', '2024-10-17 08:05:51'),
(384, 'default', 'login', 12, 'App\\User', NULL, 1, 12, 'App\\User', '[]', NULL, '2024-10-17 08:47:25', '2024-10-17 08:47:25');

-- --------------------------------------------------------

--
-- Structure de la table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_continuous` tinyint(1) NOT NULL DEFAULT 0,
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 05:13:44', '2017-12-18 05:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 05:04:39', '2017-12-18 05:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 04:55:40', '2017-12-18 04:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 04:58:40', '2017-12-18 04:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 04:51:10', '2017-12-18 04:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 04:51:10', '2017-12-18 04:51:10');

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) NOT NULL,
  `booking_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `use_for_repair` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'brands to be used on repair module',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `use_for_repair`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'HP', 'Hewlett-Packard', 2, 1, NULL, '2024-07-11 15:16:43', '2024-07-11 21:48:04'),
(2, 1, 'Apple', 'Apple', 1, 1, NULL, '2024-07-12 14:20:05', '2024-07-12 14:20:13'),
(3, 1, 'Dell', 'Dell', 1, 1, NULL, '2024-07-12 14:20:22', '2024-07-12 14:20:22'),
(4, 1, 'Lenovo', NULL, 1, 1, NULL, '2024-07-12 14:32:03', '2024-07-12 14:32:03'),
(5, 1, 'Asus', NULL, 1, 1, NULL, '2024-07-12 14:32:11', '2024-07-12 14:32:11'),
(6, 1, 'Acer', NULL, 1, 1, NULL, '2024-07-12 14:32:19', '2024-07-12 14:32:19'),
(7, 1, 'Acer', NULL, 1, 1, '2024-07-12 14:33:46', '2024-07-12 14:33:00', '2024-07-12 14:33:46'),
(8, 1, 'MSI (Micro-Star International)', NULL, 1, 1, NULL, '2024-07-12 14:33:10', '2024-07-12 14:33:10'),
(9, 1, 'Razer', NULL, 1, 1, NULL, '2024-07-12 14:33:18', '2024-07-12 14:33:18'),
(10, 1, 'Microsoft (Surface)', NULL, 1, 1, NULL, '2024-07-12 14:33:26', '2024-07-12 14:33:26'),
(11, 1, 'Samsung', NULL, 1, 1, NULL, '2024-07-12 14:33:36', '2024-07-12 14:33:36'),
(12, 1, 'Composants Internes', NULL, 6, 0, '2024-07-16 05:41:36', '2024-07-12 16:37:33', '2024-07-16 05:41:36'),
(13, 1, 'Intel', 'Processeurs, cartes mères', 6, 0, NULL, '2024-07-12 16:38:23', '2024-07-12 16:38:23'),
(14, 1, 'AMD', 'Processeurs, cartes graphiques', 6, 0, NULL, '2024-07-12 16:39:01', '2024-07-12 16:39:01'),
(15, 1, 'NVIDIA', 'Cartes graphiques', 6, 0, NULL, '2024-07-12 16:39:21', '2024-07-12 16:39:21'),
(16, 1, 'ASRock', 'Cartes mères', 6, 0, '2024-07-16 05:39:46', '2024-07-12 16:40:01', '2024-07-16 05:39:46'),
(17, 1, 'Gigabyte', 'Cartes mères, cartes graphiques', 6, 0, NULL, '2024-07-12 16:40:19', '2024-07-12 16:40:19'),
(18, 1, 'MSI', 'Cartes mères, cartes graphiques', 6, 0, NULL, '2024-07-12 16:40:37', '2024-07-12 16:40:37'),
(19, 1, 'NVIDIA', 'Cartes graphiques', 6, 0, NULL, '2024-07-15 17:16:02', '2024-07-15 17:16:02'),
(20, 1, 'ASRock', 'Cartes mères', 6, 0, NULL, '2024-07-15 17:16:34', '2024-07-15 17:16:34'),
(21, 1, 'Gigabyte', 'Cartes mères, cartes graphiques', 6, 0, NULL, '2024-07-15 17:17:11', '2024-07-15 17:17:11'),
(22, 1, 'MSI', 'Cartes mères, cartes graphiques', 6, 0, NULL, '2024-07-15 17:17:36', '2024-07-15 17:17:36'),
(23, 1, 'Corsair', 'RAM, alimentation, boîtiers, refroidissement', 6, 0, NULL, '2024-07-15 17:17:54', '2024-07-15 17:17:54'),
(24, 1, 'Kingston', 'RAM, stockage', 6, 0, NULL, '2024-07-15 17:18:12', '2024-07-15 17:18:12'),
(25, 1, 'G.Skill', 'RAM', 6, 0, NULL, '2024-07-15 17:18:32', '2024-07-15 17:18:32'),
(26, 1, 'Seagate', 'Stockage', 6, 0, NULL, '2024-07-15 17:18:54', '2024-07-15 17:18:54'),
(27, 1, 'Western Digital', 'Stockage', 6, 0, NULL, '2024-07-15 17:19:16', '2024-07-15 17:19:16'),
(28, 1, 'Samsung', 'Stockage SSD', 6, 0, NULL, '2024-07-15 17:19:37', '2024-07-15 17:19:37'),
(29, 1, 'Crucial', 'RAM, stockage', 6, 0, NULL, '2024-07-15 17:20:01', '2024-07-15 17:20:01'),
(30, 1, 'Périphériques', NULL, 6, 0, NULL, '2024-07-15 17:20:32', '2024-07-15 17:20:32'),
(31, 1, 'Logitech', 'Claviers, souris, webcams', 6, 0, NULL, '2024-07-15 17:20:53', '2024-07-15 17:20:53'),
(32, 1, 'Razer', 'Claviers, souris, casques', 6, 0, NULL, '2024-07-15 17:21:12', '2024-07-15 17:21:12'),
(33, 1, 'Corsair', 'Claviers, souris, casques', 6, 0, '2024-07-16 05:41:45', '2024-07-15 17:21:38', '2024-07-16 05:41:45'),
(34, 1, 'Microsoft', 'Claviers, souris', 6, 0, NULL, '2024-07-15 17:21:56', '2024-07-15 17:21:56'),
(35, 1, 'SteelSeries', 'Claviers, souris, casques', 6, 0, NULL, '2024-07-15 17:22:22', '2024-07-15 17:22:22'),
(36, 1, 'HyperX', 'Casques, claviers, souris', 6, 0, NULL, '2024-07-15 17:22:41', '2024-07-15 17:22:41'),
(37, 1, 'Creative', 'Haut-parleurs, cartes son', 6, 0, NULL, '2024-07-15 17:23:10', '2024-07-15 17:23:10'),
(38, 1, 'BenQ', 'Moniteurs', 6, 0, NULL, '2024-07-15 17:23:32', '2024-07-15 17:23:32'),
(39, 1, 'Dell', 'Moniteurs', 6, 0, '2024-07-16 05:42:07', '2024-07-15 17:23:57', '2024-07-16 05:42:07'),
(40, 1, 'AOC', 'Moniteurs', 6, 0, NULL, '2024-07-15 17:24:11', '2024-07-15 17:24:11'),
(41, 1, 'HP', 'Imprimantes, scanners', 6, 0, NULL, '2024-07-15 17:24:41', '2024-07-15 17:24:41'),
(42, 1, 'Canon', 'Imprimantes, scanners', 6, 0, NULL, '2024-07-15 17:24:53', '2024-07-15 17:24:53'),
(43, 1, 'Epson', 'Imprimantes, scanners', 6, 0, NULL, '2024-07-15 17:25:08', '2024-07-15 17:25:08'),
(44, 1, 'Brother', 'Imprimantes, scanners', 6, 0, NULL, '2024-07-15 17:25:29', '2024-07-15 17:25:29'),
(45, 1, 'Stockage Externe et Support de Stockage', NULL, 6, 0, NULL, '2024-07-15 17:25:46', '2024-07-15 17:25:46'),
(46, 1, 'Seagate', NULL, 6, 0, NULL, '2024-07-15 17:25:58', '2024-07-15 17:25:58'),
(47, 1, 'Western Digital', 'WD', 6, 0, NULL, '2024-07-15 17:26:16', '2024-07-15 17:26:16'),
(48, 1, 'SanDisk', 'Cartes mémoire, clés USB', 6, 0, NULL, '2024-07-15 17:26:39', '2024-07-15 17:26:39'),
(49, 1, 'Samsung', NULL, 6, 0, NULL, '2024-07-15 17:26:48', '2024-07-15 17:26:48'),
(50, 1, 'Kingston', NULL, 6, 0, NULL, '2024-07-15 17:26:58', '2024-07-15 17:26:58'),
(51, 1, 'Crucial', NULL, 6, 0, '2024-07-16 05:41:57', '2024-07-15 17:27:09', '2024-07-16 05:41:57'),
(52, 1, 'Toshiba', NULL, 6, 0, NULL, '2024-07-15 17:27:19', '2024-07-15 17:27:19'),
(53, 1, 'Réseaux et Communication', NULL, 6, 0, NULL, '2024-07-15 17:27:33', '2024-07-15 17:27:33'),
(54, 1, 'Netgear', NULL, 6, 0, NULL, '2024-07-15 17:28:04', '2024-07-15 17:28:04'),
(55, 1, 'TP-Link', NULL, 6, 0, NULL, '2024-07-15 17:28:17', '2024-07-15 17:28:17'),
(56, 1, 'Asus', NULL, 6, 0, '2024-07-16 05:39:51', '2024-07-15 17:28:27', '2024-07-16 05:39:51'),
(57, 1, 'Linksys', NULL, 6, 0, NULL, '2024-07-15 17:28:36', '2024-07-15 17:28:36'),
(58, 1, 'D-Link', NULL, 6, 0, NULL, '2024-07-15 17:28:46', '2024-07-15 17:28:46'),
(59, 1, 'Cisco', NULL, 6, 0, NULL, '2024-07-15 17:28:57', '2024-07-15 17:28:57'),
(60, 1, 'Ubiquiti', NULL, 6, 0, NULL, '2024-07-15 17:29:09', '2024-07-15 17:29:09'),
(61, 1, 'Équipements pour Gaming', NULL, 6, 0, NULL, '2024-07-15 17:29:26', '2024-07-15 17:29:26'),
(62, 1, 'Alienware', 'Dell', 6, 0, NULL, '2024-07-15 17:29:47', '2024-07-15 17:29:47'),
(63, 1, 'Asus ROG', 'Republic of Gamers', 6, 0, NULL, '2024-07-15 17:30:05', '2024-07-15 17:30:05'),
(64, 1, 'MSI', NULL, 6, 0, NULL, '2024-07-15 17:30:15', '2024-07-15 17:30:15'),
(65, 1, 'Razer', NULL, 6, 0, NULL, '2024-07-15 17:30:24', '2024-07-15 17:30:24'),
(66, 1, 'Corsair', NULL, 6, 0, '2024-07-16 05:41:50', '2024-07-15 17:30:33', '2024-07-16 05:41:50'),
(67, 1, 'Logitech G', NULL, 6, 0, NULL, '2024-07-15 17:30:43', '2024-07-15 17:30:43'),
(68, 1, 'SteelSeries', NULL, 6, 0, NULL, '2024-07-15 17:30:54', '2024-07-15 17:30:54'),
(69, 1, 'HyperX', NULL, 6, 0, NULL, '2024-07-15 17:31:03', '2024-07-15 17:31:03'),
(70, 1, 'Acer Predator', NULL, 6, 0, '2024-07-16 05:39:28', '2024-07-15 17:31:29', '2024-07-16 05:39:28'),
(71, 1, 'HP Omen', NULL, 6, 0, NULL, '2024-07-15 17:31:40', '2024-07-15 17:31:40'),
(72, 1, 'Logiciels', NULL, 6, 0, NULL, '2024-07-15 17:31:50', '2024-07-15 17:31:50'),
(73, 1, 'Microsoft', 'Windows, Office', 6, 0, NULL, '2024-07-15 17:32:07', '2024-07-15 17:32:07'),
(74, 1, 'Apple', 'macOS', 6, 0, '2024-07-16 05:39:37', '2024-07-15 17:32:37', '2024-07-16 05:39:37'),
(75, 1, 'Adobe', 'Creative Suite', 6, 0, NULL, '2024-07-15 17:32:55', '2024-07-15 17:32:55'),
(76, 1, 'Google', 'Workspace', 6, 0, NULL, '2024-07-15 17:33:19', '2024-07-15 17:33:19'),
(77, 1, 'Intuit', 'QuickBooks', 6, 0, NULL, '2024-07-15 17:33:40', '2024-07-15 17:33:40'),
(78, 1, 'Autodesk', 'AutoCAD, Maya', 6, 0, NULL, '2024-07-15 17:33:57', '2024-07-15 17:33:57'),
(79, 1, 'Symantec', 'Norton Antivirus', 6, 0, NULL, '2024-07-15 17:34:12', '2024-07-15 17:34:12'),
(80, 1, 'McAfee', 'McAfee', 6, 0, NULL, '2024-07-15 17:34:41', '2024-07-15 17:34:41'),
(81, 1, 'Kaspersky', 'Antivirus', 6, 0, NULL, '2024-07-15 17:35:01', '2024-07-15 17:35:01'),
(82, 1, 'Impression et Scanners', NULL, 6, 0, NULL, '2024-07-15 17:35:13', '2024-07-15 17:35:13'),
(83, 1, 'HP', 'Hewlett-Packard', 6, 0, NULL, '2024-07-15 17:35:27', '2024-07-15 17:35:27'),
(84, 1, 'Canon', NULL, 6, 0, '2024-07-16 05:40:21', '2024-07-15 17:35:43', '2024-07-16 05:40:21'),
(85, 1, 'Epson', NULL, 6, 0, NULL, '2024-07-15 17:35:51', '2024-07-15 17:35:51'),
(86, 1, 'Brother', NULL, 6, 0, '2024-07-16 05:39:55', '2024-07-15 17:35:58', '2024-07-16 05:39:55'),
(87, 1, 'Lexmark', NULL, 6, 0, NULL, '2024-07-15 17:36:07', '2024-07-15 17:36:07'),
(88, 1, 'Xerox', NULL, 6, 0, NULL, '2024-07-15 17:36:22', '2024-07-15 17:36:22'),
(89, 1, 'Accessoires et Consommables', NULL, 6, 0, NULL, '2024-07-15 17:36:37', '2024-07-15 17:36:37'),
(90, 1, 'Anker', 'Chargeurs, batteries, câbles', 6, 0, NULL, '2024-07-15 17:36:58', '2024-07-15 17:37:26'),
(91, 1, 'Belkin', 'Câbles, adaptateurs', 6, 0, NULL, '2024-07-15 17:38:03', '2024-07-15 17:38:03'),
(92, 1, 'ripp Lite', 'Onduleurs, protecteurs de surtension', 6, 0, NULL, '2024-07-15 17:38:20', '2024-07-15 17:38:20'),
(93, 1, 'Cable Matters', 'Câbles, adaptateurs', 6, 0, NULL, '2024-07-15 17:38:38', '2024-07-15 17:38:38'),
(94, 1, 'StarTech', 'Câbles, adaptateurs', 6, 0, NULL, '2024-07-15 17:38:57', '2024-07-15 17:38:57'),
(95, 1, 'Sécurité et Surveillance', NULL, 6, 0, NULL, '2024-07-15 17:39:15', '2024-07-15 17:39:15'),
(96, 1, 'Arlo', NULL, 6, 0, NULL, '2024-07-15 17:39:42', '2024-07-15 17:39:42'),
(97, 1, 'Nest', 'Google', 6, 0, NULL, '2024-07-15 17:40:14', '2024-07-15 17:40:14'),
(98, 1, 'Ring', 'Amazon', 6, 0, NULL, '2024-07-15 17:40:40', '2024-07-15 17:40:40'),
(99, 1, 'Hikvision', NULL, 6, 0, NULL, '2024-07-15 17:40:49', '2024-07-15 17:40:49'),
(100, 1, 'Dahua Technology', NULL, 6, 0, NULL, '2024-07-15 17:40:58', '2024-07-15 17:40:58'),
(101, 1, 'Logitech', NULL, 6, 0, NULL, '2024-07-15 17:41:07', '2024-07-15 17:41:07'),
(102, 1, 'Swann', NULL, 6, 0, NULL, '2024-07-15 17:41:18', '2024-07-15 17:41:18'),
(103, 1, 'Équipements de Bureau', NULL, 6, 0, NULL, '2024-07-15 17:41:29', '2024-07-15 17:41:29'),
(104, 1, 'APC (Schneider Electric)', 'Onduleurs', 6, 0, NULL, '2024-07-15 17:42:24', '2024-07-15 17:42:24'),
(105, 1, 'Tripp Lite', 'Onduleurs, protecteurs de surtension', 6, 0, NULL, '2024-07-15 17:42:44', '2024-07-15 17:42:44'),
(106, 1, 'Ergotron', 'Supports d\'écran, mobilier ergonomique', 6, 0, NULL, '2024-07-15 17:43:02', '2024-07-15 17:43:02'),
(107, 1, 'Humanscale', 'Mobilier ergonomique', 6, 0, NULL, '2024-07-15 17:43:18', '2024-07-15 17:43:18'),
(108, 1, 'ACER Aspire PC de bureau', 'RAM 4Go - HDD 930Go - Windows 10 Pro', 6, 0, '2024-07-16 05:39:08', '2024-07-15 18:47:05', '2024-07-16 05:39:08'),
(109, 1, 'LENOVO THINKPAD X230 SOUS WINDOWS 10 - RAM 8 GO - HDD 500 GO', 'PC Portable LENOVO THINKPAD X230 reconditionné. Ce Pc portable Lenovo de la gamme Thinkpad possède une plasturgie solide. Il est équipé de 8 Go de mémoire vive. Il dispose d\'un écran 15,4 pouces.', 6, 0, NULL, '2024-07-15 18:48:00', '2024-07-15 18:48:00'),
(110, 1, 'DELL LATITUDE E6410', NULL, 6, 0, NULL, '2024-07-15 18:48:34', '2024-07-15 18:48:34'),
(111, 1, 'PC PORTABLE DELL', NULL, 6, 0, NULL, '2024-07-15 18:48:50', '2024-07-15 18:48:50'),
(112, 1, 'Ordinateur portable Toshiba', NULL, 6, 0, NULL, '2024-07-15 18:49:05', '2024-07-15 18:49:05'),
(113, 1, 'TSP100III Series', NULL, 6, 0, NULL, '2024-07-15 18:49:21', '2024-07-15 18:49:21'),
(114, 1, 'Adaptateur secteur Apple 60 W MagSafe 2 (alimentation pour MacBook Pro 13\" avec écran Retina)', NULL, 6, 0, '2024-07-16 05:39:12', '2024-07-15 18:49:37', '2024-07-16 05:39:12'),
(115, 1, 'Câble d\'objectif Polycom HDCI', NULL, 6, 0, '2024-07-16 05:40:25', '2024-07-15 18:52:39', '2024-07-16 05:40:25'),
(116, 1, 'Universal screen protector cutter', NULL, 6, 0, NULL, '2024-07-15 18:52:55', '2024-07-15 18:52:55'),
(117, 1, 'Filtre de confidentialité DICOTA D30895 , ordinateur portable 14\", 16:9', NULL, 6, 0, NULL, '2024-07-15 18:53:09', '2024-07-15 18:53:09'),
(118, 1, 'LENOVO THINKCENTRE M72E TINY- WINDOWS 10', NULL, 6, 0, NULL, '2024-07-15 18:54:33', '2024-07-15 18:54:33'),
(119, 1, 'Lenovo Ultra Mini PC', NULL, 6, 0, NULL, '2024-07-15 18:55:35', '2024-07-15 18:55:35'),
(120, 1, 'DELL 9020 SFF', NULL, 6, 0, NULL, '2024-07-15 18:56:25', '2024-07-15 18:56:25'),
(121, 1, 'Code: MO1013 Marque : RoSH', NULL, 6, 0, '2024-07-16 05:41:21', '2024-07-15 18:56:47', '2024-07-16 05:41:21'),
(122, 1, 'Ubiquiti Networks 24-Poe', NULL, 6, 0, NULL, '2024-07-15 18:57:01', '2024-07-15 18:57:01'),
(123, 1, 'Datalogic Touch 90', NULL, 6, 0, NULL, '2024-07-15 19:02:26', '2024-07-15 19:02:26'),
(124, 1, 'Boîtier externe USB 2.0 2.5 IDE en aluminium et argent', NULL, 6, 0, '2024-07-16 05:40:15', '2024-07-15 19:02:42', '2024-07-16 05:40:15'),
(125, 1, 'Canon CS100', NULL, 6, 0, '2024-07-16 05:40:31', '2024-07-15 19:04:47', '2024-07-16 05:40:31'),
(126, 1, 'Cisco 5508 Wireless Controller', NULL, 6, 0, '2024-07-16 05:40:48', '2024-07-15 19:05:00', '2024-07-16 05:40:48'),
(127, 1, 'Cisco ASA 5510 Firewall', NULL, 6, 0, '2024-07-16 05:40:51', '2024-07-15 19:05:15', '2024-07-16 05:40:51'),
(128, 1, 'SWITCH ZYXEL', NULL, 6, 0, NULL, '2024-07-15 19:05:26', '2024-07-15 19:05:26'),
(129, 1, 'SWITCH HP', NULL, 6, 0, NULL, '2024-07-15 19:10:00', '2024-07-15 19:10:00'),
(130, 1, 'Cisco Catalyst 4500-X', NULL, 6, 0, '2024-07-16 05:40:53', '2024-07-15 19:10:13', '2024-07-16 05:40:53'),
(131, 1, 'Commutateur réseau Cisco Catalyst 2960X-24PS-L', NULL, 6, 0, '2024-07-16 05:41:33', '2024-07-15 19:10:24', '2024-07-16 05:41:33'),
(132, 1, 'PLANET FGSW-2620', NULL, 6, 0, NULL, '2024-07-15 19:10:35', '2024-07-15 19:10:35'),
(133, 1, 'Commutateur intelligent Netgea', NULL, 6, 0, '2024-07-16 05:41:30', '2024-07-15 19:10:47', '2024-07-16 05:41:30'),
(134, 1, 'Dell PowerConnect 2848', NULL, 6, 0, NULL, '2024-07-15 19:11:04', '2024-07-15 19:11:04'),
(135, 1, 'Commutateur Dell N3024F', NULL, 6, 0, '2024-07-16 05:41:26', '2024-07-15 19:11:14', '2024-07-16 05:41:26'),
(136, 1, 'HP 2530–24 G-PoE', NULL, 6, 0, NULL, '2024-07-15 19:11:24', '2024-07-15 19:11:24'),
(137, 1, 'Cisco Systems 1700 Séries', NULL, 6, 0, '2024-07-16 05:41:06', '2024-07-15 19:11:38', '2024-07-16 05:41:06'),
(138, 1, 'NETGEAR Switch non géré Fast Ethernet 10/100', NULL, 6, 0, NULL, '2024-07-15 19:11:47', '2024-07-15 19:11:47'),
(139, 1, 'Switch non géré Ethernet Gigabit NETGEAR 16 ports (GS116NA)', NULL, 6, 0, NULL, '2024-07-15 19:11:57', '2024-07-15 19:11:57'),
(140, 1, 'Apple iPad 2 32GB 3G - Black', NULL, 6, 0, '2024-07-16 05:39:41', '2024-07-15 19:12:10', '2024-07-16 05:39:41'),
(141, 1, 'Cisco AIR-CAP3702I-A-K9', NULL, 6, 0, '2024-07-16 05:40:57', '2024-07-15 19:12:20', '2024-07-16 05:40:57'),
(142, 1, 'Jabra Evolve 75 Headset Sans Fil', NULL, 6, 0, NULL, '2024-07-15 19:12:37', '2024-07-15 19:12:37'),
(143, 1, 'GN Netcom GN 9120', NULL, 6, 0, NULL, '2024-07-15 19:12:49', '2024-07-15 19:12:49'),
(144, 1, 'MOBILAX CONNECT', NULL, 6, 0, NULL, '2024-07-15 19:13:00', '2024-07-15 19:13:00'),
(145, 1, 'Turtle Beach', NULL, 6, 0, NULL, '2024-07-15 19:13:11', '2024-07-15 19:13:11'),
(146, 1, 'Jabra Evolve2 40 Casque PC', NULL, 6, 0, NULL, '2024-07-15 19:13:31', '2024-07-15 19:13:31'),
(147, 1, 'Harman Kardon - Omni Adaptateur', NULL, 6, 0, NULL, '2024-07-15 19:13:41', '2024-07-15 19:13:41'),
(148, 1, 'Jabra Speak 510 Speaker', NULL, 6, 0, NULL, '2024-07-15 19:13:50', '2024-07-15 19:13:50'),
(149, 1, 'High speed 4 Ports', NULL, 6, 0, NULL, '2024-07-15 19:14:04', '2024-07-15 19:14:04'),
(150, 1, 'Xerox AltaLink C8070', NULL, 6, 0, NULL, '2024-07-15 19:14:15', '2024-07-15 19:14:15'),
(151, 1, 'Konica Minolta développe une imprimante laser couleur Ineo+ 3110 MFP qui a imprimé plus de 150 000 pages', NULL, 6, 0, NULL, '2024-07-15 19:14:26', '2024-07-15 19:14:26'),
(152, 1, 'Ricoh Aficio MP C4503', NULL, 6, 0, NULL, '2024-07-15 19:14:37', '2024-07-15 19:14:37'),
(153, 1, 'HP LaserJet Pro 100 color MFP M175nw', NULL, 6, 0, NULL, '2024-07-15 19:14:47', '2024-07-15 19:14:47'),
(154, 1, 'Dell C2665DNF Imprimante Laser Couleur 28 ppm Ethernet', NULL, 6, 0, NULL, '2024-07-15 19:14:57', '2024-07-15 19:14:57'),
(155, 1, 'HP LaserJet Pro M428fdw', NULL, 6, 0, NULL, '2024-07-15 19:15:08', '2024-07-15 19:15:08'),
(156, 1, 'Polycom HDX 4000 20.1', NULL, 6, 0, NULL, '2024-07-15 19:15:19', '2024-07-15 19:15:19'),
(157, 1, 'NEC PA853W - Projecteur 3-LCD - 3D - 8500 ANSI lumens - WXGA (1280 x 800)', NULL, 6, 0, NULL, '2024-07-15 19:15:30', '2024-07-15 19:15:30'),
(158, 1, 'UniFi Talk Phone Touch', NULL, 6, 0, NULL, '2024-07-15 19:15:42', '2024-07-15 19:15:42'),
(159, 1, 'HP - PC Webcam 320 FHD', NULL, 6, 0, NULL, '2024-07-15 19:15:52', '2024-07-15 19:15:52'),
(160, 1, 'Vivitek DH856 Projecteur', NULL, 6, 0, NULL, '2024-07-15 19:16:02', '2024-07-15 19:16:02'),
(161, 1, 'Cisco IP PHONE 8811 SERIES', NULL, 6, 0, '2024-07-16 05:40:55', '2024-07-15 19:16:13', '2024-07-16 05:40:55'),
(162, 1, 'Câbles', NULL, 6, 0, NULL, '2024-07-15 19:16:48', '2024-07-15 19:57:42'),
(163, 1, 'StarTech.com Car Charger', NULL, 6, 0, NULL, '2024-07-15 19:17:01', '2024-07-15 19:17:01'),
(164, 1, 'Epson ELPMB23', NULL, 6, 0, NULL, '2024-07-15 19:17:27', '2024-07-15 19:17:27'),
(165, 1, 'Polycom HDX 7000-1080', NULL, 6, 0, NULL, '2024-07-15 19:17:39', '2024-07-15 19:17:39'),
(166, 1, 'Dell PowerEdge R710', NULL, 6, 0, NULL, '2024-07-15 19:17:53', '2024-07-15 19:17:53'),
(167, 1, 'Cisco CISCO2951/K9', NULL, 6, 0, '2024-07-16 05:41:00', '2024-07-15 19:18:11', '2024-07-16 05:41:00'),
(168, 1, 'TP-Link TL-WR902AC Mini Routeur', NULL, 6, 0, NULL, '2024-07-15 19:18:27', '2024-07-15 19:18:27'),
(169, 1, 'MikroTik Routeur Hex Lite', NULL, 6, 0, NULL, '2024-07-15 19:18:38', '2024-07-15 19:18:38'),
(170, 1, 'Seagate Exos X20 SAS SED - 20TB', NULL, 6, 0, NULL, '2024-07-15 19:18:53', '2024-07-15 19:18:53'),
(171, 1, 'Tensiomètre Heine Gamma GP', NULL, 6, 0, NULL, '2024-07-15 19:19:18', '2024-07-15 19:19:18'),
(172, 1, 'Panneaux Solaire TSM-DE09R.08 Module solaire 425W monocristallin Cadre Noir', NULL, 6, 0, NULL, '2024-07-15 19:19:27', '2024-07-15 19:19:27'),
(173, 1, 'CABLE DE LIAISON VGA MALE/MALE 1,80 M - N°VGA001 - GRADE B', NULL, 6, 0, '2024-07-16 05:40:10', '2024-07-15 19:19:38', '2024-07-16 05:40:10'),
(174, 1, 'CABLE D\'ALIMENTATION 2 PÔLES + TERRE 5 M - N°CABALI001 - GRADE B', NULL, 6, 0, '2024-07-16 05:39:59', '2024-07-15 19:24:45', '2024-07-16 05:39:59'),
(175, 1, 'Dell E-Port Docking station K07A', NULL, 6, 0, NULL, '2024-07-15 19:24:55', '2024-07-15 19:24:55'),
(176, 1, 'SACOCHE DE PC PORTABLE 15,6 POUCES', NULL, 6, 0, NULL, '2024-07-15 19:25:10', '2024-07-15 19:25:10'),
(177, 1, 'Dell Dock WD15 - Station d\'accueil 130W', NULL, 6, 0, NULL, '2024-07-15 19:25:23', '2024-07-15 19:25:23'),
(178, 1, 'Zyxel NWA3160-N Point d\'accès', NULL, 6, 0, NULL, '2024-07-15 19:25:34', '2024-07-15 19:25:34'),
(179, 1, 'Advance Clavier AZERTY et souris sans fil', NULL, 6, 0, '2024-07-16 05:39:20', '2024-07-15 19:25:45', '2024-07-16 05:39:20'),
(180, 1, 'CHARGEUR/ALIMENTATION POUR PORTABLE HP - GRADE B', NULL, 6, 0, '2024-07-16 05:40:45', '2024-07-15 19:25:57', '2024-07-16 05:40:45'),
(181, 1, 'CHARGEUR/ALIMENTATION POUR PORTABLE DELL - GRADE B', NULL, 6, 0, '2024-07-16 05:40:40', '2024-07-15 19:26:07', '2024-07-16 05:40:40'),
(182, 1, 'Chargeur Original Dell 4.5x3.0 mm pin 19.5V 3.34A 65W', NULL, 6, 0, '2024-07-16 05:40:37', '2024-07-15 19:26:18', '2024-07-16 05:40:37'),
(183, 1, 'ECRAN DELL P2214H LCD 22', NULL, 6, 0, NULL, '2024-07-15 19:26:28', '2024-07-15 19:26:28'),
(184, 1, 'Tv sony kdl 40w605b', NULL, 6, 0, NULL, '2024-07-15 19:26:37', '2024-07-15 19:26:37'),
(185, 1, 'LG 55LW5590', NULL, 6, 0, NULL, '2024-07-15 19:26:46', '2024-07-15 19:26:46'),
(186, 1, 'SAMSUNG UE55NU7026', 'SAMSUNG UE55NU7026 et produits associés', 6, 0, NULL, '2024-07-15 19:27:04', '2024-07-15 19:27:04'),
(187, 1, 'Panasonic TH-42LF30ER', 'Écran plat LCD LF30-106,7 cm/42\" - Format écran large', 6, 0, NULL, '2024-07-15 19:27:30', '2024-07-15 19:27:30'),
(188, 1, 'LENOVO', NULL, 1, 0, NULL, '2024-07-27 07:59:05', '2024-07-27 07:59:05');

-- --------------------------------------------------------

--
-- Structure de la table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) DEFAULT NULL,
  `tax_label_1` varchar(10) DEFAULT NULL,
  `tax_number_2` varchar(100) DEFAULT NULL,
  `tax_label_2` varchar(10) DEFAULT NULL,
  `code_label_1` varchar(191) DEFAULT NULL,
  `code_1` varchar(191) DEFAULT NULL,
  `code_label_2` varchar(191) DEFAULT NULL,
  `code_2` varchar(191) DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT 0.00,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT 1,
  `accounting_method` enum('fifo','lifo','avco') NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') NOT NULL DEFAULT 'includes',
  `logo` varchar(191) DEFAULT NULL,
  `sku_prefix` varchar(191) DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `expiry_type` enum('add_expiry','add_manufacturing') NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT 1,
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT 30,
  `keyboard_shortcuts` text DEFAULT NULL,
  `pos_settings` text DEFAULT NULL,
  `weighing_scale_setting` text NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT 1,
  `enable_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT 1,
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT 1,
  `enable_purchase_status` tinyint(1) DEFAULT 1,
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT 0,
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT 0,
  `enable_racks` tinyint(1) NOT NULL DEFAULT 0,
  `enable_row` tinyint(1) NOT NULL DEFAULT 0,
  `enable_position` tinyint(1) NOT NULL DEFAULT 0,
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT 1,
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT 1,
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT 1,
  `currency_symbol_placement` enum('before','after') NOT NULL DEFAULT 'before',
  `enabled_modules` text DEFAULT NULL,
  `date_format` varchar(191) NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') NOT NULL DEFAULT '24',
  `currency_precision` tinyint(4) NOT NULL DEFAULT 2,
  `quantity_precision` tinyint(4) NOT NULL DEFAULT 2,
  `ref_no_prefixes` text DEFAULT NULL,
  `theme_color` char(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `repair_settings` text DEFAULT NULL,
  `repair_jobsheet_settings` text DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT 1.0000 COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text DEFAULT NULL,
  `sms_settings` text DEFAULT NULL,
  `custom_labels` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `code_label_1`, `code_1`, `code_label_2`, `code_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `currency_precision`, `quantity_precision`, `ref_no_prefixes`, `theme_color`, `created_by`, `repair_settings`, `repair_jobsheet_settings`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'LGC SARL', 25, '2022-02-21', '18%', 'TVA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45.00, 1, 'Africa/Brazzaville', 1, 'fifo', 0.00, 'includes', '1720809606_ROUGE.png', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"disable_draft\":\"1\",\"disable_suspend\":\"1\",\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 'after', '[\"purchases\",\"add_sale\",\"pos_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"tables\",\"modifiers\",\"service_staff\",\"booking\",\"subscription\",\"types_of_service\"]', 'm/d/Y', '24', 0, 0, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', 'red', NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":\"mail.kwetupos.com\",\"mail_port\":\"587\",\"mail_username\":\"noreplay@kwetupos.com\",\"mail_password\":\"Congo@2023\",\"mail_encryption\":null,\"mail_from_address\":\"noreplay@kwetupos.com\",\"mail_from_name\":\"KwetuPOS\"}', '{\"sms_service\":\"twilio\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2024-07-11 15:30:05', '2024-08-29 09:49:25'),
(3, 'LIZA PROTECT FOREST', 25, '1970-01-01', NULL, 'TVA', NULL, 'CA', NULL, NULL, NULL, NULL, NULL, 25.00, 5, 'Africa/Brazzaville', 1, 'fifo', 0.00, 'includes', '1720736840_Logo.png', NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"enable_sales_order\":\"1\",\"cmmsn_calculation_type\":\"invoice_value\",\"razor_pay_key_id\":null,\"razor_pay_key_secret\":null,\"stripe_public_key\":null,\"stripe_secret_key\":null,\"disable_draft\":\"1\",\"disable_express_checkout\":\"1\",\"hide_recent_trans\":\"1\",\"disable_order_tax\":\"1\",\"disable_suspend\":\"1\",\"enable_transaction_date\":\"1\",\"disable_credit_sale_button\":\"1\",\"enable_weighing_scale\":\"1\",\"cash_denominations\":null,\"enable_cash_denomination_on\":\"pos_screen\",\"disable_pay_checkout\":0,\"hide_product_suggestion\":0,\"disable_discount\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 0, 0, 1, 0, 3, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', '[\"purchases\",\"pos_sale\"]', 'm/d/Y', '24', 0, 0, '{\"purchase\":\"PO\",\"purchase_return\":null,\"purchase_requisition\":null,\"purchase_order\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null,\"sales_order\":null}', NULL, NULL, NULL, NULL, 0, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null},\"product\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null,\"custom_field_7\":null,\"custom_field_8\":null,\"custom_field_9\":null,\"custom_field_10\":null,\"custom_field_11\":null,\"custom_field_12\":null,\"custom_field_13\":null,\"custom_field_14\":null,\"custom_field_15\":null,\"custom_field_16\":null,\"custom_field_17\":null,\"custom_field_18\":null,\"custom_field_19\":null,\"custom_field_20\":null},\"product_cf_details\":{\"1\":{\"type\":null,\"dropdown_options\":null},\"2\":{\"type\":null,\"dropdown_options\":null},\"3\":{\"type\":null,\"dropdown_options\":null},\"4\":{\"type\":null,\"dropdown_options\":null},\"5\":{\"type\":null,\"dropdown_options\":null},\"6\":{\"type\":null,\"dropdown_options\":null},\"7\":{\"type\":null,\"dropdown_options\":null},\"8\":{\"type\":null,\"dropdown_options\":null},\"9\":{\"type\":null,\"dropdown_options\":null},\"10\":{\"type\":null,\"dropdown_options\":null},\"11\":{\"type\":null,\"dropdown_options\":null},\"12\":{\"type\":null,\"dropdown_options\":null},\"13\":{\"type\":null,\"dropdown_options\":null},\"14\":{\"type\":null,\"dropdown_options\":null},\"15\":{\"type\":null,\"dropdown_options\":null},\"16\":{\"type\":null,\"dropdown_options\":null},\"17\":{\"type\":null,\"dropdown_options\":null},\"18\":{\"type\":null,\"dropdown_options\":null},\"19\":{\"type\":null,\"dropdown_options\":null},\"20\":{\"type\":null,\"dropdown_options\":null}},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase_shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"sell\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null,\"custom_field_6\":null}}', '{\"default_credit_limit\":null,\"enable_purchase_order\":\"1\",\"default_datatable_page_entries\":\"25\"}', 1, '2024-07-11 21:27:20', '2024-09-05 07:38:34');

-- --------------------------------------------------------

--
-- Structure de la table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `landmark` text DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `zip_code` char(7) NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_scheme_id` int(11) DEFAULT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT 1,
  `receipt_printer_type` enum('browser','printer') NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `featured_products` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `default_payment_accounts` text DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `sale_invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'LGC SARL', 'Rond-Point Songolo - Route des Dalletes Pointe-Noire, Congo-Brazzaville', 'Congo', 'Kouilou', 'Pointe-Noire', '242', 1, 1, 1, 1, NULL, 1, 'browser', NULL, '+242 06 822 63 41', NULL, NULL, 'https://lgc-sarl.com/', NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":null},\"card\":{\"is_enabled\":\"1\",\"account\":null},\"cheque\":{\"is_enabled\":\"1\",\"account\":null},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":null},\"other\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2024-07-11 15:30:05', '2024-07-12 11:49:09'),
(3, 3, 'BL0001', 'LIZA PROJECT FOREST', 'BZV', 'Congo', 'Brazzaville', 'Brazzaville', '99', 3, NULL, 3, 3, NULL, 1, 'browser', NULL, '069848021', '055540279', '', 'https://www.lizaprotectforest.com', NULL, 1, '{\"cash\":{\"is_enabled\":1,\"account\":null},\"card\":{\"is_enabled\":1,\"account\":null},\"cheque\":{\"is_enabled\":1,\"account\":null},\"bank_transfer\":{\"is_enabled\":1,\"account\":null},\"other\":{\"is_enabled\":1,\"account\":null},\"custom_pay_1\":{\"is_enabled\":1,\"account\":null},\"custom_pay_2\":{\"is_enabled\":1,\"account\":null},\"custom_pay_3\":{\"is_enabled\":1,\"account\":null},\"custom_pay_4\":{\"is_enabled\":1,\"account\":null},\"custom_pay_5\":{\"is_enabled\":1,\"account\":null},\"custom_pay_6\":{\"is_enabled\":1,\"account\":null},\"custom_pay_7\":{\"is_enabled\":1,\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(4, 3, 'Makelekele', 'LPF Makelekele', 'Marché Boureau', 'Congo', 'Brazzaville', 'Brazzaville', '01', 3, 3, 3, 3, NULL, 1, 'browser', NULL, '050004576', NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:14:47', '2024-07-16 13:14:47'),
(5, 3, 'Bacongo', 'LPF Bacongo', 'Marché Total', 'CONGO', 'Brazzaville', 'Brazzaville', '02', 3, 3, 3, 3, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:16:11', '2024-07-16 13:16:11'),
(6, 3, 'Poto-Poto', 'LPF Poto-Poto', 'Maison Commune Poto-Poto', 'CONGO', 'Brazzaville', 'Brazzaville', '03', 3, 3, 3, 3, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:17:50', '2024-07-16 13:17:50'),
(7, 3, 'Mongali', 'LPF Mongali', 'Marché Mongali', 'CONGO', 'Brazzaville', 'Brazzaville', '04', 3, 3, 3, 3, NULL, 1, 'browser', NULL, NULL, NULL, NULL, NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\"}}', NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:19:23', '2024-07-16 13:19:23');

-- --------------------------------------------------------

--
-- Structure de la table `cash_denominations`
--

CREATE TABLE `cash_denominations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `amount` decimal(22,4) NOT NULL,
  `total_count` int(11) NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_card_slips` int(11) NOT NULL DEFAULT 0,
  `total_cheques` int(11) NOT NULL DEFAULT 0,
  `denominations` text DEFAULT NULL,
  `closing_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `denominations`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 'close', '2024-07-11 17:08:23', 300.0000, 0, 0, NULL, NULL, '2024-07-11 15:08:00', '2024-07-11 15:08:23'),
(2, 1, 1, 3, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-07-11 15:15:00', '2024-07-11 15:15:51'),
(3, 1, 1, 1, 'close', '2024-07-12 13:16:17', 14700.0000, 0, 0, NULL, NULL, '2024-07-12 11:15:00', '2024-07-12 11:16:17'),
(4, 1, 1, 1, 'close', '2024-07-12 14:28:10', 29200.0000, 0, 0, NULL, NULL, '2024-07-12 11:17:00', '2024-07-12 12:28:10'),
(5, 1, 1, 1, 'close', '2024-07-12 19:31:45', 200.0000, 0, 0, NULL, NULL, '2024-07-12 17:27:00', '2024-07-12 17:31:45'),
(6, 1, 1, 1, 'close', '2024-07-12 19:56:42', 14700.0000, 0, 0, NULL, NULL, '2024-07-12 17:47:00', '2024-07-12 17:56:42'),
(7, 1, 1, 1, 'close', '2024-07-15 21:36:05', 200.0000, 0, 0, NULL, NULL, '2024-07-12 18:00:00', '2024-07-15 19:36:05'),
(8, 1, 1, 7, 'close', '2024-07-15 10:22:40', 200.0000, 0, 0, NULL, NULL, '2024-07-15 08:22:00', '2024-07-15 08:22:40'),
(9, 1, 1, 7, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-07-15 08:30:00', '2024-07-15 08:30:48'),
(10, 1, 1, 2, 'close', '2024-07-15 13:39:10', 569500.0000, 0, 0, NULL, NULL, '2024-07-15 11:34:00', '2024-07-15 11:39:10'),
(11, 1, 1, 1, 'close', '2024-07-16 15:38:39', 200.0000, 0, 0, NULL, NULL, '2024-07-16 13:38:00', '2024-07-16 13:38:39'),
(12, 1, 1, 1, 'close', '2024-08-12 19:22:00', 70200.0000, 0, 0, NULL, NULL, '2024-07-16 13:39:00', '2024-08-12 17:22:00'),
(13, 3, 5, 9, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-07-16 13:44:00', '2024-07-16 13:44:28'),
(14, 3, 5, 5, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-08-12 16:38:00', '2024-08-12 16:38:59'),
(15, 1, 1, 1, 'close', '2024-09-14 15:46:14', 200.0000, 0, 0, NULL, NULL, '2024-08-22 11:16:00', '2024-09-14 13:46:14'),
(16, 1, 1, 12, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-08-22 12:14:00', '2024-08-22 12:14:32'),
(17, 1, 1, 2, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-08-29 09:19:00', '2024-08-29 09:19:57'),
(18, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, NULL, '2024-09-17 04:09:00', '2024-09-17 04:09:14');

-- --------------------------------------------------------

--
-- Structure de la table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pay_method` varchar(191) DEFAULT NULL,
  `type` enum('debit','credit') NOT NULL,
  `transaction_type` varchar(191) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cash_register_transactions`
--

INSERT INTO `cash_register_transactions` (`id`, `cash_register_id`, `amount`, `pay_method`, `type`, `transaction_type`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 1, 300.0000, 'cash', 'credit', 'initial', NULL, '2024-07-11 15:08:05', '2024-07-11 15:08:05'),
(2, 2, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-11 15:15:51', '2024-07-11 15:15:51'),
(4, 3, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-12 11:15:05', '2024-07-12 11:15:05'),
(6, 4, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-12 11:17:36', '2024-07-12 11:17:36'),
(9, 5, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-12 17:27:31', '2024-07-12 17:27:31'),
(10, 6, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-12 17:47:39', '2024-07-12 17:47:39'),
(12, 7, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-12 18:00:15', '2024-07-12 18:00:15'),
(13, 8, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-15 08:22:28', '2024-07-15 08:22:28'),
(14, 9, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-15 08:30:48', '2024-07-15 08:30:48'),
(15, 10, 555000.0000, 'cash', 'credit', 'initial', NULL, '2024-07-15 11:34:58', '2024-07-15 11:34:58'),
(17, 11, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-16 13:38:25', '2024-07-16 13:38:25'),
(18, 12, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-07-16 13:39:09', '2024-07-16 13:39:09'),
(19, 13, 85000.0000, 'cash', 'credit', 'sell', 49, '2024-07-16 13:45:21', '2024-07-16 13:45:21'),
(20, 13, 125000.0000, 'cash', 'credit', 'sell', 50, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(21, 13, 42500.0000, 'cash', 'credit', 'sell', 51, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(22, 13, 30000.0000, 'cash', 'credit', 'sell', 66, '2024-07-17 10:42:18', '2024-07-17 10:42:18'),
(23, 13, 106250.0000, 'cash', 'credit', 'sell', 67, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(24, 13, 425000.0000, 'cash', 'credit', 'sell', 73, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(25, 13, 105000.0000, 'cash', 'credit', 'sell', 74, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(26, 13, 42500.0000, 'cash', 'credit', 'sell', 75, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(27, 13, 22000.0000, 'cash', 'credit', 'sell', 76, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(28, 13, 20500.0000, 'cash', 'credit', 'sell', 76, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(29, 13, 40000.0000, 'cash', 'credit', 'sell', 77, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(30, 13, 45000.0000, 'cash', 'credit', 'sell', 77, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(31, 12, 70000.0000, 'cash', 'credit', 'sell', 80, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(32, 14, 300000.0000, 'cash', 'credit', 'initial', NULL, '2024-08-12 16:38:59', '2024-08-12 16:38:59'),
(33, 15, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-08-22 11:16:00', '2024-08-22 11:16:00'),
(34, 16, 50000.0000, 'cash', 'credit', 'initial', NULL, '2024-08-22 12:14:32', '2024-08-22 12:14:32'),
(35, 16, 471250.0000, 'cash', 'credit', 'sell', 92, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(36, 16, 447688.0000, 'cash', 'credit', 'sell', 93, '2024-08-28 05:49:55', '2024-08-28 05:49:55'),
(37, 17, 1000.0000, 'cash', 'credit', 'initial', NULL, '2024-08-29 09:19:57', '2024-08-29 09:19:57'),
(38, 17, 2000.0000, 'cash', 'credit', 'sell', 95, '2024-09-05 08:04:22', '2024-09-05 08:04:22'),
(39, 17, 2350.0000, 'card', 'credit', 'sell', 95, '2024-09-05 08:04:22', '2024-09-05 08:04:22'),
(40, 18, 200.0000, 'cash', 'credit', 'initial', NULL, '2024-09-17 04:09:14', '2024-09-17 04:09:14');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Ordinateurs et Accessoires', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:11:18', '2024-07-12 14:11:18'),
(2, 'Ordinateurs de Bureau', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:12:03', '2024-07-12 14:12:03'),
(3, 'Ordinateurs Portables', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:12:22', '2024-07-12 14:12:22'),
(4, 'Stations de Travail', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:12:38', '2024-07-12 14:12:38'),
(5, 'Netbooks', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:12:51', '2024-07-12 14:12:51'),
(6, 'Chromebooks', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:13:12', '2024-07-12 14:13:12'),
(7, 'All-in-One PCs', 1, NULL, 1, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:13:57', '2024-07-12 14:13:57'),
(8, 'Composants Internes', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:14:44', '2024-07-12 14:14:44'),
(9, 'Processeurs (CPU)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:15:02', '2024-07-12 14:15:02'),
(10, 'Cartes Mères', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:15:23', '2024-07-12 14:15:23'),
(11, 'Mémoire Vive (RAM)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:15:40', '2024-07-12 14:15:40'),
(12, 'Disques Durs (HDD)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:16:01', '2024-07-12 14:16:01'),
(13, 'Disques SSD', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:16:24', '2024-07-12 14:16:24'),
(14, 'Cartes Graphiques (GPU)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:16:42', '2024-07-12 14:16:42'),
(15, 'Alimentations (PSU)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:17:01', '2024-07-12 14:17:01'),
(16, 'Boîtiers d\'Ordinateur', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:17:11', '2024-07-12 14:17:11'),
(17, 'Refroidissement (Ventirads, Watercooling)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:17:22', '2024-07-12 14:17:22'),
(18, 'Cartes Son', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:17:32', '2024-07-12 14:17:32'),
(19, 'Cartes Réseau', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:17:46', '2024-07-12 14:17:46'),
(20, 'Cartes d\'Extension (USB, PCIe)', 1, NULL, 8, 1, 'product', NULL, NULL, NULL, '2024-07-12 14:18:08', '2024-07-12 14:18:08'),
(21, 'Périphériques', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 14:51:23', '2024-07-12 14:51:23'),
(22, 'Claviers', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 14:51:45', '2024-07-12 14:51:45'),
(23, 'Souris', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 14:52:12', '2024-07-12 14:52:12'),
(24, 'Imprimantes', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:08:18', '2024-07-12 15:08:18'),
(25, 'Scanners', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:09:11', '2024-07-12 15:09:11'),
(26, 'Webcams', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:09:32', '2024-07-12 15:09:32'),
(27, 'Casques et Microphones', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:09:50', '2024-07-12 15:09:50'),
(28, 'Haut-parleurs', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:10:19', '2024-07-12 15:10:19'),
(29, 'Trackpads', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:10:49', '2024-07-12 15:10:49'),
(30, 'Tapis de Souris', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 15:11:05', '2024-07-12 15:11:05'),
(31, 'Stockage Externe et Support de Stockage', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:07:54', '2024-07-12 16:07:54'),
(32, 'Disques Durs Externes', 1, NULL, 31, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:08:14', '2024-07-12 16:08:14'),
(33, 'Clés USB', 1, NULL, 31, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:08:42', '2024-07-12 16:08:42'),
(34, 'Cartes Mémoire', 1, NULL, 31, 6, 'product', 'SD, microSD', NULL, NULL, '2024-07-12 16:09:27', '2024-07-12 16:09:27'),
(35, 'NAS', 1, NULL, 31, 6, 'product', 'Stockage en Réseau', NULL, NULL, '2024-07-12 16:10:01', '2024-07-12 16:10:01'),
(36, 'Disques Optiques', 1, NULL, 31, 6, 'product', 'CD, DVD, Blu-Ray', NULL, NULL, '2024-07-12 16:10:51', '2024-07-12 16:10:51'),
(37, 'Réseaux et Communication', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:11:07', '2024-07-12 16:11:07'),
(38, 'Routeurs', 1, NULL, 37, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:11:31', '2024-07-12 16:11:31'),
(39, 'Modems', 1, NULL, 37, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:11:50', '2024-07-12 16:11:50'),
(40, 'Points d\'Accès Wi-Fi', 1, NULL, 37, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:12:11', '2024-07-12 16:12:11'),
(41, 'Switchs', 1, NULL, 37, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:12:28', '2024-07-12 16:12:28'),
(42, 'Répéteurs Wi-Fi', 1, NULL, 37, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:12:42', '2024-07-12 16:12:42'),
(43, 'Adaptateurs Réseau', 1, NULL, 37, 6, 'product', 'Ethernet, Wi-Fi', NULL, NULL, '2024-07-12 16:13:09', '2024-07-12 16:13:09'),
(44, 'Câbles Réseau', 1, NULL, 37, 6, 'product', 'Ethernet', NULL, NULL, '2024-07-12 16:13:57', '2024-07-12 16:13:57'),
(45, 'Équipements pour Gaming', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:14:23', '2024-07-12 16:14:23'),
(46, 'Ordinateurs de Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:14:46', '2024-07-12 16:14:46'),
(47, 'Chaises de Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:15:05', '2024-07-12 16:15:05'),
(48, 'Claviers et Souris de Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:15:22', '2024-07-12 16:15:22'),
(49, 'Écrans de Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:15:36', '2024-07-12 16:15:36'),
(50, 'Casques de Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:15:51', '2024-07-12 16:15:51'),
(51, 'Manettes de Jeu', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:16:10', '2024-07-12 16:16:10'),
(52, 'Volants et Pédaliers', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:16:26', '2024-07-12 16:16:26'),
(53, 'Tapis de Souris Gaming', 1, NULL, 45, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:16:40', '2024-07-12 16:16:40'),
(54, 'Logiciels', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:17:05', '2024-07-12 16:17:05'),
(55, 'Systèmes d\'Exploitation', 1, NULL, 54, 6, 'product', 'Windows, macOS, Linux', NULL, NULL, '2024-07-12 16:17:36', '2024-07-12 16:17:36'),
(56, 'Logiciels de Productivité', 1, NULL, 54, 6, 'product', 'Microsoft Office, Google Workspace', NULL, NULL, '2024-07-12 16:18:04', '2024-07-12 16:18:04'),
(57, 'Logiciels de Sécurité', 1, NULL, 54, 6, 'product', 'Antivirus, Anti-Malware', NULL, NULL, '2024-07-12 16:18:30', '2024-07-12 16:18:30'),
(58, 'Logiciels de Création', 1, NULL, 54, 6, 'product', 'Adobe Creative Suite, CorelDRAW', NULL, NULL, '2024-07-12 16:18:54', '2024-07-12 16:18:54'),
(59, 'Logiciels de Développement', 1, NULL, 54, 6, 'product', 'Environnements de Développement Intégré, IDE', NULL, NULL, '2024-07-12 16:20:39', '2024-07-12 16:20:39'),
(60, 'Registre', 1, NULL, 54, 6, 'product', 'ERP, CRM', NULL, NULL, '2024-07-12 16:21:21', '2024-07-12 16:21:21'),
(61, 'Impression et Scanners', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:21:35', '2024-07-12 16:21:35'),
(62, 'Imprimantes Jet d\'Encre', 1, NULL, 61, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:21:57', '2024-07-12 16:21:57'),
(63, 'Imprimantes Laser', 1, NULL, 61, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:22:11', '2024-07-12 16:22:11'),
(64, 'Imprimantes 3D', 1, NULL, 61, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:22:26', '2024-07-12 16:22:26'),
(65, 'Scanners de Documents', 1, NULL, 61, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:23:32', '2024-07-12 16:23:32'),
(66, 'Scanners de Diapositives', 1, NULL, 61, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:23:49', '2024-07-12 16:23:49'),
(67, 'Consommables', 1, NULL, 61, 6, 'product', 'Cartouches d\'encre, Toners', NULL, NULL, '2024-07-12 16:24:14', '2024-07-12 16:24:14'),
(68, 'Accessoires et Consommables', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:24:34', '2024-07-12 16:24:34'),
(69, 'Câbles', 1, NULL, 68, 6, 'product', 'HDMI, USB, DisplayPort', NULL, NULL, '2024-07-12 16:25:02', '2024-07-12 16:25:02'),
(70, 'Adaptateurs', 1, NULL, 68, 6, 'product', 'USB-C, VGA, DVI', NULL, NULL, '2024-07-12 16:25:27', '2024-07-12 16:25:27'),
(71, 'Batteries et Chargeurs', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:25:44', '2024-07-12 16:25:44'),
(72, 'Stations d\'Accueil', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:26:03', '2024-07-12 16:26:03'),
(73, 'Hub USB', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:26:18', '2024-07-12 16:26:18'),
(74, 'Supports de Moniteur', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:26:33', '2024-07-12 16:26:33'),
(75, 'Kits de Nettoyage', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:26:50', '2024-07-12 16:26:50'),
(76, 'Protecteurs d\'Écran', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:27:04', '2024-07-12 16:27:04'),
(77, 'Boîtiers de Stockage', 1, NULL, 68, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:27:18', '2024-07-12 16:27:18'),
(78, 'Sécurité et Surveillance', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:27:34', '2024-07-12 16:27:34'),
(79, 'Caméras de Sécurité', 1, NULL, 78, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:27:50', '2024-07-12 16:27:50'),
(80, 'Systèmes de Surveillance', 1, NULL, 78, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:28:03', '2024-07-12 16:28:03'),
(81, 'Départements', 1, NULL, 78, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:28:21', '2024-07-12 16:28:21'),
(82, 'Alarmes et Détecteurs', 1, NULL, 78, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:28:37', '2024-07-12 16:28:37'),
(83, 'Équipements de Bureau', 1, NULL, 0, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:29:07', '2024-07-12 16:29:07'),
(84, 'Onduleurs', 1, NULL, 83, 6, 'product', 'UPS', NULL, NULL, '2024-07-12 16:29:28', '2024-07-12 16:29:28'),
(85, 'Protecteurs de Surtension', 1, NULL, 83, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:29:40', '2024-07-12 16:29:40'),
(86, 'Mobilier Informatique', 1, NULL, 83, 6, 'product', 'Bureaux, Supports d\'écran', NULL, NULL, '2024-07-12 16:30:01', '2024-07-12 16:30:01'),
(87, 'Solutions de Câblage et de Gestion des Câbles', 1, NULL, 83, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:30:17', '2024-07-12 16:30:17'),
(88, 'Écran', 1, NULL, 21, 6, 'product', NULL, NULL, NULL, '2024-07-12 16:34:29', '2024-07-12 16:34:29'),
(89, 'Acer Aspire 15 (A15-51M-7633) 7, 32 GB, 1 TB', 1, NULL, 0, 7, 'device', NULL, NULL, NULL, '2024-07-15 08:27:37', '2024-07-15 08:27:37'),
(90, 'FOYER', 3, '001', 0, 5, 'product', 'FOYER', NULL, NULL, '2024-07-17 09:39:34', '2024-07-17 09:39:34'),
(91, 'GRANULE', 3, '002', 0, 5, 'product', 'Granulé', NULL, NULL, '2024-07-17 09:40:09', '2024-07-17 09:40:24');

-- --------------------------------------------------------

--
-- Structure de la table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_message` text NOT NULL,
  `bot_response` text DEFAULT NULL,
  `last_interaction_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chat_conversations`
--

INSERT INTO `chat_conversations` (`id`, `user_id`, `user_message`, `bot_response`, `last_interaction_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'hello', 'Désolé, je n\'ai pas compris votre message.', '2024-08-26 17:56:32', '2024-08-26 17:56:32', '2024-08-26 17:56:32');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `contact_type` varchar(191) DEFAULT NULL,
  `supplier_business_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `prefix` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) DEFAULT NULL,
  `middle_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `contact_status` varchar(191) NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `address_line_2` text DEFAULT NULL,
  `zip_code` varchar(191) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) NOT NULL,
  `landline` varchar(191) DEFAULT NULL,
  `alternate_number` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `total_rp` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_address` text DEFAULT NULL,
  `shipping_custom_field_details` longtext DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_field_1` varchar(191) DEFAULT NULL,
  `export_custom_field_2` varchar(191) DEFAULT NULL,
  `export_custom_field_3` varchar(191) DEFAULT NULL,
  `export_custom_field_4` varchar(191) DEFAULT NULL,
  `export_custom_field_5` varchar(191) DEFAULT NULL,
  `export_custom_field_6` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) DEFAULT NULL,
  `custom_field2` varchar(191) DEFAULT NULL,
  `custom_field3` varchar(191) DEFAULT NULL,
  `custom_field4` varchar(191) DEFAULT NULL,
  `custom_field5` varchar(191) DEFAULT NULL,
  `custom_field6` varchar(191) DEFAULT NULL,
  `custom_field7` varchar(191) DEFAULT NULL,
  `custom_field8` varchar(191) DEFAULT NULL,
  `custom_field9` varchar(191) DEFAULT NULL,
  `custom_field10` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `contact_type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `shipping_custom_field_details`, `is_export`, `export_custom_field_1`, `export_custom_field_2`, `export_custom_field_3`, `export_custom_field_4`, `export_custom_field_5`, `export_custom_field_6`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, NULL, 'Nouveau Client', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 1, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 15:30:05', '2024-07-11 15:30:05'),
(3, 3, 'customer', NULL, NULL, 'Nouveau Client', NULL, NULL, NULL, NULL, NULL, 'CO0001', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0.0000, 5, 0.0000, 0, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(4, 1, 'customer', 'business', 'LAZ TECHNOLOGIES SARL', '', NULL, NULL, NULL, NULL, 'info@laztechnologie.ch', 'CO0002', 'active', 'CHE-434.989.257', 'Lausanne', 'Vaud', 'Suisse', 'Chemin de Mémise 8', NULL, '1018', NULL, '+41 77 969 03 26', NULL, NULL, NULL, 'months', 5000.0000, 1, 0.0000, 0, 0, 0, 0, 'Chemin de Mémise 8', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-12 17:46:18', '2024-07-12 17:46:18'),
(5, 1, 'customer', 'individual', NULL, 'Mr Richard toto', 'Mr', 'Richard', NULL, 'toto', 'laz@gmail.com', 'CO0003', 'active', 'AgBBB22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0777999666', NULL, NULL, 1, 'months', 5000.0000, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 11:37:25', '2024-07-15 11:37:25'),
(6, 3, 'customer', 'individual', NULL, 'Mr Charles MATOU', 'Mr', 'Charles', NULL, 'MATOU', NULL, 'CO0002', 'active', NULL, NULL, NULL, NULL, 'Rue Ball', NULL, NULL, NULL, '00 242 05 641 58 08', NULL, NULL, NULL, NULL, 100000.0000, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:43:47', '2024-07-16 13:43:47'),
(7, 3, 'supplier', 'business', 'China Export', '', NULL, NULL, NULL, NULL, NULL, 'CO0003', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '057652134', NULL, NULL, NULL, NULL, NULL, 5, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:11:11', '2024-07-17 10:11:11'),
(8, 3, 'customer', 'individual', NULL, 'Jocelyne ABOU', NULL, 'Jocelyne', NULL, 'ABOU', NULL, 'CO0004', 'active', NULL, 'Brazzaville', NULL, 'Congo', '50 Rue Mouleke', 'Ouenzé', NULL, NULL, '066560289', NULL, '068905576', NULL, NULL, 100000.0000, 9, 0.0000, 0, 0, 0, 0, '50 Rue Mouleke', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:39:34', '2024-07-17 10:39:34'),
(9, 3, 'customer', 'individual', NULL, 'TOTO', NULL, 'TOTO', NULL, NULL, NULL, 'CO0005', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '060786589', NULL, NULL, NULL, NULL, 100000.0000, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 10:13:07', '2024-07-18 10:13:07'),
(10, 3, 'customer', 'individual', NULL, 'Mr LIPPIER', 'Mr', 'LIPPIER', NULL, NULL, NULL, 'CO0006', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '069848021', NULL, NULL, NULL, NULL, NULL, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 11:33:29', '2024-07-18 11:33:29'),
(11, 3, 'customer', 'individual', NULL, 'TITI', NULL, 'TITI', NULL, NULL, NULL, 'CO0007', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '048765245', NULL, NULL, NULL, NULL, NULL, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 12:31:21', '2024-07-22 12:31:21'),
(12, 3, 'customer', 'individual', NULL, 'TITI', NULL, 'TITI', NULL, NULL, NULL, 'CO0008', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '048765245', NULL, NULL, NULL, NULL, NULL, 9, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 12:31:21', '2024-07-22 12:31:21'),
(13, 1, 'customer', 'individual', NULL, 'Mme Audrine Line KANDA IKIA', 'Mme', 'Audrine', 'Line', 'KANDA IKIA', 'audrine_line@yahoo.fr', 'CO0004', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1986-06-25', '066782877', NULL, NULL, 3, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 08:08:00', '2024-07-27 08:08:00');

-- --------------------------------------------------------

--
-- Structure de la table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `code` varchar(25) NOT NULL,
  `symbol` varchar(25) NOT NULL,
  `thousand_separator` varchar(10) NOT NULL,
  `decimal_separator` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'Congo/Brazzaville', 'Franc CFA', 'FCFA', 'FCFA', '.', ',', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `price_calculation_type`, `selling_price_group_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Clients Fidèles', 0.00, 'percentage', NULL, 1, '2024-07-11 21:44:01', '2024-07-11 21:44:01'),
(2, 1, 'Nouveaux Clients', 0.00, 'percentage', NULL, 1, '2024-07-11 21:44:14', '2024-07-11 21:44:14'),
(3, 1, 'Clients VIP', 0.00, 'percentage', NULL, 1, '2024-07-11 21:44:25', '2024-07-11 21:44:25'),
(4, 1, 'Clients Entreprises', 0.00, 'percentage', NULL, 1, '2024-07-11 21:45:53', '2024-07-11 21:45:53'),
(5, 1, 'Clients Occasionnels', 0.00, 'percentage', NULL, 1, '2024-07-11 21:46:15', '2024-07-11 21:46:15');

-- --------------------------------------------------------

--
-- Structure de la table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `configuration` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `spg` varchar(100) DEFAULT NULL COMMENT 'Applicable in specified selling price group only. Use of applicable_in_spg column is discontinued',
  `applicable_in_cg` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) NOT NULL,
  `heading` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `header_text` text DEFAULT NULL,
  `invoice_no_prefix` varchar(191) DEFAULT NULL,
  `quotation_no_prefix` varchar(191) DEFAULT NULL,
  `invoice_heading` varchar(191) DEFAULT NULL,
  `sub_heading_line1` varchar(191) DEFAULT NULL,
  `sub_heading_line2` varchar(191) DEFAULT NULL,
  `sub_heading_line3` varchar(191) DEFAULT NULL,
  `sub_heading_line4` varchar(191) DEFAULT NULL,
  `sub_heading_line5` varchar(191) DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) DEFAULT NULL,
  `invoice_heading_paid` varchar(191) DEFAULT NULL,
  `quotation_heading` varchar(191) DEFAULT NULL,
  `sub_total_label` varchar(191) DEFAULT NULL,
  `discount_label` varchar(191) DEFAULT NULL,
  `tax_label` varchar(191) DEFAULT NULL,
  `total_label` varchar(191) DEFAULT NULL,
  `round_off_label` varchar(191) DEFAULT NULL,
  `total_due_label` varchar(191) DEFAULT NULL,
  `paid_label` varchar(191) DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT 0,
  `client_id_label` varchar(191) DEFAULT NULL,
  `client_tax_label` varchar(191) DEFAULT NULL,
  `date_label` varchar(191) DEFAULT NULL,
  `date_time_format` varchar(191) DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT 1,
  `show_brand` tinyint(1) NOT NULL DEFAULT 0,
  `show_sku` tinyint(1) NOT NULL DEFAULT 1,
  `show_cat_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `show_lot` tinyint(1) NOT NULL DEFAULT 0,
  `show_image` tinyint(1) NOT NULL DEFAULT 0,
  `show_sale_description` tinyint(1) NOT NULL DEFAULT 0,
  `sales_person_label` varchar(191) DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT 0,
  `table_product_label` varchar(191) DEFAULT NULL,
  `table_qty_label` varchar(191) DEFAULT NULL,
  `table_unit_price_label` varchar(191) DEFAULT NULL,
  `table_subtotal_label` varchar(191) DEFAULT NULL,
  `cat_code_label` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_business_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_location_name` tinyint(1) NOT NULL DEFAULT 1,
  `show_landmark` tinyint(1) NOT NULL DEFAULT 1,
  `show_city` tinyint(1) NOT NULL DEFAULT 1,
  `show_state` tinyint(1) NOT NULL DEFAULT 1,
  `show_zip_code` tinyint(1) NOT NULL DEFAULT 1,
  `show_country` tinyint(1) NOT NULL DEFAULT 1,
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT 1,
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT 0,
  `show_email` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax_1` tinyint(1) NOT NULL DEFAULT 1,
  `show_tax_2` tinyint(1) NOT NULL DEFAULT 0,
  `show_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `show_payments` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer` tinyint(1) NOT NULL DEFAULT 0,
  `customer_label` varchar(191) DEFAULT NULL,
  `commission_agent_label` varchar(191) DEFAULT NULL,
  `show_commission_agent` tinyint(1) NOT NULL DEFAULT 0,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_color` varchar(10) DEFAULT NULL,
  `footer_text` text DEFAULT NULL,
  `module_info` text DEFAULT NULL,
  `common_settings` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `business_id` int(10) UNSIGNED NOT NULL,
  `show_letter_head` tinyint(1) NOT NULL DEFAULT 0,
  `letter_head` varchar(191) DEFAULT NULL,
  `show_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `qr_code_fields` text DEFAULT NULL,
  `design` varchar(190) DEFAULT 'classic',
  `cn_heading` varchar(191) DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) DEFAULT NULL,
  `cn_amount_label` varchar(191) DEFAULT NULL,
  `table_tax_headings` text DEFAULT NULL,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT 0,
  `prev_bal_label` varchar(191) DEFAULT NULL,
  `change_return_label` varchar(191) DEFAULT NULL,
  `product_custom_fields` text DEFAULT NULL,
  `contact_custom_fields` text DEFAULT NULL,
  `location_custom_fields` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `commission_agent_label`, `show_commission_agent`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `show_letter_head`, `letter_head`, `show_qr_code`, `qr_code_fields`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', NULL, '{\"types_of_service\":{\"types_of_service_label\":null},\"tables\":{\"table_label\":null},\"service_staff\":{\"service_staff_label\":null},\"repair\":{\"repair_status_label\":null,\"repair_warranty_label\":null,\"brand_label\":null,\"device_label\":null,\"model_no_label\":null,\"serial_no_label\":null,\"defects_label\":null,\"repair_checklist_label\":null}}', '{\"proforma_heading\":null,\"sales_order_heading\":null,\"due_date_label\":null,\"total_quantity_label\":null,\"item_discount_label\":null,\"discounted_unit_price_label\":null,\"total_items_label\":null,\"num_to_word_format\":\"international\",\"tax_summary_label\":null,\"zatca_qr\":\"1\"}', 1, 1, 0, NULL, 1, '[\"subtotal\"]', 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-11 15:30:05', '2024-07-15 12:06:14'),
(3, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', NULL, 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', NULL, 0, 0, '#000000', '', NULL, NULL, 1, 3, 0, NULL, 0, NULL, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-07-11 21:27:20', '2024-07-11 21:27:20');

-- --------------------------------------------------------

--
-- Structure de la table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `scheme_type` enum('blank','year') NOT NULL,
  `number_type` varchar(100) NOT NULL DEFAULT 'sequential',
  `prefix` varchar(191) DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT 0,
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `number_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'year', 'sequential', NULL, 1, 11, 4, 1, '2024-07-11 15:30:05', '2024-09-05 08:04:22'),
(3, 3, 'Default', 'year', 'sequential', NULL, 1, 10, 4, 1, '2024-07-11 21:27:20', '2024-08-12 16:46:10');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_media_type` varchar(191) DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1720770695_266376545_Brel-Laz-e1709636100960.png', NULL, 1, 'App\\User', NULL, 1, '2024-07-12 06:51:35', '2024-07-12 06:51:35'),
(2, 1, '1721051640_1574020031_71TvvF+wJjL.jpg', NULL, 1, 'App\\Variation', NULL, 2, '2024-07-15 12:54:00', '2024-07-15 12:54:00'),
(3, 1, '1721051640_865306532_N2820 2,16 GHz 8 Go RAM 30 Go SSD sans système d\'exploitation sans bloc d\'alimentation.pdf', NULL, 1, 'App\\Product', NULL, 2, '2024-07-15 12:54:00', '2024-07-15 12:54:00'),
(4, 1, '1722071061_1005367307_lenovo-x230-core-i5-3rd-gen-with-1-year-warranty.jpg', NULL, 1, 'App\\Variation', NULL, 51, '2024-07-27 08:04:21', '2024-07-27 08:04:21'),
(6, 1, '1724151668_109140072_WhatsApp Image 2024-04-29 à 17.03.21_1e788d96.jpg', NULL, 12, 'App\\User', NULL, 12, '2024-08-20 10:01:08', '2024-08-20 10:01:08');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1),
(258, '2021_03_03_162021_add_purchase_order_columns_to_purchase_lines_and_transactions_table', 1),
(259, '2021_03_11_120229_add_sales_order_columns', 1),
(260, '2021_03_16_120705_add_business_id_to_activity_log_table', 1),
(261, '2021_03_16_153427_add_code_columns_to_business_table', 1),
(262, '2021_03_18_173308_add_account_details_column_to_accounts_table', 1),
(263, '2021_03_18_183119_add_prefer_payment_account_columns_to_transactions_table', 1),
(264, '2021_03_22_120810_add_more_types_of_service_custom_fields', 1),
(265, '2021_03_24_183132_add_shipping_export_custom_field_details_to_contacts_table', 1),
(266, '2021_03_25_170715_add_export_custom_fields_info_to_transactions_table', 1),
(267, '2021_04_15_063449_add_denominations_column_to_cash_registers_table', 1),
(268, '2021_05_22_083426_add_indexing_to_account_transactions_table', 1),
(269, '2021_07_08_065808_add_additional_expense_columns_to_transaction_table', 1),
(270, '2021_07_13_082918_add_qr_code_columns_to_invoice_layouts_table', 1),
(271, '2021_07_21_061615_add_fields_to_show_commission_agent_in_invoice_layout', 1),
(272, '2021_08_13_105549_add_crm_contact_id_to_users_table', 1),
(273, '2021_08_25_114932_add_payment_link_fields_to_transaction_payments_table', 1),
(274, '2021_09_01_063110_add_spg_column_to_discounts_table', 1),
(275, '2021_09_03_061528_modify_cash_register_transactions_table', 1),
(276, '2021_10_05_061658_add_source_column_to_transactions_table', 1),
(277, '2021_12_16_121851_add_parent_id_column_to_expense_categories_table', 1),
(278, '2022_04_14_075120_add_payment_type_column_to_transaction_payments_table', 1),
(279, '2022_04_21_083327_create_cash_denominations_table', 1),
(280, '2022_05_10_055307_add_delivery_date_column_to_transactions_table', 1),
(281, '2022_06_13_123135_add_currency_precision_and_quantity_precision_fields_to_business_table', 1),
(282, '2022_06_28_133342_add_secondary_unit_columns_to_products_sell_line_purchase_lines_tables', 1),
(283, '2022_07_13_114307_create_purchase_requisition_related_columns', 1),
(284, '2022_08_25_132707_add_service_staff_timer_fields_to_products_and_users_table', 1),
(285, '2023_01_28_114255_add_letter_head_column_to_invoice_layouts_table', 1),
(286, '2023_02_11_161510_add_event_column_to_activity_log_table', 1),
(287, '2023_02_11_161511_add_batch_uuid_column_to_activity_log_table', 1),
(288, '2023_03_02_170312_add_provider_to_oauth_clients_table', 1),
(289, '2023_03_21_122731_add_sale_invoice_scheme_id_business_table', 1),
(290, '2023_03_21_170446_add_number_type_to_invoice_scheme', 1),
(291, '2023_04_17_155216_add_custom_fields_to_products', 1),
(292, '2023_04_28_130247_add_price_type_to_group_price_table', 1),
(293, '2023_06_21_033923_add_delivery_person_in_transactions', 1),
(294, '2023_09_13_153555_add_service_staff_pin_columns_in_users', 1),
(295, '2023_09_15_154404_add_is_kitchen_order_in_transactions', 1),
(296, '2023_12_06_152840_add_contact_type_in_contacts', 1),
(297, '2018_06_27_185405_create_packages_table', 2),
(298, '2018_06_28_182803_create_subscriptions_table', 2),
(299, '2018_07_17_182021_add_rows_to_system_table', 2),
(300, '2018_07_19_131721_add_options_to_packages_table', 2),
(301, '2018_08_17_155534_add_min_termination_alert_days', 2),
(302, '2018_08_28_105945_add_business_based_username_settings_to_system_table', 2),
(303, '2018_08_30_105906_add_superadmin_communicator_logs_table', 2),
(304, '2018_11_02_130636_add_custom_permissions_to_packages_table', 2),
(305, '2018_11_05_161848_add_more_fields_to_packages_table', 2),
(306, '2018_12_10_124621_modify_system_table_values_null_default', 2),
(307, '2019_05_10_135434_add_missing_database_column_indexes', 2),
(308, '2019_08_16_115300_create_superadmin_frontend_pages_table', 2),
(309, '2023_06_10_132121_create_coupons_table', 2),
(310, '2023_06_16_141928_add_column_in_subscriptions', 2),
(311, '2023_06_29_183442_add_mark_package_as_popular', 2),
(312, '2023_07_04_151432_add_column_business', 2),
(313, '2023_07_13_191306_add_businesses_column_in_coupons', 2),
(314, '2019_03_07_155813_make_repair_statuses_table', 3),
(315, '2019_03_08_120634_add_repair_columns_to_transactions_table', 3),
(316, '2019_03_14_182704_add_repair_permissions', 3),
(317, '2019_03_29_110241_add_repair_version_column_to_system_table', 3),
(318, '2019_04_12_113901_add_repair_settings_column_to_business_table', 3),
(319, '2020_05_05_125008_create_device_models_table', 3),
(320, '2020_05_06_103135_add_repair_model_id_column_to_products_table', 3),
(321, '2020_07_11_120308_add_columns_to_repair_statuses_table', 3),
(322, '2020_07_31_130737_create_job_sheets_table', 3),
(323, '2020_08_07_124241_add_job_sheet_id_to_transactions_table', 3),
(324, '2020_08_22_104640_add_email_template_field_to_repair_status_table', 3),
(325, '2020_10_19_131934_add_job_sheet_custom_fields_to_repair_job_sheets_table', 3),
(326, '2020_11_25_111050_add_parts_column_to_repair_job_sheets_table', 3),
(327, '2020_12_30_101842_add_use_for_repair_column_to_brands_table', 3),
(328, '2021_02_16_190423_add_repair_module_indexing', 3),
(329, '2022_12_23_162847_add_repair_jobsheet_settings_column_to_business_table', 3),
(330, '2020_09_29_184909_add_product_catalogue_version', 4),
(331, '2024_08_22_102212_create_chat_conversations_table', 5);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(80, 'App\\User', 2),
(80, 'App\\User', 7),
(80, 'App\\User', 12),
(80, 'App\\User', 15),
(80, 'App\\User', 16),
(82, 'App\\User', 2),
(82, 'App\\User', 3),
(82, 'App\\User', 6),
(82, 'App\\User', 13),
(134, 'App\\User', 8),
(135, 'App\\User', 9),
(136, 'App\\User', 10),
(137, 'App\\User', 11);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(1, 'App\\User', 2),
(1, 'App\\User', 12),
(1, 'App\\User', 15),
(1, 'App\\User', 16),
(2, 'App\\User', 3),
(6, 'App\\User', 5),
(9, 'App\\User', 13),
(11, 'App\\User', 6),
(11, 'App\\User', 7),
(12, 'App\\User', 8),
(12, 'App\\User', 9),
(12, 'App\\User', 10),
(12, 'App\\User', 11);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0269a47e-ec8d-41d2-8c75-2c2dc319c88e', 'Modules\\Superadmin\\Notifications\\SuperadminCommunicator', 'App\\User', 1, '{\"msg\":\"<p>test&nbsp;<\\/p>\",\"subject\":\"test\",\"show_popup\":true}', '2024-07-11 14:04:52', '2024-07-11 18:02:40', '2024-07-11 14:04:52'),
('3f8b3f86-4ba4-41d4-8db0-c20a50f397d3', 'Modules\\Superadmin\\Notifications\\SendSubscriptionExpiryAlert', 'App\\User', 4, '{\"days_left\":5}', NULL, '2024-08-05 22:00:12', '2024-08-05 22:00:12'),
('9b3964a0-e8e9-4f7c-ad5c-b3327499ed32', 'Modules\\Superadmin\\Notifications\\SendSubscriptionExpiryAlert', 'App\\User', 5, '{\"days_left\":5}', '2024-08-12 17:14:28', '2024-08-05 22:00:13', '2024-08-12 17:14:28'),
('d35a59fa-71af-4234-bdd6-72da0a327ea3', 'Modules\\Superadmin\\Notifications\\SendSubscriptionExpiryAlert', 'App\\User', 5, '{\"days_left\":5}', '2024-08-12 17:14:28', '2024-08-05 22:00:10', '2024-08-12 17:14:28'),
('f079793f-3344-4a08-b3a5-e907edd79af2', 'Modules\\Superadmin\\Notifications\\SendSubscriptionExpiryAlert', 'App\\User', 4, '{\"days_left\":5}', NULL, '2024-08-05 22:00:08', '2024-08-05 22:00:08');

-- --------------------------------------------------------

--
-- Structure de la table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) NOT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `whatsapp_text` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `cc` varchar(191) DEFAULT NULL,
  `bcc` varchar(191) DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT 0,
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Cher {contact_name},</p>\r\n<p>Votre num&eacute;ro de facture est {invoice_number}<br />Montant total : {total_amount}<br />Montant pay&eacute; : {received_amount}</p>\r\n<p>Merci d\'avoir effectu&eacute; vos achats chez nous.</p>\r\n<p>{business_logo}</p>\r\n<p>&nbsp;</p>', 'Cher {contact_name}, Merci d\'avoir effectué vos achats chez nous. {business_name}', NULL, 'Merci de la part de {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(2, 1, 'payment_received', '<p>Cher {contact_name},</p>\r\n<p>Nous avons re&ccedil;u un paiement de {received_amount}</p>\r\n<p>{business_logo}</p>', 'Cher {contact_name}, Nous avons reçu un paiement de {received_amount}. {business_name}', NULL, 'Paiement reçu de {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:35:34'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\r\n<p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\r\n<p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\r\n<p>Your booking is confirmed</p>\r\n<p>Date: {start_time} to {end_time}</p>\r\n<p>Table: {table}</p>\r\n<p>Location: {location}</p>\r\n<p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(5, 1, 'new_order', '<p>Cher {contact_name},</p>\r\n<p>Nous avons une nouvelle commande avec le num&eacute;ro de r&eacute;f&eacute;rence {order_ref_number}. Veuillez traiter les produits d&egrave;s que possible.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'Cher {contact_name}, Nous avons une nouvelle commande avec le numéro de référence {order_ref_number}. Veuillez traiter les produits dès que possible. {business_name}', NULL, 'Nouvelle commande, de {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:35:34'),
(6, 1, 'payment_paid', '<p>Cher {contact_name},<br />Nous avons pay&eacute; le montant {paid amount} sur la facture num&eacute;ro {order_ref_number}.<br />Veuillez en prendre note.<br />{business_name}<br />{business_logo}</p>', 'Nous avons payé le montant {paid amount} sur la facture numéro {order_ref_number}. Veuillez en prendre note. {business_name}', NULL, 'Paiement effectué par {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\r\n<p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\r\n<p>{business_name}<br />{business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\r\n<p>Your quotation number is {invoice_number}<br />Total amount: {total_amount}</p>\r\n<p>Thank you for shopping with us.</p>\r\n<p>{business_logo}</p>\r\n<p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(10, 1, 'purchase_order', '<p>Dear {contact_name},</p>\r\n<p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\r\n<p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 15:30:05', '2024-08-26 18:32:48'),
(11, 2, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(12, 2, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(13, 2, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(14, 2, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(15, 2, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(16, 2, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(17, 2, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(18, 2, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(19, 2, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(20, 2, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(21, 3, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(22, 3, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(23, 3, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(24, 3, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(25, 3, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(26, 3, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(27, 3, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(28, 3, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(29, 3, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(30, 3, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(31, 4, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(32, 4, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(33, 4, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(34, 4, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(35, 4, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(36, 4, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(37, 4, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(38, 4, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(39, 4, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(40, 4, 'purchase_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new purchase order with reference number {order_ref_number}. The respective invoice is attached here with.</p>\n\n                    <p>{business_logo}</p>', 'We have a new purchase order with reference number {order_ref_number}. {business_name}', NULL, 'New Purchase Order, from {business_name}', NULL, NULL, 0, 0, 0, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(41, 1, 'send_ledger', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '2024-08-26 18:32:48', '2024-08-26 18:32:48');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('03b664354db8f6b2c4da985d6497d80d182f34d83d0846514822f0accb22e2bc1b335f65ac5bdc3a', 12, 5, 'KwetuPOS', '[]', 0, '2024-09-20 09:07:48', '2024-09-20 09:07:48', '2025-09-20 11:07:48'),
('22e6356277f811b25369351a57740c3cbdfe6b87cf4ebd754bf3614a5558a94fe7dd047e04372ee8', 12, 5, 'KwetuPOS', '[]', 0, '2024-10-01 07:12:29', '2024-10-01 07:12:29', '2025-10-01 09:12:29'),
('289525cc47bd0458ba9c7cee3508887150e617a89754c78c56c75b0ef402b62af2bc1b4f73ec57c6', 12, 5, 'KwetuPOS', '[]', 0, '2024-09-12 12:16:23', '2024-09-12 12:16:23', '2025-09-12 14:16:23'),
('3b24e53f9c22efbffa904cc37fe318651e1729f0138838e24783a10c2431a6d59f4600e8070a4d03', 12, 5, 'KwetuPOS', '[]', 0, '2024-09-17 06:41:01', '2024-09-17 06:41:01', '2025-09-17 08:41:01'),
('5cf023c1129154b2c82e0251e223c3c1e387446e5fe2d4f6ac0eb4457328c886d42756655fabbd0d', 2, 5, 'KwetuPOS', '[]', 0, '2024-09-17 06:34:50', '2024-09-17 06:34:50', '2025-09-17 08:34:50'),
('72c65e92cc168118a200ea29d568372eda64f27e9f73d6aefb1fe35e1e1353dccf7b8ede65d2e0a0', 12, 7, 'KwetuPOS', '[]', 0, '2024-10-17 08:47:25', '2024-10-17 08:47:25', '2025-10-17 10:47:25'),
('84f7d43f0294eb1b0e5b9e7cc52d4e9dcec1e190c140936d77818fc8cae204aa0525753d270e341b', 12, 5, 'KwetuPOS', '[]', 0, '2024-09-14 08:29:10', '2024-09-14 08:29:10', '2025-09-14 10:29:10'),
('ae9906d613622cfa84bcd3a319a9a6fdf810562c49185bf1da0e28d346cdfff64229d36e329e87c5', 1, 5, 'KwetuPOS', '[]', 0, '2024-10-02 11:48:53', '2024-10-02 11:48:53', '2025-10-02 13:48:53'),
('b8085dd04390c0b3699536fc296540d8f34fd941683facd42eea91040f7fd76969a9072497515e40', 12, 5, 'KwetuPOS', '[]', 0, '2024-09-12 12:38:22', '2024-09-12 12:38:22', '2025-09-12 14:38:22');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'KwetuPOS Personal Access Client', 'LAQSRgSsuavxoLN3BARnAMGpyg30UeDjmeMkyXX0', NULL, 'http://localhost', 1, 0, 0, '2024-07-11 12:19:03', '2024-07-11 12:19:03'),
(2, NULL, 'KwetuPOS Password Grant Client', 'bdxawoZ83OZQeetWfwOs1AcXv7EIbL8jfv9w5TP6', 'users', 'http://localhost', 0, 1, 0, '2024-07-11 12:19:03', '2024-07-11 12:19:03'),
(3, NULL, 'KwetuPOS Personal Access Client', 'bxHLsGmacSyYkT8bUIAyrskgyqj4BoomVTl853tG', NULL, 'http://localhost', 1, 0, 0, '2024-07-15 09:04:31', '2024-07-15 09:04:31'),
(4, NULL, 'KwetuPOS Password Grant Client', 'SdZsAhP7ZovV2wffsaDsC2AIWNLMb3mZ7P732KJX', 'users', 'http://localhost', 0, 1, 0, '2024-07-15 09:04:31', '2024-07-15 09:04:31'),
(5, NULL, 'KwetuPOS Personal Access Client', 'p0tkfL9mRQ1NJ0aqu75C56o4q3f8EA6a4EKxhRS4', NULL, 'http://localhost', 1, 0, 0, '2024-08-22 11:02:54', '2024-08-22 11:02:54'),
(6, NULL, 'KwetuPOS Password Grant Client', '5zyKbhiLqtaukL0SVZedm9rRd7J1hwzCe6kfLBCU', 'users', 'http://localhost', 0, 1, 0, '2024-08-22 11:02:54', '2024-08-22 11:02:54'),
(7, NULL, 'KwetuPOS Personal Access Client', '8JZdPIfR5uzGqhPWd7xgSJTD1OA5TpZpE9cGOtZm', NULL, 'http://localhost', 1, 0, 0, '2024-10-04 16:02:18', '2024-10-04 16:02:18'),
(8, NULL, 'KwetuPOS Password Grant Client', 'pHYqK26IcU9nk92dl5EKQZZe0sPTNqiONiqsHgtz', 'users', 'http://localhost', 0, 1, 0, '2024-10-04 16:02:19', '2024-10-04 16:02:19');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-07-11 12:19:03', '2024-07-11 12:19:03'),
(2, 3, '2024-07-15 09:04:31', '2024-07-15 09:04:31'),
(3, 5, '2024-08-22 11:02:54', '2024-08-22 11:02:54'),
(4, 7, '2024-10-04 16:02:18', '2024-10-04 16:02:18');

-- --------------------------------------------------------

--
-- Structure de la table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `location_count` int(11) NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int(11) NOT NULL,
  `product_count` int(11) NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Enable/Disable tables',
  `invoice_count` int(11) NOT NULL,
  `interval` enum('days','months','years') NOT NULL,
  `interval_count` int(11) NOT NULL,
  `trial_days` int(11) NOT NULL,
  `price` decimal(22,0) NOT NULL,
  `custom_permissions` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL,
  `mark_package_as_popular` tinyint(1) NOT NULL,
  `businesses` longtext DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_one_time` tinyint(1) NOT NULL DEFAULT 0,
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT 0,
  `custom_link` varchar(191) DEFAULT NULL,
  `custom_link_text` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `packages`
--

INSERT INTO `packages` (`id`, `name`, `description`, `location_count`, `user_count`, `product_count`, `bookings`, `kitchen`, `order_screen`, `tables`, `invoice_count`, `interval`, `interval_count`, `trial_days`, `price`, `custom_permissions`, `created_by`, `sort_order`, `is_active`, `mark_package_as_popular`, `businesses`, `is_private`, `is_one_time`, `enable_custom_link`, `custom_link`, `custom_link_text`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Kwetu Basic', 'Idéal pour les petites entreprises et les commerces de proximité', 5, 10, 100, 0, 0, 0, 0, 1000, 'months', 1, 10, 20000, '', 1, 1, 1, 0, NULL, 0, 0, 0, '', '', NULL, '2024-07-11 18:06:37', '2024-07-15 11:24:53'),
(2, 'Kwetu Standard', 'Conçu pour les entreprises de taille moyenne souhaitant des fonctionnalités avancées.', 25, 50, 5000, 0, 0, 0, 0, 10000, 'months', 1, 10, 49500, '', 1, 1, 1, 0, NULL, 0, 0, 0, '', '', NULL, '2024-07-11 18:10:42', '2024-07-11 14:59:57'),
(3, 'Kwetu Premium', 'Parfait pour les grandes entreprises et les chaînes de magasins ayant besoin de fonctionnalités complètes et de support prioritaire', 50, 100, 15000, 0, 0, 0, 0, 25000, 'months', 1, 10, 99000, '', 1, 1, 1, 0, NULL, 0, 0, 0, '', '', NULL, '2024-07-11 18:38:54', '2024-07-11 15:00:34'),
(4, 'Kwetu Enterprise', 'Pour les grandes entreprises avec des besoins spécifiques et des solutions sur mesure.', 0, 0, 0, 0, 0, 0, 0, 0, 'years', 12, 356, 0, '{\"productcatalogue_module\":\"1\",\"repair_module\":\"1\"}', 1, 1, 1, 0, '[\"1\"]', 0, 0, 0, '', '', NULL, '2024-07-11 18:43:39', '2024-08-22 11:37:23'),
(5, 'Kwetu Repair', 'Repair Pro', 10, 10, 100, 0, 0, 0, 0, 500, 'months', 1, 3, 65000, '{\"productcatalogue_module\":\"1\",\"repair_module\":\"1\"}', 1, 1, 1, 0, NULL, 0, 0, 0, '', '', '2024-08-22 11:36:06', '2024-08-22 11:34:56', '2024-08-22 11:36:06');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2024-07-11 15:26:47', NULL),
(2, 'direct_sell.access', 'web', '2024-07-11 15:26:47', NULL),
(3, 'product.opening_stock', 'web', '2024-07-11 15:26:50', '2024-07-11 15:26:50'),
(4, 'crud_all_bookings', 'web', '2024-07-11 15:26:51', '2024-07-11 15:26:51'),
(5, 'crud_own_bookings', 'web', '2024-07-11 15:26:51', '2024-07-11 15:26:51'),
(6, 'access_default_selling_price', 'web', '2024-07-11 15:26:53', '2024-07-11 15:26:53'),
(7, 'purchase.payments', 'web', '2024-07-11 15:26:54', '2024-07-11 15:26:54'),
(8, 'sell.payments', 'web', '2024-07-11 15:26:54', '2024-07-11 15:26:54'),
(9, 'edit_product_price_from_sale_screen', 'web', '2024-07-11 15:26:54', '2024-07-11 15:26:54'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2024-07-11 15:26:54', '2024-07-11 15:26:54'),
(11, 'roles.view', 'web', '2024-07-11 15:26:55', '2024-07-11 15:26:55'),
(12, 'roles.create', 'web', '2024-07-11 15:26:55', '2024-07-11 15:26:55'),
(13, 'roles.update', 'web', '2024-07-11 15:26:55', '2024-07-11 15:26:55'),
(14, 'roles.delete', 'web', '2024-07-11 15:26:55', '2024-07-11 15:26:55'),
(15, 'account.access', 'web', '2024-07-11 15:26:56', '2024-07-11 15:26:56'),
(16, 'discount.access', 'web', '2024-07-11 15:26:56', '2024-07-11 15:26:56'),
(17, 'view_purchase_price', 'web', '2024-07-11 15:26:59', '2024-07-11 15:26:59'),
(18, 'view_own_sell_only', 'web', '2024-07-11 15:26:59', '2024-07-11 15:26:59'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2024-07-11 15:27:00', '2024-07-11 15:27:00'),
(20, 'edit_product_price_from_pos_screen', 'web', '2024-07-11 15:27:00', '2024-07-11 15:27:00'),
(21, 'access_shipping', 'web', '2024-07-11 15:27:01', '2024-07-11 15:27:01'),
(22, 'purchase.update_status', 'web', '2024-07-11 15:27:01', '2024-07-11 15:27:01'),
(23, 'list_drafts', 'web', '2024-07-11 15:27:02', '2024-07-11 15:27:02'),
(24, 'list_quotations', 'web', '2024-07-11 15:27:02', '2024-07-11 15:27:02'),
(25, 'view_cash_register', 'web', '2024-07-11 15:27:07', '2024-07-11 15:27:07'),
(26, 'close_cash_register', 'web', '2024-07-11 15:27:07', '2024-07-11 15:27:07'),
(27, 'print_invoice', 'web', '2024-07-11 15:27:11', '2024-07-11 15:27:11'),
(28, 'user.view', 'web', '2024-07-11 15:27:15', NULL),
(29, 'user.create', 'web', '2024-07-11 15:27:15', NULL),
(30, 'user.update', 'web', '2024-07-11 15:27:15', NULL),
(31, 'user.delete', 'web', '2024-07-11 15:27:15', NULL),
(32, 'supplier.view', 'web', '2024-07-11 15:27:15', NULL),
(33, 'supplier.create', 'web', '2024-07-11 15:27:15', NULL),
(34, 'supplier.update', 'web', '2024-07-11 15:27:15', NULL),
(35, 'supplier.delete', 'web', '2024-07-11 15:27:15', NULL),
(36, 'customer.view', 'web', '2024-07-11 15:27:15', NULL),
(37, 'customer.create', 'web', '2024-07-11 15:27:15', NULL),
(38, 'customer.update', 'web', '2024-07-11 15:27:15', NULL),
(39, 'customer.delete', 'web', '2024-07-11 15:27:15', NULL),
(40, 'product.view', 'web', '2024-07-11 15:27:15', NULL),
(41, 'product.create', 'web', '2024-07-11 15:27:15', NULL),
(42, 'product.update', 'web', '2024-07-11 15:27:15', NULL),
(43, 'product.delete', 'web', '2024-07-11 15:27:15', NULL),
(44, 'purchase.view', 'web', '2024-07-11 15:27:15', NULL),
(45, 'purchase.create', 'web', '2024-07-11 15:27:15', NULL),
(46, 'purchase.update', 'web', '2024-07-11 15:27:15', NULL),
(47, 'purchase.delete', 'web', '2024-07-11 15:27:15', NULL),
(48, 'sell.view', 'web', '2024-07-11 15:27:15', NULL),
(49, 'sell.create', 'web', '2024-07-11 15:27:15', NULL),
(50, 'sell.update', 'web', '2024-07-11 15:27:15', NULL),
(51, 'sell.delete', 'web', '2024-07-11 15:27:15', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2024-07-11 15:27:15', NULL),
(53, 'contacts_report.view', 'web', '2024-07-11 15:27:15', NULL),
(54, 'stock_report.view', 'web', '2024-07-11 15:27:15', NULL),
(55, 'tax_report.view', 'web', '2024-07-11 15:27:15', NULL),
(56, 'trending_product_report.view', 'web', '2024-07-11 15:27:15', NULL),
(57, 'register_report.view', 'web', '2024-07-11 15:27:15', NULL),
(58, 'sales_representative.view', 'web', '2024-07-11 15:27:15', NULL),
(59, 'expense_report.view', 'web', '2024-07-11 15:27:15', NULL),
(60, 'business_settings.access', 'web', '2024-07-11 15:27:15', NULL),
(61, 'barcode_settings.access', 'web', '2024-07-11 15:27:15', NULL),
(62, 'invoice_settings.access', 'web', '2024-07-11 15:27:15', NULL),
(63, 'brand.view', 'web', '2024-07-11 15:27:15', NULL),
(64, 'brand.create', 'web', '2024-07-11 15:27:15', NULL),
(65, 'brand.update', 'web', '2024-07-11 15:27:15', NULL),
(66, 'brand.delete', 'web', '2024-07-11 15:27:15', NULL),
(67, 'tax_rate.view', 'web', '2024-07-11 15:27:15', NULL),
(68, 'tax_rate.create', 'web', '2024-07-11 15:27:15', NULL),
(69, 'tax_rate.update', 'web', '2024-07-11 15:27:15', NULL),
(70, 'tax_rate.delete', 'web', '2024-07-11 15:27:15', NULL),
(71, 'unit.view', 'web', '2024-07-11 15:27:15', NULL),
(72, 'unit.create', 'web', '2024-07-11 15:27:15', NULL),
(73, 'unit.update', 'web', '2024-07-11 15:27:15', NULL),
(74, 'unit.delete', 'web', '2024-07-11 15:27:15', NULL),
(75, 'category.view', 'web', '2024-07-11 15:27:15', NULL),
(76, 'category.create', 'web', '2024-07-11 15:27:15', NULL),
(77, 'category.update', 'web', '2024-07-11 15:27:15', NULL),
(78, 'category.delete', 'web', '2024-07-11 15:27:15', NULL),
(79, 'expense.access', 'web', '2024-07-11 15:27:15', NULL),
(80, 'access_all_locations', 'web', '2024-07-11 15:27:15', NULL),
(81, 'dashboard.data', 'web', '2024-07-11 15:27:15', NULL),
(82, 'location.1', 'web', '2024-07-11 15:30:06', '2024-07-11 15:30:06'),
(83, 'view_export_buttons', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(84, 'edit_purchase_payment', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(85, 'edit_pos_payment', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(86, 'disable_pay_checkout', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(87, 'disable_draft', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(88, 'disable_express_checkout', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(89, 'disable_discount', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(90, 'disable_suspend_sale', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(91, 'disable_credit_sale', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(92, 'disable_quotation', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(93, 'disable_card', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(94, 'view_paid_sells_only', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(95, 'view_due_sells_only', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(96, 'view_partial_sells_only', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(97, 'view_overdue_sells_only', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(98, 'direct_sell.update', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(99, 'view_commission_agent_sell', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(100, 'edit_sell_payment', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(101, 'delete_sell_payment', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(102, 'access_sell_return', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(103, 'access_own_sell_return', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(104, 'edit_invoice_number', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(105, 'draft.update', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(106, 'supplier.view_own', 'web', '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(107, 'customer.view_own', 'web', '2024-07-11 14:53:10', '2024-07-11 14:53:10'),
(108, 'customer_irrespective_of_sell', 'web', '2024-07-11 14:53:10', '2024-07-11 14:53:10'),
(109, 'view_own_purchase', 'web', '2024-07-11 14:53:10', '2024-07-11 14:53:10'),
(110, 'draft.view_own', 'web', '2024-07-11 14:53:10', '2024-07-11 14:53:10'),
(111, 'location.2', 'web', '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(112, 'location.3', 'web', '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(113, 'access_printers', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(114, 'expense.add', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(115, 'expense.edit', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(116, 'edit_account_transaction', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(117, 'direct_sell.view', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(118, 'all_expense.access', 'web', '2024-07-12 13:55:44', '2024-07-12 13:55:44'),
(119, 'access_types_of_service', 'web', '2024-07-12 14:03:53', '2024-07-12 14:03:53'),
(120, 'view_own_expense', 'web', '2024-07-12 14:03:53', '2024-07-12 14:03:53'),
(121, 'access_tables', 'web', '2024-07-12 14:04:11', '2024-07-12 14:04:11'),
(122, 'repair.create', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(123, 'repair.update', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(124, 'repair.view', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(125, 'repair.delete', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(126, 'repair_status.update', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(127, 'repair_status.access', 'web', '2024-07-12 15:19:22', '2024-07-12 15:19:22'),
(128, 'job_sheet.create', 'web', '2024-07-15 06:50:47', '2024-07-15 06:50:47'),
(129, 'job_sheet.edit', 'web', '2024-07-15 06:50:47', '2024-07-15 06:50:47'),
(130, 'job_sheet.delete', 'web', '2024-07-15 06:50:47', '2024-07-15 06:50:47'),
(131, 'job_sheet.view_all', 'web', '2024-07-15 06:50:47', '2024-07-15 06:50:47'),
(132, 'view_product_stock_value', 'web', '2024-07-15 08:19:53', '2024-07-15 08:19:53'),
(133, 'customer_with_no_sell_three_month', 'web', '2024-07-16 13:10:34', '2024-07-16 13:10:34'),
(134, 'location.4', 'web', '2024-07-16 13:14:47', '2024-07-16 13:14:47'),
(135, 'location.5', 'web', '2024-07-16 13:16:11', '2024-07-16 13:16:11'),
(136, 'location.6', 'web', '2024-07-16 13:17:50', '2024-07-16 13:17:50'),
(137, 'location.7', 'web', '2024-07-16 13:19:23', '2024-07-16 13:19:23'),
(138, 'location.8', 'web', '2024-08-15 08:14:39', '2024-08-15 08:14:39');

-- --------------------------------------------------------

--
-- Structure de la table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `connection_type` enum('network','windows','linux') NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` varchar(191) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `printers`
--

INSERT INTO `printers` (`id`, `business_id`, `name`, `connection_type`, `capability_profile`, `char_per_line`, `ip_address`, `port`, `path`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Start 100 II', 'windows', 'SP2000', '42', '', '', '/dev/usb/lp1', 1, '2024-07-12 11:17:04', '2024-07-12 11:17:04'),
(2, 1, 'Print A4', 'network', 'simple', '42', '10.244.100.105', '9100', '', 1, '2024-07-12 17:43:24', '2024-07-12 17:43:24');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `secondary_unit_id` int(11) DEFAULT NULL,
  `sub_unit_ids` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT 0,
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT 0,
  `weight` varchar(191) DEFAULT NULL,
  `product_custom_field1` varchar(191) DEFAULT NULL,
  `product_custom_field2` varchar(191) DEFAULT NULL,
  `product_custom_field3` varchar(191) DEFAULT NULL,
  `product_custom_field4` varchar(191) DEFAULT NULL,
  `product_custom_field5` varchar(191) DEFAULT NULL,
  `product_custom_field6` varchar(191) DEFAULT NULL,
  `product_custom_field7` varchar(191) DEFAULT NULL,
  `product_custom_field8` varchar(191) DEFAULT NULL,
  `product_custom_field9` varchar(191) DEFAULT NULL,
  `product_custom_field10` varchar(191) DEFAULT NULL,
  `product_custom_field11` varchar(191) DEFAULT NULL,
  `product_custom_field12` varchar(191) DEFAULT NULL,
  `product_custom_field13` varchar(191) DEFAULT NULL,
  `product_custom_field14` varchar(191) DEFAULT NULL,
  `product_custom_field15` varchar(191) DEFAULT NULL,
  `product_custom_field16` varchar(191) DEFAULT NULL,
  `product_custom_field17` varchar(191) DEFAULT NULL,
  `product_custom_field18` varchar(191) DEFAULT NULL,
  `product_custom_field19` varchar(191) DEFAULT NULL,
  `product_custom_field20` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `preparation_time_in_minutes` int(11) DEFAULT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT 0,
  `repair_model_id` int(10) UNSIGNED DEFAULT NULL,
  `not_for_selling` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `secondary_unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `product_custom_field5`, `product_custom_field6`, `product_custom_field7`, `product_custom_field8`, `product_custom_field9`, `product_custom_field10`, `product_custom_field11`, `product_custom_field12`, `product_custom_field13`, `product_custom_field14`, `product_custom_field15`, `product_custom_field16`, `product_custom_field17`, `product_custom_field18`, `product_custom_field19`, `product_custom_field20`, `image`, `product_description`, `created_by`, `preparation_time_in_minutes`, `warranty_id`, `is_inactive`, `repair_model_id`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(2, 'Kit Intel NUC DN2820FYKH Intel Celeron N2820', 1, 'single', 1, NULL, NULL, 13, 1, 2, NULL, 'exclusive', 1, 10.0000, '0002', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721051640_71TvvF+wJjL.jpg', '<p>N2820 2,16 GHz 8 Go RAM 30 Go SSD sans syst&egrave;me d\'exploitation sans bloc d\'alimentation</p>', 1, NULL, NULL, 0, NULL, 0, '2024-07-15 12:54:00', '2024-07-15 13:00:15'),
(3, 'Dell Dimension E520', 1, 'single', 1, NULL, NULL, 3, 1, 2, NULL, 'exclusive', 1, NULL, '0003', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721052646_product_86.jpg', '<p>Intel Core 2 Duo 4 Go RAM 500 Go Windows 10</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:09:43', '2024-07-15 13:18:05'),
(4, 'DELL VOSTRO 220', 1, 'single', 1, NULL, NULL, 3, 1, 2, NULL, 'exclusive', 1, NULL, '0004', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721053115_product_89.jpg', '<p>Series Win 10 Pro (B)</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:16:05', '2024-07-15 13:18:35'),
(5, 'Dell Vostro 220', 1, 'single', 1, NULL, NULL, 3, 1, 2, NULL, 'exclusive', 1, NULL, '0005', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721053068_product_89.jpg', '<p>&Eacute;tui PC tour centrale Dell Vostro 220 MicroATX noir avec ports d\'E/S avant Windows 10-2.50Ghz 2Go 148Go - Port Serie - Pc Tour</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:17:48', '2024-07-15 13:18:57'),
(6, 'PC HP Elite 8200', 1, 'single', 1, NULL, NULL, 1, 1, 2, NULL, 'exclusive', 1, NULL, '0006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053225_product_90.png', '<p>Core i5 - 3.10GHz - 4Go -226Go</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:20:25', '2024-07-15 13:20:25'),
(7, 'Dell Precision T3500', 1, 'single', 1, NULL, NULL, NULL, 1, 2, NULL, 'exclusive', 1, NULL, '0007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053275_product_91.jpg', '<p>Station de travail Dell Precision T3500 - ORDINATEUR TOUR WORKSTATION PC</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:21:15', '2024-07-15 13:21:15'),
(8, 'ACER Aspire PC', 1, 'single', 1, NULL, NULL, NULL, 1, 2, NULL, 'exclusive', 1, NULL, '0008', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721053342_product_92.png', '<p>RAM 4Go - HDD 930Go - Windows 10 Pro</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:22:22', '2024-07-16 05:44:33'),
(9, 'LENOVO THINKPAD X230', 1, 'single', 1, NULL, NULL, NULL, 1, 3, NULL, 'exclusive', 1, NULL, '0009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053418_product_33.jpg', '<div class=\"title text-center text-warning\">\r\n<h4>&nbsp;SOUS WINDOWS 10 - RAM 8 GO - HDD 500 GO</h4>\r\n</div>\r\n<div class=\"description\"><center>PC Portable LENOVO THINKPAD X230 reconditionn&eacute;. Ce Pc portable Lenovo de la gamme Thinkpad poss&egrave;de une plasturgie solide. Il est &eacute;quip&eacute; de 8 Go de m&eacute;moire vive. Il dispose d\'un &eacute;cran 15,4 pouces.</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:23:38', '2024-07-15 13:23:38'),
(10, 'DELL LATITUDE E6410', 1, 'single', 1, NULL, NULL, NULL, 1, 3, NULL, 'exclusive', 1, NULL, '0010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053470_product_78.jpg', '<p>WINDOWS 10 - HDD 150 - CORE I5 - RAM 4 GO - GRADE D - N&deg;041602</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:24:30', '2024-07-15 13:24:30'),
(11, 'PC PORTABLE DELL', 1, 'single', 1, NULL, NULL, 3, 1, 3, NULL, 'exclusive', 1, NULL, '0011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053549_product_83.jpg', '<div class=\"description\"><center>Dell PC portable 15,6\" HD Noir (Intel Core i3, 4 Go de RAM, Disque Dur 500 Go, Intel HD WINDOWS 10 PRO</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:25:49', '2024-07-15 13:25:49'),
(12, 'Ordinateur portable Toshiba', 1, 'single', 1, NULL, NULL, NULL, 1, 3, NULL, 'exclusive', 1, NULL, '0012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721053952_product_84.png', '<p>Ordinateur portable Toshiba 4 Go RAM Intel Core i3</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:32:32', '2024-07-15 13:32:33'),
(13, 'TSP100III Series', 1, 'single', 1, NULL, NULL, NULL, 61, NULL, NULL, 'exclusive', 1, NULL, '0013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721054058_product_8.jpg', '<p>Thermique directe POS printer 203 x 203DPI - imprimantes &agrave; re&ccedil;u de point de vente (Thermique directe, POS printer, 48/64, 250</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-15 13:34:18', '2024-07-15 13:34:18'),
(14, 'Adaptateur secteur Apple 60 W MagSafe 2 (alimentation pour MacBook Pro 13\" avec écran Retina)', 1, 'single', 1, NULL, NULL, NULL, 68, 71, NULL, 'exclusive', 1, NULL, '0014', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1721112285_product_9.jpg', '<p>Apple 60W MagSafe 2 Power Adapter (MacBook Pro with 13-inch Retina Display)-Adaptateur secteur pour MacBook Pro</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:44:45', '2024-07-16 05:46:21'),
(15, 'Câble d\'objectif Polycom HDCI', 1, 'single', 1, NULL, NULL, NULL, 68, 69, NULL, 'exclusive', 1, NULL, '0015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112357_product_73.png', '<p>Cable III C&acirc;ble d\'objectif Polycom pour vid&eacute;oconf&eacute;rence S&eacute;rie HDX C&acirc;ble HDCI 60 broches/c&oelig;ur</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:45:57', '2024-07-16 05:45:57'),
(16, 'Universal screen protector cutter', 1, 'single', 1, NULL, NULL, NULL, 68, 76, NULL, 'exclusive', 1, NULL, '0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112484_product_22.jpg', '<p>Mobile Phone Film Cutting Machine, Intelligent Screen Protector Film Cutter, with Touch Screen Supports 17 Languages, Supports 16\"</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:48:04', '2024-07-16 05:48:04'),
(17, 'Filtre de confidentialité DICOTA D30895 , ordinateur portable 14\", 16:9', 1, 'single', 1, NULL, NULL, NULL, 68, 76, NULL, 'exclusive', 1, NULL, '0017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112564_product_23.jpg', '<p>Dicota D30895 Filtre Anti-Reflets pour &eacute;cran et Filtre de confidentialit&eacute; 35,6 cm (14\")</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:49:24', '2024-07-16 05:49:24'),
(18, 'LENOVO THINKCENTRE M72E TINY- WINDOWS 10', 1, 'single', 1, NULL, NULL, NULL, 1, 2, NULL, 'exclusive', 1, NULL, '0018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112673_product_79.jpg', '<p>Intel Core i5-3470T 2,9GHz / 4Go RAM DDR3 / 500Go HDD/ Gigabit LAN / Windows 10</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:51:13', '2024-07-16 05:51:13'),
(19, 'Lenovo Ultra Mini PC', 1, 'single', 1, NULL, NULL, NULL, 1, 2, NULL, 'exclusive', 1, NULL, '0019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112719_product_80.jpg', '<p>PC M73 Tiny USFF i5-4130T RAM 4Go Disque 470Go Windows 10 WiFi (Reconditionn&eacute;)</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:51:59', '2024-07-16 05:51:59'),
(20, 'DELL 9020 SFF', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0020', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112771_product_81.jpg', '<p>CORE-I5 - RAM 8 GO - HDD 500 GO WINDOWS 10 N&deg;260501 - GRADE B</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:52:51', '2024-07-16 05:52:51'),
(21, 'Code: MO1013 Marque : RoSH', 1, 'single', 1, NULL, NULL, NULL, 68, 73, NULL, 'exclusive', 1, NULL, '0021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112851_product_11.jpg', '<p>32GB Noir, Lani&egrave;re noire basique incluse (40cm)</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:54:11', '2024-07-16 05:54:11'),
(22, 'Ubiquiti Networks 24-Poe', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721112947_product_24.jpg', '<p>Ubiquiti USW-PRO-24-POE | Commutateur Unifi Gen 2 10 Gigabits</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:55:47', '2024-07-16 05:55:47'),
(23, 'Datalogic Touch 90', 1, 'single', 1, NULL, NULL, NULL, 61, NULL, NULL, 'exclusive', 1, NULL, '0023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721113121_product_39.jpg', '<p>Datalogic Touch 90 Lite Lecteur de Code Barre Noir Taille Unique</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:58:41', '2024-07-16 05:58:41'),
(24, 'Boîtier externe USB 2.0 2.5 IDE en aluminium et argent', 1, 'single', 1, NULL, NULL, NULL, 31, 32, NULL, 'exclusive', 1, NULL, '0024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721113174_product_41.jpg', '<div class=\"description\"><center>Bo&icirc;tier externe USB 2.0 2.5 IDE en aluminium et argent pour disque dur jusqu\'&agrave; 500 go, 1 To, 480mbps en option</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 05:59:34', '2024-07-16 05:59:34'),
(25, 'Canon CS100', 1, 'single', 1, NULL, NULL, NULL, 31, 36, NULL, 'exclusive', 1, NULL, '0025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721113278_product_45.jpg', '<p>Station d\'accueil pour Appareil Photo Noir</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 06:01:18', '2024-07-16 06:01:20'),
(26, 'Cisco 5508 Wireless Controller', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0026', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721129506_product_58.jpg', '<p>P&eacute;riph&eacute;rique d\'administration r&eacute;seau 8 ports 25 points d\'acc&egrave;s g&eacute;r&eacute;s Gigabit Ethernet 1U</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:31:46', '2024-07-16 10:31:46'),
(27, 'Cisco ASA 5510 Firewall', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0027', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721130213_product_59.jpg', '<p>Edition Dispositif de s&eacute;curit&eacute; 0 / 1 3 ports Fast EN 1U montable sur rack</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:43:33', '2024-07-16 10:43:33'),
(28, 'SWITCH ZYXEL', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721130996_product_61.png', '<p>Zyxel GS2210-48HP - commutateur - 48 ports - G&eacute;r&eacute;</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:56:36', '2024-07-16 10:56:36'),
(29, 'SWITCH HP', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721131039_product_62.png', NULL, 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:57:19', '2024-07-16 10:57:19'),
(30, 'Cisco Catalyst 4500-X', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721131113_product_63.jpg', '<p>&nbsp;commutateur - 32 ports - Montable sur rack - WS-C4500X-32SFP+</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:58:33', '2024-07-16 10:58:33'),
(31, 'Commutateur réseau Cisco Catalyst 2960X-24PS-L', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0031', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721131190_product_64.jpg', '<p>24 Ports Gigabit Ethernet, consommation PoE 370 W, 4 Ports de Liaison Montante 1G SFP, Garantie &agrave; Vie limit&eacute;e am&eacute;lior&eacute;e (WS-C2960X-</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 10:59:50', '2024-07-16 10:59:50'),
(32, 'PLANET FGSW-2620', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0032', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721131247_product_65.png', '<p>Commutateur Ethernet Gigabit 24 ports 10/100 Mbps + 2 ports</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 11:00:47', '2024-07-16 11:00:47'),
(33, 'Commutateur intelligent Netgear', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0033', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721131294_product_66.jpg', '<div class=\"description\"><center>GS516TP Gigabit PoE/PD (gris)</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-16 11:01:34', '2024-07-16 11:01:34'),
(34, 'FOYER AMELIORE VENTILE', 3, 'single', 3, NULL, NULL, NULL, 90, NULL, NULL, 'exclusive', 1, 10.0000, 'FAVM01', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '<p>Foyer am&eacute;lior&eacute; ventil&eacute; avec dispositif de recharge de t&eacute;l&eacute;phone</p>', 5, NULL, NULL, 0, NULL, 0, '2024-07-16 13:32:23', '2024-07-17 09:42:06'),
(35, 'FOYER AMELIORE NON VENTILE', 3, 'single', 3, NULL, NULL, NULL, 90, NULL, NULL, 'exclusive', 1, 5.0000, 'FANVM01', 'C128', NULL, NULL, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '<p>FOYER AMELIORE NON VENTILE</p>', 5, NULL, NULL, 0, NULL, 0, '2024-07-16 13:36:11', '2024-07-17 09:41:40'),
(36, 'Dell PowerConnect 2848', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0036', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721198835_product_67.jpg', '<p>- Switch - 48 ports - G&eacute;r&eacute; - Ordinateur de bureau, montable en rack (469-4245)</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 05:47:15', '2024-07-17 05:47:15'),
(37, 'Commutateur Dell N3024F', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0037', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721198885_product_68.jpg', '<div class=\"description\"><center>POWERCONNECT N3024F avec 1x alimentation et rails - 462-5883</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 05:48:05', '2024-07-17 05:48:05'),
(38, 'HP 2530–24 G-PoE', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0038', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721201215_product_70.jpg', NULL, 7, NULL, NULL, 0, NULL, 0, '2024-07-17 06:26:55', '2024-07-17 06:26:55'),
(39, 'Cisco Systems 1700 Séries', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0039', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721201453_product_71.jpg', '<p>Mod&egrave;le 1760 Modulaire Acc&egrave;s Routeur Voip 32MB Flash</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 06:30:53', '2024-07-17 06:30:53'),
(40, 'NETGEAR Switch non géré Fast Ethernet 10/100', 1, 'single', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '0040', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721202312_product_76.jpg', '<p>&agrave; 5 ports (FS105) pour ordinateur de bureau et protection &agrave; vie ProSAFE</p>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 06:45:12', '2024-07-17 06:45:12'),
(41, 'Switch non géré Ethernet Gigabit NETGEAR 16 ports (GS116NA)', 1, 'single', 1, NULL, NULL, NULL, 37, 41, NULL, 'exclusive', 1, NULL, '0041', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721202868_product_77.jpg', '<div class=\"description\"><center>Montage sur bureau ou mural et protection &agrave; vie limit&eacute;e</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 06:54:28', '2024-07-17 06:54:28'),
(42, 'Apple iPad 2 32GB 3G - Black', 1, 'single', 1, NULL, NULL, NULL, 1, 5, NULL, 'exclusive', 1, NULL, '0042', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description\"><center>Apple iPad 2 32GB 3G - Black - Unlocked (Grade B) + Warranty</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 07:52:02', '2024-07-17 07:52:02'),
(43, 'Cisco AIR-CAP3702I-A-K9', 1, 'single', 1, NULL, NULL, NULL, 37, 40, NULL, 'exclusive', 1, NULL, '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"title text-center text-warning\">\r\n<h4>802.11ac Ctrlr AP 4x4:3SS avec CleanAir Int Ant A Reg Domain Technologie de connexion : Sans fil Ex&eacute;cution: original Largeur: 22,1 cm Protocole</h4>\r\n</div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 08:08:25', '2024-07-17 08:08:25'),
(44, 'GRANULE - 5 KG', 3, 'single', 3, NULL, NULL, NULL, 91, NULL, NULL, 'exclusive', 1, 20.0000, 'GR25', 'C128', NULL, NULL, 0, '5 KG', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, '<p>Granul&eacute; en sac de 5 KG</p>', 5, NULL, NULL, 0, NULL, 0, '2024-07-17 09:44:51', '2024-07-17 09:45:23'),
(45, 'Jabra Evolve 75 Headset Sans Fil', 1, 'single', 1, NULL, NULL, NULL, 21, 27, NULL, 'exclusive', 1, NULL, '0045', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description\"><center>supra-auriculaire &ndash; Casque st&eacute;r&eacute;o Unified Communications avec Batterie Longue Dur&eacute;e &ndash; Pour Ordinateurs, Smartphones et Tablettes</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 10:01:11', '2024-07-17 10:01:11'),
(46, 'GN Netcom GN 9120', 1, 'single', 1, NULL, NULL, NULL, 21, 27, NULL, 'exclusive', 1, NULL, 'GN Netcom GN 9120MicroBoom Micro-casque sans fil DECT Sans base', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721217139_product_53.jpg', '<div class=\"description\"><center>MicroBoom Micro-casque sans fil DECT Sans base</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 10:52:19', '2024-07-17 10:52:19'),
(47, 'MOBILAX CONNECT', 1, 'single', 1, NULL, NULL, NULL, 21, 27, NULL, 'exclusive', 1, NULL, '0047', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description\"><center>Casque Audio Filaire CONNECT Noir</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 10:55:05', '2024-07-17 10:55:05'),
(48, 'Turtle Beach', 1, 'single', 1, NULL, NULL, NULL, 45, 50, NULL, 'exclusive', 1, NULL, 'Turtle BeachCasque de jeu sans fil avec son Surround Stealth 500P de Turtle Beach - PS4, PS4 Pro et PS3', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721220463_product_55.jpg', '<div class=\"title text-center text-warning\">\r\n<h4>Casque de jeu sans fil avec son Surround Stealth 500P de Turtle Beach - PS4, PS4 Pro et PS3</h4>\r\n</div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-17 11:47:43', '2024-07-17 11:47:43'),
(49, 'Jabra Evolve2 40 Casque PC', 1, 'single', 1, NULL, NULL, NULL, 21, 27, NULL, 'exclusive', 1, NULL, '0049', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1721287502_product_56.jpg', '<div class=\"description\"><center>Stereo &Eacute;couteurs Certifi&eacute; Microsoft Teams &agrave; R&eacute;duction du Bruit avec Technologie d\'Appel &agrave; 3 Microphones - C&acirc;ble USB-A - Noir</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-18 06:25:03', '2024-07-18 06:25:03'),
(50, 'Harman Kardon - Omni Adaptateur', 1, 'single', 1, NULL, NULL, NULL, 21, 28, NULL, 'exclusive', 1, NULL, '0050', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<div class=\"description\"><center>Harman Kardon - Omni Adaptateur - Sans Fil - WiFi - HD Audio - Noir</center></div>', 7, NULL, NULL, 0, NULL, 0, '2024-07-18 08:37:06', '2024-07-18 08:37:06'),
(51, 'Lenovo Thinkpad X230', 1, 'single', 1, NULL, NULL, 188, 1, 3, NULL, 'exclusive', 1, 10.0000, '0051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1722071061_lenovo-x230-core-i5-3rd-gen-with-1-year-warranty.jpg', '<h2><strong>Mod&egrave;le LENOVO Thinkpad X230</strong></h2>\r\n<div><strong><br />Facteur de forme&nbsp;</strong>: Ultra portable - Ultrabook<br /><strong>Processeur&nbsp;</strong>: Intel Core i5- 3210M 2,5 GHz</div>\r\n<div><strong>Chipset&nbsp;</strong>: Intel QM77 Express</div>\r\n<div><strong>M&eacute;moire Vive</strong> : 8 Go - DDR3</div>\r\n<div><strong>Disque stockage</strong> : 256 Go SSD</div>\r\n<div><strong>Lecteur optique</strong>&nbsp;: Non</div>\r\n<div><strong>Carte graphique</strong>&nbsp;: Int&eacute;gr&eacute;e - Intel HD Graphics 3000</div>\r\n<div><strong>Carte son</strong>&nbsp;: Int&eacute;gr&eacute;e - Enceintes et microphone</div>\r\n<div><strong>R&eacute;seau&nbsp;</strong>: 100/1000 - Gigabit Ethernet</div>\r\n<div><strong>Wifi&nbsp;</strong>: Oui<br /><strong>Bluetooth</strong>&nbsp;: Oui</div>\r\n<div><strong>Webcam&nbsp;</strong>: Non<br /><strong>Pav&eacute; num&eacute;rique</strong>&nbsp;: Non<br />\r\n<div><strong>Clavier&nbsp;</strong>: AZERTY fran&ccedil;ais &eacute;clair&eacute;</div>\r\n<div><strong>Ecran&nbsp;</strong>: 12.5\'\' HD - LED - MAT Antireflets</div>\r\n<div><strong>R&eacute;solution&nbsp;</strong>:&nbsp;1366 x 768</div>\r\n<strong>Syst&egrave;me d\'exploitation&nbsp;</strong>: Microsoft Windows 10 Professionnel 64 bits (avec licence)</div>\r\n<div><strong>Dimensions&nbsp;</strong>: Hauteur : 2.6 cm - Largeur : 30.5 cm - Profondeur : 20.6 cm</div>\r\n<div><strong>Poids&nbsp;</strong>: 1.35Kg<br /><strong>Couleur&nbsp;:</strong>&nbsp;Noir</div>\r\n<div><strong>Ports de connexion<br /></strong></div>\r\n<div>2 x Hi-Speed USB (3.0)<br />1 x USB 2.0 toujours aliment&eacute;</div>\r\n<div>1 x VGA - HD D-Sub (HD-15) 15 broches</div>\r\n<div>1 x mini DisplayPort<br />1 x Lecteur de cartes m&eacute;moires : SD</div>\r\n<div>1 x Gigabit Ethernet (RJ45) 10/100/1000Mbps</div>\r\n<div>1 x Station d\'accueil / duplicateur de ports<br />1 x Microphone - entr&eacute;e / Audio - sortie de ligne / casque<br /><strong>Garantie&nbsp;</strong>: 3 Mois<br /><strong>Type de produit&nbsp;</strong>: Reconditionn&eacute;</div>', 1, NULL, NULL, 0, NULL, 0, '2024-07-27 08:04:21', '2024-07-27 08:04:21'),
(52, 'Charbon Organique', 3, 'single', 3, NULL, NULL, NULL, 91, NULL, NULL, 'exclusive', 1, NULL, 'CHARO', 'EAN13', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0, NULL, 0, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(56, 'couv', 3, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 1.0000, '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0, NULL, 0, '2024-08-12 18:16:42', '2024-08-12 18:16:42'),
(57, 'HALO', 3, 'single', 3, NULL, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, 1.0000, 'HL', 'C128', NULL, NULL, 0, '20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, 0, NULL, 0, '2024-08-13 06:11:56', '2024-08-13 06:11:56');

-- --------------------------------------------------------

--
-- Structure de la table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 4),
(34, 5),
(34, 6),
(34, 7),
(35, 5),
(35, 7),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 4),
(44, 5),
(44, 6),
(44, 7),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(53, 3),
(53, 5),
(53, 6),
(54, 3),
(55, 4),
(56, 5),
(57, 5);

-- --------------------------------------------------------

--
-- Structure de la table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) DEFAULT NULL,
  `row` varchar(191) DEFAULT NULL,
  `position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(2, NULL, 'DUMMY', 2, 1, '2024-07-15 12:54:00', '2024-07-15 12:54:00'),
(3, NULL, 'DUMMY', 3, 1, '2024-07-15 13:09:44', '2024-07-15 13:09:44'),
(4, NULL, 'DUMMY', 4, 1, '2024-07-15 13:16:05', '2024-07-15 13:16:05'),
(5, NULL, 'DUMMY', 5, 1, '2024-07-15 13:17:48', '2024-07-15 13:17:48'),
(6, NULL, 'DUMMY', 6, 1, '2024-07-15 13:20:25', '2024-07-15 13:20:25'),
(7, NULL, 'DUMMY', 7, 1, '2024-07-15 13:21:15', '2024-07-15 13:21:15'),
(8, NULL, 'DUMMY', 8, 1, '2024-07-15 13:22:22', '2024-07-15 13:22:22'),
(9, NULL, 'DUMMY', 9, 1, '2024-07-15 13:23:38', '2024-07-15 13:23:38'),
(10, NULL, 'DUMMY', 10, 1, '2024-07-15 13:24:30', '2024-07-15 13:24:30'),
(11, NULL, 'DUMMY', 11, 1, '2024-07-15 13:25:49', '2024-07-15 13:25:49'),
(12, NULL, 'DUMMY', 12, 1, '2024-07-15 13:32:33', '2024-07-15 13:32:33'),
(13, NULL, 'DUMMY', 13, 1, '2024-07-15 13:34:18', '2024-07-15 13:34:18'),
(14, NULL, 'DUMMY', 14, 1, '2024-07-16 05:44:45', '2024-07-16 05:44:45'),
(15, NULL, 'DUMMY', 15, 1, '2024-07-16 05:45:57', '2024-07-16 05:45:57'),
(16, NULL, 'DUMMY', 16, 1, '2024-07-16 05:48:04', '2024-07-16 05:48:04'),
(17, NULL, 'DUMMY', 17, 1, '2024-07-16 05:49:24', '2024-07-16 05:49:24'),
(18, NULL, 'DUMMY', 18, 1, '2024-07-16 05:51:14', '2024-07-16 05:51:14'),
(19, NULL, 'DUMMY', 19, 1, '2024-07-16 05:51:59', '2024-07-16 05:51:59'),
(20, NULL, 'DUMMY', 20, 1, '2024-07-16 05:52:51', '2024-07-16 05:52:51'),
(21, NULL, 'DUMMY', 21, 1, '2024-07-16 05:54:11', '2024-07-16 05:54:11'),
(22, NULL, 'DUMMY', 22, 1, '2024-07-16 05:55:47', '2024-07-16 05:55:47'),
(23, NULL, 'DUMMY', 23, 1, '2024-07-16 05:58:41', '2024-07-16 05:58:41'),
(24, NULL, 'DUMMY', 24, 1, '2024-07-16 05:59:34', '2024-07-16 05:59:34'),
(25, NULL, 'DUMMY', 25, 1, '2024-07-16 06:01:21', '2024-07-16 06:01:21'),
(26, NULL, 'DUMMY', 26, 1, '2024-07-16 10:31:46', '2024-07-16 10:31:46'),
(27, NULL, 'DUMMY', 27, 1, '2024-07-16 10:43:33', '2024-07-16 10:43:33'),
(28, NULL, 'DUMMY', 28, 1, '2024-07-16 10:56:36', '2024-07-16 10:56:36'),
(29, NULL, 'DUMMY', 29, 1, '2024-07-16 10:57:19', '2024-07-16 10:57:19'),
(30, NULL, 'DUMMY', 30, 1, '2024-07-16 10:58:33', '2024-07-16 10:58:33'),
(31, NULL, 'DUMMY', 31, 1, '2024-07-16 10:59:50', '2024-07-16 10:59:50'),
(32, NULL, 'DUMMY', 32, 1, '2024-07-16 11:00:47', '2024-07-16 11:00:47'),
(33, NULL, 'DUMMY', 33, 1, '2024-07-16 11:01:34', '2024-07-16 11:01:34'),
(34, NULL, 'DUMMY', 34, 1, '2024-07-16 13:32:23', '2024-07-16 13:32:23'),
(35, NULL, 'DUMMY', 35, 1, '2024-07-16 13:36:11', '2024-07-16 13:36:11'),
(36, NULL, 'DUMMY', 36, 1, '2024-07-17 05:47:15', '2024-07-17 05:47:15'),
(37, NULL, 'DUMMY', 37, 1, '2024-07-17 05:48:05', '2024-07-17 05:48:05'),
(38, NULL, 'DUMMY', 38, 1, '2024-07-17 06:26:55', '2024-07-17 06:26:55'),
(39, NULL, 'DUMMY', 39, 1, '2024-07-17 06:30:53', '2024-07-17 06:30:53'),
(40, NULL, 'DUMMY', 40, 1, '2024-07-17 06:45:12', '2024-07-17 06:45:12'),
(41, NULL, 'DUMMY', 41, 1, '2024-07-17 06:54:28', '2024-07-17 06:54:28'),
(42, NULL, 'DUMMY', 42, 1, '2024-07-17 07:52:02', '2024-07-17 07:52:02'),
(43, NULL, 'DUMMY', 43, 1, '2024-07-17 08:08:25', '2024-07-17 08:08:25'),
(44, NULL, 'DUMMY', 44, 1, '2024-07-17 09:44:51', '2024-07-17 09:44:51'),
(45, NULL, 'DUMMY', 45, 1, '2024-07-17 10:01:11', '2024-07-17 10:01:11'),
(46, NULL, 'DUMMY', 46, 1, '2024-07-17 10:52:19', '2024-07-17 10:52:19'),
(47, NULL, 'DUMMY', 47, 1, '2024-07-17 10:55:05', '2024-07-17 10:55:05'),
(48, NULL, 'DUMMY', 48, 1, '2024-07-17 11:47:43', '2024-07-17 11:47:43'),
(49, NULL, 'DUMMY', 49, 1, '2024-07-18 06:25:03', '2024-07-18 06:25:03'),
(50, NULL, 'DUMMY', 50, 1, '2024-07-18 08:37:06', '2024-07-18 08:37:06'),
(51, NULL, 'DUMMY', 51, 1, '2024-07-27 08:04:21', '2024-07-27 08:04:21'),
(52, NULL, 'DUMMY', 52, 1, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(56, NULL, 'DUMMY', 56, 1, '2024-08-12 18:16:42', '2024-08-12 18:16:42'),
(57, NULL, 'DUMMY', 57, 1, '2024-08-13 06:11:56', '2024-08-13 06:11:56');

-- --------------------------------------------------------

--
-- Structure de la table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `purchase_requisition_line_id` int(11) DEFAULT NULL,
  `purchase_order_line_id` int(11) DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `po_quantity_purchased` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `purchase_requisition_line_id`, `purchase_order_line_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `po_quantity_purchased`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(2, 11, 2, 2, 10.0000, 0.0000, 100000.0000, 0.00, 100000.0000, 100000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 12:58:41', '2024-07-15 12:58:41'),
(3, 12, 3, 3, 10.0000, 0.0000, 6500000.0000, 0.00, 6500000.0000, 6500000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:09:52', '2024-07-15 13:18:09'),
(4, 13, 4, 4, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:16:14', '2024-07-15 13:16:14'),
(5, 14, 5, 5, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:17:54', '2024-07-15 13:17:54'),
(6, 15, 6, 6, 10.0000, 0.0000, 85000.0000, 0.00, 85000.0000, 85000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:20:31', '2024-07-15 13:20:31'),
(7, 16, 7, 7, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:21:29', '2024-07-15 13:21:29'),
(8, 17, 8, 8, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:22:29', '2024-07-15 13:22:29'),
(9, 18, 9, 9, 10.0000, 0.0000, 155000.0000, 0.00, 155000.0000, 155000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:23:44', '2024-07-15 13:23:44'),
(10, 19, 10, 10, 10.0000, 0.0000, 120000.0000, 0.00, 120000.0000, 120000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:24:37', '2024-07-15 13:24:37'),
(11, 20, 11, 11, 10.0000, 0.0000, 130000.0000, 0.00, 130000.0000, 130000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:25:56', '2024-07-15 13:25:56'),
(12, 21, 12, 12, 10.0000, 0.0000, 145000.0000, 0.00, 145000.0000, 145000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:32:38', '2024-07-15 13:32:38'),
(13, 22, 13, 13, 10.0000, 0.0000, 120266.0000, 0.00, 120266.0000, 120266.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-15 13:34:25', '2024-07-15 13:34:25'),
(14, 23, 14, 14, 10.0000, 0.0000, 43539.0000, 0.00, 43539.0000, 43539.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:44:54', '2024-07-16 05:44:54'),
(15, 24, 15, 15, 10.0000, 0.0000, 3000.0000, 0.00, 3000.0000, 3000.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:46:02', '2024-09-05 08:04:22'),
(16, 25, 16, 16, 10.0000, 0.0000, 402495.0000, 0.00, 402495.0000, 402495.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:48:13', '2024-07-16 05:48:13'),
(17, 26, 17, 17, 10.0000, 0.0000, 35000.0000, 0.00, 35000.0000, 35000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:49:33', '2024-07-16 05:49:33'),
(18, 27, 18, 18, 10.0000, 0.0000, 85000.0000, 0.00, 85000.0000, 85000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:51:19', '2024-07-16 05:51:19'),
(19, 28, 19, 19, 10.0000, 0.0000, 85000.0000, 0.00, 85000.0000, 85000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:52:08', '2024-07-16 05:52:08'),
(20, 29, 20, 20, 10.0000, 0.0000, 95000.0000, 0.00, 95000.0000, 95000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:52:56', '2024-07-16 05:52:56'),
(21, 30, 21, 21, 10.0000, 0.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:54:16', '2024-07-16 05:54:16'),
(22, 31, 22, 22, 10.0000, 0.0000, 235000.0000, 0.00, 235000.0000, 235000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:55:52', '2024-07-16 05:55:52'),
(23, 32, 23, 23, 10.0000, 0.0000, 38000.0000, 0.00, 38000.0000, 38000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:58:48', '2024-07-16 05:58:48'),
(24, 33, 24, 24, 10.0000, 0.0000, 12500.0000, 0.00, 12500.0000, 12500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 05:59:41', '2024-07-16 05:59:41'),
(25, 34, 25, 25, 10.0000, 0.0000, 55000.0000, 0.00, 55000.0000, 55000.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 06:01:26', '2024-08-28 05:49:56'),
(26, 35, 26, 26, 10.0000, 0.0000, 1850000.0000, 0.00, 1850000.0000, 1850000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 10:31:53', '2024-07-16 10:31:53'),
(27, 36, 27, 27, 10.0000, 0.0000, 480000.0000, 0.00, 480000.0000, 480000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 10:43:39', '2024-07-16 10:43:39'),
(28, 37, 28, 28, 10.0000, 0.0000, 145000.0000, 0.00, 145000.0000, 145000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 10:56:42', '2024-07-16 10:56:42'),
(29, 38, 29, 29, 10.0000, 0.0000, 155000.0000, 0.00, 155000.0000, 155000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 10:57:25', '2024-07-16 10:57:25'),
(30, 39, 30, 30, 10.0000, 0.0000, 650000.0000, 0.00, 650000.0000, 650000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 10:58:41', '2024-07-16 10:58:41'),
(31, 40, 31, 31, 10.0000, 0.0000, 85000.0000, 0.00, 85000.0000, 85000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 11:00:04', '2024-07-16 11:00:04'),
(32, 41, 32, 32, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 11:00:52', '2024-07-16 11:00:52'),
(33, 42, 33, 33, 10.0000, 0.0000, 180000.0000, 0.00, 180000.0000, 180000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 11:01:42', '2024-07-16 11:01:42'),
(34, 43, 34, 34, 50.0000, 0.0000, 50000.0000, 0.00, 50000.0000, 50000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(35, 44, 34, 34, 20.0000, 0.0000, 50000.0000, 0.00, 50000.0000, 50000.0000, 0.0000, NULL, NULL, NULL, 3.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-17 10:44:04'),
(36, 45, 34, 34, 54.0000, 0.0000, 50000.0000, 0.00, 50000.0000, 50000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(37, 46, 34, 34, 60.0000, 0.0000, 50000.0000, 0.00, 50000.0000, 50000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(38, 47, 35, 35, 100.0000, 0.0000, 34000.0000, 0.00, 34000.0000, 34000.0000, 0.0000, NULL, NULL, NULL, 21.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:36:30', '2024-07-22 12:33:52'),
(39, 48, 35, 35, 49.0000, 0.0000, 34000.0000, 0.00, 34000.0000, 34000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-16 13:36:30', '2024-07-16 13:36:30'),
(40, 52, 36, 36, 10.0000, 0.0000, 195000.0000, 0.00, 195000.0000, 195000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 05:47:21', '2024-07-17 05:47:21'),
(41, 53, 37, 37, 10.0000, 0.0000, 420000.0000, 0.00, 420000.0000, 420000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 05:48:11', '2024-07-17 05:48:11'),
(42, 54, 38, 38, 10.0000, 0.0000, 95000.0000, 0.00, 95000.0000, 95000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 06:26:59', '2024-07-17 06:26:59'),
(43, 55, 39, 39, 10.0000, 0.0000, 270000.0000, 0.00, 270000.0000, 270000.0000, 0.0000, NULL, NULL, NULL, 2.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 06:30:59', '2024-08-28 05:49:56'),
(44, 56, 40, 40, 10.0000, 0.0000, 25000.0000, 0.00, 25000.0000, 25000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 06:45:19', '2024-07-17 06:45:19'),
(45, 57, 41, 41, 10.0000, 0.0000, 60000.0000, 0.00, 60000.0000, 60000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 06:54:34', '2024-07-17 06:54:34'),
(46, 59, 42, 42, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 07:52:09', '2024-07-17 07:52:09'),
(47, 60, 43, 43, 10.0000, 0.0000, 110000.0000, 0.00, 110000.0000, 110000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 08:08:31', '2024-07-17 08:08:31'),
(48, 61, 44, 44, 50.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(49, 62, 44, 44, 19.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 18.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-18 10:15:25'),
(50, 63, 44, 44, 67.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(51, 64, 44, 44, 25.0000, 0.0000, 1000.0000, 0.00, 1000.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(52, 65, 45, 45, 10.0000, 0.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 10:01:17', '2024-07-17 10:01:17'),
(53, 68, 46, 46, 10.0000, 0.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 10:52:42', '2024-07-17 10:52:42'),
(54, 69, 47, 47, 10.0000, 0.0000, 13500.0000, 0.00, 13500.0000, 13500.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 10:55:11', '2024-07-17 10:55:11'),
(55, 70, 48, 48, 10.0000, 0.0000, 22000.0000, 0.00, 22000.0000, 22000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-17 11:47:48', '2024-07-17 11:47:48'),
(56, 71, 49, 49, 10.0000, 0.0000, 35000.0000, 0.00, 35000.0000, 35000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-18 06:25:10', '2024-07-18 06:25:10'),
(57, 72, 50, 50, 10.0000, 0.0000, 55000.0000, 0.00, 55000.0000, 55000.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-18 08:37:11', '2024-07-18 08:37:11'),
(58, 78, 51, 51, 10.0000, 0.0000, 190000.0000, 0.00, 190000.0000, 190000.0000, 0.0000, NULL, NULL, NULL, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-07-27 08:04:27', '2024-07-27 08:09:22'),
(59, 82, 52, 52, 10.0000, 0.0000, 100.0000, 0.00, 100.0000, 100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(60, 83, 52, 52, 10.0000, 0.0000, 100.0000, 0.00, 100.0000, 100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(61, 84, 52, 52, 10.0000, 0.0000, 100.0000, 0.00, 100.0000, 100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(62, 85, 52, 52, 10.0000, 0.0000, 100.0000, 0.00, 100.0000, 100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(63, 86, 52, 52, 10.0000, 0.0000, 100.0000, 0.00, 100.0000, 100.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(64, 88, 56, 56, 1.0000, 0.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-12 18:16:53', '2024-08-12 18:16:53'),
(65, 89, 57, 57, 12.0000, 0.0000, 250.0000, 0.00, 250.0000, 250.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-13 06:11:56', '2024-08-13 06:11:56'),
(66, 90, 57, 57, 100.0000, 0.0000, 250.0000, 0.00, 250.0000, 250.0000, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2024-08-13 06:11:56', '2024-08-13 06:11:56');

-- --------------------------------------------------------

--
-- Structure de la table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 4, 1, '2024-07-11 15:30:05', '2024-07-27 08:08:00'),
(2, 'business_location', 1, 1, '2024-07-11 15:30:05', '2024-07-11 15:30:05'),
(3, 'sell_payment', 12, 1, '2024-07-11 15:18:42', '2024-09-05 08:04:22'),
(4, 'contacts', 1, 2, '2024-07-11 16:07:14', '2024-07-11 16:07:14'),
(5, 'business_location', 1, 2, '2024-07-11 16:07:15', '2024-07-11 16:07:15'),
(6, 'contacts', 8, 3, '2024-07-11 21:27:20', '2024-07-22 12:31:21'),
(7, 'business_location', 5, 3, '2024-07-11 21:27:20', '2024-07-16 13:19:23'),
(8, 'opening_balance', 3, 1, '2024-07-12 17:46:18', '2024-07-27 08:08:00'),
(9, 'job_sheet', 1, 1, '2024-07-15 08:29:07', '2024-07-15 08:29:07'),
(10, 'sell_payment', 14, 3, '2024-07-16 13:45:20', '2024-08-12 17:13:37'),
(11, 'draft', 3, 3, '2024-07-17 07:11:26', '2024-08-29 09:11:59'),
(12, 'sales_order', 2, 3, '2024-08-12 17:07:09', '2024-08-13 06:12:44'),
(13, 'purchase', 1, 3, '2024-08-12 18:16:53', '2024-08-12 18:16:53'),
(14, 'contacts', 1, 4, '2024-08-15 08:14:39', '2024-08-15 08:14:39'),
(15, 'business_location', 1, 4, '2024-08-15 08:14:39', '2024-08-15 08:14:39');

-- --------------------------------------------------------

--
-- Structure de la table `repair_device_models`
--

CREATE TABLE `repair_device_models` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `repair_checklist` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `repair_job_sheets`
--

CREATE TABLE `repair_job_sheets` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `job_sheet_no` varchar(191) NOT NULL,
  `service_type` enum('carry_in','pick_up','on_site') NOT NULL,
  `pick_up_on_site_addr` text DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `device_id` int(10) UNSIGNED DEFAULT NULL,
  `device_model_id` int(10) UNSIGNED DEFAULT NULL,
  `checklist` text DEFAULT NULL,
  `security_pwd` varchar(191) DEFAULT NULL,
  `security_pattern` varchar(191) DEFAULT NULL,
  `serial_no` varchar(191) NOT NULL,
  `status_id` int(11) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `product_configuration` text DEFAULT NULL,
  `defects` text DEFAULT NULL,
  `product_condition` text DEFAULT NULL,
  `service_staff` int(10) UNSIGNED DEFAULT NULL,
  `comment_by_ss` text DEFAULT NULL COMMENT 'comment made by technician',
  `estimated_cost` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `parts` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `custom_field_5` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `repair_job_sheets`
--

INSERT INTO `repair_job_sheets` (`id`, `business_id`, `location_id`, `contact_id`, `job_sheet_no`, `service_type`, `pick_up_on_site_addr`, `brand_id`, `device_id`, `device_model_id`, `checklist`, `security_pwd`, `security_pattern`, `serial_no`, `status_id`, `delivery_date`, `product_configuration`, `defects`, `product_condition`, `service_staff`, `comment_by_ss`, `estimated_cost`, `created_by`, `parts`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `custom_field_5`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024/0001', 'on_site', 'Avenue de l\'europe 22', 6, 89, NULL, NULL, NULL, NULL, 'A15-51M-7633', 0, NULL, NULL, NULL, NULL, 7, 'Ecran cassé', 1025.0000, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 08:29:07', '2024-07-15 08:29:07');

-- --------------------------------------------------------

--
-- Structure de la table `repair_statuses`
--

CREATE TABLE `repair_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `color` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `is_completed_status` tinyint(1) NOT NULL DEFAULT 0,
  `sms_template` text DEFAULT NULL,
  `email_subject` text DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `res_tables`
--

INSERT INTO `res_tables` (`id`, `business_id`, `location_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'LGC TABLES', NULL, 1, '2024-07-16 13:38:47', '2024-07-12 17:40:41', '2024-07-16 13:38:47');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_service_staff` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2024-07-11 15:30:05', '2024-07-11 15:30:05'),
(2, 'Caissier#1', 'web', 1, 0, 0, '2024-07-11 15:30:05', '2024-07-11 21:42:15'),
(3, 'Manager#1', 'web', 1, 0, 0, '2024-07-11 14:53:09', '2024-07-11 14:53:09'),
(6, 'Admin#3', 'web', 3, 1, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(7, 'Cashier#3', 'web', 3, 0, 0, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(8, 'Comptable#1', 'web', 1, 0, 0, '2024-07-11 21:41:51', '2024-07-11 21:41:51'),
(9, 'Employé#1', 'web', 1, 0, 0, '2024-07-11 21:42:33', '2024-07-11 21:42:33'),
(10, 'Manager#3', 'web', 3, 0, 0, '2024-07-12 11:51:49', '2024-07-12 11:51:49'),
(11, 'Support Technique#1', 'web', 1, 0, 1, '2024-07-12 13:55:44', '2024-07-12 14:03:53'),
(12, 'Gestionnaire de Point de Vente#3', 'web', 3, 0, 0, '2024-07-16 13:06:56', '2024-07-16 13:06:56');

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 11),
(2, 11),
(3, 11),
(5, 11),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(7, 11),
(8, 11),
(8, 12),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(18, 12),
(19, 11),
(20, 11),
(22, 11),
(25, 2),
(25, 7),
(25, 11),
(25, 12),
(26, 2),
(26, 7),
(26, 11),
(26, 12),
(27, 11),
(33, 11),
(34, 11),
(37, 11),
(37, 12),
(38, 11),
(38, 12),
(39, 11),
(40, 11),
(40, 12),
(41, 11),
(42, 11),
(45, 11),
(46, 11),
(47, 11),
(48, 2),
(48, 7),
(48, 11),
(48, 12),
(49, 2),
(49, 7),
(49, 11),
(49, 12),
(50, 2),
(50, 7),
(50, 11),
(50, 12),
(51, 2),
(51, 7),
(52, 11),
(53, 11),
(54, 11),
(55, 11),
(56, 11),
(57, 11),
(58, 11),
(58, 12),
(59, 11),
(60, 11),
(63, 11),
(64, 11),
(65, 11),
(67, 11),
(68, 11),
(69, 11),
(71, 11),
(72, 11),
(73, 11),
(75, 11),
(76, 11),
(77, 11),
(80, 7),
(81, 8),
(81, 9),
(81, 10),
(81, 11),
(81, 12),
(83, 11),
(84, 11),
(85, 11),
(86, 11),
(87, 11),
(88, 11),
(89, 11),
(90, 11),
(91, 11),
(92, 11),
(93, 11),
(94, 11),
(95, 11),
(96, 11),
(97, 11),
(98, 11),
(99, 11),
(102, 11),
(103, 11),
(104, 11),
(106, 11),
(107, 11),
(107, 12),
(108, 11),
(109, 11),
(113, 11),
(114, 11),
(115, 11),
(116, 11),
(119, 11),
(120, 11),
(121, 11),
(122, 11),
(123, 11),
(124, 11),
(125, 11),
(126, 11),
(127, 11),
(128, 11),
(129, 11),
(130, 11),
(131, 11),
(132, 11),
(133, 12);

-- --------------------------------------------------------

--
-- Structure de la table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `original_price` decimal(22,4) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `package_details` longtext NOT NULL,
  `created_id` int(10) UNSIGNED NOT NULL,
  `paid_via` varchar(191) DEFAULT NULL,
  `payment_transaction_id` varchar(191) DEFAULT NULL,
  `status` enum('approved','waiting','declined') NOT NULL DEFAULT 'waiting',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `business_id`, `package_id`, `start_date`, `trial_end_date`, `end_date`, `package_price`, `original_price`, `coupon_code`, `package_details`, `created_id`, `paid_via`, `payment_transaction_id`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2024-07-11', '2037-07-02', '2036-07-11', 0.0000, 0.0000, NULL, '{\"location_count\":\"0\",\"user_count\":\"0\",\"product_count\":\"0\",\"invoice_count\":\"0\",\"name\":\"Kwetu Enterprise\",\"productcatalogue_module\":\"1\",\"repair_module\":\"1\"}', 1, NULL, 'FREE', 'approved', NULL, '2024-07-11 14:35:15', '2024-07-16 20:19:35'),
(3, 3, 1, '2024-07-11', '2024-08-21', '2025-04-25', 20000.0000, 20000.0000, NULL, '{\"location_count\":\"5\",\"user_count\":\"10\",\"product_count\":\"100\",\"invoice_count\":\"1000\",\"name\":\"Kwetu Basic\"}', 1, 'offline', NULL, 'approved', NULL, '2024-07-11 21:39:35', '2024-08-12 16:31:55');

-- --------------------------------------------------------

--
-- Structure de la table `superadmin_communicator_logs`
--

CREATE TABLE `superadmin_communicator_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_ids` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `superadmin_communicator_logs`
--

INSERT INTO `superadmin_communicator_logs` (`id`, `business_ids`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, '[\"1\"]', 'test', '<p>test&nbsp;</p>', '2024-07-11 18:02:40', '2024-07-11 18:02:40');

-- --------------------------------------------------------

--
-- Structure de la table `superadmin_coupons`
--

CREATE TABLE `superadmin_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_code` varchar(191) NOT NULL,
  `discount_type` varchar(191) NOT NULL,
  `discount` decimal(8,2) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `applied_on_packages` varchar(191) DEFAULT NULL,
  `applied_on_business` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `superadmin_coupons`
--

INSERT INTO `superadmin_coupons` (`id`, `coupon_code`, `discount_type`, `discount`, `expiry_date`, `applied_on_packages`, `applied_on_business`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'LGC', 'fixed', 10.00, '2024-08-31', '[\"2\"]', '[\"1\"]', 1, '2024-07-11 18:27:46', '2024-07-11 18:27:46');

-- --------------------------------------------------------

--
-- Structure de la table `superadmin_frontend_pages`
--

CREATE TABLE `superadmin_frontend_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `content` longtext NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '6.2'),
(2, 'default_business_active_status', '1'),
(3, 'superadmin_version', '6.0'),
(4, 'app_currency_id', '25'),
(5, 'invoice_business_name', 'KwetuPOS'),
(6, 'invoice_business_landmark', 'Rond Point Songolo'),
(7, 'invoice_business_zip', '242'),
(8, 'invoice_business_state', 'Kouilou'),
(9, 'invoice_business_city', 'Pointe-Noire'),
(10, 'invoice_business_country', 'Congo/Brazzaville'),
(11, 'email', 'superadmin@kwetupos.com'),
(12, 'package_expiry_alert_days', '5'),
(13, 'enable_business_based_username', '0'),
(14, 'superadmin_register_tc', '<p><strong>&nbsp;Conditions d\'Inscription &agrave; KwetuPOS</strong></p>\r\n<p><strong>Bienvenue chez KwetuPOS ! </strong>Avant de proc&eacute;der &agrave; votre inscription et de commencer &agrave; utiliser notre syst&egrave;me de point de vente innovant, veuillez lire attentivement les conditions d\'inscription suivantes. En vous inscrivant, vous acceptez de vous conformer &agrave; ces conditions.</p>\r\n<p><strong>1. &Eacute;ligibilit&eacute; :</strong><br />&nbsp; &nbsp;<strong>- &Acirc;ge Minimum : </strong>Vous devez avoir au moins 18 ans pour vous inscrire et utiliser KwetuPOS.<br />&nbsp; &nbsp;<strong>- Conformit&eacute; L&eacute;gale : </strong>Vous devez vous assurer que l\'utilisation de KwetuPOS est conforme aux lois et r&eacute;glementations locales en vigueur dans votre pays ou r&eacute;gion.</p>\r\n<p><br />&nbsp; &nbsp;<strong>- D&eacute;di&eacute; aux Entreprises :</strong> KwetuPOS est sp&eacute;cialement con&ccedil;u pour les entreprises telles que les restaurants, bars, boutiques, et autres commerces. L\'inscription est r&eacute;serv&eacute;e aux entreprises l&eacute;galement enregistr&eacute;es.</p>\r\n<p><strong>2. Informations Fournies :</strong><br />&nbsp; &nbsp;<strong>- Exactitude des Informations : </strong>Vous devez fournir des informations exactes, compl&egrave;tes et &agrave; jour lors de l\'inscription. Toute fausse d&eacute;claration peut entra&icirc;ner la suspension ou la r&eacute;siliation de votre compte.<br />&nbsp; &nbsp;- Mise &agrave; Jour des Informations : Vous &ecirc;tes responsable de maintenir vos informations de compte &agrave; jour en cas de changement (adresse, coordonn&eacute;es, etc.).</p>\r\n<p>3. Utilisation du Compte :<br />&nbsp; &nbsp;- Responsabilit&eacute; : Vous &ecirc;tes responsable de toutes les activit&eacute;s effectu&eacute;es via votre compte KwetuPOS. Assurez-vous de garder votre identifiant et mot de passe confidentiels.<br />&nbsp; &nbsp;- Utilisation Autoris&eacute;e : Votre compte est destin&eacute; &agrave; un usage commercial l&eacute;gitime uniquement. Toute utilisation frauduleuse ou abusive peut entra&icirc;ner des sanctions.</p>\r\n<p><strong>4. S&eacute;curit&eacute; des Donn&eacute;es :</strong><br />&nbsp; &nbsp;- Protection des Donn&eacute;es : KwetuPOS met en &oelig;uvre des mesures de s&eacute;curit&eacute; pour prot&eacute;ger vos donn&eacute;es. Cependant, vous &ecirc;tes &eacute;galement responsable de la s&eacute;curit&eacute; de vos informations d\'acc&egrave;s.<br />&nbsp; &nbsp;- Confidentialit&eacute; : En utilisant KwetuPOS, vous acceptez notre politique de confidentialit&eacute;, qui d&eacute;taille comment nous collectons, utilisons et prot&eacute;geons vos donn&eacute;es.</p>\r\n<p><strong>5. Abonnement et Paiements :</strong><br />&nbsp; &nbsp;- <strong>Frais d\'Abonnement : </strong>Certains services de KwetuPOS peuvent &ecirc;tre payants. Les d&eacute;tails des frais et des options d\'abonnement seront fournis lors de l\'inscription.<br />&nbsp; &nbsp;- Modalit&eacute;s de Paiement : Les paiements doivent &ecirc;tre effectu&eacute;s conform&eacute;ment aux modalit&eacute;s sp&eacute;cifi&eacute;es. Tout d&eacute;faut de paiement peut entra&icirc;ner la suspension ou la r&eacute;siliation de votre acc&egrave;s aux services.</p>\r\n<p><strong>6. Support Client :</strong><br />&nbsp;<strong> &nbsp;- Assistance : </strong>KwetuPOS offre un service d\'assistance pour aider les utilisateurs en cas de probl&egrave;mes ou de questions. Les d&eacute;tails de contact et les horaires du support client sont disponibles sur notre site web.<br />&nbsp; &nbsp;<strong>- R&eacute;clamations : </strong>Toute r&eacute;clamation concernant les services de KwetuPOS doit &ecirc;tre adress&eacute;e au service client dans les plus brefs d&eacute;lais.</p>\r\n<p><strong>7. R&eacute;siliation :</strong><br />&nbsp; &nbsp;- Volontaire : Vous pouvez r&eacute;silier votre compte &agrave; tout moment en contactant notre support client.<br />&nbsp; &nbsp;- Non-Respect des Conditions : KwetuPOS se r&eacute;serve le droit de suspendre ou de r&eacute;silier votre compte en cas de non-respect des pr&eacute;sentes conditions d\'inscription ou de toute autre politique applicable.</p>\r\n<p><strong>8. Modifications des Conditions :</strong><br />&nbsp; &nbsp;- Mises &agrave; Jour : KwetuPOS peut modifier ces conditions d\'inscription de temps &agrave; autre. Vous serez inform&eacute; de toute modification importante. Votre utilisation continue des services apr&egrave;s de telles modifications constitue votre acceptation des nouvelles conditions.</p>\r\n<p>En vous inscrivant &agrave; KwetuPOS, vous reconnaissez avoir lu, compris et accept&eacute; ces conditions d\'inscription. Si vous avez des questions ou des pr&eacute;occupations, n\'h&eacute;sitez pas &agrave; nous contacter avant de finaliser votre inscription.</p>\r\n<p><strong>Contactez-nous :</strong><br /><strong>- Email : support@kwetupos.com</strong><br /><strong>- T&eacute;l&eacute;phone : +242 06 822 63 41</strong><br /><strong>- Adresse : Rond-Point Songolo - Route des Dalletes, Pointe-Noire, Congo-Brazzaville</strong></p>\r\n<p>Nous vous remercions de choisir KwetuPOS et nous nous r&eacute;jouissons de vous aider &agrave; optimiser la gestion de votre entreprise.</p>'),
(15, 'welcome_email_subject', 'Bienvenue chez KwetuPOS !'),
(16, 'welcome_email_body', '<h1>Bienvenue chez KwetuPOS</h1>\r\n<p>Bonjour {business_name},<br /><br />Nous sommes ravis de vous accueillir dans la famille <strong>KwetuPOS !</strong><br /><br />Votre inscription est confirm&eacute;e et vous &ecirc;tes maintenant pr&ecirc;t &agrave; d&eacute;couvrir toutes les fonctionnalit&eacute;s innovantes que notre syst&egrave;me de point de vente a &agrave; offrir. KwetuPOS est con&ccedil;u pour simplifier et optimiser la gestion de votre entreprise, qu\'il s\'agisse d\'un restaurant, d\'un bar, d\'une boutique ou de tout autre commerce.</p>\r\n<h2>Voici quelques &eacute;tapes pour bien d&eacute;marrer :</h2>\r\n<h3>Connexion &agrave; votre Compte</h3>\r\n<p>Rendez-vous sur notre site web &agrave; kwetupos.com.<br />Connectez-vous avec les informations d\'identification que vous avez fournies lors de l\'inscription.</p>\r\n<h3>Configuration Initiale</h3>\r\n<p>Suivez notre guide de d&eacute;marrage pour configurer votre profil, ajouter vos produits/services et d&eacute;finir vos pr&eacute;f&eacute;rences.<br />Vous pouvez acc&eacute;der au guide de d&eacute;marrage ici : kwetupos.com.</p>\r\n<h3>Formation et Support</h3>\r\n<p>Notre &eacute;quipe est l&agrave; pour vous aider &agrave; chaque &eacute;tape. Consultez notre centre d\'aide pour des tutoriels vid&eacute;o et des FAQ : kwetupos.com<br />Si vous avez des questions ou avez besoin d\'assistance, n\'h&eacute;sitez pas &agrave; nous contacter &agrave; support@kwetupos.com ou appelez-nous au +242 06 822 63 41.</p>\r\n<h2>Quelques fonctionnalit&eacute;s cl&eacute;s de KwetuPOS :</h2>\r\n<ul>\r\n<li>Interface Utilisateur Intuitive : Une interface facile &agrave; utiliser, m&ecirc;me pour les d&eacute;butants.</li>\r\n<li>Gestion de Stock : Suivi en temps r&eacute;el de vos stocks avec des alertes automatiques.</li>\r\n<li>Rapports et Analyses : Des rapports d&eacute;taill&eacute;s pour vous aider &agrave; prendre des d&eacute;cisions &eacute;clair&eacute;es.</li>\r\n<li>S&eacute;curit&eacute; : Des mesures de s&eacute;curit&eacute; avanc&eacute;es pour prot&eacute;ger vos donn&eacute;es et celles de vos clients.</li>\r\n</ul>\r\n<h2>Restez Connect&eacute; :</h2>\r\n<p>Suivez-nous sur les r&eacute;seaux sociaux pour les derni&egrave;res mises &agrave; jour, conseils et astuces :kwetupos.com.</p>\r\n<p>Nous sommes impatients de vous voir tirer le meilleur parti de KwetuPOS et de vous accompagner dans la croissance de votre entreprise. Merci de nous avoir choisis !</p>\r\n<p>Cordialement,<br /><br />L\'&eacute;quipe KwetuPOS</p>\r\n<p><strong>KwetuPOS<br />Rond-Point Songolo - Route des Dalletes<br />Pointe-Noire, Congo-Brazzaville<br />support@kwetupos.com<br />+242 06 822 63 41</strong></p>\r\n<p><br /><br /></p>'),
(17, 'additional_js', NULL),
(18, 'additional_css', NULL),
(19, 'offline_payment_details', 'KwetuPOS\r\nRond-Point Songolo - Route des Dalletes\r\nPointe-Noire, Congo-Brazzaville\r\nsupport@kwetupos.com\r\n+242 06 822 63 41'),
(20, 'superadmin_enable_register_tc', '1'),
(21, 'allow_email_settings_to_businesses', '1'),
(22, 'enable_new_business_registration_notification', '0'),
(23, 'enable_new_subscription_notification', '0'),
(24, 'enable_welcome_email', '1'),
(25, 'enable_offline_payment', '1'),
(26, 'repair_version', '3.1'),
(27, 'productcatalogue_version', '1.0');

-- --------------------------------------------------------

--
-- Structure de la table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `for_tax_group` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `is_kitchen_order` tinyint(1) NOT NULL DEFAULT 0,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `sub_type` varchar(20) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `sub_status` varchar(191) DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT 0,
  `payment_status` enum('paid','due','partial') DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) DEFAULT NULL,
  `ref_no` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subscription_no` varchar(191) DEFAULT NULL,
  `subscription_repeat_on` varchar(191) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `discount_type` enum('fixed','percentage') DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT 0.0000,
  `rp_redeemed` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `shipping_status` varchar(191) DEFAULT NULL,
  `delivered_to` varchar(191) DEFAULT NULL,
  `delivery_person` bigint(20) DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `shipping_custom_field_1` varchar(191) DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) DEFAULT NULL,
  `additional_notes` text DEFAULT NULL,
  `staff_note` text DEFAULT NULL,
  `is_export` tinyint(1) NOT NULL DEFAULT 0,
  `export_custom_fields_info` longtext DEFAULT NULL,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT 0.0000 COMMENT 'Difference of rounded total and actual total',
  `additional_expense_key_1` varchar(191) DEFAULT NULL,
  `additional_expense_value_1` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_2` varchar(191) DEFAULT NULL,
  `additional_expense_value_2` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_3` varchar(191) DEFAULT NULL,
  `additional_expense_value_3` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `additional_expense_key_4` varchar(191) DEFAULT NULL,
  `additional_expense_value_4` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `final_total` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_sub_category_id` int(11) DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0,
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT 1.000,
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `repair_completed_on` datetime DEFAULT NULL,
  `repair_warranty_id` int(11) DEFAULT NULL,
  `repair_brand_id` int(11) DEFAULT NULL,
  `repair_status_id` int(11) DEFAULT NULL,
  `repair_model_id` int(11) DEFAULT NULL,
  `repair_job_sheet_id` int(10) UNSIGNED DEFAULT NULL,
  `repair_defects` text DEFAULT NULL,
  `repair_serial_no` varchar(191) DEFAULT NULL,
  `repair_checklist` text DEFAULT NULL,
  `repair_security_pwd` varchar(191) DEFAULT NULL,
  `repair_security_pattern` varchar(191) DEFAULT NULL,
  `repair_due_date` datetime DEFAULT NULL,
  `repair_device_id` int(11) DEFAULT NULL,
  `repair_updates_notif` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_requisition_ids` text DEFAULT NULL,
  `prefer_payment_method` varchar(191) DEFAULT NULL,
  `prefer_payment_account` int(11) DEFAULT NULL,
  `sales_order_ids` text DEFAULT NULL,
  `purchase_order_ids` text DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `service_custom_field_1` text DEFAULT NULL,
  `service_custom_field_2` text DEFAULT NULL,
  `service_custom_field_3` text DEFAULT NULL,
  `service_custom_field_4` text DEFAULT NULL,
  `service_custom_field_5` text DEFAULT NULL,
  `service_custom_field_6` text DEFAULT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT 0,
  `rp_earned` int(11) NOT NULL DEFAULT 0 COMMENT 'rp is the short form of reward points',
  `order_addresses` text DEFAULT NULL,
  `is_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `repair_completed_on`, `repair_warranty_id`, `repair_brand_id`, `repair_status_id`, `repair_model_id`, `repair_job_sheet_id`, `repair_defects`, `repair_serial_no`, `repair_checklist`, `repair_security_pwd`, `repair_security_pattern`, `repair_due_date`, `repair_device_id`, `repair_updates_notif`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 17:18:15', 10000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 15:18:15', '2024-07-11 15:18:15'),
(6, 1, 1, 0, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 4, NULL, NULL, '2024/0001', NULL, NULL, NULL, '2024-07-12 19:46:18', 50000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 50000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-12 17:46:18', '2024-07-12 17:46:18'),
(8, 1, 1, 0, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 5, NULL, NULL, '2024/0002', NULL, NULL, NULL, '2024-07-15 13:37:25', 30000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 30000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 11:37:25', '2024-07-15 11:37:25'),
(11, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 14:56:00', 100000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 12:58:41', '2024-07-15 12:58:41'),
(12, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:09:00', 65000000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 65000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:09:52', '2024-07-15 13:18:09'),
(13, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:16:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 4, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:16:14', '2024-07-15 13:16:14'),
(14, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:17:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 5, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:17:54', '2024-07-15 13:17:54'),
(15, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:20:00', 85000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 6, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:20:31', '2024-07-15 13:20:31'),
(16, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:21:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:21:29', '2024-07-15 13:21:29'),
(17, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:22:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 8, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:22:29', '2024-07-15 13:22:29'),
(18, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:23:00', 155000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1550000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 9, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:23:44', '2024-07-15 13:23:44'),
(19, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:24:00', 120000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 10, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:24:37', '2024-07-15 13:24:37'),
(20, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:25:00', 130000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1300000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 11, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:25:56', '2024-07-15 13:25:56'),
(21, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:32:38', 145000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1450000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 12, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:32:38', '2024-07-15 13:32:38'),
(22, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 15:34:00', 120266.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1202660.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 13, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-15 13:34:25', '2024-07-15 13:34:25'),
(23, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:44:00', 43539.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 435390.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 14, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:44:54', '2024-07-16 05:44:54'),
(24, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:46:00', 3000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 30000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 15, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:46:02', '2024-07-16 05:46:02'),
(25, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:48:00', 402495.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4024950.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 16, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:48:13', '2024-07-16 05:48:13'),
(26, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:49:00', 35000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 350000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 17, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:49:33', '2024-07-16 05:49:33'),
(27, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:51:00', 85000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 18, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:51:19', '2024-07-16 05:51:19'),
(28, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:52:00', 85000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 19, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:52:08', '2024-07-16 05:52:08'),
(29, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:52:00', 95000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 950000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 20, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:52:56', '2024-07-16 05:52:56'),
(30, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:54:00', 15000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 150000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 21, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:54:16', '2024-07-16 05:54:16'),
(31, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:55:00', 235000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2350000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 22, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:55:52', '2024-07-16 05:55:52'),
(32, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:58:00', 38000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 380000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 23, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:58:48', '2024-07-16 05:58:48'),
(33, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 07:59:00', 12500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 125000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 24, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 05:59:41', '2024-07-16 05:59:41'),
(34, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 08:01:00', 55000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 550000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 25, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 06:01:26', '2024-07-16 06:01:26'),
(35, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:31:00', 1850000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 18500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 26, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:31:53', '2024-07-16 10:31:53'),
(36, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:43:00', 480000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 27, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:43:39', '2024-07-16 10:43:39'),
(37, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:56:00', 145000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1450000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 28, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:56:42', '2024-07-16 10:56:42'),
(38, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:57:00', 155000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1550000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 29, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:57:24', '2024-07-16 10:57:24'),
(39, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:58:00', 650000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 6500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 30, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 10:58:41', '2024-07-16 10:58:41'),
(40, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 12:59:00', 85000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 850000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 31, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 11:00:04', '2024-07-16 11:00:04'),
(41, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:00:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 32, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 11:00:52', '2024-07-16 11:00:52'),
(42, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:01:00', 180000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1800000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 33, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 11:01:42', '2024-07-16 11:01:42'),
(43, 3, 4, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:34:18', 50000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2500000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(44, 3, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:34:18', 50000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(45, 3, 6, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:34:18', 50000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2700000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(46, 3, 7, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:34:18', 50000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 34, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(47, 3, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:36:30', 34000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3400000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 35, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:36:30', '2024-07-16 13:36:30'),
(48, 3, 7, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 15:36:30', 34000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1666000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 35, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 13:36:30', '2024-07-16 13:36:30'),
(49, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 3, NULL, '0001', '', NULL, NULL, NULL, '2024-07-16 15:45:20', 85000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 85000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-16 13:45:20', '2024-07-16 13:45:21'),
(50, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 3, NULL, '0002', '', NULL, NULL, NULL, '2024-07-16 15:45:52', 125000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 125000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(51, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 6, NULL, '0003', '', NULL, NULL, NULL, '2024-07-16 15:47:46', 42500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(52, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 07:47:00', 195000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1950000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 36, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 05:47:21', '2024-07-17 05:47:21'),
(53, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 07:48:00', 420000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4200000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 37, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 05:48:11', '2024-07-17 05:48:11'),
(54, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 08:26:00', 95000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 950000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 38, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 06:26:59', '2024-07-17 06:26:59'),
(55, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 08:30:00', 270000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 2700000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 39, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 06:30:59', '2024-07-17 06:30:59'),
(56, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 08:45:00', 25000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 250000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 40, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 06:45:19', '2024-07-17 06:45:19'),
(57, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 08:54:00', 60000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 600000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 41, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 06:54:34', '2024-07-17 06:54:34'),
(58, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 6, NULL, '2024/0001', '', NULL, NULL, NULL, '2024-07-17 09:11:26', 62500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 62500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-17 07:11:26', '2024-07-17 07:11:26'),
(59, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:52:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 42, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 07:52:09', '2024-07-17 07:52:09'),
(60, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:08:00', 110000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1100000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 43, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 08:08:31', '2024-07-17 08:08:31'),
(61, 3, 4, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 11:46:18', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 50000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(62, 3, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 11:46:18', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 19000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(63, 3, 6, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 11:46:18', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 67000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(64, 3, 7, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 11:46:18', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 44, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(65, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:01:00', 65000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 650000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 45, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:01:17', '2024-07-17 10:01:17'),
(66, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 8, NULL, '0004', '', NULL, NULL, NULL, '2024-07-17 12:42:18', 43750.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, '50 Rue Mouleke', NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 43750.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-17 10:42:18', '2024-07-17 10:45:20'),
(67, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 8, NULL, '0005', '', NULL, NULL, NULL, '2024-07-17 12:44:04', 106250.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, '50 Rue Mouleke', NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 106250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(68, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:52:00', 15000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 150000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 46, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:52:42', '2024-07-17 10:52:42'),
(69, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:55:00', 13500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 135000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 47, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 10:55:11', '2024-07-17 10:55:11');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `is_kitchen_order`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `source`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `delivery_date`, `shipping_status`, `delivered_to`, `delivery_person`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `is_export`, `export_custom_fields_info`, `round_off_amount`, `additional_expense_key_1`, `additional_expense_value_1`, `additional_expense_key_2`, `additional_expense_value_2`, `additional_expense_key_3`, `additional_expense_value_3`, `additional_expense_key_4`, `additional_expense_value_4`, `final_total`, `expense_category_id`, `expense_sub_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `repair_completed_on`, `repair_warranty_id`, `repair_brand_id`, `repair_status_id`, `repair_model_id`, `repair_job_sheet_id`, `repair_defects`, `repair_serial_no`, `repair_checklist`, `repair_security_pwd`, `repair_security_pattern`, `repair_due_date`, `repair_device_id`, `repair_updates_notif`, `purchase_requisition_ids`, `prefer_payment_method`, `prefer_payment_account`, `sales_order_ids`, `purchase_order_ids`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `service_custom_field_5`, `service_custom_field_6`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(70, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 13:47:00', 22000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 220000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 48, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 11:47:48', '2024-07-17 11:47:48'),
(71, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 08:25:00', 35000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 350000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 49, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 06:25:10', '2024-07-18 06:25:10'),
(72, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 10:37:00', 55000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 550000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 50, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 08:37:11', '2024-07-18 08:37:11'),
(73, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 8, NULL, '0006', '', NULL, NULL, NULL, '2024-07-18 12:05:27', 425000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, '50 Rue Mouleke', NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 425000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(74, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, '0007', '', NULL, NULL, NULL, '2024-07-18 12:15:25', 105000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 105000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(75, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 10, NULL, '0008', '', NULL, NULL, NULL, '2024-07-18 13:37:28', 42500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(76, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 10, NULL, '0009', '', NULL, NULL, NULL, '2024-07-18 13:56:50', 42500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 42500.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(77, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 12, NULL, '0010', '', NULL, NULL, NULL, '2024-07-22 14:33:52', 85000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 85000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(78, 1, 1, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 10:04:27', 190000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1900000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 51, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 08:04:27', '2024-07-27 08:04:27'),
(79, 1, 1, 0, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 13, NULL, NULL, '2024/0003', NULL, NULL, NULL, '2024-07-27 10:08:00', 70000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 70000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 08:08:00', '2024-07-27 08:08:00'),
(80, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'partial', NULL, 13, 5, '2024-0008', '', NULL, NULL, NULL, '2024-07-27 10:09:22', 190000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 190000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 3, 'months', 0, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(82, 3, 3, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:42', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(83, 3, 4, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:42', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(84, 3, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:42', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(85, 3, 6, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:42', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(86, 3, 7, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 19:06:42', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(87, 3, 3, 0, NULL, NULL, NULL, 'sales_order', NULL, 'ordered', NULL, 0, NULL, NULL, 6, NULL, '2024/0001', '', NULL, NULL, NULL, '2024-08-12 19:00:00', 125.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, 'Livraison Express', NULL, NULL, 'shipped', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 125.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, NULL, 0, NULL, NULL, 'c6092af76de6fe4c99629246655bcb0e', NULL, NULL, NULL, '2024-08-12 17:07:09', '2024-08-12 17:15:57'),
(88, 3, 5, 0, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'paid', NULL, 7, NULL, NULL, 'PO2024/0001', NULL, NULL, NULL, '2024-08-12 20:08:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 18:16:53', '2024-08-12 18:16:53'),
(89, 3, 3, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 08:11:56', 3000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 3000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 06:11:56', '2024-08-13 06:11:56'),
(90, 3, 5, 0, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-01 08:11:56', 25000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 25000.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 57, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 06:11:56', '2024-08-13 06:11:56'),
(91, 3, 3, 0, NULL, NULL, NULL, 'sales_order', NULL, 'ordered', NULL, 0, NULL, NULL, 6, NULL, '2024/0002', '', NULL, NULL, NULL, '2024-08-13 08:09:00', 500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 500.0000, NULL, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-13 06:12:44', '2024-08-13 06:12:44'),
(92, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2024-0009', '', NULL, NULL, NULL, '2024-08-28 07:49:19', 471250.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 471250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(93, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, '2024-0010', '', NULL, NULL, NULL, '2024-08-28 07:49:55', 471250.0000, NULL, 0.0000, 'percentage', 5.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 447688.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-08-28 05:49:55', '2024-08-28 05:49:56'),
(94, 3, 5, 0, NULL, NULL, NULL, 'sell', NULL, 'draft', NULL, 0, NULL, NULL, 6, NULL, '2024/0003', '', NULL, NULL, NULL, '2024-08-29 11:09:00', 1250.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 1250.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2024-08-29 09:11:59', '2024-08-29 09:11:59'),
(95, 1, 1, 0, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 5, 2, '2024-0011', '', NULL, NULL, NULL, '2024-09-05 10:04:22', 4350.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, NULL, 0.0000, 4350.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, 1, 'months', 0, '2024-09-05 08:04:22', '2024-09-05 08:04:22');

-- --------------------------------------------------------

--
-- Structure de la table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `method` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) DEFAULT NULL,
  `transaction_no` varchar(191) DEFAULT NULL,
  `card_transaction_number` varchar(191) DEFAULT NULL,
  `card_number` varchar(191) DEFAULT NULL,
  `card_type` varchar(191) DEFAULT NULL,
  `card_holder_name` varchar(191) DEFAULT NULL,
  `card_month` varchar(191) DEFAULT NULL,
  `card_year` varchar(191) DEFAULT NULL,
  `card_security` varchar(5) DEFAULT NULL,
  `cheque_number` varchar(191) DEFAULT NULL,
  `bank_account_number` varchar(191) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `paid_through_link` tinyint(1) NOT NULL DEFAULT 0,
  `gateway` varchar(191) DEFAULT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT 0,
  `payment_for` int(11) DEFAULT NULL COMMENT 'stores the contact id',
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) DEFAULT NULL,
  `document` varchar(191) DEFAULT NULL,
  `payment_ref_no` varchar(191) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `payment_type`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `paid_through_link`, `gateway`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(8, 49, 3, 0, 85000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:45:20', 9, 0, NULL, 0, 3, NULL, NULL, NULL, 'SP2024/0001', NULL, '2024-07-16 13:45:20', '2024-07-16 13:45:20'),
(9, 50, 3, 0, 125000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:45:52', 9, 0, NULL, 0, 3, NULL, NULL, NULL, 'SP2024/0002', NULL, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(10, 51, 3, 0, 42500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-16 15:47:46', 9, 0, NULL, 0, 6, NULL, NULL, NULL, 'SP2024/0003', NULL, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(11, 66, 3, 0, 30000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:42:18', 9, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2024/0004', NULL, '2024-07-17 10:42:18', '2024-07-17 10:42:18'),
(12, 67, 3, 0, 106250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:44:04', 9, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2024/0005', NULL, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(13, 66, 3, 0, 13750.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 12:45:00', 9, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2024/0006', NULL, '2024-07-17 10:45:20', '2024-07-17 10:45:20'),
(14, 73, 3, 0, 425000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 12:05:27', 9, 0, NULL, 0, 8, NULL, NULL, NULL, 'SP2024/0007', NULL, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(15, 74, 3, 0, 105000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 12:15:25', 9, 0, NULL, 0, 9, NULL, NULL, NULL, 'SP2024/0008', NULL, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(16, 75, 3, 0, 42500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 13:37:28', 9, 0, NULL, 0, 10, NULL, NULL, NULL, 'SP2024/0009', NULL, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(17, 76, 3, 0, 22000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 13:56:50', 9, 0, NULL, 0, 10, NULL, NULL, NULL, 'SP2024/0010', NULL, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(18, 76, 3, 0, 20500.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-18 13:56:50', 9, 0, NULL, 0, 10, NULL, NULL, NULL, 'SP2024/0011', NULL, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(19, 77, 3, 0, 40000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 14:33:52', 9, 0, NULL, 0, 12, NULL, NULL, NULL, 'SP2024/0012', NULL, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(20, 77, 3, 0, 45000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-22 14:33:52', 9, 0, NULL, 0, 12, NULL, NULL, NULL, 'SP2024/0013', NULL, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(21, 80, 1, 0, 70000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-27 10:09:22', 1, 0, NULL, 0, 13, NULL, NULL, NULL, 'SP2024/0008', NULL, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(22, 87, 3, 0, 125.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-12 19:12:00', 5, 0, NULL, 0, 6, NULL, NULL, NULL, 'SP2024/0014', NULL, '2024-08-12 17:13:37', '2024-08-12 17:13:37'),
(23, 92, 1, 0, 471250.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 07:49:19', 12, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0009', NULL, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(24, 93, 1, 0, 447688.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-28 07:49:55', 12, 0, NULL, 0, 1, NULL, NULL, NULL, 'SP2024/0010', NULL, '2024-08-28 05:49:55', '2024-08-28 05:49:55'),
(25, 95, 1, 0, 2000.0000, 'cash', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 10:04:22', 2, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2024/0011', NULL, '2024-09-05 08:04:22', '2024-09-05 08:04:22'),
(26, 95, 1, 0, 2350.0000, 'card', NULL, NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-05 10:04:22', 2, 0, NULL, 0, 5, NULL, NULL, NULL, 'SP2024/0012', NULL, '2024-09-05 08:04:22', '2024-09-05 08:04:22');

-- --------------------------------------------------------

--
-- Structure de la table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `secondary_unit_quantity` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT 0.0000,
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text DEFAULT NULL,
  `so_line_id` int(11) DEFAULT NULL,
  `so_quantity_invoiced` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `secondary_unit_quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `so_line_id`, `so_quantity_invoiced`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(8, 49, 35, 35, 2.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-16 13:45:20', '2024-07-16 13:45:20'),
(9, 50, 34, 34, 2.0000, 0.0000, 0.0000, 62500.0000, 62500.0000, 'fixed', 0.0000, 62500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(10, 51, 35, 35, 1.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(11, 58, 34, 34, 1.0000, 0.0000, 0.0000, 62500.0000, 62500.0000, 'fixed', 0.0000, 62500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 07:11:26', '2024-07-17 07:11:26'),
(12, 66, 35, 35, 1.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 10:42:18', '2024-07-17 10:42:18'),
(13, 66, 44, 44, 1.0000, 0.0000, 0.0000, 1250.0000, 1250.0000, 'fixed', 0.0000, 1250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 10:42:18', '2024-07-17 10:42:18'),
(14, 67, 34, 34, 1.0000, 0.0000, 0.0000, 62500.0000, 62500.0000, 'fixed', 0.0000, 62500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(15, 67, 44, 44, 1.0000, 0.0000, 0.0000, 1250.0000, 1250.0000, 'fixed', 0.0000, 1250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(16, 67, 35, 35, 1.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(17, 73, 35, 35, 10.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(18, 74, 35, 35, 2.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(19, 74, 44, 44, 16.0000, 0.0000, 0.0000, 1250.0000, 1250.0000, 'fixed', 0.0000, 1250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(20, 75, 35, 35, 1.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(21, 76, 35, 35, 1.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(22, 77, 35, 35, 2.0000, 0.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(23, 80, 51, 51, 1.0000, 0.0000, 0.0000, 190000.0000, 190000.0000, 'fixed', 0.0000, 190000.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(25, 87, 52, 52, 1.0000, 0.0000, 0.0000, 125.0000, 125.0000, 'fixed', 0.0000, 125.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-12 17:07:09', '2024-08-12 17:13:37'),
(26, 91, 57, 57, 2.0000, 0.0000, 0.0000, 250.0000, 250.0000, 'fixed', 0.0000, 250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-13 06:12:44', '2024-08-13 06:12:44'),
(27, 92, 25, 25, 1.0000, 0.0000, 0.0000, 79750.0000, 79750.0000, 'fixed', 0.0000, 79750.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(28, 92, 39, 39, 1.0000, 0.0000, 0.0000, 391500.0000, 391500.0000, 'fixed', 0.0000, 391500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(29, 93, 39, 39, 1.0000, 0.0000, 0.0000, 391500.0000, 391500.0000, 'fixed', 0.0000, 391500.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-28 05:49:55', '2024-08-28 05:49:55'),
(30, 93, 25, 25, 1.0000, 0.0000, 0.0000, 79750.0000, 79750.0000, 'fixed', 0.0000, 79750.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-28 05:49:55', '2024-08-28 05:49:55'),
(31, 94, 44, 44, 1.0000, 0.0000, 0.0000, 1250.0000, 1250.0000, 'fixed', 0.0000, 1250.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-08-29 09:11:59', '2024-08-29 09:11:59'),
(32, 95, 15, 15, 1.0000, 0.0000, 0.0000, 4350.0000, 4350.0000, 'fixed', 0.0000, 4350.0000, 0.0000, NULL, NULL, NULL, '', NULL, 0.0000, NULL, NULL, NULL, '', NULL, '2024-09-05 08:04:22', '2024-09-05 08:04:22');

-- --------------------------------------------------------

--
-- Structure de la table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(8, 8, NULL, 38, 2.0000, 0.0000, '2024-07-16 13:45:21', '2024-07-16 13:45:21'),
(9, 9, NULL, 35, 2.0000, 0.0000, '2024-07-16 13:45:52', '2024-07-16 13:45:52'),
(10, 10, NULL, 38, 1.0000, 0.0000, '2024-07-16 13:47:46', '2024-07-16 13:47:46'),
(11, 12, NULL, 38, 1.0000, 0.0000, '2024-07-17 10:42:19', '2024-07-17 10:42:19'),
(12, 13, NULL, 49, 1.0000, 0.0000, '2024-07-17 10:42:19', '2024-07-17 10:42:19'),
(13, 14, NULL, 35, 1.0000, 0.0000, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(14, 15, NULL, 49, 1.0000, 0.0000, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(15, 16, NULL, 38, 1.0000, 0.0000, '2024-07-17 10:44:04', '2024-07-17 10:44:04'),
(16, 17, NULL, 38, 10.0000, 0.0000, '2024-07-18 10:05:27', '2024-07-18 10:05:27'),
(17, 18, NULL, 38, 2.0000, 0.0000, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(18, 19, NULL, 49, 16.0000, 0.0000, '2024-07-18 10:15:25', '2024-07-18 10:15:25'),
(19, 20, NULL, 38, 1.0000, 0.0000, '2024-07-18 11:37:28', '2024-07-18 11:37:28'),
(20, 21, NULL, 38, 1.0000, 0.0000, '2024-07-18 11:56:50', '2024-07-18 11:56:50'),
(21, 22, NULL, 38, 2.0000, 0.0000, '2024-07-22 12:33:52', '2024-07-22 12:33:52'),
(22, 23, NULL, 58, 1.0000, 0.0000, '2024-07-27 08:09:22', '2024-07-27 08:09:22'),
(23, 27, NULL, 25, 1.0000, 0.0000, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(24, 28, NULL, 43, 1.0000, 0.0000, '2024-08-28 05:49:19', '2024-08-28 05:49:19'),
(25, 29, NULL, 43, 1.0000, 0.0000, '2024-08-28 05:49:56', '2024-08-28 05:49:56'),
(26, 30, NULL, 25, 1.0000, 0.0000, '2024-08-28 05:49:56', '2024-08-28 05:49:56'),
(27, 32, NULL, 15, 1.0000, 0.0000, '2024-09-05 08:04:22', '2024-09-05 08:04:22');

-- --------------------------------------------------------

--
-- Structure de la table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `location_price_group` text DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) NOT NULL,
  `short_name` varchar(191) NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2024-07-11 15:30:05', '2024-07-11 15:30:05'),
(3, 3, 'Pieces', 'Pc(s)', 0, NULL, NULL, 5, NULL, '2024-07-11 21:27:20', '2024-07-11 21:27:20');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) NOT NULL DEFAULT 'user',
  `surname` char(10) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `username` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT 'en',
  `contact_no` char(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `available_at` datetime DEFAULT NULL COMMENT 'Service staff avilable at. Calculated from product preparation_time_in_minutes',
  `paused_at` datetime DEFAULT NULL COMMENT 'Service staff available time paused at, Will be nulled on resume.',
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT 1,
  `status` enum('active','inactive','terminated') NOT NULL DEFAULT 'active',
  `is_enable_service_staff_pin` tinyint(1) NOT NULL DEFAULT 0,
  `service_staff_pin` text DEFAULT NULL,
  `crm_contact_id` int(10) UNSIGNED DEFAULT NULL,
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT 0,
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT 0.00,
  `selected_contacts` tinyint(1) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') DEFAULT NULL,
  `blood_group` char(10) DEFAULT NULL,
  `contact_number` char(20) DEFAULT NULL,
  `alt_number` varchar(191) DEFAULT NULL,
  `family_number` varchar(191) DEFAULT NULL,
  `fb_link` varchar(191) DEFAULT NULL,
  `twitter_link` varchar(191) DEFAULT NULL,
  `social_media_1` varchar(191) DEFAULT NULL,
  `social_media_2` varchar(191) DEFAULT NULL,
  `permanent_address` text DEFAULT NULL,
  `current_address` text DEFAULT NULL,
  `guardian_name` varchar(191) DEFAULT NULL,
  `custom_field_1` varchar(191) DEFAULT NULL,
  `custom_field_2` varchar(191) DEFAULT NULL,
  `custom_field_3` varchar(191) DEFAULT NULL,
  `custom_field_4` varchar(191) DEFAULT NULL,
  `bank_details` longtext DEFAULT NULL,
  `id_proof_name` varchar(191) DEFAULT NULL,
  `id_proof_number` varchar(191) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `available_at`, `paused_at`, `max_sales_discount_percent`, `allow_login`, `status`, `is_enable_service_staff_pin`, `service_staff_pin`, `crm_contact_id`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'MR', 'Afonso', 'Lazube', 'afonso.lazube', 'lazbrelvy@gmail.com', '$2y$10$zshnhWj7g1tCCZ102iOgee5YhQRHVhSblbo3kbqbDlgnQeW.7.nH2', 'fr', NULL, NULL, '2vOUkXOvGP27JjqDr1VjGahUvX1LiraBpR0g98pSiPgC7CzsWoMBDjKaqiNW', 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, '1992-10-19', 'male', 'married', NULL, '+41 779690326', '+242 068226341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-11 15:30:05', '2024-08-12 15:38:33'),
(2, 'user', 'Mr', 'Charles', 'Matoumoueni', 'charles.matou', 'charles.matou@gmail.com', '$2y$10$tNCSvQoIC6b33FMIyv.5tu7J9X4rwaChhVOFYFtC41xk14rJT/0Fm', 'fr', NULL, NULL, '2FLosru2oCt8kw74URqi23KU3GW2nnTYFi2E4MQl5ECA6IlpSdLjfWO6rcWK', 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-11 14:48:44', '2024-07-15 11:27:39'),
(3, 'user', 'M', 'LGC', 'SARL', 'lgc.sarl', 'lgc.sarl.cg@gmail.com', '$2y$10$6R9Ow85VGiZ3HhmGZUYhd.I7n9rVwljZIV3ru05wH4nnqNBxFpFWK', 'fr', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-11 15:14:04', '2024-07-11 15:15:14'),
(5, 'user', 'Mr', 'Armand', 'LIZA', 'armand.liza', 'contact@lizaprotectforest.com', '$2y$10$Wnq6qpnDEEJPB7SmkQPJne7gpJYx/xOBn2YpU17bkFbbWDuXPAo6K', 'fr', NULL, NULL, 'yA2aWn4wXHrfafAGUqb8oSNA8VWzOwnQl30hOSTTXiyLzn9ILv4COrUoJVHY', 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 21:27:20', '2024-07-11 21:27:20'),
(6, 'user', 'Mr', 'Daouda', 'SINAYOKO', 'daouda.sinayoko', 'daoudasinayoko387@gmail.com', '$2y$10$outH/sIxmGymykoNdcpMqe2InuNfYZg53zzeo03pafmiOOIX2MYWC', 'fr', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, 'male', 'unmarried', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2024-08-21 15:58:09', '2024-07-12 14:00:53', '2024-08-21 15:58:09'),
(7, 'user', 'Mr', 'Erjon', 'Tolaj', 'erjon.tolaj-01', 'erjon.tolaj@zwahlen.ch', '$2y$10$jWGakSObXpr2YidV4SExS.wu/Y3N6swjeoUGbOroQ87JGPMNnnbIm', 'fr', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2024-08-21 15:58:05', '2024-07-15 06:51:54', '2024-08-21 15:58:05'),
(8, 'user', NULL, 'Makelekele', NULL, 'lpf.makelekele', 'makelekele@gmail.com', '$2y$10$GbLCw5SeiMVuK5wA4R81suZQOGvrDjw8aV/.OznuKPnujW6XV6CCy', 'fr', NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-16 13:23:44', '2024-07-16 19:55:49'),
(9, 'user', NULL, 'Bacongo', 'toto', 'lpf.bacongo', 'bacongo@gmail.com', '$2y$10$c9UyHFTOQ44FxOF/Gw0g1edd/MzfYfVKB/S5UUIm3B3BN9kdJ3Hrq', 'fr', NULL, NULL, 'ds3dPh0BfkP2NGHrtubcnPvlytbNEwFzQatWyNxnBcH8ax9p8lPHqs2KhqS5', 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-16 13:25:21', '2024-08-29 09:02:48'),
(10, 'user', NULL, 'Poto-Poto', NULL, 'lpf.poto-poto', 'poto-poto@gmail.com', '$2y$10$4R9r6VuLrB0VP1wrEUawfeyX/XVK8F9VKeMQIJw/KsnSBnQ7bXq.G', 'fr', NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-16 13:26:30', '2024-07-16 19:59:00'),
(11, 'user', NULL, 'Mongali', NULL, 'lpf.mongali', 'mongali@gmail.com', '$2y$10$QpNRGiRoKJbDgMc2t.TzmuyYJTUTe2qJuOB3yBgItMzO9eZjf4FFS', 'fr', NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-16 13:27:46', '2024-07-16 19:57:21'),
(12, 'user', 'M', 'Carlie', 'Feno', 'carlie.feno', 'afrobizcongo@gmail.com', '$2y$10$LMaGN/iH6ScP3tFcs6T6Ze1YOW/mUX3CcXnILqLNuNSlBmqsWBXK.', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, '2002-09-06', 'male', NULL, NULL, '+261349278761', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-07-24 06:11:54', '2024-09-17 07:30:09'),
(13, 'user', 'M', 'Johnny', 'NIAMBA', 'Johnny.niamba', 'Johnny.niamba@lgc-sarl.com', '$2y$10$6xrrjXnZRh6ICbLxZIAnGOgjSQGL8MsdRSfR6BOkXMUNmFhcRec56', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2024-08-21 15:58:01', '2024-07-24 06:32:05', '2024-08-21 15:58:01'),
(15, 'user', 'M', 'Daouda', 'SINAYOGO', 'daouda.sinayogo', 'daouda.sinayogo@lgc-sarl.com', '$2y$10$KDrX0Ffn5MQ847UnaresV.rfUx1WBt1EAy720a7o0sSLrHqJK4vVm', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-09-25 12:53:49', '2024-09-25 12:53:49'),
(16, 'user', 'M', 'Reda', 'assemghor', 'reda.assemghor', 'reda.assemghor@lgc-sarl.com', '$2y$10$dVZUI6/ylE1wvBmK0kuLh.jeyvBMU/1FSIwYoZku.xavG3qp5nYra', 'en', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 'active', 0, NULL, NULL, 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2024-09-30 12:41:30', '2024-09-30 12:41:30');

-- --------------------------------------------------------

--
-- Structure de la table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_contact_access`
--

INSERT INTO `user_contact_access` (`id`, `user_id`, `contact_id`) VALUES
(1, 1, 4),
(2, 2, 5),
(4, 5, 7),
(7, 1, 13);

-- --------------------------------------------------------

--
-- Structure de la table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `profit_percent` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text DEFAULT NULL COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(2, 'DUMMY', 2, '0002', 2, NULL, 100000.0000, 100000.0000, 20.0000, 120000.0000, 120000.0000, '2024-07-15 12:54:00', '2024-07-15 13:00:15', NULL, '[]'),
(3, 'DUMMY', 3, '0003', 3, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-15 13:09:44', '2024-07-15 13:18:05', NULL, '[]'),
(4, 'DUMMY', 4, '0004', 4, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-15 13:16:05', '2024-07-15 13:18:35', NULL, '[]'),
(5, 'DUMMY', 5, '0005', 5, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-15 13:17:48', '2024-07-15 13:18:57', NULL, '[]'),
(6, 'DUMMY', 6, '0006', 6, NULL, 85000.0000, 85000.0000, 45.0000, 123250.0000, 123250.0000, '2024-07-15 13:20:25', '2024-07-15 13:20:25', NULL, '[]'),
(7, 'DUMMY', 7, '0007', 7, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-15 13:21:15', '2024-07-15 13:21:15', NULL, '[]'),
(8, 'DUMMY', 8, '0008', 8, NULL, 65000.0000, 65000.0000, 0.0000, 65000.0000, 65000.0000, '2024-07-15 13:22:22', '2024-07-16 05:44:33', NULL, '[]'),
(9, 'DUMMY', 9, '0009', 9, NULL, 155000.0000, 155000.0000, 45.0000, 224750.0000, 224750.0000, '2024-07-15 13:23:38', '2024-07-15 13:23:38', NULL, '[]'),
(10, 'DUMMY', 10, '0010', 10, NULL, 120000.0000, 120000.0000, 45.0000, 174000.0000, 174000.0000, '2024-07-15 13:24:30', '2024-07-15 13:24:30', NULL, '[]'),
(11, 'DUMMY', 11, '0011', 11, NULL, 130000.0000, 130000.0000, 45.0000, 188500.0000, 188500.0000, '2024-07-15 13:25:49', '2024-07-15 13:25:49', NULL, '[]'),
(12, 'DUMMY', 12, '0012', 12, NULL, 145000.0000, 145000.0000, 45.0000, 210250.0000, 210250.0000, '2024-07-15 13:32:33', '2024-07-15 13:32:33', NULL, '[]'),
(13, 'DUMMY', 13, '0013', 13, NULL, 120266.0000, 120266.0000, 45.0000, 174386.0000, 174386.0000, '2024-07-15 13:34:18', '2024-07-15 13:34:18', NULL, '[]'),
(14, 'DUMMY', 14, '0014', 14, NULL, 43539.0000, 43539.0000, 45.0000, 63132.0000, 63132.0000, '2024-07-16 05:44:45', '2024-07-16 05:46:21', NULL, '[]'),
(15, 'DUMMY', 15, '0015', 15, NULL, 3000.0000, 3000.0000, 45.0000, 4350.0000, 4350.0000, '2024-07-16 05:45:57', '2024-07-16 05:45:57', NULL, '[]'),
(16, 'DUMMY', 16, '0016', 16, NULL, 402495.0000, 402495.0000, 45.0000, 583618.0000, 583618.0000, '2024-07-16 05:48:04', '2024-07-16 05:48:04', NULL, '[]'),
(17, 'DUMMY', 17, '0017', 17, NULL, 35000.0000, 35000.0000, 45.0000, 50750.0000, 50750.0000, '2024-07-16 05:49:24', '2024-07-16 05:49:24', NULL, '[]'),
(18, 'DUMMY', 18, '0018', 18, NULL, 85000.0000, 85000.0000, 45.0000, 123250.0000, 123250.0000, '2024-07-16 05:51:14', '2024-07-16 05:51:14', NULL, '[]'),
(19, 'DUMMY', 19, '0019', 19, NULL, 85000.0000, 85000.0000, 45.0000, 123250.0000, 123250.0000, '2024-07-16 05:51:59', '2024-07-16 05:51:59', NULL, '[]'),
(20, 'DUMMY', 20, '0020', 20, NULL, 95000.0000, 95000.0000, 45.0000, 137750.0000, 137750.0000, '2024-07-16 05:52:51', '2024-07-16 05:52:51', NULL, '[]'),
(21, 'DUMMY', 21, '0021', 21, NULL, 15000.0000, 15000.0000, 45.0000, 21750.0000, 21750.0000, '2024-07-16 05:54:11', '2024-07-16 05:54:11', NULL, '[]'),
(22, 'DUMMY', 22, '0022', 22, NULL, 235000.0000, 235000.0000, 45.0000, 340750.0000, 340750.0000, '2024-07-16 05:55:47', '2024-07-16 05:55:47', NULL, '[]'),
(23, 'DUMMY', 23, '0023', 23, NULL, 38000.0000, 38000.0000, 45.0000, 55100.0000, 55100.0000, '2024-07-16 05:58:41', '2024-07-16 05:58:41', NULL, '[]'),
(24, 'DUMMY', 24, '0024', 24, NULL, 12500.0000, 12500.0000, 45.0000, 18125.0000, 18125.0000, '2024-07-16 05:59:34', '2024-07-16 05:59:34', NULL, '[]'),
(25, 'DUMMY', 25, '0025', 25, NULL, 55000.0000, 55000.0000, 45.0000, 79750.0000, 79750.0000, '2024-07-16 06:01:21', '2024-07-16 06:01:21', NULL, '[]'),
(26, 'DUMMY', 26, '0026', 26, NULL, 1850000.0000, 1850000.0000, 45.0000, 2682500.0000, 2682500.0000, '2024-07-16 10:31:46', '2024-07-16 10:31:46', NULL, '[]'),
(27, 'DUMMY', 27, '0027', 27, NULL, 480000.0000, 480000.0000, 45.0000, 696000.0000, 696000.0000, '2024-07-16 10:43:33', '2024-07-16 10:43:33', NULL, '[]'),
(28, 'DUMMY', 28, '0028', 28, NULL, 145000.0000, 145000.0000, 45.0000, 210250.0000, 210250.0000, '2024-07-16 10:56:36', '2024-07-16 10:56:36', NULL, '[]'),
(29, 'DUMMY', 29, '0029', 29, NULL, 155000.0000, 155000.0000, 45.0000, 224750.0000, 224750.0000, '2024-07-16 10:57:19', '2024-07-16 10:57:19', NULL, '[]'),
(30, 'DUMMY', 30, '0030', 30, NULL, 650000.0000, 650000.0000, 45.0000, 942500.0000, 942500.0000, '2024-07-16 10:58:33', '2024-07-16 10:58:33', NULL, '[]'),
(31, 'DUMMY', 31, '0031', 31, NULL, 85000.0000, 85000.0000, 45.0000, 123250.0000, 123250.0000, '2024-07-16 10:59:50', '2024-07-16 10:59:50', NULL, '[]'),
(32, 'DUMMY', 32, '0032', 32, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-16 11:00:47', '2024-07-16 11:00:47', NULL, '[]'),
(33, 'DUMMY', 33, '0033', 33, NULL, 180000.0000, 180000.0000, 45.0000, 261000.0000, 261000.0000, '2024-07-16 11:01:34', '2024-07-16 11:01:34', NULL, '[]'),
(34, 'DUMMY', 34, 'FAVM01', 34, NULL, 50000.0000, 50000.0000, 25.0000, 62500.0000, 62500.0000, '2024-07-16 13:32:23', '2024-07-17 09:42:06', NULL, '[]'),
(35, 'DUMMY', 35, 'FANVM01', 35, NULL, 34000.0000, 34000.0000, 25.0000, 42500.0000, 42500.0000, '2024-07-16 13:36:11', '2024-07-17 09:41:40', NULL, '[]'),
(36, 'DUMMY', 36, '0036', 36, NULL, 195000.0000, 195000.0000, 45.0000, 282750.0000, 282750.0000, '2024-07-17 05:47:15', '2024-07-17 05:47:15', NULL, '[]'),
(37, 'DUMMY', 37, '0037', 37, NULL, 420000.0000, 420000.0000, 45.0000, 609000.0000, 609000.0000, '2024-07-17 05:48:05', '2024-07-17 05:48:05', NULL, '[]'),
(38, 'DUMMY', 38, '0038', 38, NULL, 95000.0000, 95000.0000, 45.0000, 137750.0000, 137750.0000, '2024-07-17 06:26:55', '2024-07-17 06:26:55', NULL, '[]'),
(39, 'DUMMY', 39, '0039', 39, NULL, 270000.0000, 270000.0000, 45.0000, 391500.0000, 391500.0000, '2024-07-17 06:30:53', '2024-07-17 06:30:53', NULL, '[]'),
(40, 'DUMMY', 40, '0040', 40, NULL, 25000.0000, 25000.0000, 45.0000, 36250.0000, 36250.0000, '2024-07-17 06:45:12', '2024-07-17 06:45:12', NULL, '[]'),
(41, 'DUMMY', 41, '0041', 41, NULL, 60000.0000, 60000.0000, 45.0000, 87000.0000, 87000.0000, '2024-07-17 06:54:28', '2024-07-17 06:54:28', NULL, '[]'),
(42, 'DUMMY', 42, '0042', 42, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-17 07:52:02', '2024-07-17 07:52:02', NULL, '[]'),
(43, 'DUMMY', 43, '0043', 43, NULL, 110000.0000, 110000.0000, 45.0000, 159500.0000, 159500.0000, '2024-07-17 08:08:25', '2024-07-17 08:08:25', NULL, '[]'),
(44, 'DUMMY', 44, 'GR25', 44, NULL, 1000.0000, 1000.0000, 25.0000, 1250.0000, 1250.0000, '2024-07-17 09:44:51', '2024-07-17 09:45:23', NULL, '[]'),
(45, 'DUMMY', 45, '0045', 45, NULL, 65000.0000, 65000.0000, 45.0000, 94250.0000, 94250.0000, '2024-07-17 10:01:11', '2024-07-17 10:01:11', NULL, '[]'),
(46, 'DUMMY', 46, 'GN Netcom GN 9120MicroBoom Micro-casque sans fil DECT Sans base', 46, NULL, 15000.0000, 15000.0000, 45.0000, 21750.0000, 21750.0000, '2024-07-17 10:52:19', '2024-07-17 10:52:19', NULL, '[]'),
(47, 'DUMMY', 47, '0047', 47, NULL, 13500.0000, 13500.0000, 45.0000, 19575.0000, 19575.0000, '2024-07-17 10:55:05', '2024-07-17 10:55:05', NULL, '[]'),
(48, 'DUMMY', 48, 'Turtle BeachCasque de jeu sans fil avec son Surround Stealth 500P de Turtle Beach - PS4, PS4 Pro et PS3', 48, NULL, 22000.0000, 22000.0000, 45.0000, 31900.0000, 31900.0000, '2024-07-17 11:47:43', '2024-07-17 11:47:43', NULL, '[]'),
(49, 'DUMMY', 49, '0049', 49, NULL, 35000.0000, 35000.0000, 45.0000, 50750.0000, 50750.0000, '2024-07-18 06:25:03', '2024-07-18 06:25:03', NULL, '[]'),
(50, 'DUMMY', 50, '0050', 50, NULL, 55000.0000, 55000.0000, 45.0000, 79750.0000, 79750.0000, '2024-07-18 08:37:06', '2024-07-18 08:37:06', NULL, '[]'),
(51, 'DUMMY', 51, '0051', 51, NULL, 190000.0000, 190000.0000, 0.0000, 190000.0000, 190000.0000, '2024-07-27 08:04:21', '2024-07-27 08:04:21', NULL, '[]'),
(52, 'DUMMY', 52, 'CHARO', 52, NULL, 100.0000, 100.0000, 25.0000, 125.0000, 125.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42', NULL, '[]'),
(56, 'DUMMY', 56, '0056', 56, NULL, 0.0000, 0.0000, 25.0000, 0.0000, 0.0000, '2024-08-12 18:16:42', '2024-08-12 18:16:42', NULL, '[]'),
(57, 'DUMMY', 57, 'HL', 57, NULL, 0.0000, 0.0000, 25.0000, 0.0000, 0.0000, '2024-08-13 06:11:56', '2024-08-13 06:11:56', NULL, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `price_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 2, 1, 10.0000, '2024-07-15 12:58:41', '2024-07-15 12:58:41'),
(3, 3, 3, 3, 1, 10.0000, '2024-07-15 13:09:52', '2024-07-15 13:09:52'),
(4, 4, 4, 4, 1, 10.0000, '2024-07-15 13:16:14', '2024-07-15 13:16:14'),
(5, 5, 5, 5, 1, 10.0000, '2024-07-15 13:17:54', '2024-07-15 13:17:54'),
(6, 6, 6, 6, 1, 10.0000, '2024-07-15 13:20:31', '2024-07-15 13:20:31'),
(7, 7, 7, 7, 1, 10.0000, '2024-07-15 13:21:29', '2024-07-15 13:21:29'),
(8, 8, 8, 8, 1, 10.0000, '2024-07-15 13:22:29', '2024-07-15 13:22:29'),
(9, 9, 9, 9, 1, 10.0000, '2024-07-15 13:23:44', '2024-07-15 13:23:44'),
(10, 10, 10, 10, 1, 10.0000, '2024-07-15 13:24:37', '2024-07-15 13:24:37'),
(11, 11, 11, 11, 1, 10.0000, '2024-07-15 13:25:56', '2024-07-15 13:25:56'),
(12, 12, 12, 12, 1, 10.0000, '2024-07-15 13:32:38', '2024-07-15 13:32:38'),
(13, 13, 13, 13, 1, 10.0000, '2024-07-15 13:34:25', '2024-07-15 13:34:25'),
(14, 14, 14, 14, 1, 10.0000, '2024-07-16 05:44:54', '2024-07-16 05:44:54'),
(15, 15, 15, 15, 1, 9.0000, '2024-07-16 05:46:02', '2024-09-05 08:04:22'),
(16, 16, 16, 16, 1, 10.0000, '2024-07-16 05:48:12', '2024-07-16 05:48:12'),
(17, 17, 17, 17, 1, 10.0000, '2024-07-16 05:49:33', '2024-07-16 05:49:33'),
(18, 18, 18, 18, 1, 10.0000, '2024-07-16 05:51:19', '2024-07-16 05:51:19'),
(19, 19, 19, 19, 1, 10.0000, '2024-07-16 05:52:08', '2024-07-16 05:52:08'),
(20, 20, 20, 20, 1, 10.0000, '2024-07-16 05:52:56', '2024-07-16 05:52:56'),
(21, 21, 21, 21, 1, 10.0000, '2024-07-16 05:54:16', '2024-07-16 05:54:16'),
(22, 22, 22, 22, 1, 10.0000, '2024-07-16 05:55:52', '2024-07-16 05:55:52'),
(23, 23, 23, 23, 1, 10.0000, '2024-07-16 05:58:48', '2024-07-16 05:58:48'),
(24, 24, 24, 24, 1, 10.0000, '2024-07-16 05:59:41', '2024-07-16 05:59:41'),
(25, 25, 25, 25, 1, 8.0000, '2024-07-16 06:01:26', '2024-08-28 05:49:55'),
(26, 26, 26, 26, 1, 10.0000, '2024-07-16 10:31:53', '2024-07-16 10:31:53'),
(27, 27, 27, 27, 1, 10.0000, '2024-07-16 10:43:39', '2024-07-16 10:43:39'),
(28, 28, 28, 28, 1, 10.0000, '2024-07-16 10:56:42', '2024-07-16 10:56:42'),
(29, 29, 29, 29, 1, 10.0000, '2024-07-16 10:57:24', '2024-07-16 10:57:24'),
(30, 30, 30, 30, 1, 10.0000, '2024-07-16 10:58:41', '2024-07-16 10:58:41'),
(31, 31, 31, 31, 1, 10.0000, '2024-07-16 11:00:04', '2024-07-16 11:00:04'),
(32, 32, 32, 32, 1, 10.0000, '2024-07-16 11:00:52', '2024-07-16 11:00:52'),
(33, 33, 33, 33, 1, 10.0000, '2024-07-16 11:01:42', '2024-07-16 11:01:42'),
(34, 34, 34, 34, 4, 50.0000, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(35, 34, 34, 34, 5, 17.0000, '2024-07-16 13:34:18', '2024-07-17 10:44:04'),
(36, 34, 34, 34, 6, 54.0000, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(37, 34, 34, 34, 7, 60.0000, '2024-07-16 13:34:18', '2024-07-16 13:34:18'),
(38, 35, 35, 35, 5, 79.0000, '2024-07-16 13:36:30', '2024-07-22 12:33:52'),
(39, 35, 35, 35, 7, 49.0000, '2024-07-16 13:36:30', '2024-07-16 13:36:30'),
(40, 36, 36, 36, 1, 10.0000, '2024-07-17 05:47:21', '2024-07-17 05:47:21'),
(41, 37, 37, 37, 1, 10.0000, '2024-07-17 05:48:11', '2024-07-17 05:48:11'),
(42, 38, 38, 38, 1, 10.0000, '2024-07-17 06:26:59', '2024-07-17 06:26:59'),
(43, 39, 39, 39, 1, 8.0000, '2024-07-17 06:30:59', '2024-08-28 05:49:55'),
(44, 40, 40, 40, 1, 10.0000, '2024-07-17 06:45:19', '2024-07-17 06:45:19'),
(45, 41, 41, 41, 1, 10.0000, '2024-07-17 06:54:34', '2024-07-17 06:54:34'),
(46, 42, 42, 42, 1, 10.0000, '2024-07-17 07:52:09', '2024-07-17 07:52:09'),
(47, 43, 43, 43, 1, 10.0000, '2024-07-17 08:08:31', '2024-07-17 08:08:31'),
(48, 44, 44, 44, 4, 50.0000, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(49, 44, 44, 44, 5, 1.0000, '2024-07-17 09:46:18', '2024-07-18 10:15:25'),
(50, 44, 44, 44, 6, 67.0000, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(51, 44, 44, 44, 7, 25.0000, '2024-07-17 09:46:18', '2024-07-17 09:46:18'),
(52, 45, 45, 45, 1, 10.0000, '2024-07-17 10:01:17', '2024-07-17 10:01:17'),
(53, 46, 46, 46, 1, 10.0000, '2024-07-17 10:52:42', '2024-07-17 10:52:42'),
(54, 47, 47, 47, 1, 10.0000, '2024-07-17 10:55:11', '2024-07-17 10:55:11'),
(55, 48, 48, 48, 1, 10.0000, '2024-07-17 11:47:48', '2024-07-17 11:47:48'),
(56, 49, 49, 49, 1, 10.0000, '2024-07-18 06:25:10', '2024-07-18 06:25:10'),
(57, 50, 50, 50, 1, 10.0000, '2024-07-18 08:37:11', '2024-07-18 08:37:11'),
(58, 51, 51, 51, 1, 9.0000, '2024-07-27 08:04:27', '2024-07-27 08:09:22'),
(59, 52, 52, 52, 3, 10.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(60, 52, 52, 52, 4, 10.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(61, 52, 52, 52, 5, 10.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(62, 52, 52, 52, 6, 10.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(63, 52, 52, 52, 7, 10.0000, '2024-08-12 17:06:42', '2024-08-12 17:06:42'),
(64, 57, 57, 57, 3, 12.0000, '2024-08-13 06:11:56', '2024-08-13 06:11:56'),
(65, 57, 57, 57, 5, 100.0000, '2024-08-13 06:11:56', '2024-08-13 06:11:56');

-- --------------------------------------------------------

--
-- Structure de la table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, 'Garantie Standard du Fabricant', 1, 'Couverture : Défauts de fabrication et de matériaux. Peut inclure la réparation ou le remplacement du produit défectueux.\r\nExclusions : Dommages causés par l\'utilisateur, usure normale, modifications non autorisées.', 3, 'years', '2024-07-12 14:23:32', '2024-07-12 14:23:32'),
(2, 'Garantie Étendue (Extended Warranty)', 1, 'Durée : Prolongation de la garantie standard, souvent de 1 à 3 ans supplémentaires.\r\nCouverture : Similaire à la garantie standard, mais étend la période de couverture.\r\nFournisseurs : Peut être offerte par le fabricant ou par des tiers.', 1, 'years', '2024-07-12 14:24:02', '2024-07-12 14:24:32'),
(3, 'Garantie Sur Site (On-Site Warranty)', 1, 'Couverture : Réparation ou remplacement sur site, c\'est-à-dire à l\'emplacement du client, sans besoin de renvoyer le produit.\r\nAvantages : Gain de temps, service rapide et pratique.', 3, 'months', '2024-07-12 14:25:45', '2024-07-12 14:25:45'),
(4, 'Garantie de Retour (Return Warranty)', 1, 'Couverture : Permet de retourner le produit pour un remboursement ou un échange si le client n\'est pas satisfait.\r\nConditions : Le produit doit être en état neuf ou dans son emballage d\'origine.', 90, 'days', '2024-07-12 14:26:13', '2024-07-12 14:26:13'),
(5, 'Garantie de Remplacement Avancé (Advanced Replacement Warranty)', 1, 'Couverture : Envoie un produit de remplacement avant le retour du produit défectueux.\r\nAvantages : Minimise le temps d\'arrêt en fournissant un remplacement immédiat.', 1, 'months', '2024-07-12 14:26:47', '2024-07-12 14:26:47'),
(6, 'Garantie de Réparation (Repair Warranty)', 1, 'Couverture : Réparation des défauts couverts par la garantie sans remplacement immédiat.\r\nExclusions : Dommages causés par l\'utilisateur ou l\'usure normale.', 1, 'years', '2024-07-12 14:29:14', '2024-07-12 14:29:14'),
(7, 'Garantie Limitée (Limited Warranty)', 1, 'Couverture : Limitée à certains composants ou types de défauts.\r\nExclusions : Généralement plus restrictive que la garantie standard, avec des exclusions spécifiques.', 1, 'years', '2024-07-12 14:29:40', '2024-07-12 14:29:40'),
(8, 'Garantie à Vie (Lifetime Warranty)', 1, 'Couverture : Défauts de fabrication pour la durée de vie du produit.\r\nExclusions : Usure normale, dommages accidentels, modifications non autorisées.', 1, 'years', '2024-07-12 14:30:08', '2024-07-12 14:30:08'),
(9, 'Garantie de Satisfaction', 1, 'Couverture : Permet le retour ou l\'échange du produit si le client n\'est pas satisfait pour quelque raison que ce soit.\r\nConditions : Souvent conditionnée à l\'état neuf du produit et à l\'emballage d\'origine.', 1, 'years', '2024-07-12 14:31:10', '2024-07-12 14:31:10'),
(10, 'Garantie de Support Technique', 1, 'Couverture : Support technique par téléphone, email ou chat pour résoudre les problèmes logiciels ou de configuration.\r\nAvantages : Aide à résoudre les problèmes sans renvoyer le produit.', 1, 'years', '2024-07-12 14:31:29', '2024-07-12 14:31:29');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Index pour la table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`),
  ADD KEY `account_transactions_operation_date_index` (`operation_date`);

--
-- Index pour la table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Index pour la table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Index pour la table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Index pour la table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Index pour la table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Index pour la table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Index pour la table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_denominations_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Index pour la table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Index pour la table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Index pour la table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Index pour la table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Index pour la table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Index pour la table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Index pour la table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`),
  ADD KEY `discounts_spg_index` (`spg`);

--
-- Index pour la table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Index pour la table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Index pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Index pour la table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Index pour la table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Index pour la table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`),
  ADD KEY `invoice_schemes_number_type_index` (`number_type`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Index pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Index pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Index pour la table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Index pour la table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`),
  ADD KEY `products_secondary_unit_id_index` (`secondary_unit_id`),
  ADD KEY `products_repair_model_id_index` (`repair_model_id`);

--
-- Index pour la table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Index pour la table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Index pour la table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Index pour la table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Index pour la table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Index pour la table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repair_device_models_business_id_index` (`business_id`),
  ADD KEY `repair_device_models_brand_id_index` (`brand_id`),
  ADD KEY `repair_device_models_device_id_index` (`device_id`),
  ADD KEY `repair_device_models_created_by_index` (`created_by`);

--
-- Index pour la table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `repair_job_sheets_business_id_index` (`business_id`),
  ADD KEY `repair_job_sheets_location_id_index` (`location_id`),
  ADD KEY `repair_job_sheets_contact_id_index` (`contact_id`),
  ADD KEY `repair_job_sheets_brand_id_index` (`brand_id`),
  ADD KEY `repair_job_sheets_device_id_index` (`device_id`),
  ADD KEY `repair_job_sheets_device_model_id_index` (`device_model_id`),
  ADD KEY `repair_job_sheets_status_id_index` (`status_id`),
  ADD KEY `repair_job_sheets_service_staff_index` (`service_staff`),
  ADD KEY `repair_job_sheets_created_by_index` (`created_by`);

--
-- Index pour la table `repair_statuses`
--
ALTER TABLE `repair_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Index pour la table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Index pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Index pour la table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Index pour la table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Index pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_business_id_foreign` (`business_id`),
  ADD KEY `subscriptions_package_id_index` (`package_id`),
  ADD KEY `subscriptions_created_id_index` (`created_id`);

--
-- Index pour la table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `superadmin_coupons`
--
ALTER TABLE `superadmin_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `transactions_delivery_date_index` (`delivery_date`),
  ADD KEY `transactions_delivery_person_index` (`delivery_person`),
  ADD KEY `transactions_repair_model_id_index` (`repair_model_id`),
  ADD KEY `transactions_repair_warranty_id_index` (`repair_warranty_id`),
  ADD KEY `transactions_repair_brand_id_index` (`repair_brand_id`),
  ADD KEY `transactions_repair_status_id_index` (`repair_status_id`),
  ADD KEY `transactions_repair_device_id_index` (`repair_device_id`),
  ADD KEY `transactions_repair_job_sheet_id_index` (`repair_job_sheet_id`);

--
-- Index pour la table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`),
  ADD KEY `transaction_payments_payment_type_index` (`payment_type`);

--
-- Index pour la table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Index pour la table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Index pour la table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Index pour la table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`),
  ADD KEY `users_crm_contact_id_foreign` (`crm_contact_id`);

--
-- Index pour la table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Index pour la table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Index pour la table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Index pour la table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Index pour la table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Index pour la table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Index pour la table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=385;

--
-- AUTO_INCREMENT pour la table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT pour la table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `cash_denominations`
--
ALTER TABLE `cash_denominations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT pour la table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT pour la table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT pour la table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT pour la table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `repair_statuses`
--
ALTER TABLE `repair_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `superadmin_communicator_logs`
--
ALTER TABLE `superadmin_communicator_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `superadmin_coupons`
--
ALTER TABLE `superadmin_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `superadmin_frontend_pages`
--
ALTER TABLE `superadmin_frontend_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT pour la table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_repair_model_id_foreign` FOREIGN KEY (`repair_model_id`) REFERENCES `repair_device_models` (`id`),
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `repair_device_models`
--
ALTER TABLE `repair_device_models`
  ADD CONSTRAINT `repair_device_models_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `repair_device_models_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_device_models_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `repair_device_models_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `repair_job_sheets`
--
ALTER TABLE `repair_job_sheets`
  ADD CONSTRAINT `repair_job_sheets_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `repair_job_sheets_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_job_sheets_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_job_sheets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `repair_job_sheets_device_id_foreign` FOREIGN KEY (`device_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `repair_job_sheets_device_model_id_foreign` FOREIGN KEY (`device_model_id`) REFERENCES `repair_device_models` (`id`),
  ADD CONSTRAINT `repair_job_sheets_service_staff_foreign` FOREIGN KEY (`service_staff`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_repair_job_sheet_id_foreign` FOREIGN KEY (`repair_job_sheet_id`) REFERENCES `repair_job_sheets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_crm_contact_id_foreign` FOREIGN KEY (`crm_contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Contraintes pour la table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
