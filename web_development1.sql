-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2023-12-11 12:22:33
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
-- 資料表結構 `administrator`
--

CREATE TABLE `administrator` (
  `user_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `administrator`
--

INSERT INTO `administrator` (`user_id`) VALUES
('US0006');

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add coupon', 7, 'add_coupon'),
(26, 'Can change coupon', 7, 'change_coupon'),
(27, 'Can delete coupon', 7, 'delete_coupon'),
(28, 'Can view coupon', 7, 'view_coupon'),
(29, 'Can add order', 8, 'add_order'),
(30, 'Can change order', 8, 'change_order'),
(31, 'Can delete order', 8, 'delete_order'),
(32, 'Can view order', 8, 'view_order'),
(33, 'Can add product', 9, 'add_product'),
(34, 'Can change product', 9, 'change_product'),
(35, 'Can delete product', 9, 'delete_product'),
(36, 'Can view product', 9, 'view_product'),
(37, 'Can add shopping cart', 10, 'add_shoppingcart'),
(38, 'Can change shopping cart', 10, 'change_shoppingcart'),
(39, 'Can delete shopping cart', 10, 'delete_shoppingcart'),
(40, 'Can view shopping cart', 10, 'view_shoppingcart'),
(41, 'Can add test table', 11, 'add_testtable'),
(42, 'Can change test table', 11, 'change_testtable'),
(43, 'Can delete test table', 11, 'delete_testtable'),
(44, 'Can view test table', 11, 'view_testtable'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add administrator', 13, 'add_administrator'),
(50, 'Can change administrator', 13, 'change_administrator'),
(51, 'Can delete administrator', 13, 'delete_administrator'),
(52, 'Can view administrator', 13, 'view_administrator'),
(53, 'Can add buyer', 14, 'add_buyer'),
(54, 'Can change buyer', 14, 'change_buyer'),
(55, 'Can delete buyer', 14, 'delete_buyer'),
(56, 'Can view buyer', 14, 'view_buyer'),
(57, 'Can add contain', 15, 'add_contain'),
(58, 'Can change contain', 15, 'change_contain'),
(59, 'Can delete contain', 15, 'delete_contain'),
(60, 'Can view contain', 15, 'view_contain'),
(61, 'Can add product sales', 16, 'add_productsales'),
(62, 'Can change product sales', 16, 'change_productsales'),
(63, 'Can delete product sales', 16, 'delete_productsales'),
(64, 'Can view product sales', 16, 'view_productsales'),
(65, 'Can add seller', 17, 'add_seller'),
(66, 'Can change seller', 17, 'change_seller'),
(67, 'Can delete seller', 17, 'delete_seller'),
(68, 'Can view seller', 17, 'view_seller'),
(69, 'Can add manage', 18, 'add_manage'),
(70, 'Can change manage', 18, 'change_manage'),
(71, 'Can delete manage', 18, 'delete_manage'),
(72, 'Can view manage', 18, 'view_manage'),
(73, 'Can add purchase', 19, 'add_purchase'),
(74, 'Can change purchase', 19, 'change_purchase'),
(75, 'Can delete purchase', 19, 'delete_purchase'),
(76, 'Can view purchase', 19, 'view_purchase');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$CmlWqogfZdarkJ60yYh6LO$YDCLKpSjOuGl6hUVChFotHO2exg8oDWLbH/brvWpvgI=', '2023-12-11 08:31:08.689920', 1, 'user', '', '', 't110590063@ntut.org.tw', 1, 1, '2023-12-11 08:30:44.069654');

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `buyer`
--

CREATE TABLE `buyer` (
  `user_id` char(6) NOT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `buyer`
--

INSERT INTO `buyer` (`user_id`, `sex`, `age`) VALUES
('US0001', 1, 20),
('US0002', 1, 35);

-- --------------------------------------------------------

--
-- 資料表結構 `contain`
--

CREATE TABLE `contain` (
  `product_id` char(6) NOT NULL,
  `order_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `contain`
--

INSERT INTO `contain` (`product_id`, `order_id`) VALUES
('PR0001', 'OR0001'),
('PR0002', 'OR0002'),
('PR0003', 'OR0003'),
('PR0004', 'OR0004'),
('PR0005', 'OR0005');

-- --------------------------------------------------------

--
-- 資料表結構 `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` char(6) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `minimum_limit` int(11) NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `expired_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `seller_id` char(6) NOT NULL,
  `type_of_discount_policies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `discount_amount`, `minimum_limit`, `start_date`, `expired_date`, `seller_id`, `type_of_discount_policies`) VALUES
