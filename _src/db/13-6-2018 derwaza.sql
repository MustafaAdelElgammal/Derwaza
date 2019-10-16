-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2019 at 05:55 PM
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
(1, '', 'moustafa.adel@smsbox.com', '92345123', '', 'en', 'en,ar', 'ar', 1, '<script async src=\"https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID\"></script>\r\n<script>\r\n  window.dataLayer = window.dataLayer || [];\r\n  function gtag(){dataLayer.push(arguments);}\r\n  gtag(\'js\', new Date());\r\n\r\n  gtag(\'config\', \'GA_MEASUREMENT_ID\');\r\n</script>', '', 'a:6:{i:1;a:2:{s:4:\"site\";s:8:\"Facebook\";s:4:\"link\";s:27:\"http://Facebook.com/Derwaza\";}i:2;a:2:{s:4:\"site\";s:7:\"Twitter\";s:4:\"link\";s:26:\"http://Twitter.com/Derwaza\";}i:3;a:2:{s:4:\"site\";s:9:\"Instagram\";s:4:\"link\";s:0:\"\";}i:4;a:2:{s:4:\"site\";s:7:\"Youtube\";s:4:\"link\";s:0:\"\";}i:5;a:2:{s:4:\"site\";s:10:\"GooglePlus\";s:4:\"link\";s:0:\"\";}i:6;a:2:{s:4:\"site\";s:5:\"Gmail\";s:4:\"link\";s:28:\"http://www.gmail.com/derwasa\";}}', '0000-00-00 00:00:00', '2019-06-11 13:08:53', 'config'),
(2, 'Al-Darwaza Company for Logistics Services', '', '', '', ' ', ' ', ' ', 0, '', 'sdvsd', NULL, '2016-07-15 22:31:03', '2019-06-10 09:32:48', 'en'),
(3, 'الدروازة للخدمات اللوجستية', '', '', '', ' ', ' ', ' ', 0, '', 'vsdv', NULL, '2017-04-28 01:15:54', '2019-06-10 09:32:48', 'ar');

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
(10, 'Chairman\'s  message', 'كلمة رئيس مجلس الإدارة', 'chairmans_message', 'fa-user', 'style_1', '1', 0, '1', '0', '0', '1', '1600_800', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"summary\",\"type\":\"textarea\",\"name_en\":\"Chairman\'s speech\",\"name_ar\":\"\\u0643\\u0644\\u0645\\u0629 \\u0631\\u0626\\u064a\\u0633 \\u0645\\u062c\\u0644\\u0633 \\u0627\\u0644\\u0625\\u062f\\u0627\\u0631\\u0629\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"brief\",\"type\":\"textarea\",\"name_en\":\"About Company(brief)\",\"name_ar\":\"\\u0646\\u0628\\u0630\\u0629 \\u0645\\u062e\\u062a\\u0635\\u0631\\u0629 \\u0639\\u0646 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"brief\",\"rule_val\":\"required|max:300\",\"rule_val_edit\":\"required|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:30\",\"rule_val_edit\":\"required|max:30\"},{\"rule_key\":\"summary\",\"rule_val\":\"required|max:2000\",\"rule_val_edit\":\"required|max:2000\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"}]]', '[{\"name\":{\"name_en\":\"CEO Founder\",\"name_ar\":\"\\u0627\\u0644\\u0631\\u0626\\u064a\\u0633 \\u0627\\u0644\\u062a\\u0646\\u0641\\u064a\\u0630\\u064a\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"upload  photo\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629\"}}]'),
(11, 'Clients', 'عملاؤنا', 'clients', 'fa-user', 'style_2', '1', 1, '1', '0', '0', '1', '111_110', '0', 0, 0, 1, 0, 0, '0', 0, NULL, '0', '1', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required|max:57\",\"rule_val_edit\":\"required|max:57\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"}]]', '[{\"name\":{\"name_en\":\"client Name\",\"name_ar\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0639\\u0645\\u064a\\u0644\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"upload  photo\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629\"}}]'),
(13, 'Sector category', 'فئة القطاع', 'sector_category', 'fa-user', 'style_3', '1', 1, '1', '0', '0', '0', '', '0', 0, 0, 1, 0, 0, '0', 0, NULL, '0', '0', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"}]]', '[{\"name\":{\"name_en\":\"Sector Name\",\"name_ar\":\"\\u0627\\u0633\\u0645 \\u0627\\u0644\\u0642\\u0637\\u0627\\u0639\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(14, 'Sectors', 'القطاعات', 'sectors', 'fa-shield', 'style_1', '1', 1, '1', '1', '0', '1', '1600_800', '0', 0, 0, 1, 1, 13, '0', 1, '[{\"key\":\"brief\",\"type\":\"text\",\"name_en\":\"Brief\",\"name_ar\":\"\\u0639\\u0646 \\u0627\\u0644\\u0642\\u0637\\u0627\\u0639\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"secondary_img\",\"type\":\"image\",\"name_en\":\"Secondary image\",\"name_ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u062b\\u0627\\u0646\\u0648\\u064a\\u0629\",\"class\":\"\",\"sizes\":\"300_300\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"secondary_img\",\"rule_val\":\"mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"short\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"},{\"rule_key\":\"brief\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"},{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0627\\u0644\\u0639\\u0646\\u0648\\u0627\\u0646\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"description\",\"name_ar\":\"\\u0627\\u0644\\u0648\\u0635\\u0641\"},\"upload\":{\"name_en\":\"Main Photo\",\"name_ar\":\"\\u0627\\u0644\\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\"}}]'),
(16, 'Organization chart', 'الهيكل التنظيمي', 'organization_chart', 'fa-shield', 'style_1', '0', 0, '1', '0', '0', '1', '1920_866', '0', 1, 0, 0, 0, 0, '0', 0, NULL, '0', '0', 1, '[[{\"rule_key\":\"upload\",\"rule_val\":\"required|mimes:jpeg,jpg,png|max:300\",\"rule_val_edit\":\"mimes:jpeg,jpg,png|max:300\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0627\\u0644\\u0639\\u0646\\u0648\\u0627\\u0646\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"Insert organization chart\",\"name_ar\":\"\\u0627\\u0631\\u0641\\u0627\\u0642 \\u0635\\u0648\\u0631\\u0629 \\u0627\\u0644\\u0647\\u064a\\u0643\\u0644 \\u0627\\u0644\\u062a\\u0646\\u0638\\u064a\\u0645\\u064a\"}}]'),
(18, 'News', 'الاخبار', 'news', 'fa-shield', 'style_1', '1', 1, '1', '1', '0', '0', '', '0', 0, 0, 1, 0, 0, '0', 1, '[{\"key\":\"brief\",\"type\":\"text\",\"name_en\":\"Brief\",\"name_ar\":\"\\u0645\\u062e\\u062a\\u0635\\u0631 \\u0627\\u0644\\u062e\\u0628\\u0631\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"},{\"rule_key\":\"short\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"},{\"rule_key\":\"brief\",\"rule_val\":\"required|max:157\",\"rule_val_edit\":\"required|max:157\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u062e\\u0628\\u0631\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"Description\",\"name_ar\":\"\\u062a\\u0641\\u0627\\u0635\\u064a\\u0644 \\u0627\\u0644\\u062e\\u0628\\u0631\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(19, 'Contact', 'تواصل معنا', 'contact', 'fa-shield', 'style_2', '0', 0, '1', '0', '0', '0', '', '0', 1, 0, 1, 0, 0, '0', 1, '[{\"key\":\"long\",\"type\":\"text\",\"name_en\":\"Long\",\"name_ar\":\"\\u0627\\u062d\\u062f\\u0627\\u062b\\u064a\\u0627\\u062a \\u0627\\u0644\\u0637\\u0648\\u0644\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"},{\"key\":\"lat\",\"type\":\"text\",\"name_en\":\"Lat\",\"name_ar\":\"\\u0627\\u062d\\u062f\\u0627\\u062b\\u064a\\u0627\\u062a \\u0627\\u0644\\u0639\\u0631\\u0636\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"lat\",\"rule_val\":\"required|max:8\",\"rule_val_edit\":\"required|max:8\"},{\"rule_key\":\"long\",\"rule_val\":\"required|max:8\",\"rule_val_edit\":\"required|max:8\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Company address\",\"name_ar\":\"\\u0639\\u0646\\u0648\\u0627\\u0646 \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]');

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
(19, 13, 'en', 'test', '| Derwaza Logistics Company |', '', '', NULL, '[{\"slider_description\":\"| Derwaza Logistics Company | | Derwaza Logistics Company |\"}]', 0, '', ''),
(20, 13, 'ar', 'test', '|شركة الدروازة للخدمات اللوجيستية|', '', '', NULL, '[{\"slider_description\":\"|\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u064a\\u0633\\u062a\\u064a\\u0629| |\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u064a\\u0633\\u062a\\u064a\\u0629|\"}]', 0, '', ''),
(21, 14, 'en', 'main-mission', '', '', '', NULL, '[{\"our_mission\":\"Provide our customers a level of services unequalled in the Electricity, cleaning, Security & Security Devices<br>\\r\\nNursing and agriculture industry.\\r\\n Develop an organization that will encourage all people to prosper and grow to their full potential\\r\\n Protect the health and safety of all our people.\",\"our_vission\":\"We strive to become the leading service provider in the industry.\\r\\n We aim to become the supplier of choice for all our client\"}]', 0, '', ''),
(22, 14, 'ar', 'main-mission', '', '', '', NULL, '[{\"our_mission\":\"\\u0646\\u0648\\u0641\\u0631 \\u0644\\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0645\\u0646 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u062a\\u064a \\u0644\\u0627 \\u062a\\u0636\\u0627\\u0647\\u0649 \\u0641\\u064a \\u0623\\u062c\\u0647\\u0632\\u0629 \\u0627\\u0644\\u0643\\u0647\\u0631\\u0628\\u0627\\u0621 \\u0648\\u0627\\u0644\\u062a\\u0646\\u0638\\u064a\\u0641 \\u0648\\u0627\\u0644\\u0623\\u0645\\u0646 \\u0648\\u0627\\u0644\\u062d\\u0645\\u0627\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u0645\\u0631\\u064a\\u0636 \\u0648\\u0627\\u0644\\u0632\\u0631\\u0627\\u0639\\u0629. \\u0642\\u0645 \\u0628\\u062a\\u0637\\u0648\\u064a\\u0631 \\u0645\\u0646\\u0638\\u0645\\u0629 \\u062a\\u0634\\u062c\\u0639 \\u062c\\u0645\\u064a\\u0639 \\u0627\\u0644\\u0646\\u0627\\u0633 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u0627\\u0632\\u062f\\u0647\\u0627\\u0631 \\u0648\\u0627\\u0644\\u0646\\u0645\\u0648 \\u0625\\u0644\\u0649 \\u0623\\u0642\\u0635\\u0649 \\u0625\\u0645\\u0643\\u0627\\u0646\\u0627\\u062a\\u0647\\u0645. \\u062d\\u0645\\u0627\\u064a\\u0629 \\u0635\\u062d\\u0629 \\u0648\\u0633\\u0644\\u0627\\u0645\\u0629 \\u062c\\u0645\\u064a\\u0639 \\u0623\\u0641\\u0631\\u0627\\u062f \\u0634\\u0639\\u0628\\u0646\\u0627.\",\"our_vission\":\"\\u0646\\u062d\\u0646 \\u0646\\u0633\\u0639\\u0649 \\u062c\\u0627\\u0647\\u062f\\u064a\\u0646 \\u0644\\u0646\\u0635\\u0628\\u062d \\u0645\\u0642\\u062f\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0629 \\u0627\\u0644\\u0631\\u0627\\u0626\\u062f \\u0641\\u064a \\u0647\\u0630\\u0647 \\u0627\\u0644\\u0635\\u0646\\u0627\\u0639\\u0629\\r\\n\\u0646\\u062d\\u0646 \\u0646\\u0647\\u062f\\u0641 \\u0625\\u0644\\u0649 \\u0623\\u0646 \\u0646\\u0635\\u0628\\u062d \\u0627\\u0644\\u0645\\u0648\\u0631\\u062f \\u0627\\u0644\\u0645\\u0641\\u0636\\u0644 \\u0644\\u062c\\u0645\\u064a\\u0639 \\u0639\\u0645\\u0644\\u0627\\u0626\\u0646\\u0627\"}]', 0, '', ''),
(23, 15, 'en', '', 'ISO certifications', '', '', NULL, '[{\"certificate_1\":\"1560267636_download.jpg\",\"certificate_2\":\"1560267636_download1.jpg\",\"certificate_3\":\"1560267636_download2.png\",\"brief\":\"In order to ensure that our vision is achieved efficiently and high quality, the company obtained the ISO International Certificate\"}]', 0, '', ''),
(24, 15, 'ar', '', 'شهادات الايزو', '', '', NULL, '[{\"certificate_1\":\"1560267636_download.jpg\",\"certificate_2\":\"1560267636_download1.jpg\",\"certificate_3\":\"1560267636_download2.png\",\"brief\":\"\\u0648 \\u0644\\u0636\\u0645\\u0627\\u0646 \\u062a\\u062d\\u0642\\u064a\\u0642 \\u0631\\u0624\\u064a\\u062a\\u0646\\u0627 \\u0628\\u0643\\u0641\\u0627\\u0621\\u0629 \\u0648\\u062c\\u0648\\u062f\\u0629 \\u0639\\u0627\\u0644\\u064a\\u0629 \\u062d\\u0635\\u0644\\u062a \\u0627\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0639\\u0644\\u064a \\u0634\\u0647\\u0627\\u062f\\u0627\\u062a \\u0627\\u0644\\u0627\\u064a\\u0632\\u0648 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0629\"}]', 0, '', ''),
(25, 16, 'en', '', 'Mustafa', '', '', '1560354451_CEO.png', '[{\"summary\":\"The idea of establishing Al-Darwaza Company for Logistics Services has been crystallized\\r\\nin order to provide the government services that the company can do in ministries\\r\\nand state institutions in a better and more efficient manner at a lower cost, which will\\r\\nreflect positively on the performance of government agencies and the development of\\r\\nits services in general.\\r\\nThe company focuses on the valuable opportunities that we believe are achieving our\\r\\nstrategy and the objectives we seek through our work in the field of services.\\r\\nAl-Darwaza Company for Logistics Services seeks to spearhead the growing public\\r\\nservices sector in the region with a long-term view of the global market. With a capital\\r\\nof KD 2 million being invested in the short, medium and long term public services sector.\\r\\nAl-Darwaza Company for Logistics Services has set a key objective in the geographical\\r\\nand regional expansion and to enter into tenders and large contracts. This is in its\\r\\ninterest and works to promote development and economy. The company plans to\\r\\nexecute contracts and tenders worth KD 15 million with many ministries, To carry out\\r\\nthe work of cleaning, services, hospitality, correspondence and guarding facilities.\",\"brief\":\"The idea of establishing Al-Darwaza Company for Logistics Services has been crystallized\\r\\nin order to provide the government services that the company can do in ministries\\r\\nand state institutions in a better and more efficient manner at a lower cost\"}]', 0, '', ''),
(26, 16, 'ar', '', 'مصطفى', '', '', '1560354452_CEO.png', '[{\"summary\":\"\\u062a\\u0628\\u0644\\u0640\\u0648\\u0631\\u0647 \\u0641\\u0643\\u0640\\u0631\\u0629 \\u0625\\u0646\\u0634\\u0640\\u0627\\u0621 \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0628\\u0647\\u0640\\u062f\\u0641 \\u062a\\u0642\\u062f\\u064a\\u0640\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u062a\\u0645\\u0643\\u0646\\r\\n\\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0642\\u064a\\u0640\\u0627\\u0645 \\u0628\\u0647\\u0640\\u0627 \\u0644\\u0640\\u062f\\u0649 \\u0627\\u0644\\u0640\\u0648\\u0632\\u0627\\u0631\\u0627\\u062a \\u0648 \\u0645\\u0624\\u0633\\u0633\\u0640\\u0627\\u062a \\u0627\\u0644\\u062f\\u0648\\u0644\\u0640\\u0629 \\u0628\\u0645\\u0633\\u0640\\u062a\\u0648\\u0649 \\u0623\\u0641\\u0636\\u0640\\u0644 \\u0648 \\u0641\\u0639\\u0627\\u0644\\u064a\\u0640\\u0629 \\u0623\\u0643\\u0628\\u0640\\u0631 \\u0648 \\u0628\\u062a\\u0643\\u0644\\u0641\\u0640\\u0629 \\u0623\\u0642\\u0640\\u0644 \\u060c\\r\\n\\u0645\\u0645\\u0640\\u0627 \\u0633\\u0640\\u064a\\u0646\\u0639\\u0643\\u0633 \\u0628\\u0640\\u062f\\u0648\\u0631\\u0647 \\u0628\\u0634\\u0640\\u0643\\u0644 \\u0625\\u064a\\u062c\\u0627\\u0628\\u0640\\u064a \\u0639\\u0644\\u0640\\u0649 \\u0623\\u062f\\u0627\\u0621 \\u0627\\u0644\\u0627\\u062c\\u0647\\u0640\\u0632\\u0629 \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u0648 \\u062a\\u0637\\u0648\\u064a\\u0640\\u0631 \\u062e\\u062f\\u0645\\u0627\\u062a\\u0647\\u0640\\u0627 \\u0628\\u0634\\u0640\\u0643\\u0644 \\u0639\\u0640\\u0627\\u0645 .\\r\\n\\u0648\\u062a\\u0631\\u0643\\u0640\\u0632 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u0627\\u0644\\u0641\\u0640\\u0631\\u0635 \\u0627\\u0644\\u0645\\u062c\\u062f\\u064a\\u0640\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u0646\\u0640\\u0631\\u0649 \\u0623\\u0646\\u0647\\u0640\\u0627 \\u062a\\u062d\\u0642\\u0640\\u0642 \\u0644\\u0646\\u0640\\u0627 \\u0625\\u0633\\u0640\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u062a\\u0646\\u0627 \\u0648\\u0645\\u0640\\u0627 \\u0646\\u0633\\u0640\\u0639\\u0649 \\u0625\\u0644\\u064a\\u0640\\u0647 \\u0645\\u0640\\u0646 \\u0623\\u0647\\u0640\\u062f\\u0627\\u0641\\r\\n\\u0645\\u0640\\u0646 \\u062e\\u0640\\u0644\\u0627\\u0644 \\u0639\\u0645\\u0644\\u0646\\u0640\\u0627 \\u0641\\u0640\\u064a \\u0627\\u0644\\u0645\\u062c\\u0640\\u0627\\u0644 \\u0627\\u0644\\u062e\\u062f\\u0645\\u064a\\r\\n\\u062a\\u0623\\u0633\\u0633\\u0640\\u062a \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0641\\u0640\\u064a  07\\u0627\\u0628\\u0631\\u064a\\u0640\\u0644  2007\\u0643\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0630\\u0627\\u062a \\u0645\\u0633\\u0640\\u0626\\u0648\\u0644\\u064a\\u0629 \\u0645\\u062d\\u0640\\u062f\\u0648\\u062f\\u0629 \\u0648\\u0647\\u0640\\u0630\\u0647\\r\\n\\u0651 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062a\\u0640\\u064a \\u0644\\u0640\\u0645 \\u062a\\u0643\\u0640\\u0646 \\u0645\\u062c\\u0640\\u0631\\u062f \\u0641\\u0643\\u0640\\u0631\\u0629 \\u0641\\u062d\\u0633\\u0640\\u0628 \\u0628\\u0640\\u0644 \\u0642\\u0627\\u0645\\u0640\\u062a \\u0645\\u0628\\u0646\\u064a\\u0640\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u062e\\u0637\\u0640\\u0637 \\u0625\\u0633\\u0640\\u062a\\u0631\\u0627\\u062a\\u064a\\u062c\\u064a\\u0629 \\u062a\\u062d\\u0644\\u0640\\u062a \\u0628\\u0627\\u0644\\u0625\\u0635\\u0640\\u0631\\u0627\\u0631\\r\\n\\u0648\\u0627\\u0644\\u062a\\u0646\\u0627\\u0641\\u0633\\u0640\\u064a\\u0629 \\u0648\\u0627\\u0644\\u0628\\u0642\\u0640\\u0627\\u0621 \\u0645\\u0645\\u0640\\u0627 \\u064a\\u0624\\u0647\\u0644\\u0647\\u0640\\u0627 \\u0625\\u0644\\u0640\\u0649 \\u062a\\u062d\\u0642\\u064a\\u0640\\u0642 \\u0631\\u0624\\u064a\\u062a\\u0647\\u0640\\u0627 \\u0627\\u0644\\u0645\\u0633\\u0640\\u062a\\u0642\\u0628\\u0644\\u064a\\u0629.\\r\\n\\u062a\\u0633\\u0640\\u0640\\u0639\\u0649 \\u0634\\u0640\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u0640\\u062a\\u064a\\u0629 \\u0644\\u062a\\u0635\\u0640\\u0640\\u062f\\u0631 \\u0642\\u0637\\u0640\\u0640\\u0627\\u0639 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0645\\u0640\\u0640\\u0629 \\u0627\\u0644\\u0645\\u062a\\u0646\\u0627\\u0645\\u0640\\u0640\\u064a \\u0641\\u0640\\u0640\\u064a \\u0627\\u0644\\u0645\\u0646\\u0637\\u0642\\u0640\\u0640\\u0629\\r\\n\\u0645\\u0640\\u0639 \\u0646\\u0638\\u0640\\u0631\\u0629 \\u0628\\u0639\\u064a\\u0640\\u062f\\u0629 \\u0627\\u0644\\u0645\\u0640\\u062f\\u0649 \\u0641\\u0640\\u064a \\u0627\\u0644\\u0623\\u0641\\u0640\\u0642 \\u062a\\u062c\\u0640\\u0627\\u0647 \\u0627\\u0644\\u062f\\u062e\\u0640\\u0648\\u0644 \\u0644\\u0644\\u0623\\u0633\\u0640\\u0648\\u0627\\u0642 \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0640\\u0629. \\u0645\\u0640\\u0646 \\u062e\\u0640\\u0644\\u0627\\u0644 \\u0631\\u0623\\u0633 \\u0645\\u0640\\u0627\\u0644  2\\u0645\\u0644\\u064a\\u0640\\u0648\\u0646 \\u062f\\u064a\\u0646\\u0640\\u0627\\u0631\\r\\n\\u0643\\u0648\\u064a\\u062a\\u0640\\u0640\\u064a \\u064a\\u062a\\u0640\\u0640\\u0645 \\u0627\\u0633\\u0640\\u0640\\u062a\\u062b\\u0645\\u0627\\u0631\\u0647 \\u0641\\u0640\\u0640\\u064a \\u0642\\u0637\\u0640\\u0640\\u0627\\u0639 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0640\\u0627\\u062a \\u0627\\u0644\\u0639\\u0627\\u0645\\u0640\\u0640\\u0629 \\u0627\\u0644\\u0642\\u0635\\u064a\\u0640\\u0640\\u0631 \\u0648\\u0627\\u0644\\u0645\\u062a\\u0648\\u0633\\u0640\\u0640\\u0637 \\u0648\\u0627\\u0644\\u0637\\u0648\\u064a\\u0640\\u0640\\u0644 \\u0627\\u0644\\u0645\\u0640\\u0640\\u062f\\u0649.\\r\\n\\u0648\\u0636\\u0639\\u0640\\u062a \\u0634\\u0640\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0640\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u0640\\u062a\\u064a\\u0629 \\u0647\\u062f\\u0641\\u0640\\u0627\\u064b \\u0623\\u0633\\u0627\\u0633\\u0640\\u064a\\u0627\\u064b \\u0646\\u0635\\u0640\\u0628 \\u0623\\u0639\\u064a\\u0646\\u0647\\u0640\\u0627 \\u064a\\u062a\\u0645\\u062b\\u0640\\u0644 \\u0641\\u0640\\u064a \\u0627\\u0644\\u062a\\u0648\\u0633\\u0640\\u0639 \\u0627\\u0644\\u062c\\u063a\\u0631\\u0627\\u0641\\u064a\\r\\n\\u0648\\u0627\\u0644\\u0625\\u0642\\u0644\\u064a\\u0645\\u0640\\u064a \\u0648\\u0627\\u0644\\u062f\\u062e\\u0640\\u0648\\u0644 \\u0641\\u0640\\u064a \\u0645\\u0646\\u0627\\u0642\\u0635\\u0640\\u0627\\u062a \\u0648\\u0639\\u0642\\u0640\\u0648\\u062f \\u0643\\u0628\\u064a\\u0640\\u0631\\u0629 \\u0648\\u0647\\u0640\\u0630\\u0627 \\u064a\\u0635\\u0640\\u0628 \\u0641\\u0640\\u064a \\u0645\\u0635\\u0644\\u062d\\u062a\\u0647\\u0640\\u0627 \\u0648\\u064a\\u0639\\u0645\\u0640\\u0644 \\u0639\\u0644\\u0640\\u0649 \\u062f\\u0641\\u0640\\u0639 \\u0639\\u062c\\u0644\\u0640\\u0629\\r\\n\\u0627\\u0644\\u062a\\u0646\\u0645\\u064a\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0627\\u0642\\u062a\\u0635\\u0627\\u062f\\u0648\\u062a\\u062a\\u0640\\u0645 \\u062a\\u0637\\u0648\\u064a\\u0631\\u0647\\u0640\\u0627 \\u062a\\u0642\\u0640\\u0648\\u0645 \\u0627\\u0644\\u0634\\u0640\\u0631\\u0643\\u0629 \\u0639\\u0644\\u0640\\u0649 \\u062a\\u0646\\u0641\\u064a\\u0640\\u0630 \\u0639\\u0642\\u0640\\u0648\\u062f \\u0648\\u0645\\u0646\\u0627\\u0642\\u0635\\u0640\\u0627\\u062a \\u0628\\u0642\\u064a\\u0645\\u0640\\u0629  15\\u0645\\u0644\\u064a\\u0640\\u0648\\u0646 \\u062f\\u064a\\u0646\\u0640\\u0627\\u0631\\r\\n\\u0643\\u0648\\u064a\\u062a\\u0640\\u064a \\u0645\\u0640\\u0639 \\u0627\\u0644\\u0639\\u062f\\u064a\\u0640\\u062f \\u0645\\u0640\\u0646 \\u0648\\u0632\\u0627\\u0631\\u0627\\u062a \\u0627\\u0644\\u062f\\u0648\\u0644\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0624\\u0633\\u0633\\u0640\\u0627\\u062a \\u0648\\u0627\\u0644\\u062c\\u0647\\u0640\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0640\\u0629 \\u062a\\u0634\\u0640\\u062a\\u0645\\u0644 \\u0639\\u0644\\u0640\\u0649 \\u062a\\u0646\\u0641\\u064a\\u0640\\u0630 \\u0648\\u062a\\u062c\\u0647\\u064a\\u0640\\u0632\\r\\n\\u0623\\u0639\\u0645\\u0640\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0646\\u0638\\u064a\\u0640\\u0641 \\u0648\\u0627\\u0644\\u062e\\u062f\\u0645\\u0640\\u0627\\u062a \\u0648\\u0627\\u0644\\u0636\\u064a\\u0627\\u0641\\u0640\\u0629 \\u0648\\u0627\\u0644\\u0645\\u0631\\u0627\\u0633\\u0640\\u0644\\u0629 \\u0648\\u062d\\u0631\\u0627\\u0633\\u0640\\u0629 \\u0627\\u0644\\u0645\\u0646\\u0634\\u0640\\u0622\\u062a\",\"brief\":\"\\u0644\\u0642\\u062f \\u062a\\u0628\\u0644\\u0648\\u0631\\u062a \\u0641\\u0643\\u0631\\u0629 \\u062a\\u0623\\u0633\\u064a\\u0633 \\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u062f\\u0631\\u0648\\u0627\\u0632\\u0629 \\u0644\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u0644\\u0648\\u062c\\u0633\\u062a\\u064a\\u0629\\r\\n\\u0645\\u0646 \\u0623\\u062c\\u0644 \\u062a\\u0642\\u062f\\u064a\\u0645 \\u0627\\u0644\\u062e\\u062f\\u0645\\u0627\\u062a \\u0627\\u0644\\u062d\\u0643\\u0648\\u0645\\u064a\\u0629 \\u0627\\u0644\\u062a\\u064a \\u064a\\u0645\\u0643\\u0646 \\u0644\\u0644\\u0634\\u0631\\u0643\\u0629 \\u0627\\u0644\\u0642\\u064a\\u0627\\u0645 \\u0628\\u0647\\u0627 \\u0641\\u064a \\u0627\\u0644\\u0648\\u0632\\u0627\\u0631\\u0627\\u062a\\r\\n\\u0648\\u0645\\u0624\\u0633\\u0633\\u0627\\u062a \\u0627\\u0644\\u062f\\u0648\\u0644\\u0629 \\u0628\\u0637\\u0631\\u064a\\u0642\\u0629 \\u0623\\u0641\\u0636\\u0644 \\u0648\\u0623\\u0643\\u062b\\u0631 \\u0643\\u0641\\u0627\\u0621\\u0629 \\u0628\\u062a\\u0643\\u0644\\u0641\\u0629 \\u0623\\u0642\\u0644\"}]', 0, '', ''),
(27, 17, 'en', 'شركة-الكهرباء-و-الماء', ' Ministry of Electricity and Water', '', '', '1560415551_Image-1.png', NULL, 0, '', ''),
(28, 17, 'ar', 'شركة-الكهرباء-و-الماء', 'شركة الكهرباء والماء', '', '', '1560415551_Image-1.png', NULL, 0, '', ''),
(31, 27, 'en', 'about-usss', 'About usss', '', '', NULL, NULL, 0, '', ''),
(32, 27, 'ar', 'Cleaning-Security-and-guard-facilities', 'Cleaning Security and guard facilities', '', '', NULL, NULL, 0, '', ''),
(33, 28, 'en', 'ships-unloading-&-loading-security-devices-&-installation-&-maintenance', 'SHIPS UNLOADING & LOADING SECURITY DEVICES & INSTALLATION & MAINTENANCE', '', '', NULL, NULL, 0, '', ''),
(34, 28, 'ar', 'SHIPS-UNLOADING-&-LOADING-SECURITY-DEVICES-&-INSTALLATION-&-MAINTENANCE', 'SHIPS UNLOADING & LOADING SECURITY DEVICES & INSTALLATION & MAINTENANCE', '', '', NULL, NULL, 0, '', ''),
(47, 35, 'en', '|-derwaza-for-logistics-company-|', '| Derwaza for logistics company |', '', '', '1560436449_Slider_02.jpg', NULL, 0, '', ''),
(48, 35, 'ar', 'شركة-الدروازة-للخدمات-اللوجيستية', '|شركة الدروازة للخدمات اللوجيستية|', '', '', '1560436451_Slider_02.jpg', NULL, 0, '', ''),
(49, 36, 'en', 'english', 'English', '<p>English English English English English English<br></p>', '', '1560349686_Z12.jpg', '[{\"brief\":\"English English\",\"secondary_img\":\"1558858695_images.jpg\"}]', 0, '', ''),
(50, 36, 'ar', 'عربى', 'عربى', '<p>عربى عربى عربى عربى عربى عربى <br></p>', '', '1560349687_Z12.jpg', '[{\"brief\":\"\\u0639\\u0631\\u0628\\u0649 \\u0639\\u0631\\u0628\\u0649 \",\"secondary_img\":\"1558858696_images.jpg\"}]', 0, '', ''),
(51, 37, 'en', 'sector-2', 'Sector 2', '<p>Sector 2 Sector 2Sector 2 Sector 2<br></p>', '', '1560440083_الاجهزة_الامنية.jpg', '[{\"brief\":\"Sector 2 Sector 2\",\"secondary_img\":\"1558859115_images.jpg\"}]', 0, '', ''),
(52, 37, 'ar', 'القطاع-الثانى', 'القطاع الثانى ', '<p>القطاع <b>الثانى  </b>القطاع الثانى  القطاع الثانى  القطاع الثانى  <br></p>', '', '1560440083_الاجهزة_الامنية.jpg', '[{\"brief\":\"\\u0627\\u0644\\u0642\\u0637\\u0627\\u0639 \\u0627\\u0644\\u062b\\u0627\\u0646\\u0649  \\u0627\\u0644\\u0642\\u0637\\u0627\\u0639 \\u0627\\u0644\\u062b\\u0627\\u0646\\u0649 \",\"secondary_img\":\"1558859115_images.jpg\"}]', 0, '', ''),
(53, 38, 'en', 'serhesrherh', 'serhesrherh', '', '', '1560436520_Slider_01.jpg', NULL, 0, '', ''),
(54, 38, 'ar', 'ehrrheh', 'ehrrheh', '', '', '1560436521_Slider_01.jpg', NULL, 0, '', ''),
(55, 43, 'en', 'sdfbsdfbf', 'Organization Chart', '', '', '1560436551_OS_en.jpg', NULL, 0, '', ''),
(56, 43, 'ar', 'wsbawrbvarbv', 'Organization Chart', '', '', '1560436552_OS_ar.jpg', NULL, 0, '', ''),
(75, 53, 'en', 'after-theresa-may', 'Mohamed Salah is the Egyptian King', '<p style=\"text-align: right;\"><div style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; color: rgb(0, 0, 0); font-family: LatoRegular, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"></div></p><p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px; color: rgb(0, 0, 0); font-family: LatoRegular, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; text-align: right;\"><br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"></p>', '', NULL, '[{\"brief\":\"With the Conservative Party leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.\"}]', 0, '', ''),
(76, 53, 'ar', 'محمد-صلاح-يحلم-بحصد-بأول-ألقابه-مع-منتخب-مصر', 'محمد صلاح يحلم بحصد  أول ألقابه مع منتخب مصر', '<p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">كريستيانو رونالدو نجح فى قيادة منتخب البرتغال للحصول على بطولة كأس الأمم الأوروبية \"يورو 2016\"، فيما تذوق طعم الحصول على الألقاب القارية مع مانشستر يونايتد الإنجليزى وريال مدريد الإسبانى، حيث التتويج بلقب دوري ابطال اوروبا.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويحلم محمد صلاح بالسير على خطى كريستيانو رونالدو بحصد أول ألقابه مع منتخب مصر بعدما كان قريباً من تحقيق هذا الإنجاز فى النسخة الماضية من مسابقة أمم أفريقيا التى أقيمت قبل عامين فى الجابون عندما خسر المنتخب الوطنى أمام الكاميرون فى المباراة النهائية.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويخشى محمد صلاح الإصابة بلعنة النجم الأرجنتينى ليونيل ميسي الذي فشل فى الجمع بين النجاح على مستوى الأندية والتتويج بالألقاب مع منتخب بلاده.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وقاد ليونيل ميسي فريق برشلونة للحصول على لقب دوري ابطال اوروبا فى أكثر من مناسبة بينما عجز عن تحقيق الألقاب مع منتخب الأرجنتين.</p><p><div style=\"padding: 0px; margin: 0px; background-color: rgb(240, 240, 240); color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\"></div></p><p dir=\"RTL\" class=\"selectionShareable\" style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 10px; color: rgb(51, 51, 51); border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; line-height: 28px !important; text-align: justify; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">وخسر ليونيل ميسي 4 مباريات نهائية مع منتخب الأرجنتين طوال مسيرته بواقع 3 لقاءات فى بطولة \"كوبا أمريكا\" ومباراة وحيدة فى كأس العالم.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">نجم برشلونة تذوق مرارة الهزيمة فى نهائى كوبا أمريكا 2007 مع منتخب الأرجنتين أمام البرازيل بثلاثية نظيفة فى المباراة التى جمعتهما فى فنزويلا، كما خسر نهائى كوبا أمريكا عامى 2015 و2016 مع منتخب الأرجنتين أمام تشيلى بركلات الترجيح.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وتذوق ليونيل ميسي مرارة الهزيمة مع منتخب الأرجنتين أمام ألمانيا فى نهائى بطولة كأس العالم 2014 فى البرازيل.</p>', '', NULL, '[{\"brief\":\"\\u064a\\u0633\\u0639\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0635\\u0644\\u0627\\u062d\\u060c \\u0644\\u0644\\u0633\\u064a\\u0631 \\u0639\\u0644\\u0649 \\u062e\\u0637\\u0649 \\u0627\\u0644\\u0646\\u062c\\u0645 \\u0627\\u0644\\u0628\\u0631\\u062a\\u063a\\u0627\\u0644\\u0649 \\u0643\\u0631\\u064a\\u0633\\u062a\\u064a\\u0627\\u0646\\u0648 \\u0631\\u0648\\u0646\\u0627\\u0644\\u062f\\u0648 \\u060c \\u0628\\u0627\\u0644\\u062c\\u0645\\u0639 \\u0628\\u064a\\u0646\\u0644\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u062d \\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0623\\u0646\\u062f\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u062a\\u0648\\u064a\\u062c \\u0628\\u0627\\u0644\\u0623\\u0644\\u0642\\u0627\\u0628 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062e\\u0628.\"}]', 0, '', ''),
(77, 54, 'en', '92345123', 'Kuwait - Downtown', '', '', NULL, '[{\"long\":\"92345123\",\"lat\":\"92345123\"}]', 0, '', ''),
(78, 54, 'ar', '92345123', 'الكويت - الداون تاون', '', '', NULL, '[{\"long\":\"92345123\",\"lat\":\"92345123\"}]', 0, '', ''),
(79, 55, 'en', 'air-freight.', 'Air freight.', '<ul style=\"margin-bottom: 11px; padding-left: 30px; list-style-type: square; color: rgb(56, 56, 56); font-family: Lato, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; font-variant-ligatures: common-ligatures;\"><li style=\"margin-bottom: 6px;\">Air freight sub-sector in the UK transport sector less than 1% of all goods moved.</li><li style=\"margin-bottom: 6px;\">There are 137,800 people employed in air freight in around 2,400 workplaces.</li><li style=\"margin-bottom: 6px;\">Air freight traffic has been forecast to grow at an average annual rate of over 6% for the next two decades.</li><li style=\"margin-bottom: 6px;\">There are 2,400 air freight workplaces in the UK, employing a total of 137,800 people</li><li style=\"margin-bottom: 6px;\">This workforce is estimated to be 8% of the entire logistics sector workforce.</li></ul><p style=\"margin-bottom: 11px; padding-right: 4rem; color: rgb(56, 56, 56); font-family: Lato, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; font-variant-ligatures: common-ligatures;\"><span style=\"font-weight: 700;\">Jobs in the sub-sector </span>range from:<span style=\"font-weight: 700;\"> </span>air freight manager, air import operator, air export operator, air freight supervisor, freight forwarder, air hub manager</p><p style=\"margin-bottom: 11px; padding-right: 4rem; color: rgb(56, 56, 56); font-family: Lato, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; font-variant-ligatures: common-ligatures;\"><span style=\"font-weight: 700;\">Entry requirements and qualifications</span> vary depending on occupational role. For example for a Freight Forwarder, office experience, computer skills and foreign language skills can be required. Recognised qualifications from professional bodies, such as the British International Freight Association (BIFA) or the Chartered Institute of Logistics and Transport UK are also available. The following HND or degree subjects are likely to be an advantage: transport and distribution management; logistics; supply chain management; business and management; and foreign languages with business studies.</p><p style=\"margin-bottom: 11px; padding-right: 4rem; color: rgb(56, 56, 56); font-family: Lato, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; font-variant-ligatures: common-ligatures;\">Investment in training within the air freight sub-sector has built up over many years and consequently the sub-sector does not experience problems with recruiting and skills gaps. This is partially due to the fact that air transport has been, and still is, a popular career choice.</p><p style=\"margin-bottom: 11px; padding-right: 4rem; color: rgb(56, 56, 56); font-family: Lato, \"Helvetica Neue\", Helvetica, Arial, sans-serif; font-size: 16px; font-variant-ligatures: common-ligatures;\">Source: Skills for Logistics AACS LMI report 2010</p>', '', '1560349718_Z9.jpg', '[{\"brief\":\"Air freight is the movement and supply of goods by air making up part of the international \",\"secondary_img\":\"\"}]', 0, '', '');
INSERT INTO `posts` (`id`, `config_id`, `lang`, `slug`, `name`, `short`, `details`, `upload`, `other_inputs_values`, `views`, `keys`, `desc`) VALUES
(80, 55, 'ar', 'قطاع-النقل-البحري', 'قطاع النقل البحري', '<p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">إلتقى وزير النقل الفريق مهندس / كامل الوزير .. وفد شركة هواوي العالمية المُتخصصة في مجال الإتصالات وتكنولولجيا المعلومات وذلك لبحث سُبل التعاون بين الجانبين في تطوير أنظمة الإتصالات في قطاعات النقل المختلفة وحضر اللقاء رئيس الهيئة العامة للطرق والكباري وقيادات وزارة النقل والسكك الحديدية</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">في بداية اللقاء أكد الوزير على إهتمام الوزارة بتطوير قطاع الإتصالات وتكنولوجيا المعلومات في كافة قطاعات النقل سواء كانت ( سكة حديد – مترو أنفاق – نقل نهري – نقل بحري – طُرق ) لافتا إلى أن هناك حجم أعمال ومشروعات ضخمة في هذه القطاعات يمكن أن تتقدم شركة هواوي العاليمة للمنافسة على تنفيذها مثل بعض المشروعات في مجال السكك الحديدية مثل مشروعات تحديث وتطوير واحلال شبكة الميكرويف بالسكة الحديد نظرا لأهميتها الكبيرة في عملية التواصل بين طوائف التشغيل</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">وأكد وفد هواوي العالمية على أن هناك رغبة قوية من الشركة للدخول في الاستثمار في قطاع النقل بمصر وأنه سيتم دراسة كافة مشروعات النقل التي يُمكن الدخول في المنافسة على تنفيذها خاصة في ظل المناخ الاستثماري الواعد بمصر ، وفي ظل ما يشهده قطاع النقل في مصر من طفرة كبيرة .</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">وهو ما أكده تقدم ترتيب مصر في عدد من مجالات النقل في تصنيف التنافسية الدول</p>', '', '1560349718_Z9.jpg', '[{\"brief\":\"\\u0648\\u0632\\u064a\\u0631 \\u0627\\u0644\\u0646\\u0642\\u0644 \\u064a\\u0628\\u062d\\u062b \\u0645\\u0639 \\u0647\\u0648\\u0627\\u0648\\u064a \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0629 \\u062a\\u0637\\u0648\\u064a\\u0631 \\u0623\\u0646\\u0638\\u0645\\u0629 \\u0627\\u0644\\u0625\\u062a\\u0635\\u0627\\u0644\\u0627\\u062a \\u0641\\u064a \\u0642\\u0637\\u0627\\u0639\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629\",\"secondary_img\":\"\"}]', 0, '', ''),
(81, 56, 'en', 'wood-&-paper-industry', 'Wood & Paper Industry', '<h2 style=\"font-family: NewsCycleRegular, Arial, Helvetica, sans-serif; font-size: 1.3em; text-transform: uppercase; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(82, 82, 82);\">TRANSPORT & LOGISTICS SERVICES IN THE WOOD & PAPER INDUSTRY</h2><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">They use, and we <strong>transport</strong>, as their main raw materials <strong>wood</strong>, <strong>paper</strong> or recovered <strong>paper and wood</strong>. Forestry activity, sawing logs, sawdust, shavings, bark, chips, granules, pellets, briquets, wood recycling and biomass are products that we transport each day.</p><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">Paper pulp, cellulose, cardboard, honeycomb, press, newspapers, magazines and publications, packaging, labeling, kraft, paper for hygiene, health, medicine, paper for Industries, building and construction, paper, graphic arts and decoration.</p><h3 style=\"font-family: NewsCycleRegular, Arial, Helvetica, sans-serif; font-size: 1.1em; text-transform: uppercase; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(82, 82, 82);\">EXPERIENCED IN WOOD TRANSPORTATION</h3><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">Wood transportation is historically one of our eldest sector of activity. Our sawing mills based in Belgium, France and Germany are producing green electricity, energy of the future. From one to another, more than 50 years of experience, professionalism and technology !</p>', '', '1560349733_Z10.jpg', '[{\"brief\":\"Wood industry and first transformation of wood, forest-based industries including the woodworking industries, pulp and paper industries, printing industries\",\"secondary_img\":\"\"}]', 0, '', ''),
(82, 56, 'ar', 'قطاع-النقل-العام', 'قطاع النقل العام', '<p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">إلتقى وزير النقل الفريق مهندس / كامل الوزير .. وفد شركة هواوي العالمية المُتخصصة في مجال الإتصالات وتكنولولجيا المعلومات وذلك لبحث سُبل التعاون بين الجانبين في تطوير أنظمة الإتصالات في قطاعات النقل المختلفة وحضر اللقاء رئيس الهيئة العامة للطرق والكباري وقيادات وزارة النقل والسكك الحديدية</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">في بداية اللقاء أكد الوزير على إهتمام الوزارة بتطوير قطاع الإتصالات وتكنولوجيا المعلومات في كافة قطاعات النقل سواء كانت ( سكة حديد – مترو أنفاق – نقل نهري – نقل بحري – طُرق ) لافتا إلى أن هناك حجم أعمال ومشروعات ضخمة في هذه القطاعات يمكن أن تتقدم شركة هواوي العاليمة للمنافسة على تنفيذها مثل بعض المشروعات في مجال السكك الحديدية مثل مشروعات تحديث وتطوير واحلال شبكة الميكرويف بالسكة الحديد نظرا لأهميتها الكبيرة في عملية التواصل بين طوائف التشغيل</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">وأكد وفد هواوي العالمية على أن هناك رغبة قوية من الشركة للدخول في الاستثمار في قطاع النقل بمصر وأنه سيتم دراسة كافة مشروعات النقل التي يُمكن الدخول في المنافسة على تنفيذها خاصة في ظل المناخ الاستثماري الواعد بمصر ، وفي ظل ما يشهده قطاع النقل في مصر من طفرة كبيرة .</p><p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: Tahoma, Verdana, Segoe, sans-serif; font-size: 13px; direction: rtl; text-align: justify;\">وهو ما أكده تقدم ترتيب مصر في عدد من مجالات النقل في تصنيف التنافسية الدولية </p>', '', '1560349734_Z10.jpg', '[{\"brief\":\"\\u0648\\u0632\\u064a\\u0631 \\u0627\\u0644\\u0646\\u0642\\u0644 \\u064a\\u0628\\u062d\\u062b \\u0645\\u0639 \\u0647\\u0648\\u0627\\u0648\\u064a \\u0627\\u0644\\u0639\\u0627\\u0644\\u0645\\u064a\\u0629 \\u062a\\u0637\\u0648\\u064a\\u0631 \\u0623\\u0646\\u0638\\u0645\\u0629 \\u0627\\u0644\\u0625\\u062a\\u0635\\u0627\\u0644\\u0627\\u062a \\u0641\\u064a \\u0642\\u0637\\u0627\\u0639\\u0627\\u062a \\u0627\\u0644\\u0646\\u0642\\u0644 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629\",\"secondary_img\":\"\"}]', 0, '', ''),
(83, 57, 'en', 'fight-fire-sector', 'fight fire sector', '<p>fight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sectorfight fire sector fight fire sector<br></p>', '', '1560349746_Z11.jpg', '[{\"brief\":\"fight fire sector fight fire sector\",\"secondary_img\":\"\"}]', 0, '', ''),
(84, 57, 'ar', 'قطاع-اطفاء-الحرائق', 'قطاع اطفاء الحرائق', '<p>قطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائققطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائققطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائققطاع اطفاء الحرائق قطاع اطفاء الحرائق قطاع اطفاء الحرائق<br></p>', '', '1560349747_Z11.jpg', '[{\"brief\":\"\\u0642\\u0637\\u0627\\u0639 \\u0627\\u0637\\u0641\\u0627\\u0621 \\u0627\\u0644\\u062d\\u0631\\u0627\\u0626\\u0642 \\u0642\\u0637\\u0627\\u0639 \\u0627\\u0637\\u0641\\u0627\\u0621 \\u0627\\u0644\\u062d\\u0631\\u0627\\u0626\\u0642\",\"secondary_img\":\"\"}]', 0, '', ''),
(85, 58, 'en', 'construction-and-specialized-business-sector', 'Construction and Specialized Business sector', '<h2 style=\"font-family: NewsCycleRegular, Arial, Helvetica, sans-serif; font-size: 1.3em; text-transform: uppercase; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(82, 82, 82);\">TRANSPORT & LOGISTICS SERVICES IN THE WOOD & PAPER INDUSTRY</h2><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">They use, and we <strong>transport</strong>, as their main raw materials <strong>wood</strong>, <strong>paper</strong> or recovered <strong>paper and wood</strong>. Forestry activity, sawing logs, sawdust, shavings, bark, chips, granules, pellets, briquets, wood recycling and biomass are products that we transport each day.</p><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">Paper pulp, cellulose, cardboard, honeycomb, press, newspapers, magazines and publications, packaging, labeling, kraft, paper for hygiene, health, medicine, paper for Industries, building and construction, paper, graphic arts and decoration.</p><h3 style=\"font-family: NewsCycleRegular, Arial, Helvetica, sans-serif; font-size: 1.1em; text-transform: uppercase; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; color: rgb(82, 82, 82);\">EXPERIENCED IN WOOD TRANSPORTATION</h3><p style=\"color: rgb(82, 82, 82); font-family: Arial, sans-serif; font-size: 12px; text-align: justify;\">Wood transportation is historically one of our eldest sector of activity. Our sawing mills based in Belgium, France and Germany are producing green electricity, energy of the future. From one to another, more than 50 years of experience, professionalism and technology !</p>', '', '1560349771_Z6.jpg', '[{\"brief\":\"Wood industry and first transformation of wood, forest-based industries including the woodworking industries, pulp and paper industries, printing industries.\",\"secondary_img\":\"1560336704_images.jpg\"}]', 0, '', ''),
(86, 58, 'ar', 'قطاع-التشييد-والبناء', 'قطاع التشييد والبناء', '<p> قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناءقطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء قطاع التشييد والبناء</p>', '', '1560349772_Z6.jpg', '[{\"brief\":\"\\u0642\\u0637\\u0627\\u0639 \\u0627\\u0644\\u062a\\u0634\\u064a\\u064a\\u062f \\u0648\\u0627\\u0644\\u0628\\u0646\\u0627\\u0621 \\u0642\\u0637\\u0627\\u0639 \\u0627\\u0644\\u062a\\u0634\\u064a\\u064a\\u062f \\u0648\\u0627\\u0644\\u0628\\u0646\\u0627\\u0621 \\u0642\\u0637\\u0627\\u0639 \\u0627\\u0644\\u062a\\u0634\\u064a\\u064a\\u062f \\u0648\\u0627\\u0644\\u0628\\u0646\\u0627\\u0621\",\"secondary_img\":\"1560336704_images.jpg\"}]', 0, '', ''),
(87, 59, 'en', 'mohamed-salah-is-the-egyptian-king', 'Mohamed Salah is the Egyptian King', '<p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p><div></div></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px; color: rgb(0, 0, 0); font-family: LatoRegular, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; text-align: right;\">With the&nbsp;<i style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\">Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"></p>', '', NULL, '[{\"brief\":\"With the Conservative Party leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.\"}]', 0, '', ''),
(88, 59, 'ar', 'محمد-صلاح-يحلم-بحصد--أول-ألقابه-مع-منتخب-مصر', 'محمد صلاح يحلم بحصد  أول ألقابه مع منتخب مصر', '<p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">كريستيانو رونالدو نجح فى قيادة منتخب البرتغال للحصول على بطولة كأس الأمم الأوروبية \"يورو 2016\"، فيما تذوق طعم الحصول على الألقاب القارية مع مانشستر يونايتد الإنجليزى وريال مدريد الإسبانى، حيث التتويج بلقب دوري ابطال اوروبا.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويحلم محمد صلاح بالسير على خطى كريستيانو رونالدو بحصد أول ألقابه مع منتخب مصر بعدما كان قريباً من تحقيق هذا الإنجاز فى النسخة الماضية من مسابقة أمم أفريقيا التى أقيمت قبل عامين فى الجابون عندما خسر المنتخب الوطنى أمام الكاميرون فى المباراة النهائية.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويخشى محمد صلاح الإصابة بلعنة النجم الأرجنتينى ليونيل ميسي الذي فشل فى الجمع بين النجاح على مستوى الأندية والتتويج بالألقاب مع منتخب بلاده.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وقاد ليونيل ميسي فريق برشلونة للحصول على لقب دوري ابطال اوروبا فى أكثر من مناسبة بينما عجز عن تحقيق الألقاب مع منتخب الأرجنتين.</p><p></p><div style=\"padding: 0px; margin: 0px; background-color: rgb(240, 240, 240); color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\"></div><p></p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وخسر ليونيل ميسي 4 مباريات نهائية مع منتخب الأرجنتين طوال مسيرته بواقع 3 لقاءات فى بطولة \"كوبا أمريكا\" ومباراة وحيدة فى كأس العالم.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">نجم برشلونة تذوق مرارة الهزيمة فى نهائى كوبا أمريكا 2007 مع منتخب الأرجنتين أمام البرازيل بثلاثية نظيفة فى المباراة التى جمعتهما فى فنزويلا، كما خسر نهائى كوبا أمريكا عامى 2015 و2016 مع منتخب الأرجنتين أمام تشيلى بركلات الترجيح.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وتذوق ليونيل ميسي مرارة الهزيمة مع منتخب الأرجنتين أمام ألمانيا فى نهائى بطولة كأس العالم 2014 فى البرازيل.</p>', '', NULL, '[{\"brief\":\"\\u064a\\u0633\\u0639\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0635\\u0644\\u0627\\u062d\\u060c \\u0644\\u0644\\u0633\\u064a\\u0631 \\u0639\\u0644\\u0649 \\u062e\\u0637\\u0649 \\u0627\\u0644\\u0646\\u062c\\u0645 \\u0627\\u0644\\u0628\\u0631\\u062a\\u063a\\u0627\\u0644\\u0649 \\u0643\\u0631\\u064a\\u0633\\u062a\\u064a\\u0627\\u0646\\u0648 \\u0631\\u0648\\u0646\\u0627\\u0644\\u062f\\u0648 \\u060c \\u0628\\u0627\\u0644\\u062c\\u0645\\u0639 \\u0628\\u064a\\u0646\\u0644\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u062d \\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0623\\u0646\\u062f\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u062a\\u0648\\u064a\\u062c \\u0628\\u0627\\u0644\\u0623\\u0644\\u0642\\u0627\\u0628 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062e\\u0628.\"}]', 0, '', ''),
(89, 60, 'en', 'mohamed-salah-is-the-egyptian-king', 'Mohamed Salah is the Egyptian King', '<p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p style=\"text-align: right;\">With the&nbsp;<i>Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br></p><div></div><p><div></div></p><p style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent; margin: 0px 0px 10px; color: rgb(0, 0, 0); font-family: LatoRegular, &quot;Lucida Grande&quot;, &quot;Lucida Sans Unicode&quot;, Helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 300; letter-spacing: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial; text-align: right;\">With the&nbsp;<i style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\">Conservative Party&nbsp;</i>leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.<br style=\"box-sizing: border-box; -webkit-tap-highlight-color: transparent;\"></p>', '', NULL, '[{\"brief\":\"With the Conservative Party leadership contest already well to , we look at who could be the next prime minister and how they plan to negotiate Brexit.\"}]', 0, '', ''),
(90, 60, 'ar', 'محمد-صلاح-يحلم-بحصد--أول-ألقابه-مع-منتخب-مصر', 'محمد صلاح يحلم بحصد  أول ألقابه مع منتخب مصر', '<p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">كريستيانو رونالدو نجح فى قيادة منتخب البرتغال للحصول على بطولة كأس الأمم الأوروبية \"يورو 2016\"، فيما تذوق طعم الحصول على الألقاب القارية مع مانشستر يونايتد الإنجليزى وريال مدريد الإسبانى، حيث التتويج بلقب دوري ابطال اوروبا.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويحلم محمد صلاح بالسير على خطى كريستيانو رونالدو بحصد أول ألقابه مع منتخب مصر بعدما كان قريباً من تحقيق هذا الإنجاز فى النسخة الماضية من مسابقة أمم أفريقيا التى أقيمت قبل عامين فى الجابون عندما خسر المنتخب الوطنى أمام الكاميرون فى المباراة النهائية.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويخشى محمد صلاح الإصابة بلعنة النجم الأرجنتينى ليونيل ميسي الذي فشل فى الجمع بين النجاح على مستوى الأندية والتتويج بالألقاب مع منتخب بلاده.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وقاد ليونيل ميسي فريق برشلونة للحصول على لقب دوري ابطال اوروبا فى أكثر من مناسبة بينما عجز عن تحقيق الألقاب مع منتخب الأرجنتين.</p><p></p><div style=\"padding: 0px; margin: 0px; background-color: rgb(240, 240, 240); color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\"></div><p></p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وخسر ليونيل ميسي 4 مباريات نهائية مع منتخب الأرجنتين طوال مسيرته بواقع 3 لقاءات فى بطولة \"كوبا أمريكا\" ومباراة وحيدة فى كأس العالم.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">نجم برشلونة تذوق مرارة الهزيمة فى نهائى كوبا أمريكا 2007 مع منتخب الأرجنتين أمام البرازيل بثلاثية نظيفة فى المباراة التى جمعتهما فى فنزويلا، كما خسر نهائى كوبا أمريكا عامى 2015 و2016 مع منتخب الأرجنتين أمام تشيلى بركلات الترجيح.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وتذوق ليونيل ميسي مرارة الهزيمة مع منتخب الأرجنتين أمام ألمانيا فى نهائى بطولة كأس العالم 2014 فى البرازيل.</p>', '', NULL, '[{\"brief\":\"\\u064a\\u0633\\u0639\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0635\\u0644\\u0627\\u062d\\u060c \\u0644\\u0644\\u0633\\u064a\\u0631 \\u0639\\u0644\\u0649 \\u062e\\u0637\\u0649 \\u0627\\u0644\\u0646\\u062c\\u0645 \\u0627\\u0644\\u0628\\u0631\\u062a\\u063a\\u0627\\u0644\\u0649 \\u0643\\u0631\\u064a\\u0633\\u062a\\u064a\\u0627\\u0646\\u0648 \\u0631\\u0648\\u0646\\u0627\\u0644\\u062f\\u0648 \\u060c \\u0628\\u0627\\u0644\\u062c\\u0645\\u0639 \\u0628\\u064a\\u0646\\u0644\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u062d \\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0623\\u0646\\u062f\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u062a\\u0648\\u064a\\u062c \\u0628\\u0627\\u0644\\u0623\\u0644\\u0642\\u0627\\u0628 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062e\\u0628.\"}]', 0, '', ''),
(91, 61, 'en', 'when-our-power-of-choice-is', 'when our power of choice is', '<p style=\"margin-bottom: 0px; padding: 0px 0px 30px; line-height: 24px; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(161, 161, 161);\">Morbi mollis vestibulum sollicitudin. Nunc in eros a justo facilisis rutrum. Aenean id ullamcorper libero. Vestibulum imperdiet nibh vel magna lacinia ultrices. Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper.</p><p style=\"margin-bottom: 0px; padding: 0px 0px 30px; line-height: 24px; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(161, 161, 161);\"><div class=\"blog_quot\" style=\"box-sizing: border-box; color: rgb(51, 51, 51); font-family: Oswald, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"></div></p><p style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 14px; line-height: 24px; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(161, 161, 161); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Donec gravida malesuada lacus, eget tristique Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper. Donec gravida malesuada lacus, eget tristique Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper. Donec gravida malesuada lacus, eget tristique</p><div><br></div>', '', NULL, '[{\"brief\":\"Cras in semper ex. Mauris tincidunt purus blandit arcu ullamcorper finibus. Aliquam a iaculis est, eu vehicula elit. Vesti\"}]', 0, '', ''),
(92, 61, 'ar', 'محمد-صلاح-يحلم-بحصد--أول-ألقابه-مع-منتخب-مصر', 'محمد صلاح يحلم بحصد  أول ألقابه مع منتخب مصر', '<p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">كريستيانو رونالدو نجح فى قيادة منتخب البرتغال للحصول على بطولة كأس الأمم الأوروبية \"يورو 2016\"، فيما تذوق طعم الحصول على الألقاب القارية مع مانشستر يونايتد الإنجليزى وريال مدريد الإسبانى، حيث التتويج بلقب دوري ابطال اوروبا.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويحلم محمد صلاح بالسير على خطى كريستيانو رونالدو بحصد أول ألقابه مع منتخب مصر بعدما كان قريباً من تحقيق هذا الإنجاز فى النسخة الماضية من مسابقة أمم أفريقيا التى أقيمت قبل عامين فى الجابون عندما خسر المنتخب الوطنى أمام الكاميرون فى المباراة النهائية.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويخشى محمد صلاح الإصابة بلعنة النجم الأرجنتينى ليونيل ميسي الذي فشل فى الجمع بين النجاح على مستوى الأندية والتتويج بالألقاب مع منتخب بلاده.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وقاد ليونيل ميسي فريق برشلونة للحصول على لقب دوري ابطال اوروبا فى أكثر من مناسبة بينما عجز عن تحقيق الألقاب مع منتخب الأرجنتين.</p><p></p><div style=\"padding: 0px; margin: 0px; background-color: rgb(240, 240, 240); color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\"></div><p></p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وخسر ليونيل ميسي 4 مباريات نهائية مع منتخب الأرجنتين طوال مسيرته بواقع 3 لقاءات فى بطولة \"كوبا أمريكا\" ومباراة وحيدة فى كأس العالم.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">نجم برشلونة تذوق مرارة الهزيمة فى نهائى كوبا أمريكا 2007 مع منتخب الأرجنتين أمام البرازيل بثلاثية نظيفة فى المباراة التى جمعتهما فى فنزويلا، كما خسر نهائى كوبا أمريكا عامى 2015 و2016 مع منتخب الأرجنتين أمام تشيلى بركلات الترجيح.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وتذوق ليونيل ميسي مرارة الهزيمة مع منتخب الأرجنتين أمام ألمانيا فى نهائى بطولة كأس العالم 2014 فى البرازيل.</p>', '', NULL, '[{\"brief\":\"\\u064a\\u0633\\u0639\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0635\\u0644\\u0627\\u062d\\u060c \\u0644\\u0644\\u0633\\u064a\\u0631 \\u0639\\u0644\\u0649 \\u062e\\u0637\\u0649 \\u0627\\u0644\\u0646\\u062c\\u0645 \\u0627\\u0644\\u0628\\u0631\\u062a\\u063a\\u0627\\u0644\\u0649 \\u0643\\u0631\\u064a\\u0633\\u062a\\u064a\\u0627\\u0646\\u0648 \\u0631\\u0648\\u0646\\u0627\\u0644\\u062f\\u0648 \\u060c \\u0628\\u0627\\u0644\\u062c\\u0645\\u0639 \\u0628\\u064a\\u0646\\u0644\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u062d \\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0623\\u0646\\u062f\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u062a\\u0648\\u064a\\u062c \\u0628\\u0627\\u0644\\u0623\\u0644\\u0642\\u0627\\u0628 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062e\\u0628.\"}]', 0, '', ''),
(93, 62, 'en', 'when-our-power-of-choice-is', 'when our power of choice is', '<p style=\"margin-bottom: 0px; padding: 0px 0px 30px; line-height: 24px; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(161, 161, 161);\">Morbi mollis vestibulum sollicitudin. Nunc in eros a justo facilisis rutrum. Aenean id ullamcorper libero. Vestibulum imperdiet nibh vel magna lacinia ultrices. Sed id interdum urna. Nam ac elit a ante commodo tristique. Duis lacus urna, condimentum a vehicula a, hendrerit ac nisi Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper.</p><div><p style=\"margin-bottom: 0px; padding: 0px; line-height: 24px; font-family: &quot;Open Sans&quot;, sans-serif; color: rgb(161, 161, 161);\">Donec gravida malesuada lacus, eget tristique Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper. Donec gravida malesuada lacus, eget tristique Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vulputate, tortor nec commodo ultricies, lectus nisl facilisis enim, vitae viverra urna nulla sed turpis. Nullam lacinia faucibus risus, a euismod lorem tincidunt id. Donec maximus placerat tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse faucibus sed dolor eget posuere. Proin tincidunt fermentum arcu. Nam ac elementum nibh. Donec facilisis interdum orci sit amet ullamcorper. Donec gravida malesuada lacus, eget tristique</p><div><br></div><div class=\"blog_quot\" style=\"color: rgb(51, 51, 51); font-family: Oswald, sans-serif; font-size: 15px;\"></div></div>', '', NULL, '[{\"brief\":\"Cras in semper ex. Mauris tincidunt purus blandit arcu ullamcorper finibus. Aliquam a iaculis est, eu vehicula elit. Vestibulum urna magna\"}]', 0, '', ''),
(94, 62, 'ar', 'محمد-صلاح-يحلم-بحصد--أول-ألقابه-مع-منتخب-مصر', 'محمد صلاح يحلم بحصد  أول ألقابه مع منتخب مصر', '<p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">كريستيانو رونالدو نجح فى قيادة منتخب البرتغال للحصول على بطولة كأس الأمم الأوروبية \"يورو 2016\"، فيما تذوق طعم الحصول على الألقاب القارية مع مانشستر يونايتد الإنجليزى وريال مدريد الإسبانى، حيث التتويج بلقب دوري ابطال اوروبا.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويحلم محمد صلاح بالسير على خطى كريستيانو رونالدو بحصد أول ألقابه مع منتخب مصر بعدما كان قريباً من تحقيق هذا الإنجاز فى النسخة الماضية من مسابقة أمم أفريقيا التى أقيمت قبل عامين فى الجابون عندما خسر المنتخب الوطنى أمام الكاميرون فى المباراة النهائية.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">ويخشى محمد صلاح الإصابة بلعنة النجم الأرجنتينى ليونيل ميسي الذي فشل فى الجمع بين النجاح على مستوى الأندية والتتويج بالألقاب مع منتخب بلاده.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وقاد ليونيل ميسي فريق برشلونة للحصول على لقب دوري ابطال اوروبا فى أكثر من مناسبة بينما عجز عن تحقيق الألقاب مع منتخب الأرجنتين.</p><p></p><div style=\"padding: 0px; margin: 0px; background-color: rgb(240, 240, 240); color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important;\"></div><p></p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وخسر ليونيل ميسي 4 مباريات نهائية مع منتخب الأرجنتين طوال مسيرته بواقع 3 لقاءات فى بطولة \"كوبا أمريكا\" ومباراة وحيدة فى كأس العالم.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">نجم برشلونة تذوق مرارة الهزيمة فى نهائى كوبا أمريكا 2007 مع منتخب الأرجنتين أمام البرازيل بثلاثية نظيفة فى المباراة التى جمعتهما فى فنزويلا، كما خسر نهائى كوبا أمريكا عامى 2015 و2016 مع منتخب الأرجنتين أمام تشيلى بركلات الترجيح.</p><p dir=\"RTL\" class=\"selectionShareable\" style=\"padding: 0px; color: rgb(51, 51, 51); background-color: rgb(240, 240, 240); font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: 700; text-align: justify; border: none !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; line-height: 28px !important;\">وتذوق ليونيل ميسي مرارة الهزيمة مع منتخب الأرجنتين أمام ألمانيا فى نهائى بطولة كأس العالم 2014 فى البرازيل.</p>', '', NULL, '[{\"brief\":\"\\u064a\\u0633\\u0639\\u0649 \\u0645\\u062d\\u0645\\u062f \\u0635\\u0644\\u0627\\u062d\\u060c \\u0644\\u0644\\u0633\\u064a\\u0631 \\u0639\\u0644\\u0649 \\u062e\\u0637\\u0649 \\u0627\\u0644\\u0646\\u062c\\u0645 \\u0627\\u0644\\u0628\\u0631\\u062a\\u063a\\u0627\\u0644\\u0649 \\u0643\\u0631\\u064a\\u0633\\u062a\\u064a\\u0627\\u0646\\u0648 \\u0631\\u0648\\u0646\\u0627\\u0644\\u062f\\u0648 \\u060c \\u0628\\u0627\\u0644\\u062c\\u0645\\u0639 \\u0628\\u064a\\u0646\\u0644\\u0644 \\u0627\\u0644\\u0646\\u062c\\u0627\\u062d \\u0639\\u0644\\u0649 \\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0623\\u0646\\u062f\\u064a\\u0629 \\u0648\\u0627\\u0644\\u062a\\u062a\\u0648\\u064a\\u062c \\u0628\\u0627\\u0644\\u0623\\u0644\\u0642\\u0627\\u0628 \\u0645\\u0639 \\u0627\\u0644\\u0645\\u0646\\u062a\\u062e\\u0628.\"}]', 0, '', ''),
(95, 63, 'en', 'public-authority-for-industry', 'Public Authority for Industry', '', '', '1560415809_2222.png', NULL, 0, '', ''),
(96, 63, 'ar', 'الهيئة-العامة-للصناعة', 'الهيئة العامة للصناعة', '', '', '1560415809_2222.png', NULL, 0, '', ''),
(97, 64, 'en', 'وزارة-الاوقاف-و-الشئون-الاسلامية', 'وزارة الاوقاف و الشئون الاسلامية', '', '', '1560415983_B3pBi_Lv_400x400.png', NULL, 0, '', ''),
(98, 64, 'ar', 'وزارة-الاوقاف-و-الشئون-الاسلامية', 'وزارة الاوقاف و الشئون الاسلامية', '', '', '1560415983_B3pBi_Lv_400x400.png', NULL, 0, '', ''),
(99, 65, 'en', 'وزارة-الاوقاف-و-الشؤن-الاسلامية', 'وزارة الاوقاف و الشؤن الاسلامية', '', '', '1560416093_B3pBi_Lv_400x400.jpg', NULL, 0, '', ''),
(100, 65, 'ar', 'وزارة-الاوقاف-و-الشؤن-الاسلامية', 'وزارة الاوقاف و الشؤن الاسلامية', '', '', '1560416093_B3pBi_Lv_400x400.jpg', NULL, 0, '', ''),
(101, 66, 'en', 'شركة-المشروعات-السياحية', 'شركة المشروعات السياحية', '', '', '1560416216_2222.png', NULL, 0, '', ''),
(102, 66, 'ar', 'شركة-المشروعات-السياحية', 'شركة المشروعات السياحية', '', '', '1560416216_2222.png', NULL, 0, '', ''),
(103, 67, 'en', 'landmark-group', 'Landmark Group', '', '', '1560416421_Landmark-Group-Egypt-24906-1496051626-og.png', NULL, 0, '', ''),
(104, 67, 'ar', 'Landmark-Group', 'Landmark Group', '', '', '1560416421_Landmark-Group-Egypt-24906-1496051626-og.png', NULL, 0, '', '');

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
(13, 6, 0, 1, 1, 1, '2019-05-02 02:23:51', '2019-05-02 02:23:51'),
(14, 7, 0, 1, 1, 4, '2019-05-20 08:50:12', '2019-05-20 08:50:12'),
(15, 8, 0, 1, 1, 4, '2019-05-20 09:17:46', '2019-05-20 09:17:46'),
(16, 10, 0, 1, 0, 4, '2019-05-20 09:52:15', '2019-05-20 09:52:15'),
(17, 11, 0, 1, 0, 4, '2019-05-20 10:34:29', '2019-05-20 10:34:29'),
(27, 13, 0, 1, 0, 4, '2019-05-21 06:43:09', '2019-05-21 06:43:09'),
(28, 13, 0, 2, 0, 4, '2019-05-21 06:57:55', '2019-05-21 06:57:55'),
(35, 2, 0, 2, 0, 4, '2019-05-25 09:25:21', '2019-05-25 09:25:21'),
(36, 14, 27, 1, 0, 4, '2019-05-26 08:18:15', '2019-05-26 08:18:15'),
(37, 14, 27, 2, 0, 4, '2019-05-26 08:24:55', '2019-05-26 08:24:55'),
(38, 2, 0, 2, 0, 4, '2019-05-26 10:22:51', '2019-05-26 10:22:51'),
(43, 16, 0, 1, 1, 4, '2019-05-26 12:19:59', '2019-05-26 12:19:59'),
(53, 18, 0, 1, 0, 4, '2019-06-10 10:48:15', '2019-06-10 10:48:15'),
(54, 19, 0, 1, 1, 4, '2019-06-10 11:39:53', '2019-06-10 11:39:53'),
(55, 14, 27, 3, 0, 4, '2019-06-12 10:01:31', '2019-06-12 10:01:31'),
(56, 14, 27, 4, 0, 4, '2019-06-12 10:16:27', '2019-06-12 10:16:27'),
(57, 14, 27, 5, 1, 4, '2019-06-12 10:25:04', '2019-06-12 10:44:49'),
(58, 14, 27, 6, 0, 4, '2019-06-12 10:51:43', '2019-06-12 10:51:43'),
(59, 18, 0, 2, 0, 4, '2019-06-12 10:53:36', '2019-06-12 10:53:36'),
(60, 18, 0, 3, 0, 4, '2019-06-12 10:54:31', '2019-06-12 10:54:31'),
(61, 18, 0, 4, 0, 4, '2019-06-12 11:05:05', '2019-06-12 11:05:05'),
(62, 18, 0, 5, 0, 4, '2019-06-12 11:06:25', '2019-06-12 11:06:25'),
(63, 11, 0, 2, 0, 4, '2019-06-13 08:50:09', '2019-06-13 08:50:09'),
(64, 11, 0, 3, 0, 4, '2019-06-13 08:51:56', '2019-06-13 08:51:56'),
(65, 11, 0, 4, 0, 4, '2019-06-13 08:54:53', '2019-06-13 08:54:53'),
(66, 11, 0, 5, 0, 4, '2019-06-13 08:56:13', '2019-06-13 08:56:13'),
(67, 11, 0, 6, 0, 4, '2019-06-13 08:59:22', '2019-06-13 08:59:22');

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
(1, 2, 1, 'admin@interteleco.com', '$2y$10$x3irs5cfLxIWJL1nStzfB.qeRiG5v8G7hcYj6Ugnt586vAAa.G3IC', 'Admin', 'interteleco', '1556561447_1501858055_avatar5.png', 0, '', '', 0, '4qz37jCqHUwBZn7xEBpUwmuP9q15RTi1OyQ9KxbAhtRj6s7QKJdGV3tAmu4O', '2017-05-18 03:00:00', '2019-05-26 13:25:17'),
(2, 2, 1, 'admin@gad.com', '$2y$10$gEvCTKnomWuVwia3Wzxn0.77BpThJdveZJNi/PFuupJC1u0nrbmX6', 'Admin', 'Gad', '1556561367_100_100_1501858055_avatar5.png', 0, '', '', 0, 'TDWukKo4PtkXNnwSZtL0PKkYyXgG4sddxRBLt9M5iFcjYlLYv9YC4AP5aQJG', '2017-08-03 09:27:07', '2019-05-02 03:55:31'),
(3, 3, 1, 'ahmed@interteleco.com', '$2y$10$TgMRNj8BMDtHyzeVRO8ek.KrZSPUZHTRr1bn2MfWcGM7Kguc5mJK6', 'Ahmed', 'Hassan', 'default_avatar_male.png', 0, '', '', 0, 'jc2FEuuksEHPQR1HzdFsN2qLcwiQtjDDFUjHu85rE6uA5q6oAMQys8NNQK3V', '2019-05-01 19:19:27', '2019-05-20 10:55:40'),
(4, 2, 1, 'moustafa.adel@smsbox.com', '$2y$10$bg/m2E7rFS2fi97PHS4QIeYAyzHL5Cl55FXRSN.6kO1blE/XDfnWq', 'Mustafa', 'adel', 'default_avatar_male.png', 0, '', '', 0, NULL, '2019-05-20 08:22:47', '2019-05-20 08:22:47');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `post_configs`
--
ALTER TABLE `post_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

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
