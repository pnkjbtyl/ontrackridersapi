-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2019 at 08:25 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riders_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(20) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `first_name`, `last_name`, `email`, `password`) VALUES
(3, 'dipshi', 'sharma', 'dipshisharma110@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(4, 'dipshi', 'sharma', 'dipshisharmaQa@gmail.com', '6dd289784f4da7cd755643ec6d58b6b1'),
(5, 'neha', 'sharma', 'neha123@gmail.com', 'ece3436d68a3fc19daba8766d5e3910e'),
(6, 'Mohit', 'Sikri', 'mohit95.sikri@gmail.com', 'a7aed969c34749dd2f0a9b29193f90a7');

-- --------------------------------------------------------

--
-- Table structure for table `rider_files`
--

CREATE TABLE `rider_files` (
  `id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `fs_name` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `is_updated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rider_files`
--

INSERT INTO `rider_files` (`id`, `user_id`, `file_name`, `fs_name`, `created_at`, `updated_at`, `is_deleted`, `is_updated`) VALUES
(899, 67, 'pp.png', '1558593382963-pp.png', '2019-05-23 12:06:09', '2019-05-23 12:06:09', 0, 0),
(900, 67, 'Rannpri.png', '1558593382969-Rannpri.png', '2019-05-23 12:06:09', '2019-05-23 12:06:09', 0, 0),
(901, 67, 'wall.png', '1558593382977-wall.png', '2019-05-23 12:06:09', '2019-05-23 12:06:09', 0, 0),
(902, 64, 'image_path_1555659066663_83170342-37c6-465f-8da7-8d1014bccc79.png', '1558594907521-image_path_1555659066663_83170342-37c6-465f-8da7-8d1014bccc79.png', '2019-05-23 12:30:58', '2019-05-23 12:30:58', 0, 0),
(903, 64, 'image_path_1555659066908_ab3b6a1b-2ad9-4385-9c02-6e7cce9faf59.png', '1558594907522-image_path_1555659066908_ab3b6a1b-2ad9-4385-9c02-6e7cce9faf59.png', '2019-05-23 12:30:58', '2019-05-23 12:30:58', 0, 0),
(904, 99, '21052019 TELKOM FLASH LOT 113 KZN 1.csv', '1558609684333-21052019 TELKOM FLASH LOT 113 KZN 1.csv', '2019-05-23 16:07:46', '2019-05-23 16:07:46', 0, 0),
(905, 70, 'cropped1891189834352275816.jpg', '1558616213458-cropped1891189834352275816.jpg', '2019-05-23 16:07:46', '2019-05-23 16:07:46', 0, 0),
(906, 70, 'cropped3409303624840238377.jpg', '1558616327837-cropped3409303624840238377.jpg', '2019-05-23 16:07:46', '2019-05-23 16:07:46', 0, 0),
(907, 70, 'cropped6937732933237361309.jpg', '1558616969263-cropped6937732933237361309.jpg', '2019-05-23 18:39:06', '2019-05-23 18:39:06', 0, 0),
(908, 70, 'cropped8848495615584153111.jpg', '1558617236146-cropped8848495615584153111.jpg', '2019-05-23 18:39:06', '2019-05-23 18:39:06', 0, 0),
(909, 70, 'cropped5549410944476783981.jpg', '1558617399969-cropped5549410944476783981.jpg', '2019-05-23 18:39:06', '2019-05-23 18:39:06', 0, 0),
(910, 64, 'new_image_1555659094859_2eebdce5-5d59-4f42-abe3-53d966eaaf13.png', '1558617557226-new_image_1555659094859_2eebdce5-5d59-4f42-abe3-53d966eaaf13.png', '2019-05-23 18:39:06', '2019-05-23 18:39:06', 0, 0),
(911, 64, 'new_image_1555659095508_9f4b7130-3d18-4a6b-b105-edb2ea5be69c.png', '1558617557227-new_image_1555659095508_9f4b7130-3d18-4a6b-b105-edb2ea5be69c.png', '2019-05-23 18:39:06', '2019-05-23 18:39:06', 0, 0),
(912, 70, 'cropped6390969787506722294.jpg', '1558618200057-cropped6390969787506722294.jpg', '2019-05-23 18:53:26', '2019-05-23 18:53:26', 0, 0),
(913, 70, 'cropped2405851058804913940.jpg', '1559022325163-cropped2405851058804913940.jpg', '2019-05-28 10:27:21', '2019-05-28 10:27:21', 0, 0),
(914, 100, 'cropped4297202648216998819.jpg', '1559108942413-cropped4297202648216998819.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(915, 100, 'cropped3667018061184455693.jpg', '1559109377841-cropped3667018061184455693.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(916, 100, 'cropped5277207819969278335.jpg', '1559110512196-cropped5277207819969278335.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(917, 100, 'cropped8039567928926122238.jpg', '1559110856285-cropped8039567928926122238.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(918, 100, 'cropped3530066755814104587.jpg', '1559110975784-cropped3530066755814104587.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(919, 100, 'cropped6942389221239208496.jpg', '1559111268827-cropped6942389221239208496.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(920, 100, 'cropped4846651744914745269.jpg', '1559111623604-cropped4846651744914745269.jpg', '2019-05-28 19:02:28', '2019-05-28 19:02:28', 0, 0),
(921, 100, 'cropped702013786919044241.jpg', '1559111886126-cropped702013786919044241.jpg', '2019-05-29 12:07:47', '2019-05-29 12:07:47', 0, 0),
(922, 100, 'cropped1871743367301413076.jpg', '1559111977492-cropped1871743367301413076.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(923, 100, 'cropped4828611240583397862.jpg', '1559112299170-cropped4828611240583397862.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(924, 100, 'cropped1575864674556137105.jpg', '1559112445500-cropped1575864674556137105.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(925, 100, 'cropped623335252999809585.jpg', '1559112644796-cropped623335252999809585.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(926, 100, 'cropped5250882643932278158.jpg', '1559112711384-cropped5250882643932278158.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(927, 100, 'cropped2494346792979525039.jpg', '1559113029769-cropped2494346792979525039.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(928, 100, 'cropped6331628703594948688.jpg', '1559113407764-cropped6331628703594948688.jpg', '2019-05-29 12:08:41', '2019-05-29 12:08:41', 0, 0),
(929, 105, 'cropped5946872524617578180.jpg', '1559115801395-cropped5946872524617578180.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(930, 105, 'cropped1060580826848964949.jpg', '1559116077046-cropped1060580826848964949.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(931, 105, 'cropped538499283267204010.jpg', '1559116537252-cropped538499283267204010.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(932, 105, 'cropped1888045069215321990.jpg', '1559116650822-cropped1888045069215321990.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(933, 105, 'cropped6423937285814469503.jpg', '1559117318042-cropped6423937285814469503.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(934, 105, 'cropped3453624471239552430.jpg', '1559117622926-cropped3453624471239552430.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(935, 105, 'cropped1116574953512856726.jpg', '1559118517812-cropped1116574953512856726.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(936, 105, 'cropped4689785843303817006.jpg', '1559118716889-cropped4689785843303817006.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(937, 105, 'cropped3965017685425222442.jpg', '1559118911169-cropped3965017685425222442.jpg', '2019-05-29 13:04:27', '2019-05-29 13:04:27', 0, 0),
(938, 64, 'cropped69748304905520477.jpg', '1560157479706-cropped69748304905520477.jpg', '2019-06-10 13:55:43', '2019-06-10 13:55:43', 0, 0),
(939, 64, 'cropped7772974184755187339.jpg', '1560173634152-cropped7772974184755187339.jpg', '2019-06-10 13:55:43', '2019-06-10 13:55:43', 0, 0),
(940, 115, 'cropped5130607805602563621.jpg', '1560252254347-cropped5130607805602563621.jpg', '2019-06-11 10:47:07', '2019-06-11 10:47:07', 0, 0),
(941, 64, 'cropped8231772538607666149.jpg', '1560317093327-cropped8231772538607666149.jpg', '2019-06-12 10:30:59', '2019-06-12 10:30:59', 0, 0),
(942, 115, 'cropped280946140.jpg', '1560334152340-cropped280946140.jpg', '2019-06-12 15:36:15', '2019-06-12 15:36:15', 0, 0),
(943, 115, 'cropped-243563945.jpg', '1560344524055-cropped-243563945.jpg', '2019-06-12 15:36:15', '2019-06-12 15:36:15', 0, 0),
(944, 115, 'cropped-253430793.jpg', '1560409323224-cropped-253430793.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(945, 115, 'cropped1362028740.jpg', '1560409402265-cropped1362028740.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(946, 115, 'cropped-1856381373.jpg', '1560409451356-cropped-1856381373.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(947, 115, 'cropped-401626737.jpg', '1560409614235-cropped-401626737.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(948, 115, 'cropped1802809005.jpg', '1560410342685-cropped1802809005.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(949, 115, 'cropped-1353164775.jpg', '1560410431497-cropped-1353164775.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(950, 115, 'cropped-1288049852.jpg', '1560410952989-cropped-1288049852.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(951, 115, 'cropped481764916.jpg', '1560411063909-cropped481764916.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(952, 64, 'cropped5795310666880452651.jpg', '1560427042777-cropped5795310666880452651.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(953, 64, 'cropped1402596674760180942.jpg', '1560427099577-cropped1402596674760180942.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(954, 64, 'cropped2129741696625393819.jpg', '1560427156400-cropped2129741696625393819.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(955, 64, 'cropped685503480884311884.jpg', '1560431500185-cropped685503480884311884.jpg', '2019-06-13 12:31:06', '2019-06-13 12:31:06', 0, 0),
(956, 115, 'cropped7316892099221012234.jpg', '1560757563224-cropped7316892099221012234.jpg', '2019-06-17 11:07:27', '2019-06-17 11:07:27', 0, 0),
(957, 115, 'cropped7540647734498321897.jpg', '1560757623722-cropped7540647734498321897.jpg', '2019-06-17 11:07:27', '2019-06-17 11:07:27', 0, 0),
(958, 115, 'cropped509386214.jpg', '1560777240646-cropped509386214.jpg', '2019-06-17 11:07:27', '2019-06-17 11:07:27', 0, 0),
(959, 115, 'cropped6107916520442565857.jpg', '1560859378029-cropped6107916520442565857.jpg', '2019-06-18 16:47:48', '2019-06-18 16:47:48', 0, 0),
(960, 115, 'cropped9183070256880886333.jpg', '1560859404132-cropped9183070256880886333.jpg', '2019-06-18 16:47:48', '2019-06-18 16:47:48', 0, 0),
(961, 115, 'cropped5263332804289224614.jpg', '1560924202636-cropped5263332804289224614.jpg', '2019-06-19 10:55:01', '2019-06-19 10:55:01', 0, 0),
(962, 115, 'cropped3885771865620081787.jpg', '1560924203171-cropped3885771865620081787.jpg', '2019-06-19 10:55:01', '2019-06-19 10:55:01', 0, 0),
(963, 115, 'cropped2623091394516233965.jpg', '1561012099145-cropped2623091394516233965.jpg', '2019-06-20 11:48:13', '2019-06-20 11:48:13', 0, 0),
(964, 115, 'cropped5932627070876096599.jpg', '1561023828785-cropped5932627070876096599.jpg', '2019-06-20 11:48:13', '2019-06-20 11:48:13', 0, 0),
(965, 115, 'cropped4386887642344061163.jpg', '1561023844245-cropped4386887642344061163.jpg', '2019-06-20 11:48:13', '2019-06-20 11:48:13', 0, 0),
(966, 115, 'cropped2761782189954118632.jpg', '1561027904239-cropped2761782189954118632.jpg', '2019-06-20 11:48:13', '2019-06-20 11:48:13', 0, 0),
(967, 115, 'cropped1952859673154424705.jpg', '1561030594597-cropped1952859673154424705.jpg', '2019-06-20 11:48:13', '2019-06-20 11:48:13', 0, 0),
(968, 115, 'cropped3252824154563773996.jpg', '1561095145609-cropped3252824154563773996.jpg', '2019-06-21 10:25:37', '2019-06-21 10:25:37', 0, 0),
(969, 115, 'cropped5196867011916941529.jpg', '1561097946576-cropped5196867011916941529.jpg', '2019-06-21 10:25:37', '2019-06-21 10:25:37', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rider_users`
--

CREATE TABLE `rider_users` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `salt` varchar(64) NOT NULL,
  `age` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `driving_licence` varchar(255) DEFAULT NULL,
  `identification_no` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `smoke` varchar(255) DEFAULT NULL,
  `drink` varchar(255) DEFAULT NULL,
  `spectacles` varchar(255) DEFAULT NULL,
  `profile_pic_id` int(10) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rider_users`
--

INSERT INTO `rider_users` (`id`, `name`, `email`, `password`, `salt`, `age`, `dob`, `location`, `driving_licence`, `identification_no`, `gender`, `blood_group`, `marital_status`, `smoke`, `drink`, `spectacles`, `profile_pic_id`, `created_at`, `updated_at`) VALUES
(64, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 955, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(66, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(67, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$qqZn8M5JCd26mgwkgnfUreTufLSh0skwoGhkWH/zDm7M4A0t/tf1m', 'fBzC61VGdArAXDcxLsVsFntch1aosrjN', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 900, '2019-05-15 10:52:49', '2019-05-28 14:56:09'),
(68, 'Priyanka', 'priyankagiri1426@gmail.com', '$2b$04$tuwLy8NdfuL98iSdKEiT/.Wqlo7ud4ewDZ32Rl3XThO81itT.LUpa', 'DJrUzHbdvk02o05SAMImtJEbyi2VwxCv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 13:42:23', '2019-05-15 13:42:23'),
(69, 'ms', 'mohit95.sikri@gmail.com', '$2b$04$g6lmWyqi1vsRmRr3A9ujSuTH5PGaUfZoXHO/Vogl0OxLDFceMO5fO', '8OeYvndccb9Xekn7a5zXjEi6r22Qnc8Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 15:54:44', '2019-05-15 15:54:44'),
(70, 'Mohit Sikri', 'abc@123.com', '$2b$04$vfYzxNyalsbxjusHNObls.zTmNDdRA3S6Hwi.xhed/WDOPzyAVlOa', 'VDvJHnCNRG2luH4TyvycMioUWwEpIXOY', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-28 15:04:12'),
(71, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(72, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(73, 'Mohit Sikri', 'abc@123.com', '$2b$04$vfYzxNyalsbxjusHNObls.zTmNDdRA3S6Hwi.xhed/WDOPzyAVlOa', 'VDvJHnCNRG2luH4TyvycMioUWwEpIXOY', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-28 15:04:12'),
(74, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(75, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(76, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$qqZn8M5JCd26mgwkgnfUreTufLSh0skwoGhkWH/zDm7M4A0t/tf1m', 'fBzC61VGdArAXDcxLsVsFntch1aosrjN', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 0, '2019-05-15 10:52:49', '2019-05-28 14:56:09'),
(77, 'Mohit Sikri', 'abc@123.com', '$2b$04$vfYzxNyalsbxjusHNObls.zTmNDdRA3S6Hwi.xhed/WDOPzyAVlOa', 'VDvJHnCNRG2luH4TyvycMioUWwEpIXOY', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-28 15:04:12'),
(78, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(79, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(80, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(81, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(82, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(83, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(84, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(85, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(86, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(87, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(88, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(89, 'Priyanka', 'priyankagiri1426@gmail.com', '$2b$04$tuwLy8NdfuL98iSdKEiT/.Wqlo7ud4ewDZ32Rl3XThO81itT.LUpa', 'DJrUzHbdvk02o05SAMImtJEbyi2VwxCv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 13:42:23', '2019-05-15 13:42:23'),
(90, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(91, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(92, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(93, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(94, 'Pankaj Batyal', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', '28', '31/08/1990', 'Kalka, Haryana, India', 'HR49BAGM-KLKPKL', '372254886798', 'M', 'A-', 'Married', 'No', 'No', 'No', 0, '2019-05-13 18:54:03', '2019-06-13 17:38:13'),
(98, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$qqZn8M5JCd26mgwkgnfUreTufLSh0skwoGhkWH/zDm7M4A0t/tf1m', 'fBzC61VGdArAXDcxLsVsFntch1aosrjN', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 0, '2019-05-15 10:52:49', '2019-05-28 14:56:09'),
(99, 'kau', 'dipshisharma110@gmail.com', '$2b$04$LYGIfkCEa3iDOZzqdGSKeOsOSV/1KMg5oeU9n8px4oPHElJG3j5le', 'Su2IHLiS91SYfX5pp32NeQ4ep99GMcdL', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', NULL, '2019-05-23 13:19:14', '2019-05-27 18:28:15'),
(101, 'msd', 'ms2020@abc.com', '$2b$04$U5OeVsQhmfUQX1X0ZPaE9eJpVMzwCACWUMlEJzY/.yM2JPGU9z8O2', 'M7J6oenmsgZ7IxWphTyKBhNjOEcB52EJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-29 12:45:03', '2019-05-29 12:45:03'),
(102, 'mohit sikri', 'mohit20.sikri@gmail.com', '$2b$04$sSlR9GioDBcqjvyGBbGTA.DbrocOm/3eoRXfs/IXjsFTluIsIyEaS', 'JdsxKbbLYAiC74xlczmFtfhgWBxnova2', '24', '06/06/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456', '123456', 'M', 'A+', 'Single', 'No', 'No', 'No', NULL, '2019-05-29 13:00:49', '2019-06-06 14:16:31'),
(104, 'pri', 'pri23@gmail.com', '$2b$04$UT22QZS8r0ivzjLeQTLuC.Bf6sXR0Rn.O5j6VzjehYF9E.ZcTxa4q', 'ZEEIPsdcQXp6aYlY25JzLijVilJaL6Lv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-29 13:04:31', '2019-05-29 13:04:31'),
(105, 'mohit sikri', 'abc@abc.com', '$2b$04$D2.IxJ9ikh48d8IFZdCFye4RET8k1zkq6UOpu9XQDR8mw8h86vSqS', 'tbNn0FPxFPKF2yWA9zccZ6q2ff4yljFv', '11', '29/05/2008', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456', '123456', 'M', 'A+', 'Single', 'No', 'No', 'No', 937, '2019-05-29 13:12:29', '2019-05-29 14:06:22'),
(106, 'neha', 'neha123@gmail.com', '$2b$04$mnE51psgSO1gB51JdLYh6uuogZ3fA9ERKZjR378ofEmKrKRwXgctO', 'Hq0oPFXrQ7ynklXC4j3T4GuE0bUITQKK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-30 12:32:02', '2019-05-30 12:32:02'),
(107, 'Amanpreet Singh', 'amanabc81@gmail.com', '$2b$04$AMWFr0kItN7Q6aP4zrbLZeK3kaT1KHzep0T4wiEg8BJ0Nx8BcoMZS', 'JxIs0fOJvlM2k3F1CvB8bxR7hhGvFFso', '12', '02/06/2007', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', 'scsc5', '123456', 'M', 'B+', 'Single', 'No', 'No', 'No', NULL, '2019-06-06 12:33:03', '2019-06-07 13:02:10'),
(108, 'Amanpreet Singh', 'amanabc5298@gmail.com', '$2b$04$lI62EPjacXWmK4onqBkGTu8GV4LlIyk40NemSwviAA2fzlGznxACu', 'RTDyy0r4b1lRN6UP8d1DM2e8O444Gmni', '21', '05/02/1998', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', 'PB10TTB12', '2471215021', 'M', 'B+', 'Single', 'No', 'No', 'No', NULL, '2019-06-07 13:19:05', '2019-06-07 16:48:00'),
(109, 'Aman', 'malhota@gmail.com', '$2b$04$shqF/1gE6OaRhKgqvdXZmu9FaLpNAh6TAYOW7s1BN6WIrxlC1FZia', 'kG3LblNqFhMiAgqQLe0MIcW54Z9iG8xY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 16:46:53', '2019-06-10 16:46:53'),
(110, 'dcbjcb', 'malhotra@gmail.com', '$2b$04$GC/5y47U3r2uOfWRRWu7S.e6hqB7530xm4b75I0Gc6un99a2Lpvd2', 'JVv8EOLyORrMiK4HW8on54I4xnIAezXH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 16:48:33', '2019-06-10 16:48:33'),
(111, 'Aman', 'abcd@123.com', '$2b$04$mDkgMpNvQv7mBbLTypsqp.P2TnmKqd9JPbWqUAvD.ObQ7pJ5k05HK', '1qSq6GPWzadtEI99Rszm3F6gHN5CYLGb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 16:54:06', '2019-06-10 16:54:06'),
(112, 'ASM', 'abcde@123.com', '$2b$04$y5iFqphDLqpLJtSYjsqbW.HDuJAEE8ansq8fnRTTuAjZNUQTAE.x.', 'dZIVHmf2SuAVZJXeeJBk86rBPCYbXA1n', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 17:19:38', '2019-06-10 17:19:38'),
(113, 'ABCD', 'Abcde@gmail.com', '$2b$04$YOztfwRCBNCmqt/xTY/eLOMp0HDheKQHKN6J/AU3tHUvKKUHm5o2W', 'KGSSNjaRrqIPnxgGsUgODGRHF70rP650', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 17:22:55', '2019-06-10 17:22:55'),
(114, 'hhv', 'a@123.com', '$2b$04$0PZEb9y6LDWzHpgiapHLuegYyuUeCLK4ZH81QwWjr22P7keYKVfZa', 'nDKOgbfJLKfRMW2fsVDjNgA8wW1V41QJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-10 18:47:15', '2019-06-10 18:47:15'),
(115, 'Amanpreet Singh', 'ab@123.com', '$2b$04$3Vzw2HwQio0ID6gJw3iA7eIpq/Wu.anKu0uil3/43qxqs.zmMoHzO', 'jTDa0dO9ISmJyE6EXaNlCKHkshNU9eL2', '21', '05/02/1998', 'Industrial Area, Sector 74, Sahibzada Ajit Singh Nagar, Punjab 140308, India', 'ABCDE1234F', '2471215021', 'M', 'B+', 'Single', 'No', 'No', 'No', 969, '2019-06-10 18:51:26', '2019-06-21 11:48:44');

-- --------------------------------------------------------

--
-- Table structure for table `rider_vehicles`
--

CREATE TABLE `rider_vehicles` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `registration_no` varchar(255) NOT NULL,
  `registrant_name` varchar(255) NOT NULL,
  `vehicle_image_ids` text,
  `make` varchar(255) NOT NULL,
  `vehicle_type` varchar(255) NOT NULL,
  `body_type` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_year` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `seat_capacity` varchar(255) NOT NULL,
  `engine_cc` varchar(255) NOT NULL,
  `fuel_type` varchar(255) NOT NULL,
  `interior` varchar(255) NOT NULL,
  `pets_allowed` varchar(255) NOT NULL,
  `music_allowed` varchar(255) NOT NULL,
  `smoking_allowed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rider_vehicles`
--

INSERT INTO `rider_vehicles` (`id`, `user_id`, `registration_no`, `registrant_name`, `vehicle_image_ids`, `make`, `vehicle_type`, `body_type`, `model`, `model_year`, `color`, `seat_capacity`, `engine_cc`, `fuel_type`, `interior`, `pets_allowed`, `music_allowed`, `smoking_allowed`) VALUES
(7, 64, '123', 'AMAN', '903,902', 'Honda', '2 Wheeler', 'Others', 'Activa', '2017', 'Black', '2', '110 CC', 'Petrol', 'Moderate', 'No', 'Yes', 'No'),
(9, 64, '103', 'AMAN', '903,902', 'Honda', '2 Wheeler', 'Others', 'Activa', '2017', 'Black', '2', '110 CC', 'Petrol', 'Moderate', 'No', 'Yes', 'No'),
(11, 64, '123799', 'Priyanka', NULL, 'Honda', '2Wheeler', 'Other', 'Activa', '2017', 'White', '2', '170cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(12, 67, '2614', 'Priyanka', '899', 'Honda', '2wheeler', 'Others', 'Activa', '2018', 'metalic', '2', '200cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(13, 67, '123799', 'Priyanka', '899', 'Honda', '2Wheeler', 'Other', 'Activa', '2017', 'White', '2', '170cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(14, 70, '1000', 'ms', NULL, 'honda', 'Two Wheeler', 'Others', 'activa', '2008', 'black', '2', '100 CC', 'Petrol', 'Moderate', 'No', 'No', 'No'),
(15, 70, '1002', 'msd', NULL, 'maruti', 'Four Wheeler', 'Others', 'maruti 800', '2000', 'white', '4', '100 CC', 'Petrol', 'Poor', 'Yes', 'Yes', 'Yes'),
(16, 70, '1004', 'mohit', NULL, 'honda', 'Two Wheeler', 'Others', 'activaaa', '2013', 'white', '2', '125 CC', 'Petrol', 'Excellent', 'Yes', 'No', 'No'),
(17, 70, '1000076', 'aman', NULL, 'bmw', 'Four Wheeler', 'Sedan', 'r8', '2014', 'blue', '4', '150 CC', 'Petrol', 'Excellent', 'Yes', 'Yes', 'Yes'),
(18, 70, '1234', 'msss', NULL, 'honda', 'Two Wheeler', 'Coupe', 'eterno', '2008', 'black', '2', '125 CC', 'Petrol', 'Excellent', 'No', 'No', 'No'),
(19, 67, '23231', 'AMAN', '899', 'HONDA', 'Two Wheeler', 'Others', 'ACTIVA', '2017', 'BLACK', '2', '110 CC', 'Diesel', 'Moderate', 'No', 'No', 'No'),
(20, 70, 'PB 30 T 1234', 'AMANPREET SINGH MAKKAR', NULL, 'HONDA', 'Two Wheeler', 'Others', 'ACTIVA', '2017', 'BLACK', '2', '125 CC', 'Petrol', 'Moderate', 'No', 'No', 'No'),
(21, 64, '1235', 'NK', NULL, 'Honda', '2Wheeler', 'Other', 'Activa', '2017', 'White', '2', '170cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(23, 99, '1239', 'prinka', NULL, 'Hero', 'tra', 'tra', '20144', '2018', 'black', '2', '150cc', '2', '2', 'N', 'N', 'N'),
(24, 107, 'PB 04 T 5816', 'AMANPREET SINGH MAKKAR', NULL, 'HONDA', 'Two Wheeler', 'Others', 'ACTIVA', '2019', 'BLACK', '2', '110 CC', 'Diesel', 'Moderate', 'No', 'Yes', 'No'),
(25, 107, 'fevfdml', 'cvvcvd', NULL, 'vddvdv', 'Two Wheeler', 'Sedan', 'dfs', '4545', 'vddvd', '4', '125 CC', 'Diesel', 'Poor', 'No', 'Yes', 'No'),
(26, 115, 'Hr 7T 1234', 'AMAN PREET SINGH', NULL, 'Honda', 'Two Wheeler', 'Others', 'ACTIVA', '2019', 'White', '2', '110 CC', 'Petrol', 'Poor', 'No', 'No', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_files`
--
ALTER TABLE `rider_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_users`
--
ALTER TABLE `rider_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider_vehicles`
--
ALTER TABLE `rider_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rider_files`
--
ALTER TABLE `rider_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=970;

--
-- AUTO_INCREMENT for table `rider_users`
--
ALTER TABLE `rider_users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `rider_vehicles`
--
ALTER TABLE `rider_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
