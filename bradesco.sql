-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 20, 2015 at 01:31 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bradesco`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accessory`
--

CREATE TABLE IF NOT EXISTS `accessory` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `accessory_type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessory`
--

INSERT INTO `accessory` (`id`, `name`, `bundle_url`, `bundle_version`, `model_name`, `icon_name`, `description`, `price`, `unlock_level`, `accessory_type`) VALUES
(1, 'Balão', 'accessory-YM0nM8', 0, 'Balao_g', 'Balaoi', '', 0, -1, 'hand_accessory'),
(10, 'Asa de monstro', 'accessory-QKwznS', 0, 'Asa_03g', 'Asa_03i', '', 0, -1, 'body_accessory'),
(13, 'Mochila JetPack', 'accessory-d5BKbm', 0, 'Mochila_03g', 'Mochila_03i', '', 0, -1, 'body_accessory'),
(16, 'Bola de Futebol', 'accessory-qzhGAT', 0, 'Bola_Futebol_g', 'Bola_Futeboli', '', 0, -1, 'hand_accessory'),
(17, 'Espada', 'accessory-8YWCnr', 0, 'Espada_g', 'Espadai', '', 500, -1, 'hand_accessory'),
(18, 'Guarda-chuva de bolinhas', 'accessory-FHQeMG', 0, 'Guarda_Chuvas_Bolinhas_g', 'Guarda_Chuva_Bolinhasi', '', 0, -1, 'hand_accessory'),
(19, 'Guarda-chuva de panda', 'accessory-ahX9YQ', 0, 'Guarda_Chuvas_Gato_g', 'Guarda_Chuva_Gatoi', '', 0, -1, 'hand_accessory'),
(20, 'Picolé', 'accessory-5cQhRS', 0, 'Picole_g', 'Picolei', '', 600, -1, 'hand_accessory'),
(21, 'Pirulito', 'accessory-WyJnDp', 0, 'Pirulito_g', 'Pirulitoi', '', 0, -1, 'hand_accessory'),
(22, 'Asa de Fada', 'accessory-1cT515', 0, 'Asa_01_g', 'Asa_01i', '', 0, -1, 'body_accessory'),
(23, 'Asa de Borboleta', 'accessory-xrZhL7', 0, 'Asa_02_g', 'Asa_02i', '', 0, -1, 'body_accessory'),
(24, 'Mochila Azul', 'accessory-UJGJe7', 0, 'Mochila_01g', 'Mochila_01i', '', 0, -1, 'body_accessory'),
(25, 'Mochila Pinguim', 'accessory-f1Qltp', 0, 'Mochila_02g', 'Mochila_02i', '', 0, -1, 'body_accessory'),
(26, 'Mochila Rosa', 'accessory-L1QK7N', 0, 'Mochila_04g', 'Mochila_04i', '', 0, -1, 'body_accessory'),
(27, 'Mochila Joaninha', 'accessory-WGD2AY', 0, 'Mochila_05g', 'Mochila_05i', '', 0, -1, 'body_accessory'),
(28, 'Bolsa Amarela', 'accessory-FGwQpw', 0, 'Bolsa_01_g', 'Bolsa_01i', '', 0, -1, 'hand_accessory'),
(29, 'Bolsa Rosa', 'accessory-4PUX3D', 0, 'Bolsa_02g', 'Bolsa_02i', '', 0, -1, 'hand_accessory'),
(30, 'Laço de Bailarina', 'accessory-LexZvd', 0, 'Bailarina_Laco_g', 'bailarina laco', '', 20, 0, 'hand_accessory'),
(31, 'Luvas de Boxe', 'accessory-PUSmHu', 0, 'luvas boxe', 'Luvas de Boxe', '', 20, 0, 'hand_accessory');

-- --------------------------------------------------------

--
-- Table structure for table `accessory_type`
--

CREATE TABLE IF NOT EXISTS `accessory_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accessory_type`
--

INSERT INTO `accessory_type` (`type`) VALUES
('body_accessory'),
('hand_accessory');

-- --------------------------------------------------------

--
-- Table structure for table `analytic_data`
--

