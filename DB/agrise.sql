-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2026 at 07:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agrise`
--

-- --------------------------------------------------------

--
-- Table structure for table `2026_crop_master`
--

CREATE TABLE `2026_crop_master` (
  `id` int(11) NOT NULL,
  `crop_category_id` int(11) DEFAULT NULL,
  `crop_title` varchar(20) NOT NULL,
  `crop_image` varchar(200) NOT NULL,
  `crop_status` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `2026_crop_master`
--

INSERT INTO `2026_crop_master` (`id`, `crop_category_id`, `crop_title`, `crop_image`, `crop_status`, `sort_order`) VALUES
(1, 6, 'Red Chilli', 'https://static.vecteezy.com/system/resources/thumbnails/035/208/337/small/red-chili-png.png', 1, 1),
(2, 6, 'Green Chilli', 'https://healthybuddha.in/image/cache/catalog/31GreenChilli-500x515.jpg', 1, 2),
(3, 4, 'Tomato', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3Dr25eJjpZaJbVOBGk6Mg5QyfdSa7FMp88Q&s', 1, 3),
(4, 4, 'Potato', 'https://www.alimentarium.org/sites/default/files/media/image/2017-02/AL027-01_pomme_de_terre_0_0.jpg', 1, 4),
(5, 4, 'Onion', 'https://images.apollo247.in/pd-cms/cms/2025-05/AdobeStock_1309389327_Preview.webp?tr=q-80,f-webp,w-400,dpr-2.5,c-at_max%201000w', 1, 5),
(6, 1, 'Garlic', 'https://images.jdmagicbox.com/quickquotes/images_main/lehsun-garlic-2217666961-uxcv282o.jpg', 1, 6),
(7, 4, 'Brinjal', 'https://freshindiaorganics.com/cdn/shop/products/Aubergine-Edited.jpg?v=1686911951', 1, 7),
(8, 4, 'Cabbage', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTinWxz3NO5x6TQouik-pfig9HFRJAdFI4MUmTRXg6wkmFnblEdtBvFQrzKzT88rMJxPr8&usqp=CAU', 1, 8),
(9, 4, 'Cauliflower', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5-qovZ0FCqah6IyWZmH9f7wbKgEtqE4qUqw&s', 1, 9),
(10, 2, 'Capsicum', 'https://www.veggycation.com.au/siteassets/veggycationvegetable/capsicum-green.jpg', 1, 10),
(11, 7, 'ff', 'ff', 1, 11),
(13, 1, 'Test', 'uploads/media/2026/download.jpeg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `2026_crop_steps`
--

CREATE TABLE `2026_crop_steps` (
  `id` int(11) NOT NULL,
  `service_id` int(11) DEFAULT NULL,
  `crop_id` int(11) DEFAULT NULL,
  `steps_title` varchar(255) DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `steps_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2026_crop_steps`
--

INSERT INTO `2026_crop_steps` (`id`, `service_id`, `crop_id`, `steps_title`, `no_of_days`, `steps_image`) VALUES
(1, 2, 7, '7-title1', 3, NULL),
(2, 2, 7, '7-title2', 2, NULL),
(3, 2, 7, '7-title3', 4, NULL),
(4, 2, 8, '8-title21', 3, NULL),
(5, 1, 8, '8-title1', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2026_crop_step_details`
--

CREATE TABLE `2026_crop_step_details` (
  `id` int(11) NOT NULL,
  `crop_step_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `step_details` longtext NOT NULL,
  `preventive_measures_details` longtext DEFAULT NULL,
  `control_measures_details` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `2026_crop_step_details`
--

INSERT INTO `2026_crop_step_details` (`id`, `crop_step_id`, `image`, `step_details`, `preventive_measures_details`, `control_measures_details`) VALUES
(1, 1, '1.png', 'test1', NULL, NULL),
(2, 1, '2.png', 'test2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `2026_services`
--

CREATE TABLE `2026_services` (
  `id` int(11) NOT NULL,
  `service_title` varchar(30) NOT NULL,
  `service_image` text NOT NULL,
  `page_route` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `2026_services`
--

INSERT INTO `2026_services` (`id`, `service_title`, `service_image`, `page_route`) VALUES
(1, 'Crop Advisory', 'https://static.vecteezy.com/system/resources/previews/002/565/508/non_2x/crop-insurance-icon-on-white-vector.jpg', ''),
(2, 'SOP', 'https://agri.seleconit.com/uploads/media/services/service1.png', ''),
(3, 'Soil Health Card', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(4, 'Fertilizer Calculator', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(5, 'Climate Resilient Technology', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(6, 'Pest & Diseases', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(7, 'Market Price', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(8, 'DBT', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', ''),
(9, 'Warehouse', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdSvWSr1OqX9cZ9KosAjBAIScXcaQUkl0rKKFiFTfUeI80qX53liWwtamW5RnMWUe1Xio&usqp=CAU', '');

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `alternate_mobile` varchar(24) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `landmark` varchar(128) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `area` varchar(256) DEFAULT NULL,
  `pincode` varchar(512) DEFAULT NULL,
  `system_pincode` tinyint(4) NOT NULL DEFAULT 1,
  `country_code` int(11) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `name`, `type`, `mobile`, `alternate_mobile`, `address`, `landmark`, `area_id`, `city_id`, `city`, `area`, `pincode`, `system_pincode`, `country_code`, `state`, `country`, `latitude`, `longitude`, `is_default`) VALUES
(1, 0, 'Abhishek', 'Home', '9510731828', NULL, '112, Rajkot, Rajkot, Gujarat, 364450', NULL, NULL, NULL, 'Rajkot', 'Rajkot', '364450', 1, 0, 'Gujarat', NULL, NULL, NULL, 0),
(6, 12, 'test test', 'Home', '7777777777', NULL, 'CTS No. 471 A, Sadar Bazar, Satara, Maharashtra, 415001, India, Satara, Maharashtra, 415001', NULL, NULL, NULL, 'Satara', 'Sadar Bazar, Satara, Maharashtra, 415001, India', '415001', 1, 0, 'Maharashtra', NULL, NULL, NULL, 1),
(7, 14, 'test T', 'Home', '12345678808', NULL, 'RK Supreme, Mavdi, Rajkot, Gujarat, 360005, India, Rajkot, Gujarat, 360005', NULL, NULL, NULL, 'Rajkot', 'Mavdi, Rajkot, Gujarat, 360005, India', '360005', 1, 0, 'Gujarat', NULL, NULL, NULL, 1),
(8, 12, 'test test', 'Home', '7777777777', NULL, 'Patel Cornar, Malhar Peth, Satara, Maharashtra, 415001, India, Satara, Maharashtra, 415001', NULL, NULL, NULL, 'Satara', 'Malhar Peth, Satara, Maharashtra, 415001, India', '415001', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(9, 12, 'test test', 'Home', '7777777777', NULL, 'Patel Cornar, Malhar Peth, Satara, Maharashtra, 415001, India, Satara, Maharashtra, 415001', NULL, NULL, NULL, 'Satara', 'Malhar Peth, Satara, Maharashtra, 415001, India', '415001', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(10, 12, 'test test', 'Home', '7777777777', NULL, 'Gat No 1038 At Post Pargaon Tal Khandala Dist, Khandala, Maharashtra, 412802, India, Khandala, Maharashtra, 412802', NULL, NULL, NULL, 'Khandala', 'Khandala, Maharashtra, 412802, India', '412802', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(11, 12, 'test test', 'Home', '7777777777', NULL, 'At POst Patkhal, Wasole, Maharashtra, 415011, India, Wasole, Maharashtra, 415011', NULL, NULL, NULL, 'Wasole', 'Wasole, Maharashtra, 415011, India', '415011', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(12, 12, 'test test', 'Home', '7777777777', NULL, 'P25G+P9Q, Sangamnagar, Satara, Maharashtra, 415001, India, Satara, Maharashtra, 415001', NULL, NULL, NULL, 'Satara', 'Sangamnagar, Satara, Maharashtra, 415001, India', '415001', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(13, 12, 'test test', 'Home', '7777777777', NULL, 'Near Shushma Petrol Pump Wadhe Phata, Tamjai Nagar, Satara, Maharashtra, 415001, India, Satara, Maharashtra, 415001', NULL, NULL, NULL, 'Satara', 'Tamjai Nagar, Satara, Maharashtra, 415001, India', '415001', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(14, 12, 'test test', 'Home', '7777777777', NULL, 'P27P+W29, Wadhe, Maharashtra, 415011, India, Wadhe, Maharashtra, 415011', NULL, NULL, NULL, 'Wadhe', 'Wadhe, Maharashtra, 415011, India', '415011', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(15, 12, 'sachin', 'Home', '9850500077', NULL, 'Move the map to select location', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0),
(16, 12, 'test test', 'Home', '7777777777', NULL, 'Aai bunglow Sarve no. 14/1, Aditya Nagari, Khed, Maharashtra, 415003, India, Khed, Maharashtra, 415003', NULL, NULL, NULL, 'Khed', 'Aditya Nagari, Khed, Maharashtra, 415003, India', '415003', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0),
(17, 12, 'test test', 'Home', '7777777777', NULL, '1777, Kurla, Mumbai, Maharashtra, 400070, India, Mumbai, Maharashtra, 400070', NULL, NULL, NULL, 'Mumbai', 'Kurla, Mumbai, Maharashtra, 400070, India', '400070', 1, 0, 'Maharashtra', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `city_id` int(11) NOT NULL,
  `zipcode_id` int(11) DEFAULT 0,
  `minimum_free_delivery_order_amount` double NOT NULL DEFAULT 100,
  `delivery_charges` double DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `attribute_set_id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_set_id`, `name`, `type`, `date_created`, `status`) VALUES
(1, 1, 'test 1', NULL, '2026-03-09 09:45:33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_set`
--

CREATE TABLE `attribute_set` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_set`
--

INSERT INTO `attribute_set` (`id`, `name`, `status`) VALUES
(1, 'test 1', 1),
(2, 'at 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `filterable` int(11) DEFAULT 0,
  `value` varchar(1024) NOT NULL,
  `swatche_type` varchar(512) DEFAULT NULL,
  `swatche_value` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `attribute_id`, `filterable`, `value`, `swatche_type`, `swatche_value`, `status`) VALUES
(1, 1, 0, '1', '2', 'uploads/media/2026/download.jpeg', 1),
(2, 1, 0, '2', '2', 'uploads/media/2026/v-4banner1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `image` text NOT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `is_saved_for_later` int(11) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `notification_sended` int(128) NOT NULL DEFAULT 0 COMMENT '0:not send|1:sended'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_variant_id`, `qty`, `is_saved_for_later`, `date_created`, `notification_sended`) VALUES
(36, 14, 3, 1, 0, '2026-02-10 06:54:16', 0),
(38, 12, 3, 1, 0, '2026-02-15 04:37:04', 0),
(39, 17, 1, 1, 0, '2026-02-19 08:54:05', 0),
(40, 12, 5, 1, 0, '2026-02-20 09:33:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `banner` text DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT NULL,
  `clicks` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `image`, `banner`, `row_order`, `status`, `clicks`) VALUES
