-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2023-12-28 16:17:04
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `web_development`
--

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add custom user', 6, 'add_customuser'),
(22, 'Can change custom user', 6, 'change_customuser'),
(23, 'Can delete custom user', 6, 'delete_customuser'),
(24, 'Can view custom user', 6, 'view_customuser'),
(25, 'Can add cart', 7, 'add_cart'),
(26, 'Can change cart', 7, 'change_cart'),
(27, 'Can delete cart', 7, 'delete_cart'),
(28, 'Can view cart', 7, 'view_cart'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add buyer', 9, 'add_buyer'),
(34, 'Can change buyer', 9, 'change_buyer'),
(35, 'Can delete buyer', 9, 'delete_buyer'),
(36, 'Can view buyer', 9, 'view_buyer'),
(37, 'Can add seller', 10, 'add_seller'),
(38, 'Can change seller', 10, 'change_seller'),
(39, 'Can delete seller', 10, 'delete_seller'),
(40, 'Can view seller', 10, 'view_seller'),
(41, 'Can add cart item', 11, 'add_cartitem'),
(42, 'Can change cart item', 11, 'change_cartitem'),
(43, 'Can delete cart item', 11, 'delete_cartitem'),
(44, 'Can view cart item', 11, 'view_cartitem');

-- --------------------------------------------------------

--
-- 資料表結構 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(9, 'users', 'buyer'),
(7, 'users', 'cart'),
(11, 'users', 'cartitem'),
(6, 'users', 'customuser'),
(8, 'users', 'product'),
(10, 'users', 'seller');

-- --------------------------------------------------------

--
-- 資料表結構 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-12-27 20:26:08.963391'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-12-27 20:26:09.009924'),
(3, 'auth', '0001_initial', '2023-12-27 20:26:09.198055'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-12-27 20:26:09.263623'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-12-27 20:26:09.268874'),
(6, 'auth', '0004_alter_user_username_opts', '2023-12-27 20:26:09.272452'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-12-27 20:26:09.277218'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-12-27 20:26:09.279252'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-12-27 20:26:09.284452'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-12-27 20:26:09.288584'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-12-27 20:26:09.292532'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-12-27 20:26:09.300824'),
(13, 'auth', '0011_update_proxy_permissions', '2023-12-27 20:26:09.306083'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-12-27 20:26:09.310395'),
(15, 'users', '0001_initial', '2023-12-27 20:26:09.827516'),
(16, 'admin', '0001_initial', '2023-12-27 20:26:09.932072'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-12-27 20:26:09.937907'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-27 20:26:09.946593'),
(19, 'sessions', '0001_initial', '2023-12-27 20:26:09.996453'),
(23, 'users', '0002_remove_cartitem_user', '2023-12-27 21:28:38.368146');

-- --------------------------------------------------------

--
-- 資料表結構 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0kb8bz6wdo2aypndpfu4xmqx1wu6yi6a', '.eJxVzLkOwjAQRdF_cY2s8ToOJT0Vora8jEkA2VKcVIh_h0gpoD73vRfzYV1Gv3aa_ZTZkV0vAKDY4RdiSA-qm-Z7qLfGU6vLPEW-JXzXzs8t0_O0t38HY-jjd210SMlmJ4LDwUXSwkUQyqAyRDqXQiCBCkhEUMkgKqsliiGCskLayN4fta44GA:1rIrym:uei1Gut8_rtiNsUpORERsFU-_0q0Kq17Ublp9aKvGj4', '2024-01-11 15:07:24.295510'),
('narq4m5kjhpb2dsp274bw1hptms4fzwj', '.eJxVjLEOwiAURf-F2RBKoUVHdyfj3FweD1s1kJR2Mv67NOmg6z3n3LcYsC7jsBaehymIk7hdlVKtOPwCD3py2mh4IN2zpJyWefJyU-ROi7zkwK_z7v4djChjrXtrFLzWzDZYg6anPsauDebIsC6iTmgsiBvPjkzbsQbpWhiGcYD4fAHcIDo9:1rHdR4:k3oTATHyPuZt7IdENF3_sLnLrKvYqO0M976teGygY-U', '2024-01-08 05:23:30.665810');

-- --------------------------------------------------------

--
-- 資料表結構 `users_buyer`
--

CREATE TABLE `users_buyer` (
  `user_id` varchar(6) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_buyer`
--

INSERT INTO `users_buyer` (`user_id`, `gender`, `birth_date`) VALUES
('US0004', 'male', '2000-01-01'),
('US0005', 'male', '2003-06-06'),
('US0006', 'female', '2006-03-03'),
('US0008', 'female', '2010-10-10');

-- --------------------------------------------------------

--
-- 資料表結構 `users_cart`
--

CREATE TABLE `users_cart` (
  `cart_id` varchar(6) NOT NULL,
  `user_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_cart`
--

INSERT INTO `users_cart` (`cart_id`, `user_id`) VALUES
('CR0001', 'US0003');

-- --------------------------------------------------------

--
-- 資料表結構 `users_cartitem`
--

CREATE TABLE `users_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `cart_id` varchar(6) NOT NULL,
  `product_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_cartitem`
--

INSERT INTO `users_cartitem` (`id`, `quantity`, `cart_id`, `product_id`) VALUES
(13, 1, 'CR0001', 'PR0008');

-- --------------------------------------------------------

--
-- 資料表結構 `users_customuser`
--

CREATE TABLE `users_customuser` (
  `last_login` datetime(6) DEFAULT NULL,
  `user_id` varchar(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_customuser`
--

INSERT INTO `users_customuser` (`last_login`, `user_id`, `name`, `account`, `password`, `address`, `email`, `phone_number`, `permission`, `status`, `is_staff`, `is_superuser`) VALUES
('2023-12-25 04:20:52.225814', 'US0001', 'hsiao', 'hsiao', 'pbkdf2_sha256$600000$VTtH5d6mdCxq7RzYXjlNjD$oEVbJbcLQ/bA0WJgc2hFQ7ibBJVbxFcbP4bjW4SdfNE=', 'earth', '110590063@ntut.edu.tw', '12', 2, 0, 1, 1),
('2023-12-28 14:44:26.356056', 'US0002', 'ben', 'ben111', 'pbkdf2_sha256$600000$aty2elGddibRVnnqoLaXp4$2xElsa4QdQ8kZUsvtmWv6pTla53NrYQ+CQSmY54A09A=', 'earth', 'ben111@gmail.com', '123456789', 1, 0, 0, 0),
('2023-12-28 15:07:24.295510', 'US0003', 'yuan', 'yuan625', 'pbkdf2_sha256$600000$bP6HW0HdBVTVXmeBLOAZls$CLG3pEAXOExvtXcgyiLulrrlPihNLOtFC7jkK3Fa5y0=', 'moon', 'yuan625@gmail.com', '987654321', 1, 0, 0, 0),
('2023-12-28 14:21:45.552182', 'US0004', 'choco', 'choco234', 'pbkdf2_sha256$600000$6mObBPHY02tznJw7LzSBPw$mfw1lsOsBy87gXH9QZczErVz/ILJMTYxCLEgt2EGaB4=', 'mars', 'choco234@gmail.com', '13579000', 0, 0, 0, 0),
('2023-12-28 14:23:06.372805', 'US0005', 'yulun', 'yulun606', 'pbkdf2_sha256$600000$DVFMxP7imHQvum2aKELbuE$jEXOKIMSw/RQwlVClgLexrzVdAwVm+QCxA/eww06Ct4=', 'earth', 'yulun606@gmail.com', '060606060', 0, 0, 0, 0),
('2023-12-28 14:24:13.619610', 'US0006', 'chen', 'chen033', 'pbkdf2_sha256$600000$3WuXFkv6ekUFs5X479sUu6$sWCs+TS6HPIgG7Goy3CyFcM4rxjOBNjO95HIMvIG5DQ=', 'moon', 'chen033@gmail.com', '111222333', 0, 0, 0, 0),
('2023-12-28 14:48:07.510214', 'US0007', 'kuan', 'kuan217', 'pbkdf2_sha256$600000$maKKwVRwEXS6bWRMu3QI9o$9ub++LxyE/+5jtk1sGIO+r+hQArqIj2H0QeAiDUGRKQ=', 'mars', 'kuan217@gmail.com', '111555777', 1, 0, 0, 0),
('2023-12-28 14:27:33.668963', 'US0008', 'lee', 'lee817', 'pbkdf2_sha256$600000$N1zFO1EuMJnfq1f8bLk12d$B52d8zD8CRl0t/S6OVN3myN/kQChY3isVV0ckULygmo=', 'earth', 'lee817@gmail.com', '888999321', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `users_customuser_groups`
--

CREATE TABLE `users_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` varchar(6) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users_customuser_user_permissions`
--

CREATE TABLE `users_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` varchar(6) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `users_product`
--

CREATE TABLE `users_product` (
  `product_id` varchar(6) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description_of_product` longtext NOT NULL,
  `picture_in_browsing` varchar(100) DEFAULT NULL,
  `picture_in_description` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity_in_stock` int(10) UNSIGNED NOT NULL CHECK (`quantity_in_stock` >= 0),
  `is_active` tinyint(1) NOT NULL,
  `seller_id` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_product`
--

INSERT INTO `users_product` (`product_id`, `product_name`, `description_of_product`, `picture_in_browsing`, `picture_in_description`, `price`, `quantity_in_stock`, `is_active`, `seller_id`) VALUES
('PR0001', '豪華寵物石套裝', '我們的頂級豪華寵物石套裝附有定制設計的棲息地和一本有關石頭護理的指南。', '', '', 600.00, 50, 1, 'US0003'),
('PR0002', '貴族', '這是一個精緻的石頭寶貝，擁有高貴血統的石頭寶貝，能夠在眾多石頭寶貝中閃耀。', 'browsing_pictures/OIG.jpg', 'description_pictures/OIG.jpg', 250000.00, 2, 1, 'US0003'),
('PR0003', '限量版金色石頭', '一塊罕見而獨特的寵物石頭，塗有一層閃亮的金色，奢華至極。', '', '', 1500.00, 3, 1, 'US0002'),
('PR0004', '自己塗鴉的寵物石頭套裝', '使用這個DIY套裝釋放創造力，包括一塊普通的寵物石頭和一組鮮豔的顏料。', '', '', 450.00, 40, 1, 'US0002'),
('PR0005', '迷你石頭寶貝', '一塊小巧、可愛的石頭寶貝，適合各種顧客飼養。', '', '', 300.00, 10, 1, 'US0002'),
('PR0006', '寵物石頭SPA護理套餐', '這是一項專為寵物石頭設計的SPA套餐，包括溫泉浸泡和獨特的能量按摩。', '', '', 100.00, 999, 1, 'US0007'),
('PR0007', '寵物石頭造型藝術', '讓您的寵物石頭變得獨一無二，體驗專業的石頭造型藝術。', '', '', 80.00, 999, 1, 'US0007'),
('PR0008', '寵物石頭瑜伽課程', '與您的寵物石頭一同參加瑜伽課程，促進身心靈的和諧。', '', '', 120.00, 999, 1, 'US0007'),
('PR0009', '寵物石頭按摩放鬆', '提供專業的寵物石頭按摩服務，緩解寵物石頭的壓力。', '', '', 90.00, 999, 1, 'US0007'),
('PR0010', '寵物石頭能量平衡療法', '通過獨特的能量平衡療法，為您的寵物石頭創造一個和諧的能量場。', '', '', 150.00, 999, 1, 'US0007'),
('PR0011', '寵物石頭音樂療法', '透過音樂療法，為您的寵物石頭提供一場心靈之旅。', '', '', 250.00, 999, 1, 'US0007');

-- --------------------------------------------------------

--
-- 資料表結構 `users_seller`
--

CREATE TABLE `users_seller` (
  `user_id` varchar(6) NOT NULL,
  `join_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_seller`
--

INSERT INTO `users_seller` (`user_id`, `join_date`) VALUES
('US0002', '2023-12-28'),
('US0003', '2023-12-28'),
('US0007', '2023-12-28');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 資料表索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- 資料表索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_users_customuser_user_id` (`user_id`);

--
-- 資料表索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 資料表索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 資料表索引 `users_buyer`
--
ALTER TABLE `users_buyer`
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `users_cart`
--
ALTER TABLE `users_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 資料表索引 `users_cartitem`
--
ALTER TABLE `users_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_cartitem_cart_id_45de6e61_fk_users_cart_cart_id` (`cart_id`),
  ADD KEY `users_cartitem_product_id_4edf6161_fk_users_product_product_id` (`product_id`);

--
-- 資料表索引 `users_customuser`
--
ALTER TABLE `users_customuser`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `account` (`account`);

--
-- 資料表索引 `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_customuser_groups_customuser_id_group_id_76b619e3_uniq` (`customuser_id`,`group_id`),
  ADD KEY `users_customuser_groups_group_id_01390b14_fk_auth_group_id` (`group_id`);

--
-- 資料表索引 `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `users_product`
--
ALTER TABLE `users_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `users_product_seller_id_94ccedc5_fk_users_seller_user_id` (`seller_id`);

--
-- 資料表索引 `users_seller`
--
ALTER TABLE `users_seller`
  ADD PRIMARY KEY (`user_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users_cartitem`
--
ALTER TABLE `users_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 資料表的限制式 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 資料表的限制式 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`user_id`);

--
-- 資料表的限制式 `users_buyer`
--
ALTER TABLE `users_buyer`
  ADD CONSTRAINT `users_buyer_user_id_7cf892a7_fk_users_customuser_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`user_id`);

--
-- 資料表的限制式 `users_cart`
--
ALTER TABLE `users_cart`
  ADD CONSTRAINT `users_cart_user_id_01be2ef5_fk_users_customuser_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`user_id`);

--
-- 資料表的限制式 `users_cartitem`
--
ALTER TABLE `users_cartitem`
  ADD CONSTRAINT `users_cartitem_cart_id_45de6e61_fk_users_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `users_cart` (`cart_id`),
  ADD CONSTRAINT `users_cartitem_product_id_4edf6161_fk_users_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `users_product` (`product_id`);

--
-- 資料表的限制式 `users_customuser_groups`
--
ALTER TABLE `users_customuser_groups`
  ADD CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`user_id`),
  ADD CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 資料表的限制式 `users_customuser_user_permissions`
--
ALTER TABLE `users_customuser_user_permissions`
  ADD CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`user_id`),
  ADD CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- 資料表的限制式 `users_product`
--
ALTER TABLE `users_product`
  ADD CONSTRAINT `users_product_seller_id_94ccedc5_fk_users_seller_user_id` FOREIGN KEY (`seller_id`) REFERENCES `users_seller` (`user_id`);

--
-- 資料表的限制式 `users_seller`
--
ALTER TABLE `users_seller`
  ADD CONSTRAINT `users_seller_user_id_f3433642_fk_users_customuser_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
