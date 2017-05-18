-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2017 at 10:08 
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hi_lombok`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `id_parent` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `descriptions` text,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(20) NOT NULL DEFAULT 'black',
  `is_active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `is_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `id_parent`, `name`, `title`, `descriptions`, `image`, `color`, `is_active`, `is_order`) VALUES
(1, 0, 'wisata-alam', 'Wisata Alam', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Fkategori%2Fsegara_anak_rinjani.jpg', 'black', 'Y', 1),
(2, 0, 'wisata-bangunnan', 'Wisata Bangunan', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Fkategori%2Fpura_batu_bolong.jpg', 'black', 'Y', 2),
(3, 0, 'wisata-budaya', 'Wisata Budaya', NULL, NULL, 'black', 'Y', 3),
(4, 0, 'wisata-buatan', 'Wisata Buatan', NULL, NULL, 'black', 'Y', 4),
(5, 0, 'wisata-kuliner', 'Wisata Kuliner', NULL, NULL, 'black', 'Y', 5),
(6, 0, 'wisata-olahraga', 'Wisata Olahraga', NULL, NULL, 'black', 'Y', 6),
(7, 1, 'beach', 'Beach', NULL, NULL, 'light-blue darken-1', 'Y', 0),
(8, 1, 'waterfall', 'Waterfall', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Fkategori%2Fair_terjun_tiu_kelep.jpg', 'light-green darken-2', 'Y', 0),
(9, 1, 'montain', 'Montain', NULL, NULL, 'light-green accent-4', 'Y', 0),
(10, 1, 'hill', 'Hill', NULL, NULL, 'green darken-3', 'Y', 0),
(11, 1, 'gilis', 'Gilis', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Fkategori%2Fgili_kedis.jpg', ' orange darken-4', 'Y', 0),
(12, 2, 'museum', 'Museum', NULL, NULL, 'pink darken-4', 'Y', 0),
(13, 2, 'monumen', 'Monumen', NULL, NULL, 'grey darken-2', 'Y', 0),
(14, 2, 'pura', 'Pura', NULL, NULL, 'brown darken-1', 'Y', 0),
(15, 4, 'taman', 'Taman', NULL, NULL, 'teal darken-1', 'Y', 0),
(16, 4, 'poll', 'Pool', NULL, NULL, 'cyan darken-1', 'Y', 0);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `descriptions` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'black',
  `is_active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `is_order` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `title`, `descriptions`, `image`, `color`, `is_active`, `is_order`) VALUES
