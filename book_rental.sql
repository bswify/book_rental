-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2019 at 06:40 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL COMMENT 'รหัสหนังสือ',
  `book_name` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อหนังสือ',
  `book_description` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายละเอียดหนังสือ',
  `book_price` int(11) NOT NULL COMMENT 'ราคาหนังสือ',
  `booktype_id` int(11) NOT NULL COMMENT 'รหัสประเภทหนังสือ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booktype`
--

CREATE TABLE `booktype` (
  `booktype_id` int(11) NOT NULL COMMENT 'รหัสประเภทหนังสือ',
  `booktype_name` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อประเภทหนังสือ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_rental_order`
--

CREATE TABLE `book_rental_order` (
  `book_rental_order_id` int(11) NOT NULL COMMENT 'รหัสรายการเช่าหนังสือ',
  `order_detail_id` int(11) NOT NULL COMMENT 'รหัสรายละเอียดการเช่าหนังสือ',
  `book_rental_order_date_start` datetime DEFAULT NULL COMMENT 'วันที่เช่าหนังสือ',
  `book_rental_order_date_end` datetime DEFAULT NULL COMMENT 'วันที่คืนหนังสือ',
  `renter_id` int(11) NOT NULL COMMENT 'รหัสผู้เช่า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL COMMENT 'รหัสรายละเอียดการเช่าหนังสือ',
  `book_id` int(11) NOT NULL COMMENT 'รหัสหนังสือ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `renter`
--

CREATE TABLE `renter` (
  `renter_id` int(11) NOT NULL COMMENT 'รหัสผู้เช่า',
  `renter_first_name` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'ชื่อผู้เช่า',
  `renter_last_name` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'นามสกุลผู้เช่า',
  `renter_tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'เบอร์ผู้เช่า',
  `renter_sex` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'เพศผู้เช่า'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin Admin', 'admin@material.com', '2019-07-29 20:36:21', '$2y$10$lW8JEJjEKbFLPoEa6bsDc.vx1T8bStz24IcHSmmVm0LBayBiqAlR.', NULL, '2019-07-29 20:36:21', '2019-07-29 20:36:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `booktype`
--
ALTER TABLE `booktype`
  ADD PRIMARY KEY (`booktype_id`);

--
-- Indexes for table `book_rental_order`
--
ALTER TABLE `book_rental_order`
  ADD PRIMARY KEY (`book_rental_order_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`,`book_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `renter`
--
ALTER TABLE `renter`
  ADD PRIMARY KEY (`renter_id`);

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
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสหนังสือ';

--
-- AUTO_INCREMENT for table `booktype`
--
ALTER TABLE `booktype`
  MODIFY `booktype_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสประเภทหนังสือ';

--
-- AUTO_INCREMENT for table `book_rental_order`
--
ALTER TABLE `book_rental_order`
  MODIFY `book_rental_order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายการเช่าหนังสือ';

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสรายละเอียดการเช่าหนังสือ';

--
-- AUTO_INCREMENT for table `renter`
--
ALTER TABLE `renter`
  MODIFY `renter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสผู้เช่า';

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
