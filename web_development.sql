-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1:3306
-- 產生時間： 2023-12-14 04:54:08
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
('US0002', 1, 35),
('US0007', 0, 18);

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
('PR0001', '呆萌小石頭', '天然獨一無二，為您的生活增添自然的愉悅。', 'pr0001.png', 'pr0001.png', 50, 100, 'US0003'),
('PR0002', '石頭明信片組', '發掘獨特的石頭風景，每張都是大自然的微縮奇蹟。', 'pr0002.png', 'pr0002.png', 199, 100, 'US0003'),
('PR0003', '溫馨石頭小家', '簡約中帶著溫馨，這是一個由石頭構成的小天地，將自然之美融入家的每一角。', 'pr0003.png', 'pr0003.png', 399, 100, 'US0003'),
('PR0004', '可愛石頭甜點屋', '甜蜜的石頭造型點心，讓您品嚐到獨一無二的甜蜜滋味。', 'pr0004.png', 'pr0004.png', 100, 100, 'US0004'),
('PR0005', '派大星冠軍石頭', '勇奪冠軍的石頭，展現出無可比擬的堅強與勝利。', 'pr0005.png', 'pr0005.png', 100, 100, 'US0004'),
('PR0006', '比奇堡現採石頭', '現場採集的石頭，是比奇堡獨特風格的象徵。', 'pr0006.png', 'pr0006.png', 100, 100, 'US0004'),
('PR0007', '海精靈石頭組', '擁有海洋風情的石頭組合，彷彿能聽見浪花的聲音。', 'pr0007.png', 'pr0007.png', 199, 100, 'US0005'),
('PR0008', '石頭珍珠貝殼', '珍珠般閃耀的石頭，宛如收藏的寶貝一般。', 'pr0008.png', 'pr0008.png', 399, 100, 'US0005'),
('PR0009', '爆炒鵝卵石', '火熱炒製的鵝卵石，散發著獨特的風味誘惑。', 'pr0009.png', 'pr0009.png', 100, 100, 'US0005'),
('PR0010', '派大星石頭屋', '由派大星親自打造的石頭屋，充滿童趣與奇幻。', 'pr0010.png', 'pr0010.png', 100, 100, 'US0005');

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
('US0006', 'admin', 'admin', 'admin', '台北市大安區忠孝東路三段1號', 'admin@test.com', '111111111', 2, 1),
('US0007', 'test', 'test', 'test', 'testaddress', 'test@test', '111222333', 1, 1);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`user_id`);

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
