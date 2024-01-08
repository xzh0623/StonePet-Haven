-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2024-01-08 05:31:03
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

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
(29, 'Can add order', 8, 'add_order'),
(30, 'Can change order', 8, 'change_order'),
(31, 'Can delete order', 8, 'delete_order'),
(32, 'Can view order', 8, 'view_order'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add buyer', 10, 'add_buyer'),
(38, 'Can change buyer', 10, 'change_buyer'),
(39, 'Can delete buyer', 10, 'delete_buyer'),
(40, 'Can view buyer', 10, 'view_buyer'),
(41, 'Can add seller', 11, 'add_seller'),
(42, 'Can change seller', 11, 'change_seller'),
(43, 'Can delete seller', 11, 'delete_seller'),
(44, 'Can view seller', 11, 'view_seller'),
(45, 'Can add order item', 12, 'add_orderitem'),
(46, 'Can change order item', 12, 'change_orderitem'),
(47, 'Can delete order item', 12, 'delete_orderitem'),
(48, 'Can view order item', 12, 'view_orderitem'),
(49, 'Can add cart item', 13, 'add_cartitem'),
(50, 'Can change cart item', 13, 'change_cartitem'),
(51, 'Can delete cart item', 13, 'delete_cartitem'),
(52, 'Can view cart item', 13, 'view_cartitem');

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

--
-- 傾印資料表的資料 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-12-31 19:45:07.658798', 'PR0002', '貴族', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 8, 'US0001'),
(2, '2023-12-31 19:48:38.133412', 'PR0001', '豪華石頭套裝', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Picture in browsing\", \"Picture in description\"]}}]', 8, 'US0001'),
(3, '2023-12-31 20:10:02.791419', 'PR0002', '尊爵不凡', 2, '[{\"changed\": {\"fields\": [\"Product name\", \"Picture in browsing\", \"Picture in description\"]}}]', 8, 'US0001'),
(4, '2023-12-31 23:34:18.772019', 'PR0003', '限量版金色石頭', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 8, 'US0001'),
(5, '2024-01-01 00:02:12.822665', 'PR0001', '豪華石頭套裝', 2, '[{\"changed\": {\"fields\": [\"Quantity in stock\"]}}]', 8, 'US0001'),
(6, '2024-01-01 00:02:16.752001', 'PR0002', '尊爵不凡', 2, '[{\"changed\": {\"fields\": [\"Quantity in stock\"]}}]', 8, 'US0001'),
(7, '2024-01-01 00:02:19.583205', 'PR0003', '限量版金色石頭', 2, '[{\"changed\": {\"fields\": [\"Quantity in stock\"]}}]', 8, 'US0001'),
(8, '2024-01-01 00:02:24.006512', 'PR0004', '自己塗鴉的寵物石頭套裝', 2, '[{\"changed\": {\"fields\": [\"Quantity in stock\"]}}]', 8, 'US0001'),
(9, '2024-01-01 00:02:28.342826', 'PR0005', '迷你石頭寶貝', 2, '[{\"changed\": {\"fields\": [\"Quantity in stock\"]}}]', 8, 'US0001'),
(10, '2024-01-02 21:37:07.785852', 'PR0001', '豪華石頭套裝', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 9, 'US0001'),
(11, '2024-01-02 21:53:28.978259', 'PR0004', '自己塗鴉的寵物石頭套裝', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(12, '2024-01-02 21:54:32.311437', 'PR0005', '迷你石頭寶貝', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(13, '2024-01-02 21:56:39.870835', 'PR0006', '寵物石頭SPA護理套餐', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(14, '2024-01-02 21:57:39.231903', 'PR0007', '寵物石頭造型藝術', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(15, '2024-01-02 22:00:07.312097', 'PR0008', '寵物石頭瑜伽課程', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(16, '2024-01-02 22:01:03.297516', 'PR0009', '寵物石頭按摩放鬆', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(17, '2024-01-02 22:02:43.651710', 'PR0010', '寵物石頭能量平衡療法', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(18, '2024-01-02 22:05:02.382398', 'PR0006', '寵物石頭SPA護理套餐', 2, '[{\"changed\": {\"fields\": [\"Picture in browsing\", \"Picture in description\"]}}]', 9, 'US0001'),
(19, '2024-01-02 22:14:00.125706', 'PR0011', '寵物石頭音樂療法', 1, '[{\"added\": {}}]', 9, 'US0001'),
(20, '2024-01-02 22:19:25.920685', 'PR0011', '寵物石頭音樂療法', 1, '[{\"added\": {}}]', 9, 'US0001'),
(21, '2024-01-02 22:20:15.306396', 'PR0011', '寵物石頭音樂療法', 1, '[{\"added\": {}}]', 9, 'US0001');

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
(10, 'users', 'buyer'),
(7, 'users', 'cart'),
(13, 'users', 'cartitem'),
(6, 'users', 'customuser'),
(8, 'users', 'order'),
(12, 'users', 'orderitem'),
(9, 'users', 'product'),
(11, 'users', 'seller');

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
(1, 'contenttypes', '0001_initial', '2024-01-01 01:16:24.216763'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-01-01 01:16:24.257657'),
(3, 'auth', '0001_initial', '2024-01-01 01:16:24.441381'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-01-01 01:16:24.483936'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-01-01 01:16:24.488825'),
(6, 'auth', '0004_alter_user_username_opts', '2024-01-01 01:16:24.493034'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-01-01 01:16:24.498162'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-01-01 01:16:24.499965'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-01-01 01:16:24.504278'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-01-01 01:16:24.509590'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-01-01 01:16:24.509590'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-01-01 01:16:24.521880'),
(13, 'auth', '0011_update_proxy_permissions', '2024-01-01 01:16:24.526523'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-01-01 01:16:24.533540'),
(15, 'users', '0001_initial', '2024-01-01 01:16:25.216533'),
(16, 'admin', '0001_initial', '2024-01-01 01:16:25.318372'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-01-01 01:16:25.321956'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-01 01:16:25.332396'),
(19, 'sessions', '0001_initial', '2024-01-01 01:16:25.361588');

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
('narq4m5kjhpb2dsp274bw1hptms4fzwj', '.eJxVjLEOwiAURf-F2RBKoUVHdyfj3FweD1s1kJR2Mv67NOmg6z3n3LcYsC7jsBaehymIk7hdlVKtOPwCD3py2mh4IN2zpJyWefJyU-ROi7zkwK_z7v4djChjrXtrFLzWzDZYg6anPsauDebIsC6iTmgsiBvPjkzbsQbpWhiGcYD4fAHcIDo9:1rHdR4:k3oTATHyPuZt7IdENF3_sLnLrKvYqO0M976teGygY-U', '2024-01-08 05:23:30.665810'),
('omilmx3gqfr0c8wetq0x4577ossr3yth', '.eJxVzLEOwiAUheF3YTbkQilXHN07GWdygYtUTUlKOxnfXZt00Pn7z3kJT-tS_Np49mMSJ3G9AIASh18IFB88bZruNN2qjHVa5jHILZG7NjnUxM_z3v4dFGrlu44GUWuKxDlmgqi1sgjstAN3tNligp6sCowdh2RZqR4MgjUcCLscxPsDyJ85Lg:1rKn0F:8Mf9H1Bu8pgY7b7rL_IKJ7NgyLlx2BgOX1RegM-uc84', '2024-01-16 22:12:51.156926'),
('t12y2td39rza2xqhuhzbjsrn2b4w7rf7', '.eJxVzLEOwiAUheF3YTbkQilXHN07GWdygYtUTUlKOxnfXZt00Pn7z3kJT-tS_Np49mMSJ3G9AIASh18IFB88bZruNN2qjHVa5jHILZG7NjnUxM_z3v4dFGrlu44GUWuKxDlmgqi1sgjstAN3tNligp6sCowdh2RZqR4MgjUcCLscxPsDyJ85Lg:1rIsLp:dhVDt6k0RMP2nzmSUNh5KVVKXkvNpjCLQ-nIk3MGQ4g', '2024-01-11 15:31:13.747760'),
('zboywa07a2b9naj4hb6v5mvilssm76fw', '.eJxVzLEOwiAUheF3YTbkQilXHN07GWdygYtUTUlKOxnfXZt00Pn7z3kJT-tS_Np49mMSJ3G9AIASh18IFB88bZruNN2qjHVa5jHILZG7NjnUxM_z3v4dFGrlu44GUWuKxDlmgqi1sgjstAN3tNligp6sCowdh2RZqR4MgjUcCLscxPsDyJ85Lg:1rMhCe:asKvHtTcioo7gUOH5lhNkNmq-QD0Aq_w8PdWky2RUdM', '2024-01-22 04:25:32.271793');

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
('US0006', 'female', '2006-03-03');

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
('CR0003', 'US0001'),
('CR0001', 'US0003'),
('CR0002', 'US0004'),
('CR0004', 'US0006');

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
(17, 2, 'CR0003', 'PR0006'),
(18, 1, 'CR0003', 'PR0007'),
(19, 1, 'CR0003', 'PR0008'),
(20, 1, 'CR0003', 'PR0009'),
(21, 1, 'CR0003', 'PR0010'),
(27, 2, 'CR0003', 'PR0001');

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
('2024-01-08 04:25:32.268460', 'US0001', 'hsiao', 'hsiao', 'pbkdf2_sha256$600000$VTtH5d6mdCxq7RzYXjlNjD$oEVbJbcLQ/bA0WJgc2hFQ7ibBJVbxFcbP4bjW4SdfNE=', 'earth', '110590063@ntut.edu.tw', '12', 2, 0, 1, 1),
('2023-12-28 14:44:26.356056', 'US0002', 'ben', 'ben111', 'pbkdf2_sha256$600000$aty2elGddibRVnnqoLaXp4$2xElsa4QdQ8kZUsvtmWv6pTla53NrYQ+CQSmY54A09A=', 'earth', 'ben111@gmail.com', '123456789', 1, 0, 0, 0),
('2024-01-03 11:38:55.803198', 'US0003', 'yuan', 'yuan625', 'pbkdf2_sha256$600000$bP6HW0HdBVTVXmeBLOAZls$CLG3pEAXOExvtXcgyiLulrrlPihNLOtFC7jkK3Fa5y0=', 'moon', 'yuan625@gmail.com', '987654321', 1, 0, 0, 0),
('2024-01-08 04:19:17.382274', 'US0004', 'choco', 'choco234', 'pbkdf2_sha256$600000$6mObBPHY02tznJw7LzSBPw$mfw1lsOsBy87gXH9QZczErVz/ILJMTYxCLEgt2EGaB4=', 'mars', 'choco234@gmail.com', '13579000', 0, 0, 0, 0),
('2023-12-28 14:23:06.372805', 'US0005', 'yulun', 'yulun606', 'pbkdf2_sha256$600000$DVFMxP7imHQvum2aKELbuE$jEXOKIMSw/RQwlVClgLexrzVdAwVm+QCxA/eww06Ct4=', 'earth', 'yulun606@gmail.com', '060606060', 0, 0, 0, 0),
('2024-01-02 22:02:53.744389', 'US0006', 'chen', 'chen033', 'pbkdf2_sha256$600000$3WuXFkv6ekUFs5X479sUu6$sWCs+TS6HPIgG7Goy3CyFcM4rxjOBNjO95HIMvIG5DQ=', 'moon', 'chen033@gmail.com', '111222333', 0, 0, 0, 0),
('2023-12-28 14:48:07.510214', 'US0007', 'kuan', 'kuan217', 'pbkdf2_sha256$600000$maKKwVRwEXS6bWRMu3QI9o$9ub++LxyE/+5jtk1sGIO+r+hQArqIj2H0QeAiDUGRKQ=', 'mars', 'kuan217@gmail.com', '111555777', 1, 0, 0, 0);

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
-- 資料表結構 `users_order`
--

CREATE TABLE `users_order` (
  `order_id` varchar(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `delivery_method` varchar(50) NOT NULL,
  `credit_card` varchar(16) DEFAULT NULL,
  `expiration_date` varchar(7) DEFAULT NULL,
  `order_status` varchar(20) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `order_completed_date` datetime(6) DEFAULT NULL,
  `user_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_order`
--

INSERT INTO `users_order` (`order_id`, `name`, `address`, `payment_method`, `delivery_method`, `credit_card`, `expiration_date`, `order_status`, `order_date`, `order_completed_date`, `user_id`) VALUES
('OR0001', 'hsiao', 'moon', 'cash', 'cash_on_delivery', '', '', 'pending_payment', '2024-01-01 01:17:47.528165', NULL, 'US0001'),
('OR0002', 'chen', 'mars', 'credit_card', 'store_pickup_credit_card', '4705155834826655', '12/2029', 'pending_payment', '2024-01-02 22:03:57.601739', NULL, 'US0006'),
('OR0003', 'choco', 'moon', 'credit_card', 'store_pickup_cash', '', '', 'pending_payment', '2024-01-02 22:07:17.376403', NULL, 'US0004'),
('OR0004', 'choco', '48544', 'credit_card', 'cash_on_delivery', 'sdsdsadsadasddas', 'sdsdsds', 'pending_payment', '2024-01-04 04:23:29.762979', NULL, 'US0004'),
('OR0005', 'choco', 'addasd', 'credit_card', 'cash_on_delivery', 'sddsadsadsadsads', 'saddasd', 'pending_payment', '2024-01-04 04:23:58.515585', NULL, 'US0004'),
('OR0006', 'choco', '45919191985', 'credit_card', 'cash_on_delivery', '4516516516516516', '1616161', 'pending_payment', '2024-01-04 04:25:21.493228', NULL, 'US0004');

-- --------------------------------------------------------

--
-- 資料表結構 `users_orderitem`
--

CREATE TABLE `users_orderitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `order_id` varchar(6) NOT NULL,
  `product_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `users_orderitem`
--

INSERT INTO `users_orderitem` (`id`, `quantity`, `order_id`, `product_id`) VALUES
(1, 2, 'OR0001', 'PR0001'),
(2, 1, 'OR0001', 'PR0002'),
(3, 1, 'OR0001', 'PR0003'),
(4, 1, 'OR0002', 'PR0008'),
(5, 1, 'OR0002', 'PR0004'),
(6, 1, 'OR0002', 'PR0006'),
(7, 1, 'OR0003', 'PR0010'),
(8, 1, 'OR0003', 'PR0009'),
(9, 1, 'OR0003', 'PR0005'),
(10, 1, 'OR0003', 'PR0007'),
(11, 1, 'OR0004', 'PR0002'),
(12, 1, 'OR0004', 'PR0001'),
(13, 1, 'OR0004', 'PR0006'),
(14, 3, 'OR0005', 'PR0001'),
(15, 3, 'OR0006', 'PR0001');

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
('PR0001', '豪華石頭套裝', '我們的頂級豪華寵物石套裝附有定制設計的棲息地和一本有關石頭護理的指南。', 'browsing_pictures/豪華石頭套裝.jpg', 'description_pictures/豪華石頭套裝.jpg', 600.00, 35, 1, 'US0003'),
('PR0002', '尊爵不凡', '這是一個精緻的石頭寶貝，擁有高貴血統的石頭寶貝，能夠在眾多石頭寶貝中閃耀。', 'browsing_pictures/Extraordinary_CteSo7C.jpg', 'description_pictures/Extraordinary_WFGdC32.jpg', 250000.00, 5, 1, 'US0003'),
('PR0003', '限量版金色石頭', '一塊罕見而獨特的寵物石頭，塗有一層閃亮的金色，奢華至極。', 'browsing_pictures/限量版金色石頭.jpg', 'description_pictures/限量版金色石頭.jpg', 1500.00, 6, 1, 'US0002'),
('PR0004', '自己塗鴉的寵物石頭套裝', '使用這個DIY套裝釋放創造力，包括一塊普通的寵物石頭和一組鮮豔的顏料。', 'browsing_pictures/自己塗鴉的寵物石頭套裝.jpg', 'description_pictures/自己塗鴉的寵物石頭套裝.jpg', 450.00, 49, 1, 'US0002'),
('PR0005', '迷你石頭寶貝', '一塊小巧、可愛的石頭寶貝，適合各種顧客飼養。', 'browsing_pictures/迷你石頭寶貝.jpg', 'description_pictures/迷你石頭寶貝.jpg', 300.00, 49, 1, 'US0002'),
('PR0006', '寵物石頭SPA護理套餐', '這是一項專為寵物石頭設計的SPA套餐，包括溫泉浸泡和獨特的能量按摩。', 'browsing_pictures/寵物石頭SPA護理套餐_8vdYgT2.jpg', 'description_pictures/寵物石頭SPA護理套餐_SVohfzp.jpg', 100.00, 997, 1, 'US0007'),
('PR0007', '寵物石頭造型藝術', '讓您的寵物石頭變得獨一無二，體驗專業的石頭造型藝術。', 'browsing_pictures/寵物石頭造型藝術.jpg', 'description_pictures/寵物石頭造型藝術.jpg', 80.00, 998, 1, 'US0007'),
('PR0008', '寵物石頭瑜伽課程', '與您的寵物石頭一同參加瑜伽課程，促進身心靈的和諧。', 'browsing_pictures/寵物石頭瑜伽課程.jpg', 'description_pictures/寵物石頭瑜伽課程.jpg', 120.00, 998, 1, 'US0007'),
('PR0009', '寵物石頭按摩放鬆', '提供專業的寵物石頭按摩服務，緩解寵物石頭的壓力。', 'browsing_pictures/寵物石頭按摩放鬆.jpg', 'description_pictures/寵物石頭按摩放鬆.jpg', 90.00, 998, 1, 'US0007'),
('PR0010', '寵物石頭能量平衡療法', '通過獨特的能量平衡療法，為您的寵物石頭創造一個和諧的能量場。', 'browsing_pictures/寵物石頭能量平衡療法.jpg', 'description_pictures/寵物石頭能量平衡療法.jpg', 150.00, 998, 1, 'US0007');

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
-- 資料表索引 `users_order`
--
ALTER TABLE `users_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `users_order_user_id_f6abf9f8_fk_users_customuser_user_id` (`user_id`);

--
-- 資料表索引 `users_orderitem`
--
ALTER TABLE `users_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_orderitem_order_id_c9e59aa1_fk_users_order_order_id` (`order_id`),
  ADD KEY `users_orderitem_product_id_e135a350_fk_users_product_product_id` (`product_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users_cartitem`
--
ALTER TABLE `users_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
-- 使用資料表自動遞增(AUTO_INCREMENT) `users_orderitem`
--
ALTER TABLE `users_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
-- 資料表的限制式 `users_order`
--
ALTER TABLE `users_order`
  ADD CONSTRAINT `users_order_user_id_f6abf9f8_fk_users_customuser_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`user_id`);

--
-- 資料表的限制式 `users_orderitem`
--
ALTER TABLE `users_orderitem`
  ADD CONSTRAINT `users_orderitem_order_id_c9e59aa1_fk_users_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `users_order` (`order_id`),
  ADD CONSTRAINT `users_orderitem_product_id_e135a350_fk_users_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `users_product` (`product_id`);

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
