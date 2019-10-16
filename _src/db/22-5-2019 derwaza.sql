-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2019 at 03:29 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `derwaza`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `orderd` int(11) NOT NULL,
  `is_side` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `name_ar` varchar(200) NOT NULL,
  `slug_ar` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `slug_en` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `orderd`, `is_side`, `is_active`, `name_ar`, `slug_ar`, `name_en`, `slug_en`) VALUES
(1, 0, 1, 0, 1, 'الفطور', 'الفطور', 'Breakfast', 'breakfast'),
(2, 0, 2, 0, 1, 'المقبلات', 'المقبلات', 'Starters', 'starters'),
(3, 0, 3, 0, 1, 'السندويشات و اللفائف', 'السندويشات-و-اللفائف', 'Sandwiches & Wraps', 'sandwiches-wraps'),
(4, 0, 4, 0, 1, 'البرجر', 'البرجر', 'Burgers', 'burgers'),
(5, 0, 5, 0, 1, 'أطباق الأطفال', 'أطباق-الأطفال', 'Kids Meals', 'kids-meals'),
(7, 0, 7, 1, 1, 'الأطباق الجانبية', 'الأطباق-الجانبية', 'Sides', 'sides'),
(8, 0, 8, 0, 1, 'الاطباق الرئيسية', 'الاطباق-الرئيسية', 'Main Courses', 'main-courses'),
(9, 0, 9, 1, 1, 'الشوربة', 'الشوربة', 'Soup', 'soup'),
(13, 0, 0, 0, 1, 'السلطات', 'السلطات', 'Salads', 'salads'),
(34, 0, 0, 0, 1, 'الكوكتيل', 'الكوكتيل', 'COCKTAILS', 'cocktails'),
(35, 0, 0, 0, 1, 'مياه الديتوكس', 'مياه-الديتوكس', 'DETOX WATER', 'detox-water'),
(36, 0, 0, 0, 1, 'الحلويات', 'الحلويات', 'DESSERTS', 'desserts'),
(37, 0, 0, 0, 1, 'العصائر الطازجة', 'العصائر-الطازجة', 'FRESH JUICE', 'fresh-juice'),
(38, 0, 0, 0, 1, 'وجبات ما قبل التمرين', 'وجبات-ما-قبل-التمرين', 'PRE-WORKOUT MEALS', 'pre-workout-meals'),
(40, 0, 0, 0, 1, 'وجبة الديوانية', 'وجبة-الديوانية', 'DIWANIYA BOX', 'diwaniya-box'),
(41, 0, 0, 0, 1, 'المشروبات الساخنة', 'المشروبات-الساخنة', 'HOT DRINKS', 'hot-drinks');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_fax` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_admin_lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_lang_default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_status` tinyint(1) NOT NULL,
  `site_keyword` text COLLATE utf8_unicode_ci NOT NULL,
  `site_desc` text COLLATE utf8_unicode_ci NOT NULL,
  `social` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `config_lang` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `site_name`, `site_email`, `site_phone`, `site_fax`, `site_admin_lang`, `site_lang`, `site_lang_default`, `site_status`, `site_keyword`, `site_desc`, `social`, `created_at`, `updated_at`, `config_lang`) VALUES