('CO0001', 10, 100, '2023-03-31 16:00:00', '2023-12-31 15:59:59', 'US0003', 0),
('CO0002', 60, 199, '2023-11-10 16:00:00', '2023-11-11 15:59:59', 'US0004', 1),
('CO0003', 30, 399, '2023-04-01 16:00:00', '2023-04-18 15:59:59', 'US0005', 2),
('CO0004', 50, 299, '2023-05-29 16:00:00', '2023-06-12 15:59:59', 'US0003', 1),
('CO0005', 10, 100, '2023-07-17 16:00:00', '2023-08-20 15:59:59', 'US0004', 2);

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
  `user_id` int(11) NOT NULL
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
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(13, 'users', 'administrator'),
(14, 'users', 'buyer'),
(15, 'users', 'contain'),
(7, 'users', 'coupon'),
(18, 'users', 'manage'),
(8, 'users', 'order'),
(9, 'users', 'product'),
(16, 'users', 'productsales'),
(19, 'users', 'purchase'),
(17, 'users', 'seller'),
(10, 'users', 'shoppingcart'),
(11, 'users', 'testtable'),
(12, 'users', 'user');

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
(1, 'contenttypes', '0001_initial', '2023-12-07 02:51:59.494858'),
(2, 'auth', '0001_initial', '2023-12-07 02:52:00.111852'),
(3, 'admin', '0001_initial', '2023-12-07 02:52:00.239950'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-12-07 02:52:00.247979'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-12-07 02:52:00.255956'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-12-07 02:52:00.320611'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-12-07 02:52:00.384638'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-12-07 02:52:00.400158'),
(9, 'auth', '0004_alter_user_username_opts', '2023-12-07 02:52:00.416172'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-12-07 02:52:00.464202'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-12-07 02:52:00.472207'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-12-07 02:52:00.480212'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-12-07 02:52:00.496247'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-12-07 02:52:00.512260'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-12-07 02:52:00.528269'),
(16, 'auth', '0011_update_proxy_permissions', '2023-12-07 02:52:00.544297'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-12-07 02:52:00.560290'),
(18, 'sessions', '0001_initial', '2023-12-07 02:52:00.592309'),
(19, 'users', '0001_initial', '2023-12-07 02:52:00.616326');

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
('qlypsfc0qwryi5an71hmrbjhjvc8tavr', '.eJxVjEEOwiAQRe_C2pAyhUFcuvcMZAZGqRpISrsy3l2bdKHb_977LxVpXUpcu8xxyuqkjDr8bkzpIXUD-U711nRqdZkn1puid9r1pWV5nnf376BQL9_aBne8imEMMKAZyBnrA4ALBELWMnsE4GTYsogdyWRK4wg-sUP0GNT7A7_vNzQ:1rCbgy:nGQQSxE6r-UBkmbulQHuelbQTj3ziHM1BXBqyhdJ8hE', '2023-12-25 08:31:08.689920');

-- --------------------------------------------------------

--
-- 資料表結構 `manage`
--

CREATE TABLE `manage` (
  `administrator_id` char(6) NOT NULL,
  `coupon_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `manage`
--

INSERT INTO `manage` (`administrator_id`, `coupon_id`) VALUES
('US0006', 'CO0001'),
('US0006', 'CO0002'),
('US0006', 'CO0003'),
('US0006', 'CO0004'),
('US0006', 'CO0005');

-- --------------------------------------------------------

--
-- 資料表結構 `order`
--

CREATE TABLE `order` (
  `order_id` char(6) NOT NULL,
  `order_end` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delivary_method` tinyint(1) NOT NULL,
  `delivary_address` varchar(255) NOT NULL,
  `delivary_fee` int(11) DEFAULT 60,
  `status` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `quantity_of_product` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `seller_id` char(6) NOT NULL,
  `coupon_id` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `order`
--

INSERT INTO `order` (`order_id`, `order_end`, `delivary_method`, `delivary_address`, `delivary_fee`, `status`, `order_date`, `quantity_of_product`, `comment`, `seller_id`, `coupon_id`) VALUES
('OR0001', '2023-03-31 16:00:00', 0, '台北市信義區松山路119巷3號', 60, 0, '2023-03-29 16:00:00', 3, NULL, 'US0003', NULL),
('OR0002', '2023-04-30 16:00:00', 0, '台北市信義區松山路119巷3號', 60, 0, '2023-04-29 16:00:00', 5, NULL, 'US0003', NULL),
('OR0003', '2023-06-06 16:00:00', 0, '台北市信義區松山路119巷3號', 60, 0, '2023-05-31 16:00:00', 3, NULL, 'US0004', NULL),
('OR0004', '2023-06-08 16:00:00', 0, '台北市信義區松山路119巷3號', 60, 0, '2023-06-07 16:00:00', 10, NULL, 'US0004', NULL),
('OR0005', '2023-01-31 16:00:00', 0, '台北市信義區松山路119巷3號', 60, 0, '2023-01-24 16:00:00', 1, NULL, 'US0005', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `product`
--

CREATE TABLE `product` (
  `product_id` char(6) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description_of_product` varchar(255) NOT NULL,
  `picture_in_browsing` varchar(255) NOT NULL,
  `picture_in_description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `seller_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `description_of_product`, `picture_in_browsing`, `picture_in_description`, `price`, `quantity_in_stock`, `seller_id`) VALUES
('PR0001', '呆萌小石頭', '天然獨一無二，為您的生活增添自然的愉悅。', 'item1.jpg', 'item1.jpg', 50, 100, 'US0003'),
('PR0002', '石頭明信片組', '發掘獨特的石頭風景，每張都是大自然的微縮奇蹟。', 'item2.jpg', 'item2.jpg', 199, 100, 'US0003'),
('PR0003', '溫馨石頭小家', '簡約中帶著溫馨，這是一個由石頭構成的小天地，將自然之美融入家的每一角。', 'item3.jpg', 'item3.jpg', 399, 100, 'US0003'),
('PR0004', '可愛石頭甜點屋', '甜蜜的石頭造型點心，讓您品嚐到獨一無二的甜蜜滋味。', 'item4.jpg', 'item4.jpg', 100, 100, 'US0004'),
('PR0005', '派大星冠軍石頭', '勇奪冠軍的石頭，展現出無可比擬的堅強與勝利。', 'item5.jpg', 'item5.jpg', 100, 100, 'US0004'),
('PR0006', '比奇堡現採石頭', '現場採集的石頭，是比奇堡獨特風格的象徵。', 'item6.jpg', 'item6.jpg', 100, 100, 'US0004'),
('PR0007', '海精靈石頭組', '擁有海洋風情的石頭組合，彷彿能聽見浪花的聲音。', 'item7.jpg', 'item7.jpg', 199, 100, 'US0005'),
('PR0008', '石頭珍珠貝殼', '珍珠般閃耀的石頭，宛如收藏的寶貝一般。', 'item8.jpg', 'item8.jpg', 399, 100, 'US0005'),
('PR0009', '爆炒鵝卵石', '火熱炒製的鵝卵石，散發著獨特的風味誘惑。', 'item9.jpg', 'item9.jpg', 100, 100, 'US0005'),
('PR0010', '派大星石頭屋', '由派大星親自打造的石頭屋，充滿童趣與奇幻。', 'item10.jpg', 'item10.jpg', 100, 100, 'US0005');

-- --------------------------------------------------------

--
-- 資料表結構 `product_sales`
--

CREATE TABLE `product_sales` (
  `daily` int(11) DEFAULT NULL,
  `monthly` int(11) DEFAULT NULL,
  `weekly` int(11) DEFAULT NULL,
  `product_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `product_sales`
--

INSERT INTO `product_sales` (`daily`, `monthly`, `weekly`, `product_id`) VALUES
(NULL, NULL, NULL, 'PR0001'),
(NULL, NULL, NULL, 'PR0002'),
(NULL, NULL, NULL, 'PR0003'),
(NULL, NULL, NULL, 'PR0004'),
(NULL, NULL, NULL, 'PR0005'),
(NULL, NULL, NULL, 'PR0006'),
(NULL, NULL, NULL, 'PR0007'),
(NULL, NULL, NULL, 'PR0008'),
(NULL, NULL, NULL, 'PR0009'),
(NULL, NULL, NULL, 'PR0010');

-- --------------------------------------------------------

--
-- 資料表結構 `purchase`
--

CREATE TABLE `purchase` (
  `buyer_id` char(6) NOT NULL,
  `product_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `purchase`
--

INSERT INTO `purchase` (`buyer_id`, `product_id`) VALUES
('US0001', 'PR0001'),
('US0001', 'PR0002'),
('US0001', 'PR0003'),
('US0001', 'PR0004'),
('US0001', 'PR0005');

-- --------------------------------------------------------

--
-- 資料表結構 `seller`
--

CREATE TABLE `seller` (
  `user_id` char(6) NOT NULL,
  `joint_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `seller`
--

INSERT INTO `seller` (`user_id`, `joint_date`) VALUES
('US0003', '2022-05-31 10:25:30'),
('US0004', '2022-09-11 12:50:22'),
('US0005', '2022-10-28 14:00:02');

-- --------------------------------------------------------

--
-- 資料表結構 `shopping_cart`
--

CREATE TABLE `shopping_cart` (
  `cart_id` char(6) NOT NULL,
  `buyer_id` char(6) NOT NULL,
  `order_id` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `shopping_cart`
--

INSERT INTO `shopping_cart` (`cart_id`, `buyer_id`, `order_id`) VALUES
('SH0001', 'US0001', 'OR0001'),
('SH0002', 'US0001', 'OR0002'),
('SH0003', 'US0001', 'OR0003'),
('SH0004', 'US0001', 'OR0004'),
('SH0005', 'US0001', 'OR0005');

-- --------------------------------------------------------

--
-- 資料表結構 `test_table`
--

CREATE TABLE `test_table` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `test_table`
--

INSERT INTO `test_table` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'Item 1', 'This is the description for Item 1.', '2023-12-05 15:28:38'),
(2, 'Item 2', 'Another item with a longer description. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2023-12-05 15:28:38'),
(3, 'Item 3', 'Description for Item 3.', '2023-12-05 15:28:38'),
(4, 'Item 4', 'Short description for Item 4.', '2023-12-05 15:28:38');

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE `user` (
  `user_id` char(6) NOT NULL,
  `name` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `permission` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `user`
--

INSERT INTO `user` (`user_id`, `name`, `account`, `password`, `address`, `email`, `phone_number`, `permission`, `status`) VALUES
('US0001', 'yulun', 'yulun0531', '110590050', '台北市信義區松山路119巷3號', 't110590050@ntut.org.tw', '0966375990', 0, 1),
('US0002', 'choco', 'choco', '110590036', '台北市中正區八德路一段1號', 't110590036@ntut.org.tw', '0965322840', 0, 1),
('US0003', 'xzh', '110590033', '110590033', '台北市內湖區舊宗路一段268號', 't110590033@ntut.org.tw', '0961345670', 1, 1),
('US0004', 'kuan', '110590006', '110590006', '台北市北投區明德路331巷35號1樓', 't110590006@ntut.org.tw', '095327406', 1, 1),
('US0005', 'xiao', '110590063', '110590063', '台北市大安區忠孝東路三段1號', 't110590063@ntut.org.tw', '123456789', 1, 1),
('US0006', 'admin', 'admin', 'admin', '台北市大安區忠孝東路三段1號', 'admin@test.com', '111111111', 2, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`user_id`);

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
-- 資料表索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 資料表索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- 資料表索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- 資料表索引 `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `contain`
--
ALTER TABLE `contain`
  ADD PRIMARY KEY (`product_id`,`order_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- 資料表索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

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
-- 資料表索引 `manage`
--
ALTER TABLE `manage`
  ADD PRIMARY KEY (`administrator_id`,`coupon_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- 資料表索引 `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- 資料表索引 `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- 資料表索引 `product_sales`
--
ALTER TABLE `product_sales`
  ADD PRIMARY KEY (`product_id`);

--
-- 資料表索引 `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`buyer_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- 資料表索引 `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`user_id`);

--
-- 資料表索引 `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `buyer_id` (`buyer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- 資料表索引 `test_table`
--
ALTER TABLE `test_table`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `test_table`
--
ALTER TABLE `test_table`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- 資料表的限制式 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `contain`
--
ALTER TABLE `contain`
  ADD CONSTRAINT `contain_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contain_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 資料表的限制式 `manage`
--
ALTER TABLE `manage`
  ADD CONSTRAINT `manage_ibfk_1` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manage_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `product_sales`
--
ALTER TABLE `product_sales`
  ADD CONSTRAINT `product_sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `shopping_cart`
--
ALTER TABLE `shopping_cart`
  ADD CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shopping_cart_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