CREATE TABLE IF NOT EXISTS `analytic_data` (
`id` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `player_id` int(11) DEFAULT NULL COMMENT 'for events that happen inside the game',
  `user_id` varchar(255) DEFAULT NULL COMMENT 'for website events',
  `data` varchar(255) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analytic_data`
--

INSERT INTO `analytic_data` (`id`, `type`, `player_id`, `user_id`, `data`, `date`) VALUES
(1, 'login', 1, NULL, '-1', '2015-03-30 19:57:05'),
(2, 'logout', 1, NULL, '-1', '2015-03-30 19:59:49'),
(3, 'login', 1, NULL, '-1', '2015-03-30 20:00:03'),
(4, 'logout', 1, NULL, '-1', '2015-03-30 20:00:08'),
(5, 'login', 1, NULL, '-1', '2015-03-30 20:03:49'),
(6, 'logout', 1, NULL, '-1', '2015-03-30 20:04:09'),
(7, 'login', 1, NULL, '-1', '2015-03-30 20:04:20'),
(8, 'logout', 1, NULL, '-1', '2015-03-30 20:06:44'),
(9, 'login', 2, NULL, '-1', '2015-03-31 10:08:46'),
(10, 'logout', 2, NULL, '-1', '2015-03-31 10:13:05'),
(11, 'login', 2, NULL, '-1', '2015-03-31 11:59:20'),
(12, 'logout', 2, NULL, '-1', '2015-03-31 12:01:11'),
(13, 'login', 2, NULL, '-1', '2015-03-31 12:04:54'),
(14, 'logout', 2, NULL, '-1', '2015-03-31 12:06:41'),
(15, 'login', 2, NULL, '-1', '2015-03-31 12:09:14'),
(16, 'logout', 2, NULL, '-1', '2015-03-31 12:09:57'),
(17, 'login', 2, NULL, '-1', '2015-03-31 12:13:57'),
(18, 'logout', 2, NULL, '-1', '2015-03-31 12:14:45'),
(19, 'login', 2, NULL, '-1', '2015-03-31 12:15:27'),
(20, 'logout', 2, NULL, '-1', '2015-03-31 12:18:29'),
(21, 'login', 3, NULL, '-1', '2015-03-31 16:03:30'),
(22, 'login', 2, NULL, '-1', '2015-03-31 16:03:44'),
(23, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 16:04:33'),
(24, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 16:07:27'),
(25, 'logout', 2, NULL, '-1', '2015-03-31 16:08:33'),
(26, 'logout', 3, NULL, '-1', '2015-03-31 16:08:38'),
(27, 'login', 3, NULL, '-1', '2015-03-31 16:09:01'),
(28, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 16:09:44'),
(29, 'login', 2, NULL, '-1', '2015-03-31 16:11:56'),
(30, 'logout', 2, NULL, '-1', '2015-03-31 16:12:05'),
(31, 'login', 2, NULL, '-1', '2015-03-31 16:15:01'),
(32, 'logout', 2, NULL, '-1', '2015-03-31 16:15:03'),
(33, 'login', 2, NULL, '-1', '2015-03-31 16:24:24'),
(34, 'logout', 2, NULL, '-1', '2015-03-31 16:24:33'),
(35, 'login', 2, NULL, '-1', '2015-03-31 16:43:20'),
(36, 'logout', 2, NULL, '-1', '2015-03-31 16:44:29'),
(37, 'login', 2, NULL, '-1', '2015-03-31 16:47:23'),
(38, 'logout', 2, NULL, '-1', '2015-03-31 16:48:40'),
(39, 'logout', 3, NULL, '-1', '2015-03-31 16:49:34'),
(40, 'login', 2, NULL, '-1', '2015-03-31 16:50:00'),
(41, 'logout', 2, NULL, '-1', '2015-03-31 16:50:07'),
(42, 'login', 2, NULL, '-1', '2015-03-31 16:50:48'),
(43, 'logout', 2, NULL, '-1', '2015-03-31 16:50:52'),
(44, 'login', 2, NULL, '-1', '2015-03-31 16:56:15'),
(45, 'logout', 2, NULL, '-1', '2015-03-31 16:57:48'),
(46, 'login', 2, NULL, '-1', '2015-03-31 16:58:09'),
(47, 'logout', 2, NULL, '-1', '2015-03-31 16:58:18'),
(48, 'login', 2, NULL, '-1', '2015-03-31 17:07:28'),
(49, 'logout', 2, NULL, '-1', '2015-03-31 17:07:32'),
(50, 'login', 2, NULL, '-1', '2015-03-31 17:10:18'),
(51, 'logout', 2, NULL, '-1', '2015-03-31 17:11:05'),
(52, 'login', 2, NULL, '-1', '2015-03-31 17:11:25'),
(53, 'logout', 2, NULL, '-1', '2015-03-31 17:11:29'),
(54, 'login', 2, NULL, '-1', '2015-03-31 17:12:40'),
(55, 'logout', 2, NULL, '-1', '2015-03-31 17:12:44'),
(56, 'login', 2, NULL, '-1', '2015-03-31 17:13:38'),
(57, 'login', 3, NULL, '-1', '2015-03-31 17:15:51'),
(58, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 17:16:22'),
(59, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 17:16:28'),
(60, 'logout', 2, NULL, '-1', '2015-03-31 17:17:23'),
(61, 'logout', 3, NULL, '-1', '2015-03-31 17:38:31'),
(62, 'login', 2, NULL, '-1', '2015-03-31 17:38:57'),
(63, 'login', 3, NULL, '-1', '2015-03-31 17:39:02'),
(64, 'logout', 2, NULL, '-1', '2015-03-31 17:39:09'),
(65, 'login', 2, NULL, '-1', '2015-03-31 17:39:42'),
(66, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 17:40:21'),
(67, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 17:40:31'),
(68, 'logout', 2, NULL, '-1', '2015-03-31 17:41:41'),
(69, 'logout', 3, NULL, '-1', '2015-03-31 17:41:44'),
(70, 'login', 2, NULL, '-1', '2015-03-31 17:46:00'),
(71, 'login', 3, NULL, '-1', '2015-03-31 17:46:35'),
(72, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 17:47:16'),
(73, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 17:47:19'),
(74, 'logout', 2, NULL, '-1', '2015-03-31 17:49:09'),
(75, 'logout', 3, NULL, '-1', '2015-03-31 17:49:45'),
(76, 'login', 2, NULL, '-1', '2015-03-31 17:58:12'),
(77, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 17:59:37'),
(78, 'publicAreaLeave', 2, NULL, '1', '2015-03-31 18:01:45'),
(79, 'logout', 2, NULL, '-1', '2015-03-31 18:02:17'),
(80, 'login', 2, NULL, '-1', '2015-03-31 18:02:29'),
(81, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 18:03:30'),
(82, 'publicAreaLeave', 2, NULL, '1', '2015-03-31 18:03:32'),
(83, 'logout', 2, NULL, '-1', '2015-03-31 18:03:41'),
(84, 'login', 2, NULL, '-1', '2015-03-31 18:03:56'),
(85, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 18:04:40'),
(86, 'publicAreaLeave', 2, NULL, '1', '2015-03-31 18:04:42'),
(87, 'logout', 2, NULL, '-1', '2015-03-31 18:05:14'),
(88, 'login', 3, NULL, '-1', '2015-03-31 18:05:23'),
(89, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 18:06:10'),
(90, 'publicAreaLeave', 3, NULL, '1', '2015-03-31 18:06:13'),
(91, 'logout', 3, NULL, '-1', '2015-03-31 18:06:50'),
(92, 'login', 3, NULL, '-1', '2015-03-31 18:08:01'),
(93, 'publicAreaEnter', 3, NULL, '1', '2015-03-31 18:08:42'),
(94, 'publicAreaLeave', 3, NULL, '1', '2015-03-31 18:08:43'),
(95, 'logout', 3, NULL, '-1', '2015-03-31 18:08:50'),
(96, 'login', 2, NULL, '-1', '2015-03-31 18:36:57'),
(97, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 18:37:35'),
(98, 'logout', 2, NULL, '-1', '2015-03-31 18:44:28'),
(99, 'login', 2, NULL, '-1', '2015-03-31 18:48:03'),
(100, 'logout', 2, NULL, '-1', '2015-03-31 18:48:12'),
(101, 'login', 2, NULL, '-1', '2015-03-31 18:50:20'),
(102, 'publicAreaEnter', 2, NULL, '1', '2015-03-31 18:51:12'),
(103, 'logout', 2, NULL, '-1', '2015-03-31 18:52:46'),
(104, 'login', 2, NULL, '-1', '2015-04-02 12:01:00'),
(105, 'logout', 2, NULL, '-1', '2015-04-02 12:13:02'),
(106, 'login', 2, NULL, '-1', '2015-04-02 14:02:59'),
(107, 'logout', 2, NULL, '-1', '2015-04-02 14:06:01'),
(108, 'login', 2, NULL, '-1', '2015-04-02 14:06:17'),
(109, 'logout', 2, NULL, '-1', '2015-04-02 14:08:13'),
(110, 'login', 2, NULL, '-1', '2015-04-02 14:13:18'),
(111, 'logout', 2, NULL, '-1', '2015-04-02 14:16:54'),
(112, 'login', 2, NULL, '-1', '2015-04-02 15:08:34'),
(113, 'logout', 2, NULL, '-1', '2015-04-02 15:10:24'),
(114, 'login', 2, NULL, '-1', '2015-04-02 15:25:37'),
(115, 'logout', 2, NULL, '-1', '2015-04-02 15:27:56'),
(116, 'login', 2, NULL, '-1', '2015-04-02 15:44:16'),
(117, 'logout', 2, NULL, '-1', '2015-04-02 15:45:15'),
(118, 'login', 2, NULL, '-1', '2015-04-02 15:46:07'),
(119, 'logout', 2, NULL, '-1', '2015-04-02 15:49:19'),
(120, 'login', 2, NULL, '-1', '2015-04-02 15:51:40'),
(121, 'logout', 2, NULL, '-1', '2015-04-02 15:53:27'),
(122, 'login', 2, NULL, '-1', '2015-04-02 16:07:11'),
(123, 'logout', 2, NULL, '-1', '2015-04-02 16:12:19'),
(124, 'login', 2, NULL, '-1', '2015-04-02 16:26:10'),
(125, 'logout', 2, NULL, '-1', '2015-04-02 16:28:38'),
(126, 'login', 2, NULL, '-1', '2015-04-02 16:38:21'),
(127, 'logout', 2, NULL, '-1', '2015-04-02 16:41:47'),
(128, 'login', 2, NULL, '-1', '2015-04-02 16:58:57'),
(129, 'logout', 2, NULL, '-1', '2015-04-02 17:00:39'),
(130, 'login', 2, NULL, '-1', '2015-04-02 17:10:31'),
(131, 'publicAreaEnter', 2, NULL, '1', '2015-04-02 17:13:26'),
(132, 'logout', 2, NULL, '-1', '2015-04-02 17:33:16'),
(133, 'login', 2, NULL, '-1', '2015-04-02 17:33:31'),
(134, 'logout', 2, NULL, '-1', '2015-04-02 17:34:02'),
(135, 'login', 2, NULL, '-1', '2015-04-02 17:35:16'),
(136, 'logout', 2, NULL, '-1', '2015-04-02 17:35:46'),
(137, 'login', 2, NULL, '-1', '2015-04-02 17:46:50'),
(138, 'logout', 2, NULL, '-1', '2015-04-02 17:51:59'),
(139, 'login', 2, NULL, '-1', '2015-04-02 17:53:25'),
(140, 'logout', 2, NULL, '-1', '2015-04-02 17:58:29'),
(141, 'login', 2, NULL, '-1', '2015-04-02 18:14:02'),
(142, 'logout', 2, NULL, '-1', '2015-04-02 18:19:09'),
(143, 'login', 2, NULL, '-1', '2015-04-02 19:52:03'),
(144, 'logout', 2, NULL, '-1', '2015-04-02 19:55:48'),
(145, 'login', 2, NULL, '-1', '2015-04-06 17:00:41'),
(146, 'logout', 2, NULL, '-1', '2015-04-06 17:02:11'),
(147, 'login', 2, NULL, '-1', '2015-04-06 17:18:10'),
(148, 'logout', 2, NULL, '-1', '2015-04-06 17:23:18'),
(149, 'login', 4, NULL, '-1', '2015-04-06 17:25:11'),
(150, 'logout', 4, NULL, '-1', '2015-04-06 17:32:24'),
(151, 'login', 4, NULL, '-1', '2015-04-06 17:33:04'),
(152, 'logout', 4, NULL, '-1', '2015-04-06 17:34:43'),
(153, 'login', 4, NULL, '-1', '2015-04-06 17:35:15'),
(154, 'logout', 4, NULL, '-1', '2015-04-06 17:36:19'),
(155, 'login', 4, NULL, '-1', '2015-04-06 17:40:04'),
(156, 'logout', 4, NULL, '-1', '2015-04-06 17:41:17'),
(157, 'login', 4, NULL, '-1', '2015-04-06 17:47:35'),
(158, 'logout', 4, NULL, '-1', '2015-04-06 18:00:28'),
(159, 'login', 4, NULL, '-1', '2015-04-06 18:01:22'),
(160, 'logout', 4, NULL, '-1', '2015-04-06 18:04:13'),
(161, 'login', 4, NULL, '-1', '2015-04-06 18:13:44'),
(162, 'logout', 4, NULL, '-1', '2015-04-06 18:17:06'),
(163, 'login', 4, NULL, '-1', '2015-04-06 18:19:27'),
(164, 'logout', 4, NULL, '-1', '2015-04-06 18:20:46'),
(165, 'login', 5, NULL, '-1', '2015-04-06 18:26:06'),
(166, 'logout', 5, NULL, '-1', '2015-04-06 18:32:48'),
(167, 'login', 5, NULL, '-1', '2015-04-06 18:44:57'),
(168, 'logout', 5, NULL, '-1', '2015-04-06 18:51:51'),
(169, 'login', 2, NULL, '-1', '2015-04-06 18:53:32'),
(170, 'logout', 2, NULL, '-1', '2015-04-06 19:00:11'),
(171, 'login', 2, NULL, '-1', '2015-04-06 19:01:05'),
(172, 'logout', 2, NULL, '-1', '2015-04-06 19:02:24'),
(173, 'login', 2, NULL, '-1', '2015-04-06 19:02:56'),
(174, 'logout', 2, NULL, '-1', '2015-04-06 19:05:59'),
(175, 'login', 2, NULL, '-1', '2015-04-06 19:22:52'),
(176, 'logout', 2, NULL, '-1', '2015-04-06 19:22:53'),
(177, 'login', 2, NULL, '-1', '2015-04-06 19:23:21'),
(178, 'logout', 2, NULL, '-1', '2015-04-06 19:23:21'),
(179, 'login', 5, NULL, '-1', '2015-04-06 19:25:13'),
(180, 'logout', 5, NULL, '-1', '2015-04-06 19:25:48'),
(181, 'login', 2, NULL, '-1', '2015-04-06 19:25:59'),
(182, 'logout', 2, NULL, '-1', '2015-04-06 19:26:00'),
(183, 'login', 4, NULL, '-1', '2015-04-06 19:27:51'),
(184, 'gameEnter', 4, NULL, '6', '2015-04-06 19:38:08'),
(185, 'gameStart', 4, NULL, '6', '2015-04-06 19:38:18'),
(186, 'gameEnd', 4, NULL, '6', '2015-04-06 19:43:27'),
(187, 'gameStart', 4, NULL, '6', '2015-04-06 19:43:55'),
(188, 'logout', 4, NULL, '-1', '2015-04-06 19:45:55'),
(189, 'login', 4, NULL, '-1', '2015-04-06 19:50:19'),
(190, 'gameStart', 4, NULL, '6', '2015-04-06 19:50:25'),
(191, 'logout', 4, NULL, '-1', '2015-04-06 19:51:59'),
(192, 'login', 4, NULL, '-1', '2015-04-06 19:59:02'),
(193, 'gameEnter', 4, NULL, '5', '2015-04-06 20:00:16'),
(194, 'gameStart', 4, NULL, '5', '2015-04-06 20:00:24'),
(195, 'logout', 4, NULL, '-1', '2015-04-06 20:03:28'),
(196, 'login', 4, NULL, '-1', '2015-04-06 20:04:47'),
(197, 'gameStart', 4, NULL, '6', '2015-04-06 20:04:52'),
(198, 'gameEnd', 4, NULL, '6', '2015-04-06 20:06:29'),
(199, 'gameStart', 4, NULL, '6', '2015-04-06 20:06:32'),
(200, 'logout', 4, NULL, '-1', '2015-04-06 20:11:38'),
(201, 'login', 4, NULL, '-1', '2015-04-06 20:14:45'),
(202, 'logout', 4, NULL, '-1', '2015-04-06 20:15:57'),
(203, 'login', 2, NULL, '-1', '2015-04-07 10:40:50'),
(204, 'logout', 2, NULL, '-1', '2015-04-07 10:41:37'),
(205, 'login', 2, NULL, '-1', '2015-04-07 10:53:36'),
(206, 'logout', 2, NULL, '-1', '2015-04-07 10:53:41'),
(207, 'login', 2, NULL, '-1', '2015-04-07 10:55:23'),
(208, 'logout', 2, NULL, '-1', '2015-04-07 10:55:35'),
(209, 'login', 2, NULL, '-1', '2015-04-07 11:25:04'),
(210, 'logout', 2, NULL, '-1', '2015-04-07 11:25:06'),
(211, 'login', 4, NULL, '-1', '2015-04-07 11:26:48'),
(212, 'logout', 4, NULL, '-1', '2015-04-07 11:31:01'),
(213, 'login', 5, NULL, '-1', '2015-04-07 11:37:34'),
(214, 'logout', 5, NULL, '-1', '2015-04-07 11:41:09'),
(215, 'login', 5, NULL, '-1', '2015-04-07 11:44:57'),
(216, 'logout', 5, NULL, '-1', '2015-04-07 11:53:31'),
(217, 'login', 5, NULL, '-1', '2015-04-07 14:31:06'),
(218, 'logout', 5, NULL, '-1', '2015-04-07 14:35:27'),
(219, 'login', 4, NULL, '-1', '2015-04-07 14:35:59'),
(220, 'logout', 4, NULL, '-1', '2015-04-07 14:40:53'),
(221, 'login', 4, NULL, '-1', '2015-04-07 14:41:49'),
(222, 'publicAreaEnter', 4, NULL, '1', '2015-04-07 14:42:34'),
(223, 'logout', 4, NULL, '-1', '2015-04-07 14:43:11'),
(224, 'login', 4, NULL, '-1', '2015-04-07 14:45:37'),
(225, 'logout', 4, NULL, '-1', '2015-04-07 14:51:48'),
(226, 'login', 4, NULL, '-1', '2015-04-07 15:19:13'),
(227, 'logout', 4, NULL, '-1', '2015-04-07 15:24:18'),
(228, 'login', 1, NULL, '-1', '2015-04-07 16:33:25'),
(229, 'logout', 1, NULL, '-1', '2015-04-07 16:40:48'),
(230, 'login', 4, NULL, '-1', '2015-04-07 16:44:59'),
(231, 'logout', 4, NULL, '-1', '2015-04-07 16:50:08'),
(232, 'login', 4, NULL, '-1', '2015-04-07 16:53:17'),
(233, 'logout', 4, NULL, '-1', '2015-04-07 17:03:22'),
(234, 'login', 4, NULL, '-1', '2015-04-07 17:21:05'),
(235, 'logout', 4, NULL, '-1', '2015-04-07 17:23:48'),
(236, 'login', 4, NULL, '-1', '2015-04-07 17:27:07'),
(237, 'logout', 4, NULL, '-1', '2015-04-07 17:28:05'),
(238, 'login', 4, NULL, '-1', '2015-04-07 17:29:07'),
(239, 'logout', 4, NULL, '-1', '2015-04-07 17:31:14'),
(240, 'login', 4, NULL, '-1', '2015-04-07 17:32:50'),
(241, 'login', 1, NULL, '-1', '2015-04-07 17:33:45'),
(242, 'logout', 4, NULL, '-1', '2015-04-07 17:37:58'),
(243, 'logout', 1, NULL, '-1', '2015-04-07 17:38:48'),
(244, 'login', 4, NULL, '-1', '2015-04-07 17:39:47'),
(245, 'logout', 4, NULL, '-1', '2015-04-07 17:41:12'),
(246, 'login', 4, NULL, '-1', '2015-04-07 17:41:43'),
(247, 'logout', 4, NULL, '-1', '2015-04-07 17:43:59'),
(248, 'login', 4, NULL, '-1', '2015-04-07 17:55:21'),
(249, 'logout', 4, NULL, '-1', '2015-04-07 17:58:46'),
(250, 'login', 4, NULL, '-1', '2015-04-07 18:17:55'),
(251, 'logout', 4, NULL, '-1', '2015-04-07 18:19:29'),
(252, 'login', 4, NULL, '-1', '2015-04-07 18:20:26'),
(253, 'logout', 4, NULL, '-1', '2015-04-07 18:25:28'),
(254, 'login', 4, NULL, '-1', '2015-04-07 18:27:09'),
(255, 'logout', 4, NULL, '-1', '2015-04-07 18:32:53'),
(256, 'login', 4, NULL, '-1', '2015-04-07 18:33:14'),
(257, 'logout', 4, NULL, '-1', '2015-04-07 18:39:48'),
(258, 'login', 4, NULL, '-1', '2015-04-07 18:42:33'),
(259, 'logout', 4, NULL, '-1', '2015-04-07 18:45:53'),
(260, 'login', 4, NULL, '-1', '2015-04-07 18:46:33'),
(261, 'logout', 4, NULL, '-1', '2015-04-07 18:49:14'),
(262, 'login', 4, NULL, '-1', '2015-04-07 18:52:33'),
(263, 'logout', 4, NULL, '-1', '2015-04-07 18:55:30'),
(264, 'login', 4, NULL, '-1', '2015-04-07 19:04:10'),
(265, 'logout', 4, NULL, '-1', '2015-04-07 19:05:17'),
(266, 'login', 4, NULL, '-1', '2015-04-07 19:09:30'),
(267, 'logout', 4, NULL, '-1', '2015-04-07 19:10:52'),
(268, 'login', 4, NULL, '-1', '2015-04-07 19:11:46'),
(269, 'logout', 4, NULL, '-1', '2015-04-07 19:15:08'),
(270, 'login', 4, NULL, '-1', '2015-04-07 19:15:10'),
(271, 'publicAreaEnter', 4, NULL, '1', '2015-04-07 19:16:42'),
(272, 'login', 1, NULL, '-1', '2015-04-07 19:17:31'),
(273, 'logout', 4, NULL, '-1', '2015-04-07 19:17:34'),
(274, 'login', 4, NULL, '-1', '2015-04-07 19:17:49'),
(275, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:18:49'),
(276, 'logout', 4, NULL, '-1', '2015-04-07 19:22:58'),
(277, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:42:59'),
(278, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:02'),
(279, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:05'),
(280, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:15'),
(281, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:18'),
(282, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:19'),
(283, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:20'),
(284, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:21'),
(285, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:21'),
(286, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:22'),
(287, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:22'),
(288, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:24'),
(289, 'publicAreaLeave', 1, NULL, '1', '2015-04-07 19:43:24'),
(290, 'publicAreaEnter', 1, NULL, '1', '2015-04-07 19:43:25'),
(291, 'logout', 1, NULL, '-1', '2015-04-07 20:12:11'),
(292, 'login', 4, NULL, '-1', '2015-04-08 13:53:24'),
(293, 'logout', 4, NULL, '-1', '2015-04-08 13:58:33'),
(294, 'login', 4, NULL, '-1', '2015-04-08 14:03:08'),
(295, 'logout', 4, NULL, '-1', '2015-04-08 14:07:01'),
(296, 'login', 4, NULL, '-1', '2015-04-08 14:13:31'),
(297, 'logout', 4, NULL, '-1', '2015-04-08 14:18:33'),
(298, 'login', 4, NULL, '-1', '2015-04-08 14:24:50'),
(299, 'logout', 4, NULL, '-1', '2015-04-08 14:27:38'),
(300, 'login', 4, NULL, '-1', '2015-04-08 14:29:32'),
(301, 'logout', 4, NULL, '-1', '2015-04-08 14:31:11'),
(302, 'login', 4, NULL, '-1', '2015-04-08 14:34:45'),
(303, 'logout', 4, NULL, '-1', '2015-04-08 14:37:28'),
(304, 'login', 4, NULL, '-1', '2015-04-08 14:42:34'),
(305, 'logout', 4, NULL, '-1', '2015-04-08 14:43:39'),
(306, 'login', 4, NULL, '-1', '2015-04-08 15:07:11'),
(307, 'logout', 4, NULL, '-1', '2015-04-08 15:12:13'),
(308, 'login', 4, NULL, '-1', '2015-04-08 15:31:20'),
(309, 'logout', 4, NULL, '-1', '2015-04-08 15:33:53'),
(310, 'login', 4, NULL, '-1', '2015-04-08 15:39:26'),
(311, 'logout', 4, NULL, '-1', '2015-04-08 15:41:48'),
(312, 'login', 4, NULL, '-1', '2015-04-08 15:42:48'),
(313, 'logout', 4, NULL, '-1', '2015-04-08 15:43:56'),
(314, 'login', 4, NULL, '-1', '2015-04-08 15:45:16'),
(315, 'logout', 4, NULL, '-1', '2015-04-08 15:47:09'),
(316, 'login', 4, NULL, '-1', '2015-04-08 15:48:10'),
(317, 'logout', 4, NULL, '-1', '2015-04-08 15:51:14'),
(318, 'login', 4, NULL, '-1', '2015-04-08 15:53:42'),
(319, 'logout', 4, NULL, '-1', '2015-04-08 15:57:05'),
(320, 'login', 4, NULL, '-1', '2015-04-08 15:59:33'),
(321, 'logout', 4, NULL, '-1', '2015-04-08 16:01:12'),
(322, 'login', 4, NULL, '-1', '2015-04-08 16:02:15'),
(323, 'publicAreaEnter', 4, NULL, '1', '2015-04-08 16:03:17'),
(324, 'logout', 4, NULL, '-1', '2015-04-08 16:09:59'),
(325, 'login', 4, NULL, '-1', '2015-04-08 16:10:22'),
(326, 'logout', 4, NULL, '-1', '2015-04-08 16:12:46'),
(327, 'login', 4, NULL, '-1', '2015-04-08 16:13:32'),
(328, 'logout', 4, NULL, '-1', '2015-04-08 16:18:33'),
(329, 'login', 4, NULL, '-1', '2015-04-08 16:23:50'),
(330, 'logout', 4, NULL, '-1', '2015-04-08 16:25:52'),
(331, 'login', 4, NULL, '-1', '2015-04-08 16:27:05'),
(332, 'logout', 4, NULL, '-1', '2015-04-08 16:31:57'),
(333, 'login', 4, NULL, '-1', '2015-04-08 16:36:54'),
(334, 'logout', 4, NULL, '-1', '2015-04-08 16:40:40'),
(335, 'login', 4, NULL, '-1', '2015-04-08 16:46:41'),
(336, 'logout', 4, NULL, '-1', '2015-04-08 16:51:43'),
(337, 'login', 4, NULL, '-1', '2015-04-08 17:10:54'),
(338, 'logout', 4, NULL, '-1', '2015-04-08 17:15:30'),
(339, 'login', 4, NULL, '-1', '2015-04-08 17:15:43'),
(340, 'logout', 4, NULL, '-1', '2015-04-08 17:20:53'),
(341, 'login', 4, NULL, '-1', '2015-04-08 17:25:34'),
(342, 'logout', 4, NULL, '-1', '2015-04-08 17:27:43'),
(343, 'login', 4, NULL, '-1', '2015-04-08 17:28:28'),
(344, 'logout', 4, NULL, '-1', '2015-04-08 17:33:33'),
(345, 'login', 4, NULL, '-1', '2015-04-08 17:35:27'),
(346, 'logout', 4, NULL, '-1', '2015-04-08 17:40:33'),
(347, 'login', 4, NULL, '-1', '2015-04-08 17:44:33'),
(348, 'logout', 4, NULL, '-1', '2015-04-08 17:46:02'),
(349, 'login', 4, NULL, '-1', '2015-04-08 17:46:39'),
(350, 'logout', 4, NULL, '-1', '2015-04-08 17:49:54'),
(351, 'login', 4, NULL, '-1', '2015-04-08 18:13:15'),
(352, 'logout', 4, NULL, '-1', '2015-04-08 18:18:03'),
(353, 'login', 4, NULL, '-1', '2015-04-08 18:19:16'),
(354, 'logout', 4, NULL, '-1', '2015-04-08 18:24:23'),
(355, 'login', 4, NULL, '-1', '2015-04-08 18:27:13'),
(356, 'logout', 4, NULL, '-1', '2015-04-08 18:31:09'),
(357, 'login', 4, NULL, '-1', '2015-04-09 10:35:38'),
(358, 'logout', 4, NULL, '-1', '2015-04-09 10:39:45'),
(359, 'login', 4, NULL, '-1', '2015-04-09 10:47:43'),
(360, 'logout', 4, NULL, '-1', '2015-04-09 10:47:45'),
(361, 'login', 4, NULL, '-1', '2015-04-09 10:59:02'),
(362, 'logout', 4, NULL, '-1', '2015-04-09 11:00:29'),
(363, 'login', 4, NULL, '-1', '2015-04-09 11:01:54'),
(364, 'logout', 4, NULL, '-1', '2015-04-09 11:07:03'),
(365, 'login', 4, NULL, '-1', '2015-04-09 11:10:51'),
(366, 'logout', 4, NULL, '-1', '2015-04-09 11:14:14'),
(367, 'login', 4, NULL, '-1', '2015-04-09 11:18:16'),
(368, 'logout', 4, NULL, '-1', '2015-04-09 11:21:58'),
(369, 'login', 4, NULL, '-1', '2015-04-09 11:25:50'),
(370, 'logout', 4, NULL, '-1', '2015-04-09 11:30:53'),
(371, 'login', 4, NULL, '-1', '2015-04-09 11:35:56'),
(372, 'logout', 4, NULL, '-1', '2015-04-09 11:39:12'),
(373, 'login', 4, NULL, '-1', '2015-04-09 11:41:19'),
(374, 'logout', 4, NULL, '-1', '2015-04-09 11:45:58'),
(375, 'login', 4, NULL, '-1', '2015-04-09 11:48:45'),
(376, 'logout', 4, NULL, '-1', '2015-04-09 11:53:53'),
(377, 'login', 4, NULL, '-1', '2015-04-09 14:13:06'),
(378, 'logout', 4, NULL, '-1', '2015-04-09 14:14:50'),
(379, 'login', 4, NULL, '-1', '2015-04-09 14:15:22'),
(380, 'logout', 4, NULL, '-1', '2015-04-09 14:20:23'),
(381, 'login', 4, NULL, '-1', '2015-04-09 14:26:28'),
(382, 'logout', 4, NULL, '-1', '2015-04-09 14:31:33'),
(383, 'login', 4, NULL, '-1', '2015-04-09 14:32:27'),
(384, 'logout', 4, NULL, '-1', '2015-04-09 14:35:35'),
(385, 'login', 4, NULL, '-1', '2015-04-09 14:37:06'),
(386, 'logout', 4, NULL, '-1', '2015-04-09 14:39:30'),
(387, 'login', 4, NULL, '-1', '2015-04-09 14:44:39'),
(388, 'logout', 4, NULL, '-1', '2015-04-09 14:47:26'),
(389, 'login', 4, NULL, '-1', '2015-04-09 14:51:28'),
(390, 'logout', 4, NULL, '-1', '2015-04-09 14:56:33'),
(391, 'login', 4, NULL, '-1', '2015-04-09 15:01:02'),
(392, 'logout', 4, NULL, '-1', '2015-04-09 15:03:51'),
(393, 'login', 4, NULL, '-1', '2015-04-09 15:04:33'),
(394, 'logout', 4, NULL, '-1', '2015-04-09 15:08:53'),
(395, 'login', 4, NULL, '-1', '2015-04-09 15:09:18'),
(396, 'logout', 4, NULL, '-1', '2015-04-09 15:11:18'),
(397, 'login', 4, NULL, '-1', '2015-04-09 15:11:55'),
(398, 'logout', 4, NULL, '-1', '2015-04-09 15:16:54'),
(399, 'login', 4, NULL, '-1', '2015-04-09 15:17:26'),
(400, 'logout', 4, NULL, '-1', '2015-04-09 15:22:34'),
(401, 'login', 4, NULL, '-1', '2015-04-09 15:25:57'),
(402, 'logout', 4, NULL, '-1', '2015-04-09 15:27:17'),
(403, 'login', 4, NULL, '-1', '2015-04-09 15:33:58'),
(404, 'logout', 4, NULL, '-1', '2015-04-09 15:36:05'),
(405, 'login', 4, NULL, '-1', '2015-04-09 15:37:29'),
(406, 'logout', 4, NULL, '-1', '2015-04-09 15:42:33'),
(407, 'login', 4, NULL, '-1', '2015-04-09 15:46:33'),
(408, 'logout', 4, NULL, '-1', '2015-04-09 15:51:43'),
(409, 'login', 4, NULL, '-1', '2015-04-09 15:52:27'),
(410, 'logout', 4, NULL, '-1', '2015-04-09 15:55:05'),
(411, 'login', 4, NULL, '-1', '2015-04-09 16:02:35'),
(412, 'logout', 4, NULL, '-1', '2015-04-09 16:05:55'),
(413, 'login', 4, NULL, '-1', '2015-04-09 16:06:33'),
(414, 'logout', 4, NULL, '-1', '2015-04-09 16:11:15'),
(415, 'login', 4, NULL, '-1', '2015-04-09 16:13:46'),
(416, 'logout', 4, NULL, '-1', '2015-04-09 16:16:39'),
(417, 'login', 4, NULL, '-1', '2015-04-09 16:24:48'),
(418, 'logout', 4, NULL, '-1', '2015-04-09 16:28:46'),
(419, 'login', 4, NULL, '-1', '2015-04-09 16:32:41'),
(420, 'logout', 4, NULL, '-1', '2015-04-09 16:32:49'),
(421, 'login', 4, NULL, '-1', '2015-04-09 16:34:44'),
(422, 'logout', 4, NULL, '-1', '2015-04-09 16:41:45'),
(423, 'login', 7, NULL, '-1', '2015-04-09 16:45:09'),
(424, 'logout', 7, NULL, '-1', '2015-04-09 16:47:58'),
(425, 'login', 4, NULL, '-1', '2015-04-09 16:48:22'),
(426, 'logout', 4, NULL, '-1', '2015-04-09 16:53:23'),
(427, 'login', 4, NULL, '-1', '2015-04-09 16:57:35'),
(428, 'logout', 4, NULL, '-1', '2015-04-09 16:59:36'),
(429, 'login', 7, NULL, '-1', '2015-04-09 17:11:12'),
(430, 'logout', 7, NULL, '-1', '2015-04-09 17:12:00'),
(431, 'login', 4, NULL, '-1', '2015-04-09 17:12:31'),
(432, 'logout', 4, NULL, '-1', '2015-04-09 17:17:33'),
(433, 'login', 4, NULL, '-1', '2015-04-09 17:20:03'),
(434, 'logout', 4, NULL, '-1', '2015-04-09 17:21:52'),
(435, 'login', 4, NULL, '-1', '2015-04-09 17:22:58'),
(436, 'logout', 4, NULL, '-1', '2015-04-09 17:26:55'),
(437, 'login', 4, NULL, '-1', '2015-04-09 17:27:14'),
(438, 'logout', 4, NULL, '-1', '2015-04-09 17:32:23'),
(439, 'login', 4, NULL, '-1', '2015-04-09 17:36:34'),
(440, 'logout', 4, NULL, '-1', '2015-04-09 17:37:48'),
(441, 'login', 4, NULL, '-1', '2015-04-09 17:47:59'),
(442, 'logout', 4, NULL, '-1', '2015-04-09 17:52:24'),
(443, 'login', 7, NULL, '-1', '2015-04-09 17:52:48'),
(444, 'logout', 7, NULL, '-1', '2015-04-09 17:55:33'),
(445, 'login', 7, NULL, '-1', '2015-04-09 17:56:28'),
(446, 'logout', 7, NULL, '-1', '2015-04-09 17:59:18'),
(447, 'login', 4, NULL, '-1', '2015-04-09 18:09:43'),
(448, 'logout', 4, NULL, '-1', '2015-04-09 18:12:23'),
(449, 'login', 4, NULL, '-1', '2015-04-09 18:16:36'),
(450, 'logout', 4, NULL, '-1', '2015-04-09 18:19:16'),
(451, 'login', 7, NULL, '-1', '2015-04-09 18:20:06'),
(452, 'logout', 7, NULL, '-1', '2015-04-09 18:22:33'),
(453, 'login', 7, NULL, '-1', '2015-04-09 18:22:51'),
(454, 'logout', 7, NULL, '-1', '2015-04-09 18:25:24'),
(455, 'login', 7, NULL, '-1', '2015-04-09 18:25:39'),
(456, 'logout', 7, NULL, '-1', '2015-04-09 18:26:23'),
(457, 'login', 4, NULL, '-1', '2015-04-09 18:26:49'),
(458, 'logout', 4, NULL, '-1', '2015-04-09 18:28:40'),
(459, 'login', 4, NULL, '-1', '2015-04-09 18:29:23'),
(460, 'logout', 4, NULL, '-1', '2015-04-09 18:34:33'),
(461, 'login', 4, NULL, '-1', '2015-04-09 18:39:17'),
(462, 'logout', 4, NULL, '-1', '2015-04-09 18:42:08'),
(463, 'login', 4, NULL, '-1', '2015-04-09 18:44:42'),
(464, 'logout', 4, NULL, '-1', '2015-04-09 18:48:39'),
(465, 'login', 4, NULL, '-1', '2015-04-09 18:50:05'),
(466, 'logout', 4, NULL, '-1', '2015-04-09 18:52:29'),
(467, 'login', 4, NULL, '-1', '2015-04-09 18:57:32'),
(468, 'logout', 4, NULL, '-1', '2015-04-09 18:59:56'),
(469, 'login', 4, NULL, '-1', '2015-04-09 19:00:35'),
(470, 'logout', 4, NULL, '-1', '2015-04-09 19:02:35'),
(471, 'login', 4, NULL, '-1', '2015-04-09 19:05:35'),
(472, 'logout', 4, NULL, '-1', '2015-04-09 19:07:01'),
(473, 'login', 4, NULL, '-1', '2015-04-09 19:09:46'),
(474, 'logout', 4, NULL, '-1', '2015-04-09 19:13:11'),
(475, 'login', 4, NULL, '-1', '2015-04-09 19:14:05'),
(476, 'logout', 4, NULL, '-1', '2015-04-09 19:17:20'),
(477, 'login', 4, NULL, '-1', '2015-04-09 19:20:25'),
(478, 'logout', 4, NULL, '-1', '2015-04-09 19:25:33'),
(479, 'login', 4, NULL, '-1', '2015-04-09 19:35:11'),
(480, 'logout', 4, NULL, '-1', '2015-04-09 19:37:15'),
(481, 'login', 3, NULL, '-1', '2015-04-10 14:39:05'),
(482, 'gameStart', 3, NULL, '6', '2015-04-10 14:39:54'),
(483, 'gameStart', 3, NULL, '6', '2015-04-10 14:40:45'),
(484, 'gameStart', 3, NULL, '6', '2015-04-10 14:41:18'),
(485, 'gameStart', 3, NULL, '6', '2015-04-10 14:41:37'),
(486, 'gameStart', 3, NULL, '6', '2015-04-10 14:42:05'),
(487, 'gameStart', 3, NULL, '6', '2015-04-10 14:42:37'),
(488, 'logout', 3, NULL, '-1', '2015-04-10 14:43:07'),
(489, 'login', 3, NULL, '-1', '2015-04-10 14:43:12'),
(490, 'gameStart', 3, NULL, '6', '2015-04-10 14:43:12'),
(491, 'logout', 3, NULL, '-1', '2015-04-10 14:43:52'),
(492, 'login', 3, NULL, '-1', '2015-04-10 14:44:10'),
(493, 'gameStart', 3, NULL, '6', '2015-04-10 14:44:10'),
(494, 'logout', 3, NULL, '-1', '2015-04-10 14:44:16'),
(495, 'login', 3, NULL, '-1', '2015-04-10 14:45:06'),
(496, 'gameStart', 3, NULL, '6', '2015-04-10 14:45:06'),
(497, 'logout', 3, NULL, '-1', '2015-04-10 14:45:12'),
(498, 'login', 3, NULL, '-1', '2015-04-10 15:09:35'),
(499, 'logout', 3, NULL, '-1', '2015-04-10 15:09:54'),
(500, 'login', 4, NULL, '-1', '2015-04-10 15:11:09'),
(501, 'logout', 4, NULL, '-1', '2015-04-10 15:16:13'),
(502, 'login', 4, NULL, '-1', '2015-04-10 15:22:23'),
(503, 'logout', 4, NULL, '-1', '2015-04-10 15:25:12'),
(504, 'login', 4, NULL, '-1', '2015-04-10 15:29:34'),
(505, 'logout', 4, NULL, '-1', '2015-04-10 15:32:07'),
(506, 'login', 4, NULL, '-1', '2015-04-10 15:33:19'),
(507, 'logout', 4, NULL, '-1', '2015-04-10 15:36:13'),
(508, 'login', 4, NULL, '-1', '2015-04-10 15:38:43'),
(509, 'logout', 4, NULL, '-1', '2015-04-10 15:49:45'),
(510, 'login', 4, NULL, '-1', '2015-04-10 15:51:02'),
(511, 'logout', 4, NULL, '-1', '2015-04-10 15:53:23'),
(512, 'login', 4, NULL, '-1', '2015-04-10 15:54:10'),
(513, 'logout', 4, NULL, '-1', '2015-04-10 15:57:12'),
(514, 'login', 4, NULL, '-1', '2015-04-10 16:16:30'),
(515, 'logout', 4, NULL, '-1', '2015-04-10 16:25:07'),
(516, 'login', 4, NULL, '-1', '2015-04-10 16:33:38'),
(517, 'logout', 4, NULL, '-1', '2015-04-10 16:38:43'),
(518, 'login', 4, NULL, '-1', '2015-04-10 16:59:35'),
(519, 'logout', 4, NULL, '-1', '2015-04-10 17:02:09'),
(520, 'login', 4, NULL, '-1', '2015-04-10 17:05:29'),
(521, 'logout', 4, NULL, '-1', '2015-04-10 17:09:55'),
(522, 'login', 4, NULL, '-1', '2015-04-10 19:18:40'),
(523, 'logout', 4, NULL, '-1', '2015-04-10 19:23:43'),
(524, 'login', 4, NULL, '-1', '2015-04-10 19:26:14'),
(525, 'logout', 4, NULL, '-1', '2015-04-10 19:28:44'),
(526, 'login', 10, NULL, '-1', '2015-07-06 19:30:48'),
(527, 'logout', 10, NULL, '-1', '2015-07-06 19:31:44'),
(528, 'login', 10, NULL, '-1', '2015-07-06 19:35:31'),
(529, 'logout', 10, NULL, '-1', '2015-07-06 19:40:35'),
(530, 'login', 10, NULL, '-1', '2015-07-06 19:41:41'),
(531, 'gameEnter', 10, NULL, '5', '2015-07-06 19:50:01'),
(532, 'gameStart', 10, NULL, '5', '2015-07-06 19:50:05'),
(533, 'gameLeave', 10, NULL, '5', '2015-07-06 19:50:45'),
(534, 'logout', 10, NULL, '-1', '2015-07-06 19:50:59'),
(535, 'login', 10, NULL, '-1', '2015-07-13 13:45:31'),
(536, 'logout', 10, NULL, '-1', '2015-07-13 13:45:35'),
(537, 'login', 10, NULL, '-1', '2015-07-13 13:53:40'),
(538, 'logout', 10, NULL, '-1', '2015-07-13 13:58:44'),
(539, 'login', 10, NULL, '-1', '2015-07-13 14:02:52'),
(540, 'logout', 10, NULL, '-1', '2015-07-13 14:07:55'),
(541, 'login', 10, NULL, '-1', '2015-07-13 14:20:32'),
(542, 'logout', 10, NULL, '-1', '2015-07-13 14:21:47'),
(543, 'login', 10, NULL, '-1', '2015-07-13 14:43:14'),
(544, 'logout', 10, NULL, '-1', '2015-07-13 14:43:19'),
(545, 'login', 10, NULL, '-1', '2015-07-13 14:53:45'),
(546, 'logout', 10, NULL, '-1', '2015-07-13 14:58:54'),
(547, 'login', 10, NULL, '-1', '2015-07-13 15:13:15'),
(548, 'logout', 10, NULL, '-1', '2015-07-13 15:18:24');

-- --------------------------------------------------------

--
-- Table structure for table `animation`
--

CREATE TABLE IF NOT EXISTS `animation` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `animation_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE IF NOT EXISTS `building` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `building_type_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `experience_bonus` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `starter` int(11) NOT NULL,
  `upgrade_id` int(11) DEFAULT NULL,
  `population_bonus` int(11) NOT NULL,
  `population_requirement` int(11) NOT NULL,
  `money_bonus` int(11) NOT NULL,
  `money_rate` int(11) NOT NULL COMMENT 'In seconds',
  `special_id` int(11) NOT NULL DEFAULT '-1',
  `construction_time` int(11) NOT NULL COMMENT 'in seconds',
  `game_id` int(11) DEFAULT NULL,
  `public_area_id` int(11) DEFAULT NULL,
  `citizen_type` varchar(255) DEFAULT NULL,
  `fixed_npc_id` int(11) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `name`, `description`, `building_type_id`, `price`, `experience_bonus`, `width`, `length`, `unlock_level`, `starter`, `upgrade_id`, `population_bonus`, `population_requirement`, `money_bonus`, `money_rate`, `special_id`, `construction_time`, `game_id`, `public_area_id`, `citizen_type`, `fixed_npc_id`, `car_type`) VALUES
(1, 'Casa Nível 1 - Tipo 1', '', 4, 10, 90, 4, 3, 0, 1, 13, 30, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, 'normal'),
(3, 'Banco', '', 6, 10, 30, 4, 4, 2, 1, NULL, 0, 25, 10, 100, -1, 10, NULL, NULL, NULL, 14, NULL),
(5, 'Hotel', '', 6, 13, 30, 4, 4, 2, 1, NULL, 0, 25, 60, 80, -1, 10, NULL, NULL, NULL, 20, NULL),
(6, 'Restaurante', '', 6, 12, 30, 4, 4, 5, 1, NULL, 0, 80, 40, 180, -1, 10, NULL, NULL, NULL, 69, NULL),
(8, 'Departamento de Trânsito', '', 5, 15, 30, 7, 5, 2, 1, NULL, 0, 30, 0, 0, -1, 10, 2, NULL, NULL, NULL, NULL),
(9, 'Polícia', '', 5, 15, 0, 5, 5, 4, 1, NULL, 0, 30, 0, 0, -1, 10, NULL, NULL, 'Police', 62, 'police'),
(10, 'Oficina Mecânica', '', 6, 12, 0, 7, 5, 3, 1, NULL, 0, 25, 20, 300, -1, 10, NULL, NULL, NULL, 61, 'towtruck'),
(11, 'Consultorio Odontológico', '', 5, 15, 0, 4, 4, 3, 1, NULL, 0, 50, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(12, 'Corpo de Bombeiros', '', 5, 15, 0, 5, 5, 7, 1, NULL, 0, 50, 0, 0, -1, 10, 6, NULL, NULL, 76, 'firefighter'),
(13, 'Casa Nível 2 - Tipo 1', '', 4, 20, 0, 4, 3, 4, 0, NULL, 15, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(14, 'Casa Nível 1 - Tipo 2', '', 4, 10, 90, 4, 3, 0, 1, 15, 35, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(15, 'Casa Nível 2 - Tipo 2', '', 4, 20, 0, 4, 3, 8, 0, NULL, 15, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(16, 'Predio nível 2 - Tipo 1', '', 4, 20, 0, 4, 3, 4, 0, NULL, 20, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(17, 'Cristo', '', 2, 50, 0, 5, 5, 0, 1, NULL, 0, 0, 0, 0, 1, 10, NULL, NULL, NULL, NULL, NULL),
(18, 'Maracanã', '', 2, 50, 0, 30, 20, 3, 1, NULL, 0, 50, 0, 0, 2, 10, NULL, NULL, NULL, NULL, NULL),
(19, 'Predio nível 2 - Tipo 2', '', 4, 20, 0, 4, 3, 4, 0, NULL, 20, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(20, 'Predio nível 1 - Tipo 2', '', 4, 20, 0, 4, 3, 0, 1, 19, 20, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(21, 'Predio nível 1 - Tipo 1', '', 4, 20, 0, 4, 3, 0, 1, 16, 20, 0, 0, 0, -1, 10, NULL, NULL, 'Citizen', NULL, 'normal'),
(22, 'Estação de Foguete', '', 3, 50, 0, 10, 8, 3, 1, NULL, 0, 50, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(23, 'Circo', '', 3, 25, 0, 5, 5, 3, 1, NULL, 0, 50, 150, 260, -1, 10, NULL, NULL, 'circus', 68, NULL),
(64, 'Coqueiro', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(65, 'Banco de Praça', '', 1, 5, 0, 1, 1, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(68, 'Terminal de Ônibus', '', 6, 28, 0, 7, 5, 3, 1, NULL, 0, 1, 0, 0, 0, 10, NULL, NULL, NULL, 27, 'bus'),
(70, 'Estação de Trem', '', 6, 15, 0, 5, 5, 2, 1, NULL, 0, 40, 0, 0, -1, 10, 1, NULL, NULL, NULL, NULL),
(72, 'Pista de Corrida', '', 6, 15, 0, 10, 8, 2, 1, NULL, 0, 60, 0, 0, -1, 10, 3, NULL, NULL, NULL, NULL),
(80, 'Casa Mal Assombrada', '', 3, 15, 0, 5, 5, 2, 1, NULL, 0, 50, 0, 0, -1, 10, 4, NULL, NULL, 23, NULL),
(85, 'Hospital', '', 5, 15, 0, 5, 5, 2, 1, NULL, 0, 50, 0, 0, -1, 10, 5, NULL, NULL, 22, NULL),
(89, 'Universidade', '', 5, 25, 0, 10, 8, 8, 1, NULL, 0, 250, 0, 0, -1, 10, NULL, NULL, NULL, 60, NULL),
(90, 'Mercado', '', 6, 12, 30, 4, 4, 0, 1, NULL, 0, 10, 15, 30, -1, 30, NULL, NULL, NULL, 12, NULL),
(91, 'Banco de Concreto', '', 1, 5, 0, 1, 1, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(92, 'Árvore 2', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(93, 'Árvore 3', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(94, 'Árvore 4', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(95, 'Árvore 5', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(96, 'Árvore 6', '', 7, 5, 0, 2, 2, 0, 1, NULL, 0, 0, 0, 0, 0, 10, NULL, NULL, NULL, NULL, NULL),
(98, 'Parquinho', '', 3, 0, 0, 10, 8, 4, 1, NULL, 10, 0, 0, 0, -1, 10, NULL, NULL, NULL, 72, NULL),
(99, 'Castelo dos Unicórnios', '', 3, 15, 0, 10, 8, 2, 1, NULL, 0, 50, 0, 0, -1, 10, NULL, NULL, NULL, 73, NULL),
(100, 'Disco Voador', '', 3, 15, 0, 10, 8, 2, 1, NULL, 0, 50, 0, 0, -1, 10, NULL, NULL, 'aliens', NULL, NULL),
(101, 'Zoológico', '', 3, 15, 0, 5, 5, 2, 1, NULL, 0, 50, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(103, 'Estátua', '', 1, 100, 100, 1, 1, 9, 1, NULL, 0, 0, 0, 0, -1, 0, NULL, NULL, NULL, NULL, NULL),
(104, 'Hidrante', '', 1, 20, 50, 1, 1, 9, 1, NULL, 0, 0, 0, 0, -1, 0, NULL, NULL, NULL, NULL, NULL),
(105, 'Planetário', '', 3, 25, 50, 7, 5, 10, 1, NULL, 0, 400, 120, 14400, -1, 10, NULL, NULL, NULL, NULL, NULL),
(106, 'Estação de Rádio, TV e Jornal', '', 6, 12, 50, 7, 5, 10, 1, NULL, 0, 380, 240, 43200, -1, 10, NULL, NULL, NULL, NULL, NULL),
(107, 'Relógio de Rua', '', 1, 5, 10, 1, 1, 3, 1, NULL, 0, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(108, 'Lixo', '', 1, 5, 10, 1, 1, 3, 1, NULL, 0, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(109, 'Estacionamento de Bicicletas', '', 1, 5, 10, 1, 1, 3, 1, NULL, 0, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(110, 'Praça e Fonte', '', 1, 5, 10, 5, 5, 3, 1, NULL, 0, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL),
(111, 'Parklet', '', 1, 5, 10, 1, 1, 3, 1, NULL, 0, 0, 0, 0, -1, 10, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `building_model`
--

CREATE TABLE IF NOT EXISTS `building_model` (
`id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building_model`
--

INSERT INTO `building_model` (`id`, `building_id`, `bundle_url`, `bundle_version`, `model_name`) VALUES
(41, 1, 'building_model-CAMVWM', 0, '_go_Casa nivel 1_Primeiro Modelo'),
(42, 64, 'building_model-Huwz1k', 0, '_go_Coqueiro'),
(43, 65, 'building_model-7QwrNK', 0, '_go_Banco_madeira'),
(44, 68, 'building_model-MlKK9s', 0, 'go terminal de onibus'),
(45, 90, 'building_model-QJCnim', 0, '_go_Mercado'),
(46, 3, 'building_model-bhpt9V', 0, '_go_Banco'),
(47, 85, 'building_model-kRcb0F', 0, '_go Hospital'),
(50, 10, 'building_model-PHPrha', 0, '_go_Oficina Mecanica'),
(51, 91, 'building_model-uBoTgQ', 0, 'go banco concreto'),
(52, 5, 'building_model-h9C5Ih', 0, '_go_Hotel'),
(53, 6, 'building_model-Dion7S', 0, '_go_Restaurante'),
(54, 8, 'building_model-GM7yXt', 0, '_go_Departamento de Transito'),
(55, 9, 'building_model-IPElf7', 0, '_go_Policia'),
(56, 11, 'building_model-XhFWNk', 0, '_go_Posto de Saude'),
(57, 12, 'building_model-ObQdPk', 0, '_go_Corpo de Bombeiros'),
(59, 14, 'building_model-0GMRUF', 0, '_go_Casa nivel1_Segundo modelo'),
(60, 15, 'building_model-A25PF9', 0, '_go_Casa Nivel 2_Segundo modelo'),
(61, 13, 'building_model-2YzQDv', 0, '_go_Casa Nivel 2_Primeiro modelo 1'),
(62, 16, 'building_model-mgJfRH', 0, '_go_Predio Nivel 2_Primeiro modelo'),
(63, 19, 'building_model-UCbdc2', 0, '_go_Predio_2_segundo_modelo'),
(64, 20, 'building_model-WbIXOE', 0, '_go_Predio_Nivel_1_2'),
(65, 21, 'building_model-svXVa0', 0, 'go Predio Nivel 1_Primeiro Modelo'),
(66, 17, 'building_model-U3MS2B', 0, '_go_Cristo'),
(67, 18, 'building_model-CE8rbB', 0, '_go_Maracana'),
(71, 92, 'building_model-PDjwUR', 0, '_go_arvore_2'),
(72, 93, 'building_model-WFyNte', 0, '_go_Arvore_3'),
(73, 94, 'building_model-oW1qLi', 0, '_go_Arvore_4'),
(74, 95, 'building_model-BTUs3j', 0, '_go_Arvore_5'),
(75, 96, 'building_model-PUnk6j', 0, '_go_Arvore_6'),
(76, 22, 'building_model-gcc4ol', 0, '_go_Estacao de Foguete'),
(77, 23, 'building_model-6f2Qtm', 0, '_go_Circo'),
(78, 70, 'building_model-I7VbcQ', 0, '_go Estacao de Trem'),
(79, 72, 'building_model-WMF0LV', 0, '_go Pista de Corrida'),
(80, 80, 'building_model-R9WGKs', 0, '_go Casa Mal Assombrada'),
(81, 98, 'building_model-JpIm5s', 0, '_go Playground'),
(82, 99, 'building_model-RdmVWU', 0, 'go castelo unicornios'),
(83, 89, 'building_model-o6tL9K', 0, '_go_Universidade'),
(84, 100, 'building_model-FQ2PgW', 0, '_go_disco_voador'),
(85, 101, 'building_model-7vNxRm', 0, '_go_Zoologico'),
(86, 103, 'building_model-YZmXyx', 0, 'go estatua'),
(87, 105, 'building_model-YZmXyY', 0, '_go planetario'),
(88, 106, 'building_model-RRl5A0', 0, 'go rtv'),
(89, 104, 'building_model-ZnUmJH', 0, 'go Hidrante'),
(90, 107, 'building_model-qa93xJ', 0, 'go RelogioDeRua'),
(91, 108, 'building_model-xc1wBK', 0, 'go lixo'),
(92, 109, 'building_model-cqw46M', 0, 'go estacionamento Bikes'),
(93, 110, 'building_model-DXmsk6', 0, 'go praca e fonte'),
(94, 111, 'building_model-B0xY7N', 0, 'go parklet');

-- --------------------------------------------------------

--
-- Table structure for table `building_model_texture`
--

CREATE TABLE IF NOT EXISTS `building_model_texture` (
`id` int(11) NOT NULL,
  `building_model_id` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building_model_texture`
--

INSERT INTO `building_model_texture` (`id`, `building_model_id`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`) VALUES
(55, 41, 'building_model_texture-OsCU3w', 0, 'Casa nivel 1_Primeiro Modelo_1', 'Casa nivel 1_Icone 1'),
(56, 41, 'building_model_texture-5ar0vV', 0, 'Casa nivel 1_Primeiro Modelo_2', 'Casa nivel 1_Icone 2'),
(57, 42, 'building_model_texture-I9mrNv', 0, 'Coqueiro_Text', 'Coqueiro_7_Icone'),
(58, 43, 'building_model_texture-rzklVJ', 0, 'Banco_madeira_difuse', 'Banco_madeira_icone'),
(59, 44, 'building_model_texture-HWVOno', 0, 'Terminal de Onibus_diffuse', 'TerminaldeOnibus_Icone'),
(61, 45, 'building_model_texture-ORWVe4', 0, 'Mercado', 'Mercado_icone'),
(62, 46, 'building_model_texture-UpSDNG', 0, 'Banco', 'Banco_Icone'),
(63, 50, 'building_model_texture-DhCXRW', 0, 'Oficina Mecanica', 'Oficina Mecanica Icone'),
(65, 47, 'building_model_texture-ToIa5M', 0, 'Hospital_diffuse', 'Hospital_Icone'),
(67, 53, 'building_model_texture-xIwhCM', 0, 'Restaurante', 'Restaurante_Icone'),
(68, 54, 'building_model_texture-bjvjXd', 0, 'Departamento de Transito', 'Departamento de Transito_Icone'),
(69, 55, 'building_model_texture-1POPDC', 0, 'Policia', 'Policia_Icone'),
(70, 56, 'building_model_texture-9A1nOD', 0, 'Posto de Saude_diffuse', 'Posto de Saude_Icone'),
(71, 51, 'building_model_texture-p5Rh8S', 0, 'Banco_concreto_difusse', 'Banco_concreto_icone'),
(72, 57, 'building_model_texture-rdSvyA', 0, 'Corpo de Bombeiros', 'Corpo de Bombeiros_icones'),
(75, 59, 'building_model_texture-vhpAgg', 0, 'Casa Nivel 1_Segundo modelo_1', 'Casa Nivel 1_Segundo modelo_Icone'),
(76, 60, 'building_model_texture-5iAUzP', 0, 'Casa Nivel 2_Segundo modelo_Difuse', 'Casa Nivel 2_Segundo modelo_Icone'),
(79, 52, 'building_model_texture-pCRHtX', 0, 'Hotel', 'Hotel_icone'),
(80, 61, 'building_model_texture-iIXAzd', 0, 'casa 2 modelo 1', 'Casa Nivel 2_Primeiro modelo_Icone_1'),
(81, 59, 'building_model_texture-JINj3Q', 0, 'Casa Nivel 1_Segundo modelo_2', 'Casa Nivel 1_Segundo modelo_Icone_2'),
(82, 59, 'building_model_texture-CPsj4J', 0, 'Casa Nivel 1_Segundo modelo_3', 'Casa Nivel 1_Segundo modelo_Icone_3'),
(84, 61, 'building_model_texture-V7uJxl', 0, 'Casa Nivel 2_Primeiro modelo_2', 'Casa Nivel 2_Primeiro modelo_Icone_3'),
(85, 61, 'building_model_texture-WfAfi1', 0, 'Casa Nivel 2_Primeiro modelo_3', 'Casa Nivel 2_Primeiro modelo_Icone_2'),
(86, 60, 'building_model_texture-fs7Uyh', 0, 'Casa Nivel 2_Segundo modelo_2', 'Casa Nivel 2_Segundo modelo_Icone_2'),
(87, 60, 'building_model_texture-4gkkAX', 0, 'Casa Nivel 2_Segundo modelo_3', 'Casa Nivel 2_Segundo modelo_Icone_3'),
(89, 62, 'building_model_texture-BYahOV', 0, 'Predio Nivel 2_Primeiro modelo_1', 'Predio Nivel 2_Primeiro modelo_Icones'),
(90, 62, 'building_model_texture-5UV90d', 0, 'Predio Nivel 2_Primeiro modelo_2', 'Predio Nivel 2_Primeiro modelo_Icones_3'),
(91, 62, 'building_model_texture-9aTIG9', 0, 'Predio Nivel 2_Primeiro modelo_3', 'Predio Nivel 2_Primeiro modelo_Icones_2'),
(93, 63, 'building_model_texture-VFbVJC', 0, 'Predio Nivel 2_Segundo modelo_1', 'Predio Nivel 2_Segundo modelo_Icone_1'),
(94, 63, 'building_model_texture-cAmCiR', 0, 'Predio Nivel 2_Segundo modelo_2', 'Predio Nivel 2_Segundo modelo_Icone_2'),
(95, 63, 'building_model_texture-uDNEo7', 0, 'Predio Nivel 2_Segundo modelo_3', 'Predio Nivel 2_Segundo modelo_Icone_3'),
(96, 64, 'building_model_texture-W7sYNd', 0, 'Predio Nivel 1_Segundo Modelo_difuse_1', 'Predio Nivel 1_Segundo modelo_1_Icone'),
(97, 64, 'building_model_texture-P74Kgi', 0, 'Predio Nivel 1_Segundo Modelo_difuse_2', 'Predio Nivel 1_Segundo modelo_2_Icone'),
(98, 64, 'building_model_texture-KNLIa7', 0, 'Predio Nivel 1_Segundo Modelo_difuse_3', 'Predio Nivel 1_Segundo modelo_3_Icone'),
(99, 65, 'building_model_texture-E1uoXq', 0, 'Predio Nivel 1_Primeiro Modelo_ 1', 'Predio Nivel 1_Primeiro Modelo_1_Icone'),
(100, 65, 'building_model_texture-o1dvoO', 0, 'Predio Nivel 1_Primeiro Modelo_2', 'Predio Nivel 1_Primeiro Modelo_2_Icone'),
(101, 65, 'building_model_texture-xmPnTN', 0, 'Predio Nivel 1_Primeiro Modelo_3', 'Predio Nivel 1_Primeiro Modelo_3_Icone'),
(102, 66, 'building_model_texture-hE1S6o', 0, 'Cristo', 'Cristo_Icone'),
(103, 67, 'building_model_texture-Awjn9m', 0, 'Maracana', 'Maracana_Icone'),
(104, 71, 'building_model_texture-b0QT3e', 0, 'Arvore_2', 'Arvore_2_icone'),
(105, 72, 'building_model_texture-OGL0Nh', 0, 'Arvore_3_Difuse', 'Arvore_3_icone'),
(106, 73, 'building_model_texture-kGenqh', 0, 'Arvore_4_Difuse', 'arvore_4_icone'),
(107, 74, 'building_model_texture-1EPQqL', 0, 'Arvore_5_Difuse', 'Arvore_5_icone'),
(108, 75, 'building_model_texture-w1lsKt', 0, 'Arvore_6', 'Arvore_6_icone'),
(109, 76, 'building_model_texture-oFdm5p', 0, 'Estacao de Foguete', 'Estacao de Foguete_Icone'),
(110, 41, 'building_texture-MhgTdp', 0, 'Casa nivel 1_Primeiro Modelo_3', 'Casa nivel 1_Icone 3'),
(111, 41, 'building_texture-4jZtCP', 0, 'Casa nivel 1_Primeiro Modelo_4', 'Casa nivel 1_Icone 4'),
(112, 41, 'building_texture-IuNkaj', 0, 'Casa nivel 1_Primeiro Modelo_5', 'Casa nivel 1_Icone 5'),
(113, 77, 'building_texture-Sq23pr', 0, 'Circo', 'Circo_Icone'),
(114, 78, 'building_model_texture-IHUmVa', 0, 'Estacao de Trem', 'Estacao de Trem_Icone_1'),
(115, 79, 'building_model_texture-QZLolp', 0, 'Pista de Corrida_diffuse', 'Pista de corrida_Icone'),
(116, 80, 'building_model_texture-VXHSqS', 0, 'Casa Mal Assombrada_Diffuser', 'Casa Mal_icone'),
(118, 82, 'building_texture-qyqSgW', 0, 'Castelo_unicornios_diffuse', 'Castelo_render2'),
(119, 81, 'building_texture-7Og4A4', 0, 'Playground', 'Playground_Icone'),
(120, 83, 'building_model_texture-VHg7YT', 0, 'Universidade_diffuse', 'Universidade_icon'),
(121, 84, 'building_texture-yr35em', 0, 'Disco_voador_diffuse', 'Disco voador_Icone'),
(122, 85, 'building_texture-4KVybz', 0, 'Zoologico_diffuse', 'Zoologico_icone'),
(123, 86, 'building_texture-saToWY', 0, 'Estatua_diffuse', 'estatua render 1'),
(124, 88, 'building_texture-HzgETH', 0, 'radio tv jornal diffuse', 'rtv icone'),
(125, 87, 'building_texture-VNTkGE', 0, 'Planetario_Difuse', 'Planetario_Icone'),
(126, 89, 'building_texture-6ZNAF3', 0, 'Hidrante_diffuse', 'Hidrante_Icone'),
(127, 90, 'building_texture-Pgpuvn', 0, 'Relogio de rua_diffuse', 'Relogio de rua_Icone'),
(128, 91, 'building_texture-FosT8q', 0, 'Lixo_diffuse', 'Lixo_Icone'),
(129, 92, 'building_texture-yictXA', 0, 'Estacionamento de bikes_diffuse', 'Estacionamento de bikes_Icone'),
(130, 93, 'building_texture-yv1Eie', 0, 'Praca e Fonte_diffuse', 'Praca e Fonte'),
(131, 94, 'building_texture-hjywxW', 0, 'Parklet_diffuse', 'Parklet_icone');

-- --------------------------------------------------------

--
-- Table structure for table `building_type`
--

CREATE TABLE IF NOT EXISTS `building_type` (
`id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `icon_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building_type`
--

INSERT INTO `building_type` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `icon_name`) VALUES
(1, 'Decoração', '', 'building_type-bLZSfo', 0, 'Transportes_background'),
(2, 'Especial', '', 'building_type-CXCvmU', 0, 'Cristo_Icon'),
(3, 'Maluco', '', 'building_type-UWz8ZQ', 0, 'maluco icone'),
(4, 'Residencial', '', 'building_type-PPJqyM', 0, 'Residencial_icone'),
(5, 'Segurança', '', 'building_type-ZiwhJr', 0, 'bombeiros_icon'),
(6, 'Serviço', '', 'building_type-a8vsiZ', 0, 'Mercado_icon'),
(7, 'Plantas', '', 'building_type-FPyXkF', 0, 'Plantas Icone');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
`id` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `car_type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`id`, `bundle_url`, `bundle_version`, `model_name`, `car_type`) VALUES
(1, 'car-jhfVtA', 0, 'go carro amarelo', 'normal'),
(2, 'car-36Mask', 0, 'go carro verde', 'normal'),
(3, 'car-icnbd3', 0, 'go carro azul', 'normal'),
(4, 'car-S8MDAG', 0, 'go caminhao bombeiro', 'firefighter'),
(5, 'car-haVQgS', 0, 'go policia', 'police'),
(6, 'car-Hs7aNZ', 0, 'go Guincho', 'towtruck'),
(7, 'car-HuEhUe', 0, 'go onibus', 'bus');

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE IF NOT EXISTS `car_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`type`) VALUES
('bus'),
('firefighter'),
('normal'),
('police'),
('towtruck');

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) DEFAULT NULL,
  `interpret` varchar(200) DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
