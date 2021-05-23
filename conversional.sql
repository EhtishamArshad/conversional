-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2021 at 07:30 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `conversional`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`) VALUES
(1, 'Tom'),
(2, 'Henry');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_data` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `customer_id`, `start_date`, `end_date`, `invoice_data`, `created_at`, `updated_at`) VALUES
(10, '1', '2021-01-01', '2021-01-31', '{\"1\":{\"Registration\":[\"2021-01-01\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"2\":{\"Registration\":[\"2021-01-01\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"4\":{\"Registration\":[\"2021-01-15\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"8\":{\"Registration\":[\"2020-11-03\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0},\"9\":{\"Registration\":[\"2021-01-22\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"10\":{\"Registration\":[\"2020-12-01\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0}}', '2021-05-23 12:14:18', '2021-05-23 12:14:18'),
(11, '1', '2021-01-01', '2021-01-31', '{\"1\":{\"Registration\":[\"2021-01-01\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"2\":{\"Registration\":[\"2021-01-01\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0.49},\"4\":{\"Registration\":[\"2021-01-15\"],\"Activation\":[\"2021-01-10\",\"2021-01-01\"],\"Appointment\":{\"2\":\"2021-01-01\",\"3\":\"2021-12-01\"},\"Invoice total\":3.99},\"8\":{\"Registration\":[\"2020-11-03\"],\"Activation\":[],\"Appointment\":[],\"Invoice total\":0},\"9\":{\"Registration\":[\"2021-01-22\"],\"Activation\":[\"2021-01-17\"],\"Appointment\":[],\"Invoice total\":0.99},\"10\":{\"Registration\":[\"2020-12-01\"],\"Activation\":[\"2021-01-22\",\"2021-01-10\",\"2021-01-11\",\"2021-01-13\"],\"Appointment\":[],\"Invoice total\":0.5}}', '2021-05-23 12:21:40', '2021-05-23 12:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2014_10_12_000000_create_users_table', 1),
(27, '2014_10_12_100000_create_password_resets_table', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2021_05_22_135512_create_customers_table', 1),
(30, '2021_05_22_141837_create_sessions_table', 1),
(33, '2021_05_22_143747_create_invoices_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `appointment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `activated`, `appointment`) VALUES
(10, '4', '2021-01-10', ''),
(11, '4', '2021-01-01', ''),
(12, '4', '', '2021-01-01'),
(13, '4', '', '2021-12-01'),
(14, '8', '', ''),
(15, '9', '2021-01-17', ''),
(16, '10', '2021-01-22', ''),
(17, '10', '2021-01-10', ''),
(18, '10', '2021-01-11', ''),
(19, '10', '2021-01-13', ''),
(20, '3', '', '2021-01-21'),
(21, '5', '', '2020-12-01'),
(22, '5', '2021-01-16', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  `created` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `customer_id`, `created`) VALUES
(1, 'tl@conversional.de', 1, '2021-01-01'),
(2, 'ch@conversional.de', 1, '2021-01-01'),
(3, 'test@conversional.de', 2, '2021-01-01'),
(4, 'anton.steiger@web.de', 1, '2021-01-15'),
(5, 'user@test.de', 2, '2021-01-14'),
(6, 'hallo@conversional.de', 2, '2020-05-01'),
(7, 'support@conversional.de', 2, '2019-01-01'),
(8, 'billing@conversional.de', 1, '2020-11-03'),
(9, 'admin@conversional.de', 1, '2021-01-22'),
(10, 'bonjour@conversional.fr', 1, '2020-12-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_id_unique` (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_id_unique` (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_id_unique` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
