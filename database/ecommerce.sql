-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 01, 2020 at 05:42 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `store_id`, `created_at`, `updated_at`, `map`) VALUES
(1, 'الخضار', 3, '2020-07-18 06:38:15', '2020-07-18 06:38:15', NULL),
(2, 'الفواكه', 3, '2020-07-18 06:38:28', '2020-07-18 06:38:28', NULL),
(3, 'الحشائش', 3, '2020-07-18 06:38:41', '2020-07-18 06:38:41', NULL),
(4, 'خبز عربي', 2, '2020-07-18 06:38:56', '2020-07-18 06:38:56', NULL),
(5, 'خبز حمام', 2, '2020-07-18 06:39:08', '2020-07-18 06:39:08', NULL),
(6, 'خبز طابون', 2, '2020-07-18 06:39:20', '2020-07-18 06:39:20', NULL),
(7, 'كعك', 2, '2020-07-18 06:39:31', '2020-07-18 06:39:31', NULL),
(8, 'اللبان و الاجبان', 1, '2020-07-18 06:40:00', '2020-07-18 06:40:00', NULL),
(9, 'مكسرات', 1, '2020-07-18 06:40:16', '2020-07-18 06:40:16', NULL),
(10, 'محمص', 1, '2020-07-18 06:40:30', '2020-07-18 06:40:30', NULL),
(11, 'شبس و العصائر', 1, '2020-07-18 06:40:44', '2020-07-18 06:40:44', NULL),
(12, 'المواد التموينية', 1, '2020-07-18 06:41:05', '2020-07-18 06:41:05', NULL),
(13, 'المنظفات', 1, '2020-07-18 06:41:42', '2020-07-18 06:41:42', NULL),
(14, 'محجمدات و اللحوم', 1, '2020-07-18 06:42:07', '2020-07-18 06:42:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `name`, `image_url`, `description`, `created_at`, `updated_at`) VALUES
(1, 'الخضار والفواكه', 'carousels/July2020/2urMN4kFaWuSl79PD5ny.jpg', 'اكبر سوق للخضار و الفواكه في المنطقه باسعار تنافسية وبضائع طازجه', '2020-07-17 15:08:00', '2020-07-21 04:35:26'),
(3, 'مخابز عمران', 'carousels/July2020/s2rl4Zr2pRlBOfCYtk9V.jpg', 'اشترك الان بنظام توصيل الخبز اليومي الى المنزل', '2020-07-17 18:08:00', '2020-07-21 04:34:04'),
(4, 'المول', 'carousels/July2020/Skdo8RQOnnOkpvYmqCpw.jpg', 'يمكنك الان شراء كل ما تحتاجه من النظام الالكتروتي مع عمران', '2020-07-21 04:59:19', '2020-07-21 04:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-07-17 14:38:05', '2020-07-17 14:38:05');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'image_url', 'image', 'Image Url', 1, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(61, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(62, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 8, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(64, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(65, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(66, 9, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(68, 9, 'store_id', 'text', 'Store Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(69, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(70, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(71, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(72, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(73, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(74, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(75, 9, 'branch_hasone_branch_relationship', 'relationship', 'branches', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Store\",\"table\":\"stores\",\"type\":\"belongsTo\",\"column\":\"store_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(76, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(77, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(78, 11, 'image_url', 'image', 'Image Url', 0, 1, 1, 1, 1, 1, '{}', 3),
(79, 11, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 4),
(80, 11, 'weight_id', 'text', 'Weight Id', 1, 1, 1, 1, 1, 1, '{}', 5),
(81, 11, 'branch_id', 'text', 'Branch Id', 1, 1, 1, 1, 1, 1, '{}', 6),
(82, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(83, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(84, 11, 'product_belongsto_branch_relationship', 'relationship', 'branches', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Branch\",\"table\":\"branches\",\"type\":\"belongsTo\",\"column\":\"branch_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(85, 11, 'product_belongsto_weight_relationship', 'relationship', 'weights', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Weight\",\"table\":\"weights\",\"type\":\"belongsTo\",\"column\":\"weight_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(86, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(87, 12, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(88, 12, 'started_at', 'timestamp', 'Started At', 0, 1, 1, 1, 1, 1, '{}', 3),
(89, 12, 'Finished_at', 'timestamp', 'Finished At', 0, 1, 1, 1, 1, 1, '{}', 4),
(90, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5),
(91, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(92, 12, 'deal_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":null}', 7),
(93, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(94, 13, 'user_email', 'text', 'User Email', 1, 1, 1, 1, 1, 1, '{}', 2),
(95, 13, 'unique_id', 'text', 'Unique Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(96, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(97, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(98, 13, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_email\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":null}', 6),
(99, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 0),
(100, 14, 'product_id', 'text', 'Product Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(101, 14, 'order_id', 'text', 'Order Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(102, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(103, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(104, 14, 'order_detail_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"branches\",\"pivot\":\"0\",\"taggable\":null}', 6),
(105, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(106, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 12),
(107, 1, 'longitude', 'text', 'Longitude', 0, 0, 1, 0, 0, 1, '{}', 13),
(108, 1, 'latitude', 'text', 'Latitude', 0, 0, 1, 0, 0, 1, '{}', 14),
(109, 9, 'map', 'text', 'Map', 0, 1, 1, 1, 1, 1, '{}', 6);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-07-17 14:37:44', '2020-07-21 16:04:58'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-07-17 14:37:45', '2020-07-17 14:37:45'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-07-17 14:37:45', '2020-07-17 14:37:45'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-07-17 14:38:04', '2020-07-17 14:38:04'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-07-17 14:38:08', '2020-07-17 14:38:08'),
(7, 'carousels', 'carousels', 'Carousel', 'Carousels', NULL, 'App\\Carousel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(8, 'weights', 'weights', 'Weight', 'Weights', NULL, 'App\\Weight', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(9, 'branches', 'branches', 'Branch', 'Branches', NULL, 'App\\Branch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-18 06:33:35', '2020-07-24 06:22:48'),
(10, 'stores', 'stores', 'Store', 'Stores', NULL, 'App\\Store', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(11, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-18 06:42:36', '2020-07-18 06:44:38'),
(12, 'deals', 'deals', 'Deal', 'Deals', NULL, 'App\\Deal', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-18 08:50:42', '2020-07-18 08:50:42'),
(13, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(14, 'order_details', 'order-details', 'Order Detail', 'Order Details', NULL, 'App\\OrderDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-18 09:04:28', '2020-07-18 09:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `deals`
--

CREATE TABLE `deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `Finished_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deals`
--

INSERT INTO `deals` (`id`, `product_id`, `started_at`, `Finished_at`, `created_at`, `updated_at`) VALUES
(1, 3, '2020-07-18 11:52:00', '2020-07-19 11:52:00', '2020-07-18 08:52:17', '2020-07-18 08:52:17'),
(2, 5, '2020-07-21 07:52:00', '2020-07-22 07:52:00', '2020-07-21 04:52:00', '2020-07-21 13:29:03'),
(3, 4, '2020-07-21 08:11:00', '2020-07-22 08:11:00', '2020-07-21 05:11:20', '2020-07-21 05:11:20'),
(4, 7, '2020-07-21 16:29:00', '2020-07-22 16:29:00', '2020-07-21 13:29:18', '2020-07-21 13:29:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-07-17 14:37:47', '2020-07-17 14:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2020-07-17 14:37:47', '2020-07-17 14:37:47', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2020-07-17 14:37:47', '2020-07-17 14:37:47', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 13, '2020-07-17 14:37:53', '2020-07-17 14:37:53', 'voyager.hooks', NULL),
(12, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2020-07-17 14:38:05', '2020-07-17 14:38:05', 'voyager.categories.index', NULL),
(13, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2020-07-17 14:38:07', '2020-07-17 14:38:07', 'voyager.posts.index', NULL),
(14, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2020-07-17 14:38:09', '2020-07-17 14:38:09', 'voyager.pages.index', NULL),
(15, 1, 'Carousels', '', '_self', NULL, NULL, NULL, 15, '2020-07-17 15:01:56', '2020-07-17 15:01:56', 'voyager.carousels.index', NULL),
(16, 1, 'Weights', '', '_self', NULL, NULL, NULL, 16, '2020-07-18 06:32:07', '2020-07-18 06:32:07', 'voyager.weights.index', NULL),
(17, 1, 'Branches', '', '_self', NULL, NULL, NULL, 17, '2020-07-18 06:33:36', '2020-07-18 06:33:36', 'voyager.branches.index', NULL),
(18, 1, 'Stores', '', '_self', NULL, NULL, NULL, 18, '2020-07-18 06:33:50', '2020-07-18 06:33:50', 'voyager.stores.index', NULL),
(19, 1, 'Products', '', '_self', NULL, NULL, NULL, 19, '2020-07-18 06:42:36', '2020-07-18 06:42:36', 'voyager.products.index', NULL),
(20, 1, 'Deals', '', '_self', NULL, NULL, NULL, 20, '2020-07-18 08:50:43', '2020-07-18 08:50:43', 'voyager.deals.index', NULL),
(21, 1, 'Orders', '', '_self', NULL, NULL, NULL, 21, '2020-07-18 09:01:59', '2020-07-18 09:01:59', 'voyager.orders.index', NULL),
(22, 1, 'Order Details', '', '_self', NULL, NULL, NULL, 22, '2020-07-18 09:04:28', '2020-07-18 09:04:28', 'voyager.order-details.index', NULL),
(23, 1, 'Sales Charts', '', '_self', NULL, NULL, NULL, 23, '2020-07-31 12:54:39', '2020-07-31 12:54:39', 'voyager.order-details.index', 'NULL');

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_email`, `unique_id`, `created_at`, `updated_at`, `status`) VALUES
(30, '2', '2202007312003', '2020-07-30 21:00:00', NULL, 1),
(31, '2', '2202007312146', '2020-07-30 21:00:00', NULL, 1),
(32, '2', '2202007312242', '2020-07-30 21:00:00', NULL, 1),
(33, '2', '2202008010115', '2020-07-31 21:00:00', NULL, 4),
(34, '2', '2202008010946', '2020-07-31 21:00:00', NULL, 2),
(35, '4', '4202008011106', '2020-07-31 21:00:00', NULL, 2),
(36, '5', '5202008011820', '2020-07-31 21:00:00', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(72, 1, 30, '2020-07-30 21:00:00', NULL),
(73, 1, 30, '2020-07-30 21:00:00', NULL),
(74, 4, 30, '2020-07-30 21:00:00', NULL),
(75, 7, 30, '2020-07-30 21:00:00', NULL),
(76, 7, 30, '2020-07-30 21:00:00', NULL),
(77, 8, 31, '2020-07-30 21:00:00', NULL),
(78, 8, 31, '2020-07-30 21:00:00', NULL),
(79, 8, 31, '2020-07-30 21:00:00', NULL),
(80, 8, 31, '2020-07-30 21:00:00', NULL),
(81, 3, 32, '2020-07-30 21:00:00', NULL),
(82, 3, 32, '2020-07-30 21:00:00', NULL),
(83, 3, 32, '2020-07-30 21:00:00', NULL),
(84, 3, 33, '2020-07-31 21:00:00', NULL),
(85, 5, 33, '2020-07-31 21:00:00', NULL),
(86, 4, 33, '2020-07-31 21:00:00', NULL),
(87, 7, 33, '2020-07-31 21:00:00', NULL),
(88, 8, 33, '2020-07-31 21:00:00', NULL),
(89, 3, 33, '2020-07-31 21:00:00', NULL),
(90, 3, 33, '2020-07-31 21:00:00', NULL),
(91, 3, 33, '2020-07-31 21:00:00', NULL),
(92, 7, 33, '2020-07-31 21:00:00', NULL),
(93, 1, 33, '2020-07-31 21:00:00', NULL),
(94, 1, 33, '2020-07-31 21:00:00', NULL),
(95, 3, 33, '2020-07-31 21:00:00', NULL),
(96, 4, 33, '2020-07-31 21:00:00', NULL),
(97, 5, 33, '2020-07-31 21:00:00', NULL),
(98, 6, 33, '2020-07-31 21:00:00', NULL),
(99, 7, 33, '2020-07-31 21:00:00', NULL),
(100, 8, 33, '2020-07-31 21:00:00', NULL),
(101, 9, 33, '2020-07-31 21:00:00', NULL),
(102, 9, 33, '2020-07-31 21:00:00', NULL),
(103, 9, 33, '2020-07-31 21:00:00', NULL),
(104, 3, 34, '2020-07-31 21:00:00', NULL),
(105, 3, 35, '2020-07-31 21:00:00', NULL),
(106, 4, 35, '2020-07-31 21:00:00', NULL),
(107, 7, 35, '2020-07-31 21:00:00', NULL),
(108, 5, 35, '2020-07-31 21:00:00', NULL),
(109, 3, 35, '2020-07-31 21:00:00', NULL),
(110, 5, 35, '2020-07-31 21:00:00', NULL),
(111, 5, 35, '2020-07-31 21:00:00', NULL),
(112, 3, 36, '2020-07-31 21:00:00', NULL),
(113, 5, 36, '2020-07-31 21:00:00', NULL),
(114, 3, 36, '2020-07-31 21:00:00', NULL),
(115, 3, 36, '2020-07-31 21:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-07-17 14:38:09', '2020-07-17 14:38:09');

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
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(2, 'browse_bread', NULL, '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(3, 'browse_database', NULL, '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(4, 'browse_media', NULL, '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(5, 'browse_compass', NULL, '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(6, 'browse_menus', 'menus', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(7, 'read_menus', 'menus', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(8, 'edit_menus', 'menus', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(9, 'add_menus', 'menus', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(10, 'delete_menus', 'menus', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(11, 'browse_roles', 'roles', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(12, 'read_roles', 'roles', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(13, 'edit_roles', 'roles', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(14, 'add_roles', 'roles', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(15, 'delete_roles', 'roles', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(16, 'browse_users', 'users', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(17, 'read_users', 'users', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(18, 'edit_users', 'users', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(19, 'add_users', 'users', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(20, 'delete_users', 'users', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(21, 'browse_settings', 'settings', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(22, 'read_settings', 'settings', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(23, 'edit_settings', 'settings', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(24, 'add_settings', 'settings', '2020-07-17 14:37:49', '2020-07-17 14:37:49'),
(25, 'delete_settings', 'settings', '2020-07-17 14:37:50', '2020-07-17 14:37:50'),
(26, 'browse_hooks', NULL, '2020-07-17 14:37:53', '2020-07-17 14:37:53'),
(27, 'browse_categories', 'categories', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(28, 'read_categories', 'categories', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(29, 'edit_categories', 'categories', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(30, 'add_categories', 'categories', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(31, 'delete_categories', 'categories', '2020-07-17 14:38:05', '2020-07-17 14:38:05'),
(32, 'browse_posts', 'posts', '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(33, 'read_posts', 'posts', '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(34, 'edit_posts', 'posts', '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(35, 'add_posts', 'posts', '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(36, 'delete_posts', 'posts', '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(37, 'browse_pages', 'pages', '2020-07-17 14:38:09', '2020-07-17 14:38:09'),
(38, 'read_pages', 'pages', '2020-07-17 14:38:09', '2020-07-17 14:38:09'),
(39, 'edit_pages', 'pages', '2020-07-17 14:38:09', '2020-07-17 14:38:09'),
(40, 'add_pages', 'pages', '2020-07-17 14:38:09', '2020-07-17 14:38:09'),
(41, 'delete_pages', 'pages', '2020-07-17 14:38:09', '2020-07-17 14:38:09'),
(42, 'browse_carousels', 'carousels', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(43, 'read_carousels', 'carousels', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(44, 'edit_carousels', 'carousels', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(45, 'add_carousels', 'carousels', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(46, 'delete_carousels', 'carousels', '2020-07-17 15:01:56', '2020-07-17 15:01:56'),
(47, 'browse_weights', 'weights', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(48, 'read_weights', 'weights', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(49, 'edit_weights', 'weights', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(50, 'add_weights', 'weights', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(51, 'delete_weights', 'weights', '2020-07-18 06:32:07', '2020-07-18 06:32:07'),
(52, 'browse_branches', 'branches', '2020-07-18 06:33:36', '2020-07-18 06:33:36'),
(53, 'read_branches', 'branches', '2020-07-18 06:33:36', '2020-07-18 06:33:36'),
(54, 'edit_branches', 'branches', '2020-07-18 06:33:36', '2020-07-18 06:33:36'),
(55, 'add_branches', 'branches', '2020-07-18 06:33:36', '2020-07-18 06:33:36'),
(56, 'delete_branches', 'branches', '2020-07-18 06:33:36', '2020-07-18 06:33:36'),
(57, 'browse_stores', 'stores', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(58, 'read_stores', 'stores', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(59, 'edit_stores', 'stores', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(60, 'add_stores', 'stores', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(61, 'delete_stores', 'stores', '2020-07-18 06:33:50', '2020-07-18 06:33:50'),
(62, 'browse_products', 'products', '2020-07-18 06:42:36', '2020-07-18 06:42:36'),
(63, 'read_products', 'products', '2020-07-18 06:42:36', '2020-07-18 06:42:36'),
(64, 'edit_products', 'products', '2020-07-18 06:42:36', '2020-07-18 06:42:36'),
(65, 'add_products', 'products', '2020-07-18 06:42:36', '2020-07-18 06:42:36'),
(66, 'delete_products', 'products', '2020-07-18 06:42:36', '2020-07-18 06:42:36'),
(67, 'browse_deals', 'deals', '2020-07-18 08:50:42', '2020-07-18 08:50:42'),
(68, 'read_deals', 'deals', '2020-07-18 08:50:42', '2020-07-18 08:50:42'),
(69, 'edit_deals', 'deals', '2020-07-18 08:50:42', '2020-07-18 08:50:42'),
(70, 'add_deals', 'deals', '2020-07-18 08:50:43', '2020-07-18 08:50:43'),
(71, 'delete_deals', 'deals', '2020-07-18 08:50:43', '2020-07-18 08:50:43'),
(72, 'browse_orders', 'orders', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(73, 'read_orders', 'orders', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(74, 'edit_orders', 'orders', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(75, 'add_orders', 'orders', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(76, 'delete_orders', 'orders', '2020-07-18 09:01:59', '2020-07-18 09:01:59'),
(77, 'browse_order_details', 'order_details', '2020-07-18 09:04:28', '2020-07-18 09:04:28'),
(78, 'read_order_details', 'order_details', '2020-07-18 09:04:28', '2020-07-18 09:04:28'),
(79, 'edit_order_details', 'order_details', '2020-07-18 09:04:28', '2020-07-18 09:04:28'),
(80, 'add_order_details', 'order_details', '2020-07-18 09:04:28', '2020-07-18 09:04:28'),
(81, 'delete_order_details', 'order_details', '2020-07-18 09:04:28', '2020-07-18 09:04:28');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(4, 3),
(5, 1),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(11, 3),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(16, 3),
(17, 1),
(17, 3),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 3),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(42, 3),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(47, 3),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(52, 3),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(57, 3),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(62, 3),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(67, 3),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(72, 3),
(73, 1),
(73, 3),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(77, 3),
(78, 1),
(78, 3),
(79, 1),
(80, 1),
(81, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-17 14:38:07', '2020-07-17 14:38:07'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-07-17 14:38:08', '2020-07-17 14:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight_id` bigint(20) NOT NULL,
  `branch_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image_url`, `price`, `weight_id`, `branch_id`, `created_at`, `updated_at`) VALUES
(1, 'خبز حمام', 'products/July2020/IEbJcWBERNpXrzhRg9Ml.jpeg', '0.35', 1, 5, '2020-07-18 06:46:55', '2020-07-18 06:46:55'),
(3, 'بندوره', 'products/July2020/Un7aLOOsxirybEsyepPr.jpeg', '0.35', 1, 1, '2020-07-18 06:49:42', '2020-07-18 06:49:42'),
(4, 'خيار', 'products/July2020/0EiqQpnBvo704tqkZwpJ.jpg', '0.60', 1, 1, '2020-07-18 08:18:50', '2020-07-18 08:18:50'),
(5, 'بصل احمر', 'products/July2020/VGeuJrvvQFebhtWmbXVa.jpg', '0.35', 1, 1, '2020-07-21 05:13:43', '2020-07-21 05:13:43'),
(6, 'بصل بلدي', 'products/July2020/nrZ00Ee1mXr8CpgFRQ09.jpeg', '0.35', 1, 1, '2020-07-21 05:35:38', '2020-07-21 05:35:38'),
(7, 'بطاطا', 'products/July2020/nyB9rkUVmr3KjE6MZzTJ.jpg', '0.35', 1, 1, '2020-07-21 05:36:00', '2020-07-21 05:40:00'),
(8, 'جبنة', 'products/July2020/V7UfbrUly9niQZ9cLakZ.jpg', '2.65', 1, 8, '2020-07-26 05:55:38', '2020-07-26 05:55:38'),
(9, 'بقدونس', 'products/July2020/jkCjsWMHq882gwRSo1i1.jpg', '0.10', 5, 3, '2020-07-26 06:05:33', '2020-07-26 06:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-07-17 14:37:47', '2020-07-17 14:37:47'),
(2, 'user', 'Normal User', '2020-07-17 14:37:48', '2020-07-17 14:37:48'),
(3, 'driver', 'Driver', '2020-07-31 17:34:26', '2020-07-31 17:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Emran', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Emran', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Emran', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Emran. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'المول', '2020-07-18 06:37:06', '2020-07-18 06:37:06'),
(2, 'المخبز', '2020-07-18 06:37:00', '2020-07-18 06:37:31'),
(3, 'الخضار و الفواكه', '2020-07-18 06:37:43', '2020-07-18 06:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-07-17 14:38:10', '2020-07-17 14:38:10'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-07-17 14:38:11', '2020-07-17 14:38:11'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-07-17 14:38:12', '2020-07-17 14:38:12'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-07-17 14:38:12', '2020-07-17 14:38:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `longitude`, `latitude`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$BUwYbyW3noVEbV9EfYsuceo4fyIQxKnCG1weg3XaehGBnkRAZdaV6', 'PpXVlfS2bcLeipkNA7h7LyvSsLtefg7sVHNm8hFHlTaoCuGrQNzvKORrPPaJ', '{\"locale\":\"en\"}', '2020-07-17 14:38:05', '2020-07-21 15:59:16', NULL, '35.939', '31.9522'),
(2, 1, 'yousef', 'yousefabuanzah2@gmail.com', 'users/default.png', NULL, '$2y$10$f2xJisJv85AteUo2A7r4Per8tagySKOS0mWIuoAZ0mBWKWpSvwRKC', NULL, '{\"locale\":\"en\"}', '2020-07-18 06:14:39', '2020-08-01 03:42:28', '0790402732', '35.939', '31.9522'),
(3, 2, 'normal_user', 'normal@gmail.com', 'users/default.png', NULL, '$2y$10$xoYLtKurxnQLtVdRBm8JZu1t3OBhxeBOz46U0arUazMK.xqD0PpDO', NULL, '{\"locale\":\"en\"}', '2020-07-31 10:16:01', '2020-07-31 10:16:01', '079000000000', NULL, NULL),
(4, 3, 'driver', 'driver@gmail.com', 'users/August2020/8plfToRDcvC29R0hSHkC.png', NULL, '$2y$10$LqUshGIZ4Wy5UwE3pWUMaugc0uwoUkg128d4muB.PN3fSV8RT2nuW', NULL, '{\"locale\":\"en\"}', '2020-07-31 17:35:11', '2020-08-01 12:09:52', '0790000000', '35.939', '31.9522'),
(5, 2, 'Cacher', 'cacher@gmail.com', 'users/default.png', NULL, '$2y$10$fopVhAEXKJcNxfGAfz9bF.CYq.OXOJGLUGaiviUc73TV0BWhiqYpy', NULL, NULL, '2020-08-01 12:18:11', '2020-08-01 12:18:11', '0790402732', '35.9224032', '31.8737542');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(2, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'KG', '2020-07-18 06:32:20', '2020-07-18 06:32:20'),
(2, 'بكسه', '2020-07-18 06:32:45', '2020-07-18 06:32:45'),
(3, 'حبة', '2020-07-18 06:32:54', '2020-07-18 06:32:54'),
(4, 'شوال', '2020-07-18 06:33:01', '2020-07-18 06:33:01'),
(5, 'ضمة', '2020-07-26 06:04:47', '2020-07-26 06:04:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `deals`
--
ALTER TABLE `deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `deals`
--
ALTER TABLE `deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