`id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

-- --------------------------------------------------------

--
-- Table structure for table `character_visual`
--

CREATE TABLE IF NOT EXISTS `character_visual` (
  `player_id` int(11) NOT NULL,
  `headpiece_id` int(11) DEFAULT NULL,
  `hair_id` int(11) DEFAULT NULL,
  `hair_color` varchar(16) NOT NULL,
  `eye_id` int(11) NOT NULL,
  `eye_color` varchar(16) NOT NULL,
  `nose_id` int(11) NOT NULL,
  `mouth_id` int(11) NOT NULL,
  `upperbody_id` int(11) NOT NULL,
  `lowerbody_id` int(11) NOT NULL,
  `feet_id` int(11) NOT NULL,
  `hand_accessory_id` int(11) DEFAULT NULL,
  `body_accessory_id` int(11) DEFAULT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `character_visual`
--

INSERT INTO `character_visual` (`player_id`, `headpiece_id`, `hair_id`, `hair_color`, `eye_id`, `eye_color`, `nose_id`, `mouth_id`, `upperbody_id`, `lowerbody_id`, `feet_id`, `hand_accessory_id`, `body_accessory_id`, `skin_id`) VALUES
(1, NULL, 10, 'EE7114', 37, '2188AF', 20, 25, 99, 109, 79, 16, NULL, 8),
(2, 4, 4, 'EE7114', 40, '2188AF', 16, 27, 93, 105, 79, 1, 23, 2),
(3, 3, 4, '0E7A20', 39, '09710F', 16, 28, 83, 62, 64, NULL, 26, 8),
(4, 6, 1, 'EE7114', 34, '2188AF', 17, 25, 89, 62, 63, 19, 27, 7),
(5, NULL, 4, 'EE7114', 40, '2188AF', 18, 21, 95, 120, 75, 21, 22, 2),
(10, 1, 7, 'EE7114', 33, '2188AF', 17, 30, 96, 104, 77, 16, 23, 11);

--
-- Triggers `character_visual`
--
DELIMITER //
CREATE TRIGGER `Make first login` BEFORE DELETE ON `character_visual`
 FOR EACH ROW UPDATE player SET player.first_login = 1 WHERE player.id = OLD.player_id
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `citizen`
--

CREATE TABLE IF NOT EXISTS `citizen` (
`id` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `citizen_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citizen`
--

INSERT INTO `citizen` (`id`, `bundle_url`, `bundle_version`, `model_name`, `citizen_type`, `name`) VALUES
(1, 'citizen-5ZAupv', 0, 'go policial Walk', 'Police', 'Policial'),
(2, 'citizen-7SjXjS', 0, 'go cidada walk', 'Citizen', 'Cidadã'),
(3, 'citizen-7ff1hT', 0, 'go mimico walk', 'circus', 'Mimico'),
(4, 'citizen-m7YWqQ', 0, 'go et walk', 'aliens', 'ET');

-- --------------------------------------------------------

--
-- Table structure for table `citizen_type`
--

CREATE TABLE IF NOT EXISTS `citizen_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citizen_type`
--

INSERT INTO `citizen_type` (`type`) VALUES
('aliens'),
('circus'),
('Citizen'),
('Police');

-- --------------------------------------------------------

--
-- Table structure for table `cloth`
--

CREATE TABLE IF NOT EXISTS `cloth` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `cloth_type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloth`
--

INSERT INTO `cloth` (`id`, `name`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`, `description`, `price`, `unlock_level`, `cloth_type`) VALUES
(4, 'Calça Jeans', 'cloth-gcyqD8', 0, 'vestuario_feminino_Inferior_01', 'vestuario_feminino_Inferior_01i', '', 0, -1, 'lowerbody'),
(43, 'Sapatilha rosa', 'cloth-nYgo9L', 0, 'g06', 'g06i', '', 0, -1, 'feet'),
(51, 'Tenis raio ', 'cloth-tGiy9j', 0, 'm04', 'm04i', '', 0, -1, 'feet'),
(58, 'Camiseta bradesco feminina', 'cloth-SVAU4J', 0, 'Vestuario_Feminino_Superior_bra', 'Vestuario_Feminino_Superior_brai', 'Camiseta do Bradesco Feminina', 0, -1, 'upperbody'),
(62, 'Saia Rosa', 'cloth-bkhpTq', 0, 'vestuario_feminino_Inferior_02', 'vestuario_feminino_Inferior_02i', 'Saia Rosa', 0, -1, 'skirt'),
(63, 'Chinelo Azul', 'cloth-KC8lKP', 0, 'g01', 'g01i', '', 0, -1, 'feet'),
(64, 'Chinelo Porquinho', 'cloth-2bFF62', 0, 'g02', 'g02i', '', 0, -1, 'feet'),
(65, 'Sapato Lacinho', 'cloth-jJshnG', 0, 'g03', 'g03i', '', 0, -1, 'feet'),
(66, 'Tenis Oncinha', 'cloth-GU7d5F', 0, 'g04', 'g04i', '', 0, -1, 'feet'),
(67, 'Botas', 'cloth-FETdK6', 0, 'g05', 'g05i', '', 0, -1, 'feet'),
(69, 'Tenis Preto', 'cloth-lG8UOi', 0, 'g07', 'g07i', '', 0, -1, 'feet'),
(70, 'Bota Joaninha', 'cloth-G0Olet', 0, 'g08', 'g08i', '', 0, -1, 'feet'),
(71, 'Tenis azul e dourado', 'cloth-jfVyoe', 0, 'g09', 'g09i', '', 0, -1, 'feet'),
(72, 'Sapatilha vermelha', 'cloth-xbpz0V', 0, 'g10', 'g10i', '', 0, -1, 'feet'),
(73, 'Chinelo', 'cloth-m8J4fn', 0, 'm01', 'm01i', '', 0, -1, 'feet'),
(74, 'Bota de couro', 'cloth-qeUnHh', 0, 'm02', 'm02i', '', 0, -1, 'feet'),
(75, 'Pé de monstro', 'cloth-jJYlCo', 0, 'm03', 'm03i', '', 0, -1, 'feet'),
(77, 'Tenis Verde', 'cloth-4XFIhx', 0, 'm05', 'm05i', '', 0, -1, 'feet'),
(78, 'Tenis Cinza', 'cloth-CsuAZV', 0, 'm06', 'm06i', '', 0, -1, 'feet'),
(79, 'Sandálias', 'cloth-x0T1h0', 0, 'm07', 'm07i', '', 0, -1, 'feet'),
(80, 'Bota Azul', 'cloth-oZViCk', 0, 'm08', 'm08i', '', 0, -1, 'feet'),
(81, 'Tenis Preto e Dourado', 'cloth-MrwYpN', 0, 'm09', 'm09i', '', 0, -1, 'feet'),
(82, 'Tenis raio branco', 'cloth-bwPsfz', 0, 'm10', 'm10i', '', 0, -1, 'feet'),
(83, 'Top Amarelo', 'cloth-rLTtAj', 0, 'Vestuario_Feminino_Superior_01', 'Vestuario_Feminino_Superior_01i', '', 0, -1, 'upperbody'),
(84, 'Camiseta Florida', 'cloth-HEq2mI', 0, 'Vestuario_Feminino_Superior_02', 'Vestuario_Feminino_Superior_02i', '', 0, -1, 'upperbody'),
(85, 'Blusinha Marinheiro', 'cloth-jyhzUj', 0, 'Vestuario_Feminino_Superior_03', 'Vestuario_Feminino_Superior_03i', '', 0, -1, 'upperbody'),
(86, 'Blusinha Metal', 'cloth-PB6xaU', 0, 'Vestuario_Feminino_Superior_04', 'Vestuario_Feminino_Superior_04i', '', 0, -1, 'upperbody'),
(87, 'Camiseta Rosa', 'cloth-jYzBgH', 0, 'Vestuario_Feminino_Superior_05', 'Vestuario_Feminino_Superior_05i', '', 0, -1, 'upperbody'),
(88, 'Blusinha Rosa', 'cloth-S5Vym3', 0, 'Vestuario_Feminino_Superior_06', 'Vestuario_Feminino_Superior_06i', '', 0, -1, 'upperbody'),
(89, 'Camisa Azul', 'cloth-JObntt', 0, 'Vestuario_Feminino_Superior_07', 'Vestuario_Feminino_Superior_07i', '', 0, -1, 'upperbody'),
(90, 'Camisa Esportiva', 'cloth-OGOykH', 0, 'Vestuario_Feminino_Superior_08', 'Vestuario_Feminino_Superior_08i', '', 0, -1, 'upperbody'),
(91, 'Camiseta de Bolinhas', 'cloth-I0l7Eo', 0, 'Vestuario_Feminino_Superior_09', 'Vestuario_Feminino_Superior_09i', '', 0, -1, 'upperbody'),
(92, 'Blusinha Rosa', 'cloth-Bv9BJv', 0, 'Vestuario_Feminino_Superior_10', 'Vestuario_Feminino_Superior_10i', '', 0, -1, 'upperbody'),
(93, 'Camiseta cinza de manga preta', 'cloth-QyokGp', 0, 'vestuario_Masculino_Superior_02', 'vestuario_Masculino_Superior_02i', '', 0, -1, 'upperbody'),
(94, 'Camiseta metal', 'cloth-UH95Vc', 0, 'vestuario_Masculino_Superior_03', 'vestuario_Masculino_Superior_03i', '', 0, -1, 'upperbody'),
(95, 'Camiseta de marinheiro', 'cloth-yJ8IcB', 0, 'vestuario_Masculino_Superior_04', 'vestuario_Masculino_Superior_04i', '', 0, -1, 'upperbody'),
(96, 'Moletom laranja', 'cloth-B3NO79', 0, 'vestuario_Masculino_Superior_05', 'vestuario_Masculino_Superior_05i', '', 0, -1, 'upperbody'),
(97, 'Camiseta verde', 'cloth-eOqIWE', 0, 'vestuario_Masculino_Superior_06', 'vestuario_Masculino_Superior_06i', '', 0, -1, 'upperbody'),
(98, 'Camiseta Azul', 'cloth-3ux7fQ', 0, 'vestuario_Masculino_Superior_07', 'vestuario_Masculino_Superior_07i', '', 0, -1, 'upperbody'),
(99, 'Camiseta cinza listrada', 'cloth-chl3Qh', 0, 'vestuario_Masculino_Superior_08', 'vestuario_Masculino_Superior_08i', '', 0, -1, 'upperbody'),
(100, 'Camisa Xadrez', 'cloth-q3HhV3', 0, 'vestuario_Masculino_Superior_09', 'vestuario_Masculino_Superior_09i', '', 0, -1, 'upperbody'),
(101, 'Camiseta vermelha de manga comprida', 'cloth-EUc50w', 0, 'vestuario_Masculino_Superior_10', 'vestuario_Masculino_Superior_10i', '', 0, -1, 'upperbody'),
(104, 'Saia Branca', 'cloth-PQBz5t', 0, 'vestuario_feminino_Inferior_03', 'vestuario_feminino_Inferior_03i', '', 0, -1, 'skirt'),
(105, 'Saia Preta', 'cloth-6DZ0DM', 0, 'vestuario_feminino_Inferior_04', 'vestuario_feminino_Inferior_04i', '', 0, -1, 'skirt'),
(106, 'Saia listrada amarela', 'cloth-VW9cHC', 0, 'vestuario_feminino_Inferior_05', 'vestuario_feminino_Inferior_05i', '', 0, -1, 'skirt'),
(107, 'Shorts Jeans', 'cloth-luib0S', 0, 'vestuario_feminino_Inferior_06', 'vestuario_feminino_Inferior_06i', '', 0, -1, 'lowerbody'),
(108, 'Shorts Roxo', 'cloth-Pn0Z2T', 0, 'vestuario_feminino_Inferior_07', 'vestuario_feminino_Inferior_07i', '', 0, -1, 'lowerbody'),
(109, 'Shorts Jeans', 'cloth-aI6of8', 0, 'vestuario_feminino_Inferior_08', 'vestuario_feminino_Inferior_08i', '', 0, -1, 'lowerbody'),
(110, 'Calça preta', 'cloth-moM7cv', 0, 'vestuario_feminino_Inferior_09', 'vestuario_feminino_Inferior_09i', '', 0, -1, 'lowerbody'),
(111, 'Shorts rosa', 'cloth-VNu2sd', 0, 'vestuario_feminino_Inferior_10', 'vestuario_feminino_Inferior_10i', '', 0, -1, 'lowerbody'),
(112, 'Calça Marrom', 'cloth-LKOKgn', 0, 'vestuario_masculino_inferior_01', 'vestuario_masculino_Inferior_01i', '', 0, -1, 'lowerbody'),
(113, 'Calça Jeans', 'cloth-q35Tpa', 0, 'vestuario_masculino_inferior_02', 'vestuario_masculino_Inferior_02i', '', 0, -1, 'lowerbody'),
(114, 'Shorts Jeans', 'cloth-YiVhHD', 0, 'vestuario_masculino_inferior_03', 'vestuario_masculino_Inferior_03i', '', 0, -1, 'lowerbody'),
(115, 'Shorts xadrez bege', 'cloth-Q29WzV', 0, 'vestuario_masculino_inferior_04', 'vestuario_masculino_inferior_04i', '', 0, -1, 'lowerbody'),
(116, 'Shorts bege', 'cloth-Z47hdF', 0, 'vestuario_masculino_inferior_06', 'vestuario_masculino_Inferior_06i', '', 0, -1, 'lowerbody'),
(117, 'Shorts preto com faixa verde', 'cloth-6C6WL5', 0, 'vestuario_masculino_inferior_07', 'vestuario_masculino_Inferior_07i', '', 0, -1, 'lowerbody'),
(118, 'Shorts rosa', 'cloth-2BHUNe', 0, 'vestuario_masculino_inferior_08', 'vestuario_masculino_Inferior_08i', '', 0, -1, 'lowerbody'),
(119, 'Shorts preto', 'cloth-KJklrA', 0, 'vestuario_masculino_inferior_09', 'vestuario_masculino_Inferior_09i', '', 0, -1, 'lowerbody'),
(120, 'Shorts cinza', 'cloth-fHur2c', 0, 'vestuario_masculino_inferior_10', 'vestuario_masculino_Inferior_10i', '', 0, -1, 'lowerbody');

-- --------------------------------------------------------

--
-- Table structure for table `cloth_type`
--

CREATE TABLE IF NOT EXISTS `cloth_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloth_type`
--

INSERT INTO `cloth_type` (`type`) VALUES
('feet'),
('lowerbody'),
('skirt'),
('upperbody');

-- --------------------------------------------------------

--
-- Table structure for table `costume`
--

CREATE TABLE IF NOT EXISTS `costume` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `headpiece_id` int(11) DEFAULT NULL,
  `hair_id` int(11) DEFAULT NULL,
  `upperbody_id` int(11) DEFAULT NULL,
  `lowerbody_id` int(11) DEFAULT NULL,
  `feet_id` int(11) DEFAULT NULL,
  `hand_accessory_id` int(11) DEFAULT NULL,
  `body_accessory_id` int(11) DEFAULT NULL,
  `icon_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diggable_costume`
--

