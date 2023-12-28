-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2023-12-27 22:53:27
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
('CR0002', 'US0003'),
('CR0001', 'US0004');

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
(9, 2, 'CR0001', 'PR0001'),
(10, 1, 'CR0001', 'PR0002'),
(11, 1, 'CR0002', 'PR0001');

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
('2023-12-25 04:20:52.225814', '', 'hsiao', 'hsiao', 'pbkdf2_sha256$600000$VTtH5d6mdCxq7RzYXjlNjD$oEVbJbcLQ/bA0WJgc2hFQ7ibBJVbxFcbP4bjW4SdfNE=', 'earth', '110590063@ntut.edu.tw', '12', 2, 0, 1, 1),
('2023-12-24 17:54:26.602960', 'US0002', 'zxc', 'zxc', 'pbkdf2_sha256$600000$F5PFWKH9QXbXfGqfKhsuVG$vouHwZw5zTIjMCfTSOB3iJ3YpuGr00IUWKKRQRFinNU=', 'zxc', 'zxc@mail.com', 'zxc', 0, 0, 0, 0),
('2023-12-27 21:41:57.705380', 'US0003', 'asd', 'asd', 'pbkdf2_sha256$600000$6tGLTJfRtS42jw1xNA5Zz7$j1SwYC76D+J7RPc5qrIGh906zMM8VH+7+WrijoJDP1o=', 'asd', 'asd', 'asd', 1, 0, 0, 0),
('2023-12-27 20:28:13.232978', 'US0004', 'qwe', 'qwe', 'pbkdf2_sha256$600000$Ud226YTG5bOJyfYqvvlHFd$T0kmpJgeMp0CHR8XScFJCZVdDeWcXvfSKLyjnzWXPRQ=', 'qwe', 'qwe', 'qwe', 0, 0, 0, 0);

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
('PR0001', '1', '1', 'browsing_pictures/item1_HwOrnF7_qsGAOFQ.jpg', 'description_pictures/item1_ur9j5UA_gVruFu7.jpg', 13.00, 2, 1, 'US0003'),
('PR0002', '2', '2', 'browsing_pictures/item1_HwOrnF7_qsGAOFQ_fjVLujc.jpg', 'description_pictures/item1_ur9j5UA_gVruFu7_zq8mLYi.jpg', 32.00, 5, 1, 'US0003');

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
('US0003', '2023-12-24');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