(1, 'Uncategorized', 0, '', 'uploads/media/2020/', 'uploads/media/2020/', 0, NULL, 0),
(111, 'Insetcides', 0, 'insetcides', 'uploads/media/2025/insecticides.jpg', NULL, 0, 1, 22),
(112, 'Nutrients', 0, 'nutrients', 'uploads/media/2025/nutrients.webp', NULL, 0, 1, 26),
(113, 'Fungicides', 0, 'fungicides', 'uploads/media/2025/Fungicides.jpg', '', 0, 1, 8),
(114, 'Vegetables and Fruit Seeds', 0, 'vegetables-and-fruit-seeds', 'uploads/media/2025/Vegetables_and_Fruit_Seeds.webp', NULL, 0, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `chat_media`
--

CREATE TABLE `chat_media` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `original_file_name` text NOT NULL,
  `file_name` text NOT NULL,
  `file_extension` varchar(64) NOT NULL,
  `file_size` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `minimum_free_delivery_order_amount` varchar(128) DEFAULT NULL,
  `delivery_charges` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_api_keys`
--

CREATE TABLE `client_api_keys` (
  `id` int(11) NOT NULL,
  `name` mediumtext DEFAULT NULL,
  `secret` mediumtext NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_api_keys`
--

INSERT INTO `client_api_keys` (`id`, `name`, `secret`, `status`) VALUES
(1, 'eShop App', '65c9cd19cd138f19ddf2f6320c7a802ee936c548', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numeric_code` char(3) DEFAULT NULL,
  `iso2` char(2) DEFAULT NULL,
  `phonecode` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `tld` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `subregion` varchar(255) DEFAULT NULL,
  `timezones` text DEFAULT NULL,
  `translations` text DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `emoji` varchar(191) DEFAULT NULL,
  `emojiU` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `flag` tinyint(1) NOT NULL DEFAULT 1,
  `wikiDataId` varchar(255) DEFAULT NULL COMMENT 'Rapid API GeoDB Cities'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `iso3`, `numeric_code`, `iso2`, `phonecode`, `capital`, `currency`, `currency_name`, `currency_symbol`, `tld`, `native`, `region`, `subregion`, `timezones`, `translations`, `latitude`, `longitude`, `emoji`, `emojiU`, `created_at`, `updated_at`, `flag`, `wikiDataId`) VALUES
(1, 'India', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-19 17:51:23', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_notifications`
--

CREATE TABLE `custom_notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_sms`
--

CREATE TABLE `custom_sms` (
  `id` int(11) NOT NULL,
  `title` varchar(2048) NOT NULL,
  `message` varchar(4096) NOT NULL,
  `type` varchar(64) NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `custom_sms`
--

INSERT INTO `custom_sms` (`id`, `title`, `message`, `type`, `date_sent`) VALUES
(1, 'Your Order Has Been Placed - Order #{order.id}', 'Dear {user.username},\\r\\n\\r\\nThank you for placing your order with {system.company_name}. We are thrilled to confirm that your order has been successfully placed and is now being processed. Please find the details of your order below:\\r\\n\\r\\nOrder Number: #{order.id}\\r\\nOrder Date: {order.date_added}\\r\\nDelivery Address: {order.address}\\r\\n\\r\\n...\\r\\nTotal Amount: ${order.total}\\r\\n\\r\\nPayment Information:\\r\\n----------------------------------------\\r\\nPayment Method: {order.payment_method}\\r\\n\\r\\nDelivery Information:\\r\\n----------------------------------------\\r\\nYour order will be delivered to the following address:\\r\\n{order.address}\\r\\n\\r\\nEstimated Delivery Date: {order.delivery_date}\\r\\n\\r\\nIf you have any questions or need further assistance with your order, please don\'t hesitate to contact our customer support team at \\r\\n{system.support_email} or {system.support_number}.\\r\\n\\r\\nThank you for choosing {system.company_name}. We appreciate your business and look forward to serving you. Your satisfaction is our priority.\\r\\n\\r\\nSincerely,\\r\\nThe {system.company_name} Team', 'place_order', '2023-11-02 09:19:07'),
(2, 'Cashback/Discount Settlement', 'Hello {user.username},\\r\\n\\r\\nGood news! Your cashback/discount has been successfully settled:\\r\\n\\r\\nYour cashback/discount has been credited to your account. Enjoy the savings!\\r\\n\\r\\nFor any questions, contact us at {system.support_number}. Thanks for choosing {system.company_name}.', 'settle_cashback_discount', '2023-11-02 09:22:51'),
(3, 'Order Confirmation - Your Order Is Received', 'Hello {user.username},\\r\\n\\r\\nYour order #{order.id} has been received by {system.company_name} We\'re working diligently to prepare and deliver your items.\\r\\n\\r\\nOrder Date: {order.date_added}\\r\\nTotal Amount: {system.currency}{order.total}\\r\\nEstimated Delivery Date: {order.delivery_date}\\r\\n\\r\\nWe\'ll keep you informed on your order\'s progress. For questions or support, contact us at {system.support_number}.\\r\\n\\r\\nThank you for shopping with us.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_received', '2023-11-02 09:29:35'),
(4, 'Order Processing Update', 'Hello {user.username},\\r\\n\\r\\nGreat news! Your order #{order.id} is now being processed. Here are the details:\\r\\n- Order Date: {order.date_added}\\r\\n- Estimated Delivery Date: {order.delivery_date}\\r\\n\\r\\nYour order will arrive by {order.delivery_date}. Any questions? Contact us at {system.support_number} Thank you for shopping with us.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_processed', '2023-11-02 09:32:04'),
(5, 'Your Order Has Been Shipped', 'Hello {user.username},\\r\\n\\r\\nExciting news! Your order #{order.id}has been shipped. \\r\\n\\r\\nEstimated Delivery: {order.delivery_date}\\r\\n\\r\\n\\r\\nFor any questions, contact us at {system.support_number}. We\'re here to help!\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_shipped', '2023-11-02 09:43:09'),
(6, 'Your Order Has Been Delivered', 'Hello {user.username},\\r\\n\\r\\nGreat news! Your order #{order.id} has been delivered. We hope you\'re enjoying your purchase. Here are the delivery\\r\\n\\r\\nDelivery Date: {order.delivery_date}\\r\\n\\r\\nIf you have any questions or need assistance, please contact us at {system.support_number}. Your satisfaction is important to us.\\r\\n\\r\\nThank you for choosing {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_delivered', '2023-11-02 09:47:33'),
(7, 'Order Cancellation Confirmation', 'Hello {user.username},\\r\\n\\r\\nWe\'ve received your order cancellation request for order #{order.id}. Here are the details:\\r\\nOrder Date: {order.date_added}\\r\\n\\r\\nYou will receive a refund of {transactions.currency_code}{transactions.amount} via {transactions.type}. Please take a note of it .\\r\\n\\r\\nFor assistance, contact us at {system.support_number}. Thank you for choosing {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_cancelled', '2023-11-02 09:52:54'),
(8, 'Order Return Confirmation', 'Hello {user.mobile},\\r\\n\\r\\nYour order #{return_requests.order_id} has been successfully returned. Return Details:\\r\\n- Return Date: {return_requests.date_created}\\r\\n- Reason: {return_requests.remarks}\\r\\n- Status: {return_requests.status}\\r\\n\\r\\n\\r\\nFor assistance, contact us at {system.support_number}.\\r\\n\\r\\nThank you for choosing {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_returned', '2023-11-02 09:56:29'),
(9, 'Your Order Return Request - Declined', 'Hello {user.username},\\r\\n\\r\\nWe\'ve reviewed your return request for Order #{return_requests.order_item_id}, and unfortunately, it has been declined for the following reason: {return_requests.remarks}.\\r\\n\\r\\nWe understand this may be disappointing. If you have questions or need assistance, please contact our support team at {system.support_number}. We\'re here to help.\\r\\n\\r\\nThank you for choosing{system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_returned_request_decline', '2023-11-02 09:59:45'),
(10, 'Your Order Return Request - Approved', 'Hello {user.username},\\r\\n\\r\\nGreat news! Your order return request has been approved. Here are the details:\\r\\nOrder ID: {return_requests.order_item_id}\\r\\nReturn Reason: {return_requests.remarks}\\r\\n\\r\\nYour return process is now in progress. Please follow the provided instructions for returning the item. If you have any questions or need assistance, contact our support team at {system.support_number}.\\r\\n\\r\\nThank you for choosing {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'customer_order_returned_request_approved', '2023-11-02 10:01:43'),
(11, 'Order Delivery Confirmation', 'Hello {user.username},\\r\\n\\r\\nGreat news! Your order #{order.id} from {system.company_name} has been successfully delivered to {order.address}. If you have any questions, contact us at {system.support_number}.\\r\\n\\r\\nThanks for choosing {system.company_name}!\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'delivery_boy_order_deliver', '2023-11-02 10:05:59'),
(12, 'Wallet Transaction Confirmation', 'Hello {user.username},\\r\\n\\r\\nYour wallet has been updated with a recent transaction.\\r\\nType: {transactions.type}\\r\\nAmount: {transactions.currency_code}{transactions.amount}\\r\\nDate: {transactions.transaction_date}\\r\\n\\r\\nFor assistance, contact us at{system.company_name}.\\r\\n\\r\\nThank you for {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}', 'wallet_transaction', '2023-11-02 10:08:37'),
(13, 'Bank Transfer Receipt Status - Update', 'Hello {user.username},\\r\\n\\r\\nWe have an update regarding your bank transfer receipt:\\r\\nTransfer ID: {transactions.id}\\r\\nAmount Transferred: {transactions.currency_code}{transactions.amount}\\r\\nStatus: {transactions.status}\\r\\n\\r\\nFor questions or assistance, contact us at {system.support_number}.\\r\\n\\r\\nThank you for choosing {system.company_name}.\\r\\n\\r\\nBest regards,\\r\\n{system.company_name}\\r\\n{transactions.id}', 'bank_transfer_receipt_status', '2023-11-02 10:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_notifications`
--

CREATE TABLE `delivery_boy_notifications` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `title` mediumtext NOT NULL,
  `message` mediumtext NOT NULL,
  `type` varchar(56) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `digital_orders_mails`
--

CREATE TABLE `digital_orders_mails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_item_id` int(11) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `message` varchar(256) DEFAULT NULL,
  `file_url` varchar(512) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` mediumtext DEFAULT NULL,
  `answer` mediumtext DEFAULT NULL,
  `status` char(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`) VALUES
(5, 14, 3),
(4, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `flash_sale`
--

CREATE TABLE `flash_sale` (
  `id` int(11) NOT NULL,
  `title` varchar(512) DEFAULT NULL,
  `slug` varchar(512) DEFAULT NULL,
  `short_description` varchar(512) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `product_ids` varchar(1024) DEFAULT NULL,
  `image` varchar(2048) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fund_transfers`
--

CREATE TABLE `fund_transfers` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `opening_balance` double NOT NULL,
  `closing_balance` double NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(28) DEFAULT NULL,
  `message` varchar(512) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'delivery_boy', 'Delivery Boys');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` varchar(128) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  `is_rtl` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `code`, `is_rtl`, `created_on`) VALUES
(1, 'English', 'en', 0, '2021-02-26 14:48:01');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `title` mediumtext NOT NULL,
  `name` mediumtext NOT NULL,
  `extension` varchar(16) NOT NULL,
  `type` varchar(16) NOT NULL,
  `sub_directory` mediumtext NOT NULL,
  `size` mediumtext NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `title`, `name`, `extension`, `type`, `sub_directory`, `size`, `date_created`) VALUES
(1, 'logo 460 x 11411', 'logo-460x11411.png', 'png', 'image', 'uploads/media/2020/', '32358', '2021-03-31 06:32:50'),
(2, 'favicon 64', 'favicon-64.png', 'png', 'image', 'uploads/media/2020/', '14131', '2021-03-31 06:34:15'),
(88, 'insecticides', 'insecticides.jpg', 'jpg', 'image', 'uploads/media/2025/', '5689', '2025-12-19 17:24:22'),
(89, 'nutrients', 'nutrients.webp', 'webp', 'image', 'uploads/media/2025/', '9.48', '2025-12-19 17:26:17'),
(90, 'farm', 'farm.jpg', 'jpg', 'image', 'uploads/media/2025/', '5893', '2025-12-19 17:33:34'),
(91, 'flowerseed', 'flowerseed.jpg', 'jpg', 'image', 'uploads/media/2025/', '12443', '2025-12-19 17:33:34'),
(92, 'Fungicides', 'Fungicides.jpg', 'jpg', 'image', 'uploads/media/2025/', '6583', '2025-12-19 17:33:34'),
(93, 'Growth', 'Growth.jpg', 'jpg', 'image', 'uploads/media/2025/', '7091', '2025-12-19 17:33:34'),
(94, 'Herbicides', 'Herbicides.jpg', 'jpg', 'image', 'uploads/media/2025/', '7035', '2025-12-19 17:33:34'),
(95, 'Vegetables_and_Fruit_Seeds', 'Vegetables_and_Fruit_Seeds.webp', 'webp', 'image', 'uploads/media/2025/', '10.03', '2025-12-19 17:33:34'),
(96, 'Fungicides', 'Fungicides.jpg', 'jpg', 'image', 'uploads/media/2025/', '6583', '2025-12-19 17:34:29'),
(97, 'banner', 'banner.jpg', 'jpg', 'image', 'uploads/media/2025/', '44739', '2025-12-19 17:41:13'),
(98, 'product_1', 'product_1.jpg', 'jpg', 'image', 'uploads/media/2025/', '5721', '2025-12-19 17:53:30'),
(99, 'product2', 'product2.jpg', 'jpg', 'image', 'uploads/media/2025/', '6060', '2025-12-19 17:55:42'),
(100, 'agri2', 'agri2.jpg', 'jpg', 'image', 'uploads/media/2026/', '23115', '2026-01-05 13:51:16'),
(101, 'trisattva_1', 'trisattva_1.jpg', 'jpg', 'image', 'uploads/media/2026/', '19654', '2026-01-17 10:19:16'),
(102, 'trisattva_11', 'trisattva_11.jpg', 'jpg', 'image', 'uploads/media/2026/', '19654', '2026-01-17 10:27:13'),
(103, 'bhumi_sattva', 'bhumi_sattva.jpg', 'jpg', 'image', 'uploads/media/2026/', '34571', '2026-01-17 10:52:59'),
(104, 'admax_90', 'admax_90.jpg', 'jpg', 'image', 'uploads/media/2026/', '19868', '2026-01-17 11:16:10'),
(105, 'nitro_fix_azo', 'nitro_fix_azo.jpg', 'jpg', 'image', 'uploads/media/2026/', '19664', '2026-01-17 11:43:20'),
(106, 'nitro_fix_rhizo1', 'nitro_fix_rhizo1.jpg', 'jpg', 'image', 'uploads/media/2026/', '20980', '2026-01-17 11:55:45'),
(107, 'WhatsApp_Image_2026-01-17_at_5_39_55_PM', 'WhatsApp_Image_2026-01-17_at_5_39_55_PM.jpeg', 'jpeg', 'image', 'uploads/media/2026/', '129326', '2026-01-17 12:43:00'),
(108, 'v-4banner1', 'v-4banner1.jpg', 'jpg', 'image', 'uploads/media/2026/', '124690', '2026-03-09 07:30:40'),
(109, 'IMG_20251219_143128', 'IMG_20251219_143128.jpg', 'jpg', 'image', 'uploads/media/2026/', '141301', '2026-03-09 07:31:13'),
(110, 'download', 'download.jpeg', 'jpeg', 'image', 'uploads/media/2026/', '7795', '2026-03-09 07:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 1,
  `message` text NOT NULL,
  `type` varchar(128) NOT NULL,
  `media` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(34);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `message` varchar(512) NOT NULL,
  `type` varchar(12) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(128) DEFAULT NULL,
  `link` varchar(512) DEFAULT 'NULL',
  `send_to` varchar(256) NOT NULL,
  `users_id` text DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `type_id` int(11) DEFAULT 0,
  `min_discount` int(11) DEFAULT 0,
  `max_discount` int(11) DEFAULT 0,
  `image` varchar(256) NOT NULL,
  `link` varchar(512) DEFAULT '0',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offer_sliders`
--

CREATE TABLE `offer_sliders` (
  `id` int(11) NOT NULL,
  `style` varchar(256) NOT NULL,
  `offer_ids` text NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `total` double NOT NULL,
  `delivery_charge` double DEFAULT 0,
  `is_delivery_charge_returnable` tinyint(4) DEFAULT 0,
  `wallet_balance` double DEFAULT 0,
  `total_payable` double DEFAULT NULL,
  `promo_code` varchar(28) DEFAULT NULL,
  `promo_discount` double DEFAULT NULL,
  `bulk_discount` decimal(11,2) NOT NULL DEFAULT 0.00,
  `discount` double DEFAULT 0,
  `final_total` double DEFAULT NULL,
  `payment_method` varchar(16) NOT NULL,
  `latitude` varchar(256) DEFAULT NULL,
  `longitude` varchar(256) DEFAULT NULL,
  `address` mediumtext DEFAULT NULL,
  `delivery_time` varchar(128) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(1024) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `otp` int(11) DEFAULT 0,
  `email` varchar(254) DEFAULT 'NULL',
  `notes` varchar(512) DEFAULT NULL,
  `attachments` varchar(2048) DEFAULT NULL,
  `is_local_pickup` tinyint(4) DEFAULT 0,
  `is_pos_order` tinyint(4) DEFAULT 0,
  `seller_notes` text DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `platform_fees` float NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_bank_transfer`
--

CREATE TABLE `order_bank_transfer` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `attachments` varchar(512) DEFAULT NULL,
  `status` tinyint(2) DEFAULT 0 COMMENT '0:pending|1:rejected|2:accepted',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(512) DEFAULT NULL,
  `product_type` varchar(256) DEFAULT NULL,
  `product_image` varchar(256) DEFAULT NULL,
  `product_is_cancelable` int(11) DEFAULT NULL,
  `deliveryboy_otp_setting_on` int(11) DEFAULT NULL,
  `product_is_returnable` int(11) DEFAULT NULL,
  `variant_name` varchar(256) DEFAULT NULL,
  `attachment` varchar(256) DEFAULT NULL,
  `product_variant_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `discounted_price` double DEFAULT NULL,
  `tax_percent` double DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `discount` double DEFAULT 0,
  `sub_total` double NOT NULL,
  `deliver_by` varchar(128) DEFAULT NULL,
  `updated_by` int(11) DEFAULT 0,
  `status` varchar(1024) NOT NULL,
  `active_status` varchar(1024) DEFAULT NULL,
  `hash_link` varchar(512) DEFAULT 'NULL',
  `is_sent` tinyint(4) DEFAULT 0,
  `is_download` tinyint(4) DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `tax_id` varchar(1025) DEFAULT NULL,
  `return_reason` varchar(256) DEFAULT NULL,
  `return_item_image` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tracking`
--

CREATE TABLE `order_tracking` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` mediumtext NOT NULL,
  `shiprocket_order_id` int(11) DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `courier_company_id` int(11) DEFAULT NULL,
  `awb_code` varchar(256) DEFAULT NULL,
  `pickup_status` int(11) NOT NULL,
  `pickup_scheduled_date` varchar(256) NOT NULL,
  `pickup_token_number` varchar(256) NOT NULL,
  `status` int(11) NOT NULL,
  `others` varchar(256) DEFAULT NULL,
  `pickup_generated_date` varchar(256) NOT NULL,
  `data` varchar(256) NOT NULL,
  `date` varchar(256) NOT NULL,
  `is_canceled` int(11) DEFAULT NULL,
  `manifest_url` varchar(256) NOT NULL,
  `label_url` varchar(256) NOT NULL,
  `invoice_url` varchar(256) NOT NULL,
  `courier_agency` varchar(20) DEFAULT NULL,
  `tracking_id` varchar(120) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `otp` varchar(256) NOT NULL,
  `varified` int(11) NOT NULL DEFAULT 0 COMMENT '1 : verify | 0: not verify	',
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_requests`
--

CREATE TABLE `payment_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_type` varchar(56) NOT NULL,
  `payment_address` varchar(1024) NOT NULL,
  `amount_requested` int(11) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_locations`
--

CREATE TABLE `pickup_locations` (
  `id` int(11) NOT NULL,
  `pickup_location` varchar(512) NOT NULL,
  `name` varchar(512) NOT NULL,
  `email` varchar(512) NOT NULL,
  `phone` varchar(28) NOT NULL,
  `address` text NOT NULL,
  `address_2` text NOT NULL,
  `city` varchar(56) NOT NULL,
  `state` varchar(56) NOT NULL,
  `country` varchar(56) NOT NULL,
  `pin_code` varchar(56) NOT NULL,
  `latitude` varchar(128) DEFAULT NULL,
  `longitude` varchar(128) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popup_offers`
--

CREATE TABLE `popup_offers` (
  `id` int(11) NOT NULL,
  `type` varchar(256) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `min_discount` int(11) DEFAULT 0,
  `max_discount` int(11) DEFAULT 0,
  `image` varchar(256) DEFAULT NULL,
  `link` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_identity` varchar(50) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `tax` varchar(1025) DEFAULT NULL,
  `row_order` int(11) DEFAULT 0,
  `type` varchar(34) DEFAULT NULL,
  `stock_type` varchar(64) DEFAULT NULL COMMENT '0 =>''Simple_Product_Stock_Active'' 1 => "Product_Level" 1 => "Variable_Level"',
  `name` varchar(512) NOT NULL,
  `short_description` mediumtext DEFAULT NULL,
  `slug` varchar(512) NOT NULL,
  `indicator` tinyint(4) DEFAULT NULL COMMENT '0 - none | 1 - veg | 2 - non-veg',
  `cod_allowed` int(11) DEFAULT 1,
  `download_allowed` int(11) NOT NULL DEFAULT 0,
  `download_type` varchar(40) DEFAULT NULL,
  `download_link` varchar(512) DEFAULT NULL,
  `minimum_order_quantity` int(11) DEFAULT 1,
  `quantity_step_size` int(11) DEFAULT 1,
  `bulk_discount_min_qty` int(11) NOT NULL DEFAULT 0,
  `bulk_discount_amount` decimal(11,2) NOT NULL DEFAULT 0.00,
  `total_allowed_quantity` int(11) DEFAULT NULL,
  `is_prices_inclusive_tax` int(11) DEFAULT 0,
  `is_returnable` int(11) DEFAULT 0,
  `is_cancelable` int(11) DEFAULT 0,
  `cancelable_till` varchar(32) DEFAULT NULL,
  `is_attachment_required` tinyint(4) DEFAULT 0,
  `image` mediumtext NOT NULL,
  `other_images` mediumtext DEFAULT NULL,
  `video_type` varchar(32) DEFAULT NULL,
  `video` varchar(512) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `warranty_period` varchar(32) DEFAULT NULL,
  `guarantee_period` varchar(32) DEFAULT NULL,
  `made_in` varchar(128) DEFAULT NULL,
  `brand` varchar(256) DEFAULT NULL,
  `sku` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `rating` double DEFAULT 0,
  `no_of_ratings` int(11) DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `deliverable_type` int(11) DEFAULT 1 COMMENT '(0:none, 1:all, 2:include, 3:exclude)',
  `deliverable_zipcodes` varchar(512) DEFAULT NULL,
  `deliverable_city_type` int(11) NOT NULL DEFAULT 1,
  `deliverable_cities` varchar(1024) DEFAULT NULL,
  `shipping_method` int(11) DEFAULT NULL,
  `pickup_location` varchar(512) DEFAULT NULL,
  `status` int(2) DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_on_sale` tinyint(4) DEFAULT 0,
  `sale_discount` int(11) DEFAULT 0,
  `sale_start_date` datetime DEFAULT NULL,
  `sale_end_date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_identity`, `category_id`, `tax`, `row_order`, `type`, `stock_type`, `name`, `short_description`, `slug`, `indicator`, `cod_allowed`, `download_allowed`, `download_type`, `download_link`, `minimum_order_quantity`, `quantity_step_size`, `bulk_discount_min_qty`, `bulk_discount_amount`, `total_allowed_quantity`, `is_prices_inclusive_tax`, `is_returnable`, `is_cancelable`, `cancelable_till`, `is_attachment_required`, `image`, `other_images`, `video_type`, `video`, `tags`, `warranty_period`, `guarantee_period`, `made_in`, `brand`, `sku`, `stock`, `availability`, `rating`, `no_of_ratings`, `description`, `deliverable_type`, `deliverable_zipcodes`, `deliverable_city_type`, `deliverable_cities`, `shipping_method`, `pickup_location`, `status`, `date_added`, `is_on_sale`, `sale_discount`, `sale_start_date`, `sale_end_date`) VALUES
(1, '', 113, '0', 2, 'simple_product', '0', 'Admax-90', 'Admax-90 is an all-in-one spraying assistant that acts as a spreader, sticker, activator, penetrator, pH balancer, and hardness reducer. It helps the spray solution stick to the leaves, spread evenly, and improve coverage, which reduces the overall quantity of solution required.', 'admax-1', 0, 0, 0, '', '', 1, 1, 0, '0.00', 1, 0, 0, 0, '', 0, 'uploads/media/2026/admax_90.jpg', '[]', '', '', '', '', '', 'India', '', '2323', 11, 1, 0, 0, '<p>Admax-90 is an all-in-one spraying assistant that acts as a spreader, sticker, activator, penetrator, pH balancer, and hardness reducer. It helps the spray solution stick to the leaves, spread evenly, and improve coverage, which reduces the overall quantity of solution required. Admax-90 enhances the entry of active molecules into plant cells, increasing their bio-efficacy. It also balances the pH and reduces the hardness of water, thereby improving overall water quality. Recommended dosage: 0.5 to 1.5 ml per liter of water for spraying.</p>', 1, '', 1, NULL, NULL, '', 1, '2025-12-19 17:54:40', 0, 0, NULL, NULL),
(2, 'PRDAGRI2', 114, '0', 1, 'simple_product', NULL, 'Bhoomi Sattva', 'Bhoomisatva helps to improve soil health and makes available the nutrients from soil to plant. It promotes the production of beneficial hormones essential for healthy plant growth. The product also helps improve the physical structure of the soil and provides a supportive habitat for beneficial microbes such as bacteria and fungi.', 'bhoomi-sattva', 1, 1, 0, '', '', 1, 1, 0, '0.00', 1, 0, 0, 1, 'received', 0, 'uploads/media/2026/bhumi_sattva.jpg', '[]', '', '', 'Tomato,Potato,Red Chilli', '', '', 'India', '', NULL, NULL, NULL, 0, 0, '<p>Bhoomisatva helps to improve soil health and makes available the nutrients from soil to plant. It promotes the production of beneficial hormones essential for healthy plant growth. The product also helps improve the physical structure of the soil and provides a supportive habitat for beneficial microbes such as bacteria and fungi.</p>', 1, '', 1, NULL, NULL, '', 1, '2025-12-19 17:56:24', 0, 0, NULL, NULL),
(5, '', 111, '0', 0, 'simple_product', NULL, 'NitroFix-Rhizo', 'It improves seed germination and enhances the overall germination rate. During the early stages of crop growth', 'nitrofix-rhizo', 0, 0, 0, '', '', 1, 1, 0, '0.00', 1, 0, 0, 0, '', 0, 'uploads/media/2026/nitro_fix_rhizo1.jpg', '[]', '', '', '', '', '', NULL, '', NULL, NULL, NULL, 0, 0, '<p>It improves seed germination and enhances the overall germination rate. During the early stages of crop growth</p>', 1, '', 1, NULL, NULL, '', 1, '2026-01-17 11:56:37', 0, 0, NULL, NULL),
(3, '', 112, '0', 0, 'simple_product', NULL, 'Trisattva NPK Consortia', 'Trisatva is a complete nutrient package for healthy growth of plants. It is rich in bacteria which help plants to get nitrogen, phosphorus, and potash for healthy plants. ', 'trisattva-npk-consortia', 0, 0, 0, '', '', 1, 1, 0, '0.00', 1, 0, 0, 0, '', 0, 'uploads/media/2026/trisattva_11.jpg', '[]', '', '', 'Nutrients', '', '', NULL, '', NULL, NULL, NULL, 0, 0, '', 1, '', 1, NULL, NULL, '', 1, '2026-01-17 10:38:45', 0, 0, NULL, NULL),
(4, '', 111, '0', 0, 'simple_product', NULL, 'Nitro- Azo', 'It improves seed germination and enhances the overall germination rate. During the early stages of crop growth', 'nitro-azo', 0, 0, 0, '', '', 1, 1, 0, '0.00', 1, 0, 0, 0, '', 0, 'uploads/media/2026/nitro_fix_azo.jpg', '[]', '', '', 'soyabin,moong,rajma', '', '', NULL, '', NULL, NULL, NULL, 0, 0, '<p>It improves seed germination and enhances the overall germination rate. During the early stages of crop growth, it promotes strong and vigorous root development. It also helps increase the crop&rsquo;s resistance to soil-borne pathogenic fungi. Additionally, it fixes atmospheric and soil nitrogen and makes it available to leguminous crops, which reduces the requirement for nitrogen-based chemical fertilizers.</p>', 1, '', 1, NULL, NULL, '', 1, '2026-01-17 11:48:51', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` varchar(64) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `attribute_value_ids`, `date_created`) VALUES
(1, 1, '', '2025-12-19 17:54:40'),
(2, 2, '', '2025-12-19 17:56:24'),
(3, 3, '', '2026-01-17 10:38:45'),
(4, 4, '', '2026-01-17 11:48:51'),
(5, 5, '', '2026-01-17 11:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_faqs`
--

CREATE TABLE `product_faqs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `answered_by` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `images` mediumtext DEFAULT NULL,
  `comment` varchar(1024) DEFAULT NULL,
  `data_added` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_value_ids` text DEFAULT NULL,
  `attribute_set` varchar(1024) DEFAULT NULL,
  `price` double NOT NULL,
  `special_price` double DEFAULT 0,
  `sku` varchar(128) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `height` float NOT NULL,
  `breadth` float NOT NULL,
  `length` float NOT NULL,
  `images` text DEFAULT NULL,
  `availability` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `attribute_value_ids`, `attribute_set`, `price`, `special_price`, `sku`, `stock`, `weight`, `height`, `breadth`, `length`, `images`, `availability`, `status`, `date_added`) VALUES
(1, 1, NULL, NULL, 350, 285, NULL, NULL, 1, 1, 1, 1, NULL, NULL, 1, '2025-12-19 17:54:40'),
(2, 2, NULL, NULL, 900, 630, NULL, NULL, 2, 2, 2, 2, NULL, NULL, 1, '2025-12-19 17:56:24'),
(3, 3, NULL, NULL, 600, 420, NULL, NULL, 500, 100, 100, 100, NULL, NULL, 1, '2026-01-17 10:38:45'),
(4, 4, NULL, NULL, 600, 400, NULL, NULL, 250, 5, 5, 5, NULL, NULL, 1, '2026-01-17 11:48:51'),
(5, 5, NULL, NULL, 650, 450, NULL, NULL, 250, 3, 3, 2, NULL, NULL, 1, '2026-01-17 11:56:37');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_code` varchar(28) NOT NULL,
  `message` varchar(512) DEFAULT NULL,
  `start_date` varchar(28) DEFAULT NULL,
  `end_date` varchar(28) DEFAULT NULL,
  `no_of_users` int(11) DEFAULT NULL,
  `minimum_order_amount` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `discount_type` varchar(32) DEFAULT NULL,
  `max_discount_amount` double DEFAULT NULL,
  `repeat_usage` tinyint(4) NOT NULL,
  `no_of_repeat_usage` int(11) DEFAULT NULL,
  `image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `is_cashback` tinyint(4) NOT NULL DEFAULT 0,
  `list_promocode` tinyint(4) NOT NULL DEFAULT 1,
  `is_specific_users` int(11) NOT NULL DEFAULT 0,
  `users_id` varchar(256) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_reasons`
--

CREATE TABLE `return_reasons` (
  `id` int(11) UNSIGNED NOT NULL,
  `return_reason` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `return_requests`
--

CREATE TABLE `return_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_variant_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `return_reason` varchar(256) DEFAULT NULL,
  `return_item_image` varchar(256) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remarks` varchar(1024) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `title` varchar(512) NOT NULL,
  `short_description` varchar(512) DEFAULT NULL,
  `style` varchar(16) NOT NULL,
  `product_ids` varchar(1024) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `categories` mediumtext DEFAULT NULL,
  `product_type` varchar(1024) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `variable` varchar(128) NOT NULL,
  `value` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `variable`, `value`) VALUES
(1, 'logo', 'uploads/media/2022/eShop_Single_Vendor_Logo.png'),
(2, 'privacy_policy', '<p></p><h2><b>Privacy policy</b></h2>Costumers ACCESSING, BROWSING OR OTHERWISE USING THE \\r\\nWEBSITE cityecommerce.com, Missed Call Service or mobile application \\r\\nINDICATES user is in AGREEMENT with cityecommerce vegetables & \\r\\nfruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. \\r\\nUser is requested to READ terms and conditions CAREFULLY BEFORE \\r\\nPROCEEDING FURTHER.<br>\\r\\nUser is the person, group of person, company, trust, society, legal \\r\\nentity, legal personality or anyone who visits website, mobile app or \\r\\ngives missed call or places order with Gmartfresh via phone or website \\r\\nor mobile application or browse through website www.Gmartfresh.com.<p></p>\\r\\n\\r\\n<p>Gmartfresh reserves the right to add, alter, change, modify or delete\\r\\n any of these terms and conditions at any time without prior \\r\\ninformation. The altered terms and conditions becomes binding on the \\r\\nuser since the moment same are unloaded on the website \\r\\nwww.Gmartfresh.com</p>\\r\\n\\r\\n<p>Gmartfresh is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p>\\r\\n\\r\\n<p>That any user who gives missed call/call for order on any number \\r\\npublished/used by Gmartfresh.com, consents to receive, accept calls and \\r\\nmessages or any after communication from Gmartfresh vegetables & \\r\\nfruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p>\\r\\n\\r\\n<p>If a customer do not wish to receive any communication from Gmartfresh, please SMS NO OFFERS to 9512512125.</p>\\r\\n\\r\\n<p>Gmartfresh accept orders on all seven days and user will receive the \\r\\ndelivery next day from date of order placement, as we at Gmartfresh \\r\\nprocure the fresh produce from the procurement center and deliver it \\r\\nstraight to user.</p>\\r\\n\\r\\n<p>There is Minimum Order value of Rs. 200. There are no delivery \\r\\ncharges on an order worth Rs. 200 or above. In special cases, if \\r\\npermitted, order value is less then Rs. 200/– , Rs. 40 as shipping \\r\\ncharges shall be charged from user.</p>\\r\\n\\r\\n<p>Gmartfresh updates the prices on daily basis and the price displayed \\r\\nat our website www.Gmartfresh.com, at the time of placement of order by \\r\\nuser he/she/it will be charged as per the price listed at the website \\r\\nwww.Gmartfresh.com.</p>\\r\\n\\r\\n<p>In the event, though there are remote possibilities, of wrong invoice\\r\\n generation due to any reason, in case it happens Gmartfresh vegetables \\r\\n& fruits Pvt Ltd reserve its right to again raise the correct \\r\\ninvoice at the revised amount and same shall be paid by user.</p>\\r\\n\\r\\n<p>At times it is difficult to weigh certain vegetables or fruits \\r\\nexactly as per the order or desired quantity of user, hence the delivery\\r\\n might be with five percent variation on both higher or lower side of \\r\\nexact ordered quantity, user are hereby under takes to pay to Gmartfresh\\r\\n vegetables & fruits Pvt Ltd as per the final invoice. We at \\r\\nGmartfresh understands and our endeavor is to always deliver in exact \\r\\nquantity in consonance with quantity ordered but every time it’s not \\r\\npossible but Gmartfresh guarantee the fair deal and weight to all its \\r\\nusers. Gmartfresh further assures its users that at no instance delivery\\r\\n weights/quantity vary dramatically from what quantity ordered by user.</p>\\r\\n\\r\\n<p>If some product is not available or is not of good quality, the same \\r\\nitem will not be delivered and will be adjusted accordingly in the \\r\\ninvoice; all rights in this regards are reserved with Gmartfresh. Images\\r\\n of Fruits & Vegetables present in the website are for demonstration\\r\\n purpose and may not resemble exactly in size, colour, weight, contrast \\r\\netc; though we assure our best to maintain the best quality in product, \\r\\nwhich is being our foremost commitment to the customer.</p>\\r\\n\\r\\n<p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(3, 'terms_conditions', '<h3><b>Terms and conditions</b></h3><p>Costumers eshop.com is a sole proprietary firm , Juridical rights of eshop.com are reserved with eshop</p><p>Personal Information eshop.com and the website eshop.com (”The Site”) . respects your privacy. This Privacy Policy succinctly provides the manner your data is collected and used by eshop.com. on the Site. As a visitor to the Site/ Customer you are advised to please read the Privacy Policy carefully.</p><p><br></p><p>Services Overview As part of the registration process on the Site, eshop.com may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, GPS location, Demographic profile &#40;like your age, gender, occupation, education, address etc.&#41; and information about the pages on the site you visit/access, the links you click on the site, the number of times you access the page and any such browsing information.</p><p><br></p><p>Eligibility Services of the Site would be available to only select geographies in India. Persons who are \\\"incompetent to contract\\\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Site. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Site only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years, your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited.</p><p><br></p><p>License & Site Access eshop.com grants you a limited sub-license to access and make personal use of this site and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of eshop.com. This license does not include any resale or commercial use of this site or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this site or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This site or any portion of this site may not be reproduced, duplicated, copied, sold, resold, visited or otherwise exploited for any commercial purpose without express written consent of eshop.com. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Site or of eshop.com and its affiliates without express written consent. You may not use any meta tags or any other \\\"hidden text\\\" utilizing the Site’s or eshop.com’s name or eshop.com’s name or trademarks without the express written consent of eshop.com. Any unauthorized use, terminates the permission or license granted by eshop.com</p><p><br></p><p>Account & Registration Obligations All shoppers have to register and login for placing orders on the Site. You have to keep your account and registration details current and correct for communications related to your purchases from the site. By agreeing to the terms and conditions, the shopper agrees to receive promotional communication and newsletters upon registration. The customer can opt out either by unsubscribing in \\\"My Account\\\" or by contacting the customer service.</p><p><br></p><p>Pricing All the products listed on the Site will be sold at MRP unless otherwise specified. The prices mentioned at the time of ordering will be the prices charged on the date of the delivery. Although prices of most of the products do not fluctuate on a daily basis but some of the commodities and fresh food prices do change on a daily basis. In case the prices are higher or lower on the date of delivery not additional charges will be collected or refunded as the case may be at the time of the delivery of the order.</p><p><br></p><p>Cancellation by Site / Customer You as a customer can cancel your order anytime up to the cut-off time of the slot for which you have placed an order by calling our customer service. In such a case we will Credit your wallet against any payments already made by you for the order. If we suspect any fraudulent transaction by any customer or any transaction which defies the terms & conditions of using the website, we at our sole discretion could cancel such orders. We will maintain a negative list of all fraudulent transactions and customers and would deny access to them or cancel any orders placed by them.</p><p><br></p><p>Return & Refunds We have a \\\"no questions asked return policy\\\" which entitles all our Delivery Ambassadors to return the product at the time of delivery if due to any reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and issue a credit note for the value of the return products which will be credited to your account on the Site. This can be used to pay your subsequent shopping bills. Refund will be processed through same online mode within 7 working days.</p><p><br></p><p><br></p><p>Delivery & Shipping Charge</p><p><br></p><p>1.You can expect to receive your order depending on the delivery option you have chosen.</p><p><br></p><p>2.You can order 24*7 in website & mobile application , Our delivery timeings are between 06:00 AM - 02:00PM Same day delivery.</p><p><br></p><p>3.You will get free shipping on order amount above Rs.150.</p><p>You Agree and Confirm</p><p>1. That in the event that a non-delivery occurs on account of a mistake by you (i.e. wrong name or address or any other wrong information) any extra cost incurred by eshop. for redelivery shall be claimed from you.</p><p>2. That you will use the services provided by the Site, its affiliates, consultants and contracted companies, for lawful purposes only and comply with all applicable laws and regulations while using and transacting on the Site.</p><p>3. You will provide authentic and true information in all instances where such information is requested you. eshop reserves the right to confirm and validate the information and other details provided by you at any point of time. If upon confirmation your details are found not to be true (wholly or partly), it has the right in its sole discretion to reject the registration and debar you from using the Services and / or other affiliated websites without prior intimation whatsoever.</p><p>4. That you are accessing the services available on this Site and transacting at your sole risk and are using your best and prudent judgment before entering into any transaction through this Site.</p><p>5. That the address at which delivery of the product ordered by you is to be made will be correct and proper in all respects.</p><p>6. That before placing an order you will check the product description carefully. By placing an order for a product you agree to be bound by the conditions of sale included in the item\\\'s description.</p><p><br></p><p>You may not use the Site for any of the following purposes:</p><p>1. Disseminating any unlawful, harassing, libelous, abusive, threatening, harmful, vulgar, obscene, or otherwise objectionable material.</p><p>2. Transmitting material that encourages conduct that constitutes a criminal offence or results in civil liability or otherwise breaches any relevant laws, regulations or code of practice.</p><p>3. Gaining unauthorized access to other computer systems.</p><p>4. Interfering with any other person\\\'s use or enjoyment of the Site.</p><p>5. Breaching any applicable laws;</p><p>6. Interfering or disrupting networks or web sites connected to the Site.</p><p>7. Making, transmitting or storing electronic copies of materials protected by copyright without the permission of the owner.</p><p><br></p><p>Colors we have made every effort to display the colors of our products that appear on the Website as accurately as possible. However, as the actual colors you see will depend on your monitor, we cannot guarantee that your monitor\\\'s display of any color will be accurate.</p><p><br></p><p>Modification of Terms & Conditions of Service eshop may at any time modify the Terms & Conditions of Use of the Website without any prior notification to you. You can access the latest version of these Terms & Conditions at any given time on the Site. You should regularly review the Terms & Conditions on the Site. In the event the modified Terms & Conditions is not acceptable to you, you should discontinue using the Service. However, if you continue to use the Service you shall be deemed to have agreed to accept and abide by the modified Terms & Conditions of Use of this Site.</p><p><br></p><p>Governing Law and Jurisdiction This User Agreement shall be construed in accordance with the applicable laws of India. The Courts at Faridabad shall have exclusive jurisdiction in any proceedings arising out of this agreement. Any dispute or difference either in interpretation or otherwise, of any terms of this User Agreement between the parties hereto, the same shall be referred to an independent arbitrator who will be appointed by eshop and his decision shall be final and binding on the parties hereto. The above arbitration shall be in accordance with the Arbitration and Conciliation Act, 1996 as amended from time to time. The arbitration shall be held in Nagpur. The High Court of judicature at Nagpur Bench of Mumbai High Court alone shall have the jurisdiction and the Laws of India shall apply.</p><p><br></p><p>Reviews, Feedback, Submissions All reviews, comments, feedback, postcards, suggestions, ideas, and other submissions disclosed, submitted or offered to the Site on or by this Site or otherwise disclosed, submitted or offered in connection with your use of this Site (collectively, the \\\"Comments\\\") shall be and remain the property of eshop Such disclosure, submission or offer of any Comments shall constitute an assignment to eshop of all worldwide rights, titles and interests in all copyrights and other intellectual properties in the Comments. Thus, eshop owns exclusively all such rights, titles and interests and shall not be limited in any way in its use, commercial or otherwise, of any Comments. eshopwill be entitled to use, reproduce, disclose, modify, adapt, create derivative works from, publish, display and distribute any Comments you submit for any purpose whatsoever, without restriction and without compensating you in any way. eshop is and shall be under no obligation (1) to maintain any Comments in confidence; (2) to pay you any compensation for any Comments; or (3) to respond to any Comments. You agree that any Comments submitted by you to the Site will not violate this policy or any right of any third party, including copyright, trademark, privacy or other personal or proprietary right(s), and will not cause injury to any person or entity. You further agree that no Comments submitted by you to the Website will be or contain libelous or otherwise unlawful, threatening, abusive or obscene material, or contain software viruses, political campaigning, commercial solicitation, chain letters, mass mailings or any form of \\\"spam\\\". eshop does not regularly review posted Comments, but does reserve the right (but not the obligation) to monitor and edit or remove any Comments submitted to the Site. You grant eshopthe right to use the name that you submit in connection with any Comments. You agree not to use a false email address, impersonate any person or entity, or otherwise mislead as to the origin of any Comments you submit. You are and shall remain solely responsible for the content of any Comments you make and you agree to indemnify eshop and its affiliates for all claims resulting from any Comments you submit. eshop and its affiliates take no responsibility and assume no liability for any Comments submitted by you or any third party.</p><p><br></p><p>Copyright & Trademark eshop.com and eshop.com, its suppliers and licensors expressly reserve all intellectual property rights in all text, programs, products, processes, technology, content and other materials, which appear on this Site. Access to this Website does not confer and shall not be considered as conferring upon anyone any license under any of eshop.com or any third party\\\'s intellectual property rights. All rights, including copyright, in this website are owned by or licensed to eshop.com from eshop.com. Any use of this website or its contents, including copying or storing it or them in whole or part, other than for your own personal, non-commercial use is prohibited without the permission of eshop.com and/or eshop.com. You may not modify, distribute or re-post anything on this website for any purpose.The names and logos and all related product and service names, design marks and slogans are the trademarks or service marks of eshop.com, eshop.com, its affiliates, its partners or its suppliers. All other marks are the property of their respective companies. No trademark or service mark license is granted in connection with the materials contained on this Site. Access to this Site does not authorize anyone to use any name, logo or mark in any manner.References on this Site to any names, marks, products or services of third parties or hypertext links to third party sites or information are provided solely as a convenience to you and do not in any way constitute or imply eshop.com or eshop.com\\\'s endorsement, sponsorship or recommendation of the third party, information, product or service. eshop.com or eshop.com is not responsible for the content of any third party sites and does not make any representations regarding the content or accuracy of material on such sites. If you decide to link to any such third party websites, you do so entirely at your own risk. All materials, including images, text, illustrations, designs, icons, photographs, programs, music clips or downloads, video clips and written and other materials that are part of this Website (collectively, the \\\"Contents\\\") are intended solely for personal, non-commercial use. You may download or copy the Contents and other downloadable materials displayed on the Website for your personal use only. No right, title or interest in any downloaded materials or software is transferred to you as a result of any such downloading or copying. You may not reproduce (except as noted above), publish, transmit, distribute, display, modify, create derivative works from, sell or participate in any sale of or exploit in any way, in whole or in part, any of the Contents, the Website or any related software. All software used on this Website is the property of eshop.com or its licensees and suppliers and protected by Indian and international copyright laws. The Contents and software on this Website may be used only as a shopping resource. Any other use, including the reproduction, modification, distribution, transmission, republication, display, or performance, of the Contents on this Website is strictly prohibited. Unless otherwise noted, all Contents are copyrights, trademarks, trade dress and/or other intellectual property owned, controlled or licensed by eshop.com, one of its affiliates or by third parties who have licensed their materials to eshop.com and are protected by Indian and international copyright laws. The compilation (meaning the collection, arrangement, and assembly) of all Contents on this Website is the exclusive property of eshop.com and eshop.com and is also protected by Indian and international copyright laws.</p><p><br></p><p>Objectionable Material You understand that by using this Site or any services provided on the Site, you may encounter Content that may be deemed by some to be offensive, indecent, or objectionable, which Content may or may not be identified as such. You agree to use the Site and any service at your sole risk and that to the fullest extent permitted under applicable law, eshop.com and/or eshop.com and its affiliates shall have no liability to you for Content that may be deemed offensive, indecent, or objectionable to you.</p><p><br></p><p>Indemnity You agree to defend, indemnify and hold harmless eshop.com, eshop.com, its employees, directors, Coordinators, officers, agents, interns and their successors and assigns from and against any and all claims, liabilities, damages, losses, costs and expenses, including attorney\\\'s fees, caused by or arising out of claims based upon your actions or inactions, which may result in any loss or liability to eshop.com or eshop.com or any third party including but not limited to breach of any warranties, representations or undertakings or in relation to the non-fulfillment of any of your obligations under this User Agreement or arising out of the violation of any applicable laws, regulations including but not limited to Intellectual Property Rights, payment of statutory dues and taxes, claim of libel, defamation, violation of rights of privacy or publicity, loss of service by other subscribers and infringement of intellectual property or other rights. This clause shall survive the expiry or termination of this User Agreement.</p><p><br></p><p>Termination This User Agreement is effective unless and until terminated by either you or eshop.com. You may terminate this User Agreement at any time, provided that you discontinue any further use of this Site. eshop.com may terminate this User Agreement at any time and may do so immediately without notice, and accordingly deny you access to the Site, Such termination will be without any liability to eshop.com. Upon any termination of the User Agreement by either you or eshop.com, you must promptly destroy all materials downloaded or otherwise obtained from this Site, as well as all copies of such materials, whether made under the User Agreement or otherwise. eshop.com\\\'s right to any Comments shall survive any termination of this User Agreement. Any such termination of the User Agreement shall not cancel your obligation to pay for the product already ordered from the Website or affect any liability that may have arisen under the User Agreement.</p>'),
(4, 'fcm_server_key', 'your fcm_server_key'),
(5, 'contact_us', '<h2><strong>Contact Us</strong></h2>\\r\\n\\r\\n<p>For any kind of queries related to products, orders or services feel free to contact us on our official email address or phone number as given below :</p>\\r\\n\\r\\n<p> </p>\\r\\n\\r\\n<h3><strong>Areas we deliver : </strong></h3>\\r\\n\\r\\n<p> </p>\\r\\n\\r\\n<h3><strong>Delivery Timings :</strong></h3>\\r\\n\\r\\n<ol>\\r\\n <li><strong>  8:00 AM To 10:30 AM</strong></li>\\r\\n <li><strong>10:30 AM To 12:30 PM</strong></li>\\r\\n <li><strong>  4:00 PM To  7:00 PM</strong></li></ol><h3> <strong></strong>\\r\\n\\r\\n</h3><p><strong>Note : </strong>You can order for maximum 2days in advance. i.e., Today & Tomorrow only.  <br></p>'),
(6, 'system_settings', '{\"system_configurations\":\"1\",\"system_timezone_gmt\":\"+05:30\",\"system_configurations_id\":\"13\",\"app_name\":\"Agri\",\"support_number\":\"9999999999\",\"support_email\":\"support@agri.com\",\"copyright_details\":\"\",\"current_version\":\"1.0.0\",\"current_version_ios\":\"1.0.0\",\"is_version_system_on\":\"1\",\"area_wise_delivery_charge\":\"1\",\"currency\":\"\\u20b9\",\"delivery_charge\":\"10\",\"min_amount\":\"100\",\"system_timezone\":\"Asia\\/Kolkata\",\"is_refer_earn_on\":\"1\",\"min_refer_earn_order_amount\":\"100\",\"refer_earn_bonus\":\"10\",\"refer_earn_method\":\"percentage\",\"max_refer_earn_amount\":\"50\",\"refer_earn_bonus_times\":\"2\",\"welcome_wallet_balance_on\":\"0\",\"wallet_balance_amount\":\"100\",\"minimum_cart_amt\":\"50\",\"platform_fees\":\"0\",\"low_stock_limit\":\"15\",\"max_items_cart\":\"12\",\"delivery_boy_bonus_percentage\":\"1\",\"max_product_return_days\":\"1\",\"is_delivery_boy_otp_setting_on\":\"0\",\"cart_btn_on_list\":\"1\",\"expand_product_images\":\"0\",\"tax_name\":\"GST Number\",\"tax_number\":\"\",\"company_name\":\"Agri\",\"company_url\":\"\",\"supported_locals\":\"INR\",\"is_customer_app_under_maintenance\":\"0\",\"is_admin_app_under_maintenance\":\"0\",\"is_web_under_maintenance\":\"0\",\"is_delivery_boy_app_under_maintenance\":\"0\",\"message_for_customer_app\":\"\",\"message_for_admin_app\":\"\",\"message_for_web\":\"\",\"message_for_delivery_boy_app\":\"\",\"is_offer_popup_on\":true,\"google_login\":0,\"apple_login\":0,\"email_login\":0,\"whatsapp_status\":1,\"whatsapp_number\":\"9999999999\",\"offer_popup_method\":\"session_storage\",\"local_pickup\":\"0\",\"address\":\"Pune\",\"admin_store_state\":\"Pune\",\"latitude\":\"123\",\"longitude\":\"123\",\"pincode_wise_deliverability\":\"0\",\"city_wise_deliverability\":\"1\",\"global_free_delivery_amount_on_city\":\"50\",\"global_delivery_charge_on_city\":\"50\",\"android_app_store_link\":\"\",\"ios_app_store_link\":\"\",\"scheme\":\"\",\"host\":\"\",\"min_cod_order_amount\":\"0\",\"max_cod_order_amount\":\"0\"}'),
(7, 'payment_method', '{\"paypal_payment_method\":\"1\",\"paypal_mode\":\"sandbox\",\"paypal_business_email\":\"seller@somedomain.com\",\"currency_code\":\"USD\",\"razorpay_payment_method\":\"1\",\"razorpay_key_id\":\"your key\",\"razorpay_secret_key\":\"your razorpay_secret_key\",\"paystack_payment_method\":\"1\",\"paystack_key_id\":\"your paystack_key_id\",\"paystack_secret_key\":\"your paystack_secret_key\",\"stripe_payment_method\":\"1\",\"stripe_payment_mode\":\"test\",\"stripe_publishable_key\":\"your stripe_publishable_key\",\"stripe_secret_key\":\"your stripe_secret_key\",\"stripe_webhook_secret_key\":\"your stripe_webhook_secret_key\",\"stripe_currency_code\":\"INR\",\"flutterwave_payment_method\":\"1\",\"flutterwave_public_key\":\"your flutterwave_public_key\",\"flutterwave_secret_key\":\"your flutterwave_secret_key\",\"flutterwave_encryption_key\":\"your flutterwave_encryption_key\",\"flutterwave_currency_code\":\"NGN\",\"paytm_payment_method\":\"1\",\"paytm_payment_mode\":\"sandbox\",\"paytm_merchant_key\":\"your paytm_merchant_key\",\"paytm_merchant_id\":\"your paytm_merchant_id\",\"paytm_website\":\"WEBSTAGING\",\"paytm_industry_type_id\":\"Retail\",\"google_pay_payment_method\":\"0\",\"google_pay_mode\":\"\",\"google_pay_merchant_name\":\"\",\"google_pay_merchant_id\":\"\",\"google_pay_currency_code\":\"\",\"google_pay_country_code\":\"\",\"direct_bank_transfer\":\"1\",\"account_name\":\"eShop E-Commerce LLC.\",\"account_number\":\"1234567891012\",\"bank_name\":\"State Bank of India\",\"bank_code\":\"SBI0123456789\",\"notes\":\"Please do not forget to upload the bank transfer receipt upon sending \\/ depositing money to the above-mentioned account. Once the amount deposit is confirmed the order will be processed further. To upload the receipt go to your order details page or screen and find a form to upload the receipt.\",\"cod_method\":\"1\"}'),
(8, 'about_us', '<p>About us <br></p>'),
(9, 'currency', '₹'),
(11, 'email_settings', '{\"email\":\"your email\",\"password\":\"your password\",\"smtp_host\":\"your smtp_host\",\"smtp_port\":\"your smtp_port\",\"mail_content_type\":\"html\",\"smtp_encryption\":\"ssl\"}'),
(12, 'time_slot_config', '{\"time_slot_config\":\"1\",\"is_time_slots_enabled\":\"1\",\"delivery_starts_from\":\"1\",\"allowed_days\":\"7\"}'),
(13, 'favicon', 'uploads/media/2022/eShop_Single_Vendor_Favicon_Icon.png'),
(14, 'delivery_boy_privacy_policy', '<p><span xss=\\\"removed\\\">Neeraj delivery boy ACCESSING, </span>BROWSING OR OTHERWISE USING THE WEBSITE cityecommerce.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with cityecommerce vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with Gmartfresh via phone or website or mobile application or browse through website www.Gmartfresh.com.</p><p>Gmartfresh reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.Gmartfresh.com</p><p>Gmartfresh is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by Gmartfresh.com, consents to receive, accept calls and messages or any after communication from Gmartfresh vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from Gmartfresh, please SMS NO OFFERS to 9512512125.</p><p>Gmartfresh accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at Gmartfresh procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>Gmartfresh updates the prices on daily basis and the price displayed at our website www.Gmartfresh.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.Gmartfresh.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens Gmartfresh vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to Gmartfresh vegetables & fruits Pvt Ltd as per the final invoice. We at Gmartfresh understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but Gmartfresh guarantee the fair deal and weight to all its users. Gmartfresh further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with Gmartfresh. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(15, 'delivery_boy_terms_conditions', '<p><span xss=\\\"removed\\\">Neeraj delivery boy ACCESSING, </span>BROWSING OR OTHERWISE USING THE WEBSITE cityecommerce.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with cityecommerce vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.<br>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with Gmartfresh via phone or website or mobile application or browse through website www.Gmartfresh.com.</p><p>Gmartfresh reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.Gmartfresh.com</p><p>Gmartfresh is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by Gmartfresh.com, consents to receive, accept calls and messages or any after communication from Gmartfresh vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from Gmartfresh, please SMS NO OFFERS to 9512512125.</p><p>Gmartfresh accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at Gmartfresh procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>Gmartfresh updates the prices on daily basis and the price displayed at our website www.Gmartfresh.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.Gmartfresh.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens Gmartfresh vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to Gmartfresh vegetables & fruits Pvt Ltd as per the final invoice. We at Gmartfresh understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but Gmartfresh guarantee the fair deal and weight to all its users. Gmartfresh further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with Gmartfresh. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(16, 'web_logo', 'uploads/media/2025/BVG_Retail.png'),
(17, 'web_favicon', 'uploads/media/2025/BVG_Retail_favicon.png'),
(18, 'web_settings', '{\"site_title\":\"BVG RETAIL\",\"support_number\":\"1234567890\",\"support_email\":\"support@bvgretail.com\",\"copyright_details\":\"Copyright \\u00a9 2024, All Right Reserved\",\"address\":\"Pune\",\"app_short_description\":\"\",\"map_iframe\":\"\",\"logo\":\"uploads\\/media\\/2025\\/BVG_Retail.png\",\"favicon\":\"uploads\\/media\\/2025\\/BVG_Retail_favicon.png\",\"meta_keywords\":\"BVG RETAIL\",\"meta_description\":\"BVG RETAIL\",\"app_download_section\":true,\"app_download_section_title\":\"Mobile App\",\"app_download_section_tagline\":\"Affordable Ecommerce Platform\",\"app_download_section_short_description\":\"Shop with us at affordable prices and get exciting cashback & offers.\",\"promo_head_description\":\"\",\"app_download_section_playstore_url\":\"https:\\/\\/play.google.com\\/\",\"app_download_section_appstore_url\":\"https:\\/\\/www.apple.com\\/in\\/app-store\\/\",\"twitter_link\":\"https:\\/\\/twitter.com\\/\",\"instagram_link\":\"https:\\/\\/instagram.com\\/\",\"youtube_link\":\"https:\\/\\/youtube.com\\/\",\"whatsapp_link\":\"\",\"linkedin_link\":\"\",\"tiktok_link\":\"\",\"shipping_mode\":true,\"shipping_title\":\"Free Shipping\",\"shipping_description\":\"Free Shipping at your door step.\",\"return_mode\":true,\"return_title\":\"Free Returns\",\"return_description\":\"Free return if products are damaged.\",\"support_mode\":true,\"support_title\":\"Support 24\\/7\",\"support_description\":\"24\\/7 and 365 days support is available.\",\"safety_security_mode\":true,\"safety_security_title\":\"100% Safe & Secure\",\"safety_security_description\":\"100% safe & secure.\",\"primary_color\":\"#ffffff\",\"secondary_color\":\"#5c5c5c\",\"font_color\":\"\",\"modern_theme_color\":\"blue\",\"ci_csrf_token\":\"null\"}'),
(19, 'firebase_settings', '{\"apiKey\":\"AIzaSyAb59f4LNO7aFnWOKO9YK2_F16EM6YhK2Q\",\"authDomain\":\"krushi-tirth.firebaseapp.com\",\"databaseURL\":\"your firebase databaseURL\",\"projectId\":\"krushi-tirth\",\"storageBucket\":\"krushi-tirth.firebasestorage.app\",\"messagingSenderId\":\"796059150866\",\"appId\":\"1:796059150866:web:11eb6c5646f300c1c506cb\",\"measurementId\":\"G-6J1FEWGCJB\",\"ci_csrf_token\":\"\"}'),
(20, 'admin_privacy_policy', '<p>Admin ACCESSING, BROWSING OR OTHERWISE USING THE WEBSITE cityecommerce.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with cityecommerce vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with Gmartfresh via phone or website or mobile application or browse through website www.Gmartfresh.com.</p><p>Gmartfresh reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.Gmartfresh.com</p><p>Gmartfresh is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by Gmartfresh.com, consents to receive, accept calls and messages or any after communication from Gmartfresh vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from Gmartfresh, please SMS NO OFFERS to 9512512125.</p><p>Gmartfresh accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at Gmartfresh procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>Gmartfresh updates the prices on daily basis and the price displayed at our website www.Gmartfresh.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.Gmartfresh.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens Gmartfresh vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to Gmartfresh vegetables & <span xss=\\\"removed\\\">ACCESSING </span><span xss=\\\"removed\\\">fruits Pvt Ltd as per the final invoice. We at Gmartfresh understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but Gmartfresh guarantee the fair deal and weight to all its users. Gmartfresh further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</span></p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with Gmartfresh. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(21, 'admin_terms_conditions', '<p>Admin ACCESSING, BROWSING OR OTHERWISE USING THE WEBSITE cityecommerce.com, Missed Call Service or mobile application INDICATES user is in AGREEMENT with cityecommerce vegetables & fruits Pvt Ltd for ALL THE TERMS AND CONDITIONS MENTIONED henceforth. User is requested to READ terms and conditions CAREFULLY BEFORE PROCEEDING FURTHER.</span></p><p>User is the person, group of person, company, trust, society, legal entity, legal personality or anyone who visits website, mobile app or gives missed call or places order with Gmartfresh via phone or website or mobile application or browse through website www.Gmartfresh.com.</p><p>Gmartfresh reserves the right to add, alter, change, modify or delete any of these terms and conditions at any time without prior information. The altered terms and conditions becomes binding on the user since the moment same are unloaded on the website www.Gmartfresh.com</p><p>Gmartfresh is in trade of fresh fruits and vegetables and delivers the order to home (user’s desired address) directly.</p><p>That any user who gives missed call/call for order on any number published/used by Gmartfresh.com, consents to receive, accept calls and messages or any after communication from Gmartfresh vegetables & fruits Pvt Ltd for Promotion and Telemarketing Purposes within a week.</p><p>If a customer do not wish to receive any communication from Gmartfresh, please SMS NO OFFERS to 9512512125.</p><p>Gmartfresh accept orders on all seven days and user will receive the delivery next day from date of order placement, as we at Gmartfresh procure the fresh produce from the procurement center and deliver it straight to user.</p><p>There is Minimum Order value of Rs. 200. There are no delivery charges on an order worth Rs. 200 or above. In special cases, if permitted, order value is less then Rs. 200/– , Rs. 40 as shipping charges shall be charged from user.</p><p>Gmartfresh updates the prices on daily basis and the price displayed at our website www.Gmartfresh.com, at the time of placement of order by user he/she/it will be charged as per the price listed at the website www.Gmartfresh.com.</p><p>In the event, though there are remote possibilities, of wrong invoice generation due to any reason, in case it happens Gmartfresh vegetables & fruits Pvt Ltd reserve its right to again raise the correct invoice at the revised amount and same shall be paid by user.</p><p>At times it is difficult to weigh certain vegetables or fruits exactly as per the order or desired quantity of user, hence the delivery might be with five percent variation on both higher or lower side of exact ordered quantity, user are hereby under takes to pay to Gmartfresh vegetables & fruits Pvt Ltd as per the final invoice. We at Gmartfresh understands and our endeavor is to always deliver in exact quantity in consonance with quantity ordered but every time it’s not possible but Gmartfresh guarantee the fair deal and weight to all its users. Gmartfresh further assures its users that at no instance delivery weights/quantity vary dramatically from what quantity ordered by user.</p><p>If some product is not available or is not of good quality, the same item will not be delivered and will be adjusted accordingly in the invoice; all rights in this regards are reserved with Gmartfresh. Images of Fruits & Vegetables present in the website are for demonstration purpose and may not resemble exactly in size, colour, weight, contrast etc; though we assure our best to maintain the best quality in product, which is being our foremost commitment to the customer.</p><p>All orders placed before 11 PM in the Night will be delivered next day or as per delivery date chosen.</p>'),
(23, 'return_policy', 'Return policy'),
(24, 'shipping_policy', 'Shipping Policy'),
(25, 'shipping_method', '{\"shiprocket_shipping_method\":\"0\",\"email\":\"youremail@gmail.com\",\"password\":\"\",\"webhook_token\":\"\",\"local_shipping_method\":\"1\"}'),
(26, 'vap_id_Key', ''),
(27, 'sms_gateway_method', ''),
(28, 'authentication_settings', '{\"authentication_method\":\"firebase\"}'),
(29, 'vap_id_Key', ''),
(30, 'sms_gateway_settings', '{}'),
(31, 'send_notification_settings', ''),
(32, 'sms_gateway_method', ''),
(33, 'authentication_settings', '{\"authentication_method\":\"firebase\"}'),
(34, 'vap_id_Key', ''),
(35, 'sms_gateway_settings', '{}'),
(36, 'send_notification_settings', ''),
(37, 'web_doctor_brown', '{\"code_bravo\":\"f0d67d7c-5daa-4b36-9ee7-d0e52ff9d613\",\"time_check\":\"460f2760f4155ef453e2a2a42895fd32f14fc59685977a6f44d9e1d2e96fe9b2\",\"code_adam\":\"khanarif2009\",\"dr_firestone\":31071809}');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `type` varchar(16) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(256) NOT NULL,
  `link` varchar(512) DEFAULT 'NULL',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `type`, `type_id`, `image`, `link`, `date_added`) VALUES
(1, 'default', 0, 'uploads/media/2025/banner.jpg', '', '2025-12-19 17:41:36'),
(2, 'default', 0, 'uploads/media/2026/WhatsApp_Image_2026-01-17_at_5_39_55_PM.jpeg', '', '2026-01-05 13:51:48');

-- --------------------------------------------------------

--
-- Table structure for table `system_notification`
--

CREATE TABLE `system_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(256) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `read_by` tinyint(4) DEFAULT 0,
  `date_sent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `title` mediumtext DEFAULT NULL,
  `percentage` mediumtext NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `slug` varchar(32) NOT NULL,
  `image` varchar(512) DEFAULT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `image`, `is_default`, `status`, `created_on`) VALUES
(1, 'Classic', 'classic', 'classic.jpg', 0, 0, '2021-02-26 14:48:01'),
(2, 'Modern', 'modern', 'modern.jpg', 1, 1, '2024-10-15 07:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `ticket_type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` int(11) NOT NULL,
  `user_type` text DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `attachments` varchar(512) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `from_time` time NOT NULL,
  `to_time` time NOT NULL,
  `last_order_time` time NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `transaction_type` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` varchar(128) DEFAULT NULL,
  `order_item_id` varchar(256) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `txn_id` varchar(256) DEFAULT NULL,
  `payu_txn_id` varchar(512) DEFAULT NULL,
  `amount` double NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `currency_code` varchar(5) DEFAULT NULL,
  `payer_email` varchar(64) DEFAULT NULL,
  `message` varchar(128) NOT NULL,
  `transaction_date` timestamp NULL DEFAULT current_timestamp(),
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_refund` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 = default , 1= refund'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `version` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `updates`
--

INSERT INTO `updates` (`id`, `version`) VALUES
(1, '1.0'),
(2, '1.1'),
(3, '1.1.1'),
(4, '1.1.2'),
(5, '2.0.0'),
(6, '2.0.1'),
(7, '2.0.2'),
(8, '2.0.3'),
(9, '2.0.3.1'),
(10, '2.0.3.2'),
(11, '2.0.4'),
(12, '2.0.5'),
(13, '2.0.5.1'),
(14, '2.0.5.2'),
(15, '2.1.0'),
(16, '2.1.0.1'),
(17, '2.1.1'),
(18, '2.2.0'),
(19, '3.0.0'),
(20, '3.0.1'),
(21, '3.0.2'),
(22, '3.0.3'),
(23, '3.0.4'),
(24, '3.0.4.1'),
(25, '3.0.5'),
(28, '3.0.6'),
(29, '4.0.0'),
(30, '4.0.1'),
(31, '4.0.2'),
(32, '4.0.3'),
(33, '4.0.4'),
(34, '4.0.5'),
(35, '4.0.5.1'),
(36, '4.0.6'),
(37, '4.0.6.1'),
(39, '4.1.0'),
(40, '4.2.0'),
(41, '4.3.0'),
(42, '4.4.0'),
(43, '4.4.1'),
(52, '4.4.2'),
(53, '4.4.3'),
(54, '4.4.4'),
(55, '4.4.5'),
(56, '4.4.6');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `balance` double DEFAULT 0,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `web_fcm` varchar(1024) DEFAULT NULL,
  `last_online` int(11) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bonus_type` varchar(30) DEFAULT 'percentage_per_order',
  `bonus` int(11) DEFAULT NULL,
  `cash_received` double(15,2) NOT NULL DEFAULT 0.00,
  `dob` varchar(16) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `city` text DEFAULT NULL,
  `area` text DEFAULT NULL,
  `street` text DEFAULT NULL,
  `pincode` varchar(32) DEFAULT NULL,
  `apikey` varchar(2048) DEFAULT NULL,
  `referral_code` varchar(32) DEFAULT NULL,
  `friends_code` varchar(28) DEFAULT NULL,
  `fcm_id` text DEFAULT NULL,
  `latitude` varchar(64) DEFAULT NULL,
  `longitude` varchar(64) DEFAULT NULL,
  `type` varchar(256) NOT NULL DEFAULT 'phone',
  `driving_license` varchar(1024) DEFAULT 'NULL',
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `mobile`, `image`, `balance`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `web_fcm`, `last_online`, `active`, `company`, `address`, `bonus_type`, `bonus`, `cash_received`, `dob`, `country_code`, `city`, `area`, `street`, `pincode`, `apikey`, `referral_code`, `friends_code`, `fcm_id`, `latitude`, `longitude`, `type`, `driving_license`, `status`, `created_at`) VALUES
(1, '127.0.0.1', 'Administrator', '$2y$12$IVy5TXuvCLlgIvq0ZN.cAOncxGa4qWWluR9nXTys05QrEYVKS1I0q', 'admin@ecoleaf.store', '9999999999', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1268889823, 1773032154, NULL, 1766166595, 1, 'ADMIN', NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, '44', '138', NULL, NULL, NULL, NULL, NULL, 'dJXa6kH3Tzm6NBGwON5fhe:APA91bEFYijAUaRSRliyj0JXMTFm7SRGtXBFWoIOwH8f7VwkdG5xy0JsUpBH8sqO-_dGGZFxkP1oocj3kpKh-gOfkVDsaiqUYE_lunE7dlCqec9W-iL4kda6vO7qtOn7pFsAk6D2qLwz', NULL, NULL, 'phone', 'NULL', 0, '2020-06-30 10:20:08'),
(2, '223.233.84.30', 'test', '$2y$10$/2hS3W7kb3CrI7ZHIcJG4OHYEJNpHIHGe/cko/Ur.YhUm6KHQLR0O', 'test@gail.com', '8777777777', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767271214, 1767694547, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjcyNzEyMTQsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODA3MjE0LCJ1c2VyX2lkIjoiMiIsImlkZW50aXR5IjoiODc3Nzc3Nzc3NyIsImVtYWlsIjpudWxsfQ.GTAYcEZdZUZ1sTOGkDIiiGQrP3HpgZ0eVV-qMUUiTrY', NULL, NULL, '1111', '18.6155008', '73.7476608', 'phone', 'NULL', 0, '2026-01-01 12:40:14'),
(3, '103.110.16.43', 'sahil', '$2y$10$VMrT.69dWi6uTDQMZNUYL.S0I7Is4z9odELAPNR9e0cjvLIgREpui', 'test@gmail.com', '1234567890', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767281692, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjcyODE2OTIsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODE3NjkyLCJ1c2VyX2lkIjoiMyIsImlkZW50aXR5IjoiMTIzNDU2Nzg5MCIsImVtYWlsIjpudWxsfQ.hn4-yjgr8fDtOYSe964Paqr6nZ1qQ3_cM3bWqdLOdRE', NULL, NULL, NULL, '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-01 15:34:52'),
(4, '103.110.16.43', 'sahil', '$2y$10$YnlUct3Y1WVnUnDi7Z5eseZPB5iA5OVx4IvMIxBdPevPge6qGbI5C', 'demo@gmail.com', '1234567891', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767282217, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjcyODIyMTcsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODE4MjE3LCJ1c2VyX2lkIjoiNCIsImlkZW50aXR5IjoiMTIzNDU2Nzg5MSIsImVtYWlsIjpudWxsfQ.eyBQFT4Db-4otQaRRNFS4WWrGO9cdn6OE_XGwc1zsOk', NULL, NULL, NULL, '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-01 15:43:37'),
(5, '103.110.16.43', 'sahil', '$2y$10$Ja5UcATQAz/m.keo8kGbmOhcs8JpkEskKI5s9fpAYVE3m45ykiTLO', 'demot@gmail.com', '1234567892', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767282425, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjcyODI0MjUsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODE4NDI1LCJ1c2VyX2lkIjoiNSIsImlkZW50aXR5IjoiMTIzNDU2Nzg5MiIsImVtYWlsIjpudWxsfQ.D11joPnLiMH2WvkDgAk5FXTcWFUm7JABGkck6JRZeS4', NULL, NULL, NULL, '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-01 15:47:05'),
(6, '103.110.16.43', 'amaan', '$2y$10$BLp37MUnBkOm86qEHtU/2.ryi9NP6j9ClxeIjm2uV9P32leurTany', 'sahila@gmail.com', '1234567899', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767335190, 1767335358, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjczMzUxOTAsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODcxMTkwLCJ1c2VyX2lkIjoiNiIsImlkZW50aXR5IjoiMTIzNDU2Nzg5OSIsImVtYWlsIjpudWxsfQ.2svkD6fswphH9Ia__Th7qQHSyNjilRSl1YjKREjzxE4', NULL, NULL, 'etraWYAbQfCBFlEmPV_WZb:APA91bGnraUE3uATbysuWCcNGPq2zaWuFK5qZtlS-UmWNyQDrhb3WAXoEo0SXIAb09QcnOUNin5neGkWSUwSa4HsUtdCWr-i5DhklDFy13gCvlGeYIsh4Gw', '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-02 06:26:30'),
(7, '103.110.16.43', 'shoaib', '$2y$10$0cLFunacfuINWXTZ/bpE1uBWw.k6lHXVLdfD0.fChMowgfILiItYi', 's@gmail.com', '1234567888', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767335442, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjczMzU0NDIsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODcxNDQyLCJ1c2VyX2lkIjoiNyIsImlkZW50aXR5IjoiMTIzNDU2Nzg4OCIsImVtYWlsIjpudWxsfQ.L_FjKj0j5fwFnwKWpRmwrevZrxI7QfvBm6xCYj5wfno', NULL, NULL, NULL, '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-02 06:30:42'),
(8, '103.110.16.43', 'Sahilam', '$2y$10$18J3MqxLUkxm9Cy.2NNUHO6pdMJtJeFm1THw8RRl9TC2t3QB60SJW', 'sahilam@gmail.com', '9354460575', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767335644, 1767335676, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NjczMzU2NDQsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk4ODcxNjQ0LCJ1c2VyX2lkIjoiOCIsImlkZW50aXR5IjoiOTM1NDQ2MDU3NSIsImVtYWlsIjpudWxsfQ.ssXNS8Dm0iTtgdzth6EPdh1bhXtekuDpxTBnexj2CTw', NULL, NULL, 'etraWYAbQfCBFlEmPV_WZb:APA91bHfdo1JcIiFKaXC1_dF3d9VulDiO5FSN_8L3mFbQpjzmeLlXIqxwdJQjQHtZHEVG8-US460cpiuesxWhwC-PimGToDK0MNPEiDRfpiQnmF-JbWllEk', '37.4219983', '-122.084', 'phone', 'NULL', 0, '2026-01-02 06:34:04'),
(9, '103.134.114.133', 'Amaaan', '$2y$10$RJOzdd9crKEICkvyBf1e4eWrW01xPQJhSZPIQwCZ7dgZt7q9D44Bi', 'amaan@gmail.com', '1111111114', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767504378, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Njc1MDQzNzgsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk5MDQwMzc4LCJ1c2VyX2lkIjoiOSIsImlkZW50aXR5IjoiMTExMTExMTExNCIsImVtYWlsIjpudWxsfQ.rIhtY1Dod9_J-MOFODc5ULq6tVfyFTorqv0nP3SVAAw', NULL, NULL, NULL, '12.8461867', '77.6708133', 'phone', 'NULL', 0, '2026-01-04 05:26:18'),
(10, '106.192.115.41', 'test', '$2y$10$OsnvLeDhu6YCzY9bOdthDufUjR3f1Np50f0z2KkQAmiPROLizWS.i', 'krushi@seleconit.com', '9665027030', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767593487, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Njc1OTM0ODcsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk5MTI5NDg3LCJ1c2VyX2lkIjoiMTAiLCJpZGVudGl0eSI6Ijk2NjUwMjcwMzAiLCJlbWFpbCI6bnVsbH0.NLjF2R-p7G6soG667hqGbCrlpHov1IzUKq4QcHe-EXc', NULL, NULL, NULL, '17.6873535', '74.0007053', 'phone', 'NULL', 0, '2026-01-05 06:11:27'),
(11, '103.110.16.163', 'md Shoaib', '$2y$10$ranS5T1RG9JN7LEglhCaVennEZF96EvGZ3R9oqQkdu2p/yjuMhvZO', 'mdshoaib018@gmail.com', '9654570253', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1767626453, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Njc2MjY0NTMsImlzcyI6ImVzaG9wIiwiZXhwIjoxNzk5MTYyNDUzLCJ1c2VyX2lkIjoiMTEiLCJpZGVudGl0eSI6Ijk2NTQ1NzAyNTMiLCJlbWFpbCI6bnVsbH0.F7utoShRYBBQH-8L0XUeaVKZLDRfuppNXrME2Jb00uU', NULL, NULL, NULL, '28.5729123', '77.0244077', 'phone', 'NULL', 0, '2026-01-05 15:20:53'),
(12, '27.59.111.145', 'test test', '$2y$10$BBPmPcSVR7DY3P4u5XmWNONYildOeVOYqfbJp8W5Ry9AgOwuOGeQK', 'test1@gmail.com', '7777777777', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1769500385, 1770987164, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, '10-10-2000', 91, '3', NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3Njk1MDAzODUsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAxMDM2Mzg1LCJ1c2VyX2lkIjoiMTIiLCJpZGVudGl0eSI6Ijc3Nzc3Nzc3NzciLCJlbWFpbCI6bnVsbH0.xqDMmStNTt0_SqmRhrepNOQr5KlHY0IE5_pzyfYPEfI', NULL, NULL, '1111', NULL, NULL, 'phone', 'NULL', 0, '2026-01-27 07:53:05'),
(13, '223.233.87.120', 'test test', '$2y$10$MqxWmPYHtTvm/vlDBSk7/.lG3pV3d/7yhR4N9uTk31BeFgFe4yX.2', 'test1@gmail1.com', '7777777771', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770270188, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, '10-10-2000', 91, '3', NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzAyNzAxODgsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAxODA2MTg4LCJ1c2VyX2lkIjoiMTMiLCJpZGVudGl0eSI6Ijc3Nzc3Nzc3NzEiLCJlbWFpbCI6bnVsbH0.eSy2fLg9iWbmzLhBHgRvkz2TuzHuEj8VlXZF0j85_Kk', NULL, NULL, NULL, NULL, NULL, 'phone', 'NULL', 0, '2026-02-05 05:43:08'),
(14, '43.250.156.136', 'test T', '$2y$10$sShUYL7MRCbqPH3xlCe6/.qDkYDKqsjEGQC9lHnPJMZjPydbW46kK', 'asq@gmail.com', '12345678808', 'image.jpg', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770273488, 1770955490, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzAyNzM0ODgsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAxODA5NDg4LCJ1c2VyX2lkIjoiMTQiLCJpZGVudGl0eSI6IjEyMzQ1Njc4ODA4IiwiZW1haWwiOm51bGx9.SeNaYLZSlfB3fhiDzoz2ncq1-s07aBTwS1v-PcTOoSY', NULL, NULL, '1111', NULL, NULL, 'phone', 'NULL', 0, '2026-02-05 06:38:08'),
(15, '223.233.85.40', 'test', '$2y$10$ufOKmWinMdwhAw66Dgi6MeUuHwS72xiQ.xsEdi4JZm5oCXiNClUs.', 'jvjgs@shshs.xjxhd', '8275997116', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770475773, 1770475796, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzA0NzU3NzMsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAyMDExNzczLCJ1c2VyX2lkIjoiMTUiLCJpZGVudGl0eSI6IjgyNzU5OTcxMTYiLCJlbWFpbCI6bnVsbH0.LRgLvlelBAPI3XpiIrTtY4a4Y3Z7YxBtG5OiEUP2lMI', NULL, NULL, '1111', NULL, NULL, 'phone', 'NULL', 0, '2026-02-07 14:49:33'),
(16, '223.233.85.40', 'sahyadri', '$2y$10$Dhj6/HyAzPWcv2gdp6GOLeZwBl96F7mbstp.o6bFqQixVmd0nOEoi', 'test@ecofresh.in', '9850500077', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770476387, 1770476419, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzA0NzYzODcsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAyMDEyMzg3LCJ1c2VyX2lkIjoiMTYiLCJpZGVudGl0eSI6Ijk4NTA1MDAwNzciLCJlbWFpbCI6bnVsbH0.CV-snAr0mMlrKPxfQXHF9fd-qDO3Mn9-7JF3XuubhEg', NULL, NULL, '1111', NULL, NULL, 'phone', 'NULL', 0, '2026-02-07 14:59:47'),
(17, '103.247.6.197', 'Ganesh', '$2y$10$C0VGiEvV8GApxVY.lc.X.OLzIMCkjUXycPMrESnhz29Qw4Hgq55o6', 'ganesha100071@gmail.com', '7420802133', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770531650, 1770531768, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzA1MzE2NTAsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAyMDY3NjUwLCJ1c2VyX2lkIjoiMTciLCJpZGVudGl0eSI6Ijc0MjA4MDIxMzMiLCJlbWFpbCI6bnVsbH0.DowxKS-xVrCnmDKRUrxsm8Ka6YyZ2O8ASpAzUVPYAfE', NULL, NULL, '1111', NULL, NULL, 'phone', 'NULL', 0, '2026-02-08 06:20:50'),
(18, '103.141.91.102', 'sahil', '$2y$10$kN72jH041W7RiYsh2PMXeufe0/kmqtG/nA3O2ON2R10KtXcKBfbxa', 'sahil@gmail.com', '9354460571', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1770900034, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzA5MDAwMzQsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAyNDM2MDM0LCJ1c2VyX2lkIjoiMTgiLCJpZGVudGl0eSI6IjkzNTQ0NjA1NzEiLCJlbWFpbCI6bnVsbH0.Qt5c6NQaTKeEZjxSWRLkaJPUr8yghilUJEpOquS_Qwg', NULL, NULL, NULL, '28.5809067', '77.0290983', 'phone', 'NULL', 0, '2026-02-12 12:40:34'),
(19, '103.134.102.31', 'aabid', '$2y$10$yC8FyKJ.7c87xU2/ibO5E.dU0yYn22ce1ccRUPrydYgfsKOdv9h4K', 'aabidhussainpas@gmail.com', '8264782290', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1771753826, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzE3NTM4MjYsImlzcyI6ImVzaG9wIiwiZXhwIjoxODAzMjg5ODI2LCJ1c2VyX2lkIjoiMTkiLCJpZGVudGl0eSI6IjgyNjQ3ODIyOTAiLCJlbWFpbCI6bnVsbH0.iL8xcbu0RYyy4g70EvhAsRTvrS08q0_xSeqQRYNNmr4', NULL, NULL, NULL, '28.7027027027027', '77.3618026152663', 'phone', 'NULL', 0, '2026-02-22 09:50:26'),
(20, '223.181.30.67', 'test', '$2y$10$ATLvBBFtbJ04rPYL5/Z.A.sGCrkPBVY/AXW2fOkKO/PSYsBHGfWfa', 'shan@gmail.com', '6203089926', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1772537847, NULL, NULL, NULL, 1, NULL, NULL, 'percentage_per_order', NULL, 0.00, NULL, 91, NULL, NULL, NULL, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3NzI1Mzc4NDcsImlzcyI6ImVzaG9wIiwiZXhwIjoxODA0MDczODQ3LCJ1c2VyX2lkIjoiMjAiLCJpZGVudGl0eSI6IjYyMDMwODk5MjYiLCJlbWFpbCI6bnVsbH0.fKUpL8EmOH4lJn0QeRqlcPaeeHokU1z0VyCSbptqp1Q', NULL, NULL, NULL, '0.0', '0.0', 'phone', 'NULL', 0, '2026-03-03 11:37:27');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(15, 15, 2),
(16, 16, 2),
(17, 17, 2),
(18, 18, 2),
(19, 19, 2),
(20, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_fcm`
--

CREATE TABLE `user_fcm` (
  `id` int(11) NOT NULL,
  `fcm_id` varchar(1024) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` int(11) NOT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `created_by` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permissions`
--

INSERT INTO `user_permissions` (`id`, `user_id`, `role`, `permissions`, `created_by`) VALUES
(1, 1, 0, NULL, '2020-11-17 23:14:05');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL COMMENT 'credit | debit',
  `amount` double NOT NULL,
  `message` varchar(512) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zipcodes`
--

CREATE TABLE `zipcodes` (
  `id` int(11) NOT NULL,
  `zipcode` varchar(512) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `minimum_free_delivery_order_amount` double NOT NULL DEFAULT 0,
  `delivery_charges` double DEFAULT 0,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `2026_crop_master`
--
ALTER TABLE `2026_crop_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2026_crop_steps`
--
ALTER TABLE `2026_crop_steps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2026_crop_step_details`
--
ALTER TABLE `2026_crop_step_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `2026_services`
--
ALTER TABLE `2026_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_set_id` (`attribute_set_id`);

--
-- Indexes for table `attribute_set`
--
ALTER TABLE `attribute_set`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_variant_id` (`product_variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_api_keys`
--
ALTER TABLE `client_api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_notifications`
--
ALTER TABLE `custom_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_sms`
--
ALTER TABLE `custom_sms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `digital_orders_mails`
--
ALTER TABLE `digital_orders_mails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `flash_sale`
--
ALTER TABLE `flash_sale`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_sliders`
--
ALTER TABLE `offer_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`);

--
-- Indexes for table `order_bank_transfer`
--
ALTER TABLE `order_bank_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_variant_id` (`product_variant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_tracking`
--
ALTER TABLE `order_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_requests`
--
ALTER TABLE `payment_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `popup_offers`
--
ALTER TABLE `popup_offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_faqs`
--
ALTER TABLE `product_faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_reasons`
--
ALTER TABLE `return_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `return_requests`
--
ALTER TABLE `return_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variable` (`variable`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_notification`
--
ALTER TABLE `system_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `zipcodes`
--
ALTER TABLE `zipcodes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `2026_crop_master`
--
ALTER TABLE `2026_crop_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `2026_crop_steps`
--
ALTER TABLE `2026_crop_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `2026_crop_step_details`
--
ALTER TABLE `2026_crop_step_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `2026_services`
--
ALTER TABLE `2026_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_set`
--
ALTER TABLE `attribute_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_api_keys`
--
ALTER TABLE `client_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `custom_notifications`
--
ALTER TABLE `custom_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_sms`
--
ALTER TABLE `custom_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `delivery_boy_notifications`
--
ALTER TABLE `delivery_boy_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `digital_orders_mails`
--
ALTER TABLE `digital_orders_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `flash_sale`
--
ALTER TABLE `flash_sale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fund_transfers`
--
ALTER TABLE `fund_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offer_sliders`
--
ALTER TABLE `offer_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_bank_transfer`
--
ALTER TABLE `order_bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_tracking`
--
ALTER TABLE `order_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_requests`
--
ALTER TABLE `payment_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_locations`
--
ALTER TABLE `pickup_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `popup_offers`
--
ALTER TABLE `popup_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_faqs`
--
ALTER TABLE `product_faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_rating`
--
ALTER TABLE `product_rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_reasons`
--
ALTER TABLE `return_reasons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `return_requests`
--
ALTER TABLE `return_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_notification`
--
ALTER TABLE `system_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user_permissions`
--
ALTER TABLE `user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zipcodes`
--
ALTER TABLE `zipcodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
