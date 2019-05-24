-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2019 at 08:36 AM
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

DROP TABLE IF EXISTS `admin_users`;
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
(4, 'dipshi', 'sharma', 'dipshisharmaQa@gmail.com', '6dd289784f4da7cd755643ec6d58b6b1');

-- --------------------------------------------------------

--
-- Table structure for table `rider_files`
--

DROP TABLE IF EXISTS `rider_files`;
CREATE TABLE `rider_files` (
  `id` int(11) NOT NULL,
  `user_id` int(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `fs_name` varchar(255) NOT NULL,
  `is_deleted` int(10) DEFAULT NULL,
  `created_at` varchar(255) NOT NULL,
  `updated_at` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rider_files`
--

INSERT INTO `rider_files` (`id`, `user_id`, `file_name`, `fs_name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(899, 67, 'pp.png', '1558593382963-pp.png', 0, '2019-05-23 12:06:09', '2019-05-23 12:06:09'),
(900, 67, 'Rannpri.png', '1558593382969-Rannpri.png', 0, '2019-05-23 12:06:09', '2019-05-23 12:06:09'),
(901, 67, 'wall.png', '1558593382977-wall.png', 0, '2019-05-23 12:06:09', '2019-05-23 12:06:09'),
(902, 64, 'image_path_1555659066663_83170342-37c6-465f-8da7-8d1014bccc79.png', '1558594907521-image_path_1555659066663_83170342-37c6-465f-8da7-8d1014bccc79.png', 0, '2019-05-23 12:30:58', '2019-05-23 12:30:58'),
(903, 64, 'image_path_1555659066908_ab3b6a1b-2ad9-4385-9c02-6e7cce9faf59.png', '1558594907522-image_path_1555659066908_ab3b6a1b-2ad9-4385-9c02-6e7cce9faf59.png', 0, '2019-05-23 12:30:58', '2019-05-23 12:30:58'),
(904, 99, '21052019 TELKOM FLASH LOT 113 KZN 1.csv', '1558609684333-21052019 TELKOM FLASH LOT 113 KZN 1.csv', 0, '2019-05-23 16:07:46', '2019-05-23 16:07:46'),
(905, 70, 'cropped1891189834352275816.jpg', '1558616213458-cropped1891189834352275816.jpg', 0, '2019-05-23 16:07:46', '2019-05-23 16:07:46'),
(906, 70, 'cropped3409303624840238377.jpg', '1558616327837-cropped3409303624840238377.jpg', 0, '2019-05-23 16:07:46', '2019-05-23 16:07:46'),
(907, 70, 'cropped6937732933237361309.jpg', '1558616969263-cropped6937732933237361309.jpg', 0, '2019-05-23 18:39:06', '2019-05-23 18:39:06'),
(908, 70, 'cropped8848495615584153111.jpg', '1558617236146-cropped8848495615584153111.jpg', 0, '2019-05-23 18:39:06', '2019-05-23 18:39:06'),
(909, 70, 'cropped5549410944476783981.jpg', '1558617399969-cropped5549410944476783981.jpg', 0, '2019-05-23 18:39:06', '2019-05-23 18:39:06'),
(910, 64, 'new_image_1555659094859_2eebdce5-5d59-4f42-abe3-53d966eaaf13.png', '1558617557226-new_image_1555659094859_2eebdce5-5d59-4f42-abe3-53d966eaaf13.png', 0, '2019-05-23 18:39:06', '2019-05-23 18:39:06'),
(911, 64, 'new_image_1555659095508_9f4b7130-3d18-4a6b-b105-edb2ea5be69c.png', '1558617557227-new_image_1555659095508_9f4b7130-3d18-4a6b-b105-edb2ea5be69c.png', 0, '2019-05-23 18:39:06', '2019-05-23 18:39:06'),
(912, 70, 'cropped6390969787506722294.jpg', '1558618200057-cropped6390969787506722294.jpg', 0, '2019-05-23 18:53:26', '2019-05-23 18:53:26');

-- --------------------------------------------------------

--
-- Table structure for table `rider_users`
--

DROP TABLE IF EXISTS `rider_users`;
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
(64, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 902, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(66, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(67, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$WH1HR2foB/0k75kgDSxN1uGEKioP99DBct4o0QHsj9Y/INM4l8Q2.', 'xIItqRpkyNFJgKxubkapyS5ps1yAjQgs', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 900, '2019-05-15 10:52:49', '2019-05-16 17:33:22'),
(68, 'Priyanka', 'priyankagiri1426@gmail.com', '$2b$04$tuwLy8NdfuL98iSdKEiT/.Wqlo7ud4ewDZ32Rl3XThO81itT.LUpa', 'DJrUzHbdvk02o05SAMImtJEbyi2VwxCv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 13:42:23', '2019-05-15 13:42:23'),
(69, 'ms', 'mohit95.sikri@gmail.com', '$2b$04$g6lmWyqi1vsRmRr3A9ujSuTH5PGaUfZoXHO/Vogl0OxLDFceMO5fO', '8OeYvndccb9Xekn7a5zXjEi6r22Qnc8Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 15:54:44', '2019-05-15 15:54:44'),
(70, 'Mohit Sikri', 'abc@123.com', '$2b$04$/tBndqGuwtlxVarANhxDg.vqJFARiqL2JsEJ6d9uFfjfqoGWEBc2O', '5uYrJTTcADjvzwZ3ZaipOAG9M0sV67QS', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-23 13:58:56'),
(71, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(72, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(73, 'Mohit Sikri', 'abc@123.com', '$2b$04$/tBndqGuwtlxVarANhxDg.vqJFARiqL2JsEJ6d9uFfjfqoGWEBc2O', '5uYrJTTcADjvzwZ3ZaipOAG9M0sV67QS', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-23 13:58:56'),
(74, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(75, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(76, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$WH1HR2foB/0k75kgDSxN1uGEKioP99DBct4o0QHsj9Y/INM4l8Q2.', 'xIItqRpkyNFJgKxubkapyS5ps1yAjQgs', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 0, '2019-05-15 10:52:49', '2019-05-16 17:33:22'),
(77, 'Mohit Sikri', 'abc@123.com', '$2b$04$/tBndqGuwtlxVarANhxDg.vqJFARiqL2JsEJ6d9uFfjfqoGWEBc2O', '5uYrJTTcADjvzwZ3ZaipOAG9M0sV67QS', '24', '20/01/1995', 'Google Building 40, 1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '123456789', '123456789', 'M', 'A+', 'Single', 'No', 'No', 'No', 0, '2019-05-15 18:03:47', '2019-05-23 13:58:56'),
(78, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(79, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(80, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(81, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(82, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(83, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(84, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(85, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(86, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(87, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(88, 'Pankaj Batyal', 'pankaj.batyal@gmail.com', '$2b$04$QoVRCqMOqxk889f0r4kDDey2nqj1PRgxTnsumAxHggGXVvzHAzOK6', 'YhM1y3gC2T6vjVZxBBDXqPrHeboZwY1b', '25', '12/12/1991', 'chd', '123abc', '123145', 'M', 'A+', 'S', 'N', 'N', 'N', 0, '2019-05-14 15:38:06', '2019-05-14 15:50:16'),
(89, 'Priyanka', 'priyankagiri1426@gmail.com', '$2b$04$tuwLy8NdfuL98iSdKEiT/.Wqlo7ud4ewDZ32Rl3XThO81itT.LUpa', 'DJrUzHbdvk02o05SAMImtJEbyi2VwxCv', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-15 13:42:23', '2019-05-15 13:42:23'),
(90, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(91, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(92, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(93, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(94, 'Pankaj Kumar', 'pnkj.btyl@gmail.com', '$2b$04$qofrVFk4STSnLGE/21qAMe3iyoHSwJt.zTkKz6UOKXYN0VaM6prKi', 'RY5YSsRfsfcmELv70cj7vAgZqjtkNIlQ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '2019-05-13 18:54:03', '2019-05-13 18:54:03'),
(98, 'kaur g', 'priyankagiri023@gmail.com', '$2b$04$WH1HR2foB/0k75kgDSxN1uGEKioP99DBct4o0QHsj9Y/INM4l8Q2.', 'xIItqRpkyNFJgKxubkapyS5ps1yAjQgs', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', 0, '2019-05-15 10:52:49', '2019-05-16 17:33:22'),
(99, 'kau', 'dipshi110@gmail.com', '$2b$04$LM/QsXRIdwZpGdMKcP6NfuHXuiUNeosumrBw1utFHq4Se/Htj1oVO', 'JH9npuCJi1yPZgi07myh8EjRExHCpGS1', '25', '26/10/1991', 'ynr126', '2614mtech', '55555', 'f', 'AB+', 'Single', 'N', 'N', 'N', NULL, '2019-05-23 13:19:14', '2019-05-23 16:14:20');

-- --------------------------------------------------------

--
-- Table structure for table `rider_vehicles`
--

DROP TABLE IF EXISTS `rider_vehicles`;
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
(12, 67, '2614', 'Priyanka', NULL, 'Honda', '2wheeler', 'Others', 'Activa', '2018', 'metalic', '2', '200cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(13, 67, '123799', 'Priyanka', NULL, 'Honda', '2Wheeler', 'Other', 'Activa', '2017', 'White', '2', '170cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(14, 70, '1000', 'ms', NULL, 'honda', 'Two Wheeler', 'Others', 'activa', '2008', 'black', '2', '100 CC', 'Petrol', 'Moderate', 'No', 'No', 'No'),
(15, 70, '1002', 'msd', NULL, 'maruti', 'Four Wheeler', 'Others', 'maruti 800', '2000', 'white', '4', '100 CC', 'Petrol', 'Poor', 'Yes', 'Yes', 'Yes'),
(16, 70, '1004', 'mohit', NULL, 'honda', 'Two Wheeler', 'Others', 'activaaa', '2013', 'white', '2', '125 CC', 'Petrol', 'Excellent', 'Yes', 'No', 'No'),
(17, 70, '1000076', 'aman', NULL, 'bmw', 'Four Wheeler', 'Sedan', 'r8', '2014', 'blue', '4', '150 CC', 'Petrol', 'Excellent', 'Yes', 'Yes', 'Yes'),
(18, 70, '1234', 'msss', NULL, 'honda', 'Two Wheeler', 'Coupe', 'eterno', '2008', 'black', '2', '125 CC', 'Petrol', 'Excellent', 'No', 'No', 'No'),
(19, 67, '23231', 'AMAN', NULL, 'HONDA', 'Two Wheeler', 'Others', 'ACTIVA', '2017', 'BLACK', '2', '110 CC', 'Diesel', 'Moderate', 'No', 'No', 'No'),
(20, 70, 'PB 30 T 1234', 'AMANPREET SINGH MAKKAR', NULL, 'HONDA', 'Two Wheeler', 'Others', 'ACTIVA', '2017', 'BLACK', '2', '125 CC', 'Petrol', 'Moderate', 'No', 'No', 'No'),
(21, 64, '1235', 'NK', NULL, 'Honda', '2Wheeler', 'Other', 'Activa', '2017', 'White', '2', '170cc', 'Petrol', 'Moderate', 'N', 'N', 'N'),
(23, 99, '1239', 'Prinka', NULL, 'Hero', '2Wheeler', 'Other', 'Activa', '2016', 'black', '2', '150cc', 'Petrol', 'Moderate', 'N', 'N', 'N');

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
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rider_files`
--
ALTER TABLE `rider_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=913;

--
-- AUTO_INCREMENT for table `rider_users`
--
ALTER TABLE `rider_users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `rider_vehicles`
--
ALTER TABLE `rider_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
