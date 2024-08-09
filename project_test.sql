-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 09, 2024 lúc 07:02 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `project_test`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `apartment_number` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `city`, `district`, `ward`, `apartment_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '242', '3226', '351008', '97 Man Thien', NULL, NULL, NULL),
(11, 12, '242', '3226', '351008', 'Thôn 2', '2024-06-22 13:00:46', '2024-06-22 13:00:46', NULL),
(21, 22, '269', '2264', '90816', 'Thôn 222', '2024-07-06 03:22:14', '2024-07-06 03:22:14', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Casio', NULL, NULL, NULL),
(2, 'Seiko', NULL, NULL, NULL),
(3, 'Citizen', NULL, NULL, NULL),
(4, 'Omega', NULL, NULL, NULL),
(5, 'Tissot', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `parent_id`, `slug`) VALUES
(1, 'Đồng hồ Nam', NULL, NULL, NULL, 0, 'dong-ho-nam'),
(2, 'Đồng hồ Nữ', NULL, NULL, NULL, 0, 'dong-ho-nu'),
(3, 'Kim (Analog) - Nam', NULL, NULL, NULL, 1, 'analog-1'),
(4, 'Điện tử (Digital) - Nam', NULL, NULL, NULL, 1, 'digital-1'),
(5, 'Kim (Analog) - Nữ', NULL, NULL, NULL, 2, 'analog-2'),
(6, 'Điện tử (Digital) - Nữ', NULL, NULL, NULL, 2, 'digital-2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Trắng', NULL, NULL, NULL),
(2, 'Đen', NULL, NULL, NULL),
(3, 'Xám', NULL, NULL, NULL),
(4, 'Đỏ', NULL, NULL, NULL),
(5, 'Vàng', NULL, NULL, NULL),
(6, 'Xanh', NULL, NULL, NULL),
(7, 'Tím', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_02_06_054552_create_roles_table', 1),
(3, '2023_02_06_093103_create_users_table', 1),
(4, '2023_02_06_093104_create_addresses_table', 1),
(5, '2023_02_09_141232_create_user_verifies_table', 1),
(6, '2023_02_17_101710_create_brands_table', 1),
(7, '2023_03_13_104142_create_colors_table', 1),
(8, '2023_03_13_104200_create_sizes_table', 1),
(9, '2023_03_15_111222_create_categories_table', 1),
(10, '2023_03_16_130121_create_products_table', 1),
(11, '2023_03_16_140642_create_products_color_table', 1),
(12, '2023_03_16_140906_create_products_size_table', 1),
(13, '2023_03_23_091419_create_payments_table', 1),
(14, '2023_03_23_095605_create_orders_table', 1),
(15, '2023_03_27_001440_create_order_details_table', 1),
(16, '2023_03_28_004112_alert_orders_table', 1),
(17, '2023_03_28_004113_alert_orders_table', 1),
(18, '2023_03_28_143413_alert_products_size_table', 1),
(19, '2023_03_28_144341_alert_products_color_table', 1),
(20, '2023_03_28_144345_alert_products_table', 1),
(21, '2023_03_28_144347_alert_orders_table', 1),
(22, '2023_03_28_144348_create_trigger_validate_quantity', 1),
(23, '2023_03_28_144349_create_trigger_group_by_quantity', 1),
(24, '2023_04_11_111222_alter_categories_table', 1),
(25, '2023_04_11_111223_alter_categories_table', 1),
(26, '2023_04_13_114627_create_product_reviews_table', 1),
(27, '2023_04_17_180428_drop_personal_access_tokens_table', 1),
(28, '2023_04_13_114628_alter_products_size_table ', 2),
(29, '2023_04_30_114628_alter_product_table ', 3),
(30, '2023_04_18_180428_create_setting_table', 4),
(31, '2023_04_19_180428_alter_setting_table', 4),
(32, '2023_03_28_144348_create_reduce_quantity_product_trigger', 5),
(33, '2023_05_1_114628_alter_payments_table ', 5),
(34, '2024_07_09_215244_add_checkout_fields_to_orders_table', 6),
(35, '2024_07_09_224401_add_checkout_fields_to_orders_table', 7),
(36, '2024_07_09_230355_add_checkout_fields_to_orders_table', 8),
(37, '2024_07_20_171814_create_product_reviews_table', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `total_money` double NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `transport_fee` double NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment_status` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `ward` varchar(255) NOT NULL,
  `apartment_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_id`, `total_money`, `order_status`, `created_at`, `updated_at`, `deleted_at`, `transport_fee`, `note`, `payment_status`, `name`, `phone_number`, `city`, `district`, `ward`, `apartment_number`) VALUES