(1, 'lombok-barat', 'Lombok Barat', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Flokasi%2Fmonumen_lombok_barat.jpg', ' pink darken-4', 'Y', 2),
(2, 'lombok-tengah', 'Lombok Tengah', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Flokasi%2Fmasjid_agung_lombok_tengah.jpg', 'purple darken-4', 'Y', 1),
(3, 'lombok-timur', 'Lombok Timur', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Flokasi%2Fmasjid_al_muhajirin_lombok_timur.jpg', 'red darken-1', 'Y', 3),
(4, 'lombok-utara', 'Lombok Utara', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Flokasi%2Fmasjid_kuno_lombok_utara.jpg', 'green darken-1', 'Y', 4),
(5, 'kota-mataram', 'Kota Mataram', NULL, 'http%3A%2F%2Flocalhost%2Fhi-lombok%2Fuploads%2Flokasi%2Fislamic_center_kota_mataram.jpg', 'light-blue darken-3', 'Y', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'User',
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `is_block` enum('Y','N') NOT NULL DEFAULT 'N',
  `is_online` enum('Y','N') NOT NULL DEFAULT 'N',
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `username`, `email`, `password`, `full_name`, `phone`, `photo`, `is_block`, `is_online`, `registered`, `last_login`) VALUES
(1, 'Administrator', 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', NULL, 'users/no-image.png', 'N', 'N', '2016-09-24 11:51:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wisata`
--

CREATE TABLE `wisata` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `category_group` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `short_desc` tinytext,
  `descriptions` text,
  `additional_info` text,
  `direction_info` text,
  `lat_long` varchar(40) DEFAULT NULL,
  `address` tinytext,
  `open_at` time DEFAULT '00:00:00',
  `close_at` time DEFAULT '24:00:00',
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `folder_gallery` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `is_highlight` enum('Y','N') NOT NULL DEFAULT 'N',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wisata`
--

INSERT INTO `wisata` (`id`, `author`, `location_id`, `category_id`, `category_group`, `name`, `title`, `short_desc`, `descriptions`, `additional_info`, `direction_info`, `lat_long`, `address`, `open_at`, `close_at`, `image`, `video`, `folder_gallery`, `status`, `is_highlight`, `created_on`, `modified_on`) VALUES
(1, 1, 3, 7, 1, 'pantai-pink', 'Pantai Pink', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.8610192, 116.58101340000007', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'pantai-pink', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(2, 1, 1, 11, 1, 'gili-kedis', 'Gili Kedis', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', NULL, 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'gili-kedis', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(3, 1, 2, 7, 1, 'pantai-selong-belanak', 'Pantai Selong Belanak', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.8716732, 116.16142620000005', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'pantai-selong-belanak', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(4, 1, 3, 11, 1, 'gili-kondo', 'Gili Kondo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.4450606, 116.73176940000008', 'To wah aneh, Lombok Timur', '00:00:00', '23:00:00', NULL, NULL, 'gili-kondo', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(5, 1, 4, 8, 1, 'air-terjun-tiu-kelep', 'Air Terjun Tiu Kelep', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.3126559, 116.40402610000001', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'air-terjun-tiu-kelep', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(6, 1, 5, 7, 1, 'pantai-senggigi', 'Pantai Senggigi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.4787343, 116.03760850000003', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'pantai-senggigi', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(7, 1, 2, 8, 1, 'air-terjun-benang-kelambu', 'Air Terjun Benang Kelambu', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.5336664, 116.34147029999997', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'air-terjun-benang-kelambu', 1, 'N', '2017-04-29 21:50:43', '2017-05-04 23:23:49'),
(8, 1, 1, 14, 2, 'pura-batu-bolong', 'Pura Batu Bolong', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque tortor metus, maximus nec mauris in, vulputate porttitor tortor. Curabitur feugiat mi vel pharetra consequat. Duis sed tincidunt sem, sit amet tincidunt nunc. Pellentesque sit amet turpis purus. Vivamus pellentesque fermentum purus blandit eleifend. Suspendisse potenti. Phasellus tempor dapibus purus. Donec eleifend erat faucibus interdum tincidunt. In pulvinar, justo et sagittis laoreet, nisl dui condimentum turpis, quis pretium dui risus commodo ex. Quisque id faucibus neque. Praesent vulputate sem metus, vel faucibus nibh auctor et. Maecenas at mi posuere, euismod libero at, varius lectus. Vivamus congue nulla at lacus consectetur ornare. Suspendisse non aliquet diam. Cras vitae posuere nisl. Ut mattis lectus consequat nibh porta dapibus. Cras placerat semper est non luctus. Donec facilisis accumsan felis sed interdum. Aliquam id aliquet felis, ac pellentesque lorem.', 'Additioanl information', 'Direction information', '-8.509342, 116.05702599999995', 'To wah aneh, Lombok Timur', '00:00:00', '24:00:00', NULL, NULL, 'pura-batu-bolong', 1, 'N', '2017-04-29 21:50:43', '2017-05-05 00:07:13');

-- --------------------------------------------------------

--
-- Table structure for table `wisata_tersimpan`
--

CREATE TABLE `wisata_tersimpan` (
  `id` int(11) NOT NULL,
  `wisata_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `is_favorite` enum('Y','N') NOT NULL,
  `is_visited` enum('Y','N') NOT NULL,
  `is_unvisited` enum('Y','N') NOT NULL,
  `is_will_visited` enum('Y','N') NOT NULL,
  `descriptions` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wisata`
--
ALTER TABLE `wisata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`) USING BTREE,
  ADD KEY `location_id` (`location_id`) USING BTREE,
  ADD KEY `user_id` (`author`);

--
-- Indexes for table `wisata_tersimpan`
--
ALTER TABLE `wisata_tersimpan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wisata_id` (`wisata_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wisata`
--
ALTER TABLE `wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `wisata_tersimpan`
--
ALTER TABLE `wisata_tersimpan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `wisata`
--
ALTER TABLE `wisata`
  ADD CONSTRAINT `FK_id_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_locations` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_users` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wisata_tersimpan`
--
ALTER TABLE `wisata_tersimpan`
  ADD CONSTRAINT `FK_id_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_wisata` FOREIGN KEY (`wisata_id`) REFERENCES `wisata` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
