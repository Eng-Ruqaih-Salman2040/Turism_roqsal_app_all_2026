-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2025 at 05:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `damar_roqsal_db2026`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `imge` text NOT NULL,
  `note` text NOT NULL,
  `date_create` varchar(255) NOT NULL,
  `time_create` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `imge`, `note`, `date_create`, `time_create`) VALUES
(15, '482175.jpg', 'الان  اضخم فندق في اليمن', '2023-07-22', '13:46:52'),
(16, '145852.jpg', 'تخفيضات سيتي ماكس \r\nبمناسبة السنة الجديدة ', '2023-07-24', '20:06:15'),
(17, '448554.jpeg', 'يعلن مركز الياسر عن وصول\r\n احدث الجوالات باسعار منافسة', '2023-07-24', '21:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `statues` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `statues`) VALUES
(14, 'ذمار', 1),
(16, 'صنعاء', 1),
(17, 'الحديدة', 1),
(18, 'تعز', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `imge` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_register` varchar(255) NOT NULL,
  `error_password` int(11) NOT NULL DEFAULT 0,
  `activ` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `imge`, `name`, `password`, `phone`, `email`, `date_register`, `error_password`, `activ`) VALUES
(31, '256292.png', 'ruqaih', '123', 77113975, 'ruqaih3.salman3@gmail.com', '2020-11-15', 0, 1),
(32, '256292.png', 'jory', '123', 77, 'jo@gmail.com', '2020-11-15', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `uploaded_on` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `type_notification` int(11) NOT NULL,
  `note` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_create` varchar(255) NOT NULL,
  `time_create` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `subject`, `type_notification`, `note`, `status`, `date_create`, `time_create`) VALUES
(12, '', 0, 'دورة التصوير الاحترافي معهد اللغة الدولي السبت - 10:00 صباحا', 0, '2023-07-22', '14:25: pm'),
(13, '', 0, 'دورة التحضير للتوفل معهد ليد الاحد- 8:00 صباحا', 0, '2023-07-22', '14:26: pm'),
(14, '', 0, 'دبلوم الجرافيكس المعهد العام للاتصالات الاحد - 3:00 عصرا', 0, '2023-07-22', '14:28: pm'),
(15, '', 0, 'دورة الاسعافات الاولية يوم السبت في معهد ذمار العالي', 0, '2023-07-25', '03:22: am');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `name`, `image`, `sort`, `status`) VALUES
(33, 'مطاعم وكافيهات', '413004.jpg', 1, 1),
(34, 'مستشفيات', '588395.jpg', 2, 1),
(35, 'مراكز تجارية', '742922.jpg', 3, 1),
(36, 'مراكز تجميل', '295827.jpg', 4, 1),
(37, 'دوائر حكومية', '779870.jpg', 5, 1),
(38, 'فنادق', '668377.jpg', 6, 1),
(39, 'محطات وقود', '930380.jpg', 7, 1),
(40, 'مدارس', '569168.jpg', 8, 1),
(41, 'جامعات', '205090.jpg', 9, 1),
(42, 'اماكن سياحية وترفيهية', '280174.jpg', 10, 1),
(43, 'اماكن سياحية وترفيهية', '910687.jpg', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `city_id` int(2) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(9) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `statues` int(11) NOT NULL DEFAULT 0,
  `layout_them` int(11) NOT NULL DEFAULT 1,
  `viewer` int(11) NOT NULL DEFAULT 0,
  `profession_license` varchar(255) NOT NULL,
  `section_id` int(11) NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `user_name`, `password`, `name`, `city_id`, `address`, `email`, `phone`, `image`, `description`, `statues`, `layout_them`, `viewer`, `profession_license`, `section_id`, `Latitude`, `Longitude`) VALUES