(1, '', 'info@Gad.com', '92345123', '', 'en', 'en,ar', 'ar', 1, '<script async src=\"https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'GA_MEASUREMENT_ID\');\r\n</script>', '', 'a:5:{i:1;a:2:{s:4:\"site\";s:8:\"Facebook\";s:4:\"link\";s:23:\"http://Facebook.com/gad\";}i:2;a:2:{s:4:\"site\";s:7:\"Twitter\";s:4:\"link\";s:22:\"http://Twitter.com/gad\";}i:3;a:2:{s:4:\"site\";s:9:\"Instagram\";s:4:\"link\";s:17:\"                 \";}i:4;a:2:{s:4:\"site\";s:7:\"Youtube\";s:4:\"link\";s:31:\"https://youtube.com/channel/gad\";}i:5;a:2:{s:4:\"site\";s:10:\"GooglePlus\";s:4:\"link\";s:29:\"https://plus.google.com/u/gad\";}}', '0000-00-00 00:00:00', '2019-05-10 03:45:37', 'config'),
(2, 'Derwaza', '', '', '', ' ', ' ', ' ', 0, '', 'sdvsd', NULL, '2016-07-15 22:31:03', '2019-05-22 08:13:23', 'en'),
(3, 'ديرولزا', '', '', '', ' ', ' ', ' ', 0, '', 'vsdv', NULL, '2017-04-28 01:15:54', '2019-05-22 08:13:23', 'ar');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `name_en` text NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `slug` varchar(80) NOT NULL,
  `icon` varchar(70) DEFAULT NULL,
  `view_style` varchar(255) NOT NULL,
  `have_status` enum('0','1') NOT NULL DEFAULT '0',
  `have_add_new` tinyint(1) NOT NULL DEFAULT '0',
  `have_name` enum('0','1') NOT NULL DEFAULT '0',
  `have_short` enum('0','1') NOT NULL DEFAULT '0',
  `have_details` enum('0','1') NOT NULL DEFAULT '0',
  `have_thumbnail` enum('0','1') NOT NULL DEFAULT '0',
  `thumbnail_sizes` varchar(255) DEFAULT NULL,
  `have_gallery` enum('0','1') NOT NULL DEFAULT '0',
  `single` tinyint(1) NOT NULL,
  `order_menu` int(11) NOT NULL,
  `show_menu` tinyint(1) NOT NULL,
  `have_parent_module` tinyint(1) NOT NULL DEFAULT '0',
  `parent_module` int(11) NOT NULL DEFAULT '0',
  `parent_single` enum('0','1') NOT NULL DEFAULT '0',
  `have_other_inputs` tinyint(1) NOT NULL DEFAULT '0',
  `other_inputs` text,
  `have_seo` enum('0','1') NOT NULL DEFAULT '0',
  `have_ordered` enum('0','1') NOT NULL DEFAULT '0',
  `have_search` tinyint(1) DEFAULT '1',
  `rules` text NOT NULL,
  `alias` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name_en`, `name_ar`, `slug`, `icon`, `view_style`, `have_status`, `have_add_new`, `have_name`, `have_short`, `have_details`, `have_thumbnail`, `thumbnail_sizes`, `have_gallery`, `single`, `order_menu`, `show_menu`, `have_parent_module`, `parent_module`, `parent_single`, `have_other_inputs`, `other_inputs`, `have_seo`, `have_ordered`, `have_search`, `rules`, `alias`) VALUES
(1, 'About', 'من نحن', 'about', 'fa-shield', 'style_3', '0', 0, '1', '0', '1', '1', '600_600', '0', 1, 6, 0, 0, 0, '0', 1, '[{\"key\":\"home_brief\",\"type\":\"textarea\",\"name_en\":\"Home Brief\",\"name_ar\":\"home brief\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '1', '0', 1, '[[{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"details\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"},{\"rule_key\":\"home_brief\",\"rule_val\":\"required|max:200\",\"rule_val_edit\":\"required|max:200\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"Title\"},\"details\":{\"name_en\":\"Description\",\"name_ar\":\"Description\"},\"short\":{\"name_en\":\"short\",\"name_ar\":\"short\"},\"upload\":{\"name_en\":\"Image\",\"name_ar\":\"Image\"}}]'),
(2, 'Slider', 'السلايدر', 'slider', 'fa-film', 'style_1', '1', 1, '1', '0', '0', '1', '1539_799', '0', 0, 2, 1, 0, 0, '0', 0, NULL, '0', '1', 1, '[[{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0627\\u0644\\u0639\\u0646\\u0648\\u0627\\u0646 *\"},\"details\":{\"name_en\":\"Details\",\"name_ar\":\"\\u0627\\u0644\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644\"},\"short\":{\"name_en\":\"Summery\",\"name_ar\":\"\\u0627\\u0644\\u0628\\u064a\\u0627\\u0646\\u0627\\u062a\"},\"upload\":{\"name_en\":\"Slider image\",\"name_ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0631\\u0629 *\"}}]'),
(4, 'Term and condition', 'الشروط والاحكام', 'term_and_condition', 'fa-shield', 'style_1', '0', 0, '0', '0', '1', '0', '', '0', 1, 9, 0, 0, 0, '0', 0, NULL, '1', '0', 1, '[[]]', '[{\"name\":{\"name_en\":\"\",\"name_ar\":\"\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(5, 'Privacy policy', 'سياسة الخصوصية', 'privacy_policy', 'fa-shield', 'style_1', '0', 0, '0', '0', '1', '0', '', '0', 1, 10, 0, 0, 0, '0', 0, NULL, '1', '0', 1, '[[]]', '[{\"name\":{\"name_en\":\"\",\"name_ar\":\"\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(6, 'Slider text', 'Slider Text', 'slider_text', 'fa-user', 'style_1', '0', 0, '1', '0', '0', '0', '', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"slider_description\",\"type\":\"textarea\",\"name_en\":\"Slider Description\",\"name_ar\":\"Description\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"},{\"rule_key\":\"slider_description\",\"rule_val\":\"required|max:150\",\"rule_val_edit\":\"required|max:150\"}]]', '[{\"name\":{\"name_en\":\"Slider Title\",\"name_ar\":\"Slider Title\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(7, 'Mission and vission ', 'مهمتنا', 'our_mission', 'fa-shield', 'style_1', '0', 0, '0', '0', '0', '0', '', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"our_mission\",\"type\":\"textarea\",\"name_en\":\"Our Mission\",\"name_ar\":\"\\u0645\\u0647\\u0645\\u062a\\u0646\\u0627\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"our_vission\",\"type\":\"textarea\",\"name_en\":\"Our Vission\",\"name_ar\":\"\\u0631\\u0624\\u064a\\u062a\\u0646\\u0627\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"our_vission\",\"rule_val\":\"required|max:2000\",\"rule_val_edit\":\"required|max:2000\"},{\"rule_key\":\"our_mission\",\"rule_val\":\"required|max:2000\",\"rule_val_edit\":\"required|max:2000\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0627\\u0644\\u0639\\u0646\\u0648\\u0627\\u0646\"},\"details\":{\"name_en\":\"Description\",\"name_ar\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(8, 'Certificates', 'الشهادات', 'certificates', 'fa-user', 'style_1', '0', 0, '1', '0', '0', '0', '', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"certificate_1\",\"type\":\"image\",\"name_en\":\"Certificate No.1\",\"name_ar\":\"\\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629 \\u0627\\u0644\\u0627\\u0648\\u0644\\u0649\",\"class\":\"\",\"sizes\":\"300_300\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"certificate_2\",\"type\":\"image\",\"name_en\":\"Certificate No.2\",\"name_ar\":\"\\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629 \\u0627\\u0644\\u062b\\u0627\\u0646\\u064a\\u0629\",\"class\":\"\",\"sizes\":\"300_300\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"certificate_3\",\"type\":\"image\",\"name_en\":\"Certificate No.3\",\"name_ar\":\"\\u0627\\u0644\\u0634\\u0647\\u0627\\u062f\\u0629 \\u0627\\u0644\\u062b\\u0627\\u0644\\u062b\\u0629\",\"class\":\"\",\"sizes\":\"300_300\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"brief\",\"type\":\"textarea\",\"name_en\":\"Brief\",\"name_ar\":\"Brief\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"brief\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"},{\"rule_key\":\"certificate_3\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"certificate_2\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"certificate_1\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"Title\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(9, 'News', 'الأخبار', 'news', 'fa-shield', 'style_1', '1', 1, '1', '1', '0', '1', '1600_800', '0', 0, 0, 1, 0, 0, '0', 1, '[]', '0', '0', 1, '[[{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"},{\"rule_key\":\"short\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u062e\\u0628\\u0631\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"Description\",\"name_ar\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"},\"upload\":{\"name_en\":\"image\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629\"}}]'),
(10, 'Chairman\'s  Message', 'كلمة رئيس مجلس الإدارة', 'chairmans_message', 'fa-user', 'style_1', '1', 0, '0', '0', '0', '1', '1600_800', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"summary\",\"type\":\"textarea\",\"name_en\":\"Chairman\'s speech\",\"name_ar\":\"\\u0643\\u0644\\u0645\\u0629 \\u0631\\u0626\\u064a\\u0633 \\u0645\\u062c\\u0644\\u0633 \\u0627\\u0644\\u0625\\u062f\\u0627\\u0631\\u0629\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"summary\",\"rule_val\":\"required|max:2000\",\"rule_val_edit\":\"required|max:2000\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"}]]', '[{\"name\":{\"name_en\":\"\",\"name_ar\":\"\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"upload  photo\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629\"}}]'),
(11, 'Clients', 'عملاؤنا', 'clients', 'fa-user', 'style_2', '1', 1, '1', '0', '0', '1', '512_512', '0', 0, 0, 1, 0, 0, '0', 0, NULL, '0', '1', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required|max:57\",\"rule_val_edit\":\"required|max:57\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"}]]', '[{\"name\":{\"name_en\":\"client Name\",\"name_ar\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"upload  photo\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629\"}}]'),
(13, 'Sector category', 'فئة القطاع', 'sector_category', 'fa-user', 'style_3', '1', 1, '1', '0', '0', '0', '', '0', 0, 0, 1, 0, 0, '0', 0, NULL, '0', '0', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"}]]', '[{\"name\":{\"name_en\":\"Sector Name\",\"name_ar\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0637\\u0627\\u0639\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(14, 'Sectors', 'القطاعات', 'sectors', 'fa-shield', 'style_1', '1', 1, '1', '1', '0', '1', '1600_800', '0', 0, 0, 1, 1, 13, '0', 1, '[{\"key\":\"brief\",\"type\":\"text\",\"name_en\":\"Brief\",\"name_ar\":\"\\u0639\\u0646 \\u0627\\u0644\\u0642\\u0637\\u0627\\u0639\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"secondary_img\",\"type\":\"image\",\"name_en\":\"Secondary image\",\"name_ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u062b\\u0627\\u0646\\u0648\\u064a\\u0629\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"secondary_img\",\"rule_val\":\"mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"short\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"},{\"rule_key\":\"brief\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0627\\u0644\\u0639\\u0646\\u0648\\u0627\\u0646\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"description\",\"name_ar\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"},\"upload\":{\"name_en\":\"Main Photo\",\"name_ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\"}}]');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `config_id` int(11) NOT NULL,
  `lang` varchar(40) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `short` text,
  `details` longtext,
  `upload` varchar(120) DEFAULT NULL,
  `other_inputs_values` text,
  `views` int(11) DEFAULT NULL,
  `keys` text,
  `desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `config_id`, `lang`, `slug`, `name`, `short`, `details`, `upload`, `other_inputs_values`, `views`, `keys`, `desc`) VALUES
