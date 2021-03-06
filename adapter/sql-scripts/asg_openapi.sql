-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 14, 2014 at 01:29 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `asg_openapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `asg_error_records`
--

DROP TABLE IF EXISTS `asg_error_records`;
CREATE TABLE IF NOT EXISTS `asg_error_records` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_type_id` int(11) unsigned NOT NULL,
  `content_type_uuid` char(36) NOT NULL,
  `error_number` int(11) NOT NULL,
  `error_message` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asg_logs`
--

DROP TABLE IF EXISTS `asg_logs`;
CREATE TABLE IF NOT EXISTS `asg_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `org_id` int(10) NOT NULL DEFAULT '0',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `log_type` varchar(255) NOT NULL,
  `http_status` int(10) unsigned DEFAULT NULL,
  `http_status_text` varchar(255) DEFAULT NULL,
  `http_response_text` text,
  `summary` text,
  `content` text,
  `entity_type` varchar(100) DEFAULT '',
  `entity_id` int(10) unsigned DEFAULT NULL,
  `event` varchar(255) DEFAULT '',
  `event_status` varchar(255) DEFAULT '',
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `asg_product_show_map`
--

DROP TABLE IF EXISTS `asg_product_show_map`;
CREATE TABLE IF NOT EXISTS `asg_product_show_map` (
  `product_id` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asg_product_show_map`
--

INSERT INTO `asg_product_show_map` (`product_id`, `is_show`) VALUES
(231, 0);

-- --------------------------------------------------------

--
-- Table structure for table `asg_subscription_usage`
--

DROP TABLE IF EXISTS `asg_subscription_usage`;
CREATE TABLE IF NOT EXISTS `asg_subscription_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) unsigned NOT NULL,
  `subscription_uuid` char(36) NOT NULL,
  `organization_id` int(11) unsigned NOT NULL,
  `product_id` int(11) unsigned NOT NULL,
  `current_usage` int(10) unsigned DEFAULT '0',
  `pct` double unsigned NOT NULL DEFAULT '0',
  `alert_time` timestamp NULL DEFAULT NULL,
  `over_limit_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_assets`
--

