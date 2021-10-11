-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 09, 2021 lúc 05:41 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bai_thi`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `adminId` int(11) NOT NULL,
  `adminName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminEmail` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `adminUser` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adminPass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_admin`
--

INSERT INTO `tbl_admin` (`adminId`, `adminName`, `adminEmail`, `adminUser`, `adminPass`, `level`) VALUES
(3, 'sang', 'quangsangle.hn@gmail.com', 'sangle', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brandId` int(11) UNSIGNED NOT NULL,
  `brandName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_brand`
--

INSERT INTO `tbl_brand` (`brandId`, `brandName`) VALUES
(17, 'Yamaha'),
(18, 'Roland'),
(19, 'Casio'),
(20, 'Takamine'),
(21, 'Rosen'),
(22, 'Kawai'),
(23, 'Taylor');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_cart`
--

CREATE TABLE `tbl_cart` (
  `cartId` int(11) NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `sId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_cart`
--

INSERT INTO `tbl_cart` (`cartId`, `productId`, `sId`, `productName`, `price`, `quantity`, `image`) VALUES
(78, 58, 'l3879v3oiouj2cfr9t70p635pn', 'sp1', '10200000', 1, '526ed6e08d.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category`
--

CREATE TABLE `tbl_category` (
  `catId` int(11) UNSIGNED NOT NULL,
  `catName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `catImage` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category`
--

INSERT INTO `tbl_category` (`catId`, `catName`, `catImage`) VALUES
(42, 'Đàn Piano', 'b0e596d170.png'),
(43, 'Trống', '51de0d9a84.png'),
(44, 'Vocals', 'd68108b65d.jpg'),
(45, 'Đàn Guitar', '197306cd4a.png'),
(46, 'Piano', 'd25a464698.png'),
(47, 'Phụ Kiện Âm Thanh', '93b952f029.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_compare`
--

CREATE TABLE `tbl_compare` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_customer`
--

INSERT INTO `tbl_customer` (`id`, `name`, `address`, `phone`, `email`, `password`) VALUES
(7, 'sang le', 'xom1', '0329004844', 'quangsangle.hn@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(8, 'sang', 'xom1', '0329004844', 'sangle10031999@gmail.com', '202cb962ac59075b964b07152d234b70'),
(9, 'sang le', 'xom1', '0329004844', 'sang@gmail.com', '202cb962ac59075b964b07152d234b70'),
(10, 'Ä‘á»©c', 'hÃ  ná»™i', '0329004844', 'duc@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `date_order` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_order`
--

INSERT INTO `tbl_order` (`id`, `productId`, `productName`, `customer_id`, `quantity`, `price`, `image`, `status`, `date_order`) VALUES
(95, 43, 'Roland RP-30', 7, 3, '44100000', '4351aeb639.jpg', 0, '2021-09-30 14:35:05'),
(96, 43, 'Roland RP-30', 7, 1, '14700000', '4351aeb639.jpg', 0, '2021-09-30 15:02:07'),
(97, 44, 'sang bÃ¡nh bÃ¨o', 7, 1, '14700000', '4f85c76984.jpg', 0, '2021-09-30 15:02:07'),
(98, 46, 'sp1', 7, 1, '10000000', '7112d6f107.jpg', 0, '2021-10-02 21:32:01'),
(99, 48, 'sp11', 7, 2, '29400000', '298a3286f0.gif', 0, '2021-10-05 22:21:52'),
(100, 44, 'sang bÃ¡nh bÃ¨o', 7, 1, '14700000', '4f85c76984.jpg', 0, '2021-10-05 22:21:52'),
(101, 44, 'sang bÃ¡nh bÃ¨o', 7, 3, '44100000', '4f85c76984.jpg', 0, '2021-10-07 09:27:38'),
(102, 43, 'Roland RP-30', 7, 3, '44100000', '4351aeb639.jpg', 0, '2021-10-07 09:27:38'),
(103, 58, 'sp1', 10, 1, '10200000', '526ed6e08d.jpg', 0, '2021-10-09 22:30:53'),
(104, 57, 'sang bÃ¡nh bÃ¨o', 10, 1, '10000', '8b934ac0b3.png', 0, '2021-10-09 22:30:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_product`
--

CREATE TABLE `tbl_product` (
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `productQuantity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_soldout` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `product_remain` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `catId` int(11) UNSIGNED NOT NULL,
  `brandId` int(11) UNSIGNED NOT NULL,
  `product_desc` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_product`
--

INSERT INTO `tbl_product` (`productId`, `productName`, `product_code`, `productQuantity`, `product_soldout`, `product_remain`, `catId`, `brandId`, `product_desc`, `type`, `price`, `image`) VALUES
(43, 'Roland RP-30', '', '', '0', '', 42, 17, '<p>Báº¡n muá»‘n cho con báº¡n c&oacute; nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u ti&ecirc;n thuáº­n lá»£i nháº¥t tr&ecirc;n con Ä‘Æ°á»ng trá»Ÿ th&agrave;nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t kh&oacute; Ä‘á»ƒ Ä‘á»™ng vi&ecirc;n bá»n tráº» chÆ¡i piano khi c&oacute; qu&aacute; nhiá»u thá»© g&acirc;y xao nh&amp;', 0, '14700000', '4351aeb639.jpg'),
(44, 'sang bÃ¡nh bÃ¨o', '', '', '0', '', 47, 23, '<p>asDfghjkzdfxg</p>', 0, '14700000', '4f85c76984.jpg'),
(45, 'sang bÃ¡nh bÃ¨o', '', '', '0', '', 42, 17, '	  Báº¡n muá»‘n cho con báº¡n cÃ³ nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u tiÃªn thuáº­n lá»£i nháº¥t trÃªn con Ä‘Æ°á»ng trá»Ÿ thÃ nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t khÃ³ Ä‘á»ƒ Ä‘á»™ng viÃªn bá»n tráº» chÆ¡i piano khi cÃ³ quÃ¡ nhiá»u thá»© gÃ¢y xao nhÃ£ng nhÆ° smartphone, games, TV,... CÃ¢y piano Ä‘iá»‡n ', 1, '14700000', '8021a3f1e4.jpg'),
(46, 'sp1', '', '', '0', '', 47, 22, 'Báº¡n muá»‘n cho con báº¡n cÃ³ nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u tiÃªn thuáº­n lá»£i nháº¥t trÃªn con Ä‘Æ°á»ng trá»Ÿ thÃ nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t khÃ³ Ä‘á»ƒ Ä‘á»™ng viÃªn bá»n tráº» chÆ¡i piano khi cÃ³ quÃ¡ nhiá»u thá»© gÃ¢y xao nhÃ£ng nhÆ° smartphone, games, TV,... CÃ¢y piano Ä‘iá»‡n dÃ ', 1, '10000000', '7112d6f107.jpg'),
(48, 'sp11', '', '', '0', '', 43, 19, 'asDfghjkzdfxg', 0, '14700000', '298a3286f0.gif'),
(49, 'dÃ n guitar', '', '', '0', '', 45, 22, 'dSDSFZhg', 0, '3000000', 'dae4f1037a.jpg'),
(50, 'lÃª', '', '', '0', '', 47, 21, 'asDfghjkzdfxg', 0, '100000', '92eb9f9a31.jpg'),
(51, 'sp3', '', '', '0', '', 44, 23, 'Báº¡n muá»‘n cho con báº¡n cÃ³ nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u tiÃªn thuáº­n lá»£i nháº¥t trÃªn con Ä‘Æ°á»ng trá»Ÿ thÃ nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t khÃ³ Ä‘á»ƒ Ä‘á»™ng viÃªn bá»n tráº» chÆ¡i piano khi cÃ³ quÃ¡ nhiá»u thá»© gÃ¢y xao nhÃ£ng nhÆ° smartphone, games, TV,... CÃ¢y piano Ä‘iá»‡n dÃ ', 1, '1234500', '708959581c.jpg'),
(52, 'sp4', '', '', '0', '', 45, 19, 'fdsgnhmj,kjlk', 0, '10000', '9f10effcf9.png'),
(54, 'sp1', '', '', '0', '', 46, 22, 'Báº¡n muá»‘n cho con báº¡n cÃ³ nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u tiÃªn thuáº­n lá»£i nháº¥t trÃªn con Ä‘Æ°á»ng trá»Ÿ thÃ nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t khÃ³ Ä‘á»ƒ Ä‘á»™ng viÃªn bá»n tráº» chÆ¡i piano khi cÃ³ quÃ¡ nhiá»u thá»© gÃ¢y xao nhÃ£ng nhÆ° smartphone, games, TV,... CÃ¢y piano Ä‘iá»‡n dÃ ', 0, '14700000', 'e98b4d7da1.png'),
(55, 'sp7', '', '', '0', '', 43, 21, 'sang lÃª', 1, '14700000', '44d37973fd.jpg'),
(56, 'sp10', '', '', '0', '', 47, 22, 'Báº¡n muá»‘n cho con báº¡n cÃ³ nhá»¯ng bÆ°á»›c Ä‘i Ä‘áº§u tiÃªn thuáº­n lá»£i nháº¥t trÃªn con Ä‘Æ°á»ng trá»Ÿ thÃ nh má»™t nghá»‡ sÄ© piano nhÆ°ng tháº­t khÃ³ Ä‘á»ƒ Ä‘á»™ng viÃªn bá»n tráº» chÆ¡i piano khi cÃ³ quÃ¡ nhiá»u thá»© gÃ¢y xao nhÃ£ng nhÆ° smartphone, games, TV,... CÃ¢y piano Ä‘iá»‡n dÃ ', 1, '90000', '5f50d3fda1.jpg'),
(57, 'sang bÃ¡nh bÃ¨o', '', '', '0', '', 46, 23, 'asDfghjkzdfxg', 1, '10000', '8b934ac0b3.png'),
(58, 'sp1', '', '', '0', '', 47, 22, '<p>okok</p>', 0, '10200000', '526ed6e08d.jpg'),
(59, 'sang bánh bèo', '', '', '0', '', 47, 23, '<p>ok em nh&aacute;</p>', 0, '10000', '0f1217833e.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_slider`
--

CREATE TABLE `tbl_slider` (
  `sliderId` int(11) NOT NULL,
  `sliderName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slider_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_slider`
--

INSERT INTO `tbl_slider` (`sliderId`, `sliderName`, `slider_image`, `type`) VALUES
(26, 'okok', '1e1360e5c4.jpg', 1),
(27, 'ok', 'beed60b532.jpg', 1),
(28, 'okokok', '8d4520d5f8.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_warehouse`
--

CREATE TABLE `tbl_warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `id_sanpham` int(11) UNSIGNED NOT NULL,
  `sl_nhap` varchar(50) NOT NULL,
  `sl_ngaynhap` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_wishlist`
--

CREATE TABLE `tbl_wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) UNSIGNED NOT NULL,
  `productId` int(11) UNSIGNED NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tb_binhluan`
--

CREATE TABLE `tb_binhluan` (
  `binhluan_id` int(11) NOT NULL,
  `tenbinhluan` varchar(255) NOT NULL,
  `binhluan` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `thoigian` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tb_binhluan`
--

INSERT INTO `tb_binhluan` (`binhluan_id`, `tenbinhluan`, `binhluan`, `product_id`, `blog_id`, `image`, `thoigian`) VALUES
(6, 'sang', 'sdfghj', 46, 0, '', '2021-10-08 13:54:34'),
(7, 'sang', 'sdfghj', 46, 0, '', '2021-10-08 13:55:02'),
(8, 'sang', 'sdafhgjAFSAGRdhtsjgdkfhnSDFHZxgcjhkvaDFSZxyjghknbcvbmxvhdksudzhnckdystezdfnjsdzczgnfhmg', 59, 0, '', '2021-10-08 13:59:59'),
(9, 'sang', 'odgsIPJOI AGIOVJ A[GJIV agijjv A[IJGASPVJ APIFs vGI giajv pguug PHIFAU APDFHASDF APUHpfh PH fphuFHp fFP', 59, 0, '', '2021-10-08 14:06:07'),
(10, 'sang', 'odgsIPJOI AGIOVJ A[GJIV agijjv A[IJGASPVJ APIFs vGI giajv pguug PHIFAU APDFHASDF APUHpfh PH fphuFHp fFP', 59, 0, '', '2021-10-08 14:07:51'),
(11, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:23:38'),
(12, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:24:26'),
(13, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:24:55'),
(14, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:25:18'),
(15, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:27:16'),
(16, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:28:10'),
(17, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:28:45'),
(18, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:30:08'),
(19, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:30:30'),
(20, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:30:53'),
(21, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:31:30'),
(22, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:32:19'),
(23, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:32:29'),
(24, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:33:29'),
(25, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:34:03'),
(26, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:41:35'),
(27, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:43:52'),
(28, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:46:00'),
(29, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:46:20'),
(30, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:47:04'),
(31, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:47:21'),
(32, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:49:00'),
(33, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:50:14'),
(34, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:50:49'),
(35, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:50:59'),
(36, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:51:09'),
(37, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:51:13'),
(38, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:51:46'),
(39, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:52:06'),
(40, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:52:45'),
(41, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:52:58'),
(42, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:53:45'),
(43, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 14:59:47'),
(44, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:03:02'),
(45, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:06:02'),
(46, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:06:28'),
(47, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:06:51'),
(48, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:09:29'),
(49, 'sang', 'ok ok ok', 49, 0, '', '2021-10-08 15:09:35'),
(50, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:10:34'),
(51, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:11:58'),
(52, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:12:27'),
(53, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:13:38'),
(54, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:14:00'),
(55, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:22:01'),
(56, 'lê', 'sadfsgfhgdj', 59, 0, '', '2021-10-09 14:22:26');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`adminId`);

--
-- Chỉ mục cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brandId`);

--
-- Chỉ mục cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD PRIMARY KEY (`cartId`),
  ADD KEY `productId` (`productId`,`quantity`);

--
-- Chỉ mục cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`catId`);

--
-- Chỉ mục cho bảng `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`,`customer_id`),
  ADD KEY `quantity` (`quantity`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Chỉ mục cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `catId` (`catId`,`brandId`),
  ADD KEY `brandId` (`brandId`);

--
-- Chỉ mục cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  ADD PRIMARY KEY (`sliderId`);

--
-- Chỉ mục cho bảng `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD PRIMARY KEY (`id_warehouse`),
  ADD KEY `id_sanpham` (`id_sanpham`);

--
-- Chỉ mục cho bảng `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`,`productId`),
  ADD KEY `customer_id_2` (`customer_id`,`productId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `tb_binhluan`
--
ALTER TABLE `tb_binhluan`
  ADD PRIMARY KEY (`binhluan_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `tbl_compare`
--
ALTER TABLE `tbl_compare`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `sliderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `tb_binhluan`
--
ALTER TABLE `tb_binhluan`
  MODIFY `binhluan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  ADD CONSTRAINT `tbl_cart_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_compare`
--
ALTER TABLE `tbl_compare`
  ADD CONSTRAINT `tbl_compare_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_compare_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `tbl_category` (`catId`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `tbl_brand` (`brandId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD CONSTRAINT `tbl_warehouse_ibfk_1` FOREIGN KEY (`id_sanpham`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `tbl_wishlist`
--
ALTER TABLE `tbl_wishlist`
  ADD CONSTRAINT `tbl_wishlist_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tbl_customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_wishlist_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `tbl_product` (`productId`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
