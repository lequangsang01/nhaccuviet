-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 18, 2022 lúc 12:53 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bai_thi3`
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
(3, 'sang', 'quangsangle.hn@gmail.com', 'sangle', 'e10adc3949ba59abbe56e057f20f883e', 0),
(5, 'Trung Đức', 'duc123zzmm@gmail.com', 'trungduc', '202cb962ac59075b964b07152d234b70', 1);

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
(22, 'Kawai'),
(23, 'Taylor'),
(24, 'Pearl'),
(25, 'Kapok'),
(26, 'TANGLEWOOD'),
(27, 'Fender'),
(28, 'Allen&amp;Heath'),
(29, 'soundking'),
(30, 'CORDIAL');

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
(42, 'Đàn Piano', '1a1a06a010.jpg'),
(43, 'Trống', 'd6ff15821b.jpg'),
(44, 'Mixer', '2387a9edbf.jpg'),
(45, 'Đàn Guitar', 'a5deb88f39.jpg'),
(46, 'Organ-Keyboard', 'ee7463ad86.jpg'),
(47, 'Phụ Kiện Âm Thanh', '55c4e97e11.jpg');

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
(105, 97, 'FENDER TRADNLII 50S STRAT MN', 7, 1, '21800000', '9c39682e64.jpg', 0, '2021-10-18 16:52:12');

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
(62, 'Roland RP-30', '', '', '0', '', 42, 18, '<p><span>Bạn muốn cho con bạn c&oacute; những bước đi đầu ti&ecirc;n thuận lợi nhất tr&ecirc;n con đường trở th&agrave;nh một nghệ sĩ piano nhưng thật kh&oacute; để động vi&ecirc;n bọn trẻ chơi piano khi c&oacute; qu&aacute; nhiều thứ g&acirc;y xao nh&atilde;ng như smartphone, games, TV,... C&acirc;', 0, '14700000', '5065bad32c.jpg'),
(64, 'Roland RP-102', '', '', '0', '', 42, 18, '<h2><span><a href=\"https://vietthuong.vn/piano-dien-roland-rp-102.html\">Đ&agrave;n&nbsp;piano điện Roland RP-102</a>&nbsp;l&agrave;&nbsp;mẫu đ&agrave;n piano điện được Roland ra mắt trong năm 2017 &ndash; C&oacute; thể n&oacute;i c&acirc;y đ&agrave;n RP-102 l&agrave; lựa chọn tốt nhất cho người mới ', 1, '20990000', 'a2a81acc5a.jpg'),
(65, 'Casio CDP-S150', '', '', '0', '', 42, 19, '<h2><span><a href=\"https://vietthuong.vn/casio-cdp-s150\">Đ&agrave;n piano điện Casio CDP-S150</a>&nbsp;được tạo ra nhằm mang lại cảm hứng cho những nhạc sĩ ở mọi tr&igrave;nh độ v&agrave; độ tuổi, bao gồm nhiều loại Tones v&agrave; Rhythms. Đ&acirc;y l&agrave; một trong những mẫu đ&agrave;n piano đi', 1, '11350000', 'c43a018bf3.jpg'),
(66, 'Roland FP-30X', '', '', '0', '', 42, 18, '<h2><span><a href=\"https://vietthuong.vn/roland-fp-30x\">Roland FP-30X</a>&nbsp;sản phẩm nổi bật của d&ograve;ng FP-X với chất lượng tuyệt vời v&agrave; chi ph&iacute; hợp l&yacute;, thiết kế di động, l&agrave; nhạc cụ gia đ&igrave;nh ho&agrave;n hảo cho những người chơi d&agrave;y dặn kinh nghiệm.</', 1, '22450000', 'c79d84dfc7.jpg'),
(67, 'Casio PX-S1000', '', '', '0', '', 42, 19, '<h2><span>C&acirc;y đ&agrave;n Casio PX-S1000 đ&aacute;nh dấu một trang mới trong lịch sử 15 năm ph&aacute;t triển của d&ograve;ng đ&agrave;n điện Privia biểu tượng của Casio. Mang đậm chất &ldquo;original&rdquo; với những t&iacute;nh năng mới đ&aacute;ng kinh ngạc, mẫu đ&agrave;n điện mới n&agrave;', 1, '16000000', 'f7e5b6962d.png'),
(68, 'Casio CDP-S350', '', '', '0', '', 42, 19, '<h2><span><a href=\"https://vietthuong.vn/casio-cdp-s350\">Đ&agrave;n Piano điện Casio CDP-S350</a>&nbsp;l&agrave; thế hệ đ&agrave;n piano điện mới của thương hiệu Casio. Đ&agrave;n piano điện Casio CDP-S350 với nhiều t&iacute;nh năng hiện đại, mang đến cảm hứng cho người chơi ở mọi tr&igrave;nh độ, đ', 0, '16300000', '64249fd509.jpg'),
(69, 'Kawai KDP120', '', '', '0', '', 42, 22, '<h2><span>Đ&agrave;n Piano điện Kawai KDP120&nbsp;l&agrave; thế hệ đ&agrave;n piano điện mới của thương hiệu Casio. Đ&agrave;n piano điện Casio CDP-S350 với nhiều t&iacute;nh năng hiện đại, mang đến cảm hứng cho người chơi ở mọi tr&igrave;nh độ, độ tuổi.</span></h2>', 1, '29900000', '45e8768039.jpg'),
(70, 'KAWAI KDP75', '', '', '0', '', 42, 22, '<p><span>Một sản phẩm mới xuất hiện trong đại gia đ&igrave;nh Piano Kỹ Thuật Số KAWAI, model KDP75, trang bị hệ thống cơ học RHC do ch&iacute;nh KAWAI, phản hồi lực đ&aacute;nh ngay dưới ng&oacute;n tay người chơi theo th&ocirc;ng số đo đạc của c&aacute;c nghệ nh&acirc;n KAWAI, chất tiếng tuyệt đẹp ', 1, '21900000', 'f1ea8fae12.jpg'),
(71, 'KAWAI KDP-70B', '', '', '0', '', 42, 22, '<p><span>Kawai KDP70 l&agrave; sản phẩm chất lượng trong d&ograve;ng Entry-level đầy đủ t&iacute;nh năng hỗ trợ cho việc học đ&agrave;n với 3 bộ Gi&aacute;o tr&igrave;nh của Burgm&uuml;llerand, Czerny, v&agrave; Alfred&rsquo;s Basic Piano Library Lesson Book.</span></p>', 1, '21900000', '3e3d9686fb.png'),
(72, 'YAMAHA P-115B', '', '', '0', '', 42, 17, '<p><span>Số ph&iacute;m: 88 (Graded hammer standard (GHS) keyboard, matte finish on black keys) &nbsp;Touch Sensitivity: Hard/medium/soft/fixed &nbsp;&Acirc;m thanh Piano: Pure CF Sound Eng</span></p>', 0, '15600000', '00119a44ff.jpg'),
(73, 'YAMAHA YDP-143R', '', '', '0', '', 42, 17, '<p><span>10 &acirc;m thanh chất lượng cao, 192 &acirc;m sắc để bạn thực sự đắm m&igrave;nh trong thế giới &acirc;m thanh chất lượng &nbsp;88 b&agrave;n ph&iacute;m đạt ti&ecirc;u chuẩn GHS của Yamaha, từ l&acirc;u nay vốn rất nổi tiếng ma</span></p>', 0, '14700000', 'b608847526.jpg'),
(74, 'Yamaha YDP-S52B', '', '', '0', '', 42, 17, '<p><span>YDP-S52 mang đến thiết kế hiện đại, đơn giản nhưng vẫn giữ được sự thanh lịch, tinh tế. Với t&iacute;nh năng ti&ecirc;n tiến được kết hợp, YDP-S52 sẽ ho&agrave;n hảo cho bất k&igrave; kh&ocirc;ng gian biểu diễn n&agrave;o.</span></p>', 1, '20990000', 'e87187b1fe.jpg'),
(75, 'Roland RP-501R', '', '', '0', '', 42, 18, '<p>Đ&agrave;n piano điện Roland RP-501R mới, l&agrave; c&acirc;y piano đầu ti&ecirc;n rất l&yacute; tưởng v&agrave; sẵn s&agrave;ng để hỗ trợ bạn học tập nếu bạn đang c&oacute; &yacute; định sở hữu n&oacute;.&nbsp;</p>\r\n<p>Thiết kế nhỏ gọn, t&iacute;ch hợp nhiều t&iacute;nh năng học tập, gi&aacute; ', 1, '24900000', '39ee84283d.jpg'),
(76, 'ROLAND E-X30', '', '', '0', '', 46, 18, '<p><span>Nếu trở th&agrave;nh một nhạc sĩ l&agrave; ước mơ ch&aacute;y bỏng của bạn, th&igrave; học chơi đ&agrave;n ph&iacute;m ch&iacute;nh l&agrave; bước khởi đầu l&yacute; tưởng. Được tạo ra bởi Roland, một thương hiệu được c&aacute;c hầu hết c&aacute;c</span></p>', 1, '16300000', '1645113e73.jpg'),
(77, 'ROLAND E-A7', '', '', '0', '', 46, 18, '<p><span>Hơn 1.500 &acirc;m sắc đa dạng &nbsp;từ khắp nơi tr&ecirc;n thế giới T&iacute;nh năng import file WAV v&agrave; tự tạo sample ngay tr&ecirc;n b&agrave;n ph&iacute;m</span></p>', 1, '26940000', '7fc3632973.jpg'),
(78, 'CASIO CT-X700', '', '', '0', '', 46, 19, '<p><span>Thi&ecirc;́t k&ecirc;́ 61 phím đàn dạng h&ocirc;̣p piano&nbsp; 600 &acirc;m sắc và 190&nbsp;đi&ecirc;̣u nhạc&nbsp; M&agrave;n h&igrave;nh LCD&nbsp; C&ocirc;ng nghệ &acirc;m thanh&nbsp;AiX</span></p>', 0, '5420000', 'd69184fcdf.jpg'),
(79, 'CASIO CT-X3000', '', '', '0', '', 46, 19, '<p><span>61 ph&iacute;m cảm ứng nhạy cảm. Chip &acirc;m thanh AiX&nbsp; Hệ thống loa bass Reflex. 800 &acirc;m thanh c&oacute; thể mở rộng&nbsp;</span></p>', 1, '7490000', '2e70158c2f.jpg'),
(81, 'ROLAND BK-3', '', '', '0', '', 46, 18, '<p><span>BK3 năng động, tiện lợi, b&agrave;n ph&iacute;m kh&eacute;p k&iacute;n với hệ thống &acirc;m thanh được x&acirc;y dựng với chất lượng cao &Acirc;m thanh chất lượng cao,</span></p>', 1, '14920000', 'b8d11d29e0.jpg'),
(82, 'Casiotone CT-S400', '', '', '0', '', 46, 19, '<h2>Casiotone CT-S400 l&agrave; d&ograve;ng sản phẩm mới của thương hiệu Casio trong năm 2021. Đ&agrave;n CT-S400 c&oacute; thiết kế nhỏ gọn nhưng c&oacute; thể b&ugrave;ng nổ sức mạnh khổng lồ với nhiều &acirc;m sắc linh hoạt, &acirc;m thanh phong ph&uacute; v&agrave; khả năng v&ocirc; hạn để bạn t', 1, '6500000', '341c0a9b66.jpg'),
(83, 'ROLAND XPS-30', '', '', '0', '', 46, 18, '<h2><span><span><span>Keyboard Roland XPS-30 bắt đầu với thiết lập t&iacute;nh năng tuyệt vời của XPS-10 v&agrave; bổ sung th&ecirc;m nhiều cải tiến mạnh mẽ m&agrave; chắc chắn người chơi sẽ rất y&ecirc;u th&iacute;ch. C&aacute;c yếu tố cần thiết như tiếng acoustic v&agrave; piano điện tốt hơn, thiế', 1, '19900000', '3e479067a7.jpg'),
(84, 'ROLAND FA-06', '', '', '0', '', 46, 18, '<p><span>Series FA mới của Roland ho&agrave;n to&agrave;n l&agrave;m tốt c&ocirc;ng việc của một c&acirc;y keyboard workstation, tinh giản đ&aacute;ng kể khối lượng thời gian, c&ocirc;ng việc cực kỳ nhanh ch&oacute;ng, v&agrave; t&iacute;nh linh hoạt tối đa. Sẵn s&agrave;ng hỗ trợ bất kỳ loại thể lo', 1, '33540000', 'dafae9c7cd.jpg'),
(85, 'Pearl Decade Maple DMP925FP/C', '', '', '0', '', 43, 24, '<p><span>Trống Pearl Decade Maple bao gồm 10x7TT, 12x8TT, 14x14FT, 22x18BD(BB), 14x5.5SD, TH-900I(x2)</span></p>', 1, '17770000', '15dadb8bbf.gif'),
(86, 'PEARL Export Lacquer EXL725SP Standard', '', '', '0', '', 43, 24, '<p><span>Pearl Export Lacquer series (5 trống, trống kick 22\") 22\"x18\" Bass - 10\"x07\" Tom - 12\"x08\"</span></p>', 1, '13160000', '813ac0152e.jpg'),
(87, 'PEARL EXPORT EXX725SP STANDARD', '', '', '0', '', 43, 24, '<p><span>Pearl Export series (5 trống, kick 22\") 22\"x18\" Bass - 10\"x07\" Tom - 12\"x08\" Tom - 16\"</span></p>', 1, '10780000', '0565bdf5ef.jpg'),
(88, 'PEARL ROADSHOW RS585C/C', '', '', '0', '', 43, 24, '<p><span>Trống Pearl Roadshow RS585 l&agrave; bộ trống được rất nhiều người ưa chuộng với thiết kế đơn giản, gọn g&agrave;ng, trọng lượng nhẹ. Bộ trống Roadshow RS585 bao gồm trống RS, Hardware</span></p>', 1, '11080000', '31be63b23f.jpg'),
(89, 'PEARL DMP925SP/C', '', '', '0', '', 43, 24, '<p><span>Pearl DMP925SP/C bộ trống Jazz ho&agrave;n hảo 22 inch bằng gỗ Maple mang đến cảm hứng v&ocirc; tận cho người chơi với mức gi&aacute; cực kỳ mềm</span></p>', 0, '17020000', 'f9f8d9eac7.jpg'),
(90, 'PEARL DACADE MAPLE DMP943XP/C', '', '', '0', '', 43, 24, '<p><span>Bộ trống&nbsp;Pearl Dacade Maple bao gồm&nbsp;13x9TT, 16x16FT, 24x14BD(BX), TH-900S, ADP-20</span></p>', 1, '17770000', '58594492d3.jpg'),
(91, 'KAPOK D-118AC', '', '', '0', '', 45, 25, '<p><span>Kapok D-118AC được thiết kế thon gọn với nhiều t&iacute;nh năng mới, ph&ugrave; hợp cho người mới bắt đầu chơi Guitar&nbsp;</span></p>', 1, '2090000', '93a481c12e.jpg'),
(92, 'Tanglewood DBT DLX SFCE EB', '', '', '0', '', 45, 26, '<p><span>Tanglewood nhận ra rằng để giới thiệu đến mọi người &acirc;m nhạc, một nhạc cụ phải c&oacute; chất lượng cấu tạo cao, khả năng chơi tốt, mỹ phẩm hấp dẫn v&agrave; c&agrave;ng nhiều t&iacute;nh năng c&agrave;ng tốt để khuyến kh&iacute;ch v&agrave; khen thưởng những nhạc sĩ c&oacute; nguyện v', 1, '5210000', '7c0cd4965b.jpg'),
(93, 'Tanglewood TWCR D Crossroads Dreadnought Acoustic', '', '', '0', '', 45, 26, '<p><span>Crossroads b&agrave;y tỏ sự t&ocirc;n k&iacute;nh đối với phong c&aacute;ch v&agrave; &acirc;m thanh của c&aacute;c nhạc cụ cổ điển từ năm 1930 của Mỹ. Những năm 30 l&agrave; khoảng thời gian kh&oacute; khăn tr&ecirc;n khắp nước Mỹ với cuộc Đại suy tho&aacute;i khiến c&aacute;c cộng đồng ph', 1, '3120000', '2ac5484183.jpg'),
(94, 'Tanglewood TWR2 D', '', '', '0', '', 45, 26, '<p><span>Lấy cảm hứng từ thi&ecirc;n nhi&ecirc;n v&agrave; vẻ đẹp th&ocirc; sơ của gỗ cổ điển, c&aacute;c nhạc cụ Roadster II tạo n&ecirc;n một tuy&ecirc;n bố tự nhi&ecirc;n thực sự hữu cơ v&agrave; tinh tế. Từ l&acirc;u, ch&uacute;ng t&ocirc;i đ&atilde; đi ti&ecirc;n phong trong việc thực h&agrave;', 1, '3350000', '272453c3b2.jpg'),
(95, 'FENDER TRADITIONAL 60S TELECASTER', '', '', '0', '', 45, 27, '<p><span>Sản xuất tại Nhật Bản D&ograve;ng đ&agrave;n truyền thống c&oacute; nguồn gốc từ sự kết hợp t&iacute;nh thẩm mỹ trong sản xuất nhạc cụ truyền thống của Fender với kỹ thuật thủ c&ocirc;ng tinh xảo của Nhật Bản. DNA ch&iacute;nh thống của Fender được hồi sinh với chất lượng Made in Japan đ&aa', 1, '21800000', '960847ef15.jpg'),
(96, 'Fender American Ultra Stratocaster', '', '', '0', '', 45, 27, '<p><span>American Ultra l&agrave; d&ograve;ng guitar v&agrave; bass cao cấp nhất của ch&uacute;ng t&ocirc;i d&agrave;nh cho những người chơi s&agrave;nh điệu, những người y&ecirc;u cầu độ ch&iacute;nh x&aacute;c, hiệu suất v&agrave; &acirc;m sắc cao nhất. American Ultra Stratocaster&nbsp; c&oacute; ', 1, '52700000', '6ffc267a9d.jpg'),
(97, 'FENDER TRADNLII 50S STRAT MN', '', '', '0', '', 45, 27, '<p><span>Bộ sưu tập Made in Japan Traditional kết hợp thẩm mỹ sản xuất nhạc cụ truyền thống của Fender v&agrave; nghề thủ c&ocirc;ng tinh tế của Nhật Bản. DNA ch&iacute;nh thống của Fender được phục hồi với chất lượng Nhật Bản.</span></p>', 1, '21800000', '9c39682e64.jpg'),
(98, 'Fender AERODYNE II STRAT HSS RW HSS MEDIUM', '', '', '0', '', 45, 27, '<p><span>Với khả năng chơi được cải thiện, Aerodyne II Bridge tremolo 2 Point, bộ chỉnh ti&ecirc;u chuẩn v&agrave; cần đ&agrave;n b&aacute;n k&iacute;nh 9,5 inch tr&ecirc;n chất liệu body alder, l&agrave;m cho n&oacute; ph&ugrave; hợp hơn với phong c&aacute;ch chơi của người chơi hiện đại.</span></p', 1, '25400000', '91d4d4fea2.jpg'),
(99, 'Fender Player Stratocaster', '', '', '0', '', 45, 27, '<p><span>&Acirc;m thanh truyền cảm v3 l&agrave; một trong những nền tảng của Fender. Player Stratocaster rất linh hoạt v&agrave; được trang bị phong c&aacute;ch Fender đ&iacute;ch thực. N&oacute; sẵn s&agrave;ng phục vụ tầm nh&igrave;n &acirc;m nhạc của bạn, đủ linh hoạt để xử l&yacute; mọi phong c&', 1, '18500000', '686d3223ff.jpg'),
(103, 'ALLEN&HEATH ZEDI-10FX', '', '', '0', '', 44, 28, '<h3>ALLEN&amp;HEATH ZEDI-10FX</h3>', 1, '4500000', 'b33d892174.jpg'),
(104, 'Allen&Heath ZED-12FX', '', '', '0', '', 44, 28, '<div>Allen&amp;Heath ZED12FX&nbsp;l&agrave; mixer nhỏ gọn nhưng &acirc;m thanh xử l&yacute; cực hay, 6 k&ecirc;nh mono v&agrave; 3 k&ecirc;nh stereo, 2 band chỉnh EQ mỗi k&ecirc;nh v&agrave; 16 effects hiệu ứng &acirc;m thanh v&agrave; 4 k&ecirc;nh phụ trợ k&egrave;m hệ thống EQ chỉnh của mỗi k&ecir', 1, '1630000', '20b86c5b2e.jpg'),
(105, 'ALLEN&HEATH ZED-22FX', '', '', '0', '', 44, 28, '<h3>ALLEN&amp;HEATH ZED-22FX</h3>', 1, '2099000', '129c2d62d2.jpg'),
(106, 'SOUNDKING DM20', '', '', '0', '', 44, 29, '<h3>SOUNDKING DM20</h3>', 1, '6500000', '87c31033ae.jpg'),
(107, 'CORDIAL CMK 222', '', '', '0', '', 47, 30, '<h3>CORDIAL CMK 222</h3>', 1, '29500', 'db7cf728b1.jpg'),
(108, 'CORDIAL CMS 8', '', '', '0', '', 47, 30, '<h3>CORDIAL CMS 8</h3>', 1, '190000', '9a56b08d18.jpg'),
(109, 'CORDIAL CLS 215', '', '', '0', '', 47, 30, '<p><span>Diện t&iacute;ch d&acirc;y dẫn: 1.50 mm2</span></p>', 1, '42500', 'c554dd8044.jpg'),
(110, 'CORDIAL CLS 225', '', '', '0', '', 47, 30, '<p><span>&nbsp;Diện t&iacute;ch d&acirc;y dẫn: 2.50 mm2 &nbsp;Kết cấu d&acirc;y dẫn:&nbsp; 144 x 0.15mm L&otilde;i đồng &nbsp;Điện trở d&acirc;y dẫn: 8 Ohm/km &nbsp;Đường k&iacute;nh: 7.8 &plusmn; 0.2 mm</span></p>', 1, '65000', '0be92d0f9e.jpg'),
(111, 'CORDIAL CII 3 PP', '', '', '0', '', 47, 30, '<p><span>D&acirc;y l&agrave;m sẵn&nbsp;d&ugrave;ng cho Nhạc cụ v&agrave; Guitar&nbsp; Jack của nh&atilde;n hiệu&nbsp;REAN/ v&agrave; d&acirc;y của nh&atilde;n&nbsp;hiệu&nbsp;CORDIAL Plug 6.3mm mono&nbsp; Plug 6.3mm mono</span></p>', 1, '370000', 'fe68cfd9a5.jpg');

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
(38, 'asdads', '22652ad9f4.jpg', 1),
(39, 'ád', '67a9d7dac1.jpg', 1),
(40, 'ádasda', '37561a8930.jpg', 1),
(41, 'qưeqwe', 'a016670275.jpg', 1),
(42, 'qưeqwe', 'e3d13406b7.jpg', 1);

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
(53, 'ôk', 'iuasbd a agh AG AUH VAHOGUH AVAUH AG OAVH AUFH EGAV AG FV ÀHWf  afhcewoaf aofhaf  ayfh f a ffe', 49, 0, '', '2021-10-08 15:13:38');

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
  MODIFY `adminId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brandId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `tbl_cart`
--
ALTER TABLE `tbl_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `catId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT cho bảng `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `productId` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT cho bảng `tbl_slider`
--
ALTER TABLE `tbl_slider`
  MODIFY `sliderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

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