DROP TABLE IF EXISTS `openapi_assets`;
CREATE TABLE IF NOT EXISTS `openapi_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=203 ;

--
-- Dumping data for table `openapi_assets`
--

INSERT INTO `openapi_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 361, 0, 'root.1', 'Root Asset', '{"core.login.site":{"11":1,"6":1,"2":1},"core.login.admin":{"11":1,"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"11":1,"7":1},"core.create":{"6":1},"core.delete":{"6":1},"core.edit":{"6":1},"core.edit.state":{"6":1},"core.edit.own":{"6":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 42, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(9, 1, 43, 44, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 45, 46, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 47, 48, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 49, 50, 1, 'com_login', 'com_login', '{}'),
(13, 1, 51, 52, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 53, 54, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 55, 56, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"11":1,"6":1},"core.create":{"10":1,"11":1,"12":1},"core.delete":[]}'),
(16, 1, 57, 58, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 59, 60, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 61, 62, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":{"11":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 63, 66, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 67, 68, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 69, 70, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 71, 72, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 73, 74, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 75, 78, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 79, 82, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 83, 84, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 29, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 64, 65, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 80, 81, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 76, 77, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 85, 86, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 87, 88, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 89, 90, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 91, 116, 1, 'com_cobalt', 'com_cobalt', '{}'),
(37, 8, 30, 41, 2, 'com_content.category.8', 'products', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(38, 37, 31, 40, 3, 'com_content.category.9', 'Featured products', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(39, 27, 19, 20, 3, 'com_content.article.1', 'Getting started', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 27, 21, 22, 3, 'com_content.article.2', 'products', '{"core.delete":{"6":1},"core.edit":{"6":1},"core.edit.state":{"6":1}}'),
(41, 38, 32, 33, 4, 'com_content.article.3', 'Featured products2', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(42, 38, 34, 35, 4, 'com_content.article.4', 'Featured products2 (2)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(43, 38, 36, 37, 4, 'com_content.article.5', 'Featured products2 (3)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(44, 38, 38, 39, 4, 'com_content.article.6', 'Featured products2 (4)', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(45, 1, 117, 118, 1, 'com_cobalt.section.1', 'Products', ''),
(46, 36, 92, 93, 2, 'com_cobalt.type.1', 'Cobalt Content Type: Product', ''),
(48, 1, 119, 120, 1, 'com_cobalt.field.2', 'Description', ''),
(49, 1, 121, 122, 1, 'com_cobalt.field.3', 'Thumbnail', ''),
(50, 36, 94, 95, 2, 'com_cobalt.type.2', 'Cobalt Content Type: API', ''),
(52, 1, 123, 124, 1, 'com_cobalt.field.5', 'Description', ''),
(53, 1, 125, 126, 1, 'com_cobalt.section.2', 'APIs', ''),
(54, 1, 127, 128, 1, 'com_cobalt.field.6', 'Contained in products', ''),
(55, 1, 129, 130, 1, 'com_cobalt.field.7', 'APIs', ''),
(56, 36, 96, 97, 2, 'com_cobalt.type.3', 'Cobalt Content Type: Gateway', ''),
(57, 1, 131, 132, 1, 'com_cobalt.field.8', 'Description', ''),
(61, 36, 98, 99, 2, 'com_cobalt.type.4', 'Cobalt Content Type: Environment', ''),
(62, 1, 133, 134, 1, 'com_cobalt.field.12', 'Description', ''),
(63, 1, 135, 136, 1, 'com_cobalt.field.13', 'Type', ''),
(64, 1, 137, 138, 1, 'com_cobalt.field.14', 'Basepath', ''),
(65, 1, 139, 140, 1, 'com_cobalt.field.15', 'Gateways', ''),
(66, 1, 141, 142, 1, 'com_cobalt.section.3', 'Environments', ''),
(67, 1, 143, 144, 1, 'com_cobalt.field.16', 'Environment', ''),
(68, 36, 100, 101, 2, 'com_cobalt.type.5', 'Cobalt Content Type: Organization', ''),
(69, 1, 145, 146, 1, 'com_cobalt.field.17', 'Description', ''),
(71, 1, 147, 148, 1, 'com_cobalt.field.19', 'Email', ''),
(72, 1, 149, 150, 1, 'com_cobalt.field.20', 'Contact details', ''),
(73, 1, 151, 152, 1, 'com_cobalt.field.21', 'Contact', ''),
(74, 1, 153, 154, 1, 'com_cobalt.field.22', 'REST resource path', ''),
(75, 1, 155, 156, 1, 'com_cobalt.field.23', 'Upload REST API spec', ''),
(76, 1, 157, 158, 1, 'com_cobalt.field.24', 'Attached documentation files', ''),
(77, 1, 159, 160, 1, 'com_cobalt.field.25', 'APIs', ''),
(78, 1, 161, 162, 1, 'com_cobalt.field.26', 'Environments', ''),
(79, 36, 102, 103, 2, 'com_cobalt.type.6', 'Cobalt Content Type: Operation', ''),
(80, 1, 163, 164, 1, 'com_cobalt.field.27', 'Description', ''),
(81, 1, 165, 166, 1, 'com_cobalt.field.28', 'URI path', ''),
(82, 1, 167, 168, 1, 'com_cobalt.field.29', 'REST method', ''),
(83, 1, 169, 170, 1, 'com_cobalt.field.30', 'API', ''),
(84, 1, 171, 172, 1, 'com_cobalt.field.31', 'Operations', ''),
(85, 1, 173, 174, 1, 'com_cobalt.field.32', 'Contact', ''),
(86, 1, 175, 176, 1, 'com_cobalt.field.33', 'Private in products', ''),
(87, 1, 177, 178, 1, 'com_cobalt.field.34', 'Public in products', ''),
(88, 1, 179, 180, 1, 'com_cobalt.field.35', 'Public environments', ''),
(89, 1, 181, 182, 1, 'com_cobalt.field.36', 'Private environments', ''),
(90, 36, 104, 105, 2, 'com_cobalt.type.7', 'Cobalt Content Type: Plan', ''),
(91, 1, 183, 184, 1, 'com_cobalt.field.37', 'Description', ''),
(92, 1, 185, 186, 1, 'com_cobalt.field.38', 'Contact', ''),
(93, 1, 187, 188, 1, 'com_cobalt.field.39', 'Level', ''),
(94, 1, 189, 190, 1, 'com_cobalt.section.4', 'Organizations', ''),
(95, 1, 191, 192, 1, 'com_cobalt.field.40', 'Owner organization', ''),
(96, 1, 193, 194, 1, 'com_cobalt.field.41', 'Owned APIs', ''),
(97, 1, 195, 196, 1, 'com_cobalt.field.42', 'Owner organization', ''),
(98, 1, 197, 198, 1, 'com_cobalt.field.43', 'Owned products', ''),
(99, 1, 199, 200, 1, 'com_cobalt.field.44', 'Inline documentation text', ''),
(100, 36, 106, 107, 2, 'com_cobalt.type.8', 'Cobalt Content Type: User Profile', ''),
(101, 1, 201, 202, 1, 'com_cobalt.field.45', 'First name', ''),
(102, 1, 203, 204, 1, 'com_cobalt.field.46', 'Last name', ''),
(103, 1, 205, 206, 1, 'com_cobalt.field.47', 'Member of organizations', ''),
(104, 1, 207, 208, 1, 'com_cobalt.field.48', 'Contact', ''),
(105, 1, 209, 210, 1, 'com_cobalt.field.49', 'Contact for products', ''),
(106, 1, 211, 212, 1, 'com_cobalt.field.50', 'Contact for organizations', ''),
(107, 1, 213, 214, 1, 'com_cobalt.field.51', 'Contact for APIs', ''),
(108, 1, 215, 216, 1, 'com_cobalt.field.52', 'Contact for plans', ''),
(109, 1, 217, 218, 1, 'com_cobalt.field.53', 'Product', ''),
(110, 1, 219, 220, 1, 'com_cobalt.field.54', 'Plans', ''),
(111, 1, 221, 222, 1, 'com_cobalt.field.55', 'Plan details', ''),
(112, 1, 223, 224, 1, 'com_cobalt.field.56', 'Members', ''),
(113, 36, 108, 109, 2, 'com_cobalt.type.9', 'Cobalt Content Type: Application', ''),
(114, 1, 225, 226, 1, 'com_cobalt.section.5', 'Applications', ''),
(115, 1, 227, 228, 1, 'com_cobalt.field.57', 'Description', ''),
(116, 1, 229, 230, 1, 'com_cobalt.field.58', 'Contact', ''),
(117, 1, 231, 232, 1, 'com_cobalt.field.59', 'Contact for applications', ''),
(118, 1, 233, 234, 1, 'com_cobalt.field.60', 'Owner organization', ''),
(119, 1, 235, 236, 1, 'com_cobalt.field.61', 'Owned applications', ''),
(120, 1, 237, 238, 1, 'com_cobalt.field.62', 'Used by applications', ''),
(121, 1, 239, 240, 1, 'com_cobalt.field.63', 'Products', ''),
(122, 1, 241, 242, 1, 'com_cobalt.field.64', 'Use OAuth?', ''),
(123, 1, 243, 244, 1, 'com_cobalt.field.65', 'Redirect URL', ''),
(124, 36, 110, 111, 2, 'com_cobalt.type.10', 'Cobalt Content Type: Subscription', ''),
(125, 1, 245, 246, 1, 'com_cobalt.section.6', 'Subscriptions', ''),
(126, 1, 247, 248, 1, 'com_cobalt.field.66', 'Description', ''),
(127, 1, 249, 250, 1, 'com_cobalt.field.67', 'Contact', ''),
(128, 1, 251, 252, 1, 'com_cobalt.field.68', 'Contact for subscriptions', ''),
(129, 1, 253, 254, 1, 'com_cobalt.field.69', 'Plan', ''),
(130, 1, 255, 256, 1, 'com_cobalt.field.70', 'Subscriptions', ''),
(131, 1, 257, 258, 1, 'com_cobalt.field.71', 'Start date', ''),
(132, 1, 259, 260, 1, 'com_cobalt.field.72', 'End date', ''),
(133, 1, 261, 262, 1, 'com_cobalt.field.73', 'Subscribing organization', ''),
(134, 1, 263, 264, 1, 'com_cobalt.field.74', 'Subscriptions', ''),
(135, 1, 265, 266, 1, 'com_cobalt.field.75', 'API type', ''),
(137, 1, 267, 268, 1, 'com_cobalt.field.77', 'System user', ''),
(138, 1, 269, 270, 1, 'com_cobalt.field.78', 'Status', ''),
(139, 1, 271, 272, 1, 'com_cobalt.field.79', 'Rate limit', ''),
(140, 1, 273, 274, 1, 'com_cobalt.field.80', 'Quota limit', ''),
(141, 36, 112, 113, 2, 'com_cobalt.type.11', 'Cobalt Content Type: Key', ''),
(142, 1, 275, 276, 1, 'com_cobalt.field.81', 'Type', ''),
(143, 1, 277, 278, 1, 'com_cobalt.field.82', 'Key', ''),
(144, 1, 279, 280, 1, 'com_cobalt.field.83', 'Secret', ''),
(145, 1, 281, 282, 1, 'com_cobalt.field.84', 'Expiration date', ''),
(146, 1, 283, 284, 1, 'com_cobalt.field.85', 'Status', ''),
(147, 1, 285, 286, 1, 'com_cobalt.field.86', 'Application', ''),
(148, 1, 287, 288, 1, 'com_cobalt.field.87', 'Keys', ''),
(149, 1, 289, 290, 1, 'com_cobalt.field.88', 'User type', ''),
(150, 1, 291, 292, 1, 'com_cobalt.field.89', 'Management URL', ''),
(162, 1, 293, 294, 1, 'com_cobalt.field.101', 'Username', ''),
(163, 1, 295, 296, 1, 'com_cobalt.field.102', 'Email', ''),
(164, 1, 297, 298, 1, 'com_cobalt.field.103', 'uuid', ''),
(165, 1, 299, 300, 1, 'com_cobalt.field.104', 'uuid', ''),
(166, 1, 301, 302, 1, 'com_cobalt.field.105', 'uuid', ''),
(167, 1, 303, 304, 1, 'com_cobalt.field.106', 'uuid', ''),
(168, 1, 305, 306, 1, 'com_cobalt.field.107', 'uuid', ''),
(169, 1, 307, 308, 1, 'com_cobalt.field.108', 'uuid', ''),
(170, 1, 309, 310, 1, 'com_cobalt.field.109', 'uuid', ''),
(171, 1, 311, 312, 1, 'com_cobalt.field.110', 'uuid', ''),
(172, 1, 313, 314, 1, 'com_cobalt.field.111', 'uuid', ''),
(173, 1, 315, 316, 1, 'com_cobalt.field.112', 'uuid', ''),
(174, 1, 317, 318, 1, 'com_cobalt.field.113', 'uuid', ''),
(175, 1, 319, 320, 1, 'com_cobalt.field.114', 'Product', ''),
(176, 1, 321, 322, 1, 'com_cobalt.field.115', 'Owned subscriptions', ''),
(177, 1, 323, 324, 1, 'com_cobalt.field.116', 'Owner application', ''),
(178, 1, 325, 326, 1, 'com_cobalt.field.117', 'Inline documentation', ''),
(179, 1, 327, 328, 1, 'com_cobalt.field.118', 'Attached documentation files', ''),
(180, 1, 329, 330, 1, 'com_cobalt.field.119', 'Icon', ''),
(181, 1, 331, 332, 1, 'com_cobalt.field.120', 'Price or keyword', ''),
(182, 27, 23, 24, 3, 'com_content.article.7', 'Support', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(183, 1, 333, 334, 1, 'com_cobalt.field.121', 'Contact phone number', ''),
(187, 1, 335, 336, 1, 'com_cobalt.field.122', 'Organization type', ''),
(188, 1, 337, 338, 1, 'com_cobalt.field.123', 'Auto subscribed', ''),
(189, 36, 114, 115, 2, 'com_cobalt.type.12', 'Cobalt Content Type: Scopes', ''),
(190, 1, 339, 340, 1, 'com_cobalt.field.124', 'Description', ''),
(191, 1, 341, 342, 1, 'com_cobalt.section.7', 'Scopes', ''),
(192, 1, 343, 344, 1, 'com_cobalt.field.125', 'Scopes', ''),
(193, 1, 345, 346, 1, 'com_cobalt.field.126', 'Applications', ''),
(194, 27, 25, 26, 3, 'com_content.article.8', 'Terms & Conditions', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(195, 27, 27, 28, 3, 'com_content.article.9', 'Privacy Policy', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(196, 1, 347, 348, 1, 'com_cobalt.field.127', 'Upload WSDL API spec', ''),
(197, 1, 349, 350, 1, 'com_cobalt.field.128', 'SOAP action', ''),
(198, 1, 351, 352, 1, 'com_cobalt.field.129', 'Product-specific terms & conditions', ''),
(199, 1, 353, 354, 1, 'com_tibcoopenapidatabaseimport', 'tibcoopenapidatabaseimport', '{}'),
(200, 1, 355, 356, 1, 'com_cobalt.category.5', 'Reference Data', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(201, 1, 357, 358, 1, 'com_cobalt.category.6', 'Market Analysis', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(202, 1, 359, 360, 1, 'com_cobalt.field.130', 'Usage alert threshold', '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_associations`
--

DROP TABLE IF EXISTS `openapi_associations`;
CREATE TABLE IF NOT EXISTS `openapi_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_banners`
--

DROP TABLE IF EXISTS `openapi_banners`;
CREATE TABLE IF NOT EXISTS `openapi_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_banner_clients`
--

DROP TABLE IF EXISTS `openapi_banner_clients`;
CREATE TABLE IF NOT EXISTS `openapi_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_banner_tracks`
--

DROP TABLE IF EXISTS `openapi_banner_tracks`;
CREATE TABLE IF NOT EXISTS `openapi_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_categories`
--

DROP TABLE IF EXISTS `openapi_categories`;
CREATE TABLE IF NOT EXISTS `openapi_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `openapi_categories`
--

INSERT INTO `openapi_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 17, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(8, 37, 1, 13, 16, 1, 'products', 'com_content', 'products', 'products', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":"","tags":null}', 129, '2013-08-01 09:24:12', 0, '0000-00-00 00:00:00', 0, '*', 1),
(9, 38, 8, 14, 15, 2, 'products/featured-products', 'com_content', 'Featured products', 'featured-products', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":"","tags":null}', 129, '2013-08-01 09:24:25', 129, '2013-08-01 09:24:37', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_contact_details`
--

DROP TABLE IF EXISTS `openapi_contact_details`;
CREATE TABLE IF NOT EXISTS `openapi_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_content`
--

DROP TABLE IF EXISTS `openapi_content`;
CREATE TABLE IF NOT EXISTS `openapi_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `openapi_content`
--

INSERT INTO `openapi_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 39, 'Getting started', 'getting-started', '<p>{loadposition started_banner}</p>\r\n<p>{loadposition register_button}</p>\r\n<div class="trial-guide"><dl><dt>1</dt><dd>\r\n<h4><a href="index.php/products">Explore<br /><img src="images/icons/icon-explore.png" width="56" height="54" /></a></h4>\r\n<p>Find the coolest API''s</p>\r\n</dd></dl><dl><dt>2</dt><dd>\r\n<h4><a href="index.php?option=com_content&amp;view=article&amp;id=7&amp;catid=2&amp;Itemid=122" title="Register">Register<br /><img src="images/icons/icon-experience.png" width="50" height="55" /></a></h4>\r\n<p>Get an account</p>\r\n</dd></dl><dl><dt>3</dt><dd>\r\n<h4><a href="index.php/applications">Build<br /><img src="images/icons/icon-build.png" width="64" height="55" /></a></h4>\r\n<p>Start creating your apps</p>\r\n</dd></dl></div>\r\n<p>{loadposition home_featured_products}</p>', '', 1, 2, '2013-08-01 09:57:59', 129, '', '2014-02-11 07:44:55', 129, 0, '0000-00-00 00:00:00', '2013-08-01 09:57:59', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 22, 4, '', '', 1, 2296, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(2, 40, 'products', 'products', '<p>Browse the wide selection of available products to find the APIs for your needs. {loadposition MoreInfoFeaturedProducts} {loadposition products_cat_tab}</p>', '', 0, 2, '2013-08-01 09:58:53', 129, '', '2013-09-23 05:37:57', 129, 0, '0000-00-00 00:00:00', '2013-08-01 09:58:53', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 4, 3, '', '', 1, 9, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(3, 41, 'Featured products2', 'featured-products2', '<p>hello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro text</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes</p>', 0, 9, '2013-08-01 10:02:52', 129, '', '2013-08-01 10:38:26', 129, 0, '0000-00-00 00:00:00', '2013-08-01 10:02:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/products\\/g_integrate_detail.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 3, '', '', 1, 2, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(4, 42, 'Featured products2 (2)', 'featured-products2-2', '<p>hello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro text</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes</p>', 0, 9, '2013-08-01 10:02:52', 129, '', '2013-08-01 10:38:26', 0, 0, '0000-00-00 00:00:00', '2013-08-01 10:02:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/products\\/g_integrate_detail.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 2, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(5, 43, 'Featured products2 (3)', 'featured-products2-3', '<p>hello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro text</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes</p>', 0, 9, '2013-08-01 10:02:52', 129, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-08-01 10:02:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/products\\/g_integrate_detail.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(6, 44, 'Featured products2 (4)', 'featured-products2-4', '<p>hello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro texthello intro text</p>\r\n', '\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes</p>', 0, 9, '2013-08-01 10:02:52', 129, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2013-08-01 10:02:52', '0000-00-00 00:00:00', '{"image_intro":"images\\/products\\/g_integrate_detail.png","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(7, 182, 'Support', 'support', '<div id="support_area"><form>\r\n<p>Customize the text on this page by editing the Support article <a href="administrator/index.php?option=com_content&amp;view=articles">here</a>.</p>\r\n<p>??</p>\r\n<h3>Customer support</h3>\r\n<p><span id="u_name_span">Guest</span>,<br /> <br />To contact us for support or more information, please submit the following form, or reach us using the contact information listed.</p>\r\n<p>Your Name</p>\r\n<input type="text" name="fname" value="First Name" /><input type="text" name="lname" value="Last Name" />\r\n<p class="sdfsdf">Email</p>\r\n<input type="text" name="email" value="Type your email id" />\r\n<p>Type your query</p>\r\n<textarea name="content"></textarea> <br /> <button class="btn">Send your query</button></form>\r\n<div class="right_info">\r\n<div>\r\n<ul>\r\n<li>\r\n<p>Host Organization support<br />1-555-555-5555<br />Mon-Fri between 8AM - 8PM</p>\r\n</li>\r\n<li>\r\n<p>1234 Some St.<br />Some City<br />CA, 99999</p>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', '', 1, 2, '2013-10-04 01:44:07', 129, '', '2014-02-11 03:41:57', 129, 0, '0000-00-00 00:00:00', '2013-10-04 01:44:07', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"0","show_email_icon":"0","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 15, 2, '', '', 1, 73, '{"tags":null}', 0, '*', ''),
(8, 194, 'Terms & Conditions', 'terms-conditions', '<p><span style="line-height: 1.3em;">??</span></p>\r\n<p><span style="line-height: 1.3em;">??</span></p>\r\n<p><span style="line-height: 1.3em;">Customize the text on this page by editing the Terms &amp; Conditions article </span><a href="administrator/index.php?option=com_content&amp;view=articles" style="line-height: 1.3em;">here</a><span style="line-height: 1.3em;">.</span></p>', '', 1, 2, '2013-11-01 19:50:45', 129, '', '2014-02-11 03:41:08', 129, 0, '0000-00-00 00:00:00', '2013-11-01 19:50:45', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 7, 1, '', '', 1, 16, '{"tags":null}', 0, '*', ''),
(9, 195, 'Privacy Policy', 'privacy-policy', '<p style="color: #333333; font-family: Tahoma, Helvetica, Arial, sans-serif; font-size: 12px; font-weight: normal;"><span style="line-height: 1.3em;">??</span></p>\r\n<p style="color: #333333; font-family: Tahoma, Helvetica, Arial, sans-serif; font-size: 12px; font-weight: normal;"><span style="line-height: 1.3em;">??</span></p>\r\n<p style="color: #333333; font-family: Tahoma, Helvetica, Arial, sans-serif; font-size: 12px; font-weight: normal;"><span style="line-height: 1.3em;">Customize the text on this page by editing the Privacy Policy article??</span><a href="administrator/index.php?option=com_content&amp;view=articles" style="line-height: 1.3em;">here</a><span style="line-height: 1.3em;">.</span></p>', '', 1, 2, '2013-11-01 20:01:08', 129, '', '2014-02-11 03:41:28', 129, 0, '0000-00-00 00:00:00', '2013-11-01 20:01:08', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, '', '', 1, 10, '{"tags":null}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_contentitem_tag_map`
--

DROP TABLE IF EXISTS `openapi_contentitem_tag_map`;
CREATE TABLE IF NOT EXISTS `openapi_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `openapi_content_frontpage`
--

DROP TABLE IF EXISTS `openapi_content_frontpage`;
CREATE TABLE IF NOT EXISTS `openapi_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_content_rating`
--

DROP TABLE IF EXISTS `openapi_content_rating`;
CREATE TABLE IF NOT EXISTS `openapi_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_content_types`
--

DROP TABLE IF EXISTS `openapi_content_types`;
CREATE TABLE IF NOT EXISTS `openapi_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `openapi_content_types`
--

INSERT INTO `openapi_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}], "special": [{"fulltext":"fulltext"}]}', 'ContentHelperRoute::getArticleRoute'),
(2, 'Weblink', 'com_weblinks.weblink', '{"special":{"dbtable":"#__weblinks","key":"id","type":"Weblink","prefix":"WeblinksTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}], "special": []}', 'WeblinksHelperRoute::getWeblinkRoute'),
(3, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}], "special": [{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}]}', 'ContactHelperRoute::getContactRoute'),
(4, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}], "special": [{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}]}', 'NewsfeedsHelperRoute::getNewsfeedRoute'),
(5, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}], "special": [{}]}', 'UsersHelperRoute::getUserRoute'),
(6, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}], "special": [{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}]}', 'ContentHelperRoute::getCategoryRoute'),
(7, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}], "special": [{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}]}', 'ContactHelperRoute::getCategoryRoute'),
(8, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}], "special": [{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}]}', 'NewsfeedsHelperRoute::getCategoryRoute'),
(9, 'Weblinks Category', 'com_weblinks.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}], "special": [{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}]}', 'WeblinksHelperRoute::getCategoryRoute'),
(10, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__core_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":[{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}], "special": [{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}]}', 'TagsHelperRoute::getTagRoute');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_core_log_searches`
--

DROP TABLE IF EXISTS `openapi_core_log_searches`;
CREATE TABLE IF NOT EXISTS `openapi_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_email_templates`
--

DROP TABLE IF EXISTS `openapi_email_templates`;
CREATE TABLE IF NOT EXISTS `openapi_email_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `subject` text NOT NULL COMMENT 'email subject',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT 'email template content',
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL DEFAULT '1',
  `isHTML` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ASG email template' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `openapi_email_templates`
--

INSERT INTO `openapi_email_templates` (`id`, `subject`, `alias`, `content`, `language`, `created`, `created_by`, `last_modified`, `last_modified_by`, `published`, `isHTML`) VALUES
(1, 'Activate your account', 'resend_active_email', 'Hi {USER},\r\n\r\nPlease click on the following link to active your account.\r\n\r\n{ACTIVE_URL}\r\n\r\nUsername : {USER_NAME}\r\nPassword : {PASSWORD}', '', '2013-09-28 19:45:12', 129, '2014-02-24 20:14:10', 129, 1, 0),
(2, 'Subscription request notification', 'request_normal_plan_notify_admin_of_joomla', 'A new subscription has been requested. \r\n\r\nCreate subscription: {CREATE_SUB_URL}\r\nPlan: {PLAN_URL}\r\nProduct: {PRODUCT_URL}\r\nRequesting organization: {ORGANIZATION_URL}\r\nUser: {USER_URL}\r\n', '', '2013-09-28 19:47:19', 129, '2014-02-24 20:05:39', 129, 1, 0),
(3, 'Subscription request', 'request_normal_plan_notify_admin_contacter_of_organization', 'A new subscription has been requested.\r\n\r\nPlan: {PLAN_URL}\r\nProduct: {PRODUCT_URL}\r\nRequesting organization: {ORGANIZATION_URL}\r\nUser: {USER_URL}\r\n\r\n', '', '2013-10-01 17:31:28', 129, '2014-02-24 20:07:10', 129, 1, 0),
(4, 'Subscription request received', 'request_plan_notify_requester', 'Hi,\r\n\r\nWe have received your request and will contact you soon. \r\n', '', '2013-10-01 17:34:02', 129, '2014-02-24 19:47:46', 129, 1, 0),
(5, 'Custom plan Request', 'request_custom_plan_notify_admin_contacter', 'Notification: A custom plan has been requested.  \r\n\r\nProduct: {PRODUCT_URL}\r\nRequesting organization: {ORGANIZATION_URL}\r\nRate limit: {RATE_LIMIT}\r\nQuota limit: {QUOTA_LIMIT}\r\nAdditional request: {ADDITIONAL_REQUEST}\r\nUser: {USER_URL}\r\n', '', '2013-10-01 17:37:17', 129, '2014-02-24 18:18:07', 129, 1, 0),
(6, 'Subscription is active', 'notification_of_create_subscription', 'Hi,\r\n\r\nYour subscription is now active. Click here for details: {SUBSCRIPTION_URL}\r\n', '', '2013-10-01 18:19:07', 129, '2014-02-24 20:03:45', 129, 1, 0),
(7, 'Support request from: {USER}', 'request_email', 'A new support request has been submitted from {USER}({EMAIL}):  {USER_CONTENT}', '', '2013-11-19 01:05:09', 129, '2014-02-24 20:11:22', 129, 1, 0),
(8, 'API usage threshold alert: {SUBSCRIPTION_URL}', 'api_limit_usage_threshold', 'Warning: API usage has exceeded your alert threshold for this period.\r\n\r\nOrganization: {ORGANIZATION_URL}\r\n\r\nSubscription: {SUBSCRIPTION_URL}\r\n\r\nYou have used {USED_PERCENTAGE}%.\r\n', '', '2013-12-24 06:53:04', 129, '2014-02-24 18:42:38', 129, 1, 0),
(9, 'API usage limit reached: {SUBSCRIPTION_URL}', 'api_limit_usage_full', 'Error: Your API usage limit has been reached for this period. Additional calls to this API will fail. \r\n\r\nOrganization: {ORGANIZATION_URL}\r\n\r\nSubscription: {SUBSCRIPTION_URL}\r\n', '', '2013-12-24 06:54:42', 129, '2014-02-24 18:41:43', 129, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_extensions`
--

DROP TABLE IF EXISTS `openapi_extensions`;
CREATE TABLE IF NOT EXISTS `openapi_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10138 ;

--
-- Dumping data for table `openapi_extensions`
--

INSERT INTO `openapi_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","info_block_position":"0","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_tags":"1","show_icons":"1","show_print_icon":"0","show_email_icon":"0","show_hits":"1","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_heading_title_text":"1","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","feed_show_readmore":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"11":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"33":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"34":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"35":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"13":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"14":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"27":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"28":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"29":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"30":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"31":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"32":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"18":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"19":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"20":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"21":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"22":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"23":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"24":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"25":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"26":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"1","mail_to_admin":"0","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":""}', '{"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2013, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2.3","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"12.2","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2012","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.6","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0);
INSERT INTO `openapi_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 2, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"0","register-require_aboutme":"0","register-require_tos":"2","register_tos_article":"","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"April 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.1","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'Cobalt - Field - Uploads', 'file', 'uploads', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Uploads","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.23","description":"Cobalt - Field - Uploads: This is advanced uploads field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'com_cobalt', 'component', 'com_cobalt', '', 1, 1, 0, 0, '{"name":"com_cobalt","type":"component","creationDate":"November 2011","author":"MintJoomla","copyright":" (c) 2005-2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.359","description":"","group":""}', '{"general_upload":"uploads","folder_format":"Y-m","community":"com_cobalt","moderator":"129","captcha":"recaptcha","general_copyright":"0","compatibility":"0","general_help":"0","gravatar":"0","cron_key":"","map_key":"","sef_router":"main_router.php","sef_category":"0","filter_nofollow":"1","robots":"","author":"","rights":"","metakey":"","metadesc":"","censor":"1","censor_words":"fuck, porn, porno, bitch","censor_replace":"CENSORED"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'Cobalt - Additional Templates', 'file', 'install', '', 0, 1, 0, 0, '{"name":"Cobalt - Additional Templates","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.432","description":"Cobalt 8 - Additional templates","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'Cobalt - Module - Categories', 'module', 'mod_cobalt_category', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Categories","type":"module","creationDate":"March 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.35","description":" Cobalt Categories Module ","group":""}', '{"section_id":"","init_cat":"","show_section":"2","cat_empty":"1","cat_nums":"current","mode":"2","order":"1","subcat_limit":"5","section_class":"","header_text":"","footer_text":"","class_sfx":"","moduleclass_sfx":"","records":"0","records_limit":"5","levels":"Category","select_width":"150"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'Cobalt - Module - Filters', 'module', 'mod_cobalt_filters', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Filters","type":"module","creationDate":"March 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.40","description":" Cobalt - Filters ","group":""}', '{"section_id":"","show_icons":"1","field_id_exclude":"","filter_search":"1","filter_type_type":"1","filter_users_type":"1","filter_category_type":"1","filter_tags_type":"1","type_label":"Content Type","user_label":"Author","category_label":"Category","tag_label":"Tags","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'Cobalt - Module - Who Follows User', 'module', 'mod_cobalt_followers', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Who Follows User","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.25","description":" Cobalt followers or current user ","group":""}', '{"ava_style":"img-polaroid","ava_size":"32","limit":"10","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'Cobalt - Module - Whom User Follows', 'module', 'mod_cobalt_ifollow', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Whom User Follows","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.25","description":" Users that current user is following.  ","group":""}', '{"ava_style":"img-polaroid","ava_size":"32","limit":"10","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'Cobalt - Module - Notifications', 'module', 'mod_cobalt_notifications', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Notifications","type":"module","creationDate":"March 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.24","description":" Cobalt - Notifications ","group":""}', '{"section_id":"","moduleclass_sfx":"","height":"200","time":"3","limit":"5","noti_width":"320","noti_position":"bottom-left","noti_style":"bangTidy","ntmoo_parent":"","ntmoo_width":"300","ntmoo_height":"50","ntmoo_time":"5000","ntmoo_updtime":"60","ntmoo_sticky":"true","ntmoo_locationv":"top","ntmoo_locationh":"right","ntmoo_positionv":"10","ntmoo_positionh":"10","ntmoo_margin":"5","ntmoo_opacity_time":"750","ntmoo_close_time":"750","ntmoo_scroll_time":"250","ntmoo_opacity":"0.95","ntmoo_class":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'Cobalt - Module - Article Participants', 'module', 'mod_cobalt_participants', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Article Participants","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.18","description":" Cobalt Article Prticipants ","group":""}', '{"ava_style":"img-polaroid","ava_size":"32","limit":"10","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'Cobalt - Module - Records', 'module', 'mod_cobalt_records', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Records","type":"module","creationDate":"March 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.37","description":" Cobalt Records ","group":""}', '{"section_id":"","types":"","orderby":"r.ctime DESC","view_what":"","cat_restrict":"0","user_restrict":"0","tmpl":"","limit":"5","lang_mode":"0","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'Cobalt - Module - Section Statictics', 'module', 'mod_cobalt_sectionstatistics', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Section Statictics","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.27","description":" Cobalt Section Statictics ","group":""}', '{"section_id":"","current_section":"0","records_num":"Articles","comments_num":"Comments","authors_num":"Authors","members_num":"Members","views_num":"Views","use_anonim":"1","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10012, 'Cobalt - Module - Tag Cloud', 'module', 'mod_cobalt_tagcloud', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - Tag Cloud","type":"module","creationDate":"March 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.40","description":" Cobalt Tag Cloud ","group":""}', '{"section_id":"","depends_on_cat":"0","depends_on_user":"0","tmpl":"default.php","ordering":"RAND()","show_section_name":"0","item_tag_num":"0","html_tags":"H1, H2, H3, H4, H5, H6, strong, b, em, big, small","limit":"50","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10013, 'Cobalt - Module - User Statictics', 'module', 'mod_cobalt_userstatistics', '', 0, 1, 0, 0, '{"name":"Cobalt - Module - User Statictics","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.19","description":" Cobalt User Statictics ","group":""}', '{"section_id":"","current_section":"0","created":"1","comments_left":"1","commented":"1","readers":"1","use_anonim":"1","visited":"1","rating_average":"1","whofollow":"1","followed":"1","whofavorited":"1","favorited":"1","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'Cobalt - Plugin - Formatter - INI', 'plugin', 'formatter_ini', 'mint', 0, 0, 1, 0, '{"name":"Cobalt - Plugin - Formatter - INI","type":"plugin","creationDate":"October 15 2012","author":"MintJoomla","copyright":"MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.20","description":"\\n\\t INI formatter plugin for Cobalt 8 \\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'Cobalt - Plugin - Formatter - Joomla Update Service', 'plugin', 'formatter_joomlaupdate', 'mint', 0, 0, 1, 0, '{"name":"Cobalt - Plugin - Formatter - Joomla Update Service","type":"plugin","creationDate":"October 15 2012","author":"MintJoomla","copyright":"MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.21","description":"\\n\\t XML formatter plugin for Cobalt 8 \\n\\t","group":""}', '{"type_id":"","field_type":"","field_element":"","field_folder":"","field_client":"","field_version":"","field_tag":"","field_down":"","field_descr":"","server_name":"My Ste Extensions Updates","maintainer":"Your name","maintainerurl":"http:\\/\\/yoursite.com","targetplatform":"2.5"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'Cobalt - Plugin - Formatter - JSON', 'plugin', 'formatter_json', 'mint', 0, 0, 1, 0, '{"name":"Cobalt - Plugin - Formatter - JSON","type":"plugin","creationDate":"October 15 2012","author":"MintJoomla","copyright":"MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.20","description":"\\n\\t Json formatter plugin for Cobalt 8 \\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'Cobalt - Plugin - Formatter - XML', 'plugin', 'formatter_xml', 'mint', 0, 0, 1, 0, '{"name":"Cobalt - Plugin - Formatter - XML","type":"plugin","creationDate":"October 15 2012","author":"MintJoomla","copyright":"MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.20","description":"\\n\\t XML formatter plugin for Cobalt 8 \\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'Content - Plugin - Review/Discuss with Cobalt 7', 'plugin', 'cobalt', 'content', 0, 0, 1, 0, '{"name":"Content - Plugin - Review\\/Discuss with Cobalt 7","type":"plugin","creationDate":"October 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla. All rights reserved.","authorEmail":"support@mintjoomla.org","authorUrl":"www.mintjoomla.org","version":"8.12","description":"Inserts discussions\\/reviews into core Joomla articles.","group":""}', '{"section_id":"","orderby":"r.ctime DESC","tmpl":"default","limit":"10","rating":"1","rating_tmpl":"default","defcat":"","joomcat":"","descr":"","title":"Discussions","title_all":"All discussions of %s","button":"Start a Discussion","button_all":"All Discussions"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'Content - Glossary', 'plugin', 'glossary', 'content', 0, 0, 1, 0, '{"name":"Content - Glossary","type":"plugin","creationDate":"27 July 2011","author":"Mighty Extensions","copyright":"Copyright Mighty Extensions","authorEmail":"support@mightyextensions.com","authorUrl":"http:\\/\\/www.mightyextensions.com","version":"8.15","description":"This plugin allow you to turn Mighty resources section\\n\\t\\tinto glossary. In Mighty resources you create section and add articles\\n\\t\\tthere, that will be glossary list. Then in this plugin you select that\\n\\t\\tsection\\tand all words will be highlighted, linked and tooltiped. Good \\n\\t\\tis you can have public glossary list on the site, and even allow other \\n\\t\\tusers to submit new glossary elements. Note: You need turn on \\n\\t\\tglossary plugin in HTML field. Glossary works only in HTML field.\\n\\t","group":""}', '{"link":"0","css":"cursor:pointer; background-color:yellow; text-decoration:underline;"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 'Cobalt - Plugin - Tools', 'plugin', 'toolset', 'mint', 0, 1, 1, 0, '{"name":"Cobalt - Plugin - Tools","type":"plugin","creationDate":"February 17 2009","author":"MintJoomla","copyright":"MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.28","description":"\\n\\t Tools plugin for Cobalt 7 \\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'Search - Cobalt', 'plugin', 'cobalt', 'search', 0, 0, 1, 0, '{"name":"Search - Cobalt","type":"plugin","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.8","description":"Search Plugin for Cobalt","group":""}', '{"search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'Cobalt - Comments - Cackle', 'file', 'cackle', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Cackle","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.13","description":"Cobalt - Comments - Cackle","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'Cobalt - Comments - Cobalt Content Type', 'file', 'cobalt', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Cobalt Content Type","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.28","description":"Cobalt - Comments - Cobalt Content Type","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'Cobalt - Comments - Core', 'file', 'core', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Core","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.12","description":"Cobalt - Comments - Core is a build-in comment system","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'Cobalt - Comments - Custom', 'file', 'custom', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Custom","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.8","description":"Cobalt - Comments - Custom to integrate ant JS based comment system","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'Cobalt - Comments - DISQUS', 'file', 'disqus', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - DISQUS","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.10","description":"Cobalt - Comments - DISQUS","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 'Cobalt - Comments - Facebook', 'file', 'facebook', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Facebook","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.8","description":"Cobalt - Comments - Facebook","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10028, 'Cobalt - Comments - IntenceDebate', 'file', 'intencedebate', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - IntenceDebate","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.8","description":"Cobalt - Comments - IntenceDebate","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10029, 'Cobalt - Comments - JComment', 'file', 'jcomment', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - JComment","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.10","description":"Cobalt - Comments - JComment","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10030, 'Cobalt - Comments - Komento', 'file', 'komento', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Komento","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.14","description":"Cobalt - Comments - Komento","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10031, 'Cobalt - Comments - ????он??ак??е', 'file', 'vk', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - \\u0412\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0435","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.7","description":"Cobalt - Comments - \\u0412\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u0435","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10032, 'Cobalt - Gateway - 2Checkout', 'file', '2checkout', '', 0, 1, 0, 0, '{"name":"Cobalt - Gateway - 2Checkout","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.13","description":"Cobalt - Gateway - PayPal: This is payment gateway 2CO","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10033, 'Cobalt - Gateway - PayPal', 'file', 'paypal', '', 0, 1, 0, 0, '{"name":"Cobalt - Gateway - PayPal","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.35","description":"Cobalt - Gateway - PayPal: This is payment gateway PayPal","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10034, 'Cobalt - Field - Audio', 'file', 'audio', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Audio","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.49","description":"Cobalt - Field - Audio: This is advanced audio field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10035, 'Cobalt - Field - Boolean', 'file', 'boolean', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Boolean","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.41","description":"Cobalt - Field - Boolean: This is advanced boolean field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'Cobalt - Field - Checkbox', 'file', 'checkbox', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Checkbox","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.60","description":"Cobalt - Field - Checkbox: This is advanced checkbox field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'Cobalt - Field - Datetime', 'file', 'datetime', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Datetime","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.63","description":"Cobalt - Field - Datetime: This is advanced datetime field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10038, 'Cobalt - Field - Digits', 'file', 'digits', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Digits","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.36","description":"Cobalt - Field - Digits: This is advanced digits field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 'Cobalt - Field - Email', 'file', 'email', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Email","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.51","description":"Cobalt - Field - Email: This is advanced email field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10040, 'Cobalt - Field - gallery', 'file', 'gallery', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - gallery","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.64","description":"Cobalt - Field - gallery: This is advanced gallery field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 'Cobalt - Field - Address & Map', 'file', 'geo', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Address & Map","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.157","description":"Cobalt - Field - Address & Map","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 'Cobalt - Field - HTML', 'file', 'html', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - HTML","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.39","description":"Cobalt - Field - HTML: This is advanced editor field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'Cobalt - Field - Image', 'file', 'image', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Image","type":"file","creationDate":"April 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.47","description":"Cobalt - Field - Image: This is simple image field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10044, 'Cobalt - Field - List Autocomplete', 'file', 'listautocomplete', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - List Autocomplete","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.39","description":"Cobalt - Field - List Autocomplete: This is advanced listautocomplete field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10045, 'Cobalt - Field - Multi Level Select', 'file', 'multilevelselect', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Multi Level Select","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.67","description":"Cobalt - Field - Multi Level Select: This is advanced multiple level select field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10046, 'Cobalt - Field - Multiple Select', 'file', 'multiselect', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Multiple Select","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.33","description":"Cobalt - Field - Multiple Select: This is advanced multiselect field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'Cobalt - Field - Password', 'file', 'passwd', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Password","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.21","description":"Cobalt - Field - Password: This is advanced Password field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10048, 'Cobalt - Field - Pay To Access', 'file', 'paytoaccess', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Pay To Access","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.27","description":"Cobalt - Field - Pay To Access: This is advanced payment field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10049, 'Cobalt - Field - Pay To Download', 'file', 'paytodownload', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Pay To Download","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.29","description":"Cobalt - Field - Pay To Download: This is advanced payment field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10050, 'Cobalt - Field - Pay Voucher', 'file', 'payvoucher', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Pay Voucher","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.24","description":"Cobalt - Field - Pay Voucher: sell pin codes, vouchers, activation codes, ...","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10051, 'Cobalt - Field - Radio', 'file', 'radio', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Radio","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.29","description":"Cobalt - Field - Radio: This is advanced radio field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10052, 'Cobalt - Field - Read also', 'file', 'readmore', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Read also","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.24","description":"Cobalt - Field - Read also: This is advanced Read also field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10053, 'Cobalt - Field - Records', 'file', 'records', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Records","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.33","description":"Cobalt - Field - Records: This is advanced records field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10054, 'Cobalt - Field - Register', 'file', 'register', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Register","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.29","description":"Cobalt - Field - register: Allows to create account along with record submission","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10055, 'Cobalt - Field - Relations (Child and Parent)', 'file', 'relation', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Relations (Child and Parent)","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.45","description":"Cobalt - Field - Relation: This is advanced Relation field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10056, 'Cobalt - Field - Select', 'file', 'select', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Select","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.27","description":"Cobalt - Field - Select: This is advanced select field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10057, 'Cobalt - Field - Status', 'file', 'status', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Status","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.31","description":"Cobalt - Field - Status: This is advanced status field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10058, 'Cobalt - Field - Telephone', 'file', 'telephone', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Telephone","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.28","description":"Cobalt - Field - Telephone: This is advanced telephone field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10059, 'Cobalt - Field - Text', 'file', 'text', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Text","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.38","description":"Cobalt - Field - Text: This is advanced text field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10060, 'Cobalt - Field - Textarea', 'file', 'textarea', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Textarea","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.39","description":"Cobalt - Field - Textarea: This is advanced textarea field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10061, 'Cobalt - Field - URL', 'file', 'url', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - URL","type":"file","creationDate":"April 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.52","description":"Cobalt - Field - URL: This is advanced URL field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10062, 'Cobalt - Field - Video', 'file', 'video', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Video","type":"file","creationDate":"April 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.69","description":"Cobalt - Field - Video: This is advanced video field","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);
INSERT INTO `openapi_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(10063, 'cobaltpack', 'package', 'pkg_cobaltpack', '', 0, 1, 1, 0, '{"name":"Cobalt - Package - All","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"8.359","description":"\\n\\t\\t<div class=\\"hero-unit\\" style=\\"text-align: left;\\">\\n\\t\\t\\t<h1>Cobalt 8 CCK <small><b>Mint<\\/b>Joomla<\\/small><\\/h1>\\n\\t\\t\\t<p>Cobalt 8 is a great extension to aid in the design of components and content for your site.\\n\\t\\t\\tYou can use it to create hundreds of different sections of your site.<\\/p>\\n\\t\\t\\t<br>\\n\\t\\t\\t<a href=\\"http:\\/\\/www.mintjoomla.com\\/downloads\\/category-items\\/4-downloads\\/9-cobalt-7.html\\" target=\\"_blank\\" class=\\"btn btn-large btn-primary\\">Get more stuff by MintJoomla<\\/a>\\n\\t\\t\\t<a href=\\"http:\\/\\/www.mintjoomla.com\\/community\\/depot.html\\" target=\\"_blank\\" class=\\"btn btn-large\\">Get more stuff by 3<sup>rd<\\/sup> party<\\/a>\\n\\t\\t<\\/div>\\n\\t\\t<p class=\\"alert alert-error\\">Do not forget to download and install <a target=\\"_blank\\" href=\\"http:\\/\\/www.mintjoomla.com\\/downloads\\/item\\/9-cobalt-7\\/101-mint-media-pack.html\\">Cobalt Media Pack<\\/a>.<\\/p>\\n\\t\\t<div class=\\"well\\" style=\\"text-align:left;\\">\\n\\t\\t\\t<h2>You have successfully installed commercial package!<\\/h2>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Cobalt 8 Extension<\\/li>\\n\\t\\t\\t\\t<li>MintJoomla library<\\/li>\\n\\t\\t\\t\\t<li>Advanced templates<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Module Tag Cloud<\\/li>\\n\\t\\t\\t\\t<li>Module Categories<\\/li>\\n\\t\\t\\t\\t<li>Module Section Statictics<\\/li>\\n\\t\\t\\t\\t<li>Module User Statictics<\\/li>\\n\\t\\t\\t\\t<li>Module Filters<\\/li>\\n\\t\\t\\t\\t<li>Module Notifications<\\/li>\\n\\t\\t\\t\\t<li>Module Records<\\/li>\\n\\t\\t\\t\\t<li>Module Participants<\\/li>\\n\\t\\t\\t\\t<li>Module Who folloes user<\\/li>\\n\\t\\t\\t\\t<li>Module Whom user follow<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Payment Gateway PayPal<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Plugin Toolset<\\/li>\\n\\t\\t\\t\\t<li>Plugin Joomla Search<\\/li>\\n\\t\\t\\t\\t<li>Plugin Glossary<\\/li>\\n\\t\\t\\t\\t<li>Plugin Review\\/Discussion<\\/li>\\n\\t\\t\\t\\t<li>Plugin Formatter INI<\\/li>\\n\\t\\t\\t\\t<li>Plugin Formatter XML<\\/li>\\n\\t\\t\\t\\t<li>Plugin Formatter JSON<\\/li>\\n\\t\\t\\t\\t<li>Plugin Formatter Joomla Update Service<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Comment Adapter Core<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter <a href=\\"http:\\/\\/stackideas.com\\/komento.html\\">Komento (By Stackideas)<\\/a><\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter JComment<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter Cobalt<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter VK<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter Facebook<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter DISQUS<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter IntenceDeate<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter Cackle<\\/li>\\n\\t\\t\\t\\t<li>Comment Adapter Custom<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li>Field Boolean<\\/li>\\n\\t\\t\\t\\t<li>Field Checkbox<\\/li>\\n\\t\\t\\t\\t<li>Field HTML<\\/li>\\n\\t\\t\\t\\t<li>Field Image<\\/li>\\n\\t\\t\\t\\t<li>Field Multiple Select<\\/li>\\n\\t\\t\\t\\t<li>Field Password<\\/li>\\n\\t\\t\\t\\t<li>Field Radio<\\/li>\\n\\t\\t\\t\\t<li>Field Select<\\/li>\\n\\t\\t\\t\\t<li>Field Text<\\/li>\\n\\t\\t\\t\\t<li>Field Textarea<\\/li>\\n\\t\\t\\t\\t<li>Field Audio<\\/li>\\n\\t\\t\\t\\t<li>Field Datetime<\\/li>\\n\\t\\t\\t\\t<li>Field Digits<\\/li>\\n\\t\\t\\t\\t<li>Field Email<\\/li>\\n\\t\\t\\t\\t<li>Field Gallery<\\/li>\\n\\t\\t\\t\\t<li>Field Geo<\\/li>\\n\\t\\t\\t\\t<li>Field list Autocomplete<\\/li>\\n\\t\\t\\t\\t<li>Field Multilevel Select<\\/li>\\n\\t\\t\\t\\t<li>Field Pay to access<\\/li>\\n\\t\\t\\t\\t<li>Field Pay voucher<\\/li>\\n\\t\\t\\t\\t<li>Field Pay to download<\\/li>\\n\\t\\t\\t\\t<li>Field Read also<\\/li>\\n\\t\\t\\t\\t<li>Field Records<\\/li>\\n\\t\\t\\t\\t<li>Field Relations (Parent and Child)<\\/li>\\n\\t\\t\\t\\t<li>Field Status<\\/li>\\n\\t\\t\\t\\t<li>Field Telephone<\\/li>\\n\\t\\t\\t\\t<li>Field Uploads<\\/li>\\n\\t\\t\\t\\t<li>Field Url<\\/li>\\n\\t\\t\\t\\t<li>Field Video<\\/li>\\n\\t\\t\\t<\\/ul>\\n\\n\\t\\t\\t<h2>What is next?<\\/h2>\\n\\t\\t\\t<ul>\\n\\t\\t\\t\\t<li><a href=\\"http:\\/\\/www.mintjoomla.com\\/community\\/knowledge\\/user-item\\/43-sergey\\/109-cobalt-quick-start.html\\" target=\\"_blank\\">Read and watch quick start tutorial<\\/a><\\/li>\\n\\t\\t\\t\\t<li><a href=\\"http:\\/\\/support.mintjoomla.com\\" target=\\"_blank\\">Ask questions and get support<\\/a><\\/li>\\n\\t\\t\\t\\t<li><a href=\\"http:\\/\\/www.mintjoomla.com\\/blog.html\\" target=\\"_blank\\">We release updates every week. Please do not forget to subscribe or check our blog were we announce.<\\/a><\\/li>\\n\\t\\t\\t<\\/ul>\\n\\t\\t<\\/div>\\n\\t\\t<br><br>\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10064, 'Cobalt - Package - Mediа', 'file', 'mint', '', 0, 1, 0, 0, '{"name":"Cobalt - Package - Medi\\u0430","type":"file","creationDate":"November 2012","author":"MintJoomla","copyright":"(C) 2005 - 2012 MintJoomla.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.66","description":"\\n\\tThis is MintJoomla - Cobalt 8 Media Pack\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10067, 'openapi', 'template', 'openapi', '', 0, 1, 1, 0, '{"name":"openapi","type":"template","creationDate":"10\\/01\\/2013","author":"TIBCO Software, Inc.","copyright":"Copyright (C) 2013 TIBCO Software, Inc. All rights reserved.","authorEmail":"ux-dev@tibco.com","authorUrl":"","version":"1.0","description":"TPL_OPENAPI_XML_DESCRIPTION","group":""}', '{"sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10068, 'nielsen', 'template', 'nielsen', '', 0, 1, 1, 0, '{"name":"nielsen","type":"template","creationDate":"10\\/01\\/2013","author":"TIBCO Software, Inc.","copyright":"Copyright (C) 2013 TIBCO Software, Inc. All rights reserved.","authorEmail":"ux-dev@tibco.com","authorUrl":"","version":"1.0","description":"TPL_NIELSEN_XML_DESCRIPTION","group":""}', '{"sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10069, 'com_emails', 'component', 'com_emails', '', 1, 1, 1, 0, '{"name":"com_emails","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_EMAILS_XML_DESCRIPTION","group":""}', '{"spotfire_domain":"","configui_url":"http:\\/\\/","enable_oauth":"3","is_show_ping":"0","ping_url":"","show_alerts_count":"3"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10073, 'Cobalt - Field - Content Dripping', 'file', 'dripcontent', '', 0, 1, 0, 0, '{"name":"Cobalt - Field - Content Dripping","type":"file","creationDate":"March 2012","author":"MintJoomla","copyright":"(c) 2012 MintJoomla","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.10","description":"Cobalt - Field - Content dripping: In combination with emerald provide step access to articles on time base or manually.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10076, 'Cobalt Content Type Filter - Set the default type for each section', 'plugin', 'selcobalttype', 'system', 0, 1, 1, 0, '{"name":"Cobalt Content Type Filter - Set the default type for each section","type":"plugin","creationDate":"oct 2013","author":"Jacky","copyright":"","authorEmail":"love0.0chen@gmail.com","authorUrl":"www.webhulu.org","version":"3.1.1","description":"Apply a content type filter for cobalt section","group":""}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10085, 'plg_authentication_ping', 'plugin', 'ping', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_ping","type":"plugin","creationDate":"March 2013","author":"ping.tibco.com","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"tpeng@tibco-support.com","authorUrl":"www.d5s.cn","version":"3.0.0","description":"PLG_AUTH_PING_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(10094, 'com_logs', 'component', 'com_logs', '', 1, 1, 1, 0, '{"name":"com_logs","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10102, 'Cobalt - Comments - Compojoom Joomla extension', 'file', 'ccomment', '', 0, 1, 0, 0, '{"name":"Cobalt - Comments - Compojoom Joomla extension","type":"file","creationDate":"October 2013","author":"compojoom.com","copyright":"\\u00a9 2013 Compojoom","authorEmail":"daniel@compojoom.com","authorUrl":"https:\\/\\/compojoom.com","version":"8.1","description":"Content type to integrate with the CComment extension from compojoom","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10104, 'TIBCO OpenAPI Library', 'library', 'tibco', '', 0, 1, 1, 0, '{"name":"TIBCO OpenAPI Library","type":"library","creationDate":"October 2013","author":"TIBCO Software Inc.","copyright":"Copyright (C) 2013 TIBCO Software, Inc. All rights reserved.","authorEmail":"ux-dev@tibco.com","authorUrl":"www.tibco.com","version":"1.0","description":"LIB_TIBCO_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10107, 'System - TIBCO OpenAPI Library', 'plugin', 'tibco', 'system', 0, 1, 1, 0, '{"name":"System - TIBCO OpenAPI Library","type":"plugin","creationDate":"October 2013","author":"TIBCO Software Inc.","copyright":"Copyright (C) 2013 TIBCO Software, Inc. All rights reserved.","authorEmail":"ux-dev@tibco.com","authorUrl":"www.tibco.com","version":"1.0","description":"System Plugin to autoload the TIBCO OpenAPI Joomla Library.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10109, 'Cobalt - Package - Library', 'library', 'mint', '', 0, 1, 1, 0, '{"name":"Cobalt - Package - Library","type":"library","creationDate":"November 2012","author":"MintJoomla","copyright":"Copyright (C) 2012","authorEmail":"support@mintjoomla.com","authorUrl":"www.mintjoomla.com","version":"8.73","description":"\\n    \\n\\tThis is MintJoomla - Cobal t8 Library Pack\\n\\t\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10110, 'tibcoopenapidatabaseimport', 'component', 'com_tibcoopenapidatabaseimport', '', 1, 1, 0, 0, '{"name":"TIBCO OpenAPI Database Import","type":"component","creationDate":"October 2013","author":"TIBCO Software Inc.","copyright":"Copyright (C) 2013 TIBCO Software, Inc. All rights reserved.\\n\\t","authorEmail":"ux-dev@tibco.com","authorUrl":"www.tibco.com","version":"1.0","description":"Imports basic configuration and sample database for OpenAPI into Joomla.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10114, 'Tibco - Plugins - Manager', 'plugin', 'tibco', 'mint', 0, 1, 1, 0, '{"name":"Tibco - Plugins - Manager","type":"plugin","creationDate":"Dec 25 2013","author":"Jacky","copyright":"TIBCO Software Inc.","authorEmail":"love0.0chen@gmail.com","authorUrl":"http:\\/\\/www.webhulu.com","version":"1.0.1","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10120, 'plg_user_apiuser', 'plugin', 'apiuser', 'user', 0, 1, 5, 0, '{"name":"plg_user_apiuser","type":"plugin","creationDate":"Jan 3 2014","author":"Jacky","copyright":"TIBCO Software Inc.","authorEmail":"","authorUrl":"www.tibco.com","version":"3.0.0","description":"PLG_USER_APIUSER_XML_DESCRIPTION","group":""}', '{"register-require_validate":"2"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10122, 'plg_authentication_email', 'plugin', 'email', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_email","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2013 - 2014 Open Source Matters. All rights reserved.","authorEmail":"tpeng@tibco-support.com","authorUrl":"www.tibco.com","version":"1.0.0","description":"PLG_AUTH_EMAIL_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(10128, 'plg_system_resetpassword', 'plugin', 'resetpassword', 'system', 0, 1, 1, 0, '{"name":"plg_system_resetpassword","type":"plugin","creationDate":"Jan 3 2014","author":"Jacky","copyright":"TIBCO Software Inc.","authorEmail":"","authorUrl":"www.tibco.com","version":"3.0.0","description":"PLG_SYSTEM_RESETPASSWORD_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10131, 'plg_content_useguide', 'plugin', 'useguide', 'content', 0, 0, 1, 0, '{"name":"plg_content_useguide","type":"plugin","creationDate":"Jan 3 2014","author":"Jacky","copyright":"TIBCO Software Inc.","authorEmail":"","authorUrl":"www.tibco.com","version":"3.0.0","description":"PLG_CONTENT_USEGUIDE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10133, 'idna_convert', 'library', 'idna_convert', '', 0, 1, 1, 0, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10134, 'mod_cobalt_submitbutton', 'module', 'mod_cobalt_submitbutton', '', 0, 1, 1, 0, '{"name":"Cobalt - Module - Submit Button","type":"module","creationDate":"June 2012","author":"MintJoomla","copyright":"Copyright (C) 2005 - 2012 MintJoomla (http:\\/\\/www.mintjoomla.com). All rights reserved.","authorEmail":"support@mintjoomla.com","authorUrl":"http:\\/\\/www.mintjoomla.com","version":"8.35","description":" Cobalt Submit new article button ","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10135, 'cobalt', 'plugin', 'cobalt', 'finder', 0, 1, 1, 0, '{"name":"Smart Search - Cobalt","type":"plugin","creationDate":"Jan 2012","author":"MightyExtensions","copyright":"Copyright (C) 2010 MightyExtensions - All rights reserved.","authorEmail":"info@mightyextensions.com","authorUrl":"http:\\/\\/www.mightyextensions.com","version":"8.10","description":"This plugin enables you to setup your 2CO payment system","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10136, 'plg_system_useguide', 'plugin', 'useguide', 'system', 0, 1, 1, 0, '{"name":"plg_system_useguide","type":"plugin","creationDate":"Jan 3 2014","author":"Jacky","copyright":"TIBCO Software Inc.","authorEmail":"","authorUrl":"www.tibco.com","version":"3.0.0","description":"PLG_SYSTEM_USEGUIDE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10137, 'database', 'template', 'database', '', 0, 1, 1, 0, 'false', '{}', '', '', 0, '0000-00-00 00:00:00', 0, -1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_filters`
--

DROP TABLE IF EXISTS `openapi_finder_filters`;
CREATE TABLE IF NOT EXISTS `openapi_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links`
--

DROP TABLE IF EXISTS `openapi_finder_links`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms0`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms1`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms2`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms3`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms4`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms5`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms6`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms7`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms8`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_terms9`
--

DROP TABLE IF EXISTS `openapi_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termsa`
--

DROP TABLE IF EXISTS `openapi_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termsb`
--

DROP TABLE IF EXISTS `openapi_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termsc`
--

DROP TABLE IF EXISTS `openapi_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termsd`
--

DROP TABLE IF EXISTS `openapi_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termse`
--

DROP TABLE IF EXISTS `openapi_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_links_termsf`
--

DROP TABLE IF EXISTS `openapi_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `openapi_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_taxonomy`
--

DROP TABLE IF EXISTS `openapi_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `openapi_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `openapi_finder_taxonomy`
--

INSERT INTO `openapi_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `openapi_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `openapi_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_terms`
--

DROP TABLE IF EXISTS `openapi_finder_terms`;
CREATE TABLE IF NOT EXISTS `openapi_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_terms_common`
--

DROP TABLE IF EXISTS `openapi_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `openapi_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_finder_terms_common`
--

INSERT INTO `openapi_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_tokens`
--

DROP TABLE IF EXISTS `openapi_finder_tokens`;
CREATE TABLE IF NOT EXISTS `openapi_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `openapi_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `openapi_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_finder_types`
--

DROP TABLE IF EXISTS `openapi_finder_types`;
CREATE TABLE IF NOT EXISTS `openapi_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_ip_2_country`
--

DROP TABLE IF EXISTS `openapi_js_ip_2_country`;
CREATE TABLE IF NOT EXISTS `openapi_js_ip_2_country` (
  `ip_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_to` int(10) unsigned NOT NULL DEFAULT '0',
  `short_code` varchar(2) NOT NULL DEFAULT '',
  `code` varchar(3) NOT NULL DEFAULT '',
  `country` varchar(100) NOT NULL DEFAULT '',
  KEY `idx_from` (`ip_from`),
  KEY `idx_to` (`ip_to`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_audit_log`
--

DROP TABLE IF EXISTS `openapi_js_res_audit_log`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_audit_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `event` tinyint(3) NOT NULL,
  `ctime` datetime NOT NULL,
  `ip` varchar(16) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `idx_record` (`record_id`),
  KEY `idx_section` (`section_id`),
  KEY `idx_type` (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3403 ;

--
-- Dumping data for table `openapi_js_res_audit_log`
--

INSERT INTO `openapi_js_res_audit_log` (`id`, `user_id`, `record_id`, `section_id`, `type_id`, `comment_id`, `field_id`, `event`, `ctime`, `ip`, `params`) VALUES
(3331, 129, 225, 2, 2, 0, 0, 26, '2013-11-24 00:54:27', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3330, 129, 231, 1, 1, 0, 0, 26, '2013-11-23 23:08:08', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 02:17:42","inittime":"2013-11-19 01:38:41","ftime":"2013-12-19 02:05:49","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3329, 129, 231, 1, 1, 0, 0, 26, '2013-11-23 23:07:04', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 02:17:42","inittime":"2013-11-19 01:38:41","ftime":"2013-12-19 02:05:49","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3328, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:50:33', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3327, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:50:14', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3326, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:49:17', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3325, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:48:31', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3324, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:48:03', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3323, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:47:37', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3322, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:47:27', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3321, 129, 220, 4, 5, 0, 0, 26, '2013-11-23 22:47:19', '::1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3320, 129, 219, 4, 8, 0, 0, 26, '2013-11-23 22:47:12', '::1', '{"id":"219","title":"Host Administrator","user_id":"129","section_id":"4","ctime":"2013-11-18 22:50:48","extime":"0000-00-00 00:00:00","mtime":"2013-11-18 22:52:19","inittime":"2013-11-18 22:52:19","ftime":"0000-00-00 00:00:00","type_id":"8","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"User Profile","section_name":"Organizations"}'),
(3318, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:44:49', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3319, 129, 68, 4, 5, 0, 0, 26, '2013-11-23 22:46:59', '::1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-11-23 22:08:53","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3317, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:43:57', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3316, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:43:47', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3315, 129, 237, 5, 9, 0, 0, 26, '2013-11-23 22:42:25', '::1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3314, 129, 225, 2, 2, 0, 0, 26, '2013-11-23 22:33:46', '::1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3332, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 06:34:53', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3333, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 07:55:21', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3334, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 07:58:22', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3335, 129, 221, 4, 8, 0, 0, 26, '2013-12-24 07:59:23', '127.0.0.1', '{"id":"221","title":"Jon Wiley","user_id":"129","section_id":"4","ctime":"2013-11-19 00:44:25","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:15","inittime":"2013-11-19 00:47:15","ftime":"0000-00-00 00:00:00","type_id":"8","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"User Profile","section_name":"Organizations"}'),
(3336, 129, 231, 1, 1, 0, 0, 26, '2013-12-24 08:00:20', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 02:17:42","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3337, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 08:01:14', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3338, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 08:10:50', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3339, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 08:12:29', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 00:47:33","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3340, 129, 220, 4, 5, 0, 0, 2, '2013-12-24 08:21:30', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-12-24 08:21:30","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3341, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 08:21:31', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-12-24 08:21:30","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3342, 129, 220, 4, 5, 0, 0, 26, '2013-12-24 08:21:33', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-12-24 08:21:30","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3343, 129, 220, 4, 5, 0, 0, 26, '2013-12-25 01:46:37', '127.0.0.1', '{"id":"220","title":"Acme App Services","user_id":"129","section_id":"4","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-12-24 08:21:30","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3344, 129, 225, 2, 2, 0, 0, 26, '2013-12-27 05:34:37', '127.0.0.1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:21:26","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3345, 129, 225, 2, 2, 0, 0, 2, '2013-12-27 05:40:20', '127.0.0.1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:40:20","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"API","section_name":"APIs"}'),
(3346, 129, 225, 2, 2, 0, 0, 26, '2013-12-27 05:40:22', '127.0.0.1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:40:20","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3347, 129, 225, 2, 2, 0, 0, 26, '2013-12-27 05:40:28', '127.0.0.1', '{"id":"225","title":"Books API v1","user_id":"129","section_id":"2","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:40:20","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"API","section_name":"APIs"}'),
(3348, 129, 231, 1, 1, 0, 0, 26, '2013-12-27 05:43:09', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 02:17:42","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3349, 129, 231, 1, 1, 0, 0, 2, '2013-12-27 05:43:43', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":1,"newTags":null,"type_name":"Product","section_name":"Products"}'),
(3350, 129, 231, 1, 1, 0, 0, 26, '2013-12-27 05:43:46', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3351, 129, 231, 1, 1, 0, 0, 26, '2013-12-27 05:43:52', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3352, 129, 223, 3, 4, 0, 0, 26, '2013-12-27 05:46:53', '127.0.0.1', '{"id":"223","title":"Production Environment","user_id":"129","section_id":"3","ctime":"2013-11-19 00:56:49","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 01:03:09","inittime":"2013-11-19 00:59:32","ftime":"0000-00-00 00:00:00","type_id":"4","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Environment","section_name":"Environments"}'),
(3353, 129, 223, 3, 4, 0, 0, 2, '2013-12-27 05:48:01', '127.0.0.1', '{"id":"223","title":"Production Environment","user_id":"129","section_id":"3","ctime":"2013-11-19 00:56:49","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:48:01","inittime":"2013-11-19 00:59:32","ftime":"0000-00-00 00:00:00","type_id":"4","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"Environment","section_name":"Environments"}'),
(3354, 129, 223, 3, 4, 0, 0, 26, '2013-12-27 05:48:03', '127.0.0.1', '{"id":"223","title":"Production Environment","user_id":"129","section_id":"3","ctime":"2013-11-19 00:56:49","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:48:01","inittime":"2013-11-19 00:59:32","ftime":"0000-00-00 00:00:00","type_id":"4","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Environment","section_name":"Environments"}'),
(3355, 129, 223, 3, 4, 0, 0, 26, '2013-12-27 05:48:08', '127.0.0.1', '{"id":"223","title":"Production Environment","user_id":"129","section_id":"3","ctime":"2013-11-19 00:56:49","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:48:01","inittime":"2013-11-19 00:59:32","ftime":"0000-00-00 00:00:00","type_id":"4","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Environment","section_name":"Environments"}'),
(3356, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 05:53:35', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-11-23 22:08:53","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3357, 129, 68, 4, 5, 0, 0, 2, '2013-12-27 05:54:07', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3358, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 05:54:09', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3359, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 05:54:21', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3360, 129, 238, 6, 10, 0, 0, 26, '2013-12-27 05:59:20', '127.0.0.1', '{"id":"238","title":"Host Organization-Book Catalog-Community","user_id":"129","section_id":"6","ctime":"2013-11-19 03:10:30","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:10:30","inittime":"2013-11-19 03:10:30","ftime":"0000-00-00 00:00:00","type_id":"10","ip":"::1","categories":null,"version":"1","newTags":null,"type_name":"Subscription","section_name":"Subscriptions"}'),
(3361, 129, 238, 6, 10, 0, 0, 2, '2013-12-27 06:00:05', '127.0.0.1', '{"id":"238","title":"Host Organization - Book Catalog - Community","user_id":"129","section_id":"6","ctime":"2013-11-19 03:10:30","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 06:00:05","inittime":"2013-11-19 03:10:30","ftime":"0000-00-00 00:00:00","type_id":"10","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"Subscription","section_name":"Subscriptions"}'),
(3362, 129, 238, 6, 10, 0, 0, 26, '2013-12-27 06:00:08', '127.0.0.1', '{"id":"238","title":"Host Organization - Book Catalog - Community","user_id":"129","section_id":"6","ctime":"2013-11-19 03:10:30","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 06:00:05","inittime":"2013-11-19 03:10:30","ftime":"0000-00-00 00:00:00","type_id":"10","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Subscription","section_name":"Subscriptions"}'),
(3363, 129, 238, 6, 10, 0, 0, 26, '2013-12-27 06:00:17', '127.0.0.1', '{"id":"238","title":"Host Organization - Book Catalog - Community","user_id":"129","section_id":"6","ctime":"2013-11-19 03:10:30","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 06:00:05","inittime":"2013-11-19 03:10:30","ftime":"0000-00-00 00:00:00","type_id":"10","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Subscription","section_name":"Subscriptions"}'),
(3364, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 06:01:13', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3365, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 06:04:31', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3366, 129, 219, 4, 8, 0, 0, 26, '2013-12-27 06:04:54', '127.0.0.1', '{"id":"219","title":"Host Administrator","user_id":"129","section_id":"4","ctime":"2013-11-18 22:50:48","extime":"0000-00-00 00:00:00","mtime":"2013-11-18 22:52:19","inittime":"2013-11-18 22:52:19","ftime":"0000-00-00 00:00:00","type_id":"8","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"User Profile","section_name":"Organizations"}'),
(3367, 129, 219, 4, 8, 0, 0, 26, '2013-12-27 06:05:26', '127.0.0.1', '{"id":"219","title":"Host Administrator","user_id":"129","section_id":"4","ctime":"2013-11-18 22:50:48","extime":"0000-00-00 00:00:00","mtime":"2013-11-18 22:52:19","inittime":"2013-11-18 22:52:19","ftime":"0000-00-00 00:00:00","type_id":"8","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"User Profile","section_name":"Organizations"}'),
(3368, 129, 68, 4, 5, 0, 0, 26, '2013-12-27 06:06:15', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3369, 129, 231, 1, 1, 0, 0, 26, '2014-01-07 22:18:28', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3370, 129, 231, 1, 1, 0, 0, 7, '2014-01-07 22:18:31', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-02-06 22:18:31","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3371, 129, 231, 1, 1, 0, 0, 26, '2014-01-07 22:18:31', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-02-06 22:18:31","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3372, 129, 231, 1, 1, 0, 0, 26, '2014-02-11 03:39:58', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3373, 129, 231, 1, 1, 0, 0, 7, '2014-02-11 03:40:01', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3374, 129, 231, 1, 1, 0, 0, 26, '2014-02-11 03:40:02', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3375, 129, 68, 4, 5, 0, 0, 26, '2014-02-11 05:19:07', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3376, 129, 68, 4, 5, 0, 0, 26, '2014-02-11 21:35:36', '::1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3377, 0, 231, 1, 1, 0, 0, 26, '2014-02-11 23:47:10', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3378, 0, 231, 1, 1, 0, 0, 26, '2014-02-11 23:47:54', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3379, 129, 231, 1, 1, 0, 0, 26, '2014-02-11 23:48:08', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3380, 129, 231, 1, 1, 0, 0, 26, '2014-02-11 23:48:19', '::1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3381, 154, 231, 1, 1, 0, 0, 26, '2014-02-21 06:50:32', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3382, 129, 231, 1, 1, 0, 0, 26, '2014-02-21 06:50:45', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"1","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3383, 129, 231, 1, 1, 0, 0, 2, '2014-02-21 06:50:54', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":2,"newTags":null,"type_name":"Product","section_name":"Products"}'),
(3384, 129, 231, 1, 1, 0, 0, 26, '2014-02-21 06:50:54', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3385, 129, 231, 1, 1, 0, 0, 26, '2014-02-21 06:50:55', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3386, 129, 237, 5, 9, 0, 0, 26, '2014-02-21 07:18:51', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2013-11-19 03:11:05","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3387, 129, 237, 5, 9, 0, 0, 2, '2014-02-21 07:19:06', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":1,"newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3388, 129, 237, 5, 9, 0, 0, 26, '2014-02-21 07:19:06', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3389, 129, 237, 5, 9, 0, 0, 26, '2014-02-21 07:19:07', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3390, 129, 237, 5, 9, 0, 0, 26, '2014-02-21 07:19:19', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3391, 129, 237, 5, 9, 0, 0, 26, '2014-02-24 18:44:24', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3392, 129, 237, 5, 9, 0, 0, 26, '2014-02-24 20:22:25', '127.0.0.1', '{"id":"237","title":"I, Librarian","user_id":"129","section_id":"5","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Application","section_name":"Applications"}'),
(3393, 129, 68, 4, 5, 0, 0, 26, '2014-02-24 20:22:30', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3394, 129, 231, 1, 1, 0, 0, 26, '2014-02-26 05:14:42', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3395, 0, 231, 1, 1, 0, 0, 26, '2014-02-26 05:15:05', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3396, 0, 231, 1, 1, 0, 0, 26, '2014-02-26 05:16:24', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3397, 129, 231, 1, 1, 0, 0, 26, '2014-02-26 05:17:20', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3398, 129, 231, 1, 1, 0, 0, 26, '2014-02-26 05:17:27', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3399, 0, 231, 1, 1, 0, 0, 26, '2014-02-26 05:17:38', '127.0.0.1', '{"id":"231","title":"Book Catalog","user_id":"129","section_id":"1","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","ip":"::1","categories":{"5":"Reference Data"},"version":"2","newTags":null,"type_name":"Product","section_name":"Products"}'),
(3400, 129, 68, 4, 5, 0, 0, 26, '2014-03-03 23:05:17', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}'),
(3401, 129, 219, 4, 8, 0, 0, 26, '2014-03-03 23:05:20', '127.0.0.1', '{"id":"219","title":"Host Administrator","user_id":"129","section_id":"4","ctime":"2013-11-18 22:50:48","extime":"0000-00-00 00:00:00","mtime":"2013-11-18 22:52:19","inittime":"2013-11-18 22:52:19","ftime":"0000-00-00 00:00:00","type_id":"8","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"User Profile","section_name":"Organizations"}'),
(3402, 129, 68, 4, 5, 0, 0, 26, '2014-03-03 23:06:15', '127.0.0.1', '{"id":"68","title":"Host Organization","user_id":"129","section_id":"4","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","ip":"::1","categories":[],"version":"1","newTags":null,"type_name":"Organization","section_name":"Organizations"}');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_audit_restore`
--

DROP TABLE IF EXISTS `openapi_js_res_audit_restore`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_audit_restore` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(11) DEFAULT NULL,
  `dtime` datetime DEFAULT NULL,
  `comments` longtext,
  `favorites` text,
  `files` text,
  `hits` text,
  `subscriptions` text,
  `votes` text,
  `notifications` text,
  `type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_record` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='This table keeps last information of deleted record for rest' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_audit_versions`
--

DROP TABLE IF EXISTS `openapi_js_res_audit_versions`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_audit_versions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `username` varchar(255) NOT NULL,
  `ctime` datetime DEFAULT NULL,
  `version` int(10) unsigned NOT NULL,
  `record_serial` longtext NOT NULL,
  `values_serial` longtext NOT NULL,
  `category_serial` longtext NOT NULL,
  `tags_serial` longtext,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rec` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=464 ;

--
-- Dumping data for table `openapi_js_res_audit_versions`
--

INSERT INTO `openapi_js_res_audit_versions` (`id`, `user_id`, `record_id`, `type_id`, `username`, `ctime`, `version`, `record_serial`, `values_serial`, `category_serial`, `tags_serial`, `ip`) VALUES
(456, 129, 220, 0, 'admin', '2013-12-24 08:21:30', 1, '{"id":"220","title":"Acme App Services","published":"1","access":"8","params":"","user_id":"129","section_id":"4","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 00:31:52","extime":"0000-00-00 00:00:00","mtime":"2013-12-24 08:21:30","inittime":"2013-11-19 00:43:16","ftime":"0000-00-00 00:00:00","type_id":"5","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"acme-app-services","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"0a3ba8c4c376168fa1858b0482f60746","categories":"[]","fieldsdata":"We provide a range of mobile application development services., Jon Wiley, Acme App Services","fields":"{\\"109\\":\\"317eabf2-33cb-9a33-88e0-c3dd921d9a98\\",\\"122\\":[\\"partner\\"],\\"17\\":\\"<p>We provide a range of mobile application development services.<\\\\\\/p>\\",\\"19\\":\\"admin@local.host\\",\\"20\\":{\\"address\\":{\\"country\\":\\"US\\",\\"state\\":\\"CA\\",\\"city\\":\\"Palo Alto\\",\\"zip\\":\\"94304\\",\\"address1\\":\\"123 Some Street\\",\\"address2\\":\\"\\"},\\"contacts\\":{\\"tel\\":\\"555-555-5555\\"}},\\"48\\":\\"221\\",\\"130\\":\\"80%\\"}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2268","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"US","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"country"},{"id":"2267","field_id":"48","field_key":"k45bd148ad6c09c87ba4292c21536d31a","field_type":"child","field_label":"Contact","field_value":"221","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2266","field_id":"130","field_key":"k42866f83aeb9dc4b82664cfdcf19ce5d","field_type":"text","field_label":"API limit usage","field_value":"80%","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2265","field_id":"19","field_key":"k26bba2439bf7543547fc6826aaae5cba","field_type":"email","field_label":"Email","field_value":"admin@local.host","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2264","field_id":"109","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"317eabf2-33cb-9a33-88e0-c3dd921d9a98","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2263","field_id":"122","field_key":"kdd59e7cf2c2eff0db1a2fcb158feb874","field_type":"select","field_label":"Organization type","field_value":"partner","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2262","field_id":"17","field_key":"k81ee9e352c67f1d011f5345d45138aba","field_type":"html","field_label":"Description","field_value":"<p>We provide a range of mobile application development services.<\\/p>","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"0"},{"id":"2269","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"94304","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"zip"},{"id":"2270","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"Palo Alto","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"city"},{"id":"2271","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"CA","record_id":"220","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-24 08:21:30","value_index":"state"}]', '[]', '[]', '127.0.0.1'),
(457, 129, 225, 0, 'admin', '2013-12-27 05:40:20', 1, '{"id":"225","title":"Books API v1","published":"1","access":"6","params":"","user_id":"129","section_id":"2","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 01:03:27","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:40:20","inittime":"2013-11-19 01:21:26","ftime":"0000-00-00 00:00:00","type_id":"2","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"books-api-v1","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"04188ddd3d2e2aa4c86556c24aade08c","categories":"[]","fieldsdata":", , Discover a world of literature with our extensive catalog of reading material., Books API v1","fields":"{\\"23\\":[{\\"id\\":\\"29\\",\\"filename\\":\\"1384779600_48fddb734c73e61f386c58f419035f65.json\\",\\"realname\\":\\"book.json\\",\\"ext\\":\\"json\\",\\"size\\":\\"5020\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_48fddb734c73e61f386c58f419035f65.json\\",\\"params\\":null}],\\"127\\":null,\\"103\\":null,\\"5\\":\\"\\",\\"75\\":[\\"REST\\"],\\"22\\":\\"\\\\\\/Books\\",\\"26\\":[\\"223\\"],\\"24\\":[{\\"id\\":\\"30\\",\\"filename\\":\\"1384779600_557292919508c832bb39715f0e2ce083.docx\\",\\"realname\\":\\"Books API v1 FAQ.docx\\",\\"ext\\":\\"docx\\",\\"size\\":\\"37552\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_557292919508c832bb39715f0e2ce083.docx\\",\\"params\\":null},{\\"id\\":\\"31\\",\\"filename\\":\\"1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf\\",\\"realname\\":\\"Books Getting Started.pdf\\",\\"ext\\":\\"pdf\\",\\"size\\":\\"48978\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf\\",\\"params\\":null}],\\"44\\":\\"<p>Discover a world of literature with our extensive catalog of reading material.<\\\\\\/p>\\",\\"21\\":[0],\\"40\\":null}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2277","field_id":"24","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Books Getting Started.pdf","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"1"},{"id":"2276","field_id":"24","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Books API v1 FAQ.docx","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"},{"id":"2274","field_id":"22","field_key":"k79e9689cbe5caadafb98dd49e1281125","field_type":"text","field_label":"REST resource path","field_value":"\\/Books","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"},{"id":"2272","field_id":"23","field_key":"kc066489ec282615817ce1d42ce6c42f8","field_type":"uploads","field_label":"Upload REST API spec","field_value":"book.json","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"},{"id":"2273","field_id":"75","field_key":"k9f51bdf4949131d73f9f0ddd3879efe4","field_type":"select","field_label":"API type","field_value":"REST","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"},{"id":"2214","field_id":"6","field_key":"kda98e018e7f7ddec573883d31e9fe64f","field_type":"child","field_label":"Contained in products","field_value":"231","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"::1","ctime":"2013-11-19 02:17:42","value_index":"0"},{"id":"2278","field_id":"44","field_key":"k87b1a71d0474134becbd85fb18c2ebd5","field_type":"html","field_label":"Inline documentation text","field_value":"<p>Discover a world of literature with our extensive catalog of reading material.<\\/p>","record_id":"225","user_id":"129","type_id":"2","section_id":"2","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"}]', '[]', '[]', '127.0.0.1'),
(458, 129, 231, 0, 'admin', '2013-12-27 05:43:43', 1, '{"id":"231","title":"Book Catalog","published":"1","access":"1","params":"","user_id":"129","section_id":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:43:43","inittime":"2013-11-19 01:38:41","ftime":"0000-00-00 00:00:00","type_id":"1","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"book-catalog","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"1ffaf0ab014b0f0f63f2c076f9630fe6","categories":"{\\"5\\":\\"Reference Data\\"}","fieldsdata":"Hardback, Paperback and E-lit\\r\\nAccess the world''s largest catalog of literature curated by the world''s leading librarians., Book Catalog","fields":"{\\"111\\":\\"c2038058-b6f7-9b65-ecd6-a6935002eb24\\",\\"117\\":\\"<p>Catalog information is updated daily. \\\\u00a0Now includes Manga titles from\\\\u00a0Kobunsha\\\\u00a0(\\\\u5149\\\\u6587\\\\u793e).<\\\\\\/p>\\",\\"118\\":[{\\"id\\":\\"32\\",\\"filename\\":\\"1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf\\",\\"realname\\":\\"Frequently Asked Questions.pdf\\",\\"ext\\":\\"pdf\\",\\"size\\":\\"31526\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf\\",\\"params\\":null},{\\"id\\":\\"33\\",\\"filename\\":\\"1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx\\",\\"realname\\":\\"Book Catalog Getting Started.docx\\",\\"ext\\":\\"docx\\",\\"size\\":\\"31225\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx\\",\\"params\\":null}],\\"129\\":\\"<p>All trademarks are the property of their respective owners.<\\\\\\/p>\\",\\"2\\":\\"<h1>Hardback, Paperback and E-lit<\\\\\\/h1>\\\\r\\\\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.<\\\\\\/p>\\",\\"3\\":{\\"image\\":\\"\\\\\\/images\\\\\\/icons\\\\\\/ic_ProductReview_OpenAPI.png\\"},\\"7\\":[\\"225\\"],\\"42\\":null,\\"32\\":\\"219\\"}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2284","field_id":"2","field_key":"k81ee9e352c67f1d011f5345d45138aba","field_type":"html","field_label":"Description","field_value":"<h1>Hardback, Paperback and E-lit<\\/h1>\\r\\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2283","field_id":"129","field_key":"k3a8db3100cd71b87cd272cee4e04c7a7","field_type":"html","field_label":"Product-specific terms & conditions","field_value":"<p>All trademarks are the property of their respective owners.<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2282","field_id":"118","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Book Catalog Getting Started.docx","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"1"},{"id":"2281","field_id":"118","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Frequently Asked Questions.pdf","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2280","field_id":"117","field_key":"k784bc6cd07a39a92239b509bb10715da","field_type":"html","field_label":"Inline documentation","field_value":"<p>Catalog information is updated daily. \\u00a0Now includes Manga titles from\\u00a0Kobunsha\\u00a0(\\u5149\\u6587\\u793e).<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2279","field_id":"111","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"c2038058-b6f7-9b65-ecd6-a6935002eb24","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2238","field_id":"62","field_key":"kfef9bf29bd08904836ef384ddd00c847","field_type":"child","field_label":"Used by applications","field_value":"237","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"::1","ctime":"2013-11-19 03:11:05","value_index":"0"},{"id":"2285","field_id":"3","field_key":"k6fdbd54f60db4ef232bbd8094e3f4369","field_type":"image","field_label":"Thumbnail","field_value":"images\\/icons\\/ic_ProductReview_OpenAPI.png","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"},{"id":"2287","field_id":"32","field_key":"k45bd148ad6c09c87ba4292c21536d31a","field_type":"child","field_label":"Contact","field_value":"219","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:43:43","value_index":"0"}]', '[{"id":"20","catid":"5","record_id":"231","ordering":"0","otime":"0000-00-00 00:00:00","section_id":"1","published":"1","access":"1"}]', '[]', '127.0.0.1'),
(459, 129, 223, 0, 'admin', '2013-12-27 05:48:01', 1, '{"id":"223","title":"Production Environment","published":"1","access":"6","params":"","user_id":"129","section_id":"3","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 00:56:49","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:48:01","inittime":"2013-11-19 00:59:32","ftime":"0000-00-00 00:00:00","type_id":"4","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"production-environment","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"c078043ca693c581a8bdbe3c94f4dfd0","categories":"[]","fieldsdata":"Public endpoint (load balanced across gateway instances)., Production, Production Gateway, Production Environment","fields":"{\\"105\\":null,\\"12\\":\\"<p>Public endpoint (load balanced across gateway instances).<\\\\\\/p>\\",\\"13\\":[\\"Production\\"],\\"14\\":[{\\"hits\\":\\"0\\",\\"url\\":\\"http:\\\\\\/\\\\\\/localhost:9222\\"}],\\"15\\":[\\"224\\"]}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2290","field_id":"14","field_key":"k67c489a3d354c7d0c600d8e3ec9db3a5","field_type":"url","field_label":"Basepath","field_value":"http:\\/\\/localhost:9222","record_id":"223","user_id":"129","type_id":"4","section_id":"3","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:48:01","value_index":"0"},{"id":"2289","field_id":"13","field_key":"k3486ea3b5a6b9c318ed5642c3102dd60","field_type":"select","field_label":"Type","field_value":"Production","record_id":"223","user_id":"129","type_id":"4","section_id":"3","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:48:01","value_index":"0"},{"id":"2288","field_id":"12","field_key":"k81ee9e352c67f1d011f5345d45138aba","field_type":"html","field_label":"Description","field_value":"<p>Public endpoint (load balanced across gateway instances).<\\/p>","record_id":"223","user_id":"129","type_id":"4","section_id":"3","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:48:01","value_index":"0"},{"id":"2275","field_id":"25","field_key":"k83452817e6ff70a8b2f02c58b605e9da","field_type":"child","field_label":"APIs","field_value":"225","record_id":"223","user_id":"129","type_id":"4","section_id":"3","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:40:20","value_index":"0"},{"id":"2139","field_id":"34","field_key":"ke8901a14558eec3fd65f49d1c1edf422","field_type":"child","field_label":"Public in products","field_value":"231","record_id":"223","user_id":"129","type_id":"4","section_id":"0","category_id":"0","params":null,"ip":"::1","ctime":"2013-11-19 01:39:42","value_index":"0"}]', '[]', '[]', '127.0.0.1'),
(460, 129, 68, 0, 'admin', '2013-12-27 05:54:07', 1, '{"id":"68","title":"Host Organization","published":"1","access":"8","params":"","user_id":"129","section_id":"4","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-18 22:14:11","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 05:54:07","inittime":"2013-11-18 22:15:37","ftime":"0000-00-00 00:00:00","type_id":"5","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"host-organization","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"b0684b7732ab2d31dbef74d75abc919a","categories":"[]","fieldsdata":", Host Administrator, Host Organization","fields":"{\\"109\\":\\"7365b8b3-4e47-e706-54cf-4e877bc524b5\\",\\"122\\":[\\"host\\"],\\"17\\":\\"\\",\\"19\\":\\"admin@local.host\\",\\"20\\":{\\"address\\":{\\"country\\":\\"US\\",\\"state\\":\\"CA\\",\\"city\\":\\"Some City\\",\\"zip\\":\\"99999\\",\\"address1\\":\\"1234 Some St.\\",\\"address2\\":\\"\\"},\\"contacts\\":{\\"tel\\":\\"555-555-5555\\"}},\\"48\\":\\"219\\",\\"130\\":\\"\\"}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2298","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"Some City","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"city"},{"id":"2297","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"99999","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"zip"},{"id":"2296","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"US","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"country"},{"id":"2295","field_id":"48","field_key":"k45bd148ad6c09c87ba4292c21536d31a","field_type":"child","field_label":"Contact","field_value":"219","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"0"},{"id":"2294","field_id":"19","field_key":"k26bba2439bf7543547fc6826aaae5cba","field_type":"email","field_label":"Email","field_value":"admin@local.host","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"0"},{"id":"2293","field_id":"109","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"7365b8b3-4e47-e706-54cf-4e877bc524b5","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"0"},{"id":"2292","field_id":"122","field_key":"kdd59e7cf2c2eff0db1a2fcb158feb874","field_type":"select","field_label":"Organization type","field_value":"host","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"0"},{"id":"2299","field_id":"20","field_key":"k29dc11646e85e847ced2682a755b576d","field_type":"geo","field_label":"Contact details","field_value":"CA","record_id":"68","user_id":"129","type_id":"5","section_id":"4","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 05:54:07","value_index":"state"}]', '[]', '[]', '127.0.0.1'),
(461, 129, 238, 0, 'admin', '2013-12-27 06:00:05', 1, '{"id":"238","title":"Host Organization - Book Catalog - Community","published":"1","access":"10","params":"","user_id":"129","section_id":"6","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 03:10:30","extime":"0000-00-00 00:00:00","mtime":"2013-12-27 06:00:05","inittime":"2013-11-19 03:10:30","ftime":"0000-00-00 00:00:00","type_id":"10","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"host-organization-book-catalog-community","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"d6b45aee776d6e23747c404216f58ea5","categories":"[]","fieldsdata":null,"fields":"{\\"66\\":\\"\\",\\"114\\":\\"231\\",\\"69\\":\\"232\\",\\"71\\":[\\"2013-11-19 03:10:30\\"],\\"72\\":[\\"2018-11-19 03:10:30\\"],\\"73\\":\\"68\\",\\"78\\":[\\"Active\\"],\\"112\\":\\"b32b7a2e-5f64-667a-4b91-e1632f351151\\",\\"67\\":null}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2305","field_id":"78","field_key":"k0e3524381c85abf33d5456047c19a511","field_type":"radio","field_label":"Status","field_value":"Active","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2304","field_id":"73","field_key":"kc0ce29d041859fe0496c7cde216afc5b","field_type":"child","field_label":"Subscribing organization","field_value":"68","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2303","field_id":"72","field_key":"k24b0869913bdfffab7ad7fea6c1a3892","field_type":"datetime","field_label":"End date","field_value":"2018-11-19 03:10:30","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2302","field_id":"71","field_key":"k8d871e19c36e6fd92854f72ce9a21bd2","field_type":"datetime","field_label":"Start date","field_value":"2013-11-19 03:10:30","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2301","field_id":"69","field_key":"kc8a81303998c7bd680fc36dfcb66cee5","field_type":"child","field_label":"Plan","field_value":"232","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2300","field_id":"114","field_key":"k46d5cd2baef63cdc7a3f9460fb8bf199","field_type":"child","field_label":"Product","field_value":"231","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"},{"id":"2242","field_id":"116","field_key":"k0ba24eae1ffe1c279c8f86282f911e0f","field_type":"child","field_label":"Owner application","field_value":"237","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"::1","ctime":"2013-11-19 03:11:05","value_index":"0"},{"id":"2306","field_id":"112","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"b32b7a2e-5f64-667a-4b91-e1632f351151","record_id":"238","user_id":"129","type_id":"10","section_id":"6","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2013-12-27 06:00:05","value_index":"0"}]', '[]', '[]', '127.0.0.1'),
(462, 129, 231, 0, 'admin', '2014-02-21 06:50:54', 2, '{"id":"231","title":"Book Catalog","published":"1","access":"1","params":"","user_id":"129","section_id":"1","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 01:22:07","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 06:50:54","inittime":"2013-11-19 01:38:41","ftime":"2014-03-13 03:40:01","type_id":"1","hits":"2","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"book-catalog","featured":"1","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"f5a91744af7b31063d60fc5dcd62f1a4","categories":"{\\"5\\":\\"Reference Data\\"}","fieldsdata":"Hardback, Paperback and E-lit\\r\\nAccess the world''s largest catalog of literature curated by the world''s leading librarians., Book Catalog","fields":"{\\"111\\":\\"c2038058-b6f7-9b65-ecd6-a6935002eb24\\",\\"117\\":\\"<p>Catalog information is updated daily. \\\\u00a0Now includes Manga titles from\\\\u00a0Kobunsha\\\\u00a0(\\\\u5149\\\\u6587\\\\u793e).<\\\\\\/p>\\",\\"118\\":[{\\"id\\":\\"32\\",\\"filename\\":\\"1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf\\",\\"realname\\":\\"Frequently Asked Questions.pdf\\",\\"ext\\":\\"pdf\\",\\"size\\":\\"31526\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf\\",\\"params\\":null},{\\"id\\":\\"33\\",\\"filename\\":\\"1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx\\",\\"realname\\":\\"Book Catalog Getting Started.docx\\",\\"ext\\":\\"docx\\",\\"size\\":\\"31225\\",\\"title\\":null,\\"description\\":null,\\"width\\":null,\\"height\\":null,\\"fullpath\\":\\"2013-11\\\\\\/1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx\\",\\"params\\":null}],\\"129\\":\\"<p>All trademarks are the property of their respective owners.<\\\\\\/p>\\",\\"2\\":\\"<h1>Hardback, Paperback and E-lit<\\\\\\/h1>\\\\r\\\\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.<\\\\\\/p>\\",\\"3\\":{\\"image\\":\\"\\\\\\/images\\\\\\/icons\\\\\\/ic_ProductReview_OpenAPI.png\\"},\\"7\\":[\\"225\\"],\\"42\\":\\"68\\",\\"32\\":\\"219\\"}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":2,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2313","field_id":"42","field_key":"k45b259b885cce1018d0a8a896918ba7d","field_type":"child","field_label":"Owner organization","field_value":"68","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2312","field_id":"2","field_key":"k81ee9e352c67f1d011f5345d45138aba","field_type":"html","field_label":"Description","field_value":"<h1>Hardback, Paperback and E-lit<\\/h1>\\r\\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2311","field_id":"129","field_key":"k3a8db3100cd71b87cd272cee4e04c7a7","field_type":"html","field_label":"Product-specific terms & conditions","field_value":"<p>All trademarks are the property of their respective owners.<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2309","field_id":"118","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Frequently Asked Questions.pdf","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2310","field_id":"118","field_key":"k5b6884f36a562cfdcb94347039c789be","field_type":"uploads","field_label":"Attached documentation files","field_value":"Book Catalog Getting Started.docx","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"1"},{"id":"2238","field_id":"62","field_key":"kfef9bf29bd08904836ef384ddd00c847","field_type":"child","field_label":"Used by applications","field_value":"237","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"::1","ctime":"2013-11-19 03:11:05","value_index":"0"},{"id":"2308","field_id":"117","field_key":"k784bc6cd07a39a92239b509bb10715da","field_type":"html","field_label":"Inline documentation","field_value":"<p>Catalog information is updated daily. \\u00a0Now includes Manga titles from\\u00a0Kobunsha\\u00a0(\\u5149\\u6587\\u793e).<\\/p>","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2307","field_id":"111","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"c2038058-b6f7-9b65-ecd6-a6935002eb24","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2314","field_id":"3","field_key":"k6fdbd54f60db4ef232bbd8094e3f4369","field_type":"image","field_label":"Thumbnail","field_value":"images\\/icons\\/ic_ProductReview_OpenAPI.png","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"},{"id":"2316","field_id":"32","field_key":"k45bd148ad6c09c87ba4292c21536d31a","field_type":"child","field_label":"Contact","field_value":"219","record_id":"231","user_id":"129","type_id":"1","section_id":"1","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 06:50:54","value_index":"0"}]', '[{"id":"20","catid":"5","record_id":"231","ordering":"0","otime":"0000-00-00 00:00:00","section_id":"1","published":"1","access":"1"}]', '[]', '127.0.0.1'),
(463, 129, 237, 0, 'admin', '2014-02-21 07:19:06', 1, '{"id":"237","title":"I, Librarian","published":"1","access":"18","params":"","user_id":"129","section_id":"5","checked_out":"0","checked_out_time":"0000-00-00 00:00:00","ctime":"2013-11-19 02:57:52","extime":"0000-00-00 00:00:00","mtime":"2014-02-21 07:19:06","inittime":"2013-11-19 02:57:52","ftime":"0000-00-00 00:00:00","type_id":"9","hits":"1","ordering":"0","meta_descr":"","meta_key":"","meta_index":"","alias":"i-librarian","featured":"0","archive":"0","ucatid":"0","ucatname":null,"langs":"en-GB","asset_id":"0","ip":"::1","votes":"0","favorite_num":"0","hidden":"0","votes_result":"0","exalert":"0","access_key":"5be8c578518bd86519f638e18248653c","categories":"[]","fieldsdata":"A social application for managing your personal library and book reviews., I, Librarian","fields":"{\\"57\\":\\"<p>A social application for managing your personal library and book reviews.<\\\\\\/p>\\",\\"58\\":\\"219\\",\\"60\\":\\"68\\",\\"63\\":[\\"231\\"],\\"64\\":-1,\\"65\\":[],\\"87\\":null,\\"104\\":\\"737dcec9-9737-d1ae-4f55-14dbec317de0\\",\\"115\\":[\\"238\\"],\\"119\\":{\\"image\\":\\"\\\\\\/uploads\\\\\\/image\\\\\\/apps\\\\\\/1384829872_iLib.jpg\\"},\\"125\\":null}","comments":"0","tags":"","multirating":null,"subscriptions_num":"0","version":1,"parent_id":"0","parent":"com_cobalt","whorepost":"0","repostedby":"[]","newTags":null}', '[{"id":"2324","field_id":"119","field_key":"kf157212bd6c9b7ed1895dc1e39fb4620","field_type":"image","field_label":"Icon","field_value":"uploads\\/image\\/apps\\/1384829872_iLib.jpg","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"},{"id":"2322","field_id":"104","field_key":"k29b6ade2fbde76b5263293dba82fef52","field_type":"uuid","field_label":"uuid","field_value":"737dcec9-9737-d1ae-4f55-14dbec317de0","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"},{"id":"2321","field_id":"64","field_key":"kddd53c164c004afcc1758b7fbc28fd8d","field_type":"boolean","field_label":"Use OAuth?","field_value":"-1","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"},{"id":"2319","field_id":"60","field_key":"k45b259b885cce1018d0a8a896918ba7d","field_type":"child","field_label":"Owner organization","field_value":"68","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"},{"id":"2318","field_id":"58","field_key":"k45bd148ad6c09c87ba4292c21536d31a","field_type":"child","field_label":"Contact","field_value":"219","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"},{"id":"2317","field_id":"57","field_key":"k81ee9e352c67f1d011f5345d45138aba","field_type":"html","field_label":"Description","field_value":"<p>A social application for managing your personal library and book reviews.<\\/p>","record_id":"237","user_id":"129","type_id":"9","section_id":"5","category_id":"0","params":"","ip":"127.0.0.1","ctime":"2014-02-21 07:19:06","value_index":"0"}]', '[]', '[]', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_categories`
--

DROP TABLE IF EXISTS `openapi_js_res_categories`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5120) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `num_current` int(11) NOT NULL DEFAULT '0',
  `num_all` int(11) NOT NULL DEFAULT '0',
  `relative_cats` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `openapi_js_res_categories`
--

INSERT INTO `openapi_js_res_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `section_id`, `title`, `alias`, `note`, `description`, `image`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `num_current`, `num_all`, `relative_cats`) VALUES
(1, 0, 0, 0, 5, 0, '', 0, 'ROOT', 'root', '', '', '', 0, 0, '0000-00-00 00:00:00', 0, '{}', ' ', ' ', ' ', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, '*', 0, 0, '{}'),
(6, 201, 1, 3, 4, 1, 'marketanalysis', 1, 'Market Analysis', 'marketanalysis', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"submission":"1","access_level":"0","category_itemid":"","category_item_itemid":"","orderby":"","records_mode":"","featured_first":"","posttype":[""],"tmpl_markup":"","tmpl_list":[""],"tmpl_category":"","tmpl_compare":"","tmpl_list_default":"default"}', '', '', '{"author":"","robots":"","tags":null}', 129, '2013-11-19 00:55:08', 0, '0000-00-00 00:00:00', 0, '*', 0, 0, ''),
(5, 200, 1, 1, 2, 1, 'reference', 1, 'Reference Data', 'reference', '', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"submission":"1","access_level":"0","category_itemid":"","category_item_itemid":"","orderby":"","records_mode":"","featured_first":"","posttype":[""],"tmpl_markup":"","tmpl_list":[""],"tmpl_category":"","tmpl_compare":"","tmpl_list_default":"default"}', '', '', '{"author":"","robots":"","tags":null}', 129, '2013-11-19 00:52:20', 129, '2013-11-19 00:55:34', 0, '*', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_category_filters`
--

DROP TABLE IF EXISTS `openapi_js_res_category_filters`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_category_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_category_user`
--

DROP TABLE IF EXISTS `openapi_js_res_category_user`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_category_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `section_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime DEFAULT NULL,
  `params` text NOT NULL,
  `name` varchar(150) NOT NULL DEFAULT '',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `rate` int(10) unsigned NOT NULL DEFAULT '0',
  `rate_count` int(10) unsigned NOT NULL DEFAULT '0',
  `icon` varchar(45) NOT NULL DEFAULT '',
  `mtime` datetime DEFAULT NULL,
  `alias` varchar(250) NOT NULL DEFAULT '',
  `client_id` int(10) unsigned NOT NULL DEFAULT '0',
  `client` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`,`section_id`),
  KEY `publish` (`published`),
  KEY `client_id` (`client_id`),
  KEY `client` (`client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_comments`
--

DROP TABLE IF EXISTS `openapi_js_res_comments`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `langs` varchar(10) NOT NULL DEFAULT 'en-GB',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `rate` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `root_id` int(11) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `params` text,
  `attachment` text NOT NULL,
  `attach_hit` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `private` tinyint(1) NOT NULL,
  `rate_num` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_publish` (`published`),
  KEY `idx_record` (`record_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_section` (`section_id`),
  KEY `idx_lr` (`lft`,`rgt`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `openapi_js_res_comments`
--

INSERT INTO `openapi_js_res_comments` (`id`, `record_id`, `user_id`, `comment`, `ctime`, `published`, `email`, `name`, `langs`, `access`, `rate`, `parent_id`, `root_id`, `level`, `hide`, `params`, `attachment`, `attach_hit`, `ip`, `lft`, `rgt`, `section_id`, `private`, `rate_num`, `type_id`) VALUES
(1, 0, 0, ' ', '0000-00-00 00:00:00', 0, '', '', 'en-GB', 0, 0, 0, 0, 0, 0, ' ', ' ', 0, '', 0, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_country`
--

DROP TABLE IF EXISTS `openapi_js_res_country`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_country` (
  `id` varchar(2) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_js_res_country`
--

INSERT INTO `openapi_js_res_country` (`id`, `name`) VALUES
('AD', 'Andorra'),
('AE', 'United Arab Emirates'),
('AF', 'Afghanistan'),
('AG', 'Antigua and Barbuda'),
('AI', 'Anguilla'),
('AL', 'Albania'),
('AM', 'Armenia'),
('AN', 'Netherlands Antilles'),
('AO', 'Angola'),
('AQ', 'Antarctica'),
('AR', 'Argentina'),
('AS', 'American Samoa'),
('AT', 'Austria'),
('AU', 'Australia'),
('AW', 'Aruba'),
('AX', ''),
('AZ', 'Azerbaijan'),
('BA', 'Bosnia and Herzegovina'),
('BB', 'Barbados'),
('BD', 'Bangladesh'),
('BE', 'Belgium'),
('BF', 'Burkina Faso'),
('BG', 'Bulgaria'),
('BH', 'Bahrain'),
('BI', 'Burundi'),
('BJ', 'Benin'),
('BL', 'Saint Barth'),
('BM', 'Bermuda'),
('BN', 'Brunei'),
('BO', 'Bolivia'),
('BQ', 'British Antarctic Territory'),
('BR', 'Brazil'),
('BS', 'Bahamas'),
('BT', 'Bhutan'),
('BV', 'Bouvet Island'),
('BW', 'Botswana'),
('BY', 'Belarus'),
('BZ', 'Belize'),
('CA', 'Canada'),
('CC', 'Cocos [Keeling] Islands'),
('CD', 'Congo - Kinshasa'),
('CF', 'Central African Republic'),
('CG', 'Congo - Brazzaville'),
('CH', 'Switzerland'),
('CI', 'C'),
('CK', 'Cook Islands'),
('CL', 'Chile'),
('CM', 'Cameroon'),
('CN', 'China'),
('CO', 'Colombia'),
('CR', 'Costa Rica'),
('CS', 'Serbia and Montenegro'),
('CT', 'Canton and Enderbury Islands'),
('CU', 'Cuba'),
('CV', 'Cape Verde'),
('CX', 'Christmas Island'),
('CY', 'Cyprus'),
('CZ', 'Czech Republic'),
('DD', 'East Germany'),
('DE', 'Germany'),
('DJ', 'Djibouti'),
('DK', 'Denmark'),
('DM', 'Dominica'),
('DO', 'Dominican Republic'),
('DZ', 'Algeria'),
('EC', 'Ecuador'),
('EE', 'Estonia'),
('EG', 'Egypt'),
('EH', 'Western Sahara'),
('ER', 'Eritrea'),
('ES', 'Spain'),
('ET', 'Ethiopia'),
('FI', 'Finland'),
('FJ', 'Fiji'),
('FK', 'Falkland Islands'),
('FM', 'Micronesia'),
('FO', 'Faroe Islands'),
('FQ', 'French Southern and Antarctic Territories'),
('FR', 'France'),
('FX', 'Metropolitan France'),
('GA', 'Gabon'),
('GB', 'United Kingdom'),
('GD', 'Grenada'),
('GE', 'Georgia'),
('GF', 'French Guiana'),
('GG', 'Guernsey'),
('GH', 'Ghana'),
('GI', 'Gibraltar'),
('GL', 'Greenland'),
('GM', 'Gambia'),
('GN', 'Guinea'),
('GP', 'Guadeloupe'),
('GQ', 'Equatorial Guinea'),
('GR', 'Greece'),
('GS', 'South Georgia and the South Sandwich Islands'),
('GT', 'Guatemala'),
('GU', 'Guam'),
('GW', 'Guinea-Bissau'),
('GY', 'Guyana'),
('HK', 'Hong Kong SAR China'),
('HM', 'Heard Island and McDonald Islands'),
('HN', 'Honduras'),
('HR', 'Croatia'),
('HT', 'Haiti'),
('HU', 'Hungary'),
('ID', 'Indonesia'),
('IE', 'Ireland'),
('IL', 'Israel'),
('IM', 'Isle of Man'),
('IN', 'India'),
('IO', 'British Indian Ocean Territory'),
('IQ', 'Iraq'),
('IR', 'Iran'),
('IS', 'Iceland'),
('IT', 'Italy'),
('JE', 'Jersey'),
('JM', 'Jamaica'),
('JO', 'Jordan'),
('JP', 'Japan'),
('JT', 'Johnston Island'),
('KE', 'Kenya'),
('KG', 'Kyrgyzstan'),
('KH', 'Cambodia'),
('KI', 'Kiribati'),
('KM', 'Comoros'),
('KN', 'Saint Kitts and Nevis'),
('KP', 'North Korea'),
('KR', 'South Korea'),
('KW', 'Kuwait'),
('KY', 'Cayman Islands'),
('KZ', 'Kazakhstan'),
('LA', 'Laos'),
('LB', 'Lebanon'),
('LC', 'Saint Lucia'),
('LI', 'Liechtenstein'),
('LK', 'Sri Lanka'),
('LR', 'Liberia'),
('LS', 'Lesotho'),
('LT', 'Lithuania'),
('LU', 'Luxembourg'),
('LV', 'Latvia'),
('LY', 'Libya'),
('MA', 'Morocco'),
('MC', 'Monaco'),
('MD', 'Moldova'),
('ME', 'Montenegro'),
('MF', 'Saint Martin'),
('MG', 'Madagascar'),
('MH', 'Marshall Islands'),
('MI', 'Midway Islands'),
('MK', 'Macedonia'),
('ML', 'Mali'),
('MM', 'Myanmar [Burma]'),
('MN', 'Mongolia'),
('MO', 'Macau SAR China'),
('MP', 'Northern Mariana Islands'),
('MQ', 'Martinique'),
('MR', 'Mauritania'),
('MS', 'Montserrat'),
('MT', 'Malta'),
('MU', 'Mauritius'),
('MV', 'Maldives'),
('MW', 'Malawi'),
('MX', 'Mexico'),
('MY', 'Malaysia'),
('MZ', 'Mozambique'),
('NA', 'Namibia'),
('NC', 'New Caledonia'),
('NE', 'Niger'),
('NF', 'Norfolk Island'),
('NG', 'Nigeria'),
('NI', 'Nicaragua'),
('NL', 'Netherlands'),
('NO', 'Norway'),
('NP', 'Nepal'),
('NQ', 'Dronning Maud Land'),
('NR', 'Nauru'),
('NT', 'Neutral Zone'),
('NU', 'Niue'),
('NZ', 'New Zealand'),
('OM', 'Oman'),
('PA', 'Panama'),
('PC', 'Pacific Islands Trust Territory'),
('PE', 'Peru'),
('PF', 'French Polynesia'),
('PG', 'Papua New Guinea'),
('PH', 'Philippines'),
('PK', 'Pakistan'),
('PL', 'Poland'),
('PM', 'Saint Pierre and Miquelon'),
('PN', 'Pitcairn Islands'),
('PR', 'Puerto Rico'),
('PS', 'Palestinian Territories'),
('PT', 'Portugal'),
('PU', 'U.S. Miscellaneous Pacific Islands'),
('PW', 'Palau'),
('PY', 'Paraguay'),
('PZ', 'Panama Canal Zone'),
('QA', 'Qatar'),
('RE', 'R'),
('RO', 'Romania'),
('RS', 'Serbia'),
('RU', 'Russia'),
('RW', 'Rwanda'),
('SA', 'Saudi Arabia'),
('SB', 'Solomon Islands'),
('SC', 'Seychelles'),
('SD', 'Sudan'),
('SE', 'Sweden'),
('SG', 'Singapore'),
('SH', 'Saint Helena'),
('SI', 'Slovenia'),
('SJ', 'Svalbard and Jan Mayen'),
('SK', 'Slovakia'),
('SL', 'Sierra Leone'),
('SM', 'San Marino'),
('SN', 'Senegal'),
('SO', 'Somalia'),
('SR', 'Suriname'),
('ST', 'S'),
('SU', 'Union of Soviet Socialist Republics'),
('SV', 'El Salvador'),
('SY', 'Syria'),
('SZ', 'Swaziland'),
('TC', 'Turks and Caicos Islands'),
('TD', 'Chad'),
('TF', 'French Southern Territories'),
('TG', 'Togo'),
('TH', 'Thailand'),
('TJ', 'Tajikistan'),
('TK', 'Tokelau'),
('TL', 'Timor-Leste'),
('TM', 'Turkmenistan'),
('TN', 'Tunisia'),
('TO', 'Tonga'),
('TR', 'Turkey'),
('TT', 'Trinidad and Tobago'),
('TV', 'Tuvalu'),
('TW', 'Taiwan'),
('TZ', 'Tanzania'),
('UA', 'Ukraine'),
('UG', 'Uganda'),
('UM', 'U.S. Minor Outlying Islands'),
('US', 'United States'),
('UY', 'Uruguay'),
('UZ', 'Uzbekistan'),
('VA', 'Vatican City'),
('VC', 'Saint Vincent and the Grenadines'),
('VD', 'North Vietnam'),
('VE', 'Venezuela'),
('VG', 'British Virgin Islands'),
('VI', 'U.S. Virgin Islands'),
('VN', 'Vietnam'),
('VU', 'Vanuatu'),
('WF', 'Wallis and Futuna'),
('WK', 'Wake Island'),
('WS', 'Samoa'),
('YD', 'People''s Democratic Republic of Yemen'),
('YE', 'Yemen'),
('YT', 'Mayotte'),
('ZA', 'South Africa'),
('ZM', 'Zambia'),
('ZW', 'Zimbabwe'),
('ZZ', 'Unknown or Invalid Region');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_favorite`
--

DROP TABLE IF EXISTS `openapi_js_res_favorite`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_record` (`record_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_fields`
--

DROP TABLE IF EXISTS `openapi_js_res_fields`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(45) DEFAULT NULL,
  `label` varchar(250) NOT NULL DEFAULT '',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_type` varchar(50) NOT NULL DEFAULT '',
  `params` longtext NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT '0',
  `asset_id` int(11) NOT NULL,
  `filter` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_access` (`access`),
  KEY `idx_publish` (`published`,`type_id`,`filter`,`key`),
  KEY `idx_group` (`group_id`),
  KEY `idx_filter` (`filter`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=131 ;

--
-- Dumping data for table `openapi_js_res_fields`
--

INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(32, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 1, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Field value is auto-populated","field_edit_access":"6","field_edit_message":"Field value is auto-populated"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"49","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"1","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"1","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 85, 0, 129),
(2, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 1, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"6","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 48, 0, 129),
(3, 'k6fdbd54f60db4ef232bbd8094e3f4369', 'Thumbnail', 1, 'image', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"image.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"list.php","template_output_full":"full.php","select_type":"1","directory":"images\\/icons","show_subfolders":"0","allow_caption":"0","default_img":"","subfolder":"image","list_mode":"0","lightbox_list":"0","img_list_hspace":"0","img_list_vspace":"0","thumbs_list_height":"100","thumbs_list_width":"100","thumbs_list_quality":"80","thumbs_list_mode":"6","thumbs_list_stretch":"0","thumbs_list_bg":"#000000","full_mode":"0","lightbox_full":"0","img_hspace":"0","img_vspace":"0","thumbs_height":"100","thumbs_width":"100","thumbs_quality":"80","thumbs_mode":"6","thumbs_stretch":"0","thumbs_bg":"#000000"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 49, 0, 129),
(21, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 2, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"51","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"100000","notify_add":"2","notify_attach":"2","input_mode":"2","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"3","add_more_access_list":"1","add_more_access_full":"1","add_return":"back","invite_add_more":"Create New","add_existing":"3","add_existing_access_list":"1","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 73, 0, 129),
(5, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 2, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"6","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 52, 0, 129),
(6, 'kda98e018e7f7ddec573883d31e9fe64f', 'Contained in products', 2, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"6","field_view_message":"This field is auto-assigned","field_submit_access":"0","field_submit_message":"Manage from the Product page","field_edit_access":"0","field_edit_message":"Manage from the Product page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"7","parent_type":"1","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"1","multi_limit":"100","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.50d95aea73a8ab9d9f47289f32716ccb","tmpl_full":"sublist.50d95aea73a8ab9d9f47289f32716ccb","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 10, 1, 0, 54, 0, 129),
(7, 'k791b1f5e16b620f4312cfc7d77f6155c', 'APIs', 1, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":1,"searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"wrench.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"6","child_section":"2","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"6","tmpl_list":"default.4a55ff46e2d0ce982a0b77950c9bb6d5","tmpl_full":"default.4a55ff46e2d0ce982a0b77950c9bb6d5","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 55, 0, 129),
(8, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 3, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 57, 0, 129),
(12, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 4, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 62, 0, 129),
(13, 'k3486ea3b5a6b9c318ed5642c3102dd60', 'Type', 4, 'select', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"wooden-box.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","width":"450","size":"10","values":"Development\\r\\nProduction\\r\\nSandbox\\r\\nStaging\\r\\nTesting","default_val":"0","color_separator":"^","label":"- Select Element -","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"1","user_value_label":"Your variant"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 63, 0, 129),
(14, 'k67c489a3d354c7d0c600d8e3ec9db3a5', 'Basepath', 4, 'url', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"Enter the environment URL.","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"direction.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"0","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","limit":"1","label":"0","label_change":"0","default_labels":"","link_redirect":"0","show_hits":"0","index_redirect":"0","open_url":"1","snapshot":"0","snapshot_width":"200","qr_code":"0","qr_width":"120","favicon":"0","numeric_list":"0"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 64, 0, 129),
(15, 'k3faa4775b79faaf511e55875e7cf87ff', 'Gateways', 4, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"network-hub.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Add Gateways from the Environment details page","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"16","child_section":"3","strict_to_user":"0","strict_to_user_mode":"3","multi_limit":"20","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add Gateways","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"1","add_return":"back","invite_add_more":"Add Gateway","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.dcf07d6c02c9cf14baa09cc5be8c4a4c","tmpl_full":"sublist.dcf07d6c02c9cf14baa09cc5be8c4a4c","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 65, 0, 129),
(16, 'k751d4b1e68e939ed92f52f4c9b5e2bbe', 'Environment', 3, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"globe-green.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"15","parent_type":"4","parent_section":"3","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"1","notify_add":"2","notify_attach":"2","input_mode":"2","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"environments.b174eb2e66b7e254167e0d52e4d5aa71","tmpl_full":"environments.b5ab9bb57350ac303f5b7307accf92b0","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 67, 0, 129),
(75, 'k9f51bdf4949131d73f9f0ddd3879efe4', 'API type', 2, 'select', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"wooden-box.png","field_view_access":"1","field_view_message":"REST","field_submit_access":"10","field_submit_message":"You do not have permission to submit this field","field_edit_access":"10","field_edit_message":"You do not have permission to edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","width":"450","size":"10","values":"REST\\r\\nSOAP","default_val":"REST","color_separator":"^","label":"- Select Element -","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"0","user_value_label":"Your variant"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 135, 0, 129),
(17, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 5, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"0","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 69, 0, 129),
(22, 'k79e9689cbe5caadafb98dd49e1281125', 'REST resource path', 2, 'text', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":1,"searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"direction.png","field_view_access":"6","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1","values":"asda\\n\\/Books\\nasdasd"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 74, 0, 129),
(128, 'kd0ca28ce3fd6d27ff392c28498417867', 'SOAP action', 6, 'text', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"navigation-000-white.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 197, 0, 129),
(19, 'k26bba2439bf7543547fc6826aaae5cba', 'Email', 5, 'email', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"0","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"mail.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"Please enter email address","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","enter_mail":"1","view_mail":"1","acemail":"0","acemail_text":"I want to subscribe to newssletter","qr_code":"0","qr_width":"60","send_mail":"8","to":"4","custom":"","change_name_from":"1","change_email_from":"1","cc":"0","subject_style":"1","pre_subject_val":"","subject":"","show_body":"1","body":"","attachment":"1","formats":"zip, tar, rar, txt, jpeg, jpg, pdf, gif, doc, xls","attach_num":"1","button":"Send","copy_to_sender":"1","additional_fields":"","show_captcha":"1","form_style":"2","template_form":"default.php","popup_label":"Send e-mail online"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 71, 0, 129),
(20, 'k29dc11646e85e847ced2682a755b576d', 'Contact details', 5, 'geo', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"0","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"address-book.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_distance":"0","filter_radius":"20","filter_address":"0","filter_marker":"0","adr_enter":"1","address":{"company":{"show":"0","req":"0","icon":"1"},"person":{"show":"0","req":"0","icon":"1"},"address1":{"show":"2","req":"0","icon":"1"},"address2":{"show":"2","req":"0","icon":"1"},"city":{"show":"2","req":"0","icon":"1"},"state":{"show":"2","req":"0","icon":"1"},"zip":{"show":"2","req":"0","icon":"1"},"country":{"show":"1","req":"0","icon":"1"}},"contacts":{"tel":{"show":"2","req":"0","icon":"1"},"mob":{"show":"0","req":"0","icon":"1"},"fax":{"show":"0","req":"0","icon":"1"},"icq":{"show":"0","req":"0","icon":"1"},"skype":{"show":"0","req":"0","icon":"1"},"google":{"show":"0","req":"0","icon":"1"},"yahoo":{"show":"0","req":"0","icon":"1"},"msn":{"show":"0","req":"0","icon":"1"},"aol":{"show":"0","req":"0","icon":"1"}},"links":{"web":{"show":"0","req":"0","icon":"1"},"facebook":{"show":"0","req":"0","icon":"1"},"twitter":{"show":"0","req":"0","icon":"1"},"linkin":{"show":"0","req":"0","icon":"1"},"google":{"show":"0","req":"0","icon":"1"},"youtube":{"show":"0","req":"0","icon":"1"},"odnoclasnik":{"show":"0","req":"0","icon":"1"}},"links_labels":"0","adr_view":"1","adr_title":"2","qr_code_address":"0","qr_code_geo":"0","qr_width_address":"250","qr_width_geo":"120","map_marker":"0","map_require":"0","map_style":"","map_width":"100%","map_height":"300px","map_lat":"42.293564192170095","map_lng":"-33.33983659744263","map_zoom":"2","map_find_position":"1","map_manual_position":"3","map_whoicon":"1","map_icon_src":{"dir":"","icon":""},"map_view":"0","map_dwidth":"100%","map_dheight":"300px","map_client":"3","template_window":"default.php"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 10, 1, 0, 72, 0, 129),
(23, 'kc066489ec282615817ce1d42ce6c42f8', 'Upload REST API spec', 2, 'uploads', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"blueprint.png","field_view_access":"6","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","method":"auto","file_formats":"json","max_count":"1","max_size":"8192","subfolder":"swaggerSpecs","delete_access":"1","allow_edit_title":"0","allow_add_descr":"0","show_hit":"0","show_size":"3","show_descr":"0","list_limit":"5","show_in_browser":"0","show_target":"0","sort":"0 ASC","show_download":"6","allow_download":"6","subscr_skip":"6","subscr_skip_author":"1","subscr_skip_moderator":"1","subscription":[""],"subscription_count":"0","subscription_msg":"You cannot download this file. You have to be subscribed member","subscription_redirect":"1","can_select_subscr":"0"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 75, 0, 129),
(24, 'k5b6884f36a562cfdcb94347039c789be', 'Attached documentation files', 2, 'uploads', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"blue-documents-stack.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","method":"auto","file_formats":"zip, jpg, png, jpeg, gif, txt, pdf, doc, rtf, rar, 7z, tar, gz, docx","max_count":"0","max_size":"51200","subfolder":"apiDocumentation","delete_access":"1","allow_edit_title":"1","allow_add_descr":"1","show_hit":"0","show_size":"3","show_descr":"2","list_limit":"25","show_in_browser":"0","show_target":"0","sort":"0 ASC","show_download":"1","allow_download":"1","subscr_skip":"1","subscr_skip_author":"1","subscr_skip_moderator":"1","subscription":[""],"subscription_count":"0","subscription_msg":"You cannot download this file. You have to be subscribed member","subscription_redirect":"1","can_select_subscr":"0"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 12, 1, 0, 76, 0, 129),
(25, 'k83452817e6ff70a8b2f02c58b605e9da', 'APIs', 4, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"wrench.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Manage APIs from the API page","field_edit_access":"0","field_edit_message":"Manage APIs from the API page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"7","parent_type":"2","parent_section":"2","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"1","multi_limit":"1000","notify_add":"6","notify_attach":"6","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"1","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"api_list.f9dfaf3bc0b7367e0dd04b397dcda9b4","tmpl_full":"api_list.f9dfaf3bc0b7367e0dd04b397dcda9b4","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 77, 0, 129);
INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(26, 'kf2bf86d86e26fa0a8502a27883167ce6', 'Environments', 2, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":1,"searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"globe-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"25","child_section":"3","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"100","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","show_delete_button":"6","tmpl_list":"environments.88f893df63703016374870e6d0612901","tmpl_full":"environments.88f893df63703016374870e6d0612901","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 8, 1, 0, 78, 0, 129),
(27, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 6, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 80, 0, 129),
(28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'URI path', 6, 'text', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"direction.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 81, 0, 129),
(29, 'kadc32b63e05baafc80e21f82c9c2818d', 'REST method', 6, 'select', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"navigation-000-button.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","width":"450","size":"10","values":"DELETE\\r\\nGET\\r\\nPOST\\r\\nPUT","default_val":"0","color_separator":"^","label":"- Select Element -","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"1","user_value_label":"Your variant"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 82, 0, 129),
(30, 'keae98b085de51e6fc65fab708c329e5b', 'API', 6, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"wrench.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"Manage from the API details page","field_edit_access":"0","field_edit_message":"Delete this Operation to remove it from the API"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"","parent_type":"2","parent_section":"2","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"1","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"api_list.04c80351983690439cb9e4238c603828","tmpl_full":"api_list.04c80351983690439cb9e4238c603828","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 83, 0, 129),
(31, 'ke57bfd57db052fc441111ca2cddea713', 'Operations', 2, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"gear.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Add Operations from the API details page","field_edit_access":"0","field_edit_message":"Add Operations from the API details page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"30","child_section":"2","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add Operation","add_more_access":"6","add_more_access_list":"0","add_more_access_full":"1","add_return":"back","invite_add_more":"Add Operation","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.d17e74f6f21c6a94b4778399d647ab77","tmpl_full":"sublist.d17e74f6f21c6a94b4778399d647ab77","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 11, 1, 0, 84, 0, 129),
(33, 'k0ebf72bab16b403996a53dd4a28c5ed9', 'Private in products', 4, 'child', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"0","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Manage Environments from the Product details page","field_edit_access":"0","field_edit_message":"Manage Environments from the Product details page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"36","parent_type":"1","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"1000000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.a3674c6de27c1f0408d072c9dea37f05","tmpl_full":"sublist.a3674c6de27c1f0408d072c9dea37f05","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 86, 0, 129),
(34, 'ke8901a14558eec3fd65f49d1c1edf422', 'Public in products', 4, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Manage Environments from the Product details page","field_edit_access":"0","field_edit_message":"Manage Environments from the Product details page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"35","parent_type":"1","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"1","multi_limit":"1000000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.7d7b37c55bb239c9317cebfdc31cd1fd","tmpl_full":"sublist.7d7b37c55bb239c9317cebfdc31cd1fd","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 87, 0, 129),
(35, 'k655301606ad7131f97da6c64b0613dc2', 'Public environments', 1, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"globe-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Field cannot be submitted until after this Product is saved.","field_edit_access":"0","field_edit_message":"Field cannot be submitted until after this Product is saved."},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"environment_product.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"34","child_section":"3","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","show_delete_button":"6","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 88, 0, 129),
(36, 'kcb25dbc531b3d257a9a8709ecfef982b', 'Private environments', 1, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"globe-green.png","field_view_access":"0","field_view_message":"Field disabled","field_submit_access":"0","field_submit_message":"Field disabled","field_edit_access":"0","field_edit_message":"Field disabled"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"5","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"33","child_section":"3","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"6","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"6","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 89, 0, 129),
(37, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 7, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 91, 0, 129),
(38, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 7, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"52","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.c7377af48956b364794b1983783612d2","tmpl_full":"sublist.c7377af48956b364794b1983783612d2","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 92, 0, 129),
(48, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 5, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Contact must be created after the Organization is created","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"50","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","tmpl_list":"sublist.8806e2eb9d8ad32e9aab06b037576cc7","tmpl_full":"sublist.8806e2eb9d8ad32e9aab06b037576cc7","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 104, 0, 129),
(39, 'k00e7fae1cbc44c3e7f5e043172edf994', 'Level', 7, 'plevel', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"category.png","field_view_access":"6","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","sort":"2","width":"450","size":"10","values":"-1\\r\\n1\\r\\n2\\r\\n3\\r\\n4\\r\\n5","default_val":"0","color_separator":"^","label":"- Select Element -","add_value":"2","save_new":"0","user_value_label":"Your variant"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 93, 0, 129),
(40, 'k45b259b885cce1018d0a8a896918ba7d', 'Owner organization', 2, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"Value is auto-assigned","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"41","parent_type":"5","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"6","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"organizations_list.6f89df5b2026aa5ce34871434f7bcdf1","tmpl_full":"organizations_list.6f89df5b2026aa5ce34871434f7bcdf1","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 9, 1, 0, 95, 0, 129),
(41, 'kf1ddca2f092e37cb91f78d03c2c575bd', 'Owned APIs', 5, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"wrench.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Managed from the API","field_edit_access":"0","field_edit_message":"Managed from the API"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"40","child_section":"2","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"api_list.b0b84f8ad56ffeb5d43c5e0dfc06ef64","tmpl_full":"api_list.b0b84f8ad56ffeb5d43c5e0dfc06ef64","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 96, 0, 129),
(42, 'k45b259b885cce1018d0a8a896918ba7d', 'Owner organization', 1, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"This value is auto-assigned","field_edit_access":"10","field_edit_message":"This value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"","parent_type":"5","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 97, 0, 129),
(43, 'k2f2d0419f4f442cabc90e5ee7d3b62f7', 'Owned products', 5, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Managed from the Product","field_edit_access":"0","field_edit_message":"Managed from the Product"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"42","child_section":"1","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.4709c4df676bc034e9b27652120f41b0","tmpl_full":"sublist.4709c4df676bc034e9b27652120f41b0","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 8, 1, 0, 98, 0, 129),
(44, 'k87b1a71d0474134becbd85fb18c2ebd5', 'Inline documentation text', 2, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"projection-screen.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","editor_btn":["image","pagebreak","readmore"],"plugins":["pagebreak"],"allow_html":"6","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 13, 1, 0, 99, 0, 129),
(45, 'k36d589c47b621ae9fded618029705814', 'First name', 8, 'text', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"cards-bind-address.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","ordering_mode":"alpha","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1","values":"Test\\nhello\\nHost\\nJon\\nCollin"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 101, 0, 129),
(46, 'kbc18d5316ffbc2de9df0ebdb4882ad6d', 'Last name', 8, 'text', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"cards-bind-address.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1","values":"Admin\\nhello\\nSuperAdmin\\nWiley\\nHarper"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 102, 0, 129);
INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(47, 'kb0fb4831c8651676fe230ad8088fef0c', 'Member of organizations', 8, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"56","parent_type":"5","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"1","multi_limit":"100","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.426ae3ff8e9e8e2dee62446b17f364d7","tmpl_full":"sublist.426ae3ff8e9e8e2dee62446b17f364d7","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 103, 0, 129),
(49, 'k0cde5db12081099c16dae1d02aa51539', 'Contact for products', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"32","child_section":"1","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.458c347befcdfee06c7549ece28ae46a","tmpl_full":"sublist.458c347befcdfee06c7549ece28ae46a","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 105, 0, 129),
(50, 'ke340a8dbf97c55c1e2bb15dbe6bf36ca', 'Contact for organizations', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"48","child_section":"4","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","show_delete_button":"0","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 106, 0, 129),
(51, 'k72be131da833018c56e39bccf6127fae', 'Contact for APIs', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"wrench.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"6","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"21","child_section":"2","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 107, 0, 129),
(52, 'kf67f44be785abefb4561cdc5004e4007', 'Contact for plans', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"currency.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"38","child_section":"1","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 108, 0, 129),
(53, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'Product', 7, 'child', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"54","parent_type":"1","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.9e8e9b06648b932578c4d1583a405f5c","tmpl_full":"sublist.9e8e9b06648b932578c4d1583a405f5c","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 109, 0, 129),
(54, 'kca7fd33e1521bd135070846191590524', 'Plans', 1, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"currency.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Add plans from the product detail screen","field_edit_access":"0","field_edit_message":"Add plans from the product detail screen"},"params":{"template_input":"default.php","template_output_list":"plans.php","template_output_full":"plans.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"53","child_section":"1","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"6","add_more_access_list":"0","add_more_access_full":"1","add_return":"back","invite_add_more":"Add Plan","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 8, 1, 0, 110, 0, 129),
(55, 'k61ac83a900c8272c2191da5d4d3653ba', 'Plan details', 7, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"clipboard-invoice.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 111, 0, 129),
(56, 'k3545e56579870152d6cc6c9e691c2218', 'Members', 5, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"user-silhouette.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Add Members from the Organization details page","field_edit_access":"0","field_edit_message":"Add Members from the Organization details page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"47","child_section":"4","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add Member","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"1","add_return":"own","invite_add_more":"New Member","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"10","tmpl_list":"sublist.5e23a8b17e0311862438c9f7ad430281","tmpl_full":"sublist.5e23a8b17e0311862438c9f7ad430281","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 11, 1, 0, 112, 0, 129),
(57, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 9, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"question.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 115, 0, 129),
(58, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 9, 'child', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"59","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 116, 0, 129),
(59, 'kb29013c9ab8689a22f7ad4d9d6611bdd', 'Contact for applications', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"application-block.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"58","child_section":"5","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.f114b1ca33a76c6c4955db50a495be00","tmpl_full":"sublist.f114b1ca33a76c6c4955db50a495be00","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 8, 1, 0, 117, 0, 129),
(60, 'k45b259b885cce1018d0a8a896918ba7d', 'Owner organization', 9, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"61","parent_type":"5","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 118, 0, 129),
(61, 'kbfc11810f69e40385d40919c9c51d296', 'Owned applications', 5, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"application-block.png","field_view_access":"8","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Managed from the Application","field_edit_access":"0","field_edit_message":"Managed from the Application"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"60","child_section":"5","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.fc4d9f5837a96bba6b68438040b24734","tmpl_full":"sublist.fc4d9f5837a96bba6b68438040b24734","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 9, 1, 0, 119, 0, 129),
(62, 'kfef9bf29bd08904836ef384ddd00c847', 'Used by applications', 1, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"application-block.png","field_view_access":"6","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"You cannot submit this field","field_edit_access":"0","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"63","parent_type":"9","parent_section":"5","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"1","multi_limit":"1000000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.02880cc25954eb2cc8fa3aef2f34dd53","tmpl_full":"sublist.02880cc25954eb2cc8fa3aef2f34dd53","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 9, 1, 0, 120, 0, 129),
(63, 'ke51e86e4fc332ad15c9ee9b24b537907', 'Products', 9, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"62","child_section":"1","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"8","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.7c65ae994eaff347ceb0c0a07b3e31fd","tmpl_full":"sublist.7c65ae994eaff347ceb0c0a07b3e31fd","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 121, 0, 129),
(64, 'kddd53c164c004afcc1758b7fbc28fd8d', 'Use OAuth?', 9, 'boolean', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"key.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_show_number":"1","filter_hide":"0","filter_descr":"","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","true":"Yes","false":"No","icon_true":"tick.png","icon_false":"cross.png","no_value":"0","view_what":"both"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 122, 0, 129),
(65, 'k78c76af491601e711bbe239a3c6012d3', 'Redirect URL', 9, 'url', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"arrow-out.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"0","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","limit":"3","label":"0","label_change":"1","default_labels":"","link_redirect":"0","show_hits":"1","index_redirect":"0","open_url":"1","snapshot":"1","snapshot_width":"200","qr_code":"1","qr_width":"120","favicon":"1","numeric_list":"0"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 123, 0, 129),
(66, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 10, 'html', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":0,"searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"information.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 1, 1, 0, 126, 0, 129),
(67, 'k45bd148ad6c09c87ba4292c21536d31a', 'Contact', 10, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"user-green.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"68","parent_type":"8","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 127, 0, 129);
INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(68, 'k869475c968a80736fba78e8a0dd9dc05', 'Contact for subscriptions', 8, 'parent', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"feed.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Value is auto-assigned","field_edit_access":"10","field_edit_message":"Value is auto-assigned"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"67","child_section":"6","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 9, 1, 0, 128, 0, 129),
(69, 'kc8a81303998c7bd680fc36dfcb66cee5', 'Plan', 10, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"clipboard-invoice.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"","parent_type":"7","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_width":"500","min_width":"450","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.c08d8c98f4f48a94c310329d698c2fb6","tmpl_full":"sublist.c08d8c98f4f48a94c310329d698c2fb6","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 4, 1, 0, 129, 0, 129),
(70, 'k3c8038b643d7f0176c02199008898bf7', 'Subscriptions', 7, 'parent', '{"core":{"show_intro":"0","show_full":1,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"feed.png","field_view_access":"6","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Create new subscriptions from the Plan detail or the Subscriptions area","field_edit_access":"0","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"69","child_section":"6","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000000","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"New Subscription","add_more_access":"10","add_more_access_list":"1","add_more_access_full":"1","add_return":"back","invite_add_more":"New Subscription","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.46d3c30e6ce144d0a3df61872401239d","tmpl_full":"sublist.46d3c30e6ce144d0a3df61872401239d","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 130, 0, 129),
(71, 'k8d871e19c36e6fd92854f72ce9a21bd2', 'Start date', 10, 'datetime', '{"core":{"show_intro":1,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"calendar-day.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"single_date_picker.php","template_output_list":"list.php","template_output_full":"list.php","sortable":"0","template_filter":"single_date_picker.php","template_filter_module":"single_date_picker.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","filter_compare_label":"Show all records %s","filter_compare_stbefore":"Start before","filter_compare_stafter":"Start after","filter_compare_endbefore":"End before","filter_compare_endafter":"End after","input_default":"now","custom_input":"","input_order":"month","input_delimiter":"\\/","format":"h:i A, l, d F Y","custom":"","time":"0","field_id_type":"","ovr_ctime":"0","ctime_add":"","ovr_extime":"0","extime_add":"","format_out":"d M Y","custom_out":"","computation":"day","mode":"2","normal_style":"b","normal_color":"","notify_style":"b","notify_color":"orange","past_style":"b","past_color":"red","normal_before":"Still","normal_after":"days valid","notify_days":"30","notify_msg":"Last day","notify_before":"Will expire in","notify_after":"days","past_before":"Expired since","past_after":"days","date_before":"","date_style":"b","date_after":"","show_days":"1","date_days_separator":"","age_before":"","age_notify":"","age_expire":"","age_style":"b","age_format":"1","date_age_separator":",","age_custom":"[AGE], [DATE]","age_after":"years"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 131, 0, 129),
(72, 'k24b0869913bdfffab7ad7fea6c1a3892', 'End date', 10, 'datetime', '{"core":{"show_intro":1,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":1,"description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"calendar-day.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"single_date_picker.php","template_output_list":"list.php","template_output_full":"list.php","sortable":"0","template_filter":"single_date_picker.php","template_filter_module":"single_date_picker.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","filter_compare_label":"Show all records %s","filter_compare_stbefore":"Start before","filter_compare_stafter":"Start after","filter_compare_endbefore":"End before","filter_compare_endafter":"End after","input_default":"0","custom_input":"","input_order":"month","input_delimiter":"\\/","format":"h:i A, l, d F Y","custom":"","time":"0","field_id_type":"","ovr_ctime":"0","ctime_add":"","ovr_extime":"0","extime_add":"","format_out":"d M Y","custom_out":"","computation":"day","mode":"2","normal_style":"b","normal_color":"","notify_style":"b","notify_color":"orange","past_style":"b","past_color":"red","normal_before":"Still","normal_after":"days valid","notify_days":"30","notify_msg":"Last day","notify_before":"Will expire in","notify_after":"days","past_before":"Expired since","past_after":"days","date_before":"","date_style":"b","date_after":"","show_days":"1","date_days_separator":"","age_before":"","age_notify":"","age_expire":"","age_style":"b","age_format":"1","date_age_separator":",","age_custom":"[AGE], [DATE]","age_after":"years"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 132, 0, 129),
(73, 'kc0ce29d041859fe0496c7cde216afc5b', 'Subscribing organization', 10, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"building.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"74","parent_type":"5","parent_section":"4","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"1","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.5d8f549f12a5659ba97e5dc40e543610","tmpl_full":"sublist.5d8f549f12a5659ba97e5dc40e543610","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 7, 1, 0, 133, 0, 129),
(74, 'k3c8038b643d7f0176c02199008898bf7', 'Subscriptions', 5, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"feed.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"0","field_submit_message":"Manage from the Subscriptions page","field_edit_access":"0","field_edit_message":"Manage from the Subscriptions page"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"73","child_section":"6","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"10","add_more_access_list":"1","add_more_access_full":"1","add_return":"back","invite_add_more":"New Subscription","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"0","tmpl_list":"sublist.71b9db0a2647c90fd75be251117ff335","tmpl_full":"sublist.71b9db0a2647c90fd75be251117ff335","orderby":"r.ctime ASC","limit_full":"20000","limit_list":"10","show_list_all":"10","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 12, 1, 0, 134, 0, 129),
(77, 'kd31c05da4f7587fa633d906e2017e111', 'System user', 8, 'puser', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"1","required":"0","searchable":"1","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"user-silhouette.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"10","add_more_access_list":"0","add_more_access_full":"1","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"10","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 137, 0, 129),
(78, 'k0e3524381c85abf33d5456047c19a511', 'Status', 10, 'radio', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"tick-circle.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"checkboxes.php","template_filter_module":"select.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","values":"Active\\r\\nInactive","default_val":"Active","total_limit":"0","color_separator":"^","columns":"6","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"1","user_value_label":"Your variant"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 8, 1, 0, 138, 0, 129),
(79, 'k73092a26a24d4492e2396faef4f31f03', 'Rate limit', 7, 'digits', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"flag-small.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_worn":"Between %s and %s","label_min":"Min","label_max":"Max","steps":"1","decimals_num":"0","max_num":"10","separator":",","dseparator":".","prepend":"","append":"Calls per second"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 139, 0, 129),
(80, 'k7986199e12d093adadc3d21877db047f', 'Quota limit', 7, 'digits', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"flag.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_worn":"Between %s and %s","label_min":"Min","label_max":"Max","steps":"1","decimals_num":"0","max_num":"10","separator":",","dseparator":".","prepend":"","append":"Calls per day"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 140, 0, 129),
(81, 'kd6ee80e3d390a574680ae32d7172c21c', 'Type', 11, 'text', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 142, 0, 129),
(82, 'ke74261fe495365da7b0fdb4e3ddccb0b', 'Key', 11, 'text', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"key-solid.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 143, 0, 129),
(83, 'k60cc5d5b6e49d6d17bf54f14e27dd494', 'Secret', 11, 'text', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"balloon-left.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 144, 0, 129),
(84, 'ke6f31a850ecdd893419cee393bbd918c', 'Expiration date', 11, 'datetime', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"calendar-day.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"single_date_picker.php","template_output_list":"list.php","template_output_full":"list.php","sortable":"0","template_filter":"single_date_picker.php","template_filter_module":"single_date_picker.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","filter_compare_label":"Show all records %s","filter_compare_stbefore":"Start before","filter_compare_stafter":"Start after","filter_compare_endbefore":"End before","filter_compare_endafter":"End after","input_default":"0","custom_input":"","input_order":"month","input_delimiter":"\\/","format":"h:i A, l, d F Y","custom":"","time":"0","field_id_type":"","ovr_ctime":"0","ctime_add":"","ovr_extime":"0","extime_add":"","format_out":"d M Y","custom_out":"","computation":"day","mode":"2","normal_style":"b","normal_color":"","notify_style":"b","notify_color":"orange","past_style":"b","past_color":"red","normal_before":"Still","normal_after":"days valid","notify_days":"30","notify_msg":"Last day","notify_before":"Will expire in","notify_after":"days","past_before":"Expired since","past_after":"days","date_before":"","date_style":"b","date_after":"","show_days":"1","date_days_separator":"","age_before":"","age_notify":"","age_expire":"","age_style":"b","age_format":"1","date_age_separator":",","age_custom":"[AGE], [DATE]","age_after":"years"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 145, 0, 129),
(85, 'k0e3524381c85abf33d5456047c19a511', 'Status', 11, 'radio', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"tick-circle.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"checkboxes.php","template_filter_module":"select.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","values":"Active\\r\\nInactive","default_val":"Active","total_limit":"0","color_separator":"^","columns":"6","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"2","save_new":"1","user_value_label":"Your variant"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 146, 0, 129),
(86, 'k0c8256df579b7f4afa2918db7d965bf2', 'Application', 11, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"application-block.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"87","parent_type":"9","parent_section":"5","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.a59ad53c542bc22854be961bfc71c794","tmpl_full":"sublist.a59ad53c542bc22854be961bfc71c794","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 147, 0, 129),
(87, 'k25f952c33ed8cff750243a28988c34e7', 'Keys', 9, 'parent', '{"core":{"show_intro":0,"show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"key-solid.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"86","child_section":"5","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"0","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"3","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 148, 0, 129),
(88, 'k7d74d88b0433a535f1cdd9d3f636bfb9', 'User type', 8, 'select', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"user-silhouette-question.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"usertypes.php","template_output_list":"usertypes.php","template_output_full":"usertypes.php","sortable":"0","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"1","width":"450","size":"10","values":"Member\\r\\nContact\\r\\nManager","default_val":"Member","color_separator":"^","label":"- Select Element -","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"0","user_value_label":"Your variant"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 149, 0, 129),
(89, 'ka207e929bd80fedcd3e4f4740d8cabcf', 'Management URL', 3, 'url', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"globe-green.png","field_view_access":"10","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"1","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"0","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","limit":"0","label":"0","label_change":"0","default_labels":"","link_redirect":"0","show_hits":"0","index_redirect":"0","open_url":"1","snapshot":"0","snapshot_width":"200","qr_code":"0","qr_width":"120","favicon":"0","numeric_list":"0"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 150, 0, 129),
(103, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 2, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"blueprint.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 164, 0, 129),
(111, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 1, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 172, 0, 129);
INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(106, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 3, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 167, 0, 129),
(105, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 4, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 166, 0, 129),
(109, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 5, 'uuid', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"hide","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 170, 0, 129),
(108, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 6, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 6, 1, 0, 169, 0, 129),
(110, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 7, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 171, 0, 129),
(113, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 8, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 174, 0, 129),
(107, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 11, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 168, 0, 129),
(104, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 9, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 165, 0, 129),
(112, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 10, 'uuid', '{"core":{"show_intro":0,"show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"barcode-2d.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 9, 1, 0, 173, 0, 129),
(101, 'k4002e0762b81fd86cd8aab42cf5bf6e7', 'Username', 8, 'text', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"asg-hidden-field","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"2","field_view_message":"You cannot view this field","field_submit_access":"2","field_submit_message":"You cannot submit this field","field_edit_access":"2","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","maxlength":"0","default_val":"0","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 162, 0, 129),
(102, 'k26bba2439bf7543547fc6826aaae5cba', 'Email', 8, 'email', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"email_user_profile.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"Please enter email address","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","enter_mail":"1","view_mail":"1","acemail":"0","acemail_text":"I want to subscribe to newssletter","qr_code":"0","qr_width":"60","send_mail":"8","to":"4","custom":"","change_name_from":"1","change_email_from":"1","cc":"0","subject_style":"1","pre_subject_val":"","subject":"","show_body":"1","body":"","attachment":"1","formats":"zip, tar, rar, txt, jpeg, jpg, pdf, gif, doc, xls","attach_num":"1","button":"Send","copy_to_sender":"1","additional_fields":"","show_captcha":"1","form_style":"2","template_form":"default.php","popup_label":"Send e-mail online"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 163, 0, 129),
(114, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'Product', 10, 'child', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"key-solid.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"","parent_type":"1","parent_section":"1","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"100000","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"0","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.893ec8624d19656408b5e99eb607f352","tmpl_full":"sublist.893ec8624d19656408b5e99eb607f352","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 3, 1, 0, 175, 0, 129),
(115, 'kb1f2b74f19891ecd6f83c0293022e58f', 'Owned subscriptions', 9, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"116","child_section":"6","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","elwidth":"48%","max_result":"10","control_width":"750","control_height":"500","control_label":"Add children","add_more_access":"3","add_more_access_list":"1","add_more_access_full":"1","add_return":"back","invite_add_more":"Add New","add_existing":"3","add_existing_access_list":"1","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","show_delete_button":"3","tmpl_list":"","tmpl_full":"","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_iid":"","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 176, 0, 129),
(116, 'k0ba24eae1ffe1c279c8f86282f911e0f', 'Owner application', 10, 'child', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"115","parent_type":"9","parent_section":"2","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"10","add_more_access_list":"1","add_more_access_full":"1","add_return":"back","invite_add_more":"Add New","add_existing":"10","add_existing_access_list":"1","add_existing_access_full":"1","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.8f4de1f0e75817dfff6ce7a49605890c","tmpl_full":"sublist.8f4de1f0e75817dfff6ce7a49605890c","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"1","show_list_all_list":"1","show_list_type":"1"},"emerald":{"subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 0, 0, 1, 0, 177, 0, 129),
(117, 'k784bc6cd07a39a92239b509bb10715da', 'Inline documentation', 1, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 178, 0, 129),
(118, 'k5b6884f36a562cfdcb94347039c789be', 'Attached documentation files', 1, 'uploads', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"0","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","method":"auto","file_formats":"zip, jpg, png, jpeg, gif, txt, pdf, doc, rtf, rar, 7z, tar, gz, docx","max_count":"0","max_size":"2048","subfolder":"apiDocumentation","delete_access":"1","allow_edit_title":"1","allow_add_descr":"1","show_hit":"2","show_size":"2","show_descr":"2","list_limit":"100","show_in_browser":"0","show_target":"0","sort":"0 ASC","show_download":"1","allow_download":"1","subscr_skip":"10","subscr_skip_author":"1","subscr_skip_moderator":"1","subscription":[""],"subscription_count":"0","subscription_msg":"You cannot download this file. You have to be subscribed member","subscription_redirect":"1","can_select_subscr":"0"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 179, 0, 129),
(119, 'kf157212bd6c9b7ed1895dc1e39fb4620', 'Icon', 9, 'image', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"list.php","template_output_full":"full.php","select_type":"2","directory":"images\\/apps","show_subfolders":"0","allow_caption":"0","default_img":"images\\/icons\\/icon-build.png","subfolder":"image\\/apps","list_mode":"0","lightbox_list":"0","img_list_hspace":"0","img_list_vspace":"0","thumbs_list_height":"100","thumbs_list_width":"100","thumbs_list_quality":"80","thumbs_list_mode":"6","thumbs_list_stretch":"0","thumbs_list_bg":"#000000","full_mode":"0","lightbox_full":"0","img_hspace":"0","img_vspace":"0","thumbs_height":"100","thumbs_width":"100","thumbs_quality":"80","thumbs_mode":"6","thumbs_stretch":"0","thumbs_bg":"#000000"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"You can edit this field if you have following subscription(s).","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 180, 0, 129),
(120, 'k4411d5a430e0b062168d5976164aa24d', 'Price or keyword', 7, 'text', '{"core":{"show_intro":"0","show_full":"0","show_feed":"0","show_compare":"0","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"6","field_submit_message":"You cannot submit this field","field_edit_access":"6","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","ordering_mode":"digits","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","order_by":"","maxlength":"6","default_val":"$","size":"90%","prepend":"","append":"","allow_html":"0","length":"0","seemore":">>>","qr_code":"0","qr_width":"60","regex_val":"","mask":{"mask_type":"","mask":""},"show_mask":"1","values":"$100\\nFREE\\n$500\\n$1000\\nULTIMA\\nTEST\\n$20\\n$99"},"emerald":{"subscr_iid":"","subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription_count":"0","field_display_subscription_msg":"You cannot view this field. Subscriptions of author of this record has expired","field_view_subscription_count":"0","field_view_subscription_msg":"You can view this field if you have following subscription(s).","field_submit_subscription_count":"0","field_submit_subscription_msg":"You can add this field if you have following subscription(s).","field_edit_subscription_count":"0","field_edit_subscription_msg":"You can edit this field if you have following subscription(s)."}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 181, 0, 129),
(121, 'k3a757e1ffc3a04c820ae554298c20a69', 'Contact phone number', 8, 'telephone', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","pattern_country":"+[country]","pattern_region":" ([region])","pattern_tel":" [tel]","pattern_ext":"#[ext]","extension":"1","qr_code":"0","qr_width":"120"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 183, 0, 129),
(122, 'kdd59e7cf2c2eff0db1a2fcb158feb874', 'Organization type', 5, 'select', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"1","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"2","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"autocomplete.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","width":"450","size":"10","values":"host\\r\\npartner","default_val":"0","color_separator":"^","label":"- Select Element -","sql_source":"0","sql":"","sql_link":"","sql_link_target":"0","add_value":"0","save_new":"1","user_value_label":"Your variant"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 187, 0, 129),
(123, 'k5372a54eeda1efbb4f08d344601b1246', 'Auto subscribed', 7, 'checkbox', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"feed-small.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"autosubscribled.php","template_output_list":"autosubscribled.php","template_output_full":"autosubscribled.php","template_filter":"checkboxes.php","template_filter_module":"autocomplete.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_show_number":"1","filter_linkage":"1","filter_icon":"funnel-small.png","filter_tip":"Show all records where %s is equal to %s","sort":"2","values":"1","default_val":"0","total_limit":"0","color_separator":"^","columns":"2","sql_source":"0","sql":"","sql_label":"- Select Element -","sql_link":"","sql_link_target":"0","add_value":"2","save_new":"1","user_value_label":"Your variant","list_limit":"1"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 188, 0, 129),
(124, 'k81ee9e352c67f1d011f5345d45138aba', 'Description', 12, 'html', '{"core":{"show_intro":"1","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","plugins":["pagebreak"],"allow_html":"3","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 190, 0, 129),
(125, 'kfb4b293e8e76c00a9a493e13fb5250a5', 'Scopes', 9, 'parent', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","child_field":"126","child_section":"7","strict_to_user":"1","strict_to_user_mode":"3","multi_limit":"1000","notify_add":"2","notify_attach":"2","input_mode":"5","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Choose","add_more_access":"3","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"3","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Choose","show_delete_button":"3","tmpl_list":"scopelistforapplications.1fccc6ba854e7ecc4d5a9373eed1fc4c","tmpl_full":"scopelistforapplications.1fccc6ba854e7ecc4d5a9373eed1fc4c","orderby":"r.ctime ASC","limit_full":"20","limit_list":"10","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"0","show_list_all_list":"0","show_list_type":"1"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 192, 0, 129),
(126, 'k2473aa346517b07b6fd85c45ea5aff22', 'Applications', 12, 'child', '{"core":{"show_intro":"0","show_full":0,"show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"Please add Scopes from applications page","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_style":"2","filter_show_number":"1","filter_linkage":"1","filter_tip":"Show all records where %s is equal to %s","parent_field":"125","parent_type":"9","parent_section":"5","strict_to_user":"0","strict_to_user_mode":"3","multi_parent":"0","multi_limit":"10","notify_add":"2","notify_attach":"2","input_mode":"2","input_sort":"title ASC","max_result":"10","control_width":"750","control_height":"500","control_label":"Set parent","add_more_access":"3","add_more_access_list":"0","add_more_access_full":"0","add_return":"back","invite_add_more":"Add New","add_existing":"3","add_existing_access_list":"0","add_existing_access_full":"0","add_existing_width":"750","add_existing_height":"500","add_existing_label":"Attach Existing","tmpl_list":"sublist.c81c32dd448cd8b396d539a9c5cece88","tmpl_full":"sublist.c81c32dd448cd8b396d539a9c5cece88","orderby":"r.ctime ASC","limit_list":"10","limit_full":"20","show_list_all":"2","invite_view_more":"Show All...","show_list_all_full":"0","show_list_all_list":"0","show_list_type":"1"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 193, 0, 129);
INSERT INTO `openapi_js_res_fields` (`id`, `key`, `label`, `type_id`, `field_type`, `params`, `checked_out`, `checked_out_time`, `published`, `ordering`, `access`, `group_id`, `asset_id`, `filter`, `user_id`) VALUES
(127, 'k038b047560c7997fe3b7debaa85b14ae', 'Upload WSDL API spec', 2, 'uploads', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"blueprint.png","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","method":"auto","file_formats":"wsdl","max_count":"1","max_size":"8192","subfolder":"uploads","delete_access":"1","allow_edit_title":"1","allow_add_descr":"1","show_hit":"0","show_size":"0","show_descr":"2","list_limit":"5","show_in_browser":"0","show_target":"0","sort":"0 ASC","show_download":"1","allow_download":"1","subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","subscription":[""],"subscription_msg":"You cannot download this file. You have to be subscribed member","subscription_redirect":"1","can_select_subscr":"0"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 2, 1, 0, 196, 0, 129),
(129, 'k3a8db3100cd71b87cd272cee4e04c7a7', 'Product-specific terms & conditions', 1, 'html', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"","xml_tag_name":"","field_class":"","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"10","field_submit_message":"You cannot submit this field","field_edit_access":"10","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","default_value":"","intro":"2000","hide_intro":"0","readmore":"0","readmore_lbl":"Read More...","editor":"tinymce","short":"0","height":"300","editor_btn":["pagebreak","readmore"],"plugins":["pagebreak"],"allow_html":"10","tags_mode":"1","filter_tags":"iframe, script","attr_mode":"1","filter_attr":"rel"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 0, 1, 0, 198, 0, 129),
(130, 'k61f5a28a49382c4f6de40ae780f1e80f', 'Usage alert threshold', 5, 'digits', '{"core":{"show_intro":"0","show_full":"1","show_feed":"0","show_compare":"1","required":"0","searchable":"0","description":"This is the usage percentage at which you will receive an alert notification. Valid values: 0-100","xml_tag_name":"","field_class":"threshold","show_lable":"3","label_break":"0","lable_class":"","icon":"","field_view_access":"1","field_view_message":"You cannot view this field","field_submit_access":"1","field_submit_message":"You cannot submit this field","field_edit_access":"1","field_edit_message":"You cannot edit this field"},"params":{"template_input":"default.php","template_output_list":"default.php","template_output_full":"default.php","sortable":"0","template_filter":"default.php","template_filter_module":"default.php","filter_enable":"0","filter_hide":"0","filter_descr":"","filter_worn":"Between %s and %s","label_min":"Min","label_max":"Max","steps":"1","decimals_num":"0","max_num":"3","separator":",","dseparator":".","prepend":"","append":"%"},"emerald":{"subscr_skip":"3","subscr_skip_author":"1","subscr_skip_moderator":"1","field_display_subscription":[""],"field_display_subscription_msg":"You can view this field only if article author has subscription.","field_display_subscription_count":"0","field_view_subscription":[""],"field_view_subscription_msg":"Only our paid members can view this field.","field_view_subscription_count":"0","field_submit_subscription":[""],"field_submit_subscription_msg":"Only our paid members can vew add this field.","field_submit_subscription_count":"0","field_edit_subscription":[""],"field_edit_subscription_msg":"Only our paid members can edit this field.","field_edit_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, 5, 1, 0, 202, 0, 129);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_fields_group`
--

DROP TABLE IF EXISTS `openapi_js_res_fields_group`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_fields_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `type_id` int(10) NOT NULL,
  `ordering` int(10) NOT NULL,
  `icon` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `openapi_js_res_fields_group`
--

INSERT INTO `openapi_js_res_fields_group` (`id`, `title`, `type_id`, `ordering`, `icon`, `description`, `checked_out`, `checked_out_time`) VALUES
(3, 'Test', 2, 3, '', '', 0, '0000-00-00 00:00:00'),
(4, 'API Documentation', 2, 2, '', '', 0, '0000-00-00 00:00:00'),
(5, 'API Operation', 2, 1, '', '', 0, '0000-00-00 00:00:00'),
(6, 'Step2', 1, 1, '', '', 0, '0000-00-00 00:00:00'),
(7, 'Step3', 1, 2, '', '', 0, '0000-00-00 00:00:00'),
(8, 'Others', 1, 3, '', '', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_field_geo`
--

DROP TABLE IF EXISTS `openapi_js_res_field_geo`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_field_geo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` char(2) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `lat` float(18,15) DEFAULT NULL,
  `lng` float(18,15) DEFAULT NULL,
  `state_trans` varchar(150) DEFAULT NULL,
  `city_trans` varchar(200) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `field_key` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sect` (`section_id`),
  KEY `idx_key` (`field_key`),
  KEY `idx_fid` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_field_multilevelselect`
--

DROP TABLE IF EXISTS `openapi_js_res_field_multilevelselect`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_field_multilevelselect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_field` (`field_id`),
  KEY `idx_lr` (`lft`,`rgt`),
  KEY `idx_parent` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `openapi_js_res_field_multilevelselect`
--

INSERT INTO `openapi_js_res_field_multilevelselect` (`id`, `name`, `field_id`, `parent_id`, `level`, `lft`, `rgt`) VALUES
(1, 'root', 0, 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_field_stepaccess`
--

DROP TABLE IF EXISTS `openapi_js_res_field_stepaccess`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_field_stepaccess` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_record` (`record_id`),
  KEY `idx_field` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_field_telephone`
--

DROP TABLE IF EXISTS `openapi_js_res_field_telephone`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_field_telephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code2` varchar(2) NOT NULL DEFAULT '',
  `code3` varchar(3) NOT NULL DEFAULT '',
  `phone_code` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=238 ;

--
-- Dumping data for table `openapi_js_res_field_telephone`
--

INSERT INTO `openapi_js_res_field_telephone` (`id`, `name`, `code2`, `code3`, `phone_code`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '93'),
(2, 'Albania', 'AL', 'ALB', '355'),
(3, 'Algeria', 'DZ', 'DZA', '213'),
(4, 'American Samoa', 'AS', 'ASM', '1-684'),
(5, 'Andorra', 'AD', 'AND', '376'),
(6, 'Angola', 'AO', 'AGO', '244'),
(7, 'Anguilla', 'AI', 'AIA', '1-264'),
(8, 'Antarctica', 'AQ', 'ATA', '672'),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '1-268'),
(10, 'Argentina', 'AR', 'ARG', '54'),
(11, 'Armenia', 'AM', 'ARM', '374'),
(12, 'Aruba', 'AW', 'ABW', '297'),
(13, 'Australia', 'AU', 'AUS', '61'),
(14, 'Austria', 'AT', 'AUT', '43'),
(15, 'Azerbaijan', 'AZ', 'AZE', '994'),
(16, 'Bahamas', 'BS', 'BHS', '1-242'),
(17, 'Bahrain', 'BH', 'BHR', '973'),
(18, 'Bangladesh', 'BD', 'BGD', '880'),
(19, 'Barbados', 'BB', 'BRB', '1-246'),
(20, 'Belarus', 'BY', 'BLR', '375'),
(21, 'Belgium', 'BE', 'BEL', '32'),
(22, 'Belize', 'BZ', 'BLZ', '501'),
(23, 'Benin', 'BJ', 'BEN', '229'),
(24, 'Bermuda', 'BM', 'BMU', '1-441'),
(25, 'Bhutan', 'BT', 'BTN', '975'),
(26, 'Bolivia', 'BO', 'BOL', '591'),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '387'),
(28, 'Botswana', 'BW', 'BWA', '267'),
(29, 'Brazil', 'BR', 'BRA', '55'),
(30, 'British Indian Ocean Territory', 'IO', 'IOT', ''),
(31, 'British Virgin Islands', 'VG', 'VGB', '1-284'),
(32, 'Brunei', 'BN', 'BRN', '673'),
(33, 'Bulgaria', 'BG', 'BGR', '359'),
(34, 'Burkina Faso', 'BF', 'BFA', '226'),
(35, 'Burma (Myanmar)', 'MM', 'MMR', '95'),
(36, 'Burundi', 'BI', 'BDI', '257'),
(37, 'Cambodia', 'KH', 'KHM', '855'),
(38, 'Cameroon', 'CM', 'CMR', '237'),
(39, 'Canada', 'CA', 'CAN', '1'),
(40, 'Cape Verde', 'CV', 'CPV', '238'),
(41, 'Cayman Islands', 'KY', 'CYM', '1-345'),
(42, 'Central African Republic', 'CF', 'CAF', '236'),
(43, 'Chad', 'TD', 'TCD', '235'),
(44, 'Chile', 'CL', 'CHL', '56'),
(45, 'China', 'CN', 'CHN', '86'),
(46, 'Christmas Island', 'CX', 'CXR', '61'),
(47, 'Cocos (Keeling) Islands', 'CC', 'CCK', '61'),
(48, 'Colombia', 'CO', 'COL', '57'),
(49, 'Comoros', 'KM', 'COM', '269'),
(50, 'Cook Islands', 'CK', 'COK', '682'),
(51, 'Costa Rica', 'CR', 'CRC', '506'),
(52, 'Croatia', 'HR', 'HRV', '385'),
(53, 'Cuba', 'CU', 'CUB', '53'),
(54, 'Cyprus', 'CY', 'CYP', '357'),
(55, 'Czech Republic', 'CZ', 'CZE', '420'),
(56, 'Democratic Republic of the Congo', 'CD', 'COD', '243'),
(57, 'Denmark', 'DK', 'DNK', '45'),
(58, 'Djibouti', 'DJ', 'DJI', '253'),
(59, 'Dominica', 'DM', 'DMA', '1-767'),
(60, 'Dominican Republic', 'DO', 'DOM', '1-809'),
(61, 'Ecuador', 'EC', 'ECU', '593'),
(62, 'Egypt', 'EG', 'EGY', '20'),
(63, 'El Salvador', 'SV', 'SLV', '503'),
(64, 'Equatorial Guinea', 'GQ', 'GNQ', '240'),
(65, 'Eritrea', 'ER', 'ERI', '291'),
(66, 'Estonia', 'EE', 'EST', '372'),
(67, 'Ethiopia', 'ET', 'ETH', '251'),
(68, 'Falkland Islands', 'FK', 'FLK', '500'),
(69, 'Faroe Islands', 'FO', 'FRO', '298'),
(70, 'Fiji', 'FJ', 'FJI', '679'),
(71, 'Finland', 'FI', 'FIN', '358'),
(72, 'France', 'FR', 'FRA', '33'),
(73, 'French Polynesia', 'PF', 'PYF', '689'),
(74, 'Gabon', 'GA', 'GAB', '241'),
(75, 'Gambia', 'GM', 'GMB', '220'),
(76, 'Gaza Strip', '', '', '970'),
(77, 'Georgia', 'GE', 'GEO', '995'),
(78, 'Germany', 'DE', 'DEU', '49'),
(79, 'Ghana', 'GH', 'GHA', '233'),
(80, 'Gibraltar', 'GI', 'GIB', '350'),
(81, 'Greece', 'GR', 'GRC', '30'),
(82, 'Greenland', 'GL', 'GRL', '299'),
(83, 'Grenada', 'GD', 'GRD', '1-473'),
(84, 'Guam', 'GU', 'GUM', '1-671'),
(85, 'Guatemala', 'GT', 'GTM', '502'),
(86, 'Guinea', 'GN', 'GIN', '224'),
(87, 'Guinea-Bissau', 'GW', 'GNB', '245'),
(88, 'Guyana', 'GY', 'GUY', '592'),
(89, 'Haiti', 'HT', 'HTI', '509'),
(90, 'Holy See (Vatican City)', 'VA', 'VAT', '39'),
(91, 'Honduras', 'HN', 'HND', '504'),
(92, 'Hong Kong', 'HK', 'HKG', '852'),
(93, 'Hungary', 'HU', 'HUN', '36'),
(94, 'Iceland', 'IS', 'IS', '354'),
(95, 'India', 'IN', 'IND', '91'),
(96, 'Indonesia', 'ID', 'IDN', '62'),
(97, 'Iran', 'IR', 'IRN', '98'),
(98, 'Iraq', 'IQ', 'IRQ', '964'),
(99, 'Ireland', 'IE', 'IRL', '353'),
(100, 'Isle of Man', 'IM', 'IMN', '44'),
(101, 'Israel', 'IL', 'ISR', '972'),
(102, 'Italy', 'IT', 'ITA', '39'),
(103, 'Ivory Coast', 'CI', 'CIV', '225'),
(104, 'Jamaica', 'JM', 'JAM', '1-876'),
(105, 'Japan', 'JP', 'JPN', '81'),
(106, 'Jersey', 'JE', 'JEY', ''),
(107, 'Jordan', 'JO', 'JOR', '962'),
(108, 'Kazakhstan', 'KZ', 'KAZ', '7'),
(109, 'Kenya', 'KE', 'KEN', '254'),
(110, 'Kiribati', 'KI', 'KIR', '686'),
(111, 'Kosovo', '', '', '381'),
(112, 'Kuwait', 'KW', 'KWT', '965'),
(113, 'Kyrgyzstan', 'KG', 'KGZ', '996'),
(114, 'Laos', 'LA', 'LAO', '856'),
(115, 'Latvia', 'LV', 'LVA', '371'),
(116, 'Lebanon', 'LB', 'LBN', '961'),
(117, 'Lesotho', 'LS', 'LSO', '266'),
(118, 'Liberia', 'LR', 'LBR', '231'),
(119, 'Libya', 'LY', 'LBY', '218'),
(120, 'Liechtenstein', 'LI', 'LIE', '423'),
(121, 'Lithuania', 'LT', 'LTU', '370'),
(122, 'Luxembourg', 'LU', 'LUX', '352'),
(123, 'Macau', 'MO', 'MAC', '853'),
(124, 'Macedonia', 'MK', 'MKD', '389'),
(125, 'Madagascar', 'MG', 'MDG', '261'),
(126, 'Malawi', 'MW', 'MWI', '265'),
(127, 'Malaysia', 'MY', 'MYS', '60'),
(128, 'Maldives', 'MV', 'MDV', '960'),
(129, 'Mali', 'ML', 'MLI', '223'),
(130, 'Malta', 'MT', 'MLT', '356'),
(131, 'Marshall Islands', 'MH', 'MHL', '692'),
(132, 'Mauritania', 'MR', 'MRT', '222'),
(133, 'Mauritius', 'MU', 'MUS', '230'),
(134, 'Mayotte', 'YT', 'MYT', '262'),
(135, 'Mexico', 'MX', 'MEX', '52'),
(136, 'Micronesia', 'FM', 'FSM', '691'),
(137, 'Moldova', 'MD', 'MDA', '373'),
(138, 'Monaco', 'MC', 'MCO', '377'),
(139, 'Mongolia', 'MN', 'MNG', '976'),
(140, 'Montenegro', 'ME', 'MNE', '382'),
(141, 'Montserrat', 'MS', 'MSR', '1-664'),
(142, 'Morocco', 'MA', 'MAR', '212'),
(143, 'Mozambique', 'MZ', 'MOZ', '258'),
(144, 'Namibia', 'NA', 'NAM', '264'),
(145, 'Nauru', 'NR', 'NRU', '674'),
(146, 'Nepal', 'NP', 'NPL', '977'),
(147, 'Netherlands', 'NL', 'NLD', '31'),
(148, 'Netherlands Antilles', 'AN', 'ANT', '599'),
(149, 'New Caledonia', 'NC', 'NCL', '687'),
(150, 'New Zealand', 'NZ', 'NZL', '64'),
(151, 'Nicaragua', 'NI', 'NIC', '505'),
(152, 'Niger', 'NE', 'NER', '227'),
(153, 'Nigeria', 'NG', 'NGA', '234'),
(154, 'Niue', 'NU', 'NIU', '683'),
(155, 'Norfolk Island', '', '', '672'),
(156, 'North Korea', 'KP', 'PRK', '850'),
(157, 'Northern Mariana Islands', 'MP', 'MNP', '1-670'),
(158, 'Norway', 'NO', 'NOR', '47'),
(159, 'Oman', 'OM', 'OMN', '968'),
(160, 'Pakistan', 'PK', 'PAK', '92'),
(161, 'Palau', 'PW', 'PLW', '680'),
(162, 'Panama', 'PA', 'PAN', '507'),
(163, 'Papua New Guinea', 'PG', 'PNG', '675'),
(164, 'Paraguay', 'PY', 'PRY', '595'),
(165, 'Peru', 'PE', 'PER', '51'),
(166, 'Philippines', 'PH', 'PHL', '63'),
(167, 'Pitcairn Islands', 'PN', 'PCN', '870'),
(168, 'Poland', 'PL', 'POL', '48'),
(169, 'Portugal', 'PT', 'PRT', '351'),
(170, 'Puerto Rico', 'PR', 'PRI', '1'),
(171, 'Qatar', 'QA', 'QAT', '974'),
(172, 'Republic of the Congo', 'CG', 'COG', '242'),
(173, 'Romania', 'RO', 'ROU', '40'),
(174, 'Russia', 'RU', 'RUS', '7'),
(175, 'Rwanda', 'RW', 'RWA', '250'),
(176, 'Saint Barthelemy', 'BL', 'BLM', '590'),
(177, 'Saint Helena', 'SH', 'SHN', '290'),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '1-869'),
(179, 'Saint Lucia', 'LC', 'LCA', '1-758'),
(180, 'Saint Martin', 'MF', 'MAF', '1-599'),
(181, 'Saint Pierre and Miquelon', 'PM', 'SPM', '508'),
(182, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '1-784'),
(183, 'Samoa', 'WS', 'WSM', '685'),
(184, 'San Marino', 'SM', 'SMR', '378'),
(185, 'Sao Tome and Principe', 'ST', 'STP', '239'),
(186, 'Saudi Arabia', 'SA', 'SAU', '966'),
(187, 'Senegal', 'SN', 'SEN', '221'),
(188, 'Serbia', 'RS', 'SRB', '381'),
(189, 'Seychelles', 'SC', 'SYC', '248'),
(190, 'Sierra Leone', 'SL', 'SLE', '232'),
(191, 'Singapore', 'SG', 'SGP', '65'),
(192, 'Slovakia', 'SK', 'SVK', '421'),
(193, 'Slovenia', 'SI', 'SVN', '386'),
(194, 'Solomon Islands', 'SB', 'SLB', '677'),
(195, 'Somalia', 'SO', 'SOM', '252'),
(196, 'South Africa', 'ZA', 'ZAF', '27'),
(197, 'South Korea', 'KR', 'KOR', '82'),
(198, 'Spain', 'ES', 'ESP', '34'),
(199, 'Sri Lanka', 'LK', 'LKA', '94'),
(200, 'Sudan', 'SD', 'SDN', '249'),
(201, 'Suriname', 'SR', 'SUR', '597'),
(202, 'Svalbard', 'SJ', 'SJM', ''),
(203, 'Swaziland', 'SZ', 'SWZ', '268'),
(204, 'Sweden', 'SE', 'SWE', '46'),
(205, 'Switzerland', 'CH', 'CHE', '41'),
(206, 'Syria', 'SY', 'SYR', '963'),
(207, 'Taiwan', 'TW', 'TWN', '886'),
(208, 'Tajikistan', 'TJ', 'TJK', '992'),
(209, 'Tanzania', 'TZ', 'TZA', '255'),
(210, 'Thailand', 'TH', 'THA', '66'),
(211, 'Timor-Leste', 'TL', 'TLS', '670'),
(212, 'Togo', 'TG', 'TGO', '228'),
(213, 'Tokelau', 'TK', 'TKL', '690'),
(214, 'Tonga', 'TO', 'TON', '676'),
(215, 'Trinidad and Tobago', 'TT', 'TTO', '1-868'),
(216, 'Tunisia', 'TN', 'TUN', '216'),
(217, 'Turkey', 'TR', 'TUR', '90'),
(218, 'Turkmenistan', 'TM', 'TKM', '993'),
(219, 'Turks and Caicos Islands', 'TC', 'TCA', '1-649'),
(220, 'Tuvalu', 'TV', 'TUV', '688'),
(221, 'Uganda', 'UG', 'UGA', '256'),
(222, 'Ukraine', 'UA', 'UKR', '380'),
(223, 'United Arab Emirates', 'AE', 'ARE', '971'),
(224, 'United Kingdom', 'GB', 'GBR', '44'),
(225, 'United States', 'US', 'USA', '1'),
(226, 'Uruguay', 'UY', 'URY', '598'),
(227, 'US Virgin Islands', 'VI', 'VIR', '1-340'),
(228, 'Uzbekistan', 'UZ', 'UZB', '998'),
(229, 'Vanuatu', 'VU', 'VUT', '678'),
(230, 'Venezuela', 'VE', 'VEN', '58'),
(231, 'Vietnam', 'VN', 'VNM', '84'),
(232, 'Wallis and Futuna', 'WF', 'WLF', '681'),
(233, 'West Bank', '', '', '970'),
(234, 'Western Sahara', 'EH', 'ESH', ''),
(235, 'Yemen', 'YE', 'YEM', '967'),
(236, 'Zambia', 'ZM', 'ZMB', '260'),
(237, 'Zimbabwe', 'ZW', 'ZWE', '263');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_files`
--

DROP TABLE IF EXISTS `openapi_js_res_files`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_files` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(55) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `ctime` datetime NOT NULL,
  `saved` tinyint(1) NOT NULL,
  `params` text,
  `section_id` int(11) DEFAULT NULL,
  `record_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `ext` varchar(10) NOT NULL,
  `fullpath` text NOT NULL,
  `hits` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `rating_nums` int(11) DEFAULT NULL,
  `comments` text,
  `comment_num` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `views` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`filename`),
  KEY `idx_record` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `openapi_js_res_files`
--

INSERT INTO `openapi_js_res_files` (`id`, `filename`, `realname`, `ctime`, `saved`, `params`, `section_id`, `record_id`, `type_id`, `field_id`, `user_id`, `ext`, `fullpath`, `hits`, `size`, `ip`, `width`, `height`, `rating`, `rating_nums`, `comments`, `comment_num`, `title`, `description`, `views`) VALUES
(33, '1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx', 'Book Catalog Getting Started.docx', '2013-11-19 01:37:47', 1, NULL, 1, 231, 1, 118, 129, 'docx', '2013-11/1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx', 0, 31225, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf', 'Frequently Asked Questions.pdf', '2013-11-19 01:37:47', 1, NULL, 1, 231, 1, 118, 129, 'pdf', '2013-11/1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf', 0, 31526, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, '1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf', 'Books Getting Started.pdf', '2013-11-19 01:21:14', 1, NULL, 2, 225, 2, 24, 129, 'pdf', '2013-11/1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf', 0, 48978, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '1384779600_557292919508c832bb39715f0e2ce083.docx', 'Books API v1 FAQ.docx', '2013-11-19 01:21:14', 1, NULL, 2, 225, 2, 24, 129, 'docx', '2013-11/1384779600_557292919508c832bb39715f0e2ce083.docx', 0, 37552, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, '1384779600_48fddb734c73e61f386c58f419035f65.json', 'book.json', '2013-11-19 01:11:11', 1, NULL, 2, 225, 2, 23, 129, 'json', '2013-11/1384779600_48fddb734c73e61f386c58f419035f65.json', 0, 5020, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, '1384779600_fed1e102ef7a477c7e8039cd8e658305.json', 'book.json', '2013-11-19 01:09:57', 2, NULL, 2, 0, 2, 23, 129, 'json', '2013-11/1384779600_fed1e102ef7a477c7e8039cd8e658305.json', 0, 5024, '::1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_hits`
--

DROP TABLE IF EXISTS `openapi_js_res_hits`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_hits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_record` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=216 ;

--
-- Dumping data for table `openapi_js_res_hits`
--

INSERT INTO `openapi_js_res_hits` (`id`, `record_id`, `ctime`, `user_id`, `ip`, `section_id`) VALUES
(211, 231, '2013-11-23 23:07:04', 129, '::1', 1),
(210, 220, '2013-11-23 22:47:19', 129, '::1', 4),
(209, 219, '2013-11-23 22:47:12', 129, '::1', 4),
(208, 68, '2013-11-23 22:46:59', 129, '::1', 4),
(207, 237, '2013-11-23 22:42:25', 129, '::1', 5),
(206, 225, '2013-11-23 22:33:46', 129, '::1', 2),
(212, 221, '2013-12-24 07:59:23', 129, '127.0.0.1', 4),
(213, 223, '2013-12-27 05:46:53', 129, '127.0.0.1', 3),
(214, 238, '2013-12-27 05:59:20', 129, '127.0.0.1', 6),
(215, 231, '2014-02-21 06:50:32', 154, '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_import`
--

DROP TABLE IF EXISTS `openapi_js_res_import`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_import` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `params` text,
  `user_id` int(11) DEFAULT NULL,
  `crossids` text,
  `section_id` int(11) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_import_rows`
--

DROP TABLE IF EXISTS `openapi_js_res_import_rows`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_import_rows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `import` int(11) DEFAULT NULL,
  `text` text,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_import` (`import`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_moderators`
--

DROP TABLE IF EXISTS `openapi_js_res_moderators`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_moderators` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `description` text,
  `params` text,
  `ctime` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `checked_out` int(11) DEFAULT '0',
  `checked_out_time` datetime DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `is_moderator` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind` (`user_id`,`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_notifications`
--

DROP TABLE IF EXISTS `openapi_js_res_notifications`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `ctime` datetime NOT NULL,
  `notified` tinyint(1) NOT NULL,
  `alerted` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `ref_1` int(11) DEFAULT '0',
  `ref_2` int(11) DEFAULT '0',
  `ref_3` int(11) DEFAULT '0',
  `ref_4` int(11) DEFAULT '0',
  `ref_5` int(11) DEFAULT '0',
  `html` text NOT NULL,
  `num` int(11) DEFAULT '0',
  `state_new` tinyint(1) NOT NULL DEFAULT '1',
  `eventer` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_r_1` (`ref_1`),
  KEY `idx_r_2` (`ref_2`),
  KEY `idx_ruser` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_packs`
--

DROP TABLE IF EXISTS `openapi_js_res_packs`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_packs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `key` char(10) NOT NULL,
  `addkey` tinyint(2) NOT NULL DEFAULT '1',
  `add_files` text,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `btime` datetime NOT NULL,
  `version` varchar(20) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `users` tinyint(3) NOT NULL,
  `user_id` int(11) NOT NULL,
  `author_name` text,
  `author_email` text,
  `author_url` text,
  `demo` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_packs_sections`
--

DROP TABLE IF EXISTS `openapi_js_res_packs_sections`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_packs_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pack_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_polls`
--

DROP TABLE IF EXISTS `openapi_js_res_polls`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_polls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `record` (`record_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_record`
--

DROP TABLE IF EXISTS `openapi_js_res_record`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `section_id` int(10) NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `extime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inittime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ftime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Time to expire featured',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `meta_descr` varchar(255) NOT NULL DEFAULT '',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_index` varchar(30) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL,
  `featured` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ucatid` int(10) unsigned NOT NULL DEFAULT '0',
  `ucatname` varchar(150) DEFAULT NULL,
  `langs` varchar(10) NOT NULL DEFAULT '',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `votes` int(10) unsigned NOT NULL DEFAULT '0',
  `favorite_num` int(10) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votes_result` int(10) unsigned NOT NULL DEFAULT '0',
  `exalert` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'flag if expiration alert was sent',
  `access_key` varchar(32) NOT NULL DEFAULT '',
  `categories` mediumtext,
  `fieldsdata` longtext,
  `fields` longtext NOT NULL,
  `comments` int(11) DEFAULT '0',
  `tags` text NOT NULL,
  `multirating` text,
  `subscriptions_num` int(11) DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `parent` varchar(45) NOT NULL DEFAULT 'com_cobalt',
  `whorepost` tinyint(1) NOT NULL DEFAULT '0',
  `repostedby` text,
  `newTags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_section` (`section_id`),
  KEY `idx_published` (`published`),
  KEY `idx_user` (`user_id`),
  KEY `idx_access` (`access`),
  KEY `idx_ctime` (`ctime`),
  KEY `idx_extime` (`extime`),
  KEY `idx_featured` (`featured`),
  KEY `idx_ucat` (`ucatid`),
  KEY `idx_lang` (`langs`),
  KEY `idx_parent` (`parent_id`),
  KEY `idx_name` (`title`),
  KEY `idx_comment` (`comments`),
  KEY `idx_vote` (`votes_result`),
  KEY `idx_mtime` (`mtime`),
  FULLTEXT KEY `full` (`fieldsdata`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=239 ;

--
-- Dumping data for table `openapi_js_res_record`
--

INSERT INTO `openapi_js_res_record` (`id`, `title`, `published`, `access`, `params`, `user_id`, `section_id`, `checked_out`, `checked_out_time`, `ctime`, `extime`, `mtime`, `inittime`, `ftime`, `type_id`, `hits`, `ordering`, `meta_descr`, `meta_key`, `meta_index`, `alias`, `featured`, `archive`, `ucatid`, `ucatname`, `langs`, `asset_id`, `ip`, `votes`, `favorite_num`, `hidden`, `votes_result`, `exalert`, `access_key`, `categories`, `fieldsdata`, `fields`, `comments`, `tags`, `multirating`, `subscriptions_num`, `version`, `parent_id`, `parent`, `whorepost`, `repostedby`, `newTags`) VALUES
(68, 'Host Organization', 1, 8, '', 129, 4, 0, '0000-00-00 00:00:00', '2013-11-18 22:14:11', '0000-00-00 00:00:00', '2013-12-27 05:54:07', '2013-11-18 22:15:37', '0000-00-00 00:00:00', 5, 1, 0, '', '', '', 'host-organization', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'b0684b7732ab2d31dbef74d75abc919a', '[]', ', Host Administrator, Host Organization', '{"109":"7365b8b3-4e47-e706-54cf-4e877bc524b5","122":["host"],"17":"","19":"admin@local.host","20":{"address":{"country":"US","state":"CA","city":"Some City","zip":"99999","address1":"1234 Some St.","address2":""},"contacts":{"tel":"555-555-5555"}},"48":"219","130":""}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(219, 'Host Administrator', 1, 2, '', 129, 4, 0, '0000-00-00 00:00:00', '2013-11-18 22:50:48', '0000-00-00 00:00:00', '2013-11-18 22:52:19', '2013-11-18 22:52:19', '0000-00-00 00:00:00', 8, 1, 0, '', '', '', 'acme-super-administrator', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '14646acfbabb4b3e0aeb5b5edd552983', '[]', '129, Host, SuperAdmin, Host Administrator', '{"77":"129","88":["Manager"],"113":null,"101":"admin","102":"admin@local.host","121":{"country":"1","region":"650","tel":"8461000","ext":""},"45":"Host","46":"SuperAdmin","47":"68","50":["68"]}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(220, 'Acme App Services', 1, 8, '', 129, 4, 0, '0000-00-00 00:00:00', '2013-11-19 00:31:52', '0000-00-00 00:00:00', '2013-12-24 08:21:30', '2013-11-19 00:43:16', '0000-00-00 00:00:00', 5, 1, 0, '', '', '', 'acme-app-services', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '0a3ba8c4c376168fa1858b0482f60746', '[]', 'We provide a range of mobile application development services., Jon Wiley, Acme App Services', '{"109":"317eabf2-33cb-9a33-88e0-c3dd921d9a98","122":["partner"],"17":"<p>We provide a range of mobile application development services.<\\/p>","19":"admin@local.host","20":{"address":{"country":"US","state":"CA","city":"Palo Alto","zip":"94304","address1":"123 Some Street","address2":""},"contacts":{"tel":"555-555-5555"}},"48":"221","130":"80%"}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(222, 'Collin Harper', 1, 2, '', 129, 4, 0, '0000-00-00 00:00:00', '2013-11-19 00:48:03', '0000-00-00 00:00:00', '2013-11-19 00:49:08', '2013-11-19 00:49:08', '0000-00-00 00:00:00', 8, 0, 0, '', '', '', 'collin-harper', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'eeed523abfac74763ab2b90b44de59bd', '[]', '155, Collin, Harper, Collin Harper', '{"77":"155","88":["Member"],"113":null,"101":"charper","102":"charper@local.host","121":{"country":"1","region":"555","tel":"5555557","ext":""},"45":"Collin","46":"Harper","47":"220","50":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(221, 'Jon Wiley', 1, 2, '', 129, 4, 0, '0000-00-00 00:00:00', '2013-11-19 00:44:25', '0000-00-00 00:00:00', '2013-11-19 00:47:15', '2013-11-19 00:47:15', '0000-00-00 00:00:00', 8, 1, 0, '', '', '', 'jon-wiley', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '5c09bab4d7a464e8cd70d5f6967f57e7', '[]', '154, Jon, Wiley, Jon Wiley', '{"77":"154","88":["Manager"],"113":null,"101":"jwiley","102":"jwiley@local.host","121":{"country":"1","region":"555","tel":"5555556","ext":""},"45":"Jon","46":"Wiley","47":"220","50":["220"]}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(223, 'Production Environment', 1, 6, '', 129, 3, 0, '0000-00-00 00:00:00', '2013-11-19 00:56:49', '0000-00-00 00:00:00', '2013-12-27 05:48:01', '2013-11-19 00:59:32', '0000-00-00 00:00:00', 4, 1, 0, '', '', '', 'production-environment', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'c078043ca693c581a8bdbe3c94f4dfd0', '[]', 'Public endpoint (load balanced across gateway instances)., Production, Production Gateway, Production Environment', '{"105":null,"12":"<p>Public endpoint (load balanced across gateway instances).<\\/p>","13":["Production"],"14":[{"hits":"0","url":"http:\\/\\/localhost:9222"}],"15":["224"]}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(224, 'Production Gateway', 1, 6, '', 129, 3, 0, '0000-00-00 00:00:00', '2013-11-19 00:59:39', '0000-00-00 00:00:00', '2013-11-19 01:02:37', '2013-11-19 01:02:37', '0000-00-00 00:00:00', 3, 0, 0, '', '', '', 'production-gateway', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '84d9caff79977a10baa849bebb830453', '[]', ', Production Gateway', '{"8":"","16":[223],"89":[{"hits":"0","url":"http:\\/\\/localhost:9222"}],"106":"a9fb00b6-43c6-4160-a433-b5a2bfd8dac7"}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(225, 'Books API v1', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:03:27', '0000-00-00 00:00:00', '2013-12-27 05:40:20', '2013-11-19 01:21:26', '0000-00-00 00:00:00', 2, 1, 0, '', '', '', 'books-api-v1', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '04188ddd3d2e2aa4c86556c24aade08c', '[]', ', , Discover a world of literature with our extensive catalog of reading material., Books API v1', '{"23":[{"id":"29","filename":"1384779600_48fddb734c73e61f386c58f419035f65.json","realname":"book.json","ext":"json","size":"5020","title":null,"description":null,"width":null,"height":null,"fullpath":"2013-11\\/1384779600_48fddb734c73e61f386c58f419035f65.json","params":null}],"127":null,"103":null,"5":"","75":["REST"],"22":"\\/Books","26":["223"],"24":[{"id":"30","filename":"1384779600_557292919508c832bb39715f0e2ce083.docx","realname":"Books API v1 FAQ.docx","ext":"docx","size":"37552","title":null,"description":null,"width":null,"height":null,"fullpath":"2013-11\\/1384779600_557292919508c832bb39715f0e2ce083.docx","params":null},{"id":"31","filename":"1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf","realname":"Books Getting Started.pdf","ext":"pdf","size":"48978","title":null,"description":null,"width":null,"height":null,"fullpath":"2013-11\\/1384779600_e1bb00e63614058f6c6fd04103c5fb79.pdf","params":null}],"44":"<p>Discover a world of literature with our extensive catalog of reading material.<\\/p>","21":[0],"40":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(226, 'GetBookByAuthor', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:21:28', '0000-00-00 00:00:00', '2013-11-19 01:21:28', '2013-11-19 01:21:28', '0000-00-00 00:00:00', 6, 0, 0, '', '', '', 'getbookbyauthor', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'b59f1e68e42c44a900ef5dbe13627c95', '[]', 'Operations about books : Find book by Author, /Books/BookOperations/Author/{Author}, GET, GetBookByAuthor', '{"27":"Operations about books : Find book by Author","28":"\\/Books\\/BookOperations\\/Author\\/{Author}","29":["GET"],"128":"","30":"225","108":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(227, 'addBook', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:21:28', '0000-00-00 00:00:00', '2013-11-19 01:21:28', '2013-11-19 01:21:28', '0000-00-00 00:00:00', 6, 0, 0, '', '', '', 'addbook', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '8d089b1c3c89734900ea526091cc0c4b', '[]', 'Operations about books : Add a new book to the store, /Books/BookOperations, POST, addBook', '{"27":"Operations about books : Add a new book to the store","28":"\\/Books\\/BookOperations","29":["POST"],"128":"","30":"225","108":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(228, 'GetBookByTitle', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:21:28', '0000-00-00 00:00:00', '2013-11-19 01:21:28', '2013-11-19 01:21:28', '0000-00-00 00:00:00', 6, 0, 0, '', '', '', 'getbookbytitle', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '78b2d744ee7476df896ff9d633a6b10c', '[]', 'Operations about books : Find book by Title, /Books/BookOperations/Title/{Title}, GET, GetBookByTitle', '{"27":"Operations about books : Find book by Title","28":"\\/Books\\/BookOperations\\/Title\\/{Title}","29":["GET"],"128":"","30":"225","108":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(229, 'GetBookByISBN', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:21:28', '0000-00-00 00:00:00', '2013-11-19 01:21:28', '2013-11-19 01:21:28', '0000-00-00 00:00:00', 6, 0, 0, '', '', '', 'getbookbyisbn', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '4d8e1708d5c89f25b50bf0956eef2714', '[]', 'Operations about books : Find book by ISBN, /Books/BookOperations/ISBN/{ISBN}, GET, GetBookByISBN', '{"27":"Operations about books : Find book by ISBN","28":"\\/Books\\/BookOperations\\/ISBN\\/{ISBN}","29":["GET"],"128":"","30":"225","108":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(230, 'GetBookByPublisher', 1, 6, '', 129, 2, 0, '0000-00-00 00:00:00', '2013-11-19 01:21:28', '0000-00-00 00:00:00', '2013-11-19 01:21:28', '2013-11-19 01:21:28', '0000-00-00 00:00:00', 6, 0, 0, '', '', '', 'getbookbypublisher', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'dd2432ebc144c102e6679cdc94bafb22', '[]', 'Operations about books : Find book by Publisher, /Books/BookOperations/Publisher/{Publisher}, GET, GetBookByPublisher', '{"27":"Operations about books : Find book by Publisher","28":"\\/Books\\/BookOperations\\/Publisher\\/{Publisher}","29":["GET"],"128":"","30":"225","108":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(231, 'Book Catalog', 1, 1, '', 129, 1, 0, '0000-00-00 00:00:00', '2013-11-19 01:22:07', '0000-00-00 00:00:00', '2014-02-21 06:50:54', '2013-11-19 01:38:41', '2014-03-13 03:40:01', 1, 2, 0, '', '', '', 'book-catalog', 1, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'f5a91744af7b31063d60fc5dcd62f1a4', '{"5":"Reference Data"}', 'Hardback, Paperback and E-lit\r\nAccess the world''s largest catalog of literature curated by the world''s leading librarians., Book Catalog', '{"111":"c2038058-b6f7-9b65-ecd6-a6935002eb24","117":"<p>Catalog information is updated daily. \\u00a0Now includes Manga titles from\\u00a0Kobunsha\\u00a0(\\u5149\\u6587\\u793e).<\\/p>","118":[{"id":"32","filename":"1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf","realname":"Frequently Asked Questions.pdf","ext":"pdf","size":"31526","title":null,"description":null,"width":null,"height":null,"fullpath":"2013-11\\/1384779600_1893a1ab8116f3da6cef4cdf32f682ea.pdf","params":null},{"id":"33","filename":"1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx","realname":"Book Catalog Getting Started.docx","ext":"docx","size":"31225","title":null,"description":null,"width":null,"height":null,"fullpath":"2013-11\\/1384779600_d0e55ca42da0b99dcb10c0eb6ec5e50c.docx","params":null}],"129":"<p>All trademarks are the property of their respective owners.<\\/p>","2":"<h1>Hardback, Paperback and E-lit<\\/h1>\\r\\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.<\\/p>","3":{"image":"\\/images\\/icons\\/ic_ProductReview_OpenAPI.png"},"7":["225"],"42":"68","32":"219"}', 0, '', NULL, 0, 2, 0, 'com_cobalt', 0, '[]', NULL),
(232, 'Community', 1, 1, '', 129, 1, 0, '0000-00-00 00:00:00', '2013-11-19 01:39:54', '0000-00-00 00:00:00', '2013-11-19 01:54:01', '2013-11-19 01:44:17', '0000-00-00 00:00:00', 7, 0, 0, '', '', '', 'community', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'b52cca74dea8cf0bc5c645ea2cb17d2d', '[]', 'A free plan to explore the API, Community', '{"37":"<p><br \\/><br \\/>A free plan to explore the API<\\/p>","39":["1"],"53":"231","55":"<p>A free plan to explore the API. Support through the tibbr community.<\\/p>","79":"2","80":"100","110":"baf77ba5-16e2-b6ea-4040-deded3bb26aa","120":"FREE","123":["1"],"38":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(233, 'Silver', 1, 1, '', 129, 1, 0, '0000-00-00 00:00:00', '2013-11-19 01:46:05', '0000-00-00 00:00:00', '2013-11-19 01:57:12', '2013-11-19 01:47:20', '0000-00-00 00:00:00', 7, 0, 0, '', '', '', 'silver', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '213323d777afc225f4f29b2e50f72e2f', '[]', 'per month Moderate usage for application development, Silver', '{"37":"<p>per month <br \\/><br \\/>Moderate usage for application development<\\/p>","39":["2"],"53":"231","55":"<p>Moderate usage for application development. Includes support during business hours via <a href=\\"index.php\\/support\\" target=\\"_blank\\">support request<\\/a>.\\u00a0<\\/p>","79":"10","80":"1000","110":"345c8646-fa48-3980-2324-ee8e5d293585","120":"$20","123":null,"38":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(234, 'Gold', 1, 1, '', 129, 1, 0, '0000-00-00 00:00:00', '2013-11-19 01:48:53', '0000-00-00 00:00:00', '2013-11-19 01:52:24', '2013-11-19 01:52:24', '0000-00-00 00:00:00', 7, 0, 0, '', '', '', 'gold', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '97da2241982ec0040f0d91df5c546287', '[]', 'per month Best value for active applications, Gold', '{"37":"<p>per month <br \\/><br \\/>Best value for active applications<\\/p>","39":["3"],"53":"231","55":"<p>Best value for active applications<\\/p>","79":"50","80":"10000","110":"d3b86220-eda7-527b-2aa0-5f309e2d2dce","120":"$99","123":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(235, 'reviews', 1, 1, '', 129, 7, 0, '0000-00-00 00:00:00', '2013-11-19 02:27:49', '0000-00-00 00:00:00', '2013-11-19 02:35:02', '2013-11-19 02:35:02', '0000-00-00 00:00:00', 12, 0, 0, '', '', '', 'reviews', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'ac506a566767427fcb2da1c5db549a3d', '[]', 'reviews', '{"124":"<p>Full control over the user''s product reviews.<\\/p>","126":[0]}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(236, 'reviewsreadonly', 1, 1, '', 129, 7, 0, '0000-00-00 00:00:00', '2013-11-19 02:35:16', '0000-00-00 00:00:00', '2013-11-19 02:39:04', '2013-11-19 02:39:04', '0000-00-00 00:00:00', 12, 0, 0, '', '', '', 'reviewsreadonly', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '021d80a154f8a3d84b908b7046a54a43', '[]', 'reviewsreadonly', '{"124":"<p>View-only access to the user''s product reviews.\\u00a0<\\/p>","126":[0]}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(237, 'I, Librarian', 1, 18, '', 129, 5, 0, '0000-00-00 00:00:00', '2013-11-19 02:57:52', '0000-00-00 00:00:00', '2014-02-21 07:19:06', '2013-11-19 02:57:52', '0000-00-00 00:00:00', 9, 1, 0, '', '', '', 'i-librarian', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, '5be8c578518bd86519f638e18248653c', '[]', 'A social application for managing your personal library and book reviews., I, Librarian', '{"57":"<p>A social application for managing your personal library and book reviews.<\\/p>","58":"219","60":"68","63":["231"],"64":-1,"65":[],"87":null,"104":"737dcec9-9737-d1ae-4f55-14dbec317de0","115":["238"],"119":{"image":"\\/uploads\\/image\\/apps\\/1384829872_iLib.jpg"},"125":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL),
(238, 'Host Organization - Book Catalog - Community', 1, 10, '', 129, 6, 0, '0000-00-00 00:00:00', '2013-11-19 03:10:30', '0000-00-00 00:00:00', '2013-12-27 06:00:05', '2013-11-19 03:10:30', '0000-00-00 00:00:00', 10, 1, 0, '', '', '', 'host-organization-book-catalog-community', 0, 0, 0, NULL, 'en-GB', 0, '::1', 0, 0, 0, 0, 0, 'd6b45aee776d6e23747c404216f58ea5', '[]', ', 2013-11-19 03:10:30, Host Organization - Book Catalog - Community', '{"66":"","114":"231","69":"232","71":["2013-11-19 03:10:30"],"72":["2018-11-19 03:10:30"],"73":"68","78":["Active"],"112":"b32b7a2e-5f64-667a-4b91-e1632f351151","67":null}', 0, '', NULL, 0, 1, 0, 'com_cobalt', 0, '[]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_record_category`
--

DROP TABLE IF EXISTS `openapi_js_res_record_category`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_record_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(10) unsigned NOT NULL DEFAULT '0',
  `otime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `section_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `access` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat` (`catid`),
  KEY `rec` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `openapi_js_res_record_category`
--

INSERT INTO `openapi_js_res_record_category` (`id`, `catid`, `record_id`, `ordering`, `otime`, `section_id`, `published`, `access`) VALUES
(20, 5, 231, 0, '0000-00-00 00:00:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_record_repost`
--

DROP TABLE IF EXISTS `openapi_js_res_record_repost`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_record_repost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `ctime` datetime NOT NULL,
  `is_reposted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is how it was connected. Was it reposted or was it posted somewhere.',
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record` (`record_id`),
  KEY `idx_host` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_record_values`
--

DROP TABLE IF EXISTS `openapi_js_res_record_values`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_record_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_key` varchar(45) NOT NULL,
  `field_type` varchar(100) NOT NULL,
  `field_label` varchar(100) NOT NULL,
  `field_value` longtext NOT NULL,
  `record_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `ip` varchar(100) NOT NULL,
  `ctime` datetime NOT NULL,
  `value_index` varchar(40) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_values` (`field_value`(333)),
  KEY `idx_section` (`section_id`),
  KEY `idx_key` (`field_key`),
  KEY `idx_record` (`record_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2325 ;

--
-- Dumping data for table `openapi_js_res_record_values`
--

INSERT INTO `openapi_js_res_record_values` (`id`, `field_id`, `field_key`, `field_type`, `field_label`, `field_value`, `record_id`, `user_id`, `type_id`, `section_id`, `category_id`, `params`, `ip`, `ctime`, `value_index`) VALUES
(2298, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'Some City', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', 'city'),
(2297, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', '99999', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', 'zip'),
(2296, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'US', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', 'country'),
(2295, 48, 'k45bd148ad6c09c87ba4292c21536d31a', 'child', 'Contact', '219', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', '0'),
(2294, 19, 'k26bba2439bf7543547fc6826aaae5cba', 'email', 'Email', 'admin@local.host', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', '0'),
(2293, 109, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', '7365b8b3-4e47-e706-54cf-4e877bc524b5', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', '0'),
(2033, 77, 'kd31c05da4f7587fa633d906e2017e111', 'puser', 'System user', '129', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2034, 88, 'k7d74d88b0433a535f1cdd9d3f636bfb9', 'select', 'User type', 'Manager', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2035, 101, 'k4002e0762b81fd86cd8aab42cf5bf6e7', 'text', 'Username', 'admin', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2036, 102, 'k26bba2439bf7543547fc6826aaae5cba', 'email', 'Email', 'admin@local.host', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2037, 121, 'k3a757e1ffc3a04c820ae554298c20a69', 'telephone', 'Contact phone number', '1.650.8461000.', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2038, 45, 'k36d589c47b621ae9fded618029705814', 'text', 'First name', 'Host', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2039, 46, 'kbc18d5316ffbc2de9df0ebdb4882ad6d', 'text', 'Last name', 'SuperAdmin', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2040, 47, 'kb0fb4831c8651676fe230ad8088fef0c', 'child', 'Member of organizations', '68', 219, 129, 8, 4, 0, '', '::1', '2013-11-18 22:52:19', '0'),
(2077, 77, 'kd31c05da4f7587fa633d906e2017e111', 'puser', 'System user', '155', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2268, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'US', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', 'country'),
(2267, 48, 'k45bd148ad6c09c87ba4292c21536d31a', 'child', 'Contact', '221', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2266, 130, 'k61f5a28a49382c4f6de40ae780f1e80f', 'digits', 'Usage alert threshold', '80%', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2265, 19, 'k26bba2439bf7543547fc6826aaae5cba', 'email', 'Email', 'admin@local.host', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2264, 109, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', '317eabf2-33cb-9a33-88e0-c3dd921d9a98', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2263, 122, 'kdd59e7cf2c2eff0db1a2fcb158feb874', 'select', 'Organization type', 'partner', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2059, 77, 'kd31c05da4f7587fa633d906e2017e111', 'puser', 'System user', '154', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2060, 88, 'k7d74d88b0433a535f1cdd9d3f636bfb9', 'select', 'User type', 'Manager', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2061, 101, 'k4002e0762b81fd86cd8aab42cf5bf6e7', 'text', 'Username', 'jwiley', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2062, 102, 'k26bba2439bf7543547fc6826aaae5cba', 'email', 'Email', 'jwiley@local.host', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2063, 121, 'k3a757e1ffc3a04c820ae554298c20a69', 'telephone', 'Contact phone number', '1.555.5555556.', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2064, 45, 'k36d589c47b621ae9fded618029705814', 'text', 'First name', 'Jon', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2065, 46, 'kbc18d5316ffbc2de9df0ebdb4882ad6d', 'text', 'Last name', 'Wiley', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2066, 47, 'kb0fb4831c8651676fe230ad8088fef0c', 'child', 'Member of organizations', '220', 221, 129, 8, 4, 0, '', '::1', '2013-11-19 00:47:15', '0'),
(2262, 17, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>We provide a range of mobile application development services.</p>', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', '0'),
(2078, 88, 'k7d74d88b0433a535f1cdd9d3f636bfb9', 'select', 'User type', 'Member', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2079, 101, 'k4002e0762b81fd86cd8aab42cf5bf6e7', 'text', 'Username', 'charper', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2080, 102, 'k26bba2439bf7543547fc6826aaae5cba', 'email', 'Email', 'charper@local.host', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2081, 121, 'k3a757e1ffc3a04c820ae554298c20a69', 'telephone', 'Contact phone number', '1.555.5555557.', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2082, 45, 'k36d589c47b621ae9fded618029705814', 'text', 'First name', 'Collin', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2083, 46, 'kbc18d5316ffbc2de9df0ebdb4882ad6d', 'text', 'Last name', 'Harper', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2084, 47, 'kb0fb4831c8651676fe230ad8088fef0c', 'child', 'Member of organizations', '220', 222, 129, 8, 4, 0, '', '::1', '2013-11-19 00:49:08', '0'),
(2290, 14, 'k67c489a3d354c7d0c600d8e3ec9db3a5', 'url', 'Basepath', 'http://localhost:9222', 223, 129, 4, 3, 0, '', '127.0.0.1', '2013-12-27 05:48:01', '0'),
(2289, 13, 'k3486ea3b5a6b9c318ed5642c3102dd60', 'select', 'Type', 'Production', 223, 129, 4, 3, 0, '', '127.0.0.1', '2013-12-27 05:48:01', '0'),
(2288, 12, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>Public endpoint (load balanced across gateway instances).</p>', 223, 129, 4, 3, 0, '', '127.0.0.1', '2013-12-27 05:48:01', '0'),
(2291, 16, 'k751d4b1e68e939ed92f52f4c9b5e2bbe', 'child', 'Environment', '223', 224, 129, 3, 3, 0, '', '127.0.0.1', '2013-12-27 05:48:01', '0'),
(2089, 89, 'ka207e929bd80fedcd3e4f4740d8cabcf', 'url', 'Management URL', 'http://localhost:9222', 224, 129, 3, 3, 0, '', '::1', '2013-11-19 01:02:37', '0'),
(2090, 106, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', 'a9fb00b6-43c6-4160-a433-b5a2bfd8dac7', 224, 129, 3, 3, 0, '', '::1', '2013-11-19 01:02:37', '0'),
(2277, 24, 'k5b6884f36a562cfdcb94347039c789be', 'uploads', 'Attached documentation files', 'Books Getting Started.pdf', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '1'),
(2276, 24, 'k5b6884f36a562cfdcb94347039c789be', 'uploads', 'Attached documentation files', 'Books API v1 FAQ.docx', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2275, 25, 'k83452817e6ff70a8b2f02c58b605e9da', 'child', 'APIs', '225', 223, 129, 4, 3, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2274, 22, 'k79e9689cbe5caadafb98dd49e1281125', 'text', 'REST resource path', '/Books', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2272, 23, 'kc066489ec282615817ce1d42ce6c42f8', 'uploads', 'Upload REST API spec', 'book.json', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2273, 75, 'k9f51bdf4949131d73f9f0ddd3879efe4', 'select', 'API type', 'REST', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2102, 27, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', 'Operations about books : Find book by Author', 226, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2103, 28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'text', 'URI path', '/Books/BookOperations/Author/{Author}', 226, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2104, 29, 'kadc32b63e05baafc80e21f82c9c2818d', 'select', 'REST method', 'GET', 226, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2105, 30, 'keae98b085de51e6fc65fab708c329e5b', 'child', 'API', '225', 226, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2106, 27, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', 'Operations about books : Add a new book to the store', 227, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2107, 27, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', 'Operations about books : Find book by Title', 228, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2108, 27, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', 'Operations about books : Find book by ISBN', 229, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2109, 27, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', 'Operations about books : Find book by Publisher', 230, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2110, 28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'text', 'URI path', '/Books/BookOperations', 227, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2111, 29, 'kadc32b63e05baafc80e21f82c9c2818d', 'select', 'REST method', 'POST', 227, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2112, 30, 'keae98b085de51e6fc65fab708c329e5b', 'child', 'API', '225', 227, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2113, 28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'text', 'URI path', '/Books/BookOperations/Title/{Title}', 228, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2114, 29, 'kadc32b63e05baafc80e21f82c9c2818d', 'select', 'REST method', 'GET', 228, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2115, 30, 'keae98b085de51e6fc65fab708c329e5b', 'child', 'API', '225', 228, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2116, 28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'text', 'URI path', '/Books/BookOperations/ISBN/{ISBN}', 229, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2117, 29, 'kadc32b63e05baafc80e21f82c9c2818d', 'select', 'REST method', 'GET', 229, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2118, 30, 'keae98b085de51e6fc65fab708c329e5b', 'child', 'API', '225', 229, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2119, 28, 'kb732b87d43017f4d6f28ddb5edaa5ff1', 'text', 'URI path', '/Books/BookOperations/Publisher/{Publisher}', 230, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2120, 29, 'kadc32b63e05baafc80e21f82c9c2818d', 'select', 'REST method', 'GET', 230, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2121, 30, 'keae98b085de51e6fc65fab708c329e5b', 'child', 'API', '225', 230, 129, 6, 2, 0, '', '::1', '2013-11-19 01:21:28', '0'),
(2313, 42, 'k45b259b885cce1018d0a8a896918ba7d', 'child', 'Owner organization', '68', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2312, 2, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<h1>Hardback, Paperback and E-lit</h1>\r\n<p>Access the world''s largest catalog of literature curated by the world''s leading librarians.</p>', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2311, 129, 'k3a8db3100cd71b87cd272cee4e04c7a7', 'html', 'Product-specific terms & conditions', '<p>All trademarks are the property of their respective owners.</p>', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2315, 6, 'kda98e018e7f7ddec573883d31e9fe64f', 'child', 'Contained in products', '231', 225, 129, 2, 2, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2309, 118, 'k5b6884f36a562cfdcb94347039c789be', 'uploads', 'Attached documentation files', 'Frequently Asked Questions.pdf', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2310, 118, 'k5b6884f36a562cfdcb94347039c789be', 'uploads', 'Attached documentation files', 'Book Catalog Getting Started.docx', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '1'),
(2139, 34, 'ke8901a14558eec3fd65f49d1c1edf422', 'child', 'Public in products', '231', 223, 129, 4, 0, 0, NULL, '::1', '2013-11-19 01:39:42', '0'),
(2198, 123, 'k5372a54eeda1efbb4f08d344601b1246', 'checkbox', 'Auto subscribed', '1', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2197, 120, 'k4411d5a430e0b062168d5976164aa24d', 'text', 'Price or keyword', 'FREE', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2196, 110, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', 'baf77ba5-16e2-b6ea-4040-deded3bb26aa', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2194, 79, 'k73092a26a24d4492e2396faef4f31f03', 'digits', 'Rate limit', '2', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2195, 80, 'k7986199e12d093adadc3d21877db047f', 'digits', 'Quota limit', '100', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2193, 55, 'k61ac83a900c8272c2191da5d4d3653ba', 'html', 'Plan details', '<p>A free plan to explore the API. Support through the tibbr community.</p>', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2192, 53, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'child', 'Product', '231', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2203, 79, 'k73092a26a24d4492e2396faef4f31f03', 'digits', 'Rate limit', '10', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2204, 80, 'k7986199e12d093adadc3d21877db047f', 'digits', 'Quota limit', '1000', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2205, 110, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', '345c8646-fa48-3980-2324-ee8e5d293585', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2201, 53, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'child', 'Product', '231', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2199, 37, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>per month <br /><br />Moderate usage for application development</p>', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2202, 55, 'k61ac83a900c8272c2191da5d4d3653ba', 'html', 'Plan details', '<p>Moderate usage for application development. Includes support during business hours via <a href="index.php/support" target="_blank">support request</a>.??</p>', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2200, 39, 'k00e7fae1cbc44c3e7f5e043172edf994', 'plevel', 'Level', '2', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2173, 37, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>per month <br /><br />Best value for active applications</p>', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2174, 39, 'k00e7fae1cbc44c3e7f5e043172edf994', 'plevel', 'Level', '3', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2175, 53, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'child', 'Product', '231', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2176, 55, 'k61ac83a900c8272c2191da5d4d3653ba', 'html', 'Plan details', '<p>Best value for active applications</p>', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2177, 79, 'k73092a26a24d4492e2396faef4f31f03', 'digits', 'Rate limit', '50', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2178, 80, 'k7986199e12d093adadc3d21877db047f', 'digits', 'Quota limit', '10000', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2179, 110, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', 'd3b86220-eda7-527b-2aa0-5f309e2d2dce', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2180, 120, 'k4411d5a430e0b062168d5976164aa24d', 'text', 'Price or keyword', '$99', 234, 129, 7, 1, 0, '', '::1', '2013-11-19 01:52:24', '0'),
(2191, 39, 'k00e7fae1cbc44c3e7f5e043172edf994', 'plevel', 'Level', '1', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2190, 37, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p><br /><br />A free plan to explore the API</p>', 232, 129, 7, 1, 0, '', '::1', '2013-11-19 01:54:01', '0'),
(2206, 120, 'k4411d5a430e0b062168d5976164aa24d', 'text', 'Price or keyword', '$20', 233, 129, 7, 1, 0, '', '::1', '2013-11-19 01:57:12', '0'),
(2216, 124, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>Full control over the user''s product reviews.</p>', 235, 129, 12, 7, 0, '', '::1', '2013-11-19 02:35:02', '0'),
(2217, 124, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>View-only access to the user''s product reviews.??</p>', 236, 129, 12, 7, 0, '', '::1', '2013-11-19 02:39:04', '0'),
(2324, 119, 'kf157212bd6c9b7ed1895dc1e39fb4620', 'image', 'Icon', 'uploads/image/apps/1384829872_iLib.jpg', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2322, 104, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', '737dcec9-9737-d1ae-4f55-14dbec317de0', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2320, 62, 'kfef9bf29bd08904836ef384ddd00c847', 'child', 'Used by applications', '237', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2321, 64, 'kddd53c164c004afcc1758b7fbc28fd8d', 'boolean', 'Use OAuth?', '-1', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2319, 60, 'k45b259b885cce1018d0a8a896918ba7d', 'child', 'Owner organization', '68', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2305, 78, 'k0e3524381c85abf33d5456047c19a511', 'radio', 'Status', 'Active', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2304, 73, 'kc0ce29d041859fe0496c7cde216afc5b', 'child', 'Subscribing organization', '68', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2303, 72, 'k24b0869913bdfffab7ad7fea6c1a3892', 'datetime', 'End date', '2018-11-19 03:10:30', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2302, 71, 'k8d871e19c36e6fd92854f72ce9a21bd2', 'datetime', 'Start date', '2013-11-19 03:10:30', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2301, 69, 'kc8a81303998c7bd680fc36dfcb66cee5', 'child', 'Plan', '232', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2300, 114, 'k46d5cd2baef63cdc7a3f9460fb8bf199', 'child', 'Product', '231', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2318, 58, 'k45bd148ad6c09c87ba4292c21536d31a', 'child', 'Contact', '219', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2323, 116, 'k0ba24eae1ffe1c279c8f86282f911e0f', 'child', 'Owner application', '237', 238, 129, 10, 6, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2317, 57, 'k81ee9e352c67f1d011f5345d45138aba', 'html', 'Description', '<p>A social application for managing your personal library and book reviews.</p>', 237, 129, 9, 5, 0, '', '127.0.0.1', '2014-02-21 07:19:06', '0'),
(2292, 122, 'kdd59e7cf2c2eff0db1a2fcb158feb874', 'select', 'Organization type', 'host', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', '0'),
(2269, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', '94304', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', 'zip'),
(2270, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'Palo Alto', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', 'city'),
(2271, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'CA', 220, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-24 08:21:30', 'state'),
(2278, 44, 'k87b1a71d0474134becbd85fb18c2ebd5', 'html', 'Inline documentation text', '<p>Discover a world of literature with our extensive catalog of reading material.</p>', 225, 129, 2, 2, 0, '', '127.0.0.1', '2013-12-27 05:40:20', '0'),
(2308, 117, 'k784bc6cd07a39a92239b509bb10715da', 'html', 'Inline documentation', '<p>Catalog information is updated daily. ??Now includes Manga titles from??Kobunsha??(??????', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2307, 111, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', 'c2038058-b6f7-9b65-ecd6-a6935002eb24', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2299, 20, 'k29dc11646e85e847ced2682a755b576d', 'geo', 'Contact details', 'CA', 68, 129, 5, 4, 0, '', '127.0.0.1', '2013-12-27 05:54:07', 'state'),
(2306, 112, 'k29b6ade2fbde76b5263293dba82fef52', 'uuid', 'uuid', 'b32b7a2e-5f64-667a-4b91-e1632f351151', 238, 129, 10, 6, 0, '', '127.0.0.1', '2013-12-27 06:00:05', '0'),
(2314, 3, 'k6fdbd54f60db4ef232bbd8094e3f4369', 'image', 'Thumbnail', 'images/icons/ic_ProductReview_OpenAPI.png', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0'),
(2316, 32, 'k45bd148ad6c09c87ba4292c21536d31a', 'child', 'Contact', '219', 231, 129, 1, 1, 0, '', '127.0.0.1', '2014-02-21 06:50:54', '0');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_sales`
--

DROP TABLE IF EXISTS `openapi_js_res_sales`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_sales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `saler_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `params` text,
  `status` tinyint(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `gateway_id` varchar(45) NOT NULL,
  `gateway` varchar(45) NOT NULL,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `currency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_saler` (`saler_id`),
  KEY `idx_buyer` (`user_id`),
  KEY `idx_rec` (`record_id`),
  KEY `idx_sec` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_sections`
--

DROP TABLE IF EXISTS `openapi_js_res_sections`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_sections` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `ordering` int(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `image_position` varchar(20) NOT NULL,
  `params` text NOT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(11) NOT NULL,
  `categories` int(11) DEFAULT NULL,
  `language` char(7) NOT NULL DEFAULT '*',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `openapi_js_res_sections`
--

INSERT INTO `openapi_js_res_sections` (`id`, `asset_id`, `name`, `title`, `alias`, `description`, `published`, `ordering`, `image`, `image_position`, `params`, `checked_out`, `checked_out_time`, `access`, `categories`, `language`) VALUES
(1, 45, 'Products', 'Products', 'products', '<h3>Browse our API Catalog</h3>\r\n<p><a href="index.php/component/users/?view=registration" title="Contact us">Register</a> for an account, request a plan, create an API key and build your app.</p>\r\n<p>{loadposition products_featured_list}</p>', 1, 7, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"108","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"6","show_past_records":"6","show_restrict":"6","show_children":"0","have_unpublished":"1","section_home_items":"2","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["1","7"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.df636a8c8e344746779221d10afbe9bf","tmpl_list":["products_list.df636a8c8e344746779221d10afbe9bf"],"tmpl_category":"0","tmpl_compare":"default.df636a8c8e344746779221d10afbe9bf","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"0","post_anywhere":"0","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"0","pcat_submit":"6","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"0","pcat_meta":"6","allow_section_set":"0","allow_change_header":"0","allow_change_descr":"0","user_sec_descr_length":"200","allow_access_control":"0","allow_access_control_add":"0"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 129, '2014-02-11 03:47:43', 1, 2, '*'),
(2, 53, 'APIs', 'APIs', 'apis', '', 1, 6, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"111","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"6","show_past_records":"6","show_restrict":"1","show_children":"0","have_unpublished":"1","section_home_items":"1","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["2","6"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.108839934aafb8b68fdbb97a4006187d","tmpl_list":["api_list.6d402489271965824722af7d0afe5287"],"tmpl_category":"0","tmpl_compare":"asg_open_api_list.108839934aafb8b68fdbb97a4006187d","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"1","post_anywhere":"1","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"1","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"1","allow_change_header":"1","allow_change_descr":"1","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"1"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 1, NULL, '*'),
(3, 66, 'Environments', 'Environments', 'environments', '', 1, 5, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"110","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"10","show_past_records":"10","show_restrict":"10","show_children":"0","have_unpublished":"1","section_home_items":"2","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["3","4"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.13fba8e138ededffcb8e8963f5a96e1b","tmpl_list":["environments.a22ad88a6c972d2b567799b1043d2c2d"],"tmpl_category":"0","tmpl_compare":"default.13fba8e138ededffcb8e8963f5a96e1b","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"1","post_anywhere":"1","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"1","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"1","allow_change_header":"1","allow_change_descr":"1","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"1"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 1, NULL, '*'),
(4, 94, 'Organizations', 'Organizations', 'organizations', '', 1, 4, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"112","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"0","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"10","show_past_records":"10","show_restrict":"6","show_children":"0","have_unpublished":"1","section_home_items":"1","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["5","8"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.84c2ca89cc095a1fc95d8ea091e90875","tmpl_list":["organizations_list.795a10d4a1f7a41447a943e5065b379e"],"tmpl_category":"0","tmpl_compare":"asg_open_api_list.84c2ca89cc095a1fc95d8ea091e90875","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"1","post_anywhere":"1","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"1","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"1","allow_change_header":"1","allow_change_descr":"1","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"1"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"0","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 2, NULL, '*'),
(5, 114, 'Applications', 'Applications', 'applications', '', 1, 3, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"113","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"8","show_past_records":"8","show_restrict":"1","show_children":"0","have_unpublished":"1","section_home_items":"1","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["11","9"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.d9593fb285359ab3434e5b92f6c00161","tmpl_list":["applications_list.18683df3f5f00fc080ede373a1a24cf3"],"tmpl_category":"0","tmpl_compare":"asg_open_api_list.d9593fb285359ab3434e5b92f6c00161","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"1","post_anywhere":"1","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"1","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"1","allow_change_header":"1","allow_change_descr":"1","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"1"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 8, NULL, '*'),
(6, 125, 'Subscriptions', 'Subscriptions', 'subscriptions', '', 1, 2, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"114","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"8","show_past_records":"8","show_restrict":"8","show_children":"0","have_unpublished":"1","section_home_items":"1","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["10"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.42fe87c053df24ef1e8d598cdacb7fba","tmpl_list":["subscriptions.aa063c3e0b5fb7bd0e29b7336b20fd0b"],"tmpl_category":"0","tmpl_compare":"asg_open_api_list.42fe87c053df24ef1e8d598cdacb7fba","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"1","post_anywhere":"1","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"1","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"1","allow_change_header":"1","allow_change_descr":"1","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"1"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 8, NULL, '*'),
(7, 191, 'Scopes', 'Scopes', 'scopes', '', 1, 1, '', '', '{"general":{"status":"1","status_msg":"This section is currently offline. Please, check back later.","category_itemid":"126","orderby":"r.ctime DESC","lang_mode":"0","records_mode":"0","filter_mode":"1","cat_mode":"1","featured_first":"0","marknew":"0","show_future_records":"3","show_past_records":"3","show_restrict":"0","show_children":"0","have_unpublished":"1","section_home_items":"2","section_home_orderby":"r.ctime DESC","home_featured_first":"0","type":["12"],"record_submit_limit":"0","tmpl_markup":"asg_open_api.1fa504d92e16137b78a9008e57ccfb70","tmpl_list":["scope.ee90e68e0e8494ae72007c9cbff010fa"],"tmpl_category":"0","tmpl_compare":"api_list.1fa504d92e16137b78a9008e57ccfb70","tmpl_list_default":"default"},"more":{"search_mode":"3","search_title":"1","search_name":"0","search_email":"0","search_comments":"0","feed_link":"0","feed_link2":"0","records_mode":"0","feed_limit":"50","orderby_rss":"r.ctime DESC","feed_link_type":"1","metadesc":"","metakey":"","author":"","robots":""},"personalize":{"personalize":"0","records_mode":"0","author_mode":"username","breadcrumbs":"0","post_anywhere":"0","home_text":"See all artilces","text_icon":"home.png","onlinestatus":"0","pcat_submit":"0","pcat_limit":"10","pcat_descr_length":"200","pcat_icon":"1","pcat_meta":"2","allow_section_set":"0","allow_change_header":"0","allow_change_descr":"0","user_sec_descr_length":"200","allow_access_control":"1","allow_access_control_add":"0"},"events":{"subscribe_section":"0","subscribe_category":"0","subscribe_record":"0","subscribe_user":"0","alerts":"1","user_manage":"1","event_date_format":"","event_date_custom":"d M Y","event":{"record_new":{"notif":"2","activ":"2","karma1":"0"},"record_view":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_edited":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_expired":{"notif":"2","activ":"2","karma2":"0"},"record_featured_expired":{"notif":"2","activ":"2","karma2":"0"},"record_bookmarked":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_tagged":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_featured":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_extended":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_reposted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"record_posted":{"notif":"2","activ":"2","karma1":"0"},"comment_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_rated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_deleted":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_approved":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_reply":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"comment_unpublished":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"status_changed":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_new":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"parent_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"child_attached":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"order_updated":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale":{"notif":"2","activ":"2","karma1":"0","karma2":"0"},"new_sale_manual":{"notif":"2","activ":"2","karma1":"0","karma2":"0"}}}}', 0, '0000-00-00 00:00:00', 1, NULL, '*');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_subscribe`
--

DROP TABLE IF EXISTS `openapi_js_res_subscribe`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_subscribe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` varchar(20) NOT NULL DEFAULT '0' COMMENT 'record, section, category, search',
  `params` text,
  `section_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u` (`user_id`,`ref_id`,`type`,`section_id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_rf` (`ref_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_subscribe_cat`
--

DROP TABLE IF EXISTS `openapi_js_res_subscribe_cat`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_subscribe_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exclude` tinyint(1) DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u` (`cat_id`,`section_id`,`user_id`),
  KEY `idx_sec` (`section_id`),
  KEY `idx_cat` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_subscribe_user`
--

DROP TABLE IF EXISTS `openapi_js_res_subscribe_user`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_subscribe_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `exclude` tinyint(1) DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_u` (`u_id`,`section_id`,`user_id`),
  KEY `idx_sec` (`section_id`),
  KEY `idx_cat` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_tags`
--

DROP TABLE IF EXISTS `openapi_js_res_tags`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `slug` varchar(50) NOT NULL DEFAULT '',
  `language` varchar(10) DEFAULT 'en-GB',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_tags_history`
--

DROP TABLE IF EXISTS `openapi_js_res_tags_history`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_tags_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `record_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `section_id` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `record` (`record_id`),
  KEY `tag` (`tag_id`),
  KEY `user` (`user_id`),
  KEY `section` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_types`
--

DROP TABLE IF EXISTS `openapi_js_res_types`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `form` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `asset_id` int(11) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '*',
  PRIMARY KEY (`id`),
  KEY `published` (`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `openapi_js_res_types`
--

INSERT INTO `openapi_js_res_types` (`id`, `name`, `params`, `checked_out`, `checked_out_time`, `published`, `description`, `form`, `user_id`, `asset_id`, `language`) VALUES
(1, 'Product', '{"properties":{"item_itemid":"108","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"product.50fcca110f82e2835398f1181ab76570","tmpl_articleform":"product_form.50fcca110f82e2835398f1181ab76570","tmpl_rating":"crown.50fcca110f82e2835398f1181ab76570","tmpl_comment":"default.50fcca110f82e2835398f1181ab76570","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"6","access":"1","public_edit":"0","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"0","limits_total":"0","limits_day":"0","allow_category":"6","first_category":"0","multi_category":"1","multi_max_num":"100","robots":""},"category_limit":{"allow":"1","category_limit_mode":"0","show_restricted":"1"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-deb10517653c255364175796ace3553f13756812', 129, 46, '*'),
(2, 'API', '{"properties":{"item_itemid":"111","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"api.7e699a1714dbc3ff212c9b399d08b5b3","tmpl_articleform":"api_form.7e699a1714dbc3ff212c9b399d08b5b3","tmpl_rating":"crown.7e699a1714dbc3ff212c9b399d08b5b3","tmpl_comment":"default.7e699a1714dbc3ff212c9b399d08b5b3","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"6","access":"6","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"6","first_category":"0","multi_category":"1","multi_max_num":"10","robots":""},"category_limit":{"allow":"1","category_limit_mode":"0","show_restricted":"1"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-db974238714ca8de634a7ce1d083a14f13756814', 129, 50, '*'),
(3, 'Gateway', '{"properties":{"item_itemid":"110","item_compare":"0","item_can_favorite":"0","item_can_moderate":"10","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"10","tmpl_article":"gateway.0bdbc42c6547abd308bf1bc6c48c7f7b","tmpl_articleform":"gateway.0bdbc42c6547abd308bf1bc6c48c7f7b","tmpl_rating":"crown.0bdbc42c6547abd308bf1bc6c48c7f7b","tmpl_comment":"default.0bdbc42c6547abd308bf1bc6c48c7f7b","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"10","access":"6","public_edit":"0","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"0","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-926dec9494209cb088b4962509df1a9113758165', 129, 56, '*'),
(4, 'Environment', '{"properties":{"item_itemid":"110","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"environment.c60985ee75dddadb6a6aea8aeb6ff19d","tmpl_articleform":"environment.c60985ee75dddadb6a6aea8aeb6ff19d","tmpl_rating":"crown.c60985ee75dddadb6a6aea8aeb6ff19d","tmpl_comment":"default.c60985ee75dddadb6a6aea8aeb6ff19d","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"10","access":"6","public_edit":"0","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"0","limits_total":"0","limits_day":"0","allow_category":"10","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-0ba29c6a1afacf586b03a26162c7227413758173', 129, 61, '*'),
(5, 'Organization', '{"properties":{"item_itemid":"112","item_compare":"0","item_can_favorite":"0","item_can_moderate":"39","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"100","tmpl_article":"organization.e97280f03d6f0bd666f0dd0f3615c11b","tmpl_articleform":"organization.e97280f03d6f0bd666f0dd0f3615c11b","tmpl_rating":"crown.e97280f03d6f0bd666f0dd0f3615c11b","tmpl_comment":"default.e97280f03d6f0bd666f0dd0f3615c11b","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"39","access":"8","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-d6b258792ff06f82933c74eeb8aef59113758439', 129, 68, '*'),
(6, 'Operation', '{"properties":{"item_itemid":"111","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"100","tmpl_article":"operation.d8973c39d9e5750e094d4ba844e10a90","tmpl_articleform":"operation.d8973c39d9e5750e094d4ba844e10a90","tmpl_rating":"crown.d8973c39d9e5750e094d4ba844e10a90","tmpl_comment":"default.d8973c39d9e5750e094d4ba844e10a90","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"0","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"6","access":"6","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-2a78ed76450c3cb42320882b3e055b3113759960', 129, 79, '*'),
(7, 'Plan', '{"properties":{"item_itemid":"108","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"plan.5f348bbd1422eca0fcc53fee289f1717","tmpl_articleform":"plan.5f348bbd1422eca0fcc53fee289f1717","tmpl_rating":"crown.5f348bbd1422eca0fcc53fee289f1717","tmpl_comment":"default.5f348bbd1422eca0fcc53fee289f1717","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"0","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"6","access":"1","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-0b6cbdf7ad2928078f1600a3e897948513759997', 129, 90, '*'),
(8, 'User Profile', '{"properties":{"item_itemid":"112","item_compare":"0","item_can_favorite":"0","item_can_moderate":"2","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"user_profile.340fee7bd379beedb1436ca273189720","tmpl_articleform":"user_profile_form.340fee7bd379beedb1436ca273189720","tmpl_rating":"crown.340fee7bd379beedb1436ca273189720","tmpl_comment":"default.340fee7bd379beedb1436ca273189720","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"0","item_title":"1","item_title_composite":"[45] [46]","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"2","access":"2","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-90b1f6651953fcf8b43ddc0da6760aaf13760164', 129, 100, '*'),
(11, 'Key', '{"properties":{"item_itemid":"113","item_compare":"0","item_can_favorite":"0","item_can_moderate":"0","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"key.f377e7bbcb0ec3d13cbe0f6d84880b21","tmpl_articleform":"key_form.f377e7bbcb0ec3d13cbe0f6d84880b21","tmpl_rating":"crown.f377e7bbcb0ec3d13cbe0f6d84880b21","tmpl_comment":"default.f377e7bbcb0ec3d13cbe0f6d84880b21","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"10","access":"10","public_edit":"0","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"0","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-897356954c2cd3d41b221e3f24f99bba13763548', 129, 141, '*'),
(9, 'Application', '{"properties":{"item_itemid":"113","item_compare":"0","item_can_favorite":"0","item_can_moderate":"8","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"0","default_extend":"100","tmpl_article":"app_article.c04c0340b0a254c26ab3271fa9f797c9","tmpl_articleform":"applications_form.c04c0340b0a254c26ab3271fa9f797c9","tmpl_rating":"crown.c04c0340b0a254c26ab3271fa9f797c9","tmpl_comment":"default.c04c0340b0a254c26ab3271fa9f797c9","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"8","access":"10","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-e498749f3c42246d50b15c81c101d98813760197', 129, 113, '*'),
(10, 'Subscription', '{"properties":{"item_itemid":"114","item_compare":"0","item_can_favorite":"0","item_can_moderate":"10","item_edit":"1","item_delete":"1","allow_archive":"1","allow_extend":"1","allow_hide":"1","default_extend":"1000","tmpl_article":"subscription.ab6c36e8fc5b226f0b9dac60bbc24fae","tmpl_articleform":"subscription.ab6c36e8fc5b226f0b9dac60bbc24fae","tmpl_rating":"crown.ab6c36e8fc5b226f0b9dac60bbc24fae","tmpl_comment":"default.ab6c36e8fc5b226f0b9dac60bbc24fae","item_can_view_tag":"0","item_can_add_tag":"0","item_can_attach_tag":"0","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"0","item_title":"2","item_title_composite":"[73] - [114] - [69]","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"10","access":"8","public_edit":"0","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"0","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"0","category_limit_mode":"0","show_restricted":"0"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"1","versioning_max":"10","audit_log":"1","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"10","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_submit_subscription_count":"0","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_edit_subscription_count":"0","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_comment_subscription_count":"0","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_count":"0","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-787ad0b7a17de4ad6b1711bbf8d79fcb13760217', 129, 124, '*'),
(12, 'Scopes', '{"properties":{"item_itemid":"126","item_compare":"0","item_can_favorite":"0","item_can_moderate":"6","item_edit":"1","item_delete":"1","allow_archive":"0","allow_extend":"0","allow_hide":"0","default_extend":"10","tmpl_article":"scope.37fd169f289bc22ea09847c64f947a70","tmpl_articleform":"scope.37fd169f289bc22ea09847c64f947a70","tmpl_rating":"crown.37fd169f289bc22ea09847c64f947a70","tmpl_comment":"default.37fd169f289bc22ea09847c64f947a70","item_can_view_tag":"0","item_can_add_tag":"2","item_can_attach_tag":"2","item_tag_htmltags":"h1, h2, h3, h4, h5, h6, strong, em, b, i, big","item_tag_relevance":"0","item_tag_num":"0","item_tags_max":"25","item_title_unique":"1","item_title":"1","item_title_composite":"","item_title_limit":"0","rate_access":"0","rate_mode":"1","rate_smart_before":"60","rate_smart_minimum":"5","rate_multirating":"0","rate_multirating_options":"","rate_multirating_tmpl":"default.php","rate_multirating_sort":"2"},"submission":{"submission":"6","access":"1","public_edit":"1","autopublish":"1","edit_autopublish":"1","redirect":"2","redirect_url":"","default_expire":"0","public_alert":"1","limits_total":"0","limits_day":"0","allow_category":"0","first_category":"0","multi_category":"0","multi_max_num":"3","robots":""},"category_limit":{"allow":"1","category_limit_mode":"0","show_restricted":"1"},"comments":{"comments":""},"audit":{"audit_date_format":"","audit_date_custom":"h:i A, d M Y","versioning":"0","versioning_max":"10","audit_log":"0","itemid":"","al1":"1","al2":"1","al26":"1","al3":"1","al4":"1","al5":"1","al6":"1","al7":"1","al8":"1","al9":"1","al10":"1","al25":"1","al12":"1","al13":"1","al14":"1","al15":"1","al16":"1","al17":"1","al18":"1","al19":"1","al20":"1","al27":"1","al28":"1","al29":"1"},"emerald":{"subscr_skip":"3","subscr_author_skip":"1","subscr_moderator_skip":"1","type_display_subscription":[""],"type_display_subscription_msg":"You cannot see this article because article author subscritpion has expired.","type_display_subscription_count":"0","type_view_subscription":[""],"type_view_subscription_msg":"You cannot see this article because your subscritpion has expired.","type_view_subscription_count":"0","type_submit_subscription":[""],"type_submit_subscription_msg":"To submit you need to be subscribed user and have following subscriptions","type_edit_subscription":[""],"type_edit_subscription_msg":"To edit you need to be subscribed user and have folowing subscriptions","type_comment_subscription":[""],"type_comment_subscription_msg":"To comment you need to be subscribed user and have folowing subscriptions","type_feature_subscription":[""],"type_feature_subscription_msg":"To make record featured you need to be subscribed user and have folowing subscriptions","type_feature_subscription_time":"30","type_extend_subscription":[""],"type_extend_subscription_msg":"To prolong you need to be subscribed user and have folowing subscriptions","type_extend_subscription_count":"0"}}', 0, '0000-00-00 00:00:00', 1, '', 'form-19aa4fe19e2d12413f5c960af405037f13829945', 129, 189, '*');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_user_options`
--

DROP TABLE IF EXISTS `openapi_js_res_user_options`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_user_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `params` text,
  `lastsend` datetime DEFAULT NULL,
  `schedule` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sch` (`schedule`),
  KEY `idx_sent` (`lastsend`),
  KEY `idx_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_user_options_autofollow`
--

DROP TABLE IF EXISTS `openapi_js_res_user_options_autofollow`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_user_options_autofollow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sec` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_user_post_map`
--

DROP TABLE IF EXISTS `openapi_js_res_user_post_map`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_user_post_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `whopost` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_us` (`user_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_js_res_vote`
--

DROP TABLE IF EXISTS `openapi_js_res_vote`;
CREATE TABLE IF NOT EXISTS `openapi_js_res_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(16) NOT NULL DEFAULT '',
  `ref_type` varchar(25) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `idx` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `record` (`ref_id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_languages`
--

DROP TABLE IF EXISTS `openapi_languages`;
CREATE TABLE IF NOT EXISTS `openapi_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `openapi_languages`
--

INSERT INTO `openapi_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_menu`
--

DROP TABLE IF EXISTS `openapi_menu`;
CREATE TABLE IF NOT EXISTS `openapi_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=141 ;

--
-- Dumping data for table `openapi_menu`
--

INSERT INTO `openapi_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 87, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 17, 26, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 18, 19, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 20, 21, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 22, 23, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 24, 25, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 33, 38, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 34, 35, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 36, 37, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 39, 44, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 40, 41, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 42, 43, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 45, 50, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 46, 47, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 48, 49, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 51, 52, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 53, 54, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 55, 60, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 56, 57, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 58, 59, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 61, 62, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 63, 64, 0, '*', 1),
(23, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 65, 66, 0, '', 1),
(107, 'top', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"0","show_intro":"1","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_tags":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"0","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":" get-started-page","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 3, 4, 1, '*', 0),
(108, 'top', 'Products', 'products', '', 'products', 'index.php?option=com_cobalt&view=records&section_id=1', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 5, 6, 0, '*', 0),
(110, 'top', 'Environments', 'environments', '', 'environments', 'index.php?option=com_cobalt&view=records&section_id=3', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 10, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 7, 8, 0, '*', 0),
(111, 'top', 'APIs', 'apis', '', 'apis', 'index.php?option=com_cobalt&view=records&section_id=2', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 9, 10, 0, '*', 0),
(112, 'top', 'Organizations', 'organizations', '', 'organizations', 'index.php?option=com_cobalt&view=records&section_id=4', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 10, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 11, 12, 0, '*', 0),
(113, 'top', 'Applications', 'applications', '', 'applications', 'index.php?option=com_cobalt&view=records&section_id=5', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 8, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 0, '*', 0),
(114, 'top', 'Subscriptions', 'subscriptions', '', 'subscriptions', 'index.php?option=com_cobalt&view=records&section_id=6', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 10, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 16, 0, '*', 0),
(115, 'hidenmenu', 'User Profile', 'userprofile', '', 'userprofile', 'index.php?option=com_cobalt&view=userprofile&id=', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"tmpl":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 69, 70, 0, '*', 0),
(116, 'main', 'com_emails', 'com-emails', '', 'com-emails', 'index.php?option=com_emails', 'component', 0, 1, 1, 10069, 0, '0000-00-00 00:00:00', 0, 1, 'class:emails', 0, '', 67, 68, 0, '', 1),
(122, 'top', 'Support', 'support', '', 'support', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"0","link_titles":"","show_intro":"0","info_block_position":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"0","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 31, 32, 0, '*', 0),
(123, 'hidenmenu', 'User Organization', 'userorganization', '', 'userorganization', 'index.php?Itemid=', 'alias', -2, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 8, '', 0, '{"aliasoptions":"112","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 1, 2, 0, '*', 0),
(124, 'hidenmenu', 'userorganizations', 'userorganizations', '', 'userorganizations', 'index.php?option=com_cobalt&view=records&section_id=4', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 8, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 71, 72, 0, '*', 0),
(126, 'top', 'Scopes', 'scopes', '', 'scopes', 'index.php?option=com_cobalt&view=records&section_id=7', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 6, '', 0, '{"menu_archive":"0","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0),
(128, 'main', 'com_logs', 'com-logs', '', 'com-logs', 'index.php?option=com_logs', 'component', 0, 1, 1, 10094, 0, '0000-00-00 00:00:00', 0, 1, 'class:logs', 0, '', 73, 74, 0, '', 1),
(134, 'main', 'com_cobalt', 'com-cobalt', '', 'com-cobalt', 'index.php?option=com_cobalt', 'component', 0, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_cobalt/images/menu/cobalt.png', 0, '', 75, 84, 0, '', 1),
(135, 'main', 'Records', 'records', '', 'com-cobalt/records', 'index.php?option=com_cobalt&view=records', 'component', 0, 134, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:article', 0, '', 76, 77, 0, '', 1),
(136, 'main', 'Sections', 'sections', '', 'com-cobalt/sections', 'index.php?option=com_cobalt&view=sections', 'component', 0, 134, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:category', 0, '', 78, 79, 0, '', 1),
(137, 'main', 'Types', 'types', '', 'com-cobalt/types', 'index.php?option=com_cobalt&view=types', 'component', 0, 134, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_cobalt/images/menu/types.png', 0, '', 80, 81, 0, '', 1),
(138, 'main', 'Configuration', 'configuration', '', 'com-cobalt/configuration', 'index.php?option=com_config&view=component&component=com_cobalt', 'component', 0, 134, 2, 10001, 0, '0000-00-00 00:00:00', 0, 1, 'class:config', 0, '', 82, 83, 0, '', 1),
(139, 'main', 'com_tibcoopenapidatabaseimport', 'com-tibcoopenapidatabaseimport', '', 'com-tibcoopenapidatabaseimport', 'index.php?option=com_tibcoopenapidatabaseimport', 'component', 0, 1, 1, 10110, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 85, 86, 0, '', 1),
(140, 'top', 'Dashboard', 'dashboard', '', 'dashboard', 'index.php?option=com_cobalt&view=record&id=', 'component', 1, 1, 1, 10001, 0, '0000-00-00 00:00:00', 0, 8, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 27, 28, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_menu_types`
--

DROP TABLE IF EXISTS `openapi_menu_types`;
CREATE TABLE IF NOT EXISTS `openapi_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `openapi_menu_types`
--

INSERT INTO `openapi_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(2, 'top', 'Top', ''),
(3, 'hidenmenu', 'Hiden menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_messages`
--

DROP TABLE IF EXISTS `openapi_messages`;
CREATE TABLE IF NOT EXISTS `openapi_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_messages_cfg`
--

DROP TABLE IF EXISTS `openapi_messages_cfg`;
CREATE TABLE IF NOT EXISTS `openapi_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_modules`
--

DROP TABLE IF EXISTS `openapi_modules`;
CREATE TABLE IF NOT EXISTS `openapi_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `openapi_modules`
--

INSERT INTO `openapi_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 6, 1, '{"layout":"_:default","moduleclass_sfx":"","shownew":"1","showhelp":"1","forum_url":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 1, 'position-4', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"By signing in, you are agreeing to the <a target=\\"_blank\\" href=\\"index.php?option=com_content&view=article&id=8&catid=2&Itemid=107\\">Terms & Conditions<\\/a> of this site.","login":"","logout":"107","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(87, 'Cobalt - Module - Categories', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_category', 1, 1, '', 0, '*'),
(88, 'Cobalt - Module - Filters', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_filters', 1, 1, '', 0, '*'),
(89, 'Cobalt - Module - Who Follows User', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_followers', 1, 1, '', 0, '*'),
(90, 'Cobalt - Module - Whom User Follows', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_ifollow', 1, 1, '', 0, '*'),
(91, 'Cobalt - Module - Notifications', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_notifications', 1, 1, '', 0, '*'),
(92, 'Cobalt - Module - Article Participants', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_participants', 1, 1, '', 0, '*'),
(93, 'Cobalt - Module - Records', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_cobalt_records', 1, 1, '', 0, '*'),
(94, 'Cobalt - Module - Section Statictics', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_sectionstatistics', 1, 1, '', 0, '*'),
(95, 'Cobalt - Module - Tag Cloud', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_tagcloud', 1, 1, '', 0, '*'),
(96, 'Cobalt - Module - User Statictics', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_userstatistics', 1, 1, '', 0, '*'),
(97, 'Banner', '', '<div class="hero-unit">\r\n<h1><img src="images/banners/OpenAPI_BNR1024x300_vd7A.jpg" alt="" /></h1>\r\n</div>', 1, 'started_banner', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" get-started-banner","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 'product overview', '', '<ul id="product" class="nav nav-tabs">\r\n<li class="active"><a href="#overview">Overview</a></li>\r\n<li><a href="#apiexplorer">APIExplore</a></li>\r\n<li><a href="#data-reference">Data Reference</a></li>\r\n<li><a href="#data-explorer">Data Explorer</a></li>\r\n<li><a href="#documentation">Documentation</a></li>\r\n</ul>\r\n<div class="tab-content">\r\n<div id="overview" class="tab-pane">\r\n<h3>Product - Reference Guide</h3>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam</p>\r\n<p>there are serveral resource types</p>\r\n<p>Consumer product Collection<br /> Consumer Product</p>\r\n<h3>Plans</h3>\r\n<div class="plans-list">\r\n<ul class="thumbnails products-list">\r\n<li class="span3 products-items">\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Community</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, laoreet dolore magna aliquam erat volutpa</p>\r\n<img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<p>Daily limit - 30000<br /> Burst - 300</p>\r\n<div class="plans-action"><input class="btn btn-primary pull-right" type="button" value="Upgrade" /></div>\r\n</li>\r\n<li class="span3 products-items">\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Standard</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, laoreet dolore magna aliquam erat volutpa</p>\r\n<img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<p>Daily limit - 30000<br /> Burst - 300</p>\r\n<div class="plans-action"><a href="#">Downgrade</a> <input class="btn btn-primary pull-right" type="button" value="Upgrade" /></div>\r\n</li>\r\n<li class="span3 products-items">\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Preminum</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, laoreet dolore magna aliquam erat volutpa</p>\r\n<img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<p>Daily limit - 30000<br /> Burst - 300</p>\r\n<div class="plans-action"><a href="#">Downgrade</a> <input class="btn btn-primary pull-right" type="button" value="Upgrade" /></div>\r\n</li>\r\n<li class="span3 products-items">\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Custom</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, laoreet dolore magna aliquam erat volutpa</p>\r\n<img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<p>Daily limit - 30000<br /> Burst - 300</p>\r\n<div class="plans-action"><input class="btn btn-primary pull-right" type="button" value="Request" /></div>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>', 1, 'product_overview', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" product_overview","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 'Browser by category', '', '<ul id="myTab" class="nav nav-tabs">\r\n<li class="active"><a href="#home">Category1</a></li>\r\n<li><a href="#profile">Category2</a></li>\r\n<li><a href="#messages">Category3</a></li>\r\n<li><a href="#settings">Category4</a></li>\r\n</ul>\r\n<div class="tab-content">\r\n<div id="home" class="tab-pane active">\r\n<h3>Products grouped by category 1</h3>\r\n<ul class="thumbnails products-list">\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n</ul>\r\n</div>\r\n<div id="profile" class="tab-pane">\r\n<h3>Products grouped by category 2</h3>\r\n<ul class="thumbnails products-list">\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n</ul>\r\n</div>\r\n<div id="messages" class="tab-pane">\r\n<h3>Products grouped by category 3</h3>\r\n<ul class="thumbnails products-list">\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n</ul>\r\n</div>\r\n<div id="settings" class="tab-pane">\r\n<h3>Products grouped by category 4</h3>\r\n<ul class="thumbnails products-list">\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n<li class="span3 products-items"><img src="images/products/g_integrate_detail.png" alt="" data-pinit="registered" />\r\n<h4 class="newsflash-title products-featured-product"><a class="readmore" href="index.php/products/83-asg/products/fetured-products/83-featured-product4">Featured Product4</a></h4>\r\n<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpa</p>\r\n</li>\r\n</ul>\r\n</div>\r\n</div>', 1, 'products_cat_tab', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":" products_cat_tab","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 'Featured', '', '', 1, 'MoreInfoFeaturedProducts', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 1, '{"catid":["9"],"image":"1","item_title":"1","item_intro_text":"1","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"1","count":"2","ordering":"a.publish_up","layout":"_:horizontal","moduleclass_sfx":" products-featured-product","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"6","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 'Landing page featured product', '', '', 1, 'landingPageFeaturedProduct', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_news', 1, 0, '{"catid":["9"],"image":"1","item_title":"1","link_titles":"","item_heading":"h4","showLastSeparator":"1","readmore":"0","count":"4","ordering":"a.publish_up","layout":"_:horizontal","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"3","header_tag":"h3","header_class":"","style":"System-none"}', 0, '*'),
(102, 'top', '', '', 1, 'position-1', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"top","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"  nav-pills","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 'Featured Products', '', '', 1, 'home_featured_products', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_cobalt_records', 1, 0, '{"section_id":"1","types":["1"],"orderby":"r.ctime DESC","view_what":"only_featured","catids":"","cat_restrict":"0","user_restrict":"2","tmpl":"featured2list.9cd6d32e6920de308a05432f9ed5edad","limit":"8","lang_mode":"0","moduleclass_sfx":" featured-items","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(104, 'Products Page Featured Products', '', '', 1, 'products_featured_list', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_cobalt_records', 1, 0, '{"section_id":"1","types":["1"],"orderby":"r.ctime DESC","view_what":"only_featured","catids":"","cat_restrict":"0","user_restrict":"2","tmpl":"featured2list.9cd6d32e6920de308a05432f9ed5edad","limit":"8","lang_mode":"0","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(105, 'All products', '', '', 1, 'all_products', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_cobalt_records', 1, 1, '{"section_id":"1","types":["1"],"orderby":"r.ctime DESC","view_what":"all","catids":"","cat_restrict":"0","user_restrict":"0","tmpl":"","limit":"0","lang_mode":"0","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(106, 'register_homepage_button', '', '<p><a id="banner_register_btn" class="btn start-button" href="index.php/component/users/?view=registration" style="width: 160px;">Register now</a></p>\r\n<p><span style="margin-left: 95px; margin-top: -70px; padding: 8px 17px; position: absolute; z-index: 10; font-size: 11px; color: #fff;">You need to register to use the APIs. </span></p>', 1, 'register_button', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 5, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"-register","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"System-none"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_modules_menu`
--

DROP TABLE IF EXISTS `openapi_modules_menu`;
CREATE TABLE IF NOT EXISTS `openapi_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_modules_menu`
--

INSERT INTO `openapi_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 107);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_newsfeeds`
--

DROP TABLE IF EXISTS `openapi_newsfeeds`;
CREATE TABLE IF NOT EXISTS `openapi_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_overrider`
--

DROP TABLE IF EXISTS `openapi_overrider`;
CREATE TABLE IF NOT EXISTS `openapi_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_postinstall_messages`
--

DROP TABLE IF EXISTS `openapi_postinstall_messages`;
CREATE TABLE IF NOT EXISTS `openapi_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `openapi_postinstall_messages`
--

INSERT INTO `openapi_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 1),
(2, 700, 'COM_CPANEL_MSG_EACCELERATOR_TITLE', 'COM_CPANEL_MSG_EACCELERATOR_BODY', 'COM_CPANEL_MSG_EACCELERATOR_BUTTON', 'com_cpanel', 1, 'action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_condition', '3.2.0', 1),
(3, 700, 'PLG_USER_JOOMLA_POSTINSTALL_STRONGPW_TITLE', 'PLG_USER_JOOMLA_POSTINSTALL_STRONGPW_TEXT', 'PLG_USER_JOOMLA_POSTINSTALL_STRONGPW_BTN', 'plg_user_joomla', 1, 'action', 'site://plugins/user/joomla/postinstall/actions.php', 'plguserjoomla_postinstall_action', 'site://plugins/user/joomla/postinstall/actions.php', 'plguserjoomla_postinstall_condition', '3.2.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_redirect_links`
--

DROP TABLE IF EXISTS `openapi_redirect_links`;
CREATE TABLE IF NOT EXISTS `openapi_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_schemas`
--

DROP TABLE IF EXISTS `openapi_schemas`;
CREATE TABLE IF NOT EXISTS `openapi_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_schemas`
--

INSERT INTO `openapi_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.1.1'),
(10001, '8.318-2013-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_session`
--

DROP TABLE IF EXISTS `openapi_session`;
CREATE TABLE IF NOT EXISTS `openapi_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_session`
--

INSERT INTO `openapi_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('16g9j5cr8vik7rd1ulh6ihjd94', 1, 0, '1394756869', '__default|a:8:{s:15:"session.counter";i:13;s:19:"session.timer.start";i:1394756824;s:18:"session.timer.last";i:1394756867;s:17:"session.timer.now";i:1394756867;s:22:"session.client.browser";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:11:"com_plugins";O:8:"stdClass":1:{s:7:"plugins";O:8:"stdClass":4:{s:6:"filter";O:8:"stdClass":4:{s:6:"search";s:5:"guide";s:6:"access";i:0;s:7:"enabled";s:0:"";s:6:"folder";s:0:"";}s:10:"limitstart";i:0;s:8:"ordercol";s:6:"folder";s:9:"orderdirn";s:3:"asc";}}s:6:"global";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:20;}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:3:"129";s:4:"name";s:18:"Host Administrator";s:8:"username";s:5:"admin";s:5:"email";s:16:"admin@local.host";s:8:"password";s:65:"cd96d0b68cca73368223278a3209c5f2:gPf58wF6cgOGADc9i4CPnUv9Zov3zpy4";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-08-01 05:00:02";s:13:"lastvisitDate";s:19:"2014-03-05 05:41:24";s:10:"activation";s:1:"0";s:6:"params";s:92:"{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}";s:6:"groups";a:2:{i:8;s:1:"8";i:23;s:2:"23";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":6:{s:11:"admin_style";s:0:"";s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:0:"";}}s:14:"\\0\\0\\0_authGroups";a:9:{i:0;i:1;i:1;i:10;i:2;i:11;i:3;i:7;i:4;i:8;i:6;i:12;i:7;i:21;i:8;i:22;i:9;i:23;}s:14:"\\0\\0\\0_authLevels";a:12:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;i:5;i:8;i:6;i:9;i:7;i:10;i:8;i:18;i:9;i:19;i:10;i:20;i:11;i:39;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"fd7452af23966668dad5f965f98ec4bf";}', 129, 'admin'),
('h29sorv2qcn05lgjd0oodvkoq4', 1, 1, '1394756823', '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1394756823;s:18:"session.timer.last";i:1394756823;s:17:"session.timer.now";i:1394756823;s:22:"session.client.browser";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";N;s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:3;i:3;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"9955136f56b44237dd9afeb5e6b6bb75";}', 0, ''),
('uv36i8b5phnjqsa3mnpl3nm046', 1, 1, '1394756821', '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1394756821;s:18:"session.timer.last";i:1394756821;s:17:"session.timer.now";i:1394756821;s:22:"session.client.browser";s:81:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:27.0) Gecko/20100101 Firefox/27.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";N;s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:3;i:3;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"da451b927c6008a7f19be5d630f809fd";}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_tags`
--

DROP TABLE IF EXISTS `openapi_tags`;
CREATE TABLE IF NOT EXISTS `openapi_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `openapi_tags`
--

INSERT INTO `openapi_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_template_styles`
--

DROP TABLE IF EXISTS `openapi_template_styles`;
CREATE TABLE IF NOT EXISTS `openapi_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `openapi_template_styles`
--

INSERT INTO `openapi_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'asg_openapi', 0, '0', 'asg_openapi - Default', '{"templateColor":"#0088cc","templateBackgroundColor":"#f4f6f7","logoFile":"","sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(11, 'openapi', 0, '1', 'openapi - Default', '{"sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(12, 'nielsen', 0, '0', 'nielsen - Default', '{"sitetitle":"","sitedescription":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_ucm_base`
--

DROP TABLE IF EXISTS `openapi_ucm_base`;
CREATE TABLE IF NOT EXISTS `openapi_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_ucm_content`
--

DROP TABLE IF EXISTS `openapi_ucm_content`;
CREATE TABLE IF NOT EXISTS `openapi_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_ucm_history`
--

DROP TABLE IF EXISTS `openapi_ucm_history`;
CREATE TABLE IF NOT EXISTS `openapi_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_updates`
--

DROP TABLE IF EXISTS `openapi_updates`;
CREATE TABLE IF NOT EXISTS `openapi_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=52 ;

--
-- Dumping data for table `openapi_updates`
--

INSERT INTO `openapi_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.2.2', '', 'http://update.joomla.org/core/sts/extension_sts.xml', ''),
(2, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ms-MY_details.xml', ''),
(3, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', ''),
(4, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', ''),
(5, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', ''),
(6, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.2.2.2', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', ''),
(7, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', ''),
(8, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.2.0.1', '', 'http://update.joomla.org/language/details3/el-GR_details.xml', ''),
(9, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', ''),
(10, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', ''),
(11, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', ''),
(12, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.2.0.1', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', ''),
(13, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', ''),
(14, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', ''),
(15, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', ''),
(16, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', ''),
(17, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', ''),
(18, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', ''),
(19, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', ''),
(20, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', ''),
(21, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', ''),
(22, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', ''),
(23, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', ''),
(24, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', ''),
(25, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', ''),
(26, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.2.1.0', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', ''),
(27, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', ''),
(28, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', ''),
(29, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', ''),
(30, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', ''),
(31, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.2.2.2', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', ''),
(32, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.2.1.5', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', ''),
(33, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.2.2.2', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', ''),
(34, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', ''),
(35, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', ''),
(36, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', ''),
(37, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', ''),
(38, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', ''),
(39, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.2.0.6', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', ''),
(40, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.2.0.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', ''),
(41, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', ''),
(42, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', ''),
(43, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', ''),
(44, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', ''),
(45, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', ''),
(46, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', ''),
(47, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', ''),
(48, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', ''),
(49, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', ''),
(50, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', ''),
(51, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/srp-ME_details.xml', '');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_update_sites`
--

DROP TABLE IF EXISTS `openapi_update_sites`;
CREATE TABLE IF NOT EXISTS `openapi_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `openapi_update_sites`
--

INSERT INTO `openapi_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1393264862),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1393264862),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1393264862);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_update_sites_extensions`
--

DROP TABLE IF EXISTS `openapi_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `openapi_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `openapi_update_sites_extensions`
--

INSERT INTO `openapi_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_usergroups`
--

DROP TABLE IF EXISTS `openapi_usergroups`;
CREATE TABLE IF NOT EXISTS `openapi_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `openapi_usergroups`
--

INSERT INTO `openapi_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 28, 'Public'),
(2, 1, 26, 27, 'Registered'),
(7, 11, 6, 9, 'Administrator'),
(8, 7, 7, 8, 'Super Users'),
(9, 1, 2, 3, 'Guest'),
(10, 1, 4, 11, 'Host'),
(11, 10, 5, 10, 'Product Manager'),
(12, 1, 12, 25, 'Partner'),
(21, 12, 19, 24, 'Organization 68 Member'),
(22, 21, 20, 23, 'Organization 68 Contact'),
(23, 22, 21, 22, 'Organization 68 Manager'),
(39, 12, 13, 18, 'Organization 220 Member'),
(40, 39, 14, 17, 'Organization 220 Contact'),
(41, 40, 15, 16, 'Organization 220 Manager');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_users`
--

DROP TABLE IF EXISTS `openapi_users`;
CREATE TABLE IF NOT EXISTS `openapi_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `openapi_users`
--

INSERT INTO `openapi_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(129, 'Host Administrator', 'admin', 'admin@local.host', 'cd96d0b68cca73368223278a3209c5f2:gPf58wF6cgOGADc9i4CPnUv9Zov3zpy4', 0, 1, '2013-08-01 05:00:02', '2014-03-14 00:27:11', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
(154, 'Jon Wiley', 'jwiley', 'jwiley@local.host', '44200d0ea202ab01655ce6aeaf51e292:bJdVPJi46ID5i0UDRVdTQ2nwrPKIy3z8', 0, 0, '2013-11-19 00:47:14', '2014-02-21 06:50:36', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
(155, 'Collin Harper', 'charper', 'charper@local.host', 'aad7b8f7be808f76d31b93b8dff16aa4:dSQcA8fDvinNMufAb5bIlXOOtotuqKZA', 0, 0, '2013-11-19 00:49:08', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_user_keys`
--

DROP TABLE IF EXISTS `openapi_user_keys`;
CREATE TABLE IF NOT EXISTS `openapi_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_user_notes`
--

DROP TABLE IF EXISTS `openapi_user_notes`;
CREATE TABLE IF NOT EXISTS `openapi_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openapi_user_profiles`
--

DROP TABLE IF EXISTS `openapi_user_profiles`;
CREATE TABLE IF NOT EXISTS `openapi_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

--
-- Dumping data for table `openapi_user_profiles`
--

INSERT INTO `openapi_user_profiles` (`user_id`, `profile_key`, `profile_value`, `ordering`) VALUES
(129, 'plan.subscribe', '108', 0);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_user_usergroup_map`
--

DROP TABLE IF EXISTS `openapi_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `openapi_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openapi_user_usergroup_map`
--

INSERT INTO `openapi_user_usergroup_map` (`user_id`, `group_id`) VALUES
(129, 8),
(129, 23),
(154, 2),
(154, 41),
(155, 2),
(155, 39);

-- --------------------------------------------------------

--
-- Table structure for table `openapi_viewlevels`
--

DROP TABLE IF EXISTS `openapi_viewlevels`;
CREATE TABLE IF NOT EXISTS `openapi_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `openapi_viewlevels`
--

INSERT INTO `openapi_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[10,12,2]'),
(3, 'Default View Level (Public)', 2, '[1]'),
(5, 'Guest', 0, '[9]'),
(6, 'Host Product Manager', 0, '[11,7,8]'),
(8, 'Partner', 0, '[7,12]'),
(9, 'Host', 0, '[10]'),
(10, 'Host Administrator', 0, '[8]'),
(18, 'Organization 68 Member', 0, '[21]'),
(19, 'Organization 68 Contact', 0, '[22]'),
(20, 'Organization 68 Manager', 0, '[23]'),
(36, 'Organization 220 Member', 0, '[39]'),
(37, 'Organization 220 Contact', 0, '[40]'),
(38, 'Organization 220 Manager', 0, '[41]'),
(39, 'Manage organizations and user profiles', 0, '[8,41,23]');

-- --------------------------------------------------------

--
-- Table structure for table `openapi_weblinks`
--

DROP TABLE IF EXISTS `openapi_weblinks`;
CREATE TABLE IF NOT EXISTS `openapi_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