(27, 'amjad', '161996', 'فندق ومنتجع الميثالي ', 14, 'address', 'ahmed@gmail.com', 771611353, '298915.jpg', 'ملاحظة ملاحظة ملاحظة ملاحظة ملاحظة ملاحظة ملاحظة ', 1, 1, 9, 'profession_license_630805.', 38, '14.57940', '44.394379'),
(28, 'admin', '123456', 'مطعم النوارس ', 14, 'خط صنعاء تعز جوار بريد بئر خابوط', '', 77775362, '767686.png', '', 1, 1, 32, 'profession_license_176987.', 33, '14.544312', '44.396932'),
(32, 'admin', '123456', 'سيتي ماكس', 14, 'شارع صنعاء تعز جوار محطة صوال', '', 658932, '648823.png', '', 1, 1, 4, 'profession_license_133242.', 35, '14.558960', '44.390651'),
(33, '', '', 'التاج الملكي للأدوات المنزلية', 14, '', '', 777632158, '749889.png', '', 1, 1, 2, 'profession_license_749783.', 35, '14.558675', '44.390007'),
(34, 'admin', '123456', 'مستشفى دار الشفاء ', 14, '', '', 0, '55176.jpeg', '', 1, 1, 7, 'profession_license_802773.', 34, '14.562031', '44.398303'),
(35, 'admin', '123456', 'مصلحة الضرائب', 14, 'شارع صنعاء تعز', '', 0, '367667.jpeg', '', 1, 1, 0, 'profession_license_58717.', 37, '14.561138', '44.390078'),
(36, '', '', 'محطة الصباري', 14, 'خط رداع ', '', 77707852, '331797.jpg', '', 1, 1, 1, 'profession_license_638003.', 39, '14.544288', '44.409158'),
(37, '', '', 'حديقة الحمدي', 14, 'الدائري الجنوبي', '', 0, '550689.jpeg', '', 1, 1, 8, 'profession_license_879987.', 43, '14.528858', '44.405428'),
(38, '', '', 'مركز بيوتي مودرن للسيدات ', 14, 'شارع المنزل جوار الكهرباء', '', 0, '446552.jpg', '', 1, 1, 3, 'profession_license_781139.', 36, '14.536171', '44.400942'),
(39, '', '', 'جامعة السعيدة', 14, 'شارع صنعاء', '', 0, '702212.png', '', 1, 1, 3, 'profession_license_627365.', 41, '14566897,44', '388631'),
(40, '', '', 'جامعة السعيدة', 14, 'شارع صنعاء', '', 0, '583389.png', '', 0, 1, 0, 'profession_license_688752.', 41, '14566897,44', '388631'),
(41, 'amjad', '161996', 'مدرسة الوحدة للبنات', 14, 'شارع المنزل', 'aaa@a.com', 777777777, '947057.png', '', 1, 1, 4, 'profession_license_497526.', 40, '0', '0'),
(42, 'amjad', '161996', 'مدرسة حفضة للبنات', 14, 'شارع المنزل', 'aaa@a.com', 777777777, '759782.png', '', 1, 1, 15, 'profession_license_82429.', 40, '15.3036326', '44.1990182'),
(43, 'amjad', '161996', 'ثنوية عقبة بن نفاع', 14, 'شارع صنعاء تعز', 'aaa@a.com', 777777777, '414549.png', '', 1, 1, 0, 'profession_license_535381.', 40, '0', '0'),
(44, 'amjad', '161996', 'مدرسة الشيماء للبنات', 14, 'هران', 'aaa@a.com', 777777777, '121274.png', '', 1, 1, 1, 'profession_license_250768.', 40, '0', '0'),
(45, 'amjad', '161996', 'مدرسة الميثاق', 14, 'الدائري الغربي', 'aaa@a.com', 777777777, '567106.png', '', 0, 1, 0, 'profession_license_636171.', 40, '0', '0'),
(46, 'amjad', '161996', 'مدرسة الرواد', 14, 'المثلث', 'aaa@a.com', 777777777, '945926.png', '', 1, 1, 1, 'profession_license_611690.', 40, '0', '0'),
(47, 'amjad', '161996', 'مدرسة المستقبل', 14, 'المثلث', 'aaa@a.com', 777777777, '177482.png', '', 1, 1, 1, 'profession_license_533669.', 40, '', ''),
(48, 'amjad', '161996', 'جامعة ذمار', 14, 'شارع صنعاء جوار شركة النفط', 'aaa@a.com', 777777777, '763519.jpg', '', 1, 1, 1, 'profession_license_57916.', 41, '0', '0'),
(49, 'amjad', '161996', 'جامعة جينيس', 14, 'الدائري الغربي', 'aaa@a.com', 777777777, '54168.jpg', '', 1, 1, 0, 'profession_license_426462.', 41, '', ''),
(50, 'amjad', '161996', 'جامعة الحكمة', 14, 'شارع صنعاء جولة كمران', 'aaa@a.com', 777777777, '592326.jpg', '', 1, 1, 2, 'profession_license_422417.', 41, '0', '0'),
(53, '', '', 'مستشفى فواز عمران', 14, '', 'ai@gmail.com', 777773526, '499242.jpg', '', 1, 1, 4, 'profession_license_111654.', 34, '14.529491', '44.404536'),
(54, '', '', 'مزرعة رصابة ', 14, 'رصابة', 'n@gmail.com', 0, '893402.jpeg', '', 1, 1, 3, 'profession_license_188976.', 43, '14.697182', '44.345487'),
(55, '', '', 'محمية عتمة', 14, 'عتمة', '', 0, '589847.jpeg', '', 1, 1, 2, 'profession_license_268005.', 43, '14.584123', '44.984404'),
(56, '', '', 'مطعم الدار الملكي ', 14, 'خط صنعاء تعز', '', 772315689, '273409.jpg', '', 1, 1, 3, 'profession_license_146396.', 33, '14.559691', '44.389706'),
(57, '', '', 'مطعم ماكس', 14, 'خط رداع', '', 77744231, '142837.jpg', '', 1, 1, 5, 'profession_license_453544.', 33, '14.543040', '44.403074'),
(58, '', '', 'مستشفى المصلي', 14, 'المحل جوار الجامع الكبير', 'f@gmail.com', 659382, '530095.jpg', '', 1, 1, 3, 'profession_license_836223.', 34, '14.550910', '44.403260'),
(59, '', '', 'مركز مارينا للملابس الجاهزة ', 14, 'شارع المعارض', '', 712358696, '272763.jpeg', '', 1, 1, 2, 'profession_license_249649.', 35, '14.547988', '44.401882'),
(60, '', '', 'مصلحة الاحوال المدنية', 14, 'شارع اربعين', '', 653214, '74854.jpeg', '', 1, 1, 2, 'profession_license_800669.', 37, '14.562416', '44.391998'),
(61, '', '', 'البريد العام', 14, 'شارع تعز جولة كمران', '', 653216, '146119.jpeg', '', 1, 1, 2, 'profession_license_124411.', 37, '14.528393', '44.399694'),
(62, '', '', 'فندق هاي ستار', 14, 'شارع صنعاء', '', 653214, '280028.jpg', '', 1, 1, 3, 'profession_license_916421.', 38, '14.558451', '44.390649');