(1719061314924, 12, 1, 50631501, 3, '2024-06-22 13:01:54', '2024-06-22 13:05:49', NULL, 31501, 'Đơn hàng của bạn đang chờ đơn vị vận chuyển', 0, '', '', '', '', '', ''),
(1719062935757, 12, 1, 1710501, 3, '2024-06-22 13:28:55', '2024-06-22 13:29:47', NULL, 31501, NULL, 0, '', '', '', '', '', ''),
(1720541410599, 12, 1, 1710501, 3, '2024-07-09 16:10:10', '2024-07-13 18:35:49', NULL, 31501, NULL, 0, 'BảoNgoc', '0365597111', '245', '3249', '110810', 'Thôn 22222'),
(1720574378303, 12, 1, 30911501, 3, '2024-07-10 01:19:39', '2024-07-13 18:40:49', NULL, 31501, NULL, 0, 'Bảo Phạm NÈ', '0365597196', '246', '3694', '800325', 'Thôn 222222'),
(1720749008159, 12, 1, 1631501, 0, '2024-07-12 01:50:08', '2024-07-12 01:50:08', NULL, 31501, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720749517944, 12, 1, 7735500, 3, '2024-07-12 01:58:37', '2024-07-14 14:34:32', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '244', '2195', '120416', 'Thôn 2'),
(1720757228824, 12, 1, 465500, 3, '2024-07-12 04:07:08', '2024-07-12 04:08:13', NULL, 15500, NULL, 0, 'Bảo Ngọc', '0365597196', '262', '3312', '370907', 'Thôn 2'),
(1720757490908, 12, 1, 1365500, 3, '2024-07-12 04:11:30', '2024-07-12 04:11:48', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720757596978, 12, 1, 7735500, 3, '2024-07-12 04:13:16', '2024-07-12 04:14:03', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720757612543, 12, 1, 7735500, 3, '2024-07-12 04:13:32', '2024-07-12 04:14:02', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720757743756, 12, 1, 8185500, 3, '2024-07-12 04:15:43', '2024-07-12 04:17:27', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720757786674, 12, 1, 35175500, 3, '2024-07-12 04:16:26', '2024-07-14 04:23:32', NULL, 15500, NULL, 0, 'Bảo Phạm', '0365597196', '242', '3226', '351008', 'Thôn 2'),
(1720950538646, 12, 2, 41005, 2, '2024-07-14 09:49:22', '2024-07-15 05:19:53', NULL, 41000, NULL, 0, 'Bảo QNgai', '0365597196', '245', '3249', '110810', 'Thôn 2'),
(1721491006278, 12, 1, 491000, 0, '2024-07-20 15:56:46', '2024-07-20 15:56:46', NULL, 41000, NULL, 0, 'Bảo Phạm', '0365597100', '263', '2044', '130631', 'Thôn 23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_size_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_size_id`, `unit_price`, `quantity`, `created_at`, `updated_at`) VALUES
(33, 1719061314924, 438, 12000000, 1, '2024-06-22 13:01:54', '2024-06-22 13:01:54'),
(34, 1719061314924, 446, 7720000, 5, '2024-06-22 13:01:54', '2024-06-22 13:01:54'),
(38, 1719062935757, 424, 1679000, 1, '2024-06-22 13:28:55', '2024-06-22 13:28:55'),
(47, 1720541410599, 424, 1679000, 1, '2024-07-09 16:10:10', '2024-07-09 16:10:10'),
(48, 1720574378303, 442, 7720000, 4, '2024-07-10 01:19:39', '2024-07-10 01:19:39'),
(49, 1720749008159, 427, 1600000, 1, '2024-07-12 01:50:08', '2024-07-12 01:50:08'),
(50, 1720749517944, 442, 7720000, 1, '2024-07-12 01:58:37', '2024-07-12 01:58:37'),
(51, 1720757228824, 447, 450000, 1, '2024-07-12 04:07:08', '2024-07-12 04:07:08'),
(52, 1720757490908, 447, 450000, 3, '2024-07-12 04:11:30', '2024-07-12 04:11:30'),
(53, 1720757596978, 444, 7720000, 1, '2024-07-12 04:13:16', '2024-07-12 04:13:16'),
(54, 1720757612543, 444, 7720000, 1, '2024-07-12 04:13:33', '2024-07-12 04:13:33'),
(55, 1720757743756, 442, 7720000, 1, '2024-07-12 04:15:43', '2024-07-12 04:15:43'),
(56, 1720757743756, 447, 450000, 1, '2024-07-12 04:15:43', '2024-07-12 04:15:43'),
(57, 1720757786674, 437, 12000000, 1, '2024-07-12 04:16:26', '2024-07-12 04:16:26'),
(58, 1720757786674, 442, 7720000, 3, '2024-07-12 04:16:26', '2024-07-12 04:16:26'),
(78, 1720950538646, 447, 1, 5, '2024-07-14 09:49:22', '2024-07-14 09:49:22'),
(80, 1721491006278, 447, 450000, 1, '2024-07-20 15:56:46', '2024-07-20 15:56:46');

--
-- Bẫy `order_details`
--
DELIMITER $$
CREATE TRIGGER `group_by_quantity` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
                declare _record int;
                declare _quantity int;
                select count(*) into _record from order_details where product_size_id = new.product_size_id and order_id = new.order_id;
                if (_record >= 2) then
                    select sum(quantity) into _quantity from order_details where product_size_id = new.product_size_id and order_id = new.order_id;
                    update order_details set quantity = _quantity where product_size_id = new.product_size_id and order_id = new.order_id;
                    SIGNAL sqlstate "45001" set message_text = "error";
                end if;
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `reduce_quantity_product` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
                    declare _quantity int;
                    select quantity into _quantity from products_size where id = new.product_size_id;
                    if (new.quantity <= 0 || _quantity < new.quantity) then
                        SIGNAL sqlstate "45001" set message_text = "error";
                    else
                        update products_size set quantity = _quantity - new.quantity where id = new.product_size_id;
                    end if;
            END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validate_quantity` AFTER INSERT ON `order_details` FOR EACH ROW BEGIN
            declare _quantity int;
            select quantity into _quantity from products_size where id = new.product_size_id;
            if (new.quantity <= 0 || _quantity < new.quantity) then
                SIGNAL sqlstate "45001" set message_text = "error";
            end if;
        END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `status`, `img`) VALUES
(1, 'Khi nhận hàng', NULL, '2024-07-27 09:11:50', NULL, 1, '1722071510.jpg'),
(2, 'Ví điện tử Momo', NULL, NULL, NULL, 1, '1682960202.png'),
(3, 'VNPAY', NULL, '2024-07-18 12:15:55', NULL, 1, '1694970935.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(100) NOT NULL,
  `price_import` double NOT NULL,
  `price_sell` double NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price_import`, `price_sell`, `img`, `description`, `status`, `category_id`, `brand_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(43, 'Casio - Nam AE-1200WHD-1AVDF Size 45 X 42.1 Mm', 1000000, 1114000, '1719059620.png', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Casio là thương hiệu đồng hồ Nhật Bản nổi tiếng ra đời vào năm 1946.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Dẫn đầu phân khúc đồng hồ điện tử và pin/quartz giá rẻ.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế hiện đại, thể thao, có cấu trúc chống sốc G-SHOCK bền bỉ độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tuổi thọ pin 2 - 10 năm.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Đạt 6 giải thưởng thiết kế IF 2024</li></ul>', 1, 4, 1, '2024-06-22 12:33:40', '2024-07-15 05:22:53', NULL),
(44, 'Casio - Nam MTP-1374L-1AVDF', 1000000, 1679000, '1719059965.png', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Casio là thương hiệu đồng hồ Nhật Bản nổi tiếng ra đời vào năm 1946.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Dẫn đầu phân khúc đồng hồ điện tử và pin/quartz giá rẻ.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế hiện đại, thể thao, có cấu trúc chống sốc G-SHOCK bền bỉ độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tuổi thọ pin 2 - 10 năm.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Đạt 6 giải thưởng thiết kế IF 2024</li></ul>', 1, 3, 1, '2024-06-22 12:39:25', '2024-06-22 12:39:25', NULL),
(45, 'Tissot - Nam T137.407.11.351.00', 1000000, 1600000, '1719060145.png', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tissot là thương hiệu đồng hồ cao cấp nổi tiếng Thụy Sĩ, ra đời năm 1853.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Nổi bật với đồng hồ cơ/Automatic và Pin/Quartz, mức giá trung - cao cấp.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế thanh lịch, cổ điển kết hợp hiện đại, bộ máy Powermatic 80 độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Khoảng trữ cót 38 - 80 tiếng, tuổi thọ pin 3 - 5 năm.</li></ul>', 1, 3, 5, '2024-06-22 12:42:25', '2024-06-22 12:42:25', NULL),
(46, 'Seiko - Nam SSC813P1Seiko - Nam SSC813P1', 1000000, 12000000, '1719060390.webp', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Seiko là thương hiệu đồng hồ Nhật Bản nổi tiếng ra đời năm 1882.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Nổi bật với đồng hồ cơ Automatic giá tầm trung.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế cổ điển, phong cách quân đội, hệ thống chống sốc Diashock độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Khoảng trữ cót 40 - 72 tiếng.</li></ul>', 1, 3, 2, '2024-06-22 12:46:30', '2024-06-22 12:46:30', NULL),
(47, 'Citizen - Nam NJ0153-82X', 1000000, 7720000, '1719060562.webp', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Citizen là thương hiệu đồng hồ Nhật Bản nổi tiếng, ra đời năm 1918.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Nổi bật với đồng hồ năng lượng mặt trời Eco Drive độc quyền, giá tầm trung.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế hiện đại, có hệ thống chống sốc độc quyền Parashock.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tuổi thọ pin 8 - 10 năm.</li></ul>', 1, 3, 3, '2024-06-22 12:49:22', '2024-07-15 05:24:11', NULL),
(48, 'Casio - Unisex F-94WA-9DGCasio - Unisex F-94WA-9DG', 10000, 450000, '1719060775.webp', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Casio là thương hiệu đồng hồ Nhật Bản nổi tiếng ra đời vào năm 1946.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Dẫn đầu phân khúc đồng hồ điện tử và pin/quartz giá rẻ.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế hiện đại, thể thao, có cấu trúc chống sốc G-SHOCK bền bỉ độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tuổi thọ pin 2 - 10 năm.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Đạt 6 giải thưởng thiết kế IF 2024</li></ul>', 1, 4, 1, '2024-06-22 12:52:55', '2024-07-15 04:34:09', NULL),
(49, 'Casio - Nữ LA670WA-7DF', 100000, 840000, '1719061038.webp', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Casio là thương hiệu đồng hồ Nhật Bản nổi tiếng ra đời vào năm 1946.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Dẫn đầu phân khúc đồng hồ điện tử và pin/quartz giá rẻ.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Thiết kế hiện đại, thể thao, có cấu trúc chống sốc G-SHOCK bền bỉ độc quyền.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Tuổi thọ pin 2 - 10 năm.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Đạt 6 giải thưởng thiết kế IF 2024</li></ul>', 1, 6, 1, '2024-06-22 12:57:18', '2024-07-15 05:22:36', NULL),
(50, 'Đồng Hồ Tissot - Nữ T050.207.37.017.04', 7000000, 11800000, '1721305458.webp', '<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px;\"><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Máy Tissot Powermatic 80 trữ cót 80 giờ.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Chống nước 3ATM (30m).</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Kính Sapphire chống xước.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Vỏ thép không gỉ 316L.</li><li style=\"padding: 0px; margin: 10px 0px; list-style: inside disc;\">Kích thước mặt 35mm, dày 9.4mm.</li></ul>', 1, 5, 5, '2024-07-18 12:24:18', '2024-07-18 12:26:00', NULL),
(51, 'Đồng Hồ Citizen - Nữ EM0710-54Y', 2500000, 3850000, '1721305691.webp', '<table class=\"charactestic_table\" border=\"0\" bordercolor=\"#EEE\" cellpadding=\"7\" width=\"100%\" style=\"padding: 0px; margin: 0px; border-spacing: 0px; color: rgb(51, 51, 51); font-family: Arial, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14px; background-color: rgb(254, 254, 254);\"><tbody class=\"body_table\" style=\"padding: 0px; margin: 0px;\"><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap; background-color: rgb(245, 245, 245);\"><td class=\"manufactory_name tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" width=\"40%\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Thương hiệu:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; color: var(--main-color);\"><a href=\"https://www.watchstore.vn/dong-ho-citizen-chinh-hang-c1\" title=\"Citizen\" style=\"padding: 0px; margin: 0px; color: var(--main-color); transition: all 0.6s ease-in 0s;\">Citizen</a></span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Xuất xứ:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Nhật Bản</span></td></tr><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap;\"><td class=\"tr-1 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Đối tượng:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Nữ</span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Kháng nước:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">5atm</span></td></tr><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap; background-color: rgb(245, 245, 245);\"><td class=\"tr-1 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Loại máy:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Năng lượng ánh sáng</span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Chất liệu kính:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Kính Sapphire</span></td></tr><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap;\"><td class=\"tr-1 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Chất liệu dây:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Dây Kim Loại</span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Size mặt:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">30mm</span></td></tr><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap; background-color: rgb(245, 245, 245);\"><td class=\"tr-1 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Độ dầy:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">8mm</span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Bộ máy:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\"><a href=\"https://www.watchstore.vn/dong-ho-citizen-eco-drive-chinh-hang-c1\" title=\"Eco Drive\" style=\"padding: 0px; margin: 0px; color: var(--main-color); transition: all 0.6s ease-in 0s;\">Eco Drive</a></span></td></tr><tr class=\"item\" style=\"padding: 0px; margin: 0px; display: flex; flex-wrap: wrap;\"><td class=\"tr-1 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Kiểu mặt:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Khảm trai, Đính đá</span></td><td class=\"tr-0 itemt\" style=\"padding: 12px 7px; margin: 0px; width: 371.5px;\"><span class=\"title_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px; font-weight: 600;\">Tiện ích:&nbsp;</span><span class=\"content_charactestic\" style=\"padding: 0px; margin: 0px; line-height: 20px;\">Giờ, phút, giây</span></td></tr></tbody></table>', 1, 5, 3, '2024-07-18 12:28:11', '2024-07-18 12:28:11', NULL),
(52, 'ABC', 1, 2, '1721351408.png', 'Nhập mô tả sản phẩm mới', 1, 3, 2, '2024-07-19 01:10:08', '2024-07-21 08:10:23', NULL),
(53, 'ABC', 1, 2, '1721351504.png', 'Nhập mô tả sản phẩm mới', 1, 3, 2, '2024-07-19 01:11:44', '2024-07-20 05:31:00', '2024-07-20 05:31:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_color`
--

CREATE TABLE `products_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_color`
--

INSERT INTO `products_color` (`id`, `img`, `color_id`, `product_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(128, '1719059700.png', 3, 43, '2024-06-22 12:35:00', '2024-06-22 12:35:00', NULL),
(129, '1719059729.png', 2, 43, '2024-06-22 12:35:29', '2024-06-22 12:35:29', NULL),
(130, '1719059995.png', 6, 44, '2024-06-22 12:39:55', '2024-06-22 12:39:55', NULL),
(131, '1719060031.png', 2, 44, '2024-06-22 12:40:31', '2024-06-22 12:40:31', NULL),
(132, '1719060152.png', 1, 45, '2024-06-22 12:42:32', '2024-06-22 12:42:32', NULL),
(133, '1719060170.png', 5, 45, '2024-06-22 12:42:50', '2024-06-22 12:42:50', NULL),
(134, '1719060187.png', 2, 45, '2024-06-22 12:43:07', '2024-06-22 12:43:07', NULL),
(135, '1719060208.png', 6, 45, '2024-06-22 12:43:28', '2024-06-22 12:43:28', NULL),
(136, '1719060404.webp', 1, 46, '2024-06-22 12:46:44', '2024-06-22 12:46:44', NULL),
(137, '1719060425.webp', 2, 46, '2024-06-22 12:47:05', '2024-06-22 12:47:05', NULL),
(138, '1719060438.webp', 6, 46, '2024-06-22 12:47:18', '2024-06-22 12:47:53', NULL),
(139, '1719060571.webp', 4, 47, '2024-06-22 12:49:31', '2024-06-22 12:49:31', NULL),
(140, '1719060589.webp', 6, 47, '2024-06-22 12:49:49', '2024-06-22 12:49:49', NULL),
(141, '1719060782.webp', 2, 48, '2024-06-22 12:53:02', '2024-06-22 12:53:02', NULL),
(142, '1719061044.webp', 1, 49, '2024-06-22 12:57:24', '2024-06-22 12:57:24', NULL),
(143, '1719061061.webp', 4, 49, '2024-06-22 12:57:41', '2024-06-22 12:58:00', NULL),
(144, '1719061090.webp', 2, 49, '2024-06-22 12:58:10', '2024-06-22 12:58:10', NULL),
(145, '1721305476.webp', 1, 50, '2024-07-18 12:24:36', '2024-07-18 12:24:36', NULL),
(146, '1721305507.webp', 2, 50, '2024-07-18 12:25:07', '2024-07-18 12:25:07', NULL),
(147, '1721305698.webp', 1, 51, '2024-07-18 12:28:18', '2024-07-18 12:28:18', NULL),
(148, '1721305712.webp', 5, 51, '2024-07-18 12:28:32', '2024-07-18 12:28:32', NULL),
(149, '1721549458.png', 2, 52, '2024-07-21 08:10:58', '2024-07-21 08:10:58', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_size`
--

CREATE TABLE `products_size` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_color_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products_size`
--

INSERT INTO `products_size` (`id`, `product_color_id`, `size_id`, `created_at`, `updated_at`, `quantity`, `deleted_at`) VALUES
(417, 128, 3, NULL, NULL, 50, NULL),
(418, 128, 4, NULL, NULL, 50, NULL),
(419, 129, 4, NULL, NULL, 50, NULL),
(420, 129, 5, NULL, NULL, 150, NULL),
(421, 131, 3, NULL, NULL, 150, NULL),
(422, 131, 4, NULL, NULL, 50, NULL),
(423, 131, 5, NULL, NULL, 100, NULL),
(424, 130, 2, NULL, NULL, 93, NULL),
(425, 130, 4, NULL, NULL, 100, NULL),
(426, 130, 5, NULL, NULL, 50, NULL),
(427, 132, 4, NULL, NULL, 47, NULL),
(428, 132, 5, NULL, NULL, 50, NULL),
(429, 133, 4, NULL, NULL, 49, NULL),
(430, 132, 3, NULL, NULL, 50, NULL),
(431, 133, 3, NULL, NULL, 50, NULL),
(432, 133, 5, NULL, NULL, 50, NULL),
(433, 133, 2, NULL, NULL, 50, NULL),
(434, 134, 5, NULL, NULL, 200, NULL),
(435, 135, 3, NULL, NULL, 50, NULL),
(436, 135, 5, NULL, NULL, 25, NULL),
(437, 136, 4, NULL, '2024-07-14 04:39:21', 40, NULL),
(438, 136, 5, NULL, NULL, 49, NULL),
(439, 137, 5, NULL, NULL, 150, NULL),
(440, 138, 5, NULL, NULL, 24, NULL),
(441, 138, 2, NULL, NULL, 25, NULL),
(442, 139, 2, NULL, NULL, 3, NULL),
(443, 139, 3, NULL, NULL, 20, NULL),
(444, 139, 4, NULL, NULL, 18, NULL),
(445, 140, 5, NULL, NULL, 20, NULL),
(446, 140, 3, NULL, NULL, 15, NULL),
(447, 141, 3, NULL, '2024-07-14 14:09:52', 85, NULL),
(448, 142, 1, NULL, NULL, 150, NULL),
(449, 142, 2, NULL, NULL, 20, NULL),
(450, 143, 1, NULL, NULL, 59, NULL),
(451, 144, 1, NULL, NULL, 20, NULL),
(452, 144, 2, NULL, NULL, 20, NULL),
(453, 145, 1, NULL, NULL, 30, NULL),
(454, 145, 2, NULL, NULL, 25, NULL),
(455, 146, 2, NULL, NULL, 25, NULL),
(456, 147, 1, NULL, NULL, 50, NULL),
(457, 147, 2, NULL, NULL, 100, NULL),
(458, 148, 1, NULL, NULL, 150, NULL),
(459, 148, 2, NULL, NULL, 150, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `order_id`, `product_id`, `rating`, `content`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1720757786674, 47, 5, 'Good', '2024-07-19 17:00:00', NULL, NULL),
(5, 1720757786674, 46, 5, 'Tốt', '2024-07-20 13:45:03', '2024-07-20 13:45:03', NULL),
(8, 1720757743756, 47, 5, 'Tốt và rất đẹp', '2024-07-20 16:36:46', '2024-07-20 16:36:46', NULL),
(9, 1720757743756, 48, 4, 'Bền bỉ và năng động', '2024-07-20 16:37:27', '2024-07-20 16:37:27', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Quản trị viên'),
(2, 'Nhân Viên'),
(3, 'Khách hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` char(100) NOT NULL,
  `email` char(100) NOT NULL,
  `address` char(255) NOT NULL,
  `phone_number` char(20) NOT NULL,
  `maintenance` int(11) NOT NULL,
  `notification` text NOT NULL,
  `introduction` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `setting`
--

INSERT INTO `setting` (`id`, `logo`, `name`, `email`, `address`, `phone_number`, `maintenance`, `notification`, `introduction`, `created_at`, `updated_at`) VALUES
(1, 'logo.png', 'WatchStyle', 'WatchStyle@gmail.com', '97 Đường Man Thiện, Phường Hiệp Phú, Quận 9, TP. Hồ Chí Minh', '02838.295.258', 2, '<b>WEBSITE tạm thời bảo trì để nâng cấp xin  quay lại sau</b>', '<h3 style=\"text-align: center;\">\r\n                            <b>GIỚI THIỆU VỀ WATHCSTYLE</b></h3>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            <span style=\"font-family: \\\'Source Sans Pro\\\', \\\'Times New Roman\\\';\">\r\n                            Chào mừng đến với website bán đồng hồ của chúng tôi! \r\n                            Chúng tôi tự hào là một trong những cửa hàng trực tuyến hàng đầu về đồng hồ, \r\n                            cung cấp cho khách hàng những sản phẩm đồng hồ chất lượng cao và đa dạng.\r\n                            </span>\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Đối với chúng tôi, đồng hồ không chỉ là một công cụ để xem giờ mà còn là một biểu tượng của phong cách và đẳng cấp. \r\n                            Chúng tôi không chỉ cung cấp cho khách hàng những chiếc đồng hồ đẹp và chất lượng, \r\n                            mà còn mang đến cho họ những trải nghiệm mua sắm tuyệt vời. Chúng tôi luôn nỗ lực để đáp ứng nhu cầu của khách hàng,\r\n                            từ việc cung cấp những mẫu đồng hồ mới nhất đến việc cải tiến dịch vụ khách hàng.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Chúng tôi cam kết chỉ bán những chiếc đồng hồ được làm từ chất liệu tốt nhất, \r\n                            đảm bảo độ bền cao và giá trị sử dụng lâu dài. Chúng tôi luôn đảm bảo rằng mỗi sản phẩm đều được kiểm tra kỹ lưỡng trước khi đưa vào bán hàng, \r\n                            để đảm bảo rằng chúng đáp ứng các tiêu chuẩn chất lượng mà chúng tôi đặt ra.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Chúng tôi luôn cập nhật các xu hướng đồng hồ mới nhất, \r\n                            đảm bảo rằng bạn sẽ luôn có những chiếc đồng hồ đẹp và phù hợp với phong cách của mình. \r\n                            Từ những mẫu đồng hồ thể thao năng động đến những thiết kế sang trọng cho các buổi tiệc, \r\n                            chúng tôi có tất cả những gì bạn cần để thể hiện phong cách cá nhân của mình.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Ngoài ra, \r\n                            chúng tôi cũng cung cấp cho khách hàng các phụ kiện đồng hồ đa dạng, từ dây đeo, hộp đựng, \r\n                            đến các dụng cụ bảo dưỡng, giúp khách hàng hoàn thiện và bảo quản chiếc đồng hồ của mình một cách tốt nhất.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Đội ngũ nhân viên của chúng tôi luôn sẵn sàng hỗ trợ bạn trong quá trình mua sắm. \r\n                            Chúng tôi cam kết đem đến cho khách hàng những trải nghiệm mua sắm tuyệt vời, từ việc tìm kiếm sản phẩm đến việc đặt hàng và nhận hàng.\r\n                        </h5>\r\n                        <p><br></p>\r\n                        <h5>\r\n                            Chúng tôi tự hào giới thiệu cho bạn những mẫu đồng hồ đa dạng và phong phú. \r\n                            Từ những mẫu đồng hồ casual hàng ngày đến những thiết kế sang trọng cho các dịp đặc biệt, \r\n                            chúng tôi có tất cả những gì bạn cần để thể hiện phong cách cá nhân của mình.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Với những thiết kế đa dạng, \r\n                            chúng tôi cam kết đem đến cho khách hàng những trải nghiệm mua sắm tuyệt vời. \r\n                            Những sản phẩm của chúng tôi được thiết kế và sản xuất bởi những thương hiệu nổi tiếng trên thế giới, \r\n                            đảm bảo về chất lượng và độ bền.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Nếu bạn đang tìm kiếm những mẫu đồng hồ năng động và trẻ trung, \r\n                            hãy khám phá các sản phẩm đồng hồ thể thao, đồng hồ thông minh, \r\n                            hoặc các thiết kế đồng hồ phong cách vintage. \r\n                            Nếu bạn cần một chiếc đồng hồ lịch sự cho một buổi tiệc hoặc sự kiện quan trọng, \r\n                            chúng tôi cũng có các thiết kế sang trọng như đồng hồ kim loại, đồng hồ đính đá quý, đồng hồ dây da hay đồng hồ cơ.\r\n                            <br>\r\n                        </h5>\r\n                        <h5><br></h5>\r\n                        <h5>\r\n                            Ngoài ra, chúng tôi cũng cung cấp các sản phẩm đồng hồ thể thao, \r\n                            đáp ứng nhu cầu của những khách hàng yêu thích các hoạt động thể thao và thích sự chính xác khi sử dụng.\r\n                            <br>\r\n                            Hãy truy cập vào website của chúng tôi để khám phá thêm các sản phẩm đồng hồ đa dạng và phong phú. \r\n                            Chúng tôi tin rằng, bạn sẽ tìm thấy những sản phẩm ưng ý và phù hợp với phong cách cá nhân của mình.\r\n                        </h5>\r\n<div class=\"container\" style=\"margin-top: 20px;\">\r\n      <h2 style=\"font-family: \\\'Source Sans Pro\\\';\"><span style=\"font-family: \"Source Sans Pro\";\" source=\"\" sans=\"\" pro\";\"=\"\">Địa chỉ cửa hàng</span></h2>\r\n      <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.521541680414!2d106.78436437517327!3d10.84788015787144!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175272a49301c55%3A0xde097a8add7a6926!2zOTcgxJAuIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1721277519467!5m2!1svi!2s\" width=\"100%\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>\r\n    </div>', NULL, '2024-07-23 08:53:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` char(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '29-33mm', NULL, NULL, NULL),
(2, '33-37mm', NULL, NULL, NULL),
(3, '37-40mm', NULL, NULL, NULL),
(4, '40-42mm', NULL, NULL, NULL),
(5, '42-45mmm', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `active` int(11) NOT NULL DEFAULT 1,
  `disable_reason` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `email_verified_at`, `phone_number`, `role_id`, `active`, `disable_reason`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2023-04-28 04:29:18', '0000000000', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Bảo Phạm', 'phamngocbao2104@gmail.com', '$2y$10$VINPiQ2X7JQ9cEFW5ym2gusXU6OVAj1ocg5sJN.O7I.35paXWcUGm', '2024-06-22 13:00:56', '0365597196', 3, 1, NULL, NULL, 12, NULL, NULL, '2024-06-22 13:00:35', '2024-08-02 09:43:38', NULL),
(22, 'BaoQN', 'phamngocbao2103@gmail.com', '$2y$10$lR7LWenFruPqdcVREGxFB.W85RAySNZ259Q7mo1NFYyeMuwoI/PQK', '2024-07-06 03:23:13', '0365597100', 3, 1, NULL, NULL, NULL, 1, NULL, '2024-07-06 03:22:10', '2024-07-21 08:07:18', '2024-07-21 08:07:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_verifies`
--

CREATE TABLE `user_verifies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `email_verify` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_size_id_foreign` (`product_size_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`);

--
-- Chỉ mục cho bảng `products_color`
--
ALTER TABLE `products_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_color_color_id_foreign` (`color_id`),
  ADD KEY `products_color_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `products_size`
--
ALTER TABLE `products_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_size_product_color_id_foreign` (`product_color_id`),
  ADD KEY `products_size_size_id_foreign` (`size_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_order_id_foreign` (`order_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_verifies`
--
ALTER TABLE `user_verifies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1721491006279;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `products_color`
--
ALTER TABLE `products_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT cho bảng `products_size`
--
ALTER TABLE `products_size`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=460;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `user_verifies`
--
ALTER TABLE `user_verifies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_size_id_foreign` FOREIGN KEY (`product_size_id`) REFERENCES `products_size` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `products_color`
--
ALTER TABLE `products_color`
  ADD CONSTRAINT `products_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `products_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products_size`
--
ALTER TABLE `products_size`
  ADD CONSTRAINT `products_size_product_color_id_foreign` FOREIGN KEY (`product_color_id`) REFERENCES `products_color` (`id`),
  ADD CONSTRAINT `products_size_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