(1, 1, 'ar', '', 'من نحن', '', '<p>App Icons are the images you press on your smartphone to launch an application. As newer phones are released with higher resolution screens, higher resolution app icons are needed. Developers still want to maintain support for the older phones with lower resoltion so when you create an app icon you need to create several size variations of the same image. This is true for all smartphones like the iPhone and Android, and even tablets like iPad.<br></p>', '1557226425_mcdelivery_new11.jpg', '[{\"home_brief\":\"\\u0645\\u0637\\u0627\\u0639\\u0645 \\u062c\\u0627\\u062f\"}]', 0, '', ''),
(2, 1, 'en', '', 'About US', '', '<p>App Icons are the images you press on your smartphone to launch an application. As newer phones are released with higher resolution screens, higher resolution app icons are needed. Developers still want to maintain support for the older phones with lower resoltion so when you create an app icon you need to create several size variations of the same image. This is true for all smartphones like the iPhone and Android, and even tablets like iPad.<br></p>', '1557226425_mcdelivery_new11.jpg', '[{\"home_brief\":\"Gad Restaurants\"}]', 0, '', ''),
(3, 2, 'en', 'choose_your_meals', 'Choose Your Meals', '', '', '1557040885_1520213036_eat.png', '[{\"short_desc\":\"No shopping, no cooking, and no cleaning. Enjoy your healthy meals with your family\"}]', 0, '', ''),
(4, 2, 'ar', 'اختر_وجباتك', 'اختر وجباتك', '', '', '1557040886_1520213036_eat.png', '[{\"short_desc\":\"No shopping, no cooking, and no cleaning. Enjoy your healthy meals with your family\"}]', 0, '', ''),
(5, 3, 'en', 'we_deliver_your_meals', 'We Deliver Your Meals', '', '', '1557040927_1520212865_del.png', '[{\"short_desc\":\"We prepare and deliver meals arrive at your door\"}]', 0, '', ''),
(6, 3, 'ar', 'نحن_نقوم_بالتوصيل', 'نحن نقوم بالتوصيل', '', '', '1557040929_1520212865_del.png', '[{\"short_desc\":\"\\u0646\\u062d\\u0646 \\u0646\\u062c\\u0647\\u0632 \\u0648\\u0646\\u0633\\u0644\\u0645\\u0643 \\u0648\\u062c\\u0628\\u0627\\u062a\\u0643 \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644\\u0629 \\u062d\\u062a\\u0649 \\u0628\\u0627\\u0628 \\u0628\\u064a\\u062a\\u0643\"}]', 0, '', ''),
(7, 4, 'en', 'eat_and_enjoy', 'Eat And Enjoy', '', '', '1557040872_1520212661_meal.png', '[{\"short_desc\":\"No shopping, no cooking, and no cleaning. Enjoy your healthy meals with your family\"}]', 0, '', ''),
(8, 4, 'ar', 'تغذى_و_إستمتع', 'تغذى و إستمتع', '', '', '1557040872_1520212661_meal.png', '[{\"short_desc\":\"No shopping, no cooking, and no cleaning. Enjoy your healthy meals with your family\"}]', 0, '', ''),
(9, 5, 'en', '', '', '', '<p><span style=\"font-size: 16px; font-weight: bold;\">1. Delivery service will begin two working days after signing the contract.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">2. In case the subscriber wishes to change any choice (of food menu, address, telephone or any important data), cease provisional or permanent subscription, the subscriber is required to inform HealthyBar 48 hours prior to the time of the change or cessation of subscription to enable HealthyBar to take the required procedures.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">3. HealthyBar will not refund fees, in the case of any specified or unspecified subscription cancellation.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">4. The subscriber has the right to transfer his/ her subscription value to another person in case he/she desires to cancel his/her subscription, provided the new subscriber shall undertake to comply with the same conditions.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">5. The subscriber has the right to freeze his/her activities provided they do not exceed two weeks before resuming his/ her activities for the Four weeks Subscription and 1 Week Freeze for the 2 Weeks Subscription</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">6. The unexploited days since the date of subscription will be calculated for the subscriber, in case the provided renewal does not exceed four months.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">7. In case the subscriber desires to renew his/her subscription, it shall be done within two days prior to the expiry of the current membership.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">8. Kindly be informed that the food delivery service will run from 5:00 am to 11:00 am( Morning delivery) & from 12:00 pm to 5:00 pm( Eveningdelivery ). In the case of delivery delays, please call HealthyBar in order for necessary procedures to be taken.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">9. In case the customer desires to take the meals at a specified time, please be informed that this service will cost KD 20.00.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">10. HealthyBar is not responsible for any customer weight increase or loss, due to differences in the subscriber’s ability to change his/her diet or exercise regime. Therefore, there is no weight increase or loss warranty, particularly in the first two weeks of the subscription.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">11. It is the subscriber’s full responsibility to inform all members living in the same household that may be subject to receiving the meals to check the received items and the quality and freshness of the food. After the delivery notice is signed, the meals and its content (including any damaged food or missing items) are No longer HealthyBar’s responsibility.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">12. Meals are delivered daily from Saturday to Thursday. Friday is a rest day.</span></p>', NULL, NULL, 0, '', ''),
(10, 5, 'ar', '', '', '', '<p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>خدمة توصيل الطلبات ستبدأ بعد مرور يومين عمل من تاريخ توقيع العقد.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>على المشترك في حال رغبته في حدوث تغيير على (اختياراته من لائحة الطعام ـ تغيير العنوان أو أرقام التليفون أو شخص أو صفة من يتسلم الوجبات أو أي بيانات هامة أو توقيت الاشتراك المؤقت أو الدائم) ويجب أن يتم الإبلاغ عنها قبل 48 ساعة على الأقل حتى يتسنى لنا بإتخاذ الإجراءات اللازمة.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>لن يقوم <span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> بإعادة قيمة الاشتراك لأي ظرف من الظروف .</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يحق للمشترك بتحويل اشتراكه ( عدد الأيام ) إلى شخص بديل من طرفه في حال أراد الغاء اشتراكه ، على أن يتعهد المشترك البديل بالالتزام بذات الشروط</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يحق للمشترك تجميد اشتراكه ومعاودته على أن لا تزيد مدة التجميد عن أسبوعين لإشتراك الأربعة أسابيع و مدة تجميد اسبوع واحد فقط لإشتراك الاسبوعبن</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يحتسب للمشترك عدد الأيام الغير مستهلكة من تاريخ الاشتراك في حالة التجديد على ألا تزيد عن مدة أربعة أشهر .</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>في حالة اراد المشترك تجديد اشتراكه يجب تجديده قبل انتهائة بيومان .</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يرجى العلم بأن خدمة توصيل الأكل تكون ما بين الساعة 00:5 صباحا و الساعة 00:11 صباحا (الفترة الصباحية ) </b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>و بين الساعة 00:12 مساء و الساعة 00:5 مساء (الفترة المسائية) ظهراً وفي حالة تأخر المندوب عن تلك المواعيد يرجى الاتصال بنا لاتخاذ اللازم .</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>في حالة أراد العميل أن يأخذ الوجبات في وقت محدد أي خدمة توصيل خاصة يجب العلم بأن تلك الخدمة تكون تكلفتها  20 د. ك عشرون ديناركويتي لاغير.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b><span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> لن يتحمل أدنى مسئولية تجاه أي زيادة أو نقصان في الوزن لأي عميل حيث أن جميع الأفراد بطبيعة الحال قد تختلف في قدرتها على الإستجابة بتغييرالنظام الغذائي و الرياضي فلن يكون هناك أي ضمان في شـأن زيادة الوزن او نقصان الوزن، خصوصاً خلال الأسـبوعان الأوليان من بداية الاشـتراك.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يقرالمشترك بأن تسليم الوجبات في العنوان الذي ذكره في طلب الاشتراك الموقع منه يبرئ ذمتنا أياً من كان المستلم سواء كان زوج المشترك أو خادمة أو أحد أولاده أو المقيمين معه في ذلك العنوان، ويلتزم بالتنبيه على أي من هؤلاء بمعاينة الوجبات وفحصها قبل انصراف مندوبنا بحيث يكون قبوله لها وعدم ردها للسائق في وقتها مبرئاً لذمتنا ولا يكون للمشـترك الحق في أي إدعاء بعدئذ بعدم سـلامة الوجبات أو بعدم خلوها من أية مواد غريبة.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b>يتم توصيل الوجبات يوميا من السبت الى الخميس ويعتبر يوم الجمعة يوم راحة.</b></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><b> وعليه اقر بإطلاعي على كافة البنود و شروط <span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> وبموافقتي ورغبتي في الاشتراك .</b></span></p>', NULL, NULL, 0, '', ''),
(11, 6, 'en', '', '', '', '<p><span style=\"font-size: 16px; font-weight: bold;\">1. Delivery service will begin two working days after signing the contract.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">2. In case the subscriber wishes to change any choice (of food menu, address, telephone or any important data), cease provisional or permanent subscription, the subscriber is required to inform HealthyBar 48 hours prior to the time of the change or cessation of subscription to enable HealthyBar to take the required procedures.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">3. HealthyBar will not refund fees, in the case of any specified or unspecified subscription cancellation.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">4. The subscriber has the right to transfer his/ her subscription value to another person in case he/she desires to cancel his/her subscription, provided the new subscriber shall undertake to comply with the same conditions.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">5. The subscriber has the right to freeze his/her activities provided they do not exceed two weeks before resuming his/ her activities for the Four weeks Subscription and 1 Week Freeze for the 2 Weeks Subscription</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">6. The unexploited days since the date of subscription will be calculated for the subscriber, in case the provided renewal does not exceed four months.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">7. In case the subscriber desires to renew his/her subscription, it shall be done within two days prior to the expiry of the current membership.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">8. Kindly be informed that the food delivery service will run from 5:00 am to 11:00 am( Morning delivery) & from 12:00 pm to 5:00 pm( Eveningdelivery ). In the case of delivery delays, please call HealthyBar in order for necessary procedures to be taken.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">9. In case the customer desires to take the meals at a specified time, please be informed that this service will cost KD 20.00.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">10. HealthyBar is not responsible for any customer weight increase or loss, due to differences in the subscriber’s ability to change his/her diet or exercise regime. Therefore, there is no weight increase or loss warranty, particularly in the first two weeks of the subscription.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">11. It is the subscriber’s full responsibility to inform all members living in the same household that may be subject to receiving the meals to check the received items and the quality and freshness of the food. After the delivery notice is signed, the meals and its content (including any damaged food or missing items) are No longer HealthyBar’s responsibility.</span></p><p><span style=\"font-size: 16px; font-weight: bold;\">12. Meals are delivered daily from Saturday to Thursday. Friday is a rest day.</span></p>', NULL, NULL, 0, '', ''),
(12, 6, 'ar', '', '', '', '<p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">خدمة توصيل الطلبات ستبدأ بعد مرور يومين عمل من تاريخ توقيع العقد.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">على المشترك في حال رغبته في حدوث تغيير على (اختياراته من لائحة الطعام ـ تغيير العنوان أو أرقام التليفون أو شخص أو صفة من يتسلم الوجبات أو أي بيانات هامة أو توقيت الاشتراك المؤقت أو الدائم) ويجب أن يتم الإبلاغ عنها قبل 48 ساعة على الأقل حتى يتسنى لنا بإتخاذ الإجراءات اللازمة.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">لن يقوم <span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> بإعادة قيمة الاشتراك لأي ظرف من الظروف .</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يحق للمشترك بتحويل اشتراكه ( عدد الأيام ) إلى شخص بديل من طرفه في حال أراد الغاء اشتراكه ، على أن يتعهد المشترك البديل بالالتزام بذات الشروط</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يحق للمشترك تجميد اشتراكه ومعاودته على أن لا تزيد مدة التجميد عن أسبوعين لإشتراك الأربعة أسابيع و مدة تجميد اسبوع واحد فقط لإشتراك الاسبوعبن</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يحتسب للمشترك عدد الأيام الغير مستهلكة من تاريخ الاشتراك في حالة التجديد على ألا تزيد عن مدة أربعة أشهر .</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">في حالة اراد المشترك تجديد اشتراكه يجب تجديده قبل انتهائة بيومان .</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يرجى العلم بأن خدمة توصيل الأكل تكون ما بين الساعة 00:5 صباحا و الساعة 00:11 صباحا (الفترة الصباحية )</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">و بين الساعة 00:12 مساء و الساعة 00:5 مساء (الفترة المسائية) ظهراً وفي حالة تأخر المندوب عن تلك المواعيد يرجى الاتصال بنا لاتخاذ اللازم .</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">في حالة أراد العميل أن يأخذ الوجبات في وقت محدد أي خدمة توصيل خاصة يجب العلم بأن تلك الخدمة تكون تكلفتها  20 د. ك عشرون ديناركويتي لاغير.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\"><span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> لن يتحمل أدنى مسئولية تجاه أي زيادة أو نقصان في الوزن لأي عميل حيث أن جميع الأفراد بطبيعة الحال قد تختلف في قدرتها على الإستجابة بتغييرالنظام الغذائي و الرياضي فلن يكون هناك أي ضمان في شـأن زيادة الوزن او نقصان الوزن، خصوصاً خلال الأسـبوعان الأوليان من بداية الاشـتراك.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يقرالمشترك بأن تسليم الوجبات في العنوان الذي ذكره في طلب الاشتراك الموقع منه يبرئ ذمتنا أياً من كان المستلم سواء كان زوج المشترك أو خادمة أو أحد أولاده أو المقيمين معه في ذلك العنوان، ويلتزم بالتنبيه على أي من هؤلاء بمعاينة الوجبات وفحصها قبل انصراف مندوبنا بحيث يكون قبوله لها وعدم ردها للسائق في وقتها مبرئاً لذمتنا ولا يكون للمشـترك الحق في أي إدعاء بعدئذ بعدم سـلامة الوجبات أو بعدم خلوها من أية مواد غريبة.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">يتم توصيل الوجبات يوميا من السبت الى الخميس ويعتبر يوم الجمعة يوم راحة.</span></span></p><p style=\"text-align: right; direction: rtl;\"><span style=\"font-size: 18px;\"><span style=\"font-weight: 700;\">وعليه اقر بإطلاعي على كافة البنود و شروط <span style=\"color: rgb(57, 123, 33);\">هيلثي بار</span> وبموافقتي ورغبتي في الاشتراك .</span></span></p>', NULL, NULL, 0, '', ''),
(17, 12, 'en', 'fdhfhdfh', 'First', '', '', '1558531678_slider-1.jpg', NULL, 0, '', ''),
(18, 12, 'ar', 'dfhdfh', 'First', '', '', '1558531669_slider-1.jpg', NULL, 0, '', ''),
(19, 13, 'en', 'test', 'Slider Text title here', '', '', NULL, '[{\"slider_description\":\"Slider Text Description here\"}]', 0, '', ''),
(20, 13, 'ar', 'test', ' Description', '', '', NULL, '[{\"slider_description\":\" Description\"}]', 0, '', ''),
(21, 14, 'en', 'main-mission', '', '', '', NULL, '[{\"our_mission\":\"\\u2022 Provide our customers a level of services unequalled in the Electricity, cleaning, Security & Security Devices,\\r\\nNursing and agriculture industry.\\r\\n\\u2022 Develop an organization that will encourage all people to prosper and grow to their full potential\\r\\n\\u2022 Protect the health and safety of all our people.\",\"our_vission\":\"\\u2022 We strive to become the leading service provider in the industry.\\r\\n\\u2022 We aim to become the supplier of choice for all our client\"}]', 0, '', ''),
(22, 14, 'ar', 'main-mission', '', '', '', NULL, '[{\"our_mission\":\"\\u2022 Provide our customers a level of services unequalled in the Electricity, cleaning, Security & Security Devices,\\r\\nNursing and agriculture industry.\\r\\n\\u2022 Develop an organization that will encourage all people to prosper and grow to their full potential\\r\\n\\u2022 Protect the health and safety of all our people.\",\"our_vission\":\"\\u2022 We strive to become the leading service provider in the industry.\\r\\n\\u2022 We aim to become the supplier of choice for all our client\"}]', 0, '', ''),
(23, 15, 'en', '', 'ISO certifications', '', '', NULL, '[{\"certificate_1\":\"1558344207_img4.jpg\",\"certificate_2\":\"1558344207_img4.jpg\",\"certificate_3\":\"1558344207_img4.jpg\",\"brief\":\"To achieve our vision we have been ISO certified to ensure the highest quality.\"}]', 0, '', ''),
(24, 15, 'ar', '', 'ISO certifications', '', '', NULL, '[{\"certificate_1\":\"1558344208_img4.jpg\",\"certificate_2\":\"1558344208_img4.jpg\",\"certificate_3\":\"1558344208_img4.jpg\",\"brief\":\"To achieve our vision we have been ISO certified to ensure the highest quality.I\"}]', 0, '', ''),
(25, 16, 'en', '', '', '', '', '1558523355_personjpg.jpg', '[{\"summary\":\"The idea of establishing Al-Darwaza Company for Logistics Services has been crystallized\\r\\nin order to provide the government services that the company can do in ministries\\r\\nand state institutions in a better and more efficient manner at a lower cost, which will\\r\\nreflect positively on the performance of government agencies and the development of\\r\\nits services in general.\\r\\nThe company focuses on the valuable opportunities that we believe are achieving our\\r\\nstrategy and the objectives we seek through our work in the field of services.\\r\\nAl-Darwaza Company for Logistics Services seeks to spearhead the growing public\\r\\nservices sector in the region with a long-term view of the global market. With a capital\\r\\nof KD 2 million being invested in the short, medium and long term public services sector.\\r\\nAl-Darwaza Company for Logistics Services has set a key objective in the geographical\\r\\nand regional expansion and to enter into tenders and large contracts. This is in its\\r\\ninterest and works to promote development and economy. The company plans to\\r\\nexecute contracts and tenders worth KD 15 million with many ministries, To carry out\\r\\nthe work of cleaning, services, hospitality, correspondence and guarding facilities.\"}]', 0, '', ''),
(26, 16, 'ar', '', '', '', '', '1558523355_personjpg.jpg', '[{\"summary\":\"\\u062a\\u0628\\u0644\\u0640\\u0648\\u0631\\u0647 \\u0641\\u0643\\u0640\\u0631\\u0629 \\u0625\\u0646\\u0634\\u0640\\u0627\\u0621 \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0628\\u0647\\u0640\\u062f\\u0641 \\u062a\\u0642\\u062f\\u064a\\u0640\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u062a\\u0645\\u0643\\u0646\\r\\n\\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0642\\u064a\\u0640\\u0627\\u0645 \\u0628\\u0647\\u0640\\u0627 \\u0644\\u0640\\u062f\\u0649 \\u0627\\u0644\\u0640\\u0648\\u0632\\u0627\\u0631\\u0627\\u062a \\u0648 \\u0645\\u0624\\u0633\\u0633\\u0640\\u0627\\u062a \\u0627\\u0644\\u062f\\u0648\\u0644\\u0640\\u0629 \\u0628\\u0645\\u0633\\u0640\\u062a\\u0648\\u0649 \\u0623\\u0641\\u0636\\u0640\\u0644 \\u0648 \\u0641\\u0639\\u0627\\u0644\\u064a\\u0640\\u0629 \\u0623\\u0643\\u0628\\u0640\\u0631 \\u0648 \\u0628\\u062a\\u0643\\u0644\\u0641\\u0640\\u0629 \\u0623\\u0642\\u0640\\u0644 \\u060c\\r\\n\\u0645\\u0645\\u0640\\u0627 \\u0633\\u0640\\u064a\\u0646\\u0639\\u0643\\u0633 \\u0628\\u0640\\u062f\\u0648\\u0631\\u0647 \\u0628\\u0634\\u0640\\u0643\\u0644 \\u0625\\u064a\\u062c\\u0627\\u0628\\u0640\\u064a \\u0639\\u0644\\u0640\\u0649 \\u0623\\u062f\\u0627\\u0621 \\u0627\\u0644\\u0627\\u062c\\u0647\\u0640\\u0632\\u0629 \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u0648 \\u062a\\u0637\\u0648\\u064a\\u0640\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0640\\u0627 \\u0628\\u0634\\u0640\\u0643\\u0644 \\u0639\\u0640\\u0627\\u0645 .\\r\\n\\u0648\\u062a\\u0631\\u0643\\u0640\\u0632 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u0627\\u0644\\u0641\\u0640\\u0631\\u0635 \\u0627\\u0644\\u0645\\u062c\\u062f\\u064a\\u0640\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u0646\\u0640\\u0631\\u0649 \\u0623\\u0646\\u0647\\u0640\\u0627 \\u062a\\u062d\\u0642\\u0640\\u0642 \\u0644\\u0646\\u0640\\u0627 \\u0625\\u0633\\u0640\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u062a\\u0646\\u0627 \\u0648\\u0645\\u0640\\u0627 \\u0646\\u0633\\u0640\\u0639\\u0649 \\u0625\\u0644\\u064a\\u0640\\u0647 \\u0645\\u0640\\u0646 \\u0623\\u0647\\u0640\\u062f\\u0627\\u0641\\r\\n\\u0645\\u0640\\u0646 \\u062e\\u0640\\u0644\\u0627\\u0644 \\u0639\\u0645\\u0644\\u0646\\u0640\\u0627 \\u0641\\u0640\\u064a \\u0627\\u0644\\u0645\\u062c\\u0640\\u0627\\u0644 \\u0627\\u0644\\u062e\\u062f\\u0645\\u064a\\r\\n\\u062a\\u0623\\u0633\\u0633\\u0640\\u062a \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0641\\u0640\\u064a  07\\u0627\\u0628\\u0631\\u064a\\u0640\\u0644  2007\\u0643\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0630\\u0627\\u062a \\u0645\\u0633\\u0640\\u0626\\u0648\\u0644\\u064a\\u0629 \\u0645\\u062d\\u0640\\u062f\\u0648\\u062f\\u0629 \\u0648\\u0647\\u0640\\u0630\\u0647\\r\\n\\u0651 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u0644\\u0640\\u0645 \\u062a\\u0643\\u0640\\u0646 \\u0645\\u062c\\u0640\\u0631\\u062f \\u0641\\u0643\\u0640\\u0631\\u0629 \\u0641\\u062d\\u0633\\u0640\\u0628 \\u0628\\u0640\\u0644 \\u0642\\u0627\\u0645\\u0640\\u062a \\u0645\\u0628\\u0646\\u064a\\u0640\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u062e\\u0637\\u0640\\u0637 \\u0625\\u0633\\u0640\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u0629 \\u062a\\u062d\\u0644\\u0640\\u062a \\u0628\\u0627\\u0644\\u0625\\u0635\\u0640\\u0631\\u0627\\u0631\\r\\n\\u0648\\u0627\\u0644\\u062a\\u0646\\u0627\\u0641\\u0633\\u0640\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0628\\u0642\\u0640\\u0627\\u0621 \\u0645\\u0645\\u0640\\u0627 \\u064a\\u0624\\u0647\\u0644\\u0647\\u0640\\u0627 \\u0625\\u0644\\u0640\\u0649 \\u062a\\u062d\\u0642\\u064a\\u0640\\u0642 \\u0631\\u0624\\u064a\\u062a\\u0647\\u0640\\u0627 \\u0627\\u0644\\u0645\\u0633\\u0640\\u062a\\u0642\\u0628\\u0644\\u064a\\u0629.\\r\\n\\u062a\\u0633\\u0640\\u0640\\u0639\\u0649 \\u0634\\u0640\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u0640\\u062a\\u064a\\u0629 \\u0644\\u062a\\u0635\\u0640\\u0640\\u062f\\u0631 \\u0642\\u0637\\u0640\\u0640\\u0627\\u0639 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0645\\u0640\\u0640\\u0629 \\u0627\\u0644\\u0645\\u062a\\u0646\\u0627\\u0645\\u0640\\u0640\\u064a \\u0641\\u0640\\u0640\\u064a \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0640\\u0640\\u0629\\r\\n\\u0645\\u0640\\u0639 \\u0646\\u0638\\u0640\\u0631\\u0629 \\u0628\\u0639\\u064a\\u0640\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0640\\u062f\\u0649 \\u0641\\u0640\\u064a \\u0627\\u0644\\u0623\\u0641\\u0640\\u0642 \\u062a\\u062c\\u0640\\u0627\\u0647 \\u0627\\u0644\\u062f\\u062e\\u0640\\u0648\\u0644 \\u0644\\u0644\\u0623\\u0633\\u0640\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0640\\u0629. \\u0645\\u0640\\u0646 \\u062e\\u0640\\u0644\\u0627\\u0644 \\u0631\\u0623\\u0633 \\u0645\\u0640\\u0627\\u0644  2\\u0645\\u0644\\u064a\\u0640\\u0648\\u0646 \\u062f\\u064a\\u0646\\u0640\\u0627\\u0631\\r\\n\\u0643\\u0648\\u064a\\u062a\\u0640\\u0640\\u064a \\u064a\\u062a\\u0640\\u0640\\u0645 \\u0627\\u0633\\u0640\\u0640\\u062a\\u062b\\u0645\\u0627\\u0631\\u0647 \\u0641\\u0640\\u0640\\u064a \\u0642\\u0637\\u0640\\u0640\\u0627\\u0639 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0645\\u0640\\u0640\\u0629 \\u0627\\u0644\\u0642\\u0635\\u064a\\u0640\\u0640\\u0631 \\u0648\\u0627\\u0644\\u0645\\u062a\\u0648\\u0633\\u0640\\u0640\\u0637 \\u0648\\u0627\\u0644\\u0637\\u0648\\u064a\\u0640\\u0640\\u0644 \\u0627\\u0644\\u0645\\u0640\\u0640\\u062f\\u0649.\\r\\n\\u0648\\u0636\\u0639\\u0640\\u062a \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0647\\u062f\\u0641\\u0640\\u0627\\u064b \\u0623\\u0633\\u0627\\u0633\\u0640\\u064a\\u0627\\u064b \\u0646\\u0635\\u0640\\u0628 \\u0623\\u0639\\u064a\\u0646\\u0647\\u0640\\u0627 \\u064a\\u062a\\u0645\\u062b\\u0640\\u0644 \\u0641\\u0640\\u064a \\u0627\\u0644\\u062a\\u0648\\u0633\\u0640\\u0639 \\u0627\\u0644\\u062c\\u063a\\u0631\\u0627\\u0641\\u064a\\r\\n\\u0648\\u0627\\u0644\\u0625\\u0642\\u0644\\u064a\\u0645\\u0640\\u064a \\u0648\\u0627\\u0644\\u062f\\u062e\\u0640\\u0648\\u0644 \\u0641\\u0640\\u064a \\u0645\\u0646\\u0627\\u0642\\u0635\\u0640\\u0627\\u062a \\u0648\\u0639\\u0642\\u0640\\u0648\\u062f \\u0643\\u0628\\u064a\\u0640\\u0631\\u0629 \\u0648\\u0647\\u0640\\u0630\\u0627 \\u064a\\u0635\\u0640\\u0628 \\u0641\\u0640\\u064a \\u0645\\u0635\\u0644\\u062d\\u062a\\u0647\\u0640\\u0627 \\u0648\\u064a\\u0639\\u0645\\u0640\\u0644 \\u0639\\u0644\\u0640\\u0649 \\u062f\\u0641\\u0640\\u0639 \\u0639\\u062c\\u0644\\u0640\\u0629\\r\\n\\u0627\\u0644\\u062a\\u0646\\u0645\\u064a\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0627\\u0642\\u062a\\u0635\\u0627\\u062f\\u0648\\u062a\\u062a\\u0640\\u0645 \\u062a\\u0637\\u0648\\u064a\\u0631\\u0647\\u0640\\u0627 \\u062a\\u0642\\u0640\\u0648\\u0645 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u062a\\u0646\\u0641\\u064a\\u0640\\u0630 \\u0639\\u0642\\u0640\\u0648\\u062f \\u0648\\u0645\\u0646\\u0627\\u0642\\u0635\\u0640\\u0627\\u062a \\u0628\\u0642\\u064a\\u0645\\u0640\\u0629  15\\u0645\\u0644\\u064a\\u0640\\u0648\\u0646 \\u062f\\u064a\\u0646\\u0640\\u0627\\u0631\\r\\n\\u0643\\u0648\\u064a\\u062a\\u0640\\u064a \\u0645\\u0640\\u0639 \\u0627\\u0644\\u0639\\u062f\\u064a\\u0640\\u062f \\u0645\\u0640\\u0646 \\u0648\\u0632\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u062f\\u0648\\u0644\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0624\\u0633\\u0633\\u0640\\u0627\\u062a \\u0648\\u0627\\u0644\\u062c\\u0647\\u0640\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u062a\\u0634\\u0640\\u062a\\u0645\\u0644 \\u0639\\u0644\\u0640\\u0649 \\u062a\\u0646\\u0641\\u064a\\u0640\\u0630 \\u0648\\u062a\\u062c\\u0647\\u064a\\u0640\\u0632\\r\\n\\u0623\\u0639\\u0645\\u0640\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0646\\u0638\\u064a\\u0640\\u0641 \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0648\\u0627\\u0644\\u0636\\u064a\\u0627\\u0641\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0631\\u0627\\u0633\\u0640\\u0644\\u0629 \\u0648\\u062d\\u0631\\u0627\\u0633\\u0640\\u0629 \\u0627\\u0644\\u0645\\u0646\\u0634\\u0640\\u0622\\u062a\"}]', 0, '', ''),
(27, 17, 'en', 'شركة-الكهرباء-و-الماء', ' Ministry of Electricity and Water', '', '', '1558348469_Image-1.jpg', NULL, 0, '', ''),
(28, 17, 'ar', 'شركة-الكهرباء-و-الماء', 'شركة الكهرباء والماء', '', '', '1558348470_Image-1.jpg', NULL, 0, '', ''),
(31, 27, 'en', 'about-usss', 'About usss', '', '', NULL, NULL, 0, '', ''),
(32, 27, 'ar', 'Cleaning-Security-and-guard-facilities', 'Cleaning Security and guard facilities', '', '', NULL, NULL, 0, '', ''),
(33, 28, 'en', 'ships-unloading-&-loading-security-devices-&-installation-&-maintenance', 'SHIPS UNLOADING & LOADING SECURITY DEVICES & INSTALLATION & MAINTENANCE', '', '', NULL, NULL, 0, '', ''),
(34, 28, 'ar', 'SHIPS-UNLOADING-&-LOADING-SECURITY-DEVICES-&-INSTALLATION-&-MAINTENANCE', 'SHIPS UNLOADING & LOADING SECURITY DEVICES & INSTALLATION & MAINTENANCE', '', '', NULL, NULL, 0, '', ''),
(37, 30, 'en', 'about-usss', 'About usss', '<p>Mustafa AdelMustafa AdelMustafa Adel<br></p>', '', '1558527997_teaser_ceo_370.jpg', '[{\"brief\":\"Mustafa Adel\",\"secondary_img\":\"\"}]', 0, '', ''),
(38, 30, 'ar', 'مصطفى-عادل', 'مصطفى عادل ', '<p>مصطفى عادل مصطفى عادل مصطفى عادل <br></p>', '', '1558527950_EEA_Pic.jpg', '[{\"brief\":\"\\u0645\\u0635\\u0637\\u0641\\u0649 \\u0639\\u0627\\u062f\\u0644 \",\"secondary_img\":\"\"}]', 0, '', ''),
(39, 31, 'en', 'gvmghj', 'gvmghj', '<p>sethsethsehrsehr</p>', '', '1558528063_EEA_Pic.jpg', '[{\"brief\":\"erthsehseh\",\"secondary_img\":\"\"}]', 0, '', ''),
(40, 31, 'ar', 'stehsehts', 'stehsehts', '<p>sehserhserhserhehrserh</p>', '', '1558528063_images.jpg', '[{\"brief\":\"serhserhserh\",\"secondary_img\":\"\"}]', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `post_configs`
--

CREATE TABLE `post_configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `ordered` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `post_configs`
--

INSERT INTO `post_configs` (`id`, `module_id`, `parent_id`, `ordered`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, 1, '2017-09-24 23:03:55', '2017-09-24 23:03:55'),
(2, 3, 0, 2, 1, 1, '2018-03-04 23:17:41', '2019-04-29 15:12:50'),
(3, 3, 0, 1, 1, 1, '2018-03-04 23:21:05', '2019-04-29 15:12:50'),
(4, 3, 0, 3, 1, 1, '2018-03-04 23:23:56', '2019-04-29 15:12:50'),
(5, 4, 0, 1, 1, 1, '2018-07-09 11:05:12', '2018-07-09 11:05:12'),
(6, 5, 0, 1, 1, 1, '2018-09-04 11:50:30', '2018-09-04 11:50:30'),
(12, 2, 0, 4, 0, 1, '2019-04-29 18:27:30', '2019-04-29 18:27:30'),
(13, 6, 0, 1, 1, 1, '2019-05-02 02:23:51', '2019-05-02 02:23:51'),
(14, 7, 0, 1, 1, 4, '2019-05-20 08:50:12', '2019-05-20 08:50:12'),
(15, 8, 0, 1, 1, 4, '2019-05-20 09:17:46', '2019-05-20 09:17:46'),
(16, 10, 0, 1, 0, 4, '2019-05-20 09:52:15', '2019-05-20 09:52:15'),
(17, 11, 0, 1, 0, 4, '2019-05-20 10:34:29', '2019-05-20 10:34:29'),
(27, 13, 0, 1, 0, 4, '2019-05-21 06:43:09', '2019-05-21 06:43:09'),
(28, 13, 0, 2, 0, 4, '2019-05-21 06:57:55', '2019-05-21 06:57:55'),
(30, 14, 27, 2, 0, 4, '2019-05-22 12:25:50', '2019-05-22 12:25:50'),
(31, 14, 27, 2, 0, 4, '2019-05-22 12:27:43', '2019-05-22 12:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `post_files`
--

CREATE TABLE `post_files` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `name` varchar(70) NOT NULL,
  `size` int(11) NOT NULL,
  `ext` varchar(40) NOT NULL,
  `section` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `name_ar` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `status`, `name_ar`, `name_en`, `slug`, `parent`) VALUES
(1, 1, 'مدينة الكويت', 'Kuwait City', '', 0),
(2, 1, 'الفروانية', 'Farwaniya', '', 0),
(3, 1, 'مبارك الكبير', 'Mubarak Al Kabir', '', 0),
(4, 1, 'حولي', 'Hawally', '', 0),
(5, 1, 'الأحمدي', 'Ahmadi', '', 0),
(6, 1, 'الجهراء', 'Jahra', '', 0),
(7, 0, 'العديلية', 'Adailiya', '', 1),
(8, 0, 'بنيد القار', 'Bneid Al Qar', '', 1),
(9, 0, 'الدعية', 'Daiya', '', 1),
(10, 0, 'الفيحاء', 'Faiha', '', 1),
(11, 0, 'دسمان', 'Dasman', '', 1),
(12, 0, 'غرناطة', 'Granada', '', 1),
(13, 0, 'جابر الأحمد', 'Jaber Al Ahmad', '', 1),
(14, 0, 'قبلة', 'Jibla', '', 1),
(15, 0, 'كيفان', 'Kaifan', '', 1),
(16, 0, 'الخالدية', 'Khaldiya', '', 1),
(17, 0, 'مدينة الكويت', 'Kuwait City', '', 1),
(18, 0, 'المنطقة الحرة', 'Kuwait Free Trade Zone', '', 1),
(19, 0, 'المنصورية', 'Mansouriya', '', 1),
(20, 0, 'المرقاب', 'Mirqab', '', 1),
(21, 0, 'معسكرات المباركية', 'Mubarekiya Camps and Collages', '', 1),
(22, 0, 'النهضة', 'Nahdha', '', 1),
(23, 0, 'شمال غرب الصليبيخات', 'North West Al-Sulaibikhat', '', 1),
(24, 0, 'النزهة', 'Nuzha', '', 1),
(25, 0, 'القادسية', 'Qadsiya', '', 1),
(26, 0, 'القيروان', 'Qairawan', '', 1),
(27, 0, 'قرطبة', 'Qortuba', '', 1),
(28, 0, 'الروضة', 'Rawda', '', 1),
(29, 0, 'صالحية', 'Salhiya', '', 1),
(30, 0, 'الشامية', 'Shamiya', '', 1),
(31, 0, 'شرق', 'Sharq', '', 1),
(32, 0, 'شويخ الإدارية', 'Shuwaikh Administrative', '', 1),
(33, 0, 'شويخ السكنية', 'Shuwaikh Industrial', '', 1),
(34, 0, 'شويخ الصناعية 1', 'Shuwaikh Industrial 1', '', 1),
(35, 0, 'شويخ الصناعية 2', 'Shuwaikh Industrial 2', '', 1),
(36, 0, 'شويخ الصناعية 3', 'Shuwaikh Industrial 3', '', 1),
(37, 0, 'الصليبيخات', 'Sulaibikhat', '', 1),
(38, 0, 'السرة', 'Surra', '', 1),
(39, 0, 'اليرموك', 'Yarmouk', '', 1),
(40, 0, 'عباسيه', 'Abbasiya', '', 2),
(41, 0, 'عبدالله المبارك - غرب الجليب', 'Abdullah Al Mubarak Al Sabah', '', 2),
(42, 0, 'أبرق خيطان', 'Abraq Khaitan', '', 2),
(43, 0, 'المطار', 'Airport', '', 2),
(44, 0, 'الضجيج', 'Al-Dajeej', '', 2),
(45, 0, 'الشدادية', 'Al-Shadadiya', '', 2),
(46, 0, 'الأندلس', 'Andalous', '', 2),
(47, 0, 'العارضية', 'Ardiya', '', 2),
(48, 0, 'عارضية الصناعية', 'Ardiya Small Industrial', '', 2),
(49, 0, 'عارضية مخازن', 'Ardiya Storage Zone', '', 2),
(50, 0, 'الدوحة', 'Doha', '', 2),
(51, 0, 'الفروانية', 'Farwaniya', '', 2),
(52, 0, 'الفردوس', 'Firdous', '', 2),
(53, 0, 'أشبيليا', 'Ishbiliya', '', 2),
(54, 0, 'جليب الشيوخ', 'Jeleeb Al-Shuyoukh', '', 2),
(55, 0, 'خيطان', 'Khaitan', '', 2),
(56, 0, 'مطار الكويت الدولي', 'Kuwait International Airport', '', 2),
(57, 0, 'العمرية', 'Omariya', '', 2),
(58, 0, 'الرابية', 'Rabia', '', 2),
(59, 0, 'الري', 'Rai', '', 2),
(60, 0, 'الرحاب', 'Rehab', '', 2),
(61, 0, 'الرقعي', 'Rigai', '', 2),
(62, 0, 'صباح الناصر', 'Sabah Al Nasser', '', 2),
(63, 0, 'مبنى الشيخ سعد للطيران العام', 'Sheikh Saad Aviation Terminal', '', 2),
(64, 0, 'منطقة المعارض جنوب خيطان', 'South Khaitan - Exhibits', '', 2),
(65, 0, 'أبو الحصانية', 'Abu Al Hasaniya', '', 3),
(66, 0, 'أبو فطيرة', 'Abu Fatira', '', 3),
(67, 0, 'العدان', 'Adan', '', 3),
(68, 0, 'المسايل', 'Al-Masayel', '', 3),
(69, 0, 'الشريط الساحلى', 'Coast Strip B', '', 3),
(70, 0, 'فنيطيس', 'Fnaitees', '', 3),
(71, 0, 'المسيله', 'Messila', '', 3),
(76, 0, 'مبارك الكبير', 'Mubarak Al Kabeer', '', 3),
(77, 0, 'القرين', 'Qurain', '', 3),
(78, 0, 'القصور', 'Qusor', '', 3),
(79, 0, 'صباح السالم', 'Sabah Al Salem', '', 3),
(80, 0, 'البدع', 'Al-Bidea', '', 4),
(81, 0, 'الصديق', 'Al-Siddeeq', '', 4),
(82, 0, 'أنجفة', 'Anjafa', '', 4),
(83, 0, 'بيان', 'Bayan', '', 4),
(84, 0, 'حطين', 'Hateen', '', 4),
(85, 0, 'حولي', 'Hawally', '', 4),
(86, 0, 'الجابرية', 'Jabriya', '', 4),
(87, 0, 'ميدان حولي', 'Maidan Hawally', '', 4),
(88, 0, 'مشرف', 'Mishref', '', 4),
(89, 0, 'مبارك العبدالله - غرب مشرف', 'Mubarak Al-Abdullah', '', 4),
(90, 0, 'الرميثية', 'Rumaithiya', '', 4),
(91, 0, 'السلام', 'Salam', '', 4),
(92, 0, 'السالمية', 'Salmiya', '', 4),
(93, 0, 'سلوى', 'Salwa', '', 4),
(94, 0, 'الشعب', 'Shaab', '', 4),
(95, 0, 'الشهداء', 'Shuhada', '', 4),
(96, 0, 'الزهراء', 'Zahra', '', 4),
(97, 0, 'أبو حليفة', 'Abu Halifa', '', 5),
(98, 0, 'الأحمدي', 'Ahmadi', '', 5),
(99, 0, 'الجليعة', 'Al-Julaia\'a', '', 5),
(100, 0, 'الخيران', 'Al Khiran', '', 5),
(101, 0, 'الرقة', 'Al-Riqqa', '', 5),
(102, 0, 'الزور', 'Zour', '', 5),
(103, 0, 'الشعيبة الصناعية الغربية', 'West Industrial Shuaiba', '', 5),
(104, 0, 'الشعيبة قطعه 1', 'Shuaiba Block 1', '', 5),
(105, 0, 'الصباحية', 'Assabahiyah', '', 5),
(106, 0, 'الضباعية', 'Shalayhat Al Dubaiya', '', 5),
(107, 0, 'الظهر', 'Al Dahar', '', 5),
(108, 0, 'العقيلة', 'Eqaila', '', 5),
(109, 0, 'الفحيحيل', 'Fahaheel', '', 5),
(110, 0, 'الفنطاس', 'Fintas', '', 5),
(111, 0, 'المنقف', 'Mangaf', '', 5),
(112, 0, 'المهبولة', 'Mahboula', '', 5),
(113, 0, 'النويصيب', 'Al-Nuwaiseeb', '', 5),
(114, 0, 'الوفرة', 'Al Wafrah', '', 5),
(115, 0, 'بنيدر', 'Bnaider', '', 5),
(116, 0, 'جابر العلي', 'Jaber Al Ali', '', 5),
(117, 0, 'شاليهات ميناء عبدالله', 'Shalayhat Mina Abdullah', '', 5),
(118, 0, 'صباح الأحمد', 'Sabah Al Ahmad', '', 5),
(119, 0, 'علي صباح السالم', 'Ali Sabah Al Salem', '', 5),
(120, 0, 'فهد الأحمد', 'Fahad Al Ahmad', '', 5),
(121, 0, 'هدية', 'Hadiya', '', 5),
(122, 0, 'الصليبية الصناعية 1', 'Al Sulaibiya Industrial 1', '', 6),
(123, 0, 'الصليبية الصناعية 2', 'Al Sulaibiya Industrial 2', '', 6),
(124, 0, 'منطقة أمغرة الصناعية', 'Amgarah Industrial Area', '', 6),
(125, 0, 'الجهراء', 'Jahra', '', 6),
(126, 0, 'الواحة', 'Waha', '', 6),
(127, 0, 'النسيم', 'Naseem', '', 6),
(128, 0, 'العيون', 'Oyoun', '', 6),
(129, 0, 'القصر', 'Qasr', '', 6),
(130, 0, 'سعد العبدالله', 'Saad Al Abdullah', '', 6),
(131, 0, 'الصليبية', 'Sulaibiya', '', 6),
(132, 0, 'تيماء', 'Taima', '', 6),
(302, 0, 'صبحان الصناعية', 'Sabhan Industrial Area', '', 3),
(303, 0, 'جنوب وسطى', 'South Wista', '', 3),
(304, 0, 'غرب أبو فطيرة الصناعية', 'West Abu Fatira Small Industrial', '', 3),
(305, 0, 'وسطى', 'Wista', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name_en`, `name_ar`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Root', 'روت', 'root', '2017-05-18 03:00:00', NULL),
(2, 'Administrator', 'مدير', 'administrator', '2017-05-18 03:00:00', NULL),
(3, 'Marketing', 'تسويق', 'marketing', '2017-05-18 03:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city_id` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `is_active`, `email`, `password`, `first_name`, `last_name`, `avatar`, `gender`, `phone`, `address`, `city_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'admin@interteleco.com', '$2y$10$x3irs5cfLxIWJL1nStzfB.qeRiG5v8G7hcYj6Ugnt586vAAa.G3IC', 'Admin', 'interteleco', '1556561447_1501858055_avatar5.png', 0, '', '', 0, 'BcshVWfdp4pzw4NkAaSuddqmpYoFbnTfBn6bId6L49ScrdzheQ5L2AptW6vj', '2017-05-18 03:00:00', '2019-05-21 07:26:11'),
(2, 2, 1, 'admin@gad.com', '$2y$10$gEvCTKnomWuVwia3Wzxn0.77BpThJdveZJNi/PFuupJC1u0nrbmX6', 'Admin', 'Gad', '1556561367_100_100_1501858055_avatar5.png', 0, '', '', 0, 'TDWukKo4PtkXNnwSZtL0PKkYyXgG4sddxRBLt9M5iFcjYlLYv9YC4AP5aQJG', '2017-08-03 09:27:07', '2019-05-02 03:55:31'),
(3, 3, 1, 'ahmed@interteleco.com', '$2y$10$TgMRNj8BMDtHyzeVRO8ek.KrZSPUZHTRr1bn2MfWcGM7Kguc5mJK6', 'Ahmed', 'Hassan', 'default_avatar_male.png', 0, '', '', 0, 'jc2FEuuksEHPQR1HzdFsN2qLcwiQtjDDFUjHu85rE6uA5q6oAMQys8NNQK3V', '2019-05-01 19:19:27', '2019-05-20 10:55:40'),
(4, 1, 1, 'moustafa.adel@smsbox.com', '$2y$10$bg/m2E7rFS2fi97PHS4QIeYAyzHL5Cl55FXRSN.6kO1blE/XDfnWq', 'Mustafa', 'adel', 'default_avatar_male.png', 0, '', '', 0, NULL, '2019-05-20 08:22:47', '2019-05-20 08:22:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_configs`
--
ALTER TABLE `post_configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_files`
--
ALTER TABLE `post_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `post_configs`
--
ALTER TABLE `post_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `post_files`
--
ALTER TABLE `post_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=306;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