-- --------------------------------------------------------

--
-- Table structure for table `technical_support`
--

CREATE TABLE `technical_support` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_create` varchar(255) NOT NULL,
  `time_create` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `img_user` varchar(255) NOT NULL,
  `phone` int(9) NOT NULL DEFAULT 777777777,
  `email` varchar(255) NOT NULL,
  `note` text NOT NULL,
  `date_register` varchar(255) NOT NULL,
  `id_validity` int(1) NOT NULL,
  `statues` tinyint(1) NOT NULL,
  `otp_code` int(11) NOT NULL,
  `layout_them` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `password`, `user_name`, `img_user`, `phone`, `email`, `note`, `date_register`, `id_validity`, `statues`, `otp_code`, `layout_them`) VALUES
(137, 'ruqaih774477', 'ruqsal_admin', 'default_image.png', 777777777, 'admin@gmail.com', '																																																							note																																																							', '', 1, 1, 1, 0),
(141, 'admin123', 'admin', '459784.png', 7655443, 'admin@gmail.com', 'kjdaklhdjk adahudjdhgas', '2025-10-18', 1, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_id` (`customers_id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_id` (`shop_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `main_sections_id` (`section_id`);

--
-- Indexes for table `technical_support`
--
ALTER TABLE `technical_support`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `technical_support`
--
ALTER TABLE `technical_support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`customers_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

--
-- Constraints for table `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `shop_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `shop_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