CREATE TABLE IF NOT EXISTS `diggable_costume` (
  `costume_id` int(11) NOT NULL,
  `lower_chance` float NOT NULL,
  `higher_chance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `diggable_item`
--

CREATE TABLE IF NOT EXISTS `diggable_item` (
  `world_item_id` int(11) NOT NULL,
  `lower_chance` float NOT NULL,
  `higher_chance` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `emoticon`
--

CREATE TABLE IF NOT EXISTS `emoticon` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emoticon`
--

INSERT INTO `emoticon` (`id`, `name`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`, `description`) VALUES
(1, 'Apaixonado', 'emoticon-odxE1j', 0, '1apaixonado', '1apaixonado', ''),
(2, 'Assustado', 'emoticon-lNC11i', 0, '2assustado', '2assustado', ''),
(3, 'Banco', 'emoticon-1D8oO2', 0, '3banco', '3banco', ''),
(4, 'Bike', 'emoticon-O5Vp60', 0, '4bike', '4bike', ''),
(5, 'Boto', 'emoticon-WThnuZ', 0, '5boto', '5boto', ''),
(6, 'Cansado', 'emoticon-tcIwdR', 0, 'cansado', 'cansado', ''),
(7, 'Com raiva', 'emoticon-jMEIFC', 0, 'com raiva', 'com raiva', ''),
(8, 'Com vergonha', 'emoticon-eICtwx', 0, 'com vergonha', 'com vergonha', ''),
(9, 'Com fome', 'emoticon-JeBly7', 0, 'comfome', 'comfome', ''),
(10, 'Coração', 'emoticon-07w53O', 0, 'coracao', 'coracao', ''),
(11, 'De boa', 'emoticon-Dqxqu7', 0, 'deboa', 'deboa', ''),
(12, 'Dinheiro', 'emoticon-Gj0HGL', 0, 'dinheiro', 'dinheiro', ''),
(13, 'Et', 'emoticon-5pu1t0', 0, 'et', 'et', ''),
(14, 'Feliz', 'emoticon-sum2rA', 0, 'feliz', 'feliz', ''),
(15, 'Hospital', 'emoticon-dmsapy', 0, 'hospital', 'hospital', ''),
(16, 'Jetpack', 'emoticon-jXnOFy', 0, 'jetpack', 'jetpack', ''),
(17, 'Curti', 'emoticon-AQiZia', 0, 'like', 'like', ''),
(18, 'Lobisomem', 'emoticon-ne6ZqR', 0, 'lobisomem', 'lobisomem', ''),
(19, 'Lua', 'emoticon-eV9QnQ', 0, 'lua', 'lua', ''),
(20, 'Mula sem cabeça', 'emoticon-pQln2b', 0, 'mula', 'mula', ''),
(21, 'Mumia', 'emoticon-mg3eWs', 0, 'mumia', 'mumia', ''),
(22, 'Nervoso', 'emoticon-bcpRIq', 0, 'munervoso', 'munervoso', ''),
(23, 'Polícia', 'emoticon-WSG9gd', 0, '23policia', '23policia', ''),
(24, 'Prédio', 'emoticon-46i26H', 0, 'predio', 'predio', ''),
(25, 'Sereia', 'emoticon-oDVP3B', 0, 'sereia', 'sereia', ''),
(26, 'Skate', 'emoticon-tpH2DR', 0, 'skate', 'skate', ''),
(27, 'Sol', 'emoticon-TpSNLl', 0, 'sol', 'sol', ''),
(28, 'Triste', 'emoticon-dW3fSI', 0, 'triste', 'triste', ''),
(29, 'Unicórnio', 'emoticon-ms14TY', 0, 'unicornio', 'unicornio', ''),
(30, 'Zumbi', 'emoticon-JpoOSk', 0, 'zumbi', 'zumbi', ''),
(31, 'Chorando', 'emoticon-MKLLEQ', 0, 'chorando', 'chorando', ''),
(32, 'Casa', 'emoticon-u4XBvt', 0, 'casa', 'casa', ''),
(33, 'Carro', 'emoticon-wRzCLE', 0, 'carro', 'carro', '');

-- --------------------------------------------------------

--
-- Table structure for table `facial_feature`
--

CREATE TABLE IF NOT EXISTS `facial_feature` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `facial_feature_type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facial_feature`
--

INSERT INTO `facial_feature` (`id`, `name`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`, `description`, `facial_feature_type`) VALUES
(21, 'Boca', 'facial_feature-E8ob0S', 0, 'boca_01', '01', '', 'mouth'),
(22, 'Boca', 'facial_feature-zXLF0Z', 0, 'boca_02', '02', '', 'mouth'),
(23, 'Boca', 'facial_feature-U0Fjk0', 0, 'boca_03', '03', '', 'mouth'),
(24, 'Boca', 'facial_feature-kAPDgA', 0, 'boca_04', '04', '', 'mouth'),
(25, 'Boca', 'facial_feature-WGiqDl', 0, 'boca_05', '05', '', 'mouth'),
(26, 'Boca', 'facial_feature-K31AnW', 0, 'boca_06', '06', '', 'mouth'),
(27, 'Boca', 'facial_feature-qwAx7h', 0, 'boca_07', '07', '', 'mouth'),
(28, 'Boca', 'facial_feature-QBwUnA', 0, 'boca_08', '08', '', 'mouth'),
(29, 'Boca', 'facial_feature-sO9kRb', 0, 'boca_09', '09', '', 'mouth'),
(30, 'Boca', 'facial_feature-wAxJPn', 0, 'boca_10', '10', '', 'mouth'),
(31, 'Boca', 'facial_feature-QeGL0Z', 0, 'boca_11', '11', '', 'mouth'),
(32, 'Olho', 'facial_feature-Dkea12', 0, 'olho_01', 'olho_01i', '', 'eye'),
(33, 'Olho', 'facial_feature-efEznh', 0, 'olho_03', 'olho_03i', '', 'eye'),
(34, 'Olho', 'facial_feature-poh7nS', 0, 'olho_05', 'olho_05i', '', 'eye'),
(35, 'Olho', 'facial_feature-1MuOG3', 0, 'olho_09', 'olho_09i', '', 'eye'),
(36, 'Olho', 'facial_feature-lZf1lq', 0, 'olho_11', 'olho_11i', '', 'eye'),
(37, 'Olho', 'facial_feature-9ge04P', 0, 'olho_13', 'olho_13i', '', 'eye'),
(38, 'Olho', 'facial_feature-2mexQG', 0, 'olho_15', 'olho_15i', '', 'eye'),
(39, 'Olho', 'facial_feature-w8WtoT', 0, 'olho_17', 'olho_17i', '', 'eye'),
(40, 'Olho', 'facial_feature-8FBaCs', 0, 'olho_19', 'olho_19i', '', 'eye');

-- --------------------------------------------------------

--
-- Table structure for table `facial_feature_type`
--

CREATE TABLE IF NOT EXISTS `facial_feature_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `facial_feature_type`
--

INSERT INTO `facial_feature_type` (`type`) VALUES
('eye'),
('mouth'),
('nose');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_npc`
--

CREATE TABLE IF NOT EXISTS `fixed_npc` (
`id` int(11) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `portrait_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `default_text` text NOT NULL,
  `background_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fixed_npc`
--

INSERT INTO `fixed_npc` (`id`, `bundle_url`, `bundle_version`, `model_name`, `portrait_name`, `name`, `default_text`, `background_name`) VALUES
(1, 'fixed_npc-JHXFPL', 0, '_go_Hospede', 'novos_falando1151', 'Hóspede', '', 'fundo_hospede'),
(9, 'fixed_npc-G4r1', 0, 'go gari', 'falando2070', 'Gari', '', 'gari bg'),
(12, 'fixed_npc-x4nzkh', 0, 'go lojista', 'falando3910', 'Lojista', '', 'lojista bg'),
(14, 'fixed_npc-UbjxiF', 0, 'go executivo', 'falando0690', 'Executivo', '', 'executivo bg'),
(19, 'fixed_npc-o3J8dd', 0, 'go surfista', 'falando2530', 'Surfista 2', '', 'surfista bg'),
(20, 'fixed_npc-1IYXEn', 0, 'go mensageiro', 'novos_falando0231', 'Mensageiro do Hotel', '', 'mensageiro bg'),
(21, 'fixed_npc-UEGDsC', 0, 'go prefeito', 'novos_falando0461', 'Prefeito', '', 'prefeito bg'),
(22, 'fixed_npc-a38mwx', 0, 'go medico', 'falando2300', 'Médico', '', 'medico bg'),
(23, 'fixed_npc-C8Hl6k', 0, 'go lobisomem', 'falando3450', 'Lobisomem', '', 'lobisomem bg'),
(27, 'fixed_npc-Z1GR78', 0, 'go menino', 'falando460', 'Menino', '', 'menino bg'),
(60, 'fixed_npc-eNN7Zw', 0, 'go professor', 'falando0920', 'Professor', '', 'professor'),
(61, 'fixed_npc-0UQxmh', 0, 'go mecanico', 'falando0001', 'Mecânico', '', 'mecanico bg'),
(62, 'fixed_npc-EjDnyx', 0, 'go policial', 'falando0001', 'Policial', '', 'policial bg'),
(63, 'fixed_npc-FRmccW', 0, 'go Menina', 'falando4370', 'Menina', '', 'meninabg'),
(64, 'fixed_npc-mQVt6v', 0, 'go mumia', 'falando2990', 'Mumia', '', 'mumiabg'),
(65, 'fixed_npc-UEGDsB', 0, 'go zumbi', 'falando3220', 'Zumbi', '', 'zumbiBg'),
(66, 'fixed_npc-64rlvu', 0, 'go mestre de obras', 'falando0231', 'Mestre de Obras', '', 'mestre de obras bg'),
(67, 'fixed_npc-i78XJP', 0, 'go mimico', 'falando1380', 'Mímico', '', 'mimico bg'),
(68, 'fixed_npc-q3HwQ1', 0, 'go malabarista', 'malabarista_falando0001', 'Malabarista', '', 'bg malabarista'),
(69, 'fixed_npc-ELAwk1', 0, 'go cozinheira', 'novos_falando0001', 'Cozinheira', '', 'cozinheira bg'),
(70, 'fixed_npc-kYsPqe', 0, 'go cidada', 'novos_falando0921', 'Cidadã', '', 'cidada bg'),
(71, 'fixed_npc-2mpfO7', 0, 'go enfermeira', 'falando3680', 'Enfermeira', '', 'enfermeira bg'),
(72, 'fixed_npc-L0j1st4', 0, 'go lojista gripada', 'novos_falando1381', 'Lojista Gripada', '', 'lojista gripada bg'),
(73, 'fixed_npc-Un1C0rN', 0, 'go unicornio', 'unicornio0109', 'Unicórnio', '', 'unicornio bg'),
(74, 'fixed_npc-Cr0ck3r', 0, 'go fada', 'falando4140', 'Fada', '', 'fada bg'),
(76, 'fixed_npc-q3HwQ2', 0, 'go bombeiro', 'falando1610', 'Bombeiro', '', 'bombeiro bg');

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `scene_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `status_text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `scene_name`, `icon_name`, `status_text`) VALUES
(1, 'No Trilho do Trem', '', '_gerenciamentoenergiabundle', 0, 'TrainGame', '', 'Jogando no Trilho do Trem!'),
(2, 'Em Cima da Faixa', '', '_emcimadafaixa', 0, 'EmCimaDaFaixa', '', 'Jogando Em Cima da Faixa!'),
(3, 'Obstakulos', '', '_Obstakulos.unity3d', 0, 'Obstakulos', '', 'Jogando Obstakulos!'),
(4, 'Batalha dos Mitos', '', '_FolcloreBundle', 0, 'Folclore', '', 'Jogando Batalha dos Mitos!'),
(5, 'Mordix', '', 'mordix', 0, 'Mordix', '', 'Jogando Mordix!'),
(6, 'Em Apuros', '', '_emApuros', 0, 'Em Apuros', '', 'Jogando Em Apuros!');

-- --------------------------------------------------------

--
-- Table structure for table `game_player_data`
--

CREATE TABLE IF NOT EXISTS `game_player_data` (
  `player_id` int(11) NOT NULL,
  `game_id` int(11) NOT NULL,
  `data` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game_player_data`
--

INSERT INTO `game_player_data` (`player_id`, `game_id`, `data`) VALUES
(4, 5, '2:0:0:0:0:0:2:0:0:0:0:3');

-- --------------------------------------------------------

--
-- Table structure for table `game_ranking`
--

CREATE TABLE IF NOT EXISTS `game_ranking` (
  `game_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `ranking_id` int(11) NOT NULL DEFAULT '1',
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game_ranking`
--

INSERT INTO `game_ranking` (`game_id`, `player_id`, `ranking_id`, `score`) VALUES
(6, 4, 0, 92);

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

CREATE TABLE IF NOT EXISTS `gift` (
`id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `gift_card_id` int(11) DEFAULT NULL,
  `headpiece_id` int(11) DEFAULT NULL,
  `hair_id` int(11) DEFAULT NULL,
  `cloth_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `costume_id` int(11) DEFAULT NULL,
  `recipient_read` int(11) NOT NULL DEFAULT '0' COMMENT '0 for false, 1 for true',
  `sent_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Perhaps "user_inbox" would be a better name';

-- --------------------------------------------------------

--
-- Table structure for table `gift_card`
--

CREATE TABLE IF NOT EXISTS `gift_card` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gift_card`
--

INSERT INTO `gift_card` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`, `price`, `unlock_level`) VALUES
(1, 'Você completou a missão?', '', 'gift_card-jB3WFv', 0, 'card_01_v2', 'card_01_v2_icon', 5, 0),
(2, 'Espero você para jogar', '', 'gift_card-C0Pt6R', 0, 'card_02_v2', 'card_02_v2_icon', 10, 0),
(3, 'Você é show', '', 'gift_card-ADoMF9', 0, 'card_03_v2', 'card_03_v2_icon', 15, 0),
(4, 'Saudades!', '', 'gift_card-vRAfLH', 0, 'card_04_v3', 'card_04_v3_icon', 15, 0),
(5, 'Valeu pela ajuda!', '', 'gift_card-GfHKfl', 0, 'card_05_v3', 'card_05_v3_icon', 15, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hair`
--

CREATE TABLE IF NOT EXISTS `hair` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hair`
--

INSERT INTO `hair` (`id`, `name`, `bundle_url`, `bundle_version`, `model_name`, `icon_name`, `description`, `price`, `unlock_level`) VALUES
(1, 'Cabelo', 'hair-2IC9J3', 0, 'Especial_01g', 'Especial_01i', '', 0, -1),
(2, 'Cabelo', 'hair-zcd2LS', 0, 'Especial_02g', 'Especial_02i', '', 0, -1),
(3, 'Cabelo', 'hair-T0rPXo', 0, 'Especial_03g', 'Especial_03i', '', 0, -1),
(4, 'Cabelo', 'hair-5a0QwO', 0, 'Menina_01g', 'Menina_01i', '', 0, -1),
(5, 'Cabelo', 'hair-2xDeP7', 0, 'Menina_02g', 'Menina_02i', '', 0, -1),
(6, 'Cabelo', 'hair-ZbZRPo', 0, 'Menina_03g', 'Menina_03i', '', 0, -1),
(7, 'Cabelo', 'hair-FyIQoc', 0, 'Menina_04g', 'Menina_04i', '', 0, -1),
(8, 'Cabelo', 'hair-Qlf8pd', 0, 'Menino_01g', 'Menino_01i', '', 0, -1),
(9, 'Cabelo', 'hair-yHmL1Z', 0, 'Menino_02g', 'Menino_02i', '', 0, -1),
(10, 'Cabelo', 'hair-USRJIk', 0, 'Menino_03g', 'Menino_03i', '', 0, -1);

-- --------------------------------------------------------

--
-- Table structure for table `headpiece`
--

CREATE TABLE IF NOT EXISTS `headpiece` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `hides_hair` int(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `headpiece`
--

INSERT INTO `headpiece` (`id`, `name`, `bundle_url`, `bundle_version`, `model_name`, `icon_name`, `description`, `price`, `unlock_level`, `hides_hair`) VALUES
(1, 'Boné', 'headpiece-MBTOGa', 0, 'Bone_g', 'bonnet i', '', 0, -1, 1),
(2, 'Capacete de Abóbora', 'headpiece-R4mBnI', 0, 'Capacete_Abobora_g', 'Capacete_Abobora_i', '', 0, -1, 1),
(3, 'Capacete de Bike', 'headpiece-OPsXGx', 0, 'Capacete_Bike_g', 'Capacete_Bike_i', '', 0, -1, 1),
(4, 'Capacete Espacial', 'headpiece-ShdQlz', 0, 'Capacete_Espacial_g', 'Capacete_Espacial_i', '', 0, -1, 1),
(5, 'Chapeu', 'headpiece-wwZCF1', 0, 'Chapeu_Cowboy_g', 'Chapeu_Cowboy_i', '', 0, -1, 1),
(6, 'Fones de Ouvido', 'headpiece-gjYIFL', 0, 'Fones_Ouvido_g', 'Fones_Ouvido_i', '', 0, -1, 0),
(7, 'Óculos', 'headpiece-CEwlVx', 0, 'Oculos_g', 'Oculos_i', '', 0, -1, 0),
(8, 'Snorkel', 'headpiece-fEjLXC', 0, 'Snorkel_g', 'Snorkel_i', '', 0, -1, 0),
(9, 'Chapeu de sorvete', 'headpiece-8opGae', 0, 'Sorvete_g', 'Sorvete_i', '', 0, -1, 1),
(10, 'Tiara brilhante', 'headpiece-kQlz1D', 0, 'Tiara_Brilhante_g', 'Tiara_Brilhante_i', '', 0, -1, 0),
(11, 'Tiara de Coelho', 'headpiece-3fSkoJ', 0, 'Tiara_Coelho_g', 'Tiara_Coelho_i', '', 0, -1, 0),
(12, 'Tiara de Flores', 'headpiece-dAhwrz', 0, 'Tiara_Flores_g', 'Tiara_Flores_i', '', 0, -1, 0),
(13, 'Laço de cabelo', 'headpiece-7BfoM4', 0, 'Tiara_Laco_g', 'Tiara_Laco_i', '', 0, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
`id` int(11) NOT NULL,
  `item_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `item_type`, `name`, `bundle_url`, `bundle_version`, `model_name`, `icon_name`, `description`, `price`, `unlock_level`) VALUES
(1, 'bicycle', 'Bicicleta', 'item-jg9x2u', 0, 'go bicicleta', 'bicicleta icone', '', 200, 0),
(2, 'hoverskate', 'Skate Voador Vermelho', 'item-ZBXhCy', 0, 'go skate_voador_vermelho', 'skatevermelhoi', '', 150, 10),
(3, 'hoverskate', 'Skate Voador Azul', 'item-ETer4I', 0, 'go skate_voador_azul', 'skateazuli', '', 150, 10),
(4, 'hoverskate', 'Skate Voador Amarelo', 'item-PlykPk', 0, 'go skate_voador_amarelo', 'skateamareloi', '', 150, 10),
(5, 'flyingcarpet', 'Tapete Voador Azul', 'item-pJWjKN', 0, 'go tapete_voador azul', 'tapete azul i', '', 50, 5),
(6, 'flyingcarpet', 'Tapete Voador Roxo', 'item-vxUaXX', 0, 'go tapete_voador roxo', 'tapete roxoi', '', 50, 5),
(7, 'flyingcarpet', 'Tapete Voador Verde', 'item-a7z4AT', 0, 'go tapete_voador verde', 'tapete verde i', '', 50, 5),
(8, 'seg', 'Seg', 'item-TyBRB2', 0, 'go Seg', 'segi', '', 50, 7);

-- --------------------------------------------------------

--
-- Table structure for table `item_type`
--

CREATE TABLE IF NOT EXISTS `item_type` (
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item_type`
--

INSERT INTO `item_type` (`type`) VALUES
('bicycle'),
('flyingcarpet'),
('hoverskate'),
('jetpack'),
('seg');

-- --------------------------------------------------------

--
-- Table structure for table `letter`
--

CREATE TABLE IF NOT EXISTS `letter` (
`id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `gift_card_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nose`
--

CREATE TABLE IF NOT EXISTS `nose` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `unlock_level` int(11) NOT NULL,
  `uses_skin` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nose`
--

INSERT INTO `nose` (`id`, `name`, `bundle_url`, `bundle_version`, `model_name`, `icon_name`, `description`, `price`, `unlock_level`, `uses_skin`) VALUES
(11, 'Nariz Porco', 'nose-Mvuf3i', 0, 'gnariz_01_g', 'gnariz_01i', '', 0, 0, 0),
(12, 'Nariz', 'nose-YaBojR', 0, 'gnariz_02_g', 'gnariz_02i', '', 0, 0, 0),
(14, 'Nariz Coelho', 'nose-EntLVX', 0, 'gnariz_04_g', 'gnariz_04i', '', 0, 0, 0),
(15, 'Nariz', 'nose-5Or6So', 0, 'gnariz_05_g', 'gnariz_05i', '', 0, 0, 0),
(16, 'Nariz', 'nose-ei001r', 0, 'gnariz_06_g', 'gnariz_06i', '', 0, 0, 0),
(17, 'Nariz', 'nose-Be8MaT', 0, 'gnariz_07_g', 'gnariz_07i', '', 0, 0, 0),
(18, 'Nariz', 'nose-x7hEK5', 0, 'gnariz_08_g', 'gnariz_08i', '', 0, 0, 0),
(19, 'Nariz', 'nose-QZ4j8X', 0, 'gnariz_09_g', 'gnariz_09i', '', 0, 0, 0),
(20, 'Nariz', 'nose-jh7uHT', 0, 'gnariz_10_g', 'gnariz_10i', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE IF NOT EXISTS `parent` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  `user_hash` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `email`, `password`, `salt`, `user_hash`) VALUES
(1, 'arthur@farofastudios.com.br', '8e1f2e4216ba0816489787b4889410050981e9a8742060cb70f7d1e7190d4254', '361b406ef0fbfe54583be8ce0d3f8596dfdbd3a6ab23d24bf52e130e16c8b05f', '70238cf946278bb486eb67473d67963322847f866ca2a32745c6a335fc567d02'),
(2, 'hue@br.com.br', '717c1f722c151af3f3810e2f9bb3c38ece9d9fe0ed54a56f99813282eda825b7', 'e8e9a36fea2c5d17711fefebb256b84ce63a512703b1e5e07083b8067b2e0e22', '2c0dc2648d61a22f5bf94c55f492ae59c244d8e229d4be5ea33148333c3eea9a'),
(3, 'farofa6@br.com.br', 'a16351149e51585cabe3b29e024144890ae856a358f0e5f618b684dcbc5d52a4', 'c8e320cbc30b4ac14fb4d75ac5536516c834bbc51ee5f7ab29920841036d2217', '3991ae9040cd0dc8fdb3ed60c74b7d73c9eddd3c5b60da633a503fd9453f07be'),
(6, 'bruno@hotmail.com', 'ac488e765212b46ac0d6d52b688093dc649007cf47c496b4c3d07536a509bcdd', '9c47e0bdc2660adfbab3b74674b40bb04989f9b4b3aa93767482f79067b1f41a', '43e0e664f3aee29e05729f0fa926f3cb1a7ae04713cfc94ef9602d8d256c6567'),
(7, '96cd9c792e4a7fbf@cbcfba7668fde88c.com', '8f9a2da12dc1a1861204ec363aa6339e0a8cb89a4177fa4575d5349e4297d450', '646c0894179ef494101673cd03eabcaea2fdac15283e1628ac7678d8b9823a4a', 'abdfa7ebf443ad1a414120672b5eb43031227d983e503f94b4299072d6f2cf56'),
(8, 'd05718b85c49db60@528db9a0c7132aa1.com', '400e3b9c3918a59aa0b983772cb3ece4c12dfc293fbac5ce3aa3824fde5f5502', '982211be8d820c0597528c7cc3a3ba7b12cfaea5ea306d784817db0b924fbeb3', 'b6799be58fab02c6696ec8201e347667d524b52a9115bf540ea03efddb4556b9'),
(9, 'lucas@farofastudios.com.br', '936bd1a09c65693cfee3843b0f6cd912b8f7f9748d3be2f214a6e170c47a93fa', '318796676c3733f4693f860d45d6e8d0fb9e207a3df95a9bf7054f2b4de7850c', 'df08c26c9ced5ab0f28b5dbeba3528b9357c4ab2315fa215bd0fcb06797e5cce');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE IF NOT EXISTS `player` (
`id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `user_hash` varchar(255) NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `player_icon_id` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `experience` int(11) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `first_login` int(11) NOT NULL DEFAULT '1',
  `moderator` int(11) NOT NULL DEFAULT '0' COMMENT 'Leave this as 0 for normal players',
  `created_at` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `temporary` int(11) NOT NULL COMMENT '0 for false, 1 for true',
  `deleted` int(11) NOT NULL COMMENT '0 for normal character, 1 for characters deleted by their parents'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `parent_id`, `gender`, `login`, `password`, `salt`, `user_hash`, `screen_name`, `player_icon_id`, `age`, `experience`, `money`, `first_login`, `moderator`, `created_at`, `last_login`, `temporary`, `deleted`) VALUES
(1, 1, 2, 'cafe milton neves', '2687a96596c1cadab41bbbbdc87fece4ba9398cfeab9856db0a957e2594d6672', '897b17855aa9d06ae6d5163ccd40c961fb3b4980a37c5a1733f64b8ae1cf1109', '2bcc0d169d8a305d58b48b4475c29d9a917d8af6d92f52c6c08bd1b463a19623', 'Lol', 30, 119, 90, 5980, 0, 0, '2015-03-30 19:56:31', '2015-04-07 19:17:32', 0, 0),
(2, 2, 0, 'huebr', 'e00bc43effbe9bead3a65571614ed5967ce559d4eacf15d407e7618408a93098', 'd3de71600441ba2d594449359f306d991455ed8def48dc981792bc36be224efd', '94cd008c39b0fb014c4cf9be48454b3e14cea6f3e6766d6fe4bc46f933ee3719', 'Huehuehue', 26, 12, 2730, 5408, 0, 0, '2015-03-31 10:08:06', '2015-04-07 11:25:04', 0, 0),
(3, 3, 0, 'farofa666', 'c4a7f5c85b033aea58f941a3a07a1a0a7cf6163f340c54d1ab4e5ec03ba39d64', 'f011898f20916f966e7926e1489ce9195b9e04d25e68dc87e9a474480c541ed2', 'c09551449e9f807bb0e2be7c01dc97900f11c4a21bb2ca068c6380bc2dec796f', 'laurete', 35, 29, 0, 6000, 0, 0, '2015-03-31 16:03:11', '2015-04-10 15:09:35', 0, 0),
(4, 6, 0, 'bruno', '54d77447eab74fcf25aac91f515105711b8c5ad3118f2f9481124142de9d8c39', '3243c4cad46bcafc7673f57b8b8a201c53864e091dd5771ae47f14a897c86499', 'b9d48a147f3a77fc16bd135e967a16e5eb59e7f726229fcec2e851c83186e310', 'BrunoKaku', 30, 5, 2340, 5673, 0, 0, '2015-04-06 17:24:58', '2015-04-10 19:26:14', 0, 0),
(5, 6, 0, 'bruno2', '2034b7a206b59d1a4939016aa151f208dc0d2fb717a408448a8db96e105643b6', '964a8b9c4da02be7b637f85e5b42a322a9b16d04898e79248467bd315820a01f', 'b678d7bb67764e8d8b758282f375623934cc9d39e029a914ad39fa0d49e022be', 'BrunoDois', 1, 6, 1290, 5873, 0, 0, '2015-04-06 18:25:54', '2015-04-07 14:31:06', 0, 0),
(6, 1, 0, 'Bartolomeu Schwartzmann', 'c536fd1b703c3b495929f5a0a4147317ca72be987e3d9171d3a635510df0ef75', '593eef1c804029b4491796e90ef5510bc6920e2ca0b8b62fd13c77a7d3f6b327', 'a0011ed75ec036ae6b39377ba9427367c2ab829c500c2db21a5920c401cf1bdd', '', 1, 69, 0, 6000, 1, 0, '2015-04-09 16:41:36', '2015-04-09 16:41:36', 0, 0),
(7, 1, 0, 'ximbinha', '4f09d596a57e9d329ce316b3959eef4d577e2e06f062efca822dbf6a2775b7f5', '15bd022863e12525051cc145886840440ede756397adfd475359e63dc7dd5187', 'bb5718c373b657cedf59657e48c9238d04afde335a7f84e20ebc959e5d6aa2c6', '', 1, 69, 0, 6000, 1, 0, '2015-04-09 16:44:46', '2015-04-09 18:25:39', 0, 0),
(8, 7, 2, '[Visistante]a5bc5b7accd94db5', 'afc82484cfee49c2c11ddaec15cbb18051971cfade92715b772be16bad0e2244', 'bd651c37f23a7c0ee9d100facf860033828d2e7b6b11083d893caeeb04f35aad', 'aaab5c02885beb9d7de077601693cb608bfac0f02e78b48697fac18a8c61cf9b', '', 1, 0, 0, 6000, 1, 0, '2015-07-06 19:17:29', '2015-07-06 19:17:29', 0, 0),
(9, 8, 2, '[Visistante]e9dee572248934f0', '1e377ae3148de0ff3c0003ad75f2a425f8e1d35a772a64be1dd3f66d646844e8', '8261c8cf4a26f5fe4cfdc77bdf6ab037303fb9cce6315f112c8ff914a81df1a7', '6f699c41a5d327ab2b482ce1fe163e58614688982103939a2cfc33c758f31829', '', 1, 0, 0, 6000, 1, 0, '2015-07-06 19:18:48', '2015-07-06 19:18:48', 0, 0),
(10, 9, 0, 'Lucas', '7d56f50c56fd38cfe91c4e99904780ac093d110da8733c84a9c57336b999f71b', '40a9697e23dadfbfe5a1129f6d78f3e7bc0bc79aea15a334fd2099eca7f69cef', 'aa3785cca6a78ca3dfbc7e1ffafbe6b3b94afdd283c6c86c1d3fbeb9e0f62124', 'asdsa', 1, 12, 210, 5848, 0, 0, '2015-07-06 19:24:29', '2015-07-13 15:13:15', 0, 0),
(11, 9, 0, 'Lucas Bittencourt de Souza', '31780474e87df637372cf6ddbb47e96d5151c309c5eda88b8ce3aa8d8c8b8d77', '7c94fd6ef4694cb29052575822d160e87a7276b5dd726d5ac33ce31522914bea', '11296b077a00aed9330e92e42b8a92c82f7c7c320a4ce9b0b5f47417a06a67af', '', 1, 10, 0, 6000, 1, 0, '2015-08-19 20:21:23', '2015-08-19 20:21:23', 0, 0);

--
-- Triggers `player`
--
DELIMITER //
CREATE TRIGGER `Tutorial Money` BEFORE INSERT ON `player`
 FOR EACH ROW SET NEW.money = 6000
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `player_accessory`
--

CREATE TABLE IF NOT EXISTS `player_accessory` (
  `player_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_accessory`
--

INSERT INTO `player_accessory` (`player_id`, `accessory_id`) VALUES
(2, 1),
(1, 16),
(10, 16),
(4, 19),
(5, 21),
(5, 22),
(2, 23),
(10, 23),
(1, 24),
(3, 26),
(4, 27);

-- --------------------------------------------------------

--
-- Table structure for table `player_building`
--

CREATE TABLE IF NOT EXISTS `player_building` (
`id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL,
  `building_model_id` int(11) NOT NULL,
  `building_model_texture_id` int(11) NOT NULL,
  `protected` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `construction_start_time` datetime NOT NULL,
  `last_time_collected` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_building`
--

INSERT INTO `player_building` (`id`, `player_id`, `building_id`, `building_model_id`, `building_model_texture_id`, `protected`, `slot`, `construction_start_time`, `last_time_collected`) VALUES
(1, 1, 1, 41, 55, 0, 2, '2015-03-30 20:06:24', '2015-03-30 20:06:24'),
(2, 2, 1, 41, 55, 0, 2, '2015-04-02 12:01:55', '2015-04-02 12:01:55'),
(3, 2, 98, 81, 119, 0, 455, '2015-04-02 12:02:07', '2015-04-02 12:02:07'),
(4, 2, 91, 51, 71, 0, 900, '2015-04-02 12:02:21', '2015-04-02 12:02:21'),
(5, 2, 65, 43, 58, 0, 901, '2015-04-02 12:02:27', '2015-04-02 12:02:27'),
(7, 2, 1, 41, 55, 0, 358, '2015-04-02 12:02:52', '2015-04-02 12:02:52'),
(8, 2, 1, 41, 55, 0, 356, '2015-04-02 12:03:05', '2015-04-02 12:03:05'),
(9, 2, 1, 41, 55, 0, 104, '2015-04-02 12:03:12', '2015-04-02 12:03:12'),
(10, 2, 1, 41, 55, 0, 507, '2015-04-02 12:03:16', '2015-04-02 12:03:16'),
(11, 2, 1, 41, 55, 0, 391, '2015-04-02 12:03:21', '2015-04-02 12:03:21'),
(12, 2, 1, 41, 55, 0, 244, '2015-04-02 12:03:27', '2015-04-02 12:03:27'),
(13, 2, 85, 47, 65, 0, 184, '2015-04-02 12:03:34', '2015-04-02 12:03:34'),
(14, 2, 5, 52, 79, 0, 242, '2015-04-02 12:03:42', '2015-04-02 14:16:36'),
(15, 2, 99, 82, 118, 0, 205, '2015-04-02 12:04:00', '2015-04-02 12:04:00'),
(16, 2, 68, 44, 59, 0, 520, '2015-04-02 12:04:12', '2015-04-02 12:04:12'),
(17, 2, 22, 76, 109, 0, 606, '2015-04-02 12:04:35', '2015-04-02 12:04:35'),
(18, 2, 3, 46, 62, 0, 199, '2015-04-02 12:04:49', '2015-04-02 12:04:49'),
(19, 2, 9, 55, 69, 0, 41, '2015-04-02 12:04:57', '2015-04-02 12:04:57'),
(20, 2, 10, 50, 63, 0, 457, '2015-04-02 12:05:03', '2015-04-02 12:05:03'),
(21, 2, 17, 66, 102, 0, 604, '2015-04-02 12:05:11', '2015-04-02 12:05:11'),
(22, 2, 18, 67, 103, 0, 417, '2015-04-02 12:05:24', '2015-04-02 12:05:24'),
(23, 2, 1, 41, 55, 0, 307, '2015-04-02 12:05:33', '2015-04-02 12:05:33'),
(24, 2, 1, 41, 55, 0, 493, '2015-04-02 12:05:38', '2015-04-02 12:05:38'),
(25, 2, 1, 41, 55, 0, 13, '2015-04-02 12:05:43', '2015-04-02 12:05:43'),
(26, 2, 1, 41, 55, 0, 96, '2015-04-02 12:05:47', '2015-04-02 12:05:47'),
(27, 2, 1, 41, 55, 0, 473, '2015-04-02 12:05:51', '2015-04-02 12:05:51'),
(28, 2, 1, 41, 55, 0, 37, '2015-04-02 12:05:55', '2015-04-02 12:05:55'),
(29, 2, 1, 41, 55, 0, 266, '2015-04-02 12:05:59', '2015-04-02 12:05:59'),
(30, 2, 1, 41, 55, 0, 566, '2015-04-02 12:06:03', '2015-04-02 12:06:03'),
(31, 2, 1, 41, 55, 0, 482, '2015-04-02 12:06:07', '2015-04-02 12:06:07'),
(32, 2, 1, 41, 55, 0, 557, '2015-04-02 12:06:12', '2015-04-02 12:06:12'),
(33, 2, 1, 41, 56, 0, 129, '2015-04-02 12:06:18', '2015-04-02 12:06:18'),
(34, 2, 1, 41, 110, 0, 208, '2015-04-02 12:06:24', '2015-04-02 12:06:24'),
(35, 2, 1, 41, 112, 0, 369, '2015-04-02 12:06:33', '2015-04-02 12:06:33'),
(36, 2, 1, 41, 111, 0, 535, '2015-04-02 12:06:42', '2015-04-02 12:06:42'),
(37, 2, 1, 41, 56, 0, 59, '2015-04-02 12:06:48', '2015-04-02 12:06:48'),
(38, 2, 1, 41, 112, 0, 227, '2015-04-02 12:06:55', '2015-04-02 12:06:55'),
(39, 2, 1, 41, 110, 0, 524, '2015-04-02 12:07:00', '2015-04-02 12:07:00'),
(40, 2, 8, 54, 68, 0, 483, '2015-04-02 12:07:20', '2015-04-02 12:07:20'),
(41, 2, 1, 41, 55, 0, 301, '2015-04-02 12:07:25', '2015-04-02 12:07:25'),
(42, 2, 23, 77, 113, 0, 411, '2015-04-02 12:07:32', '2015-04-02 12:07:32'),
(43, 2, 100, 84, 121, 0, 158, '2015-04-02 12:08:23', '2015-04-02 12:08:23'),
(44, 2, 101, 85, 122, 0, 106, '2015-04-02 12:08:31', '2015-04-02 12:08:31'),
(45, 2, 80, 80, 116, 0, 628, '2015-04-02 12:08:43', '2015-04-02 12:08:43'),
(46, 2, 10, 50, 63, 0, 340, '2015-04-02 12:09:03', '2015-04-02 12:09:03'),
(47, 2, 6, 53, 67, 0, 433, '2015-04-02 12:11:55', '2015-04-02 12:11:55'),
(48, 2, 12, 57, 72, 0, 339, '2015-04-02 15:27:53', '2015-04-02 15:27:53'),
(49, 2, 14, 59, 75, 0, 142, '2015-04-02 19:54:26', '2015-04-02 19:54:26'),
(50, 2, 1, 41, 55, 0, 322, '2015-04-02 19:54:30', '2015-04-02 19:54:30'),
(51, 2, 1, 41, 55, 0, 71, '2015-04-02 19:54:35', '2015-04-02 19:54:35'),
(52, 2, 1, 41, 55, 0, 495, '2015-04-02 19:54:40', '2015-04-02 19:54:40'),
(53, 2, 96, 75, 108, 0, 585, '2015-04-06 17:01:54', '2015-04-06 17:01:54'),
(54, 4, 13, 61, 80, 0, 482, '2015-04-10 15:40:22', '2015-04-10 15:40:22'),
(55, 4, 90, 45, 61, 0, 242, '2015-04-06 17:49:16', '2015-04-10 16:35:18'),
(56, 4, 65, 43, 58, 0, 900, '2015-04-06 17:49:40', '2015-04-06 17:49:40'),
(57, 4, 93, 72, 105, 0, 609, '2015-04-06 17:50:46', '2015-04-06 17:50:46'),
(58, 4, 98, 81, 119, 0, 455, '2015-04-06 17:51:11', '2015-04-06 17:51:11'),
(59, 4, 8, 54, 68, 0, 340, '2015-04-06 17:51:20', '2015-04-06 17:51:20'),
(60, 4, 1, 41, 55, 0, 374, '2015-04-06 17:54:41', '2015-04-06 17:54:41'),
(61, 4, 1, 41, 55, 0, 135, '2015-04-06 17:54:56', '2015-04-06 17:54:56'),
(62, 4, 1, 41, 55, 0, 341, '2015-04-06 17:55:01', '2015-04-06 17:55:01'),
(63, 4, 1, 41, 55, 0, 616, '2015-04-06 17:55:06', '2015-04-06 17:55:06'),
(64, 4, 85, 47, 65, 0, 106, '2015-04-06 17:55:22', '2015-04-06 17:55:22'),
(65, 4, 13, 61, 80, 0, 2, '2015-04-10 15:40:54', '2015-04-10 15:40:54'),
(66, 4, 90, 45, 61, 0, 405, '2015-04-06 18:15:34', '2015-04-10 19:28:23'),
(67, 5, 1, 41, 55, 0, 482, '2015-04-06 18:48:52', '2015-04-06 18:48:52'),
(68, 5, 90, 45, 61, 0, 405, '2015-04-06 18:49:07', '2015-04-07 11:49:36'),
(69, 5, 91, 51, 71, 0, 900, '2015-04-06 18:51:01', '2015-04-06 18:51:01'),
(70, 2, 12, 57, 72, 0, 615, '2015-04-06 18:58:00', '2015-04-06 18:58:00'),
(71, 2, 95, 74, 107, 0, 609, '2015-04-06 19:02:08', '2015-04-06 19:02:08'),
(72, 4, 1, 41, 55, 0, 356, '2015-04-06 19:32:45', '2015-04-06 19:32:45'),
(73, 4, 1, 41, 55, 0, 358, '2015-04-06 19:32:49', '2015-04-06 19:32:49'),
(74, 4, 14, 59, 75, 0, 507, '2015-04-06 19:32:54', '2015-04-06 19:32:54'),
(75, 4, 14, 59, 75, 0, 104, '2015-04-06 19:33:02', '2015-04-06 19:33:02'),
(76, 4, 1, 41, 55, 0, 237, '2015-04-06 19:33:10', '2015-04-06 19:33:10'),
(77, 4, 1, 41, 55, 0, 391, '2015-04-06 19:33:15', '2015-04-06 19:33:15'),
(78, 4, 1, 41, 55, 0, 244, '2015-04-06 19:33:19', '2015-04-06 19:33:19'),
(79, 4, 14, 59, 75, 0, 193, '2015-04-06 19:33:26', '2015-04-06 19:33:26'),
(80, 4, 1, 41, 55, 0, 105, '2015-04-06 19:33:30', '2015-04-06 19:33:30'),
(81, 4, 1, 41, 55, 0, 286, '2015-04-06 19:33:35', '2015-04-06 19:33:35'),
(82, 4, 1, 41, 55, 0, 39, '2015-04-06 19:33:40', '2015-04-06 19:33:40'),
(83, 4, 1, 41, 55, 0, 278, '2015-04-06 19:33:44', '2015-04-06 19:33:44'),
(84, 4, 1, 41, 55, 0, 535, '2015-04-06 19:33:55', '2015-04-06 19:33:55'),
(85, 4, 1, 41, 55, 0, 369, '2015-04-06 19:34:02', '2015-04-06 19:34:02'),
(86, 4, 1, 41, 55, 0, 59, '2015-04-06 19:34:06', '2015-04-06 19:34:06'),
(87, 4, 1, 41, 55, 0, 524, '2015-04-06 19:34:10', '2015-04-06 19:34:10'),
(88, 4, 1, 41, 55, 0, 227, '2015-04-06 19:34:16', '2015-04-06 19:34:16'),
(89, 4, 12, 57, 72, 0, 184, '2015-04-06 19:37:38', '2015-04-06 19:37:38'),
(90, 4, 85, 47, 65, 0, 339, '2015-04-06 19:37:50', '2015-04-06 19:37:50'),
(91, 5, 1, 41, 55, 0, 566, '2015-04-07 14:34:01', '2015-04-07 14:34:01'),
(92, 5, 1, 41, 55, 0, 266, '2015-04-07 14:34:07', '2015-04-07 14:34:07'),
(93, 5, 1, 41, 55, 0, 473, '2015-04-07 14:34:12', '2015-04-07 14:34:12'),
(94, 5, 1, 41, 55, 0, 37, '2015-04-07 14:34:20', '2015-04-07 14:34:20'),
(95, 5, 1, 41, 55, 0, 2, '2015-04-07 14:34:30', '2015-04-07 14:34:30'),
(96, 5, 1, 41, 55, 0, 356, '2015-04-07 14:34:36', '2015-04-07 14:34:36'),
(97, 5, 1, 41, 55, 0, 507, '2015-04-07 14:34:41', '2015-04-07 14:34:41'),
(98, 5, 1, 41, 55, 0, 104, '2015-04-07 14:34:57', '2015-04-07 14:34:57'),
(99, 5, 1, 41, 55, 0, 358, '2015-04-07 14:35:02', '2015-04-07 14:35:02'),
(100, 5, 1, 41, 55, 0, 96, '2015-04-07 14:35:08', '2015-04-07 14:35:08'),
(101, 5, 1, 41, 55, 0, 13, '2015-04-07 14:35:13', '2015-04-07 14:35:13'),
(102, 5, 1, 41, 55, 0, 493, '2015-04-07 14:35:17', '2015-04-07 14:35:17'),
(103, 5, 1, 41, 55, 0, 307, '2015-04-07 14:35:24', '2015-04-07 14:35:24'),
(104, 4, 16, 62, 89, 0, 37, '2015-04-10 16:18:40', '2015-04-10 16:18:40'),
(105, 4, 19, 63, 93, 0, 473, '2015-04-10 15:42:23', '2015-04-10 15:42:23'),
(106, 4, 91, 51, 71, 0, 901, '2015-04-07 14:46:39', '2015-04-07 14:46:39'),
(107, 1, 65, 43, 58, 0, 900, '2015-04-07 16:34:30', '2015-04-07 16:34:30'),
(108, 1, 91, 51, 71, 0, 901, '2015-04-07 16:35:46', '2015-04-07 16:35:46'),
(110, 4, 101, 85, 122, 0, 628, '2015-04-07 17:00:34', '2015-04-07 17:00:34'),
(112, 4, 68, 44, 59, 0, 8, '2015-04-07 17:58:00', '2015-04-07 17:58:00'),
(113, 4, 107, 90, 127, 0, 921, '2015-04-07 18:28:24', '2015-04-07 18:28:24'),
(114, 4, 108, 91, 128, 0, 907, '2015-04-07 18:28:45', '2015-04-07 18:28:45'),
(115, 4, 109, 92, 129, 0, 922, '2015-04-07 18:31:48', '2015-04-07 18:31:48'),
(116, 4, 111, 94, 131, 0, 902, '2015-04-07 18:34:39', '2015-04-07 18:34:39'),
(117, 4, 110, 93, 130, 0, 615, '2015-04-07 18:43:39', '2015-04-07 18:43:39'),
(118, 4, 110, 93, 130, 0, 447, '2015-04-07 18:44:47', '2015-04-07 18:44:47'),
(119, 4, 9, 55, 69, 0, 41, '2015-04-08 15:41:07', '2015-04-08 15:41:07'),
(120, 4, 23, 77, 113, 0, 604, '2015-04-09 15:21:02', '2015-04-10 15:53:12'),
(121, 4, 10, 50, 63, 0, 457, '2015-04-09 16:38:03', '2015-04-09 16:38:03'),
(122, 4, 100, 84, 121, 0, 158, '2015-04-10 15:47:31', '2015-04-10 15:47:31'),
(123, 4, 18, 67, 103, 0, 417, '2015-04-10 15:47:46', '2015-04-10 15:47:46'),
(124, 4, 17, 66, 102, 0, 209, '2015-04-10 16:19:57', '2015-04-10 16:19:57'),
(125, 4, 6, 53, 67, 0, 388, '2015-04-10 16:20:18', '2015-04-10 16:20:18'),
(126, 4, 80, 80, 116, 0, 526, '2015-04-10 16:20:41', '2015-04-10 16:20:41'),
(127, 4, 1, 41, 55, 0, 186, '2015-04-10 17:07:25', '2015-04-10 17:07:25'),
(128, 4, 22, 76, 109, 0, 606, '2015-04-10 17:07:51', '2015-04-10 17:07:51'),
(129, 4, 10, 50, 63, 0, 375, '2015-04-10 17:07:59', '2015-04-10 17:07:59'),
(130, 10, 1, 41, 55, 0, 566, '2015-07-06 19:43:02', '2015-07-06 19:43:02'),
(131, 10, 90, 45, 61, 0, 242, '2015-07-06 19:43:30', '2015-07-06 19:43:30'),
(132, 10, 17, 66, 102, 0, 339, '2015-07-06 19:46:47', '2015-07-06 19:46:47'),
(133, 10, 91, 51, 71, 0, 902, '2015-07-06 19:46:58', '2015-07-06 19:46:58'),
(134, 10, 14, 59, 75, 0, 557, '2015-07-06 19:47:06', '2015-07-06 19:47:06'),
(135, 10, 21, 65, 99, 0, 208, '2015-07-06 19:47:47', '2015-07-06 19:47:47'),
(136, 10, 100, 84, 121, 0, 455, '2015-07-06 19:48:21', '2015-07-06 19:48:21'),
(137, 10, 99, 82, 118, 0, 205, '2015-07-06 19:49:04', '2015-07-06 19:49:04'),
(138, 10, 85, 47, 65, 0, 526, '2015-07-06 19:49:17', '2015-07-06 19:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `player_cloth`
--

CREATE TABLE IF NOT EXISTS `player_cloth` (
  `player_id` int(11) NOT NULL,
  `cloth_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_cloth`
--

INSERT INTO `player_cloth` (`player_id`, `cloth_id`) VALUES
(3, 62),
(4, 62),
(4, 63),
(3, 64),
(5, 75),
(10, 77),
(1, 79),
(2, 79),
(3, 83),
(4, 89),
(2, 93),
(5, 95),
(10, 96),
(1, 99),
(10, 104),
(2, 105),
(1, 109),
(5, 120);

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_action`
--

CREATE TABLE IF NOT EXISTS `player_completed_action` (
`id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_action_build`
--

CREATE TABLE IF NOT EXISTS `player_completed_action_build` (
`id` int(11) NOT NULL,
  `player_completed_action_id` int(11) NOT NULL,
  `step_action_build_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_action_collect`
--

CREATE TABLE IF NOT EXISTS `player_completed_action_collect` (
`id` int(11) NOT NULL,
  `player_completed_action_id` int(11) NOT NULL,
  `step_action_collect_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_action_dig`
--

CREATE TABLE IF NOT EXISTS `player_completed_action_dig` (
`id` int(11) NOT NULL,
  `player_completed_action_id` int(11) NOT NULL,
  `step_action_dig_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_action_speak`
--

CREATE TABLE IF NOT EXISTS `player_completed_action_speak` (
`id` int(11) NOT NULL,
  `player_completed_action_id` int(11) NOT NULL,
  `step_action_speak_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_completed_quest`
--

CREATE TABLE IF NOT EXISTS `player_completed_quest` (
`id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `quest_id` int(11) NOT NULL,
  `completion_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_hair`
--

CREATE TABLE IF NOT EXISTS `player_hair` (
  `player_id` int(11) NOT NULL,
  `hair_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_hair`
--

INSERT INTO `player_hair` (`player_id`, `hair_id`) VALUES
(4, 1),
(2, 4),
(3, 4),
(5, 4),
(10, 7),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `player_headpiece`
--

CREATE TABLE IF NOT EXISTS `player_headpiece` (
  `player_id` int(11) NOT NULL,
  `headpiece_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_headpiece`
--

INSERT INTO `player_headpiece` (`player_id`, `headpiece_id`) VALUES
(10, 1),
(3, 3),
(2, 4),
(5, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `player_icon`
--

CREATE TABLE IF NOT EXISTS `player_icon` (
`id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL,
  `icon_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_icon`
--

INSERT INTO `player_icon` (`id`, `url`, `bundle_url`, `bundle_version`, `icon_name`) VALUES
(1, 'pIcon 1.jpg', 'player_icon-c8UdSr', 0, 'pIcon 1'),
(2, 'pIcon 2.jpg', 'player_icon-wiPbFc', 0, 'pIcon 2'),
(3, 'pIcon 3.jpg', 'player_icon-zPJM5F', 0, 'pIcon 3'),
(25, 'pIcon 4.jpg', 'player_icon-pk8GEI', 0, 'pIcon 4'),
(26, 'pIcon 5.jpg', 'player_icon-ADGmiC', 0, 'pIcon 5'),
(27, 'pIcon 6.jpg', 'player_icon-EkkGDQ', 0, 'pIcon 6'),
(28, 'pIcon 7.jpg', 'player_icon-tNxMHm', 0, 'pIcon 7'),
(29, 'pIcon 8.jpg', 'player_icon-HYNA6t', 0, 'pIcon 8'),
(30, 'pIcon 9.jpg', 'player_icon-qQypmR', 0, 'pIcon 9'),
(31, 'pIcon 10.jpg', 'player_icon-HfQGWn', 0, 'pIcon 10'),
(32, 'pIcon 11.jpg', 'player_icon-Do0AAJ', 0, 'pIcon 11'),
(33, 'pIcon 12.jpg', 'player_icon-zzHLaw', 0, 'pIcon 12'),
(34, 'pIcon 13.jpg', 'player_icon-1p797T', 0, 'pIcon 13'),
(35, 'pIcon 14.jpg', 'player_icon-htosAZ', 0, 'pIcon 14'),
(36, 'pIcon 15.jpg', 'player_icon-MbRM1P', 0, 'pIcon 15'),
(37, 'pIcon 16.jpg', 'player_icon-w9ter8', 0, 'pIcon 16'),
(38, 'pIcon 17.jpg', 'player_icon-PuMwLk', 0, 'pIcon 17'),
(39, 'pIcon 18.jpg', 'player_icon-kyUQui', 0, 'pIcon 18'),
(40, 'pIcon 19.jpg', 'player_icon-wDYxeQ', 0, 'pIcon 19'),
(41, 'pIcon 20.jpg', 'player_icon-DqsEHn', 0, 'pIcon 20');

-- --------------------------------------------------------

--
-- Table structure for table `player_item`
--

CREATE TABLE IF NOT EXISTS `player_item` (
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_quest`
--

CREATE TABLE IF NOT EXISTS `player_quest` (
  `player_id` int(11) NOT NULL,
  `current_step_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player_quest`
--

INSERT INTO `player_quest` (`player_id`, `current_step_id`) VALUES
(10, 7),
(4, 9),
(4, 21),
(4, 27),
(4, 43);

-- --------------------------------------------------------

--
-- Table structure for table `player_relationship`
--

CREATE TABLE IF NOT EXISTS `player_relationship` (
  `user1_id` int(11) NOT NULL,
  `user2_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL COMMENT '"blocked" or "removed"'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE IF NOT EXISTS `pma__bookmark` (
`id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE IF NOT EXISTS `pma__column_info` (
`id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma__designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE IF NOT EXISTS `pma__history` (
`id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
`page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE IF NOT EXISTS `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"bradesco","table":"facial_feature"},{"db":"bradesco","table":"player"},{"db":"bradesco","table":"building_model"},{"db":"bradesco","table":"building_type"},{"db":"bradesco","table":"building"},{"db":"bradesco","table":"item"},{"db":"bradesco","table":"cloth"},{"db":"bradesco","table":"building_model_texture"},{"db":"bradesco","table":"step_action_speak"},{"db":"bradesco","table":"fixed_npc"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE IF NOT EXISTS `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE IF NOT EXISTS `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE IF NOT EXISTS `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'bradesco', 'accessory', '{"sorted_col":"`accessory`.`accessory_type` ASC"}', '2015-04-08 23:04:05');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE IF NOT EXISTS `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE IF NOT EXISTS `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-04-06 18:25:09', '{"collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `public_area`
--

CREATE TABLE IF NOT EXISTS `public_area` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `scene_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `status_text` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_area`
--

INSERT INTO `public_area` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `scene_name`, `icon_name`, `status_text`) VALUES
(1, 'Praia', '', '[nourl]', 0, '[noscene]', '[noicon]', 'Brincando na praia!');

-- --------------------------------------------------------

--
-- Table structure for table `quest`
--

CREATE TABLE IF NOT EXISTS `quest` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fixed_npc_id` int(11) NOT NULL,
  `repeatable` int(11) NOT NULL COMMENT '0 for false, 1 for true',
  `cooldown` int(11) NOT NULL COMMENT 'in seconds',
  `npc_text` text NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `icon_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quest`
--

INSERT INTO `quest` (`id`, `name`, `fixed_npc_id`, `repeatable`, `cooldown`, `npc_text`, `bundle_url`, `bundle_version`, `icon_name`) VALUES
(1, 'Ajudando o meio ambiente', 12, 0, 0, '{    "conversation": [        {            "fixed_npc_id": 12,            "text": [                "Oi! É bom ver um rosto novo por aqui!",                "O movimento caiu muito nos últimos tempos...",                "A cidade anda vazia desde que a praia ficou suja.",                "Assim não tem como ninguém brincar nela."            ]        },        {            "narrator_text": [                "Mas isso precisa mudar, e não é só limpar.",                "As pessoas precisam aprender a não sujá-la também.",                "E umas árvores deixaria tudo mais bonito.",                "Ufa! Quanta coisa precisa ser feita por aqui!"            ]        },        {            "fixed_npc_id": 12,            "text": [                "Ei, de quem é essa voz?"            ]        },        {            "narrator_text": [                "Ops..."            ]        },        {            "fixed_npc_id": 12,            "text": [                "Se ao menos alguém estivesse disposto a fazer isso...",                "Ei! Que tal se nós fizermos isso?",                "Lógico que com a ajuda das pessoas da cidade…",                "Mas precisamos chamar todos, usando um megafone!"            ]        },        "choice"    ],    "accepted": [        {            "fixed_npc_id": 12,            "text": [                "E o megafone? Já achou? Vá lá pegá-lo atrás do Mercado!"            ]        }    ]}', '', 0, ''),
(2, 'Aprendendo a administrar moedas', 14, 0, 0, '{\n	"conversation": [\n		{\n			"fixed_npc_id": 14,\n			"text": [\n				"Não se engane pela minha careca, jovem.",\n				"Já fui um pirata de longos cabelos cacheados. Arrrgh!",\n				"Hoje trabalho no banco, mas tenho uma missão secreta…",\n				"Encontrar tesouros antigos enterrados nesta cidade.",\n				"[...]",\n				"O quê? Você tem interesse em encontrar tesouros?",\n				"Então lanço um desafio: cavar 7 baús",\n				"Fale comigo que contarei os segredos deste tesouro."\n			]\n		},\n		"choice"\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 14,\n			"text": [\n				"7 baús, arrrgh!"\n			]\n		}\n	]\n}', '', 0, ''),
(3, 'Planejando sonhos', 20, 0, 0, '{\n    "conversation": [\n        {\n            "fixed_npc_id": 20,\n            "text": [\n                "Mensagem para o quarto 101, chocolates para o 106.",\n                "Eu preciso de ajuda. Um cliente pediu flores e bombons…",\n                "… para o aniversário de sua esposa…",\n                "Porém, não posso sair daqui. Você consegue me ajudar?"\n            ]\n        },\n        "choice"\n    ],\n    "accepted": [\n        {\n            "fixed_npc_id": 20,\n            "text": [\n                "Malas para o 412, barulho no 303, comida no 208.",\n                "E nem comprei os doces e flores do 106..."\n            ]\n        }\n    ]\n}', '', 0, ''),
(4, 'Assustite', 27, 0, 0, '{	"conversation": [		{			"left_fixed_npc_id": 27,			"right_fixed_npc_id": 63,			"text":[				"27#AAAH! Eles vão me pegar, vou virar massa de tapioca...",				"27#AAAHHHH!",				"27#AAAAAHHHH!",				"27#...",				"27#O quê? Quem? Lobisomem! AAAAHHH",				"63#Não adianta. Meu irmão não ouve ninguém!",				"63#Nem coco verde na cabeça funcionou.",				"63#Foi assim: estávamos vindo ao parquinho…",				"63#No caminho, percebi que havia esquecido minha corda.",				"63#Voltei para casa correndo enquanto ele ficou me esperando.",				"63#Quando voltei, ele já estava desse jeito.",				"63#AAAAH!",				"63#Eu tenho uma suspeita...",				"63#No caminho até aqui tem uma casa muito sinistra.",				"63#Ela é bem antiga, com uns túmulos na frente.",				"63#Meu irmão tem pavor daquele lugar.",				"63#Ele sempre fecha os olhos e bate a cara no poste.",				"63#Você quer ir até lá agora?", 				"63#Mas não posso deixar meu irmão aqui.",				"63#Preciso levá-lo ao Hospital! Você sabe o caminho?"			]		},		"choice"	],	"accepted": [		{			"left_fixed_npc_id": 27,			"right_fixed_npc_id": 63,			"text":[				"27#... BUUUH! Po-póóó...",				"63#Lembrou o caminho até o Hospital? Vamos!",				"63#Meu irmão agora acha que é um fantasma de galinha."			]		}	]}', '', 0, ''),
(5, 'É preciso ter atenção!', 62, 0, 0, '{\n	"conversation": [\n		{\n			"fixed_npc_id": 62,\n			"text": [\n				"Bem, acho que hoje as posições irão se inverter.",\n				"Os carros quebraram e não temos como policiar a cidade.",\n				"Mandamos um recruta chamar o Mecânico…",\n				"Mas ele é novo na cidade e deve ter se perdido.",\n				"Será que você não pode trazer o mecânico até aqui?"\n			]		\n		},\n		"choice"\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 62,\n			"text": [\n				"Já achou o Mecânico?"\n			]\n		}\n	]\n}', '', 0, ''),
(6, 'Pensando no futuro', 60, 0, 0, '{\n	"conversation": [\n		{"fixed_npc_id": 60,\n			"text": [\n				"E agora, o que fazer? São tantos livros! Onde eles estão? E as aulas já vão começar!",\n				"...",\n				"Você não ficou sabendo? Alguns livros da biblioteca da universidade sumiram durante as construções."\n			]		\n		},\n		"choice"\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 60,\n			"text": [\n				"Por favor, preciso de ajuda. Apenas encontre os livros para mim."\n			]\n		}\n	]\n}', '', 0, ''),
(7, 'É preciso colaborar com os amigos', 68, 0, 0, '{\n	"conversation": [\n		{\n			"left_fixed_npc_id": 67,\n			"right_fixed_npc_id": 68,\n			"text": [\n				"68#Lógico que eu estou triste, Mímico.",\n				"67#… (ele fica fazendo Mímicas o tempo todo)",\n				"68#O que você quis dizer? Teto? Ponte? Pudim?",\n				"67#…",\n				"68#Essa festa vai ser um desastre."\n				]\n		},\n		{\n			"fixed_npc_id": 68,\n			"text":[\n				"[...]",				\n				"Oi! Tudo indo, cara. Tudo indo.",\n				"[...]",\n				"Você já ouviu falar da Grande Festa Anual do Circo?",\n				"É a festa que o pessoal do circo organiza.",\n				"Vem gente da cidade inteira provar os quitutes...",\n				"Assistir às apresentações, prestigiar nossa decoração.",\n				"Costuma lotar! Eu espero por essa festa o ano todo.",\n				"Mas existe um problema…",\n				"Este ano quem está responsável pela organização sou eu…",\n				"E o meu amigo aqui, o Mímico!"\n			]\n		},\n		{\n			"left_fixed_npc_id": 68,\n			"right_fixed_npc_id": 67,\n				"text": [\n					"67#…",\n					"68#Consegue perceber o problema?",\n					"68#O 67 só se comunica desse jeito…",\n					"68#E eu não paro de derrubar coisas.",\n					"68#É que não consigo segurar nada sem jogar pra cima.",\n					"68#A última vez que fiz isso foi com um bolo da cozinheira",\n					"68#Ele grudou no teto e caiu.",\n					"67#[...]",				\n					"68#Nossa, a gente aceita sua ajuda sim!",\n					"68#Eu já estava começando a ter um treco. ",\n					"68#O Mímico também, olha o tique nervoso dele.",\n					"67#…",\n					"68#Nós ainda precisamos encomendar doces com a Cozinheira…",\n					"68#E fechar a decoração com a Decoradora.",\n					"68#Vamos juntos até o Restaurante?"\n			]		\n		},\n		"choice"\n	],\n	"accepted": [\n		{\n			"left_fixed_npc_id": 67,\n			"right_fixed_npc_id": 68,\n				"text": [\n					"68#Vamos ao Restaurante encomendar doces para a festa?",\n					"68#O Mímico está ficando aflito, olha essa performance!",\n					"67#..."\n				]\n		}\n	]\n}', '', 0, ''),
(8, 'Gripe de Livros', 72, 0, 0, '{\n	"conversation": [\n		{\n			"fixed_npc_id": 72,\n			"text": [\n				"Oi, tud... ATCHIM! Ai ai. Desculpe. ",\n				"Acho que o Ar Condicionado está me deixando gri...",\n				"Pequeno Príncipe! ... gripada."\n			]\n		},\n		{\n			"narrator_text": [\n				"É uma gripe dos livros!",\n				"Sim, uma gripe que a faz espirrar nomes de livros."\n			]\n		},\n		{\n			"fixed_npc_id": 72,\n			"text": [\n				"Enigma na Televisão!"\n			]\n		},\n		{\n			"narrator_text": [\n				"Viu o que eu disse?"\n			]\n		},\n		{\n			"fixed_npc_id": 72,\n			"text": [\n				"Dezenove... ATCHIM!",\n				"Ai, assim não consigo trabalhar! Sniff."\n			]\n		},\n		{\n			"narrator_text": [\n				"Viu o que eu disse? Precisamos ajudá-la.",\n				"O Médico do Hospital deve conhecer essa gripe."\n			]\n		},\n		"choice"\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 72,\n			"text": [\n				"...84! ATCHIM!"\n			]\n		}\n	]\n}', '', 0, ''),
(9, 'Salvando os amigos', 76, 0, 0, '{\r\n	"conversation": [\r\n		{\r\n			"fixed_npc_id": 76,\r\n			"text": [\r\n				"Acabamos de receber uma ligação.",\r\n				"A casa da Cozinheira do Restaurante está pegando fogo!",\r\n				"Por favor, avise-a e peça que nos encontre lá."\r\n			]\r\n		},\r\n		"choice"\r\n	],\r\n	"accepted": [\r\n		{\r\n			"fixed_npc_id": 76,\r\n			"text": [\r\n				"Já avisou a Cozinheira que sua casa está em chamas?"\r\n			]\r\n		}\r\n	]\r\n}', '', 0, ''),
(10, 'Lar, doce lar', 20, 1, 0, '{\r\n	"conversation": [\r\n		{\r\n			"left_fixed_npc_id": 20,\r\n			"right_fixed_npc_id": 74,\r\n			"text": [\r\n				"20#TV a cabo do Reino Mágico?",\r\n				"74#E umas paletas de nuvem aromatizada.",\r\n				"20#Fada...",\r\n				"74#Sete garrafinhas de suco de diamante também, por favor.",\r\n				"20#Onde eu vou achar tudo isso?",\r\n				"20#...",\r\n				"20#Ah, oi!",\r\n				"20#É que a Fada vai se aposentar.",\r\n				"74#Aposentar não! Tirar férias por tempo indeterminado.",\r\n				"20#De qualquer forma, estava previsto",\r\n				"20#Que ela deveria ganhar uma casa quando se aposentasse…",\r\n				"74#Tirasse férias! Ganhei mesmo a casa, mas nada funciona.",\r\n				"74#Nem a porta abre.",\r\n				"74#Preciso fazer uma reforma urgente.",\r\n				"20#Enquanto isso ela está morando aqui no Hotel.",\r\n				"20#...",\r\n				"74#Se você puder convencer o Unicórnio vai ser incrível!",\r\n				"74#Eu já tentei de tudo, mas ele não me ouve.",\r\n				"74#...",\r\n				"74#Ah, também gostaria de Nadadeiras Crocantes.",\r\n				"74#Com uma pitadinha de limão."\r\n			]\r\n		},\r\n		"choice"\r\n	],\r\n	"accepted": [\r\n		{\r\n			"left_fixed_npc_id": 20,\r\n			"right_fixed_npc_id": 74,\r\n			"text": [\r\n				"74#Uma macarronada voadora, talvez? ",\r\n				"20#Você conseguiu falar com o Unicórnio José?",\r\n				"20#Ela não para de me pedir comida!"\r\n			]\r\n		}\r\n	]\r\n}', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `skin`
--

CREATE TABLE IF NOT EXISTS `skin` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `texture_name` varchar(255) NOT NULL,
  `icon_name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skin`
--

INSERT INTO `skin` (`id`, `name`, `bundle_url`, `bundle_version`, `texture_name`, `icon_name`, `description`) VALUES
(1, 'Pele', 'skin-aSht7t', 0, 'pele_01', '01', ''),
(2, 'Pele', 'skin-XWij1F', 0, 'pele_02', '02', ''),
(3, 'Pele', 'skin-ezrGB8', 0, 'pele_03', '03', ''),
(4, 'Pele', 'skin-8wS3h9', 0, 'pele_04', '04', ''),
(5, 'Pele', 'skin-KcvIGz', 0, 'pele_05', '05', ''),
(6, 'Pele', 'skin-vNTRZx', 0, 'pele_06', '06', ''),
(7, 'Pele', 'skin-p9LQHq', 0, 'pele_07', '07', ''),
(8, 'Pele', 'skin-vkdb8I', 0, 'pele_08', '08', ''),
(9, 'Pele', 'skin-gCcMtZ', 0, 'pele_09', '09', ''),
(10, 'Pele', 'skin-Bgldny', 0, 'pele_10', '10', ''),
(11, 'Pele', 'skin-6SrjT1', 0, 'pele_11', '11', ''),
(12, 'Pele', 'skin-nB6zUC', 0, 'pele_12', '12', ''),
(13, 'Pele', 'skin-1fRXoE', 0, 'pele_13', '13', ''),
(14, 'Pele', 'skin-0SA4zk', 0, 'pele_14', '14', ''),
(15, 'Pele', 'skin-1cLoN2', 0, 'pele_15', '15', '');

-- --------------------------------------------------------

--
-- Table structure for table `step`
--

CREATE TABLE IF NOT EXISTS `step` (
`id` int(11) NOT NULL,
  `gui_description` varchar(255) DEFAULT NULL,
  `bundle_url` varchar(255) DEFAULT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `background_name` varchar(255) DEFAULT NULL,
  `quest_id` int(11) NOT NULL,
  `reward_money` int(11) NOT NULL,
  `reward_experience` int(11) NOT NULL,
  `required_level` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step`
--

INSERT INTO `step` (`id`, `gui_description`, `bundle_url`, `bundle_version`, `background_name`, `quest_id`, `reward_money`, `reward_experience`, `required_level`) VALUES
(1, 'Encontre 7 baús de tesouro; Baús podem ser desenterrados cavando na grama.', NULL, 0, NULL, 2, 0, 0, 2),
(2, 'Leve os baús de volta para o executivo para mostrar que você também sabe achar tesouros.', NULL, 0, NULL, 2, 0, 0, 2),
(3, 'Visite o Modo Construtor para construir as árvores e o banco.', NULL, 0, NULL, 2, 0, 0, 2),
(4, 'Agora que você deixou a cidade mais bonita é só voltar para o banco e falar com o Executivo.', NULL, 0, NULL, 2, 30, 50, 2),
(5, 'Encontrar o megafone para conseguir ajuda; O Megafone está atrás do Mercado.', NULL, 0, NULL, 1, 0, 0, 2),
(6, 'Agora que você tem o megafone, é só levar de volta para a Lojista.', NULL, 0, NULL, 1, 0, 0, 2),
(7, 'Você precisa recolher o lixo que foi jogado no chão perto da praia.', NULL, 0, NULL, 1, 0, 0, 2),
(8, 'Você precisa avisar a Lojista que você já recolheu todo o lixo.', NULL, 0, NULL, 1, 0, 0, 2),
(9, 'Você precisa mudar para o modo construtor e plantar 3 coqueiros.', NULL, 0, NULL, 1, 0, 0, 2),
(10, 'Você precisa avisar o lojista que os coqueiros foram plantados.', NULL, 0, NULL, 1, 0, 0, 2),
(11, 'Você precisar encontrar 8 cocos; Eles podem ser encontrados aos pés de coqueiros plantados.', NULL, 0, NULL, 1, 0, 0, 2),
(12, 'Agora que você achou os cocos, leve-os de volta para a Lojista.', NULL, 0, NULL, 1, 25, 50, 2),
(14, 'Conseguir doce e flores; Doces e Flores podem ser comprados em um Mercado.', NULL, 0, NULL, 3, 0, 0, 2),
(15, 'Voltar para o Hotel com os doce e flores.', NULL, 0, NULL, 3, 0, 0, 2),
(16, 'Visite o Executivo no banco.', NULL, 0, NULL, 3, 0, 0, 2),
(17, 'A cidade precisa de um Terminal de Ônibus; O terminal pode ser construído no Modo Construtor.', NULL, 0, NULL, 3, 0, 0, 2),
(18, 'Construa uma casa.', NULL, 0, NULL, 3, 0, 0, 2),
(19, 'Avise no Hotel que já existem casas novas construídas.', NULL, 0, NULL, 3, 50, 100, 2),
(20, 'Levar os irmãos ao Posto de Saúde.', NULL, 0, NULL, 4, 0, 0, 8),
(21, 'Ir até a Casa Mal-Assombrada.', NULL, 0, NULL, 4, 0, 0, 8),
(22, 'Encontrar o celular do Lobisomem.', NULL, 0, NULL, 4, 0, 0, 8),
(23, 'Leve o celular de volta para o lobisomem.', NULL, 0, NULL, 4, 0, 0, 8),
(24, 'Ir para o Posto de Saúde.', NULL, 0, NULL, 4, 0, 0, 8),
(25, 'Levar os irmãos até a Casa Mal-Assombrada.', NULL, 0, NULL, 4, 75, 180, 8),
(27, 'Encontrar mecânico na Oficina.', NULL, 0, NULL, 5, 0, 0, 4),
(28, 'Encontrar a Caixa de Ferramentas; O Mecânico disse que deve ter perdido ela por perto da Oficina.', NULL, 0, NULL, 5, 0, 0, 4),
(29, 'Leve a Caixa de Ferramentas até o Mecânico; Somente com essa Caixa ele conseguirá arrumar todos os carros da polícia.', NULL, 0, NULL, 5, 25, 100, 4),
(34, 'Encontre os 3 livros da Universidade.', NULL, 0, NULL, 6, 0, 0, 8),
(35, 'Fale com o professor.', NULL, 0, NULL, 6, 0, 0, 8),
(36, 'Buscar livros na Livraria', NULL, 0, NULL, 6, 0, 0, 8),
(37, 'Retornar para a Universidade com os Livros.', NULL, 0, NULL, 6, 50, 120, 8),
(38, 'Ir até o restaurante e falar com a Cozinheira.', NULL, 0, NULL, 7, 0, 0, 0),
(39, 'Encontre 3 galhos, 3 frutas e 3 flores que estão espalhados pela cidade.', NULL, 0, NULL, 7, 0, 0, 0),
(40, 'Entregue as frutas para a Cozinheira. Os galhos e flores você deve entregar para a decoradora. Elas estão no restaurante.\n', NULL, 0, NULL, 7, 0, 0, 0),
(41, 'Encontre com o malabarista no Circo.', NULL, 0, NULL, 7, 100, 250, 0),
(42, 'Encontre o médico no hospital para conseguir a cura da gripe.', NULL, 0, NULL, 8, 0, 0, 0),
(43, 'Você precisa encontrar um papiro enterrado.', NULL, 0, NULL, 8, 0, 0, 0),
(44, 'Mostre o papiro que você encontrou para o médico no hospital', NULL, 0, NULL, 8, 0, 0, 0),
(45, 'Leve o papiro até a lojista para curar a gripe dela.', NULL, 0, NULL, 8, 20, 80, 0),
(54, 'Avisar a cozinheira sobre a casa; A cozinheira trabalha nos restaurantes.', NULL, 0, NULL, 9, 0, 0, 0),
(55, 'Encontre duas Trufas; Trufas vivem enterradas na grama e podem ser cavadas.', NULL, 0, NULL, 9, 0, 0, 0),
(56, 'Leve as Trufas para a Cozinheira; A Cozinheira precisa das trufas para terminar o prato do Prefeito e ficar livre para socorrer sua casa.', NULL, 0, NULL, 9, 0, 0, 0),
(57, 'Encontre o Bombeiro; O fogo já deve ter sido apagado, vamos descobrir o que aconteceu.', NULL, 0, NULL, 9, 25, 100, 0),
(58, 'Fale com o Unicórnio para pedir o livro da Fada de volta', NULL, 0, NULL, 10, 0, 0, 0),
(59, 'O unicórnio disse que o livro foi enterrado pelo Leprechaun. Cave o livro para a Fada.', NULL, 0, NULL, 10, 0, 0, 0),
(60, 'Leve o livro de volta para a Fada e para o Mensageiro do Hotel.', NULL, 0, NULL, 10, 0, 0, 0),
(61, 'Leve a Fada até o Castelo de Unicórnios.', NULL, 0, NULL, 10, 200, 100, 0);

-- --------------------------------------------------------

--
-- Table structure for table `step_action_build`
--

CREATE TABLE IF NOT EXISTS `step_action_build` (
`id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `gui_description` varchar(255) DEFAULT NULL,
  `building_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step_action_build`
--

INSERT INTO `step_action_build` (`id`, `step_id`, `gui_description`, `building_id`) VALUES
(1, 3, 'Plante 3 Coqueiros', 64),
(2, 3, 'Plante 3 Coqueiros', 64),
(3, 3, 'Plante 3 Coqueiros', 64),
(4, 3, 'Construa um Banco de Praça', 65),
(5, 9, 'Construir: 3 Coqueiros', 64),
(6, 9, 'Construir: 3 Coqueiros', 64),
(7, 9, 'Construir: 3 Coqueiros', 64),
(8, 17, 'Construir: Terminal de Ônibus.', 68),
(9, 18, 'Construir: Casa.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `step_action_collect`
--

CREATE TABLE IF NOT EXISTS `step_action_collect` (
`id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `world_item_id` int(11) NOT NULL,
  `gui_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step_action_collect`
--

INSERT INTO `step_action_collect` (`id`, `step_id`, `world_item_id`, `gui_description`) VALUES
(8, 5, 3, 'Coletar: 01 Megafone'),
(9, 7, 4, 'Coletar: 10 Lixos'),
(10, 7, 4, 'Coletar: 10 Lixos'),
(11, 7, 4, 'Coletar: 10 Lixos'),
(12, 7, 4, 'Coletar: 10 Lixos'),
(13, 7, 4, 'Coletar: 10 Lixos'),
(14, 7, 4, 'Coletar: 10 Lixos'),
(15, 7, 4, 'Coletar: 10 Lixos'),
(16, 7, 4, 'Coletar: 10 Lixos'),
(17, 7, 4, 'Coletar: 10 Lixos'),
(18, 7, 4, 'Coletar: 10 Lixos'),
(19, 11, 5, 'Coletar: 8 cocos'),
(20, 11, 5, 'Coletar: 8 cocos'),
(21, 11, 5, 'Coletar: 8 cocos'),
(22, 11, 5, 'Coletar: 8 cocos'),
(23, 11, 5, 'Coletar: 8 cocos'),
(24, 11, 5, 'Coletar: 8 cocos'),
(25, 11, 5, 'Coletar: 8 cocos'),
(26, 11, 5, 'Coletar: 8 cocos'),
(27, 22, 6, 'Ache o celular perdido do Lobisomem.'),
(28, 28, 15, 'Coletar: Caixa de Ferramentas.'),
(29, 34, 16, 'Encontrar 3 Livros.'),
(30, 34, 16, 'Encontrar 3 Livros.'),
(31, 34, 16, 'Encontrar 3 Livros.'),
(32, 39, 20, 'Coletar: 3 galhos.'),
(33, 39, 20, 'Coletar: 3 galhos.'),
(34, 39, 20, 'Coletar: 3 galhos.'),
(35, 39, 21, 'Coletar: 3 Maçãs.'),
(36, 39, 21, 'Coletar: 3 Maçãs.'),
(37, 39, 21, 'Coletar: 3 Maçãs.'),
(38, 39, 22, 'Coletar: 3 Flores.'),
(39, 39, 22, 'Coletar: 3 Flores.'),
(40, 39, 22, 'Coletar: 3 Flores.');

-- --------------------------------------------------------

--
-- Table structure for table `step_action_dig`
--

CREATE TABLE IF NOT EXISTS `step_action_dig` (
`id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `world_item_id` int(11) NOT NULL,
  `dig_chance` float NOT NULL,
  `gui_description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step_action_dig`
--

INSERT INTO `step_action_dig` (`id`, `step_id`, `world_item_id`, `dig_chance`, `gui_description`) VALUES
(1, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(2, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(3, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(4, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(5, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(6, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(7, 1, 2, 100, 'Cavar: 07 baús de tesouro'),
(8, 43, 23, 70, 'Cavar: 1 papiro'),
(9, 55, 19, 70, 'Cavar: 02 Trufas'),
(10, 55, 19, 70, 'Cavar: 02 Trufas'),
(11, 59, 16, 70, 'Cavar: 1 Livro de Magia');

-- --------------------------------------------------------

--
-- Table structure for table `step_action_speak`
--

CREATE TABLE IF NOT EXISTS `step_action_speak` (
`id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `fixed_npc_id` int(11) NOT NULL,
  `gui_description` varchar(255) DEFAULT NULL,
  `npc_text` text NOT NULL,
  `bundle_url` varchar(255) DEFAULT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `step_action_speak`
--

INSERT INTO `step_action_speak` (`id`, `step_id`, `fixed_npc_id`, `gui_description`, `npc_text`, `bundle_url`, `bundle_version`) VALUES
(1, 2, 14, 'Fale com o executivo', '{	"conversation": [		{			"fixed_npc_id": 14,			"text": [				"Ok, você venceu. 7 baús. Eu lhe devo uma história.",				"Há muito tempo, a cidade recebeu reis e rainhas...",				"Tornou-se uma capital e muito ouro circulava pela ela.",				"Por isso temos tantas moedas escondidas.",				"Naqueles tempos, a cidade era mais verde e bonita.",				"Podíamos sentar em praças para admirar o verde e o mar.",				"Se você conseguir fazer esta cidade ficar bonita como era…",				"Ensinarei o segredo de como multiplicar moedas."			]		}	],	"accepted": [		{			"fixed_npc_id": 14,			"text": [				"Essa cidade precisa de mais verde…",				"Precisa de mais lugares para se descansar..."			]		}	]}', NULL, 0),
(2, 4, 14, 'Fale com o executivo', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 14,\n            "text": [\n                "Mas que linda essa cidade. Bom trabalho, marujo!",\n                "Você merece que eu lhe conte um segredo…",\n                "Bancos atraem Moedas, e deixam esta tarefa mais fácil…",\n                "E geram Moedas extras quando usado.",\n                "Então, criar Bancos em pontos estratégicos.."\n            ]\n        },\n        {\n            "narrator_text": [\n                "Vai ajudar a cidade?"\n            ]\n        },\n        {\n            "fixed_npc_id": 14,\n            "text": [\n                "Ei! Eu conheço essa voz...",\n                "[...]",\n                "Arrrg. Irei lhe ajudar",\n                "Mas você precisa continuar procurando baús para mim.",\n                "Agora você é representante do Banco!"\n            ]\n        },\n        {\n            "narrator_text": [\n                "Isso é uma grande honra!"\n            ]\n        },\n        {\n            "fixed_npc_id": 14,\n            "text": [\n                "Essa voz... Ainda irei lembrar de quem é."\n            ]\n        }\n    ]\n}', NULL, 0),
(3, 6, 12, 'Leve o megafone de volta.', '{	"conversation": [		{			"fixed_npc_id": 12,			"text": [				"Agora sim, vamos mobilizar essa cidade!", 				"[...]",				"PESSOAS DESTA CIDADE! A PRAIA PRECISA DE NOSSA AJUDA!",				"TODOS JUNTOS, FAREMOS NOSSA CIDADE UM LUGAR MAIS LIMPO!"			]		},		{			"left_fixed_npc_id": 19,			"right_fixed_npc_id": 12,			"text":[				"19#Noooossa! Vocês têm razão, a praia precisa de ajuda!.",				"12#Viu só como dá resultado! VAMOS! VEM LIMPAR A RUA!"			]		},		{			"fixed_npc_id": 9,			"text":[				"Isso mesmo, sozinho não consigo dar conta do lixo. A praia precisa de ajuda! Vamos limpar nossa cidade!"			]		},		{			"narrator_text": [				"Recolhendo o lixo, a praia voltará a ser maravilhosa!"			]		},		{			"fixed_npc_id": 9,			"text": [				"Ei! De onde veio essa voz?"			]		},		{			"narrator_text": [				"Err, ah..."			]		}	],	"accepted": [		{			"fixed_npc_id": 12,			"text": [				"VAMOS LÁ GALERA, VAMOS LIMPAR ESSA CIDADE!"			]		}	]}', NULL, 0),
(4, 8, 12, 'Fale com a Lojista.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "Conseguimos! Trabalho feito."\n            ]\n        },\n        {\n            "fixed_npc_id": 21,\n            "text": [\n                "A união de todos em prol da cidade foi muito legal."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 19,\n            "right_fixed_npc_id": 21,\n            "text": [\n                "19#Foi mó legal... Agora sabe o que seria mais legal?",\n                "19#Uma praia cheia de árvores, com sombra para dormir.",\n                "21#Excelente! Vamos plantar mais árvores nesta cidade!"\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "O prefeito te pediu para plantar árvores, lembra?"\n            ]\n        },\n        {\n            "narrator_text": [\n                "Não se esqueça de que você precisa ir para o modo construtor para platar essas árvores."\n            ]\n        }\n    ]\n}', NULL, 0),
(5, 10, 12, 'Fale com a Lojista.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "Opa, você por aqui!",\n                "Queremos dar uma festa de inauguração na Praia...",\n                "Vamos convidar todos, até o Prefeito vem para a festa."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 19,\n            "right_fixed_npc_id": 12,\n            "text": [\n                "19#Só precisamos acertar os últimos preparativos...",\n                "19#Onde estão os cocos? Eu jurava que já havia colhido..."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 9,\n            "right_fixed_npc_id": 19,\n            "text": [\n                "9#Puxa, perdemos os cocos? Será que você não nos ajudar?",\n                "9#Precisamos de 8 cocos, eles devem estar por aí no chão."\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "narrator_text": [\n                "Falta apenas a chegada dos cocos para o brinde...",\n                "Esperando os cocos. Ei, é sua deixa!"\n            ]\n        }\n    ]\n}', NULL, 0),
(6, 12, 12, 'Falar com a Lojista.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "Muito obrigado."\n            ]\n        },\n        {\n            "fixed_npc_id": 21,\n            "text": [\n                "Ei, olha só quem está aqui! Eu preciso lhe agradecer pela ajuda.",\n                "Em nome de todos os moradores, estamos entregando a Chave da Cidade.",\n                "Isso significa que você pode representar a cidade e ajudar em projetos para fazer toda a cidade crescer e sempre ser um ótimo lugar para se morar."\n            ]\n        },\n        {\n            "narrator_text": [\n                "E essa é a história de como você ganhou a Chave da Cidade!",\n                "Isso quer dizer que muitas pessoas pedirão a sua ajuda. É algo muito importante, mas também será muito divertido.",\n                "Mas agora vamos aproveitar um pouco da praia e fazer novos amigos.",\n                "Você agora tem acesso à Praia! Uma área online onde você pode encontrar seus amigos e amigas e se divertir bastante."\n            ]\n        }\n    ]\n}', NULL, 0),
(7, 14, 12, 'Falar com a Lojista.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "Pois não.",\n                "...",\n                "Doces e flores, aqui está seu pedido."\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "fixed_npc_id": 12,\n            "text": [\n                "Já te entreguei seu pedido não? O hóspede 106 deve estar te esperando no hotel."\n            ]\n        }\n    ]\n}\n', NULL, 0),
(8, 15, 20, 'Falar com o Mensageiro.', '{\n	"conversation": [\n		{\n			"fixed_npc_id": 20,\n			"text": [\n				"Oi, no que posso lhe servir?",\n				"É mesmo!",\n				"O aniversário do 106. Já irei chamar o Hóspede.",\n				"..."\n			]\n		},\n		{\n			"left_fixed_npc_id": 1,\n			"right_fixed_npc_id": 20,\n			"text":[\n				"1#Que lindas flores! Obrigado. Aqui está sua gorjeta.",\n				"20#Na verdade senhor, agradeça à criança.",\n				"1#Ah, obrigado. É que hoje é o aniversário da minha esposa.",\n				"1#Na verdade, o presente que irei dar a ela é  uma casa.",\n				"1#Estamos no hotel enquanto ela não fica pronta.",\n				"1#Está demorando por conta da segurança...",\n				"1#Ainda não conseguimos decidir tudo o que será feito.",\n				"20#Conheço alguém que pode ajudá-lo, o Executivo do banco.",\n				"1#Sério? Preciso conhecê-lo. Você me apresenta?",\n				"20#Vou acompanhá-lo…"\n			]\n		}\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 20,\n			"text": [\n				"O Hóspede do 106 ainda aguarda o encontro de vocês no Banco."\n			]\n		}\n		\n	]\n}', NULL, 0),
(9, 16, 14, 'Falar com o Executivo.', '{\n    "conversation": [\n        {\n            "left_fixed_npc_id": 1,\n            "right_fixed_npc_id": 14,\n            "text": [\n                "14#Olha só quem resolveu aparecer! E quem é seu amigo?",\n                "1#Ouvi dizer que o senhor entende de segurança de casas.",\n                "14#Sim, o segredo de uma boa casa está na prevenção.",\n                "14#É preciso pensar em todas as possibilidades.",\n                "14#Você não vai querer passar por apuros.",\n                "1#Exato. Quero me mudar para a cidade",\n                "1#Minha esposa faz aniversário…",\n                "1#E quero dar a ela todo o conforto e segurança do mundo.",\n                "14#Então você veio ao lugar certo.",\n                "14#Ouvi dizer que estão começando um bairro novo…",\n                "14#Apesar de ainda não ter ônibus... Vamos falar da casa..."\n            ]\n        },\n        {\n            "narrator_text": [\n                "Psiu! Ei... Eles têm razão:",\n                "As pessoas precisam andar entre os bairros.",\n                "Não me lembro se construímos um Terminal de Ônibus.",\n                "Precisamos ver isso"\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "fixed_npc_id": 20,\n            "text": [\n                "Vamos construir um terminal de ônibus?."\n            ]\n        }\n    ]\n}', NULL, 0),
(10, 19, 20, 'Falar: Mensageiro do Hotel.', '{\n	"conversation": [\n		{\n			"fixed_npc_id": 20,\n			"text": [\n				"O Hóspede do 106? Mas esse quarto está vazio!",\n				"Ah! Tem razão, aquele senhor, ele já se mudou.",\n				"Mas deixou algo para você como agradecimento. Aqui está."			\n				]\n		}\n	]\n}', NULL, 0),
(11, 20, 22, 'Falar com o médico no Hospital.', '{\n    "conversation": [\n        {\n            "left_fixed_npc_id": 63,\n            "right_fixed_npc_id": 22,\n            "text": [\n                "22#Bem, esse é um caso de Assustite Aguda.",\n                "63#Nunca ouvi falar...",\n                "22#É muito raro. É o quinto caso esta semana.",\n                "22#Deve estar acontecendo alguma coisa...",\n                "22#...",\n                "22#A cura ainda é incerta e pode ser contagiosa.",\n                "22#Existem estudos feitos com base nos vampiros…",\n                "22#Mas as pesquisas estão paradas",\n                "22#Os cientistas pegaram Assustite... estão se recuperando.",\n                "22#Que situação!",\n                "22#Para tratar, precisa de contato direto com o trauma.",\n                "63#Oi?",\n                "22#Seu irmão tem que ir até a Casa Mal-Assombrada…",\n                "22#E dar um alô para o Zumbi.",\n                "63#O senhor acha que ele consegue? Olha o estado dele...",\n                "22#Vou receitar um medicamento para ele.",\n                "22#Enquanto isso, por que não vão à Casa Mal-Assombrada?",\n                "22#Pode ser que encontrem alguma informação importante.",\n                "63#Eu que não vou passar perto daquela casa!",\n                "22#Entendo...O seu medo pode ser Assustite!",\n                "22#E você, também está com medo de ir até lá?"\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "left_fixed_npc_id": 22,\n            "right_fixed_npc_id": 63,\n            "text": [\n                "63#Ai! Você me assustou!",\n                "22#Você ainda não foi à Casa Mal-Assombrada?",\n                "Precisamos curar essas pessoas."\n            ]\n        }\n    ]\n}', NULL, 0),
(12, 21, 23, 'Falar: Lobisomem na Casa Mal-Assombrada.', '{    "conversation": [        {            "left_fixed_npc_id": 65,            "right_fixed_npc_id": 23,            "text": [                "23#AUUUUUU!",                "65#Para de chorar, Lobi!"            ]        },        {            "left_fixed_npc_id": 64,            "right_fixed_npc_id": 65,            "text": [                "64#Olha, uma pessoa. Oi, pessoa!",                "65#...",                "65#Aí, mais um que vai sair correndo.",                "64#Não precisa ter medo, pessoa! O Lobi é tranquilão.",                "65#Eu não aguento mais esse choro todo. Estou pensando em voltar para o túmulo.",                "65#O Lobi está assim porque perdeu o celular."            ]        },        {            "left_fixed_npc_id": 64,            "right_fixed_npc_id": 23,            "text": [                "23#Todas as minhas selfies, todos os meus jogos...",                "23#TODA A MINHA VIDA! Vocês não entendem... AUUUU!",                "64#O problema é que ele está assustando todo mundo.",                "64#As pessoas veem aqui, ouvem o choro dele e saem correndo",                "64#...",                "64#É sério? Tem gente tratando o susto no Hospital? Aí, Lobi! Coisa feia!",                "23#Meu celular tinha capinha laranja. AA..."            ]        },        {            "left_fixed_npc_id": 65,            "right_fixed_npc_id": 64,            "text": [                "65#AUU. Eu sei, eu sei.",                "64#Olha, peço desculpas pelo Lobi, ele é gente boa",                "64#Mas enquanto não acharmos o celular, vai ser assim",                "64#Será que você consegue encontrar?"            ]        }    ],    "accepted": [        {            "left_fixed_npc_id": 65,            "right_fixed_npc_id": 64,            "text": [                "64#Oi, pessoa! Encontrou o celular?",                "65#Olha lá. O Lobi assustou um ônibus cheio de velhinhas."            ]        }    ]}', NULL, 0),
(13, 23, 23, 'Fale com o Lobisomem.', '{    "conversation": [        {            "fixed_npc_id": 23,            "text": [                "Não acredito! Muito obrigado! Você é a melhor pessoa, pessoa!"            ]        },        {            "left_fixed_npc_id": 64,            "right_fixed_npc_id": 65,            "text": [                "65#Vê se presta mais atenção, Lobi.",                "65#E para de tirar selfies toda hora!",                "64#Obrigado pela ajuda. Seu amigo com Assustite está bem?",                "64#Traga ele para tomar um suco de tomate mais tarde."            ]        }    ],    "accepted": [        {            "fixed_npc_id": 64,            "text": [                "Estou temperando o suco!",                "Olha a asinha de barata! Cadê seu amigo?"            ]        }    ]}', NULL, 0),
(14, 24, 22, 'Falar: Médico no Hospital.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 22,\n            "text": [\n                "Você conseguiu! Não há mais casos de Assustite na cidade!"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 27,\n            "right_fixed_npc_id": 63,\n            "text": [\n                "27#O-obrigado...",\n                "63#Meu irmão está voltando ao normal.",\n                "63#..."\n            ]\n        },\n        {\n            "fixed_npc_id": 22,\n            "text": [\n                "Enfrentar o estopim do trauma o fará muito bem."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 27,\n            "right_fixed_npc_id": 63,\n            "text": [\n                "27#O-oi?",\n                "63#Vai te fazer bem dar um alô para o Lobisomem.",\n                "63#A-ah... Acho que sim.",\n                "22#E olha, fica com esse broche da minha tia Sueli.",\n                "22#Ele é estranho, né? Assusta qualquer assombração.",\n                "27#V-valeu!"\n            ]\n        },\n        {\n            "fixed_npc_id": 63,\n            "text": [\n                "Vamos lá então?Quero falar com esse Lobisomem."\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "left_fixed_npc_id": 27,\n            "right_fixed_npc_id": 63,\n            "text": [\n                "27#A-aí vou m-me curar de vez!",\n                "63#Você leva a gente até a Casa Mal Assombrada?"\n            ]\n        }\n    ]\n}', NULL, 0),
(15, 25, 23, 'Falar: Lobisomem na Casa Mal-Assombrada.', '{    "conversation": [        {            "left_fixed_npc_id": 65,            "right_fixed_npc_id": 64,            "text": [                "65#Eles chegaram!",                "64#Bem a tempo, sejam bem-vindos! Olha o suco de tomate..."            ]        },        {            "fixed_npc_id": 27,            "text": [                "O-obrigado, ad-doro tomate."            ]        },        {            "left_fixed_npc_id": 63,            "right_fixed_npc_id": 65,            "text": [                "63#Cadê o Lobisomem?",                "65#Deve estar no quarto com o celular dele. LOBI!"            ]        },        {            "fixed_npc_id": 64,            "text": [                "E você, pessoa. Quer um pedacinho de unha no seu suco?",                "..."            ]        },        {            "fixed_npc_id": 63,            "text": [                "Olha ele aí."            ]        },        {            "left_fixed_npc_id": 65,            "right_fixed_npc_id": 23,            "text": [                "23#Nossa cara, desculpa te assustar com meu drama.",                "23#Dá um abraço.",                "23#...",                "65#Que momento... Acho que ele está sufocando, Lobi!",                "23#Opa! Eu sou emotivo. Adoro um abraço."            ]        },        {            "left_fixed_npc_id": 63,            "right_fixed_npc_id": 27,            "text": [                "27#Cof, cof! Tudo bem.",                "63#Ei, você parou de tremer!",                "27#Parei? Parei!"            ]        },        {            "left_fixed_npc_id": 23,            "right_fixed_npc_id": 64,            "text": [                "64#Ai que alívio.",                "23#Uhuu! Vamos tirar uma selfie para comemorar!"            ]        },        {            "left_fixed_npc_id": 63,            "right_fixed_npc_id": 27,            "text": [                "27#Ei, obrigado por me ajudar.",                "63#Muito obrigada mesmo.",                "63#...",                "27#Se não fosse você, eu ainda estaria no parquinho...",                "27#Gritando com o escorregador. E ainda fiz um amigo.",                "63#Ele voltou. Vamos tirar a foto."            ]        },        {            "fixed_npc_id": 23,            "text": [                "Digam \\"Pudim de queijo\\"!",                "*Flash*"            ]        }    ]}', NULL, 0),
(17, 27, 61, 'Falar: Mecânico.', '{\n	"conversation": [\n		{\n			"fixed_npc_id": 61,\n			"text": [\n				"Ninguém veio me procurar, não.",\n				"Mas então é por isso que não vi mais viaturas?",\n				"De qualquer forma, temos outro problema…",\n				"Perdi minha caixa de ferramentas e não posso ajudá-los.",\n				"Vamos procurá-la agora? "\n\n			]\n		}\n	],\n	"accepted": [\n		{\n			"fixed_npc_id": 61,\n			"text": [\n				"Não encontrei a Caixa de Ferramentas ainda, e você?"\n			]\n		}\n	]\n}', NULL, 0),
(18, 29, 61, 'Falar: Mecânico.', '{	"conversation": [		{			"left_fixed_npc_id": 61,			"right_fixed_npc_id": 62,			"text": [				"62#Muito bem, você voltou antes do recruta.",				"62#Coitado, ele ainda deve estar perdido...",				"61#Senhor, onde estão os carros com problema?",				"62#Logo ali, atrás no estacionamento. ",				"62#Pode ir na frente. E mais uma vez, muito obrigado",				"62#É com pessoas assim que se constrói uma cidade."			]		}	]}', NULL, 0),
(19, 35, 60, 'Falar: Professor.', '{	"conversation": [		{			"left_fixed_npc_id": 66,			"right_fixed_npc_id": 60,			"text": [				"60#Muito obrigado! Agora conseguiremos arrumar a bagunça.",								"66#Terminamos a reforma, já podemos guardar os livros.",				"66#Porém ainda faltam muitos livros...",				"60#Isso é ruim. Agora precisamos repor as obras perdidas.",				"66#Há alguma livraria na cidade?",				"66#Lá deve ter os livros perdidos do acervo...",				"60#Brilhante ideia!",				"60#Se todos ajudarem, terminamos antes das aulas começarem."			]		}	],	"accepted": [		{			"fixed_npc_id": 61,			"text": [				"Não se esqueça!",				"Devemos ir à Livraria…",				"Precisamos buscar novos livros para a universidade!"			]		}	]}', NULL, 0),
(20, 36, 12, 'Falar: Lojista.', '{\n    "conversation": [\n        {\n            "left_fixed_npc_id": 12,\n            "right_fixed_npc_id": 60,\n            "text": [\n                "12#Olá! No que posso ajudar vocês?",\n                "60#Precisamos de livros para a biblioteca da universidade!",\n                "12#Ok... Livros universitários. Estão por aqui.",\n                "60#Quantos livros!",\n                "60#Ainda bem que viemos todos, para poder carregá-los.",\n                "60# Vamos levar estes e estes. Ah, e aqueles ali também!",\n                "60# Vamos levar tudo para a universidade!",\n                "12# AH!? Então está certo, qual o endereço para entrega?",\n                "60# Entrega? Não, vamos levar agora mesmo."\n            ]\n        }\n    ]\n}', NULL, 0),
(21, 37, 60, 'Falar: Professor.', '{\n    "conversation": [\n        {\n            "fixed_npc_id": 60,\n            "text": [\n                "Ei, por que demoraram tanto?",\n                "Só faltam estes livros para tudo ficar pronto.",\n                "...",\n                "Agora sim, a universidade está recuperada!",\n                "Isso tudo só me provou uma coisa:",\n                "Como é importante nos planejarmos com segurança para o futuro.",\n                "Agora, quanto mais alunos, melhor!"\n            ]\n        }\n    ]\n}', NULL, 0),
(22, 38, 69, 'Falar: Cozinheira', '{\n    "conversation": [\n        {\n            "left_fixed_npc_id": 70,\n            "right_fixed_npc_id": 69,\n            "text": [\n                "69#Toalhas verdes, Decoradora?",\n                "70#Sim! Realça o sabor do palmito asiático que vai servir",\n                "69#Oui…",\n                "70#O quê?",\n                "69#Fala sério…",\n                "70#Tá bom! Verde é bonito, mãe. Minha cor favorita!",\n                "70#Combina com a cor da parede e não cansa a vista.",\n                "70#...",\n                "69#Olá, meus amigos do cirque!"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 70,\n            "right_fixed_npc_id": 68,\n            "text": [\n                "68#Oi, Cozinheira! Decoradora!",\n                "70#Oie!",\n                "68#Conseguimos mais ajuda para organizar a festa!"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 68,\n            "right_fixed_npc_id": 69,\n            "text": [\n                "69#Muito bem!",\n                "68#Todo ano a Cozinheira faz os nossos quitutes.",\n                "68#Já vi gente deitar no chão e chorar de tão bom que é!",\n                "68#Quando a festa acaba a gente nem precisa desmontar nada",\n                "68#Sempre levam os arranjos de Decoradora pra casa."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 68,\n            "right_fixed_npc_id": 67,\n            "text": [\n                "67#...",\n                "68#Pois é, Cozinheira. É isso o que o Mímico disse.",\n                "68#Estamos aqui para encomendar mais doces.",\n                "68#E para fechar a decoração, Decoradora."\n            ]\n        },\n        {\n            "left_fixed_npc_id": 69,\n            "right_fixed_npc_id": 70,\n            "text": [\n                "70#Muito bom.",\n                "69#Que marravilha! O bolo que eu mandei estava bom?"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 67,\n            "right_fixed_npc_id": 68,\n            "text": [\n                "68#Ahn… Estava de voar até o teto, né Mímico?",\n                "67#…"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 70,\n            "right_fixed_npc_id": 69,\n            "text": [\n                "69#Magnifique! Que tal um suflê de frutas?",\n                "70#Nossa, sério? Vocês vão desmaiar de emoção.",\n                "70#É a melhor sobremesa do restaurante!"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 70,\n            "right_fixed_npc_id": 68,\n            "text": [\n                "68#E você teve alguma ideia para a decoração?",\n                "70#Pensei em galhos e flores traçados de maneira rústica.",\n                "70#Para que sintam o circo como parte da natureza"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 67,\n            "right_fixed_npc_id": 68,\n            "text": [\n                "67#…",\n                "68#…"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 70,\n            "right_fixed_npc_id": 69,\n            "text": [\n                "69#Minha filha, você deverria ser poeta.",\n                "70#É só um jeito de falar que galho com flor fica bonito",\n                "70#As pessoas tiram foto, postam na internet, um sucesso!",\n                "69#Oui! Les ingredientes!",\n                "69#Preciso que vocês colham frutas para mim!",\n                "70#E eu preciso de galhos e flores para o meu projeto!"\n            ]\n        },\n        {\n            "left_fixed_npc_id": 68,\n            "right_fixed_npc_id": 67,\n            "text": [\n                "67#…",\n                "68#Verdade, Mímico!",\n                "68#Perto do circo tem o lugar perfeito isso."\n            ]\n        }\n    ],\n    "accepted": [\n        {\n            "left_fixed_npc_id": 67,\n            "right_fixed_npc_id": 68,\n            "text": [\n                "68#Frutas, galhos e o que mais mesmo?",\n                "67#…",\n                "68#Flores! Isso! Você ajuda a gente a carregar?"\n            ]\n        }\n    ]\n}', NULL, 0),
(23, 40, 69, 'Falar: Cozinheira.', '{\n	"conversation": [\n		{\n			"left_fixed_npc_id": 70,\n			"right_fixed_npc_id": 69,\n			"text": [\n				"69#Ulalá! Que frutas marravilhosas!",\n				"70#E que galhos mais galhosos!",\n				"69#Obrigada, mes amis! Agora posso terminar o suflê.",\n				"70#E eu vou para meu atelier finalizar a decoração."\n				]\n		},\n		{\n			"left_fixed_npc_id": 67,\n			"right_fixed_npc_id": 68,\n				"text": [\n					"68#UHUUU!", \n					"67#…",\n					"68#Essa é a dança da vitória do Mímico. Olha que doidera.",\n					"68#Acho que é isso então! Conseguimos!",\n					"68#Agora é só voltar para o Circo e aproveitar a festa!"\n				]\n		}\n	],\n	"accepted":[\n		{\n		"left_fixed_npc_id": 67,\n			"right_fixed_npc_id": 68,\n				"text": [\n					"67#…",\n					"68#Agora é outra dança…",\n					"68#A do “Vamos voltar logo que a Festa vai começar!”"	\n			]\n		}\n	]\n}', NULL, 0),
(24, 41, 68, 'Falar: Malabarista.', '{\n	"conversation": [\n		{\n				"left_fixed_npc_id": 70,\n				"right_fixed_npc_id": 69,\n					"text": [\n							"69#Mon dieu, e não é que tem gente comendo o suflê…",\n							"69#E chorando no chão mesmo? Pare senhor! Mon dieu…",\n							"70#Até eu estou chorando, mãe. O que colocou aqui?",\n							"69#Amour, querrida filha…",\n							"70#Ai, mãe."\n					]\n		},\n		{\n			"left_fixed_npc_id": 70,\n			"right_fixed_npc_id": 68,\n				"text": [\n					"68#Pessoal! Estão todos aqui!",\n					"68#Muito obrigado pela a ajuda de todos vocês.",\n					"68#Essa festa foi feita com a ajuda de muita gente…",\n					"68#E é para todo mundo, vamos aproveitar!",\n					"68#Agora o Mímico vai declamar uma poesia com suas mãos.",\n					"70#Adoro poesia...",					\n					"68#Obrigado mais uma vez. Você provou o suflê?",					\n					"68#Eu já rolei no chão três vezes de tão bom. Experimenta.",					\n					"68#Viu só que delícia? Pode rolar a vontade."\n				]\n		},\n		{\n			"fixed_npc_id": 68,\n				"text": [\n					"COZINHEIRA: Mon ami, non é parra tanto! Que verrgonha!"\n				]\n		}\n	]\n}', NULL, 0),
(29, 42, 22, 'Falar: Médico no Hospital', '{	"conversation":[		{			"fixed_npc_id": 22,			"text": [				"Hum... Gripe dos Livros. Acredito que já ouvi falar.",				"Aguarde só um momento.",				"Enfermeira!"			]		},		{			"left_fixed_npc_id": 71,			"right_fixed_npc_id": 22,			"text":[				"71#Diga, doutor.",				"22#Aquela gripe que você teve ano passado…",				"22#Qual era o nome mesmo?",				"71#Gripe dos Livros. Peguei no último ano de estudos.",				"22#A vendedora da Livraria está com o mesmo problema.",				"22#Precisamos do remédio para curá-la.",				"71#Só que não temos mais aqueles remédios.",				"71#É uma gripe muito rara. Curei a minha escrevendo.",				"71#Talvez se conseguimos alguns papiros especiais.",				"22#Boa ideia. Eles só são difíceis de encontrar.",				"22#Se você conseguir alguns papiros, leve à Livraria…",				"22#E faça ela escrever."			]		}	],	"accepted":[		{			"fixed_npc_id": 71,			"text": [				"Você já desenterrou algum papiro?",				"Precisamos de uma para a cura da gripe."			]		}	]}', NULL, 0),
(30, 44, 22, 'Falar: Leve o papiro para o médico', '{\r\n	"conversation":[\r\n		{\r\n			"fixed_npc_id": 22,\r\n			"text": [\r\n				"Maravilha!",\r\n				"Leve esse papiro até a vendedora e a faça escrever."\r\n			]\r\n		}\r\n	],\r\n	"accepted":[\r\n		{\r\n			"fixed_npc_id": 22,\r\n			"text": [\r\n				"Maravilha!",\r\n				"Leve esse papiro até a vendedora e a faça escrever."\r\n			]\r\n		}\r\n	]\r\n}', NULL, 0),
(31, 45, 72, 'Falar: Leve o papiro para a lojista', '{	"conversation":[		{			"fixed_npc_id": 72,			"text": [				"Ah!!! Um Gigante de Botas! ATCHIIIMMM!"			]		},		{			"narrator_text":[				"Oh não! Parece que ela piorou.",				"Vá logo, faça ela escrever no papiro!"			]		},		{			"fixed_npc_id": 72,			"text": [				"...",				"Escrever? Ok. ATCHIMM! Era uma vez...",				"Atchim! Uma cidade mágica e maravilhosa...",				"Onde uma criança começou a maior de todas as aventuras.",				"Olha só! Parei de espirrar!"			]		},		{			"narrator_text":[				"Deu certo!"			]		},		{			"fixed_npc_id": 72,			"text": [				"Muito obrigada! É gostoso escrever…",				"Acho que vou continuar e ter meu próprio livro!"			]		},		{			"narrator_text":[				"E foi assim que a vendedora virou escritora…",				"Mas isso já é outra história."			]		}	]}', NULL, 0),
(32, 54, 69, 'Falar: Cozinheira do Restaurante', '{\r\n	"conversation": [\r\n		{\r\n			"fixed_npc_id": 69,\r\n			"text": [\r\n				"Oi, tudo bem?",\r\n				"...",\r\n				"Como assim pegando fogo? Oh, não!",\r\n				"Devo ter esquecido o fogo aceso hoje pela manhã!",\r\n				"Pior que não posso sair do restaurante agora.",\r\n				"Preciso terminar o prato do Prefeito!",\r\n				"E acabei perdendo minhas trufas.",\r\n				"...",\r\n				"Não é chocolate.",\r\n				"São cogumelos. Vivem enterradas e são difíceis de achar.",\r\n				"Você pode procurá-las? Assim poderei salvar minha casa.",\r\n				"Eu preciso de duas trufas apenas..."\r\n			]\r\n		}\r\n	],\r\n	"accepted": [\r\n		{\r\n			"fixed_npc_id": 69,\r\n			"text": [\r\n				"Minha casa! Minhas trufas!"\r\n			]\r\n		}\r\n	]\r\n}', NULL, 0),
(33, 56, 69, 'Leve as Trufas para a Cozinheira; A Cozinheira precisa das trufas para terminar o prato do Prefeito e ficar livre para socorrer sua casa.', '{	"conversation": [		{			"fixed_npc_id": 69,			"text": [				"Maravilha! Agora só falta terminar o risoto...",				"Onde está o arroz? Ai, ai, ai. [...] Aqui! Achei!",				"Agora montamos o prato e está pronto!",				"Vou servir o Prefeito."			]		},		{			"left_fixed_npc_id": 69,			"right_fixed_npc_id": 21,			"text":[				"69#Aqui está Excelentíssimo.",				"21#Que prato soberbo! Está uma delícia!",				"21#Olá, criança. Faz tempo que não nos vemos.",				"21#Você tem feito um bom trabalho nesta cidade. Obrigado.",				"69#Agora com vossa permissão irei me retirar.",				"69#Preciso salvar minha casa que está pegando fogo!"			]		},		{			"fixed_npc_id": 21,			"text": [				"O que está havendo?",				"...",				"Nossa! Isso é grave.",				"Mas fique calma, as casas da cidade são protegidas.",				"É uma boa forma de prevenção."			]		},		{			"narrator_text":[				"Hum... Será que eles conseguiram apagar o fogo a tempo?",				"Vamos ao Bombeiro para ter notícias, que tal?"			]		}	],	"accepted": [		{			"narrator_text":[				"Hum... Será que eles conseguiram apagar o fogo a tempo?",				"Vamos ao Bombeiro para ter notícias, que tal?"			]		}	]}', NULL, 0),
(34, 57, 76, 'Encontre o Bombeiro; O fogo já deve ter sido apagado, vamos descobrir o que aconteceu.', '{\r\n	"conversation": [\r\n		{\r\n			"fixed_npc_id": 76,\r\n			"text": [\r\n				"Olá!",\r\n				"...",\r\n				"A casa da Cozinheira ficou bem.",\r\n				"Já foi iniciada a reforma, inclusive.",\r\n				"Foi tudo por causa do fogão que ela esqueceu aceso.",\r\n				"É preciso prestar atenção...",\r\n				"Já pensou se você não estivesse por aqui para ajudar? ",\r\n				"Ah, já ia esquecendo… A cozinheira deixou presentes...",\r\n				"...Por você ter ajudado a salvar a casa dela."\r\n			]\r\n		}\r\n	]\r\n}', NULL, 0),
(35, 58, 73, 'Conversar com o Unicórnio', '{\r\n	"conversation": [\r\n		{\r\n			"fixed_npc_id": 73,\r\n			"text": [\r\n				"Vingardio Leviosi! Ingardi Leviosa!",\r\n				"...",\r\n				"Oi! Eu te conheço?",\r\n				"...",\r\n				"AH! A Fada quer o livro dela de volta? Pois não devolvo.",\r\n				"Por que eu sou o Unicórnio José, o Grande, o Poderoso.",\r\n				"E eu não sei fazer mágicas! É terrível!",\r\n				"Sou o único da família que não sabe fazer nada.",\r\n				"Você tem que ver meu irmão…",\r\n				"Consegue transformar tudo em bolhas de sabão.",\r\n				"Esse livro da Fada tem as melhores magias.",\r\n				"Mas eu não consigo aprender nenhuma.",\r\n				"...",\r\n				"É verdade! Talvez fosse mais fácil pedir ajuda a ela.",\r\n				"Como você é inteligente!",\r\n				"Bom, só que temos um problema.",\r\n				"Enquanto não estou usando o Livro, ele fica escondido",\r\n				"Em um buraco que meu amigo Leprechaun cavou.",\r\n				"Assim que encontrar o livro, pode entregá-lo à Fada."\r\n			]\r\n		}\r\n	],\r\n	"accepted": [\r\n		{\r\n			"fixed_npc_id": 73,\r\n			"text": [\r\n				"Conseguiu cavar e encontrar o Livro?",\r\n				"Precisa de uma dica?",\r\n				"Se o Calçadinho é o filho, quem é o pai?",\r\n				"Sou bom em piadas, hein!?"\r\n			]\r\n		}\r\n	]\r\n}', NULL, 0),
(36, 60, 20, 'Fale com o Mensageiro', '{\n	"conversation": [\n		{\n			"left_fixed_npc_id": 20,\n			"right_fixed_npc_id": 74,\n			"text": [\n				"74#Muito obrigada! Muito obrigada!",\n				"20#Muito obrigado! Muito obrigado!",\n				"74#E pensar que José queria aprender magia sozinho.",\n				"74#Magia deve ser aprendida com uma mestra.",\n				"20#Agora você pode criar tudo o que quiser, Fada.",\n				"20#Vamos lá reformar sua casa?",\n				"74#Então…",\n				"20#Pre-para. Lá vem.",\n				"74#Estou pensando em falar com o Unicórnio José.",\n				"74#Será que posso construir um puxadinho no castelo dele?",\n				"74#O lugar brilha. Tem tudo a ver comigo.",\n				"20#Fale com ele! Ei, você pode levar a Fada até lá?",\n				"20#...",\n				"74#Vamos! Mas antes farei um feitiço de limpeza em você.",\n				"74#Essa escavação toda te deixou com muita poeira!"\n			]\n		}\n	],\n	"accepted": [\n		{\n			"left_fixed_npc_id": 20,\n			"right_fixed_npc_id": 74,\n			"text": [\n				"74#No puxadinho vai ter espaço para coleção de pantufas.",\n				"20#Leve a Fada até o Castelo dos Unicórnios",\n				"20#Antes que ela mude de ideia e resolva ficar por aqui."\n			]\n		}\n	]\n}', NULL, 0),
(37, 61, 73, 'Fale com o Unicórnio', '{\n	"conversation": [\n		{\n			"left_fixed_npc_id": 73,\n			"right_fixed_npc_id": 74,\n			"text": [\n				"73#Desculpa, Fada…",\n				"74#Unizé! Se tivesse me falado que estava com meu livro",\n				"74#Porque queria aprender magia, eu teria ensinado.",\n				"74#Magia deve ser passada de mestra pra pupilo!",\n				"74#Olha, tenho uma proposta pra fazer.",\n				"74#E se eu construísse um puxadinho no seu Castelo?",\n				"73#Jura?  É a melhor ideia do Universo dos Unicórnios!",\n				"74#E eu vou morar nesse lugar fabuloso!",\n				"73#E eu vou chorar!!!",\n				"74#Chore no potinho, pois lágrima de Unicórnio",\n				"74#É o principal ingrediente da magia que vou lhe ensinar",\n				"74#Mas vamos lá na cozinha pegar os outros ingredientes",\n				"73#Vamos. Ei, você!",\n				"73#...",\n				"73#Venha visitar a gente, tá? Até lá eu devo estar craque!"\n			]\n		}\n	]\n}', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `step_require_building`
--

CREATE TABLE IF NOT EXISTS `step_require_building` (
`id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step_reward_accessory`
--

CREATE TABLE IF NOT EXISTS `step_reward_accessory` (
  `step_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step_reward_cloth`
--

CREATE TABLE IF NOT EXISTS `step_reward_cloth` (
  `step_id` int(11) NOT NULL,
  `cloth_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step_reward_hair`
--

CREATE TABLE IF NOT EXISTS `step_reward_hair` (
  `step_id` int(11) NOT NULL,
  `hair_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step_reward_headpiece`
--

CREATE TABLE IF NOT EXISTS `step_reward_headpiece` (
  `step_id` int(11) NOT NULL,
  `headpiece_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `step_reward_item`
--

CREATE TABLE IF NOT EXISTS `step_reward_item` (
  `step_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL,
  `background_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `background_name`) VALUES
(1, 'ACESSÓRIOS', '', 'store-w2qSVW', 0, 'Loja_generica_background'),
(2, 'ROUPAS', '', 'store-qj4Uzc', 0, 'Loja_generica_background'),
(3, 'CABELEIREIRO', '', 'store-li6N57', 0, 'Loja_generica_background'),
(4, 'TRANSPORTES', '', 'store-gRD9cd', 0, 'Transportes_background');

-- --------------------------------------------------------

--
-- Table structure for table `store_accessory`
--

CREATE TABLE IF NOT EXISTS `store_accessory` (
  `store_id` int(11) NOT NULL,
  `accessory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_accessory`
--

INSERT INTO `store_accessory` (`store_id`, `accessory_id`) VALUES
(1, 1),
(1, 10),
(1, 13),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `store_cloth`
--

CREATE TABLE IF NOT EXISTS `store_cloth` (
  `store_id` int(11) NOT NULL,
  `cloth_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_cloth`
--

INSERT INTO `store_cloth` (`store_id`, `cloth_id`) VALUES
(2, 4),
(2, 43),
(2, 51),
(2, 58),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120);

-- --------------------------------------------------------

--
-- Table structure for table `store_costume`
--

CREATE TABLE IF NOT EXISTS `store_costume` (
  `store_id` int(11) NOT NULL,
  `costume_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_hair`
--

CREATE TABLE IF NOT EXISTS `store_hair` (
  `store_id` int(11) NOT NULL,
  `hair_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_hair`
--

INSERT INTO `store_hair` (`store_id`, `hair_id`) VALUES
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `store_headpiece`
--

CREATE TABLE IF NOT EXISTS `store_headpiece` (
  `store_id` int(11) NOT NULL,
  `headpiece_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_headpiece`
--

INSERT INTO `store_headpiece` (`store_id`, `headpiece_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `store_item`
--

CREATE TABLE IF NOT EXISTS `store_item` (
  `store_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upvote`
--

CREATE TABLE IF NOT EXISTS `upvote` (
  `upvoter_id` int(11) NOT NULL,
  `upvotee_id` int(11) NOT NULL,
  `upvoted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `world_item`
--

CREATE TABLE IF NOT EXISTS `world_item` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `bundle_url` varchar(255) NOT NULL,
  `bundle_version` int(11) NOT NULL DEFAULT '0',
  `model_name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `world_item`
--

INSERT INTO `world_item` (`id`, `name`, `description`, `bundle_url`, `bundle_version`, `model_name`) VALUES
(1, 'Convite', '', 'world_item-LQcd1w', 0, 'go convite'),
(2, 'Bau de Tesouro', '', 'world_item-sHm9bT', 0, 'Bau de Tesouro'),
(3, 'Megafone', '', 'world_item-xF1PW4', 0, 'go Megafone'),
(4, 'Lixo', '', 'world_item-AEWc4D', 0, 'Lixo'),
(5, 'Coco', '', 'world_item-X63q6Q', 0, 'go Coco'),
(6, 'Celular do Lobisomem', '', 'world_item-Ut7pAS', 0, 'Celular do Lobisomem'),
(15, 'Caixa de Ferramentas', '', 'world_item-iZGXwa', 0, 'go Ferramentas'),
(16, 'Livro', '', 'world_item-KYj0d4', 0, 'Livro'),
(17, 'Macarrao', '', 'world_item-2NVn7S', 0, 'go macarrao'),
(19, 'Trufa', '', 'world_item-Qgk3j9', 0, 'go Trufas'),
(20, 'Galho', '', 'world_item-sUA3yY', 0, 'go Galho'),
(21, 'Maça', '', 'world_item-MQjWyG', 0, 'go Maca'),
(22, 'Flor', '', 'world_item-VjZ1Zb', 0, 'go Flor'),
(23, 'Papiro', '', 'world_item-z5V8M0', 0, 'Go Papiro');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessory`
--
ALTER TABLE `accessory`
 ADD PRIMARY KEY (`id`), ADD KEY `accessory_type` (`accessory_type`);

--
-- Indexes for table `accessory_type`
--
ALTER TABLE `accessory_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `analytic_data`
--
ALTER TABLE `analytic_data`
 ADD PRIMARY KEY (`id`), ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `animation`
--
ALTER TABLE `animation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `building`
--
ALTER TABLE `building`
 ADD PRIMARY KEY (`id`), ADD KEY `upgrade_id` (`upgrade_id`), ADD KEY `game_id` (`game_id`), ADD KEY `public_area_id` (`public_area_id`), ADD KEY `citizen_type` (`citizen_type`), ADD KEY `fixed_npc_id` (`fixed_npc_id`), ADD KEY `car_type` (`car_type`), ADD KEY `building_type_id` (`building_type_id`);

--
-- Indexes for table `building_model`
--
ALTER TABLE `building_model`
 ADD PRIMARY KEY (`id`), ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `building_model_texture`
--
ALTER TABLE `building_model_texture`
 ADD PRIMARY KEY (`id`), ADD KEY `building_model_id` (`building_model_id`);

--
-- Indexes for table `building_type`
--
ALTER TABLE `building_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car`
--
ALTER TABLE `car`
 ADD PRIMARY KEY (`id`), ADD KEY `car_type` (`car_type`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `character_visual`
--
ALTER TABLE `character_visual`
 ADD PRIMARY KEY (`player_id`), ADD KEY `headpiece_id` (`headpiece_id`), ADD KEY `hair_id` (`hair_id`), ADD KEY `eye_id` (`eye_id`), ADD KEY `mouth_id` (`mouth_id`), ADD KEY `upperbody_id` (`upperbody_id`), ADD KEY `lowerbody_id` (`lowerbody_id`), ADD KEY `feet_id` (`feet_id`), ADD KEY `skin_color_id` (`skin_id`), ADD KEY `body_accessory_id` (`body_accessory_id`), ADD KEY `character_visual_ibfk_9` (`hand_accessory_id`), ADD KEY `nose_id` (`nose_id`);

--
-- Indexes for table `citizen`
--
ALTER TABLE `citizen`
 ADD PRIMARY KEY (`id`), ADD KEY `citizen_type` (`citizen_type`);

--
-- Indexes for table `citizen_type`
--
ALTER TABLE `citizen_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `cloth`
--
ALTER TABLE `cloth`
 ADD PRIMARY KEY (`id`), ADD KEY `cloth_type` (`cloth_type`);

--
-- Indexes for table `cloth_type`
--
ALTER TABLE `cloth_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `costume`
--
ALTER TABLE `costume`
 ADD PRIMARY KEY (`id`), ADD KEY `foreign1` (`headpiece_id`), ADD KEY `foreign2` (`hair_id`), ADD KEY `foreign3` (`upperbody_id`), ADD KEY `foreign4` (`lowerbody_id`), ADD KEY `foreign5` (`feet_id`), ADD KEY `foreign7` (`body_accessory_id`), ADD KEY `foreign6` (`hand_accessory_id`);

--
-- Indexes for table `diggable_costume`
--
ALTER TABLE `diggable_costume`
 ADD PRIMARY KEY (`costume_id`);

--
-- Indexes for table `diggable_item`
--
ALTER TABLE `diggable_item`
 ADD PRIMARY KEY (`world_item_id`);

--
-- Indexes for table `emoticon`
--
ALTER TABLE `emoticon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facial_feature`
--
ALTER TABLE `facial_feature`
 ADD PRIMARY KEY (`id`), ADD KEY `facial_feature_type` (`facial_feature_type`);

--
-- Indexes for table `facial_feature_type`
--
ALTER TABLE `facial_feature_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `fixed_npc`
--
ALTER TABLE `fixed_npc`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_player_data`
--
ALTER TABLE `game_player_data`
 ADD PRIMARY KEY (`player_id`,`game_id`), ADD KEY `game_id` (`game_id`);

--
-- Indexes for table `game_ranking`
--
ALTER TABLE `game_ranking`
 ADD PRIMARY KEY (`game_id`,`player_id`,`ranking_id`), ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `gift`
--
ALTER TABLE `gift`
 ADD PRIMARY KEY (`id`), ADD KEY `from_id` (`from_id`), ADD KEY `to_id` (`to_id`), ADD KEY `gift_card_id` (`gift_card_id`), ADD KEY `headpiece_id` (`headpiece_id`), ADD KEY `hair_id` (`hair_id`), ADD KEY `cloth_id` (`cloth_id`), ADD KEY `accessory_id` (`accessory_id`), ADD KEY `item_id` (`item_id`,`costume_id`);

--
-- Indexes for table `gift_card`
--
ALTER TABLE `gift_card`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hair`
--
ALTER TABLE `hair`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headpiece`
--
ALTER TABLE `headpiece`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
 ADD PRIMARY KEY (`id`), ADD KEY `item_type` (`item_type`);

--
-- Indexes for table `item_type`
--
ALTER TABLE `item_type`
 ADD PRIMARY KEY (`type`);

--
-- Indexes for table `letter`
--
ALTER TABLE `letter`
 ADD PRIMARY KEY (`id`), ADD KEY `from_id` (`from_id`), ADD KEY `to_id` (`to_id`), ADD KEY `gift_card_id` (`gift_card_id`);

--
-- Indexes for table `nose`
--
ALTER TABLE `nose`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `login` (`login`,`parent_id`), ADD KEY `parent_id` (`parent_id`), ADD KEY `avatar_id` (`player_icon_id`);

--
-- Indexes for table `player_accessory`
--
ALTER TABLE `player_accessory`
 ADD PRIMARY KEY (`player_id`,`accessory_id`), ADD KEY `accessory_id` (`accessory_id`);

--
-- Indexes for table `player_building`
--
ALTER TABLE `player_building`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `player_id_2` (`player_id`,`slot`), ADD KEY `player_id` (`player_id`), ADD KEY `building_id` (`building_id`), ADD KEY `building_model_id` (`building_model_id`), ADD KEY `building_model_texture_id` (`building_model_texture_id`);

--
-- Indexes for table `player_cloth`
--
ALTER TABLE `player_cloth`
 ADD PRIMARY KEY (`player_id`,`cloth_id`), ADD KEY `cloth_id` (`cloth_id`);

--
-- Indexes for table `player_completed_action`
--
ALTER TABLE `player_completed_action`
 ADD PRIMARY KEY (`id`), ADD KEY `player_id` (`player_id`), ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `player_completed_action_build`
--
ALTER TABLE `player_completed_action_build`
 ADD PRIMARY KEY (`id`), ADD KEY `player_completed_action_id` (`player_completed_action_id`), ADD KEY `step_action_build_id` (`step_action_build_id`);

--
-- Indexes for table `player_completed_action_collect`
--
ALTER TABLE `player_completed_action_collect`
 ADD PRIMARY KEY (`id`), ADD KEY `player_completed_action_id` (`player_completed_action_id`), ADD KEY `step_action_collect_id` (`step_action_collect_id`);

--
-- Indexes for table `player_completed_action_dig`
--
ALTER TABLE `player_completed_action_dig`
 ADD PRIMARY KEY (`id`), ADD KEY `step_action_dig_id` (`step_action_dig_id`), ADD KEY `player_completed_action_dig_ibfk_1` (`player_completed_action_id`);

--
-- Indexes for table `player_completed_action_speak`
--
ALTER TABLE `player_completed_action_speak`
 ADD PRIMARY KEY (`id`), ADD KEY `player_completed_action_id` (`player_completed_action_id`), ADD KEY `step_action_speak_id` (`step_action_speak_id`);

--
-- Indexes for table `player_completed_quest`
--
ALTER TABLE `player_completed_quest`
 ADD PRIMARY KEY (`id`), ADD KEY `player_id` (`player_id`), ADD KEY `quest_id` (`quest_id`);

--
-- Indexes for table `player_hair`
--
ALTER TABLE `player_hair`
 ADD PRIMARY KEY (`player_id`,`hair_id`), ADD KEY `hair_id` (`hair_id`);

--
-- Indexes for table `player_headpiece`
--
ALTER TABLE `player_headpiece`
 ADD PRIMARY KEY (`player_id`,`headpiece_id`), ADD KEY `headpiece_id` (`headpiece_id`);

--
-- Indexes for table `player_icon`
--
ALTER TABLE `player_icon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_item`
--
ALTER TABLE `player_item`
 ADD PRIMARY KEY (`player_id`,`item_id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `player_quest`
--
ALTER TABLE `player_quest`
 ADD PRIMARY KEY (`player_id`,`current_step_id`), ADD KEY `current_step_id` (`current_step_id`);

--
-- Indexes for table `player_relationship`
--
ALTER TABLE `player_relationship`
 ADD PRIMARY KEY (`user1_id`,`user2_id`), ADD KEY `user2_id` (`user2_id`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_coords`
--
ALTER TABLE `pma__designer_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
 ADD PRIMARY KEY (`id`), ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
 ADD PRIMARY KEY (`page_nr`), ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
 ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`), ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
 ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
 ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `public_area`
--
ALTER TABLE `public_area`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quest`
--
ALTER TABLE `quest`
 ADD PRIMARY KEY (`id`), ADD KEY `fixed_npc_id` (`fixed_npc_id`);

--
-- Indexes for table `skin`
--
ALTER TABLE `skin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `step`
--
ALTER TABLE `step`
 ADD PRIMARY KEY (`id`), ADD KEY `quest_id` (`quest_id`);

--
-- Indexes for table `step_action_build`
--
ALTER TABLE `step_action_build`
 ADD PRIMARY KEY (`id`), ADD KEY `step_id` (`step_id`), ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `step_action_collect`
--
ALTER TABLE `step_action_collect`
 ADD PRIMARY KEY (`id`), ADD KEY `world_item_id` (`world_item_id`), ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `step_action_dig`
--
ALTER TABLE `step_action_dig`
 ADD PRIMARY KEY (`id`), ADD KEY `world_item_id` (`world_item_id`), ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `step_action_speak`
--
ALTER TABLE `step_action_speak`
 ADD PRIMARY KEY (`id`), ADD KEY `fixed_npc_id` (`fixed_npc_id`), ADD KEY `step_id` (`step_id`);

--
-- Indexes for table `step_require_building`
--
ALTER TABLE `step_require_building`
 ADD PRIMARY KEY (`id`), ADD KEY `step_id` (`step_id`), ADD KEY `building_id` (`building_id`);

--
-- Indexes for table `step_reward_accessory`
--
ALTER TABLE `step_reward_accessory`
 ADD PRIMARY KEY (`step_id`,`accessory_id`), ADD KEY `accessory_id` (`accessory_id`);

--
-- Indexes for table `step_reward_cloth`
--
ALTER TABLE `step_reward_cloth`
 ADD PRIMARY KEY (`step_id`,`cloth_id`), ADD KEY `cloth_id` (`cloth_id`);

--
-- Indexes for table `step_reward_hair`
--
ALTER TABLE `step_reward_hair`
 ADD PRIMARY KEY (`step_id`,`hair_id`), ADD KEY `hair_id` (`hair_id`);

--
-- Indexes for table `step_reward_headpiece`
--
ALTER TABLE `step_reward_headpiece`
 ADD PRIMARY KEY (`step_id`,`headpiece_id`), ADD KEY `headpiece_id` (`headpiece_id`);

--
-- Indexes for table `step_reward_item`
--
ALTER TABLE `step_reward_item`
 ADD PRIMARY KEY (`step_id`,`item_id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_accessory`
--
ALTER TABLE `store_accessory`
 ADD PRIMARY KEY (`store_id`,`accessory_id`), ADD KEY `accessory_id` (`accessory_id`);

--
-- Indexes for table `store_cloth`
--
ALTER TABLE `store_cloth`
 ADD PRIMARY KEY (`store_id`,`cloth_id`), ADD KEY `cloth_id` (`cloth_id`);

--
-- Indexes for table `store_costume`
--
ALTER TABLE `store_costume`
 ADD PRIMARY KEY (`store_id`,`costume_id`), ADD KEY `costume_id` (`costume_id`);

--
-- Indexes for table `store_hair`
--
ALTER TABLE `store_hair`
 ADD PRIMARY KEY (`store_id`,`hair_id`), ADD KEY `hair_id` (`hair_id`);

--
-- Indexes for table `store_headpiece`
--
ALTER TABLE `store_headpiece`
 ADD PRIMARY KEY (`store_id`,`headpiece_id`), ADD KEY `headpiece_id` (`headpiece_id`);

--
-- Indexes for table `store_item`
--
ALTER TABLE `store_item`
 ADD PRIMARY KEY (`store_id`,`item_id`), ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `upvote`
--
ALTER TABLE `upvote`
 ADD PRIMARY KEY (`upvoter_id`,`upvotee_id`), ADD KEY `upvotee_id` (`upvotee_id`);

--
-- Indexes for table `world_item`
--
ALTER TABLE `world_item`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessory`
--
ALTER TABLE `accessory`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `analytic_data`
--
ALTER TABLE `analytic_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=549;
--
-- AUTO_INCREMENT for table `animation`
--
ALTER TABLE `animation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- AUTO_INCREMENT for table `building_model`
--
ALTER TABLE `building_model`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `building_model_texture`
--
ALTER TABLE `building_model_texture`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=132;
--
-- AUTO_INCREMENT for table `building_type`
--
ALTER TABLE `building_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `car`
--
ALTER TABLE `car`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `citizen`
--
ALTER TABLE `citizen`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cloth`
--
ALTER TABLE `cloth`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `costume`
--
ALTER TABLE `costume`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `emoticon`
--
ALTER TABLE `emoticon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `facial_feature`
--
ALTER TABLE `facial_feature`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `fixed_npc`
--
ALTER TABLE `fixed_npc`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `gift`
--
ALTER TABLE `gift`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gift_card`
--
ALTER TABLE `gift_card`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hair`
--
ALTER TABLE `hair`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `headpiece`
--
ALTER TABLE `headpiece`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `letter`
--
ALTER TABLE `letter`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nose`
--
ALTER TABLE `nose`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `player_building`
--
ALTER TABLE `player_building`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `player_completed_action`
--
ALTER TABLE `player_completed_action`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `player_completed_action_build`
--
ALTER TABLE `player_completed_action_build`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_completed_action_collect`
--
ALTER TABLE `player_completed_action_collect`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `player_completed_action_dig`
--
ALTER TABLE `player_completed_action_dig`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_completed_action_speak`
--
ALTER TABLE `player_completed_action_speak`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `player_completed_quest`
--
ALTER TABLE `player_completed_quest`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player_icon`
--
ALTER TABLE `player_icon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `public_area`
--
ALTER TABLE `public_area`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quest`
--
ALTER TABLE `quest`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `skin`
--
ALTER TABLE `skin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `step`
--
ALTER TABLE `step`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `step_action_build`
--
ALTER TABLE `step_action_build`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `step_action_collect`
--
ALTER TABLE `step_action_collect`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `step_action_dig`
--
ALTER TABLE `step_action_dig`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `step_action_speak`
--
ALTER TABLE `step_action_speak`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `step_require_building`
--
ALTER TABLE `step_require_building`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `world_item`
--
ALTER TABLE `world_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accessory`
--
ALTER TABLE `accessory`
ADD CONSTRAINT `accessory_ibfk_1` FOREIGN KEY (`accessory_type`) REFERENCES `accessory_type` (`type`);

--
-- Constraints for table `analytic_data`
--
ALTER TABLE `analytic_data`
ADD CONSTRAINT `analytic_data_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`);

--
-- Constraints for table `building`
--
ALTER TABLE `building`
ADD CONSTRAINT `building_ibfk_1` FOREIGN KEY (`upgrade_id`) REFERENCES `building` (`id`),
ADD CONSTRAINT `building_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
ADD CONSTRAINT `building_ibfk_3` FOREIGN KEY (`public_area_id`) REFERENCES `public_area` (`id`),
ADD CONSTRAINT `building_ibfk_4` FOREIGN KEY (`citizen_type`) REFERENCES `citizen_type` (`type`),
ADD CONSTRAINT `building_ibfk_5` FOREIGN KEY (`fixed_npc_id`) REFERENCES `fixed_npc` (`id`),
ADD CONSTRAINT `building_ibfk_6` FOREIGN KEY (`car_type`) REFERENCES `car_type` (`type`),
ADD CONSTRAINT `building_ibfk_7` FOREIGN KEY (`building_type_id`) REFERENCES `building_type` (`id`);

--
-- Constraints for table `building_model`
--
ALTER TABLE `building_model`
ADD CONSTRAINT `building_model_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);

--
-- Constraints for table `building_model_texture`
--
ALTER TABLE `building_model_texture`
ADD CONSTRAINT `building_model_texture_ibfk_1` FOREIGN KEY (`building_model_id`) REFERENCES `building_model` (`id`);

--
-- Constraints for table `car`
--
ALTER TABLE `car`
ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`car_type`) REFERENCES `car_type` (`type`);

--
-- Constraints for table `character_visual`
--
ALTER TABLE `character_visual`
ADD CONSTRAINT `character_visual_ibfk_1` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`),
ADD CONSTRAINT `character_visual_ibfk_11` FOREIGN KEY (`body_accessory_id`) REFERENCES `accessory` (`id`),
ADD CONSTRAINT `character_visual_ibfk_12` FOREIGN KEY (`skin_id`) REFERENCES `skin` (`id`),
ADD CONSTRAINT `character_visual_ibfk_13` FOREIGN KEY (`nose_id`) REFERENCES `nose` (`id`),
ADD CONSTRAINT `character_visual_ibfk_14` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `character_visual_ibfk_2` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`),
ADD CONSTRAINT `character_visual_ibfk_3` FOREIGN KEY (`eye_id`) REFERENCES `facial_feature` (`id`),
ADD CONSTRAINT `character_visual_ibfk_5` FOREIGN KEY (`mouth_id`) REFERENCES `facial_feature` (`id`),
ADD CONSTRAINT `character_visual_ibfk_6` FOREIGN KEY (`upperbody_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `character_visual_ibfk_7` FOREIGN KEY (`lowerbody_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `character_visual_ibfk_8` FOREIGN KEY (`feet_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `character_visual_ibfk_9` FOREIGN KEY (`hand_accessory_id`) REFERENCES `accessory` (`id`);

--
-- Constraints for table `citizen`
--
ALTER TABLE `citizen`
ADD CONSTRAINT `citizen_ibfk_1` FOREIGN KEY (`citizen_type`) REFERENCES `citizen_type` (`type`);

--
-- Constraints for table `cloth`
--
ALTER TABLE `cloth`
ADD CONSTRAINT `cloth_ibfk_1` FOREIGN KEY (`cloth_type`) REFERENCES `cloth_type` (`type`);

--
-- Constraints for table `costume`
--
ALTER TABLE `costume`
ADD CONSTRAINT `costume_ibfk_1` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`),
ADD CONSTRAINT `costume_ibfk_2` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`),
ADD CONSTRAINT `costume_ibfk_3` FOREIGN KEY (`upperbody_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `costume_ibfk_4` FOREIGN KEY (`lowerbody_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `costume_ibfk_5` FOREIGN KEY (`feet_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `costume_ibfk_6` FOREIGN KEY (`hand_accessory_id`) REFERENCES `accessory` (`id`),
ADD CONSTRAINT `costume_ibfk_7` FOREIGN KEY (`body_accessory_id`) REFERENCES `accessory` (`id`);

--
-- Constraints for table `diggable_costume`
--
ALTER TABLE `diggable_costume`
ADD CONSTRAINT `diggable_costume_ibfk_1` FOREIGN KEY (`costume_id`) REFERENCES `costume` (`id`);

--
-- Constraints for table `diggable_item`
--
ALTER TABLE `diggable_item`
ADD CONSTRAINT `diggable_item_ibfk_1` FOREIGN KEY (`world_item_id`) REFERENCES `world_item` (`id`);

--
-- Constraints for table `facial_feature`
--
ALTER TABLE `facial_feature`
ADD CONSTRAINT `facial_feature_ibfk_1` FOREIGN KEY (`facial_feature_type`) REFERENCES `facial_feature_type` (`type`);

--
-- Constraints for table `game_player_data`
--
ALTER TABLE `game_player_data`
ADD CONSTRAINT `game_player_data_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `game_player_data_ibfk_2` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`);

--
-- Constraints for table `game_ranking`
--
ALTER TABLE `game_ranking`
ADD CONSTRAINT `game_ranking_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
ADD CONSTRAINT `game_ranking_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gift`
--
ALTER TABLE `gift`
ADD CONSTRAINT `gift_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `gift_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `gift_ibfk_3` FOREIGN KEY (`gift_card_id`) REFERENCES `gift_card` (`id`),
ADD CONSTRAINT `gift_ibfk_4` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`),
ADD CONSTRAINT `gift_ibfk_5` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`),
ADD CONSTRAINT `gift_ibfk_7` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`id`),
ADD CONSTRAINT `gift_ibfk_8` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`),
ADD CONSTRAINT `gift_ibfk_9` FOREIGN KEY (`item_id`) REFERENCES `costume` (`id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`item_type`) REFERENCES `item_type` (`type`);

--
-- Constraints for table `letter`
--
ALTER TABLE `letter`
ADD CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `letter_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `letter_ibfk_3` FOREIGN KEY (`gift_card_id`) REFERENCES `gift_card` (`id`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`),
ADD CONSTRAINT `player_ibfk_3` FOREIGN KEY (`player_icon_id`) REFERENCES `player_icon` (`id`);

--
-- Constraints for table `player_accessory`
--
ALTER TABLE `player_accessory`
ADD CONSTRAINT `player_accessory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_accessory_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`);

--
-- Constraints for table `player_building`
--
ALTER TABLE `player_building`
ADD CONSTRAINT `player_building_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_building_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`),
ADD CONSTRAINT `player_building_ibfk_3` FOREIGN KEY (`building_model_id`) REFERENCES `building_model` (`id`),
ADD CONSTRAINT `player_building_ibfk_4` FOREIGN KEY (`building_model_texture_id`) REFERENCES `building_model_texture` (`id`);

--
-- Constraints for table `player_cloth`
--
ALTER TABLE `player_cloth`
ADD CONSTRAINT `player_cloth_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_cloth_ibfk_2` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`id`);

--
-- Constraints for table `player_completed_action`
--
ALTER TABLE `player_completed_action`
ADD CONSTRAINT `player_completed_action_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_action_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `player_completed_action_build`
--
ALTER TABLE `player_completed_action_build`
ADD CONSTRAINT `player_completed_action_build_ibfk_1` FOREIGN KEY (`player_completed_action_id`) REFERENCES `player_completed_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_action_build_ibfk_2` FOREIGN KEY (`step_action_build_id`) REFERENCES `step_action_build` (`id`);

--
-- Constraints for table `player_completed_action_collect`
--
ALTER TABLE `player_completed_action_collect`
ADD CONSTRAINT `player_completed_action_collect_ibfk_1` FOREIGN KEY (`player_completed_action_id`) REFERENCES `player_completed_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_action_collect_ibfk_2` FOREIGN KEY (`step_action_collect_id`) REFERENCES `step_action_collect` (`id`);

--
-- Constraints for table `player_completed_action_dig`
--
ALTER TABLE `player_completed_action_dig`
ADD CONSTRAINT `player_completed_action_dig_ibfk_1` FOREIGN KEY (`player_completed_action_id`) REFERENCES `player_completed_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_action_dig_ibfk_2` FOREIGN KEY (`step_action_dig_id`) REFERENCES `step_action_dig` (`id`);

--
-- Constraints for table `player_completed_action_speak`
--
ALTER TABLE `player_completed_action_speak`
ADD CONSTRAINT `player_completed_action_speak_ibfk_1` FOREIGN KEY (`player_completed_action_id`) REFERENCES `player_completed_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_action_speak_ibfk_2` FOREIGN KEY (`step_action_speak_id`) REFERENCES `step_action_speak` (`id`);

--
-- Constraints for table `player_completed_quest`
--
ALTER TABLE `player_completed_quest`
ADD CONSTRAINT `player_completed_quest_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_completed_quest_ibfk_2` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`id`);

--
-- Constraints for table `player_hair`
--
ALTER TABLE `player_hair`
ADD CONSTRAINT `player_hair_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_hair_ibfk_2` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`);

--
-- Constraints for table `player_headpiece`
--
ALTER TABLE `player_headpiece`
ADD CONSTRAINT `player_headpiece_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_headpiece_ibfk_2` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`);

--
-- Constraints for table `player_item`
--
ALTER TABLE `player_item`
ADD CONSTRAINT `player_item_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `player_quest`
--
ALTER TABLE `player_quest`
ADD CONSTRAINT `player_quest_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `player_quest_ibfk_2` FOREIGN KEY (`current_step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `player_relationship`
--
ALTER TABLE `player_relationship`
ADD CONSTRAINT `player_relationship_ibfk_1` FOREIGN KEY (`user1_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `player_relationship_ibfk_2` FOREIGN KEY (`user2_id`) REFERENCES `player` (`id`);

--
-- Constraints for table `quest`
--
ALTER TABLE `quest`
ADD CONSTRAINT `quest_ibfk_1` FOREIGN KEY (`fixed_npc_id`) REFERENCES `fixed_npc` (`id`);

--
-- Constraints for table `step`
--
ALTER TABLE `step`
ADD CONSTRAINT `step_ibfk_1` FOREIGN KEY (`quest_id`) REFERENCES `quest` (`id`);

--
-- Constraints for table `step_action_build`
--
ALTER TABLE `step_action_build`
ADD CONSTRAINT `step_action_build_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_action_build_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);

--
-- Constraints for table `step_action_collect`
--
ALTER TABLE `step_action_collect`
ADD CONSTRAINT `step_action_collect_ibfk_1` FOREIGN KEY (`world_item_id`) REFERENCES `world_item` (`id`),
ADD CONSTRAINT `step_action_collect_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `step_action_dig`
--
ALTER TABLE `step_action_dig`
ADD CONSTRAINT `step_action_dig_ibfk_1` FOREIGN KEY (`world_item_id`) REFERENCES `world_item` (`id`),
ADD CONSTRAINT `step_action_dig_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `step_action_speak`
--
ALTER TABLE `step_action_speak`
ADD CONSTRAINT `step_action_speak_ibfk_1` FOREIGN KEY (`fixed_npc_id`) REFERENCES `fixed_npc` (`id`),
ADD CONSTRAINT `step_action_speak_ibfk_2` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`);

--
-- Constraints for table `step_require_building`
--
ALTER TABLE `step_require_building`
ADD CONSTRAINT `step_require_building_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_require_building_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`);

--
-- Constraints for table `step_reward_accessory`
--
ALTER TABLE `step_reward_accessory`
ADD CONSTRAINT `step_reward_accessory_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_reward_accessory_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`);

--
-- Constraints for table `step_reward_cloth`
--
ALTER TABLE `step_reward_cloth`
ADD CONSTRAINT `step_reward_cloth_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_reward_cloth_ibfk_2` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`id`);

--
-- Constraints for table `step_reward_hair`
--
ALTER TABLE `step_reward_hair`
ADD CONSTRAINT `step_reward_hair_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_reward_hair_ibfk_2` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`);

--
-- Constraints for table `step_reward_headpiece`
--
ALTER TABLE `step_reward_headpiece`
ADD CONSTRAINT `step_reward_headpiece_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_reward_headpiece_ibfk_2` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`);

--
-- Constraints for table `step_reward_item`
--
ALTER TABLE `step_reward_item`
ADD CONSTRAINT `step_reward_item_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `step` (`id`),
ADD CONSTRAINT `step_reward_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `store_accessory`
--
ALTER TABLE `store_accessory`
ADD CONSTRAINT `store_accessory_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_accessory_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessory` (`id`);

--
-- Constraints for table `store_cloth`
--
ALTER TABLE `store_cloth`
ADD CONSTRAINT `store_cloth_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_cloth_ibfk_2` FOREIGN KEY (`cloth_id`) REFERENCES `cloth` (`id`);

--
-- Constraints for table `store_costume`
--
ALTER TABLE `store_costume`
ADD CONSTRAINT `store_costume_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_costume_ibfk_2` FOREIGN KEY (`costume_id`) REFERENCES `costume` (`id`);

--
-- Constraints for table `store_hair`
--
ALTER TABLE `store_hair`
ADD CONSTRAINT `store_hair_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_hair_ibfk_2` FOREIGN KEY (`hair_id`) REFERENCES `hair` (`id`);

--
-- Constraints for table `store_headpiece`
--
ALTER TABLE `store_headpiece`
ADD CONSTRAINT `store_headpiece_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_headpiece_ibfk_2` FOREIGN KEY (`headpiece_id`) REFERENCES `headpiece` (`id`);

--
-- Constraints for table `store_item`
--
ALTER TABLE `store_item`
ADD CONSTRAINT `store_item_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
ADD CONSTRAINT `store_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`);

--
-- Constraints for table `upvote`
--
ALTER TABLE `upvote`
ADD CONSTRAINT `upvote_ibfk_1` FOREIGN KEY (`upvoter_id`) REFERENCES `player` (`id`),
ADD CONSTRAINT `upvote_ibfk_2` FOREIGN KEY (`upvotee_id`) REFERENCES `player` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
