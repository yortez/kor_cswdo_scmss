-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 08, 2025 at 04:13 AM
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
-- Database: `scmss_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`) VALUES
(1, 'Resource', 'Role Created', 'Spatie\\Permission\\Models\\Role', 'Created', 1, NULL, NULL, '{\"guard_name\":\"web\",\"name\":\"super_admin\",\"updated_at\":\"2025-04-06 13:50:17\",\"created_at\":\"2025-04-06 13:50:17\",\"id\":1}', NULL, '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(2, 'Resource', 'User Created', 'App\\Models\\User', 'Created', 1, NULL, NULL, '{\"name\":\"Admin\",\"email\":\"admin@admin.com\",\"updated_at\":\"2025-04-06 13:50:51\",\"created_at\":\"2025-04-06 13:50:51\",\"id\":1}', NULL, '2025-04-06 05:50:51', '2025-04-06 05:50:51'),
(3, 'Access', 'Admin logged in', NULL, 'Login', NULL, 'App\\Models\\User', 1, '{\"ip\":\"127.0.0.1\",\"user_agent\":\"Mozilla\\/5.0 (X11; Linux x86_64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/134.0.0.0 Safari\\/537.36\"}', NULL, '2025-04-06 05:50:55', '2025-04-06 05:50:55'),
(4, 'Access', 'Admin logged in', NULL, 'Login', NULL, 'App\\Models\\User', 1, '{\"ip\":\"127.0.0.1\",\"user_agent\":\"Symfony\"}', NULL, '2025-04-06 05:58:19', '2025-04-06 05:58:19'),
(5, 'Notification', 'DatabaseNotification Notification sent', NULL, 'Notification Sent', NULL, NULL, NULL, '[]', NULL, '2025-04-06 05:58:21', '2025-04-06 05:58:21'),
(6, 'Resource', 'Master List Created by Admin', 'App\\Models\\MasterList', 'Created', 1, 'App\\Models\\User', 1, '{\"osca_id\":\"93\",\"last_name\":\"Kautzer\",\"first_name\":\"Maribel\",\"middle_name\":\"Murray Kuhlman\",\"extension\":\"null\",\"birthday\":\"1965-03-01\",\"age\":60,\"gender\":\"M\",\"religion_id\":\"1\",\"civil_status\":\"married\",\"educational_attainment\":\"master degree\",\"birth_place\":\"1539 Skiles Coves\",\"city_id\":1,\"barangay_id\":\"56\",\"purok_id\":\"57\",\"date_of_registration\":\"2024-06-19\",\"gsis_id\":\"null\",\"philhealth_id\":\"null\",\"illness\":\"null\",\"disability\":\"N\\/A\",\"type\":\"pensioner\",\"is_active\":true,\"id\":1}', NULL, '2025-04-06 06:26:23', '2025-04-06 06:26:23'),
(7, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 1, NULL, NULL, '{\"name\":\"Social Pension\",\"description\":\"-60 above\\n                        -Quarterly payout\\n                        -Data base sa system ni region\\n                        -Indigent senior citizen without SSS, GSIS PVAO or any benefits from government\",\"min_age\":60,\"max_age\":100,\"amount\":500,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":1}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(8, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 2, NULL, NULL, '{\"name\":\"Cash Incentive A\",\"description\":\"- Once lang maka recieved every bracket\\n                        85-90 (10k)\",\"min_age\":85,\"max_age\":90,\"amount\":10000,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":2}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(9, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 3, NULL, NULL, '{\"name\":\"Cash Incentive B\",\"description\":\"- Once lang maka recieved every bracket\\n                        91-95 (15k)\",\"min_age\":91,\"max_age\":95,\"amount\":15000,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":3}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(10, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 4, NULL, NULL, '{\"name\":\"Cash Incentive C\",\"description\":\"- Once lang maka recieved every bracket\\n                        96-99 (20k)\",\"min_age\":96,\"max_age\":99,\"amount\":20000,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":4}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(11, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 5, NULL, NULL, '{\"name\":\"Birthday Cash Gift\",\"description\":\"-once a year depende sa budget\\n        -60 to 84 years old\\n        - priority age is 84 pababa hanggang maka abot ng 60\",\"min_age\":0,\"max_age\":0,\"amount\":5000,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":5}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(12, 'Resource', 'Benefit Created', 'App\\Models\\Benefit', 'Created', 6, NULL, NULL, '{\"name\":\"Centenarian\",\"description\":\"- 100 years old\\n        Incentive they will recieve is\\n        20k from City government\\n        20k from Provincial government\\n        100k from DSWD XII\",\"min_age\":100,\"max_age\":0,\"amount\":140000,\"updated_at\":\"2025-04-06 14:27:42\",\"created_at\":\"2025-04-06 14:27:42\",\"id\":6}', NULL, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(13, 'Resource', 'Benefit Created by Admin', 'App\\Models\\Benefit', 'Created', 7, 'App\\Models\\User', 1, '{\"name\":\"Leann Muller\",\"description\":null,\"min_age\":\"621\",\"max_age\":\"459\",\"amount\":\"140000\",\"updated_at\":\"2025-04-06 14:27:59\",\"created_at\":\"2025-04-06 14:27:59\",\"id\":7}', NULL, '2025-04-06 06:27:59', '2025-04-06 06:27:59'),
(14, 'Resource', 'Benefit Deleted by Admin', 'App\\Models\\Benefit', 'Deleted', 7, 'App\\Models\\User', 1, '[]', NULL, '2025-04-06 06:28:10', '2025-04-06 06:28:10'),
(15, 'Resource', 'Payroll Created by Admin', 'App\\Models\\Payroll', 'Created', 1, 'App\\Models\\User', 1, '{\"benefit_id\":\"1\",\"amount\":500,\"status\":\"new\",\"note\":\"Firts quarter\",\"updated_at\":\"2025-04-06 14:28:37\",\"created_at\":\"2025-04-06 14:28:37\",\"id\":1}', NULL, '2025-04-06 06:28:37', '2025-04-06 06:28:37'),
(16, 'Resource', 'Master List Created by Admin', 'App\\Models\\MasterList', 'Created', 2, 'App\\Models\\User', 1, '{\"osca_id\":\"388\",\"last_name\":\"Lehner\",\"first_name\":\"Amanda\",\"middle_name\":\"Chandler Herman\",\"extension\":\"null\",\"birthday\":\"1964-08-06\",\"age\":60,\"gender\":\"M\",\"religion_id\":\"1\",\"civil_status\":\"legally separated\",\"educational_attainment\":\"elementary graduate\",\"birth_place\":\"236 Weber Radial\",\"city_id\":1,\"barangay_id\":\"56\",\"purok_id\":\"57\",\"date_of_registration\":\"2024-09-22\",\"gsis_id\":\"null\",\"philhealth_id\":\"null\",\"illness\":\"null\",\"disability\":\"N\\/A\",\"type\":\"pensioner\",\"is_active\":true,\"id\":2}', NULL, '2025-04-06 07:39:05', '2025-04-06 07:39:05'),
(17, 'Access', 'Admin logged in', NULL, 'Login', NULL, 'App\\Models\\User', 1, '{\"ip\":\"127.0.0.1\",\"user_agent\":\"Symfony\"}', NULL, '2025-04-06 07:39:35', '2025-04-06 07:39:35'),
(18, 'Notification', 'DatabaseNotification Notification sent', NULL, 'Notification Sent', NULL, NULL, NULL, '[]', NULL, '2025-04-06 07:39:36', '2025-04-06 07:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `barangays`
--

CREATE TABLE `barangays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barangays`
--

INSERT INTO `barangays` (`id`, `name`, `created_at`, `updated_at`) VALUES
(56, 'Assumption', '2025-04-06 06:15:25', '2025-04-06 06:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `benefits`
--

INSERT INTO `benefits` (`id`, `name`, `min_age`, `max_age`, `description`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'Social Pension', 60, 100, '-60 above\n                        -Quarterly payout\n                        -Data base sa system ni region\n                        -Indigent senior citizen without SSS, GSIS PVAO or any benefits from government', 500, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(2, 'Cash Incentive A', 85, 90, '- Once lang maka recieved every bracket\n                        85-90 (10k)', 10000, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(3, 'Cash Incentive B', 91, 95, '- Once lang maka recieved every bracket\n                        91-95 (15k)', 15000, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(4, 'Cash Incentive C', 96, 99, '- Once lang maka recieved every bracket\n                        96-99 (20k)', 20000, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(5, 'Birthday Cash Gift', 0, 0, '-once a year depende sa budget\n        -60 to 84 years old\n        - priority age is 84 pababa hanggang maka abot ng 60', 5000, '2025-04-06 06:27:42', '2025-04-06 06:27:42'),
(6, 'Centenarian', 100, 0, '- 100 years old\n        Incentive they will recieve is\n        20k from City government\n        20k from Provincial government\n        100k from DSWD XII', 140000, '2025-04-06 06:27:42', '2025-04-06 06:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `breezy_sessions`
--

CREATE TABLE `breezy_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `panel_id` varchar(255) DEFAULT NULL,
  `guard` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:80:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:13:\"view_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"view_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:15:\"create_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"update_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:15:\"delete_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:19:\"delete_any_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:16:\"publish_activity\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"view_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:16:\"view_any_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:14:\"create_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:14:\"update_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:14:\"delete_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:18:\"delete_any_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:15:\"publish_benefit\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:9:\"view_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"view_any_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:11:\"create_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:11:\"update_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:12:\"restore_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:16:\"restore_any_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:14:\"replicate_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"reorder_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:11:\"delete_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:15:\"delete_any_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:17:\"force_delete_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:21:\"force_delete_any_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:16:\"book:create_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:16:\"book:update_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:16:\"book:delete_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:20:\"book:pagination_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:16:\"book:detail_book\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:17:\"view_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:21:\"view_any_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:19:\"create_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:19:\"update_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:20:\"restore_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:24:\"restore_any_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:22:\"replicate_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:20:\"reorder_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:19:\"delete_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:23:\"delete_any_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:25:\"force_delete_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:29:\"force_delete_any_master::list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:12:\"view_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:16:\"view_any_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:14:\"create_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:14:\"update_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:15:\"restore_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:19:\"restore_any_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:17:\"replicate_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:15:\"reorder_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:14:\"delete_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:18:\"delete_any_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:20:\"force_delete_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:24:\"force_delete_any_payroll\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:9:\"view_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:13:\"view_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:11:\"create_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:11:\"update_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:11:\"delete_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:15:\"delete_any_role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:9:\"view_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:13:\"view_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:11:\"create_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:11:\"update_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:12:\"restore_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:16:\"restore_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:14:\"replicate_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:12:\"reorder_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:11:\"delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:15:\"delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:17:\"force_delete_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:21:\"force_delete_any_user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:18:\"page_ManageSetting\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:11:\"page_Themes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:18:\"page_MyProfilePage\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:76;a:4:{s:1:\"a\";i:77;s:1:\"b\";s:25:\"widget_TotalActiveSeniors\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:77;a:4:{s:1:\"a\";i:78;s:1:\"b\";s:36:\"widget_SeniorCitizenPerBarangayChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:78;a:4:{s:1:\"a\";i:79;s:1:\"b\";s:28:\"widget_SeniorPopulationChart\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:79;a:4:{s:1:\"a\";i:80;s:1:\"b\";s:36:\"widget_SeniorCitizensByBarangayTable\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:11:\"super_admin\";s:1:\"c\";s:3:\"web\";}}}', 1744038500);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Koronadal', '2025-04-06 05:59:05', '2025-04-06 05:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exports`
--

CREATE TABLE `exports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_disk` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `exporter` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exports`
--

INSERT INTO `exports` (`id`, `completed_at`, `file_disk`, `file_name`, `exporter`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2025-04-06 07:39:36', 'local', 'export-1-master-lists', 'App\\Filament\\Exports\\MasterListExporter', 2, 2, 2, 1, '2025-04-06 07:39:32', '2025-04-06 07:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_import_rows`
--

CREATE TABLE `failed_import_rows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `import_id` bigint(20) UNSIGNED NOT NULL,
  `validation_error` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_import_rows`
--

INSERT INTO `failed_import_rows` (`id`, `data`, `import_id`, `validation_error`, `created_at`, `updated_at`) VALUES
(1, '{\"Osca id\":\"2472\",\"Last name\":\"KVGsUBo\",\"First name\":\"lKapN\",\"Middle name\":\"mED\",\"Extension\":\"848\",\"Birthday\":\"12\\/14\\/1963\",\"Age\":\"82\",\"Gender\":\"Male\",\"Civil status\":\"Widowed\",\"Religion id\":\"Roman Catholic\",\"Birth place\":\"wvTUesDIWT\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"194814\",\"Philhealth id\":\"7246982072\",\"Illness\":\"Diabetes\",\"Disability\":\"Visual Impairment\",\"Educational attainment\":\"High School\",\"Date of registration\":\"5\\/23\\/2009\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:19', '2025-04-06 05:58:19'),
(2, '{\"Osca id\":\"5081\",\"Last name\":\"fEDivXd\",\"First name\":\"lNNRE\",\"Middle name\":\"nmR\",\"Extension\":\"103\",\"Birthday\":\"8\\/20\\/1964\",\"Age\":\"92\",\"Gender\":\"Female\",\"Civil status\":\"Widowed\",\"Religion id\":\"Islam\",\"Birth place\":\"ZousRPUNDX\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"467429\",\"Philhealth id\":\"1002770495\",\"Illness\":\"Hypertension\",\"Disability\":\"None\",\"Educational attainment\":\"High School\",\"Date of registration\":\"2\\/25\\/2016\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:19', '2025-04-06 05:58:19'),
(3, '{\"Osca id\":\"9331\",\"Last name\":\"RTJMTxX\",\"First name\":\"bgSth\",\"Middle name\":\"riB\",\"Extension\":\"874\",\"Birthday\":\"3\\/18\\/1972\",\"Age\":\"97\",\"Gender\":\"Female\",\"Civil status\":\"Widowed\",\"Religion id\":\"Other\",\"Birth place\":\"uyFftpeSmU\",\"City\":\"Koronadal\",\"Barangay\":\"Avance?a (Barrio 3)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"779953\",\"Philhealth id\":\"2889490757\",\"Illness\":\"Diabetes\",\"Disability\":\"Visual Impairment\",\"Educational attainment\":\"College\",\"Date of registration\":\"6\\/7\\/2005\",\"Is active\":\"1\",\"Type\":\"non-pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:19', '2025-04-06 05:58:19'),
(4, '{\"Osca id\":\"2029\",\"Last name\":\"fHgolAQ\",\"First name\":\"EfZrB\",\"Middle name\":\"AFY\",\"Extension\":\"637\",\"Birthday\":\"9\\/5\\/1957\",\"Age\":\"91\",\"Gender\":\"Female\",\"Civil status\":\"Divorced\",\"Religion id\":\"Other\",\"Birth place\":\"GWnoilSCMS\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"865210\",\"Philhealth id\":\"7174418258\",\"Illness\":\"None\",\"Disability\":\"Hearing Impairment\",\"Educational attainment\":\"Elementary\",\"Date of registration\":\"7\\/18\\/2005\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20'),
(5, '{\"Osca id\":\"5285\",\"Last name\":\"DcTPaHw\",\"First name\":\"NjFiS\",\"Middle name\":\"SOr\",\"Extension\":\"463\",\"Birthday\":\"8\\/18\\/1961\",\"Age\":\"65\",\"Gender\":\"Male\",\"Civil status\":\"Married\",\"Religion id\":\"Other\",\"Birth place\":\"odGVstTsOc\",\"City\":\"Koronadal\",\"Barangay\":\"Avance?a (Barrio 3)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"171451\",\"Philhealth id\":\"6025609341\",\"Illness\":\"Hypertension\",\"Disability\":\"None\",\"Educational attainment\":\"High School\",\"Date of registration\":\"1\\/24\\/2022\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20'),
(6, '{\"Osca id\":\"9853\",\"Last name\":\"gUJAWds\",\"First name\":\"yENfo\",\"Middle name\":\"AAM\",\"Extension\":\"838\",\"Birthday\":\"7\\/15\\/1975\",\"Age\":\"37\",\"Gender\":\"Female\",\"Civil status\":\"Divorced\",\"Religion id\":\"Roman Catholic\",\"Birth place\":\"OioJsDLDsx\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"586650\",\"Philhealth id\":\"6317868818\",\"Illness\":\"Diabetes\",\"Disability\":\"Visual Impairment\",\"Educational attainment\":\"Elementary\",\"Date of registration\":\"2\\/17\\/2003\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20'),
(7, '{\"Osca id\":\"8734\",\"Last name\":\"ZQtezPU\",\"First name\":\"bIzLz\",\"Middle name\":\"cPN\",\"Extension\":\"137\",\"Birthday\":\"7\\/6\\/1968\",\"Age\":\"36\",\"Gender\":\"Male\",\"Civil status\":\"Widowed\",\"Religion id\":\"Baptist\",\"Birth place\":\"folnKOPdjt\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"215309\",\"Philhealth id\":\"1296557551\",\"Illness\":\"Diabetes\",\"Disability\":\"Hearing Impairment\",\"Educational attainment\":\"College\",\"Date of registration\":\"2\\/7\\/2015\",\"Is active\":\"1\",\"Type\":\"non-pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20'),
(8, '{\"Osca id\":\"8642\",\"Last name\":\"ITqmLOU\",\"First name\":\"sEUhR\",\"Middle name\":\"lJE\",\"Extension\":\"165\",\"Birthday\":\"10\\/11\\/1990\",\"Age\":\"92\",\"Gender\":\"Male\",\"Civil status\":\"Single\",\"Religion id\":\"Islam\",\"Birth place\":\"VvVpOIvCiv\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"973766\",\"Philhealth id\":\"9878099813\",\"Illness\":\"Hypertension\",\"Disability\":\"Visual Impairment\",\"Educational attainment\":\"High School\",\"Date of registration\":\"1\\/16\\/2004\",\"Is active\":\"1\",\"Type\":\"non-pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20'),
(9, '{\"Osca id\":\"1081\",\"Last name\":\"WfQoxfU\",\"First name\":\"jftGd\",\"Middle name\":\"xXt\",\"Extension\":\"946\",\"Birthday\":\"8\\/24\\/1978\",\"Age\":\"62\",\"Gender\":\"Male\",\"Civil status\":\"Married\",\"Religion id\":\"Islam\",\"Birth place\":\"cEeUpADmJV\",\"City\":\"Koronadal\",\"Barangay\":\"Santo Ni?o (Barrio 2)\",\"Purok\":\"Purok 1\",\"Gsis id\":\"225691\",\"Philhealth id\":\"4021398530\",\"Illness\":\"Hypertension\",\"Disability\":\"Visual Impairment\",\"Educational attainment\":\"College\",\"Date of registration\":\"8\\/10\\/2011\",\"Is active\":\"1\",\"Type\":\"pensioner\",\"error\":\"The selected barangay id is invalid.\"}', 1, 'The selected religion id is invalid. The selected city id is invalid. The selected barangay id is invalid. The selected purok id is invalid.', '2025-04-06 05:58:20', '2025-04-06 05:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `importer` varchar(255) NOT NULL,
  `processed_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_rows` int(10) UNSIGNED NOT NULL,
  `successful_rows` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `completed_at`, `file_name`, `file_path`, `importer`, `processed_rows`, `total_rows`, `successful_rows`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2025-04-06 05:58:20', 'import-1-master-list-importer-example-failed-rows.csv', '/home/yort/Desktop/kor_cswdo_scmss/storage/app/private/livewire-tmp/IVxYIU24VqEA8nTyBeDblDEqXIsLzv-metaaW1wb3J0LTEtbWFzdGVyLWxpc3QtaW1wb3J0ZXItZXhhbXBsZS1mYWlsZWQtcm93cy5jc3Y=-.csv', 'App\\Filament\\Imports\\MasterListImporter', 9, 9, 0, 1, '2025-04-06 05:58:18', '2025-04-06 05:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_batches`
--

INSERT INTO `job_batches` (`id`, `name`, `total_jobs`, `pending_jobs`, `failed_jobs`, `failed_job_ids`, `options`, `cancelled_at`, `created_at`, `finished_at`) VALUES
('9e9c737f-c2ea-4fbd-99d8-24725cd99cec', '', 1, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:4169:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:4:{s:9:\"columnMap\";a:22:{s:7:\"osca_id\";s:7:\"Osca id\";s:9:\"last_name\";s:9:\"Last name\";s:10:\"first_name\";s:10:\"First name\";s:11:\"middle_name\";s:11:\"Middle name\";s:9:\"extension\";s:9:\"Extension\";s:8:\"birthday\";s:8:\"Birthday\";s:3:\"age\";s:3:\"Age\";s:6:\"gender\";s:6:\"Gender\";s:12:\"civil_status\";s:12:\"Civil status\";s:11:\"religion_id\";s:11:\"Religion id\";s:11:\"birth_place\";s:11:\"Birth place\";s:7:\"city_id\";s:4:\"City\";s:11:\"barangay_id\";s:8:\"Barangay\";s:8:\"purok_id\";s:5:\"Purok\";s:7:\"gsis_id\";s:7:\"Gsis id\";s:13:\"philhealth_id\";s:13:\"Philhealth id\";s:7:\"illness\";s:7:\"Illness\";s:10:\"disability\";s:10:\"Disability\";s:22:\"educational_attainment\";s:22:\"Educational attainment\";s:20:\"date_of_registration\";s:20:\"Date of registration\";s:9:\"is_active\";s:9:\"Is active\";s:4:\"type\";s:4:\"Type\";}s:6:\"import\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Imports\\Models\\Import\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:13:\"jobConnection\";N;s:7:\"options\";a:0:{}}s:8:\"function\";s:2925:\"function () use ($columnMap, $import, $jobConnection, $options) {\n                    $import->touch(\'completed_at\');\n\n                    event(new \\Filament\\Actions\\Imports\\Events\\ImportCompleted($import, $columnMap, $options));\n\n                    if (! $import->user instanceof \\Illuminate\\Contracts\\Auth\\Authenticatable) {\n                        return;\n                    }\n\n                    $failedRowsCount = $import->getFailedRowsCount();\n\n                    \\Filament\\Notifications\\Notification::make()\n                        ->title($import->importer::getCompletedNotificationTitle($import))\n                        ->body($import->importer::getCompletedNotificationBody($import))\n                        ->when(\n                            ! $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->success(),\n                        )\n                        ->when(\n                            $failedRowsCount && ($failedRowsCount < $import->total_rows),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->warning(),\n                        )\n                        ->when(\n                            $failedRowsCount === $import->total_rows,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->danger(),\n                        )\n                        ->when(\n                            $failedRowsCount,\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->actions([\n                                \\Filament\\Notifications\\Actions\\Action::make(\'downloadFailedRowsCsv\')\n                                    ->label(trans_choice(\'filament-actions::import.notifications.completed.actions.download_failed_rows_csv.label\', $failedRowsCount, [\n                                        \'count\' => \\Illuminate\\Support\\Number::format($failedRowsCount),\n                                    ]))\n                                    ->color(\'danger\')\n                                    ->url(route(\'filament.imports.failed-rows.download\', [\'import\' => $import], absolute: false), shouldOpenInNewTab: true)\n                                    ->markAsRead(),\n                            ]),\n                        )\n                        ->when(\n                            ($jobConnection === \'sync\') ||\n                                (blank($jobConnection) && (config(\'queue.default\') === \'sync\')),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification\n                                ->persistent()\n                                ->send(),\n                            fn (\\Filament\\Notifications\\Notification $notification) => $notification->sendToDatabase($import->user, isEventDispatched: true),\n                        );\n                }\";s:5:\"scope\";s:29:\"Filament\\Actions\\ImportAction\";s:4:\"this\";N;s:4:\"self\";s:32:\"00000000000013f60000000000000000\";}\";s:4:\"hash\";s:44:\"/BZClbY8Hha9Ej9IzLL4bz8ku5B/M5XE4I6gODWk8Ik=\";}}}}', NULL, 1743947898, 1743947900),
('9e9c97b6-3406-4130-814f-93ba67bac1be', '', 2, 0, 0, '[]', 'a:2:{s:13:\"allowFailures\";b:1;s:7:\"finally\";a:1:{i:0;O:47:\"Laravel\\SerializableClosure\\SerializableClosure\":1:{s:12:\"serializable\";O:46:\"Laravel\\SerializableClosure\\Serializers\\Signed\":2:{s:12:\"serializable\";s:8622:\"O:46:\"Laravel\\SerializableClosure\\Serializers\\Native\":5:{s:3:\"use\";a:1:{s:4:\"next\";O:46:\"Filament\\Actions\\Exports\\Jobs\\ExportCompletion\":7:{s:11:\"\0*\0exporter\";O:39:\"App\\Filament\\Exports\\MasterListExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:39:\"App\\Filament\\Exports\\MasterListExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-04-06 15:39:32\";s:10:\"created_at\";s:19:\"2025-04-06 15:39:32\";s:2:\"id\";i:1;s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:39:\"App\\Filament\\Exports\\MasterListExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-04-06 15:39:32\";s:10:\"created_at\";s:19:\"2025-04-06 15:39:32\";s:2:\"id\";i:1;s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:28:{s:2:\"id\";s:2:\"ID\";s:7:\"osca_id\";s:7:\"Osca id\";s:9:\"last_name\";s:9:\"Last name\";s:10:\"first_name\";s:10:\"First name\";s:11:\"middle_name\";s:11:\"Middle name\";s:9:\"extension\";s:9:\"Extension\";s:8:\"birthday\";s:8:\"Birthday\";s:3:\"age\";s:3:\"Age\";s:6:\"gender\";s:6:\"Gender\";s:12:\"civil_status\";s:12:\"Civil status\";s:11:\"religion_id\";s:11:\"Religion id\";s:11:\"birth_place\";s:11:\"Birth place\";s:9:\"city.name\";s:4:\"City\";s:13:\"barangay.name\";s:8:\"Barangay\";s:10:\"purok.name\";s:5:\"Purok\";s:7:\"gsis_id\";s:7:\"Gsis id\";s:13:\"philhealth_id\";s:13:\"Philhealth id\";s:7:\"illness\";s:7:\"Illness\";s:10:\"disability\";s:10:\"Disability\";s:22:\"educational_attainment\";s:22:\"Educational attainment\";s:20:\"date_of_registration\";s:20:\"Date of registration\";s:9:\"is_active\";s:9:\"Is active\";s:15:\"registry_number\";s:15:\"Registry number\";s:13:\"date_of_death\";s:13:\"Date of death\";s:7:\"remarks\";s:7:\"Remarks\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";s:4:\"type\";s:4:\"Type\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:28:{s:2:\"id\";s:2:\"ID\";s:7:\"osca_id\";s:7:\"Osca id\";s:9:\"last_name\";s:9:\"Last name\";s:10:\"first_name\";s:10:\"First name\";s:11:\"middle_name\";s:11:\"Middle name\";s:9:\"extension\";s:9:\"Extension\";s:8:\"birthday\";s:8:\"Birthday\";s:3:\"age\";s:3:\"Age\";s:6:\"gender\";s:6:\"Gender\";s:12:\"civil_status\";s:12:\"Civil status\";s:11:\"religion_id\";s:11:\"Religion id\";s:11:\"birth_place\";s:11:\"Birth place\";s:9:\"city.name\";s:4:\"City\";s:13:\"barangay.name\";s:8:\"Barangay\";s:10:\"purok.name\";s:5:\"Purok\";s:7:\"gsis_id\";s:7:\"Gsis id\";s:13:\"philhealth_id\";s:13:\"Philhealth id\";s:7:\"illness\";s:7:\"Illness\";s:10:\"disability\";s:10:\"Disability\";s:22:\"educational_attainment\";s:22:\"Educational attainment\";s:20:\"date_of_registration\";s:20:\"Date of registration\";s:9:\"is_active\";s:9:\"Is active\";s:15:\"registry_number\";s:15:\"Registry number\";s:13:\"date_of_death\";s:13:\"Date of death\";s:7:\"remarks\";s:7:\"Remarks\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";s:4:\"type\";s:4:\"Type\";}s:10:\"\0*\0formats\";a:2:{i:0;E:47:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Csv\";i:1;E:48:\"Filament\\Actions\\Exports\\Enums\\ExportFormat:Xlsx\";}s:10:\"\0*\0options\";a:0:{}s:7:\"chained\";a:1:{i:0;s:3962:\"O:44:\"Filament\\Actions\\Exports\\Jobs\\CreateXlsxFile\":4:{s:11:\"\0*\0exporter\";O:39:\"App\\Filament\\Exports\\MasterListExporter\":3:{s:9:\"\0*\0export\";O:38:\"Filament\\Actions\\Exports\\Models\\Export\":30:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";N;s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:1;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:39:\"App\\Filament\\Exports\\MasterListExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-04-06 15:39:32\";s:10:\"created_at\";s:19:\"2025-04-06 15:39:32\";s:2:\"id\";i:1;s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:11:\"\0*\0original\";a:8:{s:7:\"user_id\";i:1;s:8:\"exporter\";s:39:\"App\\Filament\\Exports\\MasterListExporter\";s:10:\"total_rows\";i:2;s:9:\"file_disk\";s:5:\"local\";s:10:\"updated_at\";s:19:\"2025-04-06 15:39:32\";s:10:\"created_at\";s:19:\"2025-04-06 15:39:32\";s:2:\"id\";i:1;s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:10:\"\0*\0changes\";a:1:{s:9:\"file_name\";s:21:\"export-1-master-lists\";}s:8:\"\0*\0casts\";a:4:{s:12:\"completed_at\";s:9:\"timestamp\";s:14:\"processed_rows\";s:7:\"integer\";s:10:\"total_rows\";s:7:\"integer\";s:15:\"successful_rows\";s:7:\"integer\";}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:0:{}}s:12:\"\0*\0columnMap\";a:28:{s:2:\"id\";s:2:\"ID\";s:7:\"osca_id\";s:7:\"Osca id\";s:9:\"last_name\";s:9:\"Last name\";s:10:\"first_name\";s:10:\"First name\";s:11:\"middle_name\";s:11:\"Middle name\";s:9:\"extension\";s:9:\"Extension\";s:8:\"birthday\";s:8:\"Birthday\";s:3:\"age\";s:3:\"Age\";s:6:\"gender\";s:6:\"Gender\";s:12:\"civil_status\";s:12:\"Civil status\";s:11:\"religion_id\";s:11:\"Religion id\";s:11:\"birth_place\";s:11:\"Birth place\";s:9:\"city.name\";s:4:\"City\";s:13:\"barangay.name\";s:8:\"Barangay\";s:10:\"purok.name\";s:5:\"Purok\";s:7:\"gsis_id\";s:7:\"Gsis id\";s:13:\"philhealth_id\";s:13:\"Philhealth id\";s:7:\"illness\";s:7:\"Illness\";s:10:\"disability\";s:10:\"Disability\";s:22:\"educational_attainment\";s:22:\"Educational attainment\";s:20:\"date_of_registration\";s:20:\"Date of registration\";s:9:\"is_active\";s:9:\"Is active\";s:15:\"registry_number\";s:15:\"Registry number\";s:13:\"date_of_death\";s:13:\"Date of death\";s:7:\"remarks\";s:7:\"Remarks\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";s:4:\"type\";s:4:\"Type\";}s:10:\"\0*\0options\";a:0:{}}s:9:\"\0*\0export\";O:45:\"Illuminate\\Contracts\\Database\\ModelIdentifier\":5:{s:5:\"class\";s:38:\"Filament\\Actions\\Exports\\Models\\Export\";s:2:\"id\";i:1;s:9:\"relations\";a:0:{}s:10:\"connection\";s:5:\"mysql\";s:15:\"collectionClass\";N;}s:12:\"\0*\0columnMap\";a:28:{s:2:\"id\";s:2:\"ID\";s:7:\"osca_id\";s:7:\"Osca id\";s:9:\"last_name\";s:9:\"Last name\";s:10:\"first_name\";s:10:\"First name\";s:11:\"middle_name\";s:11:\"Middle name\";s:9:\"extension\";s:9:\"Extension\";s:8:\"birthday\";s:8:\"Birthday\";s:3:\"age\";s:3:\"Age\";s:6:\"gender\";s:6:\"Gender\";s:12:\"civil_status\";s:12:\"Civil status\";s:11:\"religion_id\";s:11:\"Religion id\";s:11:\"birth_place\";s:11:\"Birth place\";s:9:\"city.name\";s:4:\"City\";s:13:\"barangay.name\";s:8:\"Barangay\";s:10:\"purok.name\";s:5:\"Purok\";s:7:\"gsis_id\";s:7:\"Gsis id\";s:13:\"philhealth_id\";s:13:\"Philhealth id\";s:7:\"illness\";s:7:\"Illness\";s:10:\"disability\";s:10:\"Disability\";s:22:\"educational_attainment\";s:22:\"Educational attainment\";s:20:\"date_of_registration\";s:20:\"Date of registration\";s:9:\"is_active\";s:9:\"Is active\";s:15:\"registry_number\";s:15:\"Registry number\";s:13:\"date_of_death\";s:13:\"Date of death\";s:7:\"remarks\";s:7:\"Remarks\";s:10:\"created_at\";s:10:\"Created at\";s:10:\"updated_at\";s:10:\"Updated at\";s:4:\"type\";s:4:\"Type\";}s:10:\"\0*\0options\";a:0:{}}\";}s:19:\"chainCatchCallbacks\";a:0:{}}}s:8:\"function\";s:266:\"function (\\Illuminate\\Bus\\Batch $batch) use ($next) {\n                if (! $batch->cancelled()) {\n                    \\Illuminate\\Container\\Container::getInstance()->make(\\Illuminate\\Contracts\\Bus\\Dispatcher::class)->dispatch($next);\n                }\n            }\";s:5:\"scope\";s:27:\"Illuminate\\Bus\\ChainedBatch\";s:4:\"this\";N;s:4:\"self\";s:32:\"0000000000000b080000000000000000\";}\";s:4:\"hash\";s:44:\"VhYsZCXit5NjlF9NDHCgLbjTbKqKWxmv2VICNv792hY=\";}}}}', NULL, 1743953973, 1743953975);

-- --------------------------------------------------------

--
-- Table structure for table `master_lists`
--

CREATE TABLE `master_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `osca_id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `civil_status` varchar(255) NOT NULL,
  `religion_id` varchar(255) NOT NULL,
  `birth_place` varchar(255) NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `barangay_id` bigint(20) UNSIGNED NOT NULL,
  `purok_id` bigint(20) UNSIGNED NOT NULL,
  `gsis_id` varchar(255) DEFAULT 'N/A',
  `philhealth_id` varchar(255) DEFAULT 'N/A',
  `illness` varchar(255) DEFAULT 'N/A',
  `disability` varchar(255) DEFAULT 'N/A',
  `educational_attainment` varchar(255) NOT NULL,
  `date_of_registration` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `registry_number` text DEFAULT NULL,
  `date_of_death` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_lists`
--

INSERT INTO `master_lists` (`id`, `osca_id`, `last_name`, `first_name`, `middle_name`, `extension`, `birthday`, `age`, `gender`, `civil_status`, `religion_id`, `birth_place`, `city_id`, `barangay_id`, `purok_id`, `gsis_id`, `philhealth_id`, `illness`, `disability`, `educational_attainment`, `date_of_registration`, `is_active`, `registry_number`, `date_of_death`, `remarks`, `created_at`, `updated_at`, `type`) VALUES
(1, 93, 'Kautzer', 'Maribel', 'Murray Kuhlman', 'null', '1965-03-01', 60, 'M', 'married', '1', '1539 Skiles Coves', 1, 56, 57, 'null', 'null', 'null', 'N/A', 'master degree', '2024-06-19', 1, NULL, NULL, NULL, '2025-04-06 06:26:22', '2025-04-06 06:26:22', 'pensioner'),
(2, 388, 'Lehner', 'Amanda', 'Chandler Herman', 'null', '1964-08-06', 60, 'M', 'legally separated', '1', '236 Weber Radial', 1, 56, 57, 'null', 'null', 'null', 'N/A', 'elementary graduate', '2024-09-22', 1, NULL, NULL, NULL, '2025-04-06 07:39:05', '2025-04-06 07:39:05', 'pensioner');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2022_12_14_083707_create_settings_table', 1),
(5, '2024_12_04_025120_create_media_table', 1),
(6, '2024_12_04_041953_create_breezy_sessions_table', 1),
(7, '2025_01_01_120813_create_books_table', 1),
(8, '2025_01_02_064819_create_permission_tables', 1),
(9, '2025_01_02_225927_add_avatar_url_column_to_users_table', 1),
(10, '2025_01_03_114929_create_personal_access_tokens_table', 1),
(11, '2025_01_04_125650_create_posts_table', 1),
(12, '2025_01_08_152510_create_kaido_settings', 1),
(13, '2025_01_08_233142_create_socialite_users_table', 1),
(14, '2025_01_09_225908_update_user_table_make_password_column_nullable', 1),
(15, '2025_01_12_031340_create_notifications_table', 1),
(16, '2025_01_12_031357_create_imports_table', 1),
(17, '2025_01_12_031358_create_exports_table', 1),
(18, '2025_01_12_031359_create_failed_import_rows_table', 1),
(19, '2025_01_12_091355_create_contacts_table', 1),
(20, '2025_01_31_020024_add_themes_settings_to_users_table', 1),
(21, '2025_02_27_071122_create_religions_table', 2),
(22, '2025_02_27_071145_create_cities_table', 2),
(23, '2025_02_27_071157_create_barangays_table', 2),
(24, '2025_02_27_071210_create_puroks_table', 2),
(26, '2025_03_01_050113_create_activity_log_table', 2),
(27, '2025_03_01_050114_add_event_column_to_activity_log_table', 2),
(28, '2025_03_01_050115_add_batch_uuid_column_to_activity_log_table', 2),
(29, '2025_03_04_033458_create_benefits_table', 2),
(30, '2025_03_04_033853_create_payrolls_table', 2),
(31, '2025_03_04_034621_payroll_senior_citizen', 2),
(32, '2025_03_04_040810_drop_extension_from_master_lists_table', 2),
(33, '2025_03_04_040905_add_extension_to_master_lists_table', 2),
(34, '2025_03_04_041704_add_amount_to_payrolls_table', 2),
(35, '2025_03_04_044420_add_virtual_full_name_to_master_lists_table', 2),
(36, '2025_02_27_065310_create_master_lists_table', 3),
(37, '2025_02_27_073532_add_type_to_master_lists_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('da5d646d-7013-4085-92e1-460ca9a8fc47', 'Filament\\Notifications\\DatabaseNotification', 'App\\Models\\User', 1, '{\"actions\":[{\"name\":\"download_csv\",\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .csv\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/1\\/download?format=csv\",\"view\":\"filament-actions::link-action\"},{\"name\":\"download_xlsx\",\"color\":null,\"event\":null,\"eventData\":[],\"dispatchDirection\":false,\"dispatchToComponent\":null,\"extraAttributes\":[],\"icon\":null,\"iconPosition\":\"before\",\"iconSize\":null,\"isOutlined\":false,\"isDisabled\":false,\"label\":\"Download .xlsx\",\"shouldClose\":false,\"shouldMarkAsRead\":true,\"shouldMarkAsUnread\":false,\"shouldOpenUrlInNewTab\":true,\"size\":\"sm\",\"tooltip\":null,\"url\":\"\\/filament\\/exports\\/1\\/download?format=xlsx\",\"view\":\"filament-actions::link-action\"}],\"body\":\"Your master list export has completed and 2 rows exported.\",\"color\":null,\"duration\":\"persistent\",\"icon\":\"heroicon-o-check-circle\",\"iconColor\":\"success\",\"status\":\"success\",\"title\":\"Export completed\",\"view\":\"filament-notifications::notification\",\"viewData\":[],\"format\":\"filament\"}', '2025-04-06 07:39:43', '2025-04-06 07:39:36', '2025-04-06 07:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `benefit_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `benefit_id`, `amount`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 500.00, 'Firts quarter', 'new', '2025-04-06 06:28:37', '2025-04-06 06:28:37');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_senior_citizen`
--

CREATE TABLE `payroll_senior_citizen` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payroll_id` bigint(20) UNSIGNED NOT NULL,
  `master_list_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payroll_senior_citizen`
--

INSERT INTO `payroll_senior_citizen` (`id`, `payroll_id`, `master_list_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Unclaimed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(2, 'view_any_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(3, 'create_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(4, 'update_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(5, 'delete_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(6, 'delete_any_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(7, 'publish_activity', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(8, 'view_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(9, 'view_any_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(10, 'create_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(11, 'update_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(12, 'delete_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(13, 'delete_any_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(14, 'publish_benefit', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(15, 'view_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(16, 'view_any_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(17, 'create_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(18, 'update_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(19, 'restore_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(20, 'restore_any_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(21, 'replicate_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(22, 'reorder_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(23, 'delete_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(24, 'delete_any_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(25, 'force_delete_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(26, 'force_delete_any_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(27, 'book:create_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(28, 'book:update_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(29, 'book:delete_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(30, 'book:pagination_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(31, 'book:detail_book', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(32, 'view_master::list', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17'),
(33, 'view_any_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(34, 'create_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(35, 'update_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(36, 'restore_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(37, 'restore_any_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(38, 'replicate_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(39, 'reorder_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(40, 'delete_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(41, 'delete_any_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(42, 'force_delete_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(43, 'force_delete_any_master::list', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(44, 'view_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(45, 'view_any_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(46, 'create_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(47, 'update_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(48, 'restore_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(49, 'restore_any_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(50, 'replicate_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(51, 'reorder_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(52, 'delete_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(53, 'delete_any_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(54, 'force_delete_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(55, 'force_delete_any_payroll', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(56, 'view_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(57, 'view_any_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(58, 'create_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(59, 'update_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(60, 'delete_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(61, 'delete_any_role', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(62, 'view_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(63, 'view_any_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(64, 'create_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(65, 'update_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(66, 'restore_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(67, 'restore_any_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(68, 'replicate_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(69, 'reorder_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(70, 'delete_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(71, 'delete_any_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(72, 'force_delete_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(73, 'force_delete_any_user', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(74, 'page_ManageSetting', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(75, 'page_Themes', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(76, 'page_MyProfilePage', 'web', '2025-04-06 05:50:18', '2025-04-06 05:50:18'),
(77, 'widget_TotalActiveSeniors', 'web', '2025-04-06 05:50:19', '2025-04-06 05:50:19'),
(78, 'widget_SeniorCitizenPerBarangayChart', 'web', '2025-04-06 05:50:19', '2025-04-06 05:50:19'),
(79, 'widget_SeniorPopulationChart', 'web', '2025-04-06 05:50:19', '2025-04-06 05:50:19'),
(80, 'widget_SeniorCitizensByBarangayTable', 'web', '2025-04-06 05:50:19', '2025-04-06 05:50:19');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `puroks`
--

CREATE TABLE `puroks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barangay_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `puroks`
--

INSERT INTO `puroks` (`id`, `barangay_id`, `name`, `created_at`, `updated_at`) VALUES
(57, 56, 'Purok 1', '2025-04-06 06:15:35', '2025-04-06 06:15:35');

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Roman Catholic', '2025-04-06 05:58:53', '2025-04-06 05:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super_admin', 'web', '2025-04-06 05:50:17', '2025-04-06 05:50:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
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
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('et11Wjn8A61xbLbTyLXS2j831kcXWYOtbh4HiQsn', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiV2dkZjNkRFloZ01EbjhkWWFZSkJ1YnFneDY1TGNGa3ZReGxLaE1VcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYXN0ZXItbGlzdHMiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzNkYzdhOTEzZWY1ZmQ0Yjg5MGVjYWJlMzQ4NzA4NTU3M2UxNmNmODIiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEyJGsuMWV1MUpKdTVUOTlpUFNXbXpzbC5RSVdscFN5S1Q2LkVTNHd5U2ZoSThLS1R5YTJ5VFRxIjtzOjg6ImZpbGFtZW50IjthOjA6e319', 1743954837);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'KaidoSetting', 'site_name', 0, '\"Senior Citizen Management Support System\"', '2025-04-06 05:40:55', '2025-04-06 06:33:47'),
(2, 'KaidoSetting', 'site_active', 0, 'true', '2025-04-06 05:40:55', '2025-04-06 06:33:47'),
(3, 'KaidoSetting', 'registration_enabled', 0, 'false', '2025-04-06 05:40:55', '2025-04-06 06:33:47'),
(4, 'KaidoSetting', 'login_enabled', 0, 'true', '2025-04-06 05:40:55', '2025-04-06 06:33:47'),
(5, 'KaidoSetting', 'password_reset_enabled', 0, 'false', '2025-04-06 05:40:55', '2025-04-06 06:33:47'),
(6, 'KaidoSetting', 'sso_enabled', 0, 'true', '2025-04-06 05:40:55', '2025-04-06 06:33:47');

-- --------------------------------------------------------

--
-- Table structure for table `socialite_users`
--

CREATE TABLE `socialite_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(255) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT 'default',
  `theme_color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar_url`, `theme`, `theme_color`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$k.1eu1JJu5T99iPSWmzsl.QIWlpSyKT6.ES4wySfhI8KKTya2yTTq', 'N51lQh27Nk0viOU7vQg1BHdqlwRws7RCzBpqNR3B9TpL8hqO6nOuIbYb7FZ9', '2025-04-06 05:50:51', '2025-04-06 05:50:51', NULL, 'default', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barangays`
--
ALTER TABLE `barangays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breezy_sessions_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exports`
--
ALTER TABLE `exports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exports_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_import_rows_import_id_foreign` (`import_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imports_user_id_foreign` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_lists`
--
ALTER TABLE `master_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_lists_city_id_foreign` (`city_id`),
  ADD KEY `master_lists_barangay_id_foreign` (`barangay_id`),
  ADD KEY `master_lists_purok_id_foreign` (`purok_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_benefit_id_foreign` (`benefit_id`);

--
-- Indexes for table `payroll_senior_citizen`
--
ALTER TABLE `payroll_senior_citizen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `puroks`
--
ALTER TABLE `puroks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `puroks_barangay_id_foreign` (`barangay_id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_group_name_unique` (`group`,`name`);

--
-- Indexes for table `socialite_users`
--
ALTER TABLE `socialite_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialite_users_provider_provider_id_unique` (`provider`,`provider_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `barangays`
--
ALTER TABLE `barangays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exports`
--
ALTER TABLE `exports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `master_lists`
--
ALTER TABLE `master_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payroll_senior_citizen`
--
ALTER TABLE `payroll_senior_citizen`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `puroks`
--
ALTER TABLE `puroks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `socialite_users`
--
ALTER TABLE `socialite_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exports`
--
ALTER TABLE `exports`
  ADD CONSTRAINT `exports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `failed_import_rows`
--
ALTER TABLE `failed_import_rows`
  ADD CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `imports`
--
ALTER TABLE `imports`
  ADD CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `master_lists`
--
ALTER TABLE `master_lists`
  ADD CONSTRAINT `master_lists_barangay_id_foreign` FOREIGN KEY (`barangay_id`) REFERENCES `barangays` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `master_lists_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `master_lists_purok_id_foreign` FOREIGN KEY (`purok_id`) REFERENCES `puroks` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD CONSTRAINT `payrolls_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `puroks`
--
ALTER TABLE `puroks`
  ADD CONSTRAINT `puroks_barangay_id_foreign` FOREIGN KEY (`barangay_id`) REFERENCES `barangays` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
