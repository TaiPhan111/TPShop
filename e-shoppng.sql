-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 11, 2024 lúc 12:53 PM
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
-- Cơ sở dữ liệu: `e-shoppng`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(255) NOT NULL,
  `activated` bit(1) NOT NULL,
  `admin` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`username`, `activated`, `admin`, `email`, `fullname`, `password`, `photo`, `address`, `phone`) VALUES
('admin', b'1', b'1', 'admin@example.com', 'Administrator', '1234', NULL, 'dfgdhjfdres', 345643),
('haiga', b'0', b'0', 'haihaycode@gmail.com', NULL, '12345678', NULL, NULL, NULL),
('null', b'0', b'1', NULL, NULL, '1', NULL, NULL, NULL),
('thienphuc1907', b'1', b'1', 'lequyettien@gmail.com', 'Lê Thiện Phúc', '123', NULL, NULL, NULL),
('user1', b'1', b'0', 'user1@example.com', 'User One', '123', 'photo1.jpg', NULL, NULL),
('user2', b'1', b'0', 'user2@example.com', 'User Two', 'password2', 'photo2.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`) VALUES
('1000', 'Đồng hồ đeo tay 1', NULL, b'0'),
('1001', 'Máy tính xách tay', NULL, b'1'),
('10011', 'Đồng hồ đeo tay ', NULL, b'1'),
('1002', 'Máy ảnh', NULL, b'1'),
('1003', 'Điện thoại', NULL, b'1'),
('1004', 'Nước hoa', NULL, b'1'),
('1005', 'Nữ trang', NULL, b'1'),
('1006', 'Nón thời trang', NULL, b'1'),
('1007', 'Túi xách du lịch', NULL, b'1'),
('1008', 'Máy tính bảng', NULL, b'1'),
('1009', 'TV thông minh', NULL, b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` bigint(20) NOT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderid` bigint(20) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `price`, `quantity`, `orderid`, `productid`) VALUES
(1, 500, 1, 1, 1),
(2, 1200, 1, 1, 2),
(3, 850, 2, 2, 3),
(4, 700, 1, 2, 4),
(6, 40, 2, 7, 129),
(7, 70, 1, 7, 118),
(8, 50, 1, 7, 7),
(9, 40, 1, 8, 129),
(10, 120, 1, 8, 130),
(11, 150, 2, 8, 5),
(12, 50, 1, 8, 7),
(13, 90, 1, 9, 128),
(14, 40, 1, 9, 129),
(15, 850, 1, 9, 3),
(16, 200, 1, 9, 116),
(17, 200, 1, 9, 8),
(18, 80, 1, 9, 124),
(19, 180, 1, 9, 126),
(20, 500, 1, 11, 1),
(21, 40, 1, 11, 129),
(22, 120, 1, 11, 130),
(23, 50, 2, 11, 7),
(24, 200, 1, 11, 8),
(25, 80, 2, 11, 124),
(26, 40, 1, 12, 129),
(27, 50, 1, 12, 7),
(28, 80, 1, 12, 124),
(29, 40, 1, 13, 129),
(30, 50, 1, 13, 7),
(31, 40, 1, 14, 129),
(32, 50, 1, 14, 7),
(33, 120, 1, 14, 127),
(34, 40, 2, 15, 129),
(35, 50, 1, 15, 7),
(36, 40, 1, 16, 129),
(37, 40, 1, 17, 129),
(38, 150, 2, 17, 5),
(39, 50, 1, 17, 7),
(40, 1000, 9, 18, 115),
(41, 544, 4, 18, 11),
(42, 300, 1, 18, 125),
(43, 40, 1, 19, 129),
(44, 50, 1, 19, 7),
(45, 70, 4, 20, 118),
(46, 50, 1, 20, 7),
(47, 70, 1, 21, 118),
(48, 50, 1, 21, 7),
(49, 40, 1, 22, 129),
(50, 50, 1, 22, 7),
(51, 50, 1, 23, 7),
(52, 40, 7, 24, 129),
(53, 150, 4, 24, 5),
(54, 200, 5, 24, 8),
(55, 150, 1, 24, 122),
(56, 180, 1, 24, 126),
(57, 120, 5, 24, 127),
(58, 90, 1, 25, 128),
(59, 40, 1, 25, 129),
(60, 120, 1, 25, 130),
(61, 70, 2, 25, 118),
(62, 80, 2, 25, 124),
(63, 120, 1, 25, 127),
(64, 40, 2, 26, 129),
(65, 70, 1, 26, 118),
(66, 50, 1, 26, 7),
(67, 120, 1, 26, 127),
(68, 90, 1, 27, 128),
(69, 70, 1, 27, 118),
(70, 50, 1, 27, 7),
(71, 40, 1, 28, 129),
(72, 50, 1, 28, 7),
(73, 70, 1, 29, 118),
(74, 40, 1, 30, 129),
(75, 40, 1, 31, 129),
(76, 50, 1, 31, 7),
(77, 310, 2, 32, 1),
(78, 320, 1, 32, 3),
(79, 310, 2, 33, 1),
(80, 320, 1, 33, 3),
(81, 310, 2, 34, 1),
(82, 320, 1, 34, 3),
(83, 310, 2, 35, 1),
(84, 320, 1, 35, 3),
(85, 320, 1, 36, 3),
(86, 320, 1, 36, 5),
(87, 310, 1, 37, 1),
(88, 320, 1, 37, 3),
(89, 310, 2, 38, 1),
(90, 320, 2, 38, 3),
(91, 320, 1, 39, 3),
(92, 320, 1, 39, 5),
(93, 320, 1, 40, 3),
(94, 320, 1, 40, 5),
(95, 1247, 1, 41, 133);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `order_status_id` bigint(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `oder_code` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `address`, `createdate`, `username`, `order_status_id`, `phone`, `oder_code`, `total_price`, `full_name`) VALUES
(1, '123 Main St, City', '2024-05-01', 'user1', 1, 349748529, NULL, NULL, NULL),
(2, '456 Oak St, City', '2024-05-02', 'user2', 1, 349748529, NULL, NULL, NULL),
(3, 'jgfdffgh', '2024-06-06', NULL, 6, 897654, NULL, NULL, NULL),
(6, 'quảng nam', '2024-06-09', 'null', 1, 34567684, 'OD202406091402411128', NULL, NULL),
(7, 'quảng nam', '2024-06-09', 'null', 1, 435678, 'OD202406091408203927', NULL, NULL),
(8, 'quảng nam', '2024-06-09', NULL, 1, 24829523, 'OD202406091411472821', 510, NULL),
(9, 'quảng nam', '2024-06-09', NULL, 1, 2345768, 'OD202406091416071501', 1640, NULL),
(11, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', 'admin', 1, 34847474, 'OD202406091705104688', 1120, NULL),
(12, 'Điện phương điện bàn quảng nam', '2024-06-09', NULL, 1, 84593408, 'OD202406091733306149', 170, NULL),
(13, 'quảng nam', '2024-06-09', NULL, 1, 45346534, 'OD202406091734207553', 90, NULL),
(14, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 57347544, 'OD202406091735304348', 210, NULL),
(15, 'quảng nam', '2024-06-09', NULL, 1, 435634, 'OD202406091740146207', 130, NULL),
(16, 'quảng nam', '2024-06-09', NULL, 1, 45645, 'OD202406091742582370', 40, NULL),
(17, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 13, 5473485, 'OD202406091750201006', 390, NULL),
(18, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', 'admin', 13, 345643, 'OD202406091757518647', 11476, NULL),
(19, 'quảng nam', '2024-06-09', NULL, 1, 534645, 'OD202406091807549164', 90, 'Phạm Hải'),
(20, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 324534, 'OD202406092207397316', 330, 'Lê quyết tiến'),
(21, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 53453534, 'OD202406092218589594', 120, 'Lê Thiện Phúc'),
(22, 'quảng nam', '2024-06-09', NULL, 1, 5343465, 'OD202406092220325245', 90, 'phạm hà'),
(23, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 453763, 'OD202406092226536195', 50, 'Võ tiến dũng'),
(24, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', 'admin', 1, 34653445, 'OD202406092228194220', 2810, 'Phan Anh Tài'),
(25, 'dfgdhjfdres', '2024-06-09', 'admin', 1, 345643, 'OD202406092229379115', 670, 'Administrator'),
(26, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 4353453, 'OD202406092231319008', 320, 'Lê quyết tiến'),
(27, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 435346, 'OD202406092232371419', 210, 'Lê Thiện Phúc'),
(28, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 543534, 'OD202406092235354896', 90, 'Lê Thiện Phúc'),
(29, 'quảng nam', '2024-06-09', NULL, 1, 345345634, 'OD202406092241278056', 70, 'phạm hải'),
(30, 'Điện phương điện bàn quảng nam', '2024-06-09', NULL, 1, 5342523, 'OD202406092254485033', 40, 'Lê quyết tiến'),
(31, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 84762435, 'OD202406092255202363', 90, 'Nguyễn thị hồng'),
(32, 'quảng nam', '2024-06-09', NULL, 1, 35646335, 'OD202406092302119317', 940, 'Lê quyết tiến'),
(33, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 53453453, 'OD202406092302545679', 940, 'Lê quyết tiến'),
(34, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 3454534, 'OD202406092305517521', 940, 'Lê quyết tiến'),
(35, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 1, 3454534, 'OD202406092306223434', 940, 'Lê quyết tiến'),
(36, 'quảng nam', '2024-06-09', NULL, 1, 34553, 'OD202406092308479023', 640, 'phạm hải'),
(37, 'quảng nam', '2024-06-09', NULL, 13, 5345634, 'OD202406092311255478', 630, 'Lê quyết tiến Năng'),
(38, 'Gần cây xăng điệ minh - điện bàn - quảng nam', '2024-06-09', NULL, 13, 35873475, 'OD202406092313367709', 1260, 'Thảo Nguyên'),
(39, 'quảng nam', '2024-06-10', NULL, 1, 534536, 'OD202406100934192145', 640, 'phạm hải'),
(40, 'dfgdhjfdres', '2024-06-11', 'admin', 1, 345643, 'OD202406111156243511', 640, 'Administrator'),
(41, 'dfgdhjfdres', '2024-06-11', 'admin', 1, 345643, 'OD202406111646216257', 1247, 'Administrator');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_status`
--

INSERT INTO `order_status` (`id`, `status`, `language_code`) VALUES
(1, 'Đang chờ xử lý', 'vi'),
(2, 'Đang xử lý', 'vi'),
(3, 'Đã gửi', 'vi'),
(4, 'Đã giao hàng', 'vi'),
(5, 'Đã hủy', 'vi'),
(6, 'Đã trả hàng', 'vi'),
(7, 'Pending', 'en'),
(8, 'Processing', 'en'),
(9, 'Shipped', 'en'),
(10, 'Delivered', 'en'),
(11, 'Cancelled', 'en'),
(12, 'Returned', 'en'),
(13, 'Thanh toán thành công', 'vi'),
(14, 'Đặt hàng thành công', 'vi\r\n');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `available` bit(1) DEFAULT NULL,
  `createdate` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `categoryid` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `available`, `createdate`, `image`, `name`, `price`, `categoryid`, `description`, `active`) VALUES
(1, b'1', '2024-01-01', 'watch.jpg', 'Đồng hồ cao cấp', 310, '1000', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(2, b'1', '2024-01-02', 'laptop.jpg', 'Laptop Asus', 370, '1001', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(3, b'1', '2024-01-03', 'camera.jpg', 'Máy ảnh Canon', 320, '1002', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(4, b'1', '2024-01-04', 'phone.jpg', 'Điện thoại Samsung', 520, '1003', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(5, b'1', '2024-01-05', 'perfume.jpg', 'Nước hoa Chanel', 320, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(6, b'1', '2024-06-11', 'IM202406111706584664.png', 'Nữ trang vàng', 320, '1005', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(7, b'1', '2024-01-07', 'hat.jpg', 'Nón thời trang', 320, '1006', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(8, b'1', '2024-01-08', 'bag.jpg', 'Túi xách du lịch', 320, '1007', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(9, b'1', '2024-01-09', 'tablet.jpg', 'Máy tính bảng iPad', 620, '1008', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(10, b'1', '2024-01-10', 'tv.jpg', 'TV thông minh LG', 320, '1009', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(11, b'1', '2024-06-05', NULL, 'Đồng hồ SmartWatch ', 320, '1001', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(112, b'1', '2024-06-11', 'new_watch.jpg', 'New Premium Watch', 320, '1001', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(113, b'1', '2024-06-12', 'new_laptop.jpg', 'New Laptop Dell', 320, '1001', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(114, b'1', '2024-06-13', 'new_camera.jpg', 'New Camera Sony', 320, '1002', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(115, b'1', '2024-06-14', 'new_phone.jpg', 'New Smartphone Apple', 320, '1003', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(116, b'1', '2024-06-15', 'new_perfume.jpg', 'New Perfume Dior', 320, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(117, b'1', '2024-06-16', 'new_jewelry.jpg', 'New Gold Jewelry Set', 320, '1005', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(118, b'1', '2024-06-17', 'new_hat.jpg', 'New Fashion Hat', 320, '1006', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'0'),
(119, b'1', '2024-06-11', 'IM202406111735089296.png', 'New Travel Bag', 320, '1007', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(120, b'1', '2024-06-19', 'new_tablet.jpg', 'New iPad Pro', 320, '1008', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(121, b'1', '2024-06-20', 'new_tv.jpg', 'New Smart TV Samsung', 720, '1001', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(122, b'1', '2024-06-21', 'new_headphones.jpg', 'New Wireless Headphones', 320, '1005', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(123, b'1', '2024-06-11', 'IM202406111734322988.png', 'New Gaming Console Xbox', 320, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(124, b'1', '2024-06-23', 'new_backpack.jpg', 'Bew School Backpack', 820, '1002', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(125, b'1', '2024-06-24', 'new_vacuum_cleaner.jpg', 'Aw Vacuum Cleaner', 345, '1003', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(126, b'1', '2024-06-25', 'new_smartwatch.jpg', 'New Smartwatch Fitbit', 320, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(127, b'1', '2024-06-26', 'new_sneakers.jpg', 'New Running Sneakers', 320, '1005', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(128, b'1', '2024-06-27', 'new_sunglasses.jpg', 'New Sunglasses Ray-Ban', 320, '1006', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(129, b'1', '2024-06-28', 'new_mouse.jpg', 'New Wireless Mouse Logitech', 320, '1007', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(130, b'1', '2024-06-29', 'new_keyboard.jpg', 'New Mechanical Keyboard', 320, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(131, b'1', '2024-06-30', 'new_monitor.jpg', 'New UltraWide Monitor', 320, '1009', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(132, NULL, '2024-06-11', 'IM202406111412275247', 'Đồng hồ đeo tay smart', NULL, '10011', 'dd', b'0'),
(133, NULL, '2024-06-11', 'IM202406111414536897.png', 'Điện thoại samsung', 1247, '1003', 'đt', b'1'),
(134, NULL, '2024-06-11', '', 'Nước hoa Chanel', 3110, '1004', '<div class=\"mainContent\">\r\n                        <h3 class=\"relative group text-xl font-semibold leading-7 mb-4 mt-8\" id=\"v1.0.6\">v1.0.6\r\n                            <span id=\"v120\" class=\"absolute -top-[140px]\"></span>\r\n                            <a class=\"ml-2 text-blue-700 opacity-0 transition-opacity group-hover:opacity-100\" href=\"#v4\" aria-label=\"Link to this section: v1.0.6\">#</a>\r\n                        </h3>\r\n                        <p class=\"text-gray-600 text-base font-normal leading-6 mb-5\">Released on June 7th, 2024.\r\n                        </p>\r\n                        <ul class=\"text-gray-600 text-base list-disc pl-6 mb-8\">                          \r\n                            <li class=\"pb-4 \">Added New form blocks </li>\r\n                            <li class=\"pb-4 \">Added New App Integration blocks </li>\r\n                            <li class=\"pb-4 \">Added New Comment blocks </li>\r\n                            <li class=\"pb-4 \">Added New Order Confirmation blocks</li>\r\n                            <li class=\"pb-4 \">Added New Tailwind <a href=\"https://pagedone.io/templates\" class=\"text-indigo-600\"> Templates</a></li>\r\n                        </ul>\r\n                    </div>', b'1'),
(135, NULL, '2024-06-11', NULL, 'Điện thoại iPhone 15 Pro Max 256GB', 29900, '1003', 'Màn hình:\r\n\r\nOLED6.7\"Super Retina XDR\r\nHệ điều hành:\r\n\r\niOS 17\r\nCamera sau:\r\n\r\nChính 48 MP & Phụ 12 MP, 12 MP\r\nCamera trước:\r\n\r\n12 MP\r\nChip:\r\n\r\nApple A17 Pro 6 nhân\r\nRAM:\r\n\r\n8 GB\r\nDung lượng lưu trữ:\r\n\r\n256 GB\r\nSIM:\r\n\r\n1 Nano SIM & 1 eSIMHỗ trợ 5G\r\nPin, Sạc:\r\n\r\n4422 mAh20 W\r\nHãng\r\n\r\niPhone (Apple).', b'1'),
(136, NULL, '2024-06-11', 'IM202406111645293781.png', 'Đồng hồ thông minh Apple Watch Series 9 GPS 41mm viền nhôm dây vải ', 9299, '1003', 'Màn hình:\r\n\r\nOLED1.9 inch\r\nThời lượng pin:\r\n\r\nKhoảng 36 giờ (ở chế độ Năng lượng thấp)Khoảng 18 giờ (ở chế độ sử dụng thông thường)\r\nKết nối với hệ điều hành:\r\n\r\niPhone Xs trở lên chạy iOS 17 trở lên\r\nMặt:\r\n\r\nIon-X strengthened glass41 mm\r\nTính năng cho sức khỏe:\r\n\r\nƯớc tính ngày rụng trứngĐếm số bước chânĐo nồng độ oxy (SpO2)Đo nhịp timĐiện tâm đồVùng nhịp timTính quãng đường chạyTính lượng calories tiêu thụTheo dõi mức độ stressTheo dõi giấc ngủTheo dõi chu kỳ kinh nguyệtNhắc nhở nhịp tim cao, thấpChấm điểm giấc ngủ\r\nHãng\r\n\r\nApple. Xem thông tin hãng', b'0'),
(140, NULL, '2024-06-11', NULL, 'Đồng hồ đeo tay12111', 3423, '1005', 'fsgdhyhd', b'0'),
(141, NULL, '2024-06-11', 'IM202406111642346821.png', 'Pin sạc dự phòng Polymer 10000mAh Type C 15W AVA+ DS2107', 220, '10011', 'Hiệu suất sạc:\r\n\r\n64%\r\nDung lượng pin:\r\n\r\n10000 mAh\r\nThời gian sạc đầy pin:\r\n\r\n5 - 6 giờ (dùng Adapter 2A)10 - 11 giờ (dùng Adapter 1A)\r\nNguồn vào:\r\n\r\nMicro USB: 5V - 2A, Type-C: 5V - 3A\r\nNguồn ra:\r\n\r\nUSB: 5V - 2AType-C: 5V - 3A\r\nLõi pin:\r\n\r\nPolymer\r\nCông nghệ/Tiện ích:\r\n\r\nĐèn LED báo hiệu\r\nKích thước:\r\n\r\nDày 2.3 cm - Rộng 6 cm - Dài 9 cm\r\nKhối lượng:\r\n\r\n184 g\r\nThương hiệu của:\r\n\r\nThế Giới Di Động\r\nSản xuất tại:\r\n\r\nTrung Quốc', b'0'),
(142, NULL, '2024-06-11', 'IM202406111703418356.png', 'Ốp lưng MagSafe iPhone 15 Pro Max Nhựa cứng viền dẻo UNIQ HYBRID MAGCLICK CHARGING LIFEPRO XTREME ', 341, '1003', 'Ốp lưng MagSafe iPhone 15 Pro Max Nhựa cứng viền dẻo UNIQ HYBRID MAGCLICK CHARGING LIFEPRO XTREME (AF) Chính hãng', b'1'),
(143, NULL, '2024-06-11', 'IM202406111706235553.png', 'Đồng hồ đeo tay', 4534, '1001', 'gfdgdf', b'1'),
(144, NULL, '2024-06-11', 'IM202406111707412732.png', 'sgfdhjkl', 454, '1001', 'rtyrt', b'1');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj4gc2ja2otvwemf4rho2lp3s8` (`orderid`),
  ADD KEY `FKaltatpxipsjtcih4d1h6bn0xr` (`productid`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk3cjfcgb621qhahps1tre43e4` (`username`),
  ADD KEY `FK2n7p8t83wo7x0lep1q06a6cvy` (`order_status_id`);

--
-- Chỉ mục cho bảng `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1krrsjgcawsfg8k8u4hm5gi8q` (`categoryid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `FKaltatpxipsjtcih4d1h6bn0xr` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKj4gc2ja2otvwemf4rho2lp3s8` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK2n7p8t83wo7x0lep1q06a6cvy` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`id`),
  ADD CONSTRAINT `FKk3cjfcgb621qhahps1tre43e4` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK1krrsjgcawsfg8k8u4hm5gi8q` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
