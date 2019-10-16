-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2019 at 09:39 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gad`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `address_ar` varchar(255) NOT NULL,
  `address_en` varchar(255) NOT NULL,
  `region_id` int(255) NOT NULL,
  `phones` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `is_default`, `is_active`, `latitude`, `longitude`, `name_ar`, `name_en`, `address_ar`, `address_en`, `region_id`, `phones`) VALUES
(1, 0, 1, '30.04428100', '31.34000200', 'فرع  مدينة الكويت', 'Branch Of Kuwait City', 'مدينة الكويت', 'Kuwait City', 108, '96666666'),
(2, 0, 1, '30.02154351', '31.44287109', 'فرع دسمان', 'Branch Of Dasman', 'فرع دسمان', 'Branch Of Dasman st', 11, '96666668'),
(7, 1, 1, '29.99267180', '31.16268930', 'الفروانية', 'Coordinates', 'Coordinates', 'Coordinates', 121, '96666668');

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
(2, 'Gad', '', '', '', ' ', ' ', ' ', 0, '', 'sdvsd', NULL, '2016-07-15 22:31:03', '2019-05-01 19:14:46', 'en'),
(3, 'جاد', '', '', '', ' ', ' ', ' ', 0, '', 'vsdv', NULL, '2017-04-28 01:15:54', '2019-05-01 19:14:46', 'ar');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `name_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details_ar` text COLLATE utf8_unicode_ci NOT NULL,
  `details_en` text COLLATE utf8_unicode_ci NOT NULL,
  `image_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt_meta_ar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alt_meta_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `category_id`, `price`, `is_popular`, `is_active`, `created_at`, `updated_at`, `name_ar`, `name_en`, `details_ar`, `details_en`, `image_ar`, `image_en`, `slug_ar`, `slug_en`, `alt_meta_ar`, `alt_meta_en`) VALUES
(21, 1, 0, 0, 1, '2018-07-08 10:50:53', '2019-05-03 22:53:12', 'راب الطاقة', 'Energy Wrap', 'راب البيض المخفوق مع السبانخ وجبنة الفيتا', 'Scrambled eggs with spinach and feta cheese wrap', '1531129252_Energy_Wraprec.jpg', '1531129252_Energy_Wraprec.jpg', 'راب-الطاقة', 'energy-wrap', 'Scrambled Eggs', 'Scrambled Eggs'),
(22, 1, 1.95, 0, 1, '2018-07-08 10:53:17', '2019-05-03 19:00:38', 'ساندوتش الحلوم', 'Halloumi Sandwich', 'ساندوتش جبنة الحلوم المشوية مع الجرجير والخبز الأسمر', 'Grilled halloumi cheese with rocca in square brown bread.', '1531129206_Halloumi_Sandwichrec.jpg', '1531129206_Halloumi_Sandwichrec.jpg', 'ساندوتش-الحلوم', 'halloumi-sandwich', 'Scrambled Eggs', 'Scrambled Eggs'),
(23, 1, 1.25, 0, 1, '2018-07-08 10:57:59', '2019-05-03 19:00:38', 'الزبادي مع الفواكه', 'Yogurt With Banana', 'الزبادي الطازجة مع الغرانولا والموز', 'Granola mixed with yogurt served with banana.', '1531129146_Yogurt_with_Fruits_Banana_NEW.jpg', '1531129146_Yogurt_with_Fruits_Banana_NEW.jpg', 'الزبادي-مع-الفواكه', 'yogurt-with-banana', 'Scrambled Eggs', 'Scrambled Eggs'),
(24, 1, 1.95, 0, 1, '2018-07-08 11:00:46', '2019-05-03 19:00:38', 'مشروم فريتاتا', 'Mushroom Frittata', 'خبز التوست الأسمر يقدم مع اللحم المقدد، مشروم بورتوبيللو، البيض والخردل', 'Mouth watering breakfast served with bacon, mushroom portobello, egg and mustard.', '1531129117_Mushroom_Frittata_NEW.jpg', '1531129117_Mushroom_Frittata_NEW.jpg', 'مشروم-فريتاتا', 'mushroom-frittata', 'Scrambled Eggs', 'Scrambled Eggs'),
(27, 1, 3.25, 0, 1, '2018-07-08 11:05:04', '2019-05-03 19:00:38', 'الإفطار الإنجليزي', 'English Breakfast', 'افطار كامل مع السجق وشرائحاللحم المقدد والبيض والمشروم وخبز التوست', 'Complete breakfast meal with sausage, bacon, egg, mushroom, english beans, tomato served with toast bread.', '1531128968_English_Breakfast_NEW.jpg', '1531128968_English_Breakfast_NEW.jpg', 'الإفطار-الإنجليزي', 'english-breakfast', 'Scrambled Eggs', 'Scrambled Eggs'),
(29, 1, 1.3, 0, 1, '2018-07-08 11:10:42', '2019-05-03 19:00:38', 'الزبادي مع الفواكه', 'Yogurt With Mix berries', 'الزبادي الطازجة مع الغرانولا والتوت المشكل', 'Granola mixed with yogurt served with mix berries.', '1531128855_Yogurt_with_Fruits_Mix_berries_NEW.jpg', '1531128855_Yogurt_with_Fruits_Mix_berries_NEW.jpg', 'الزبادي-مع-الفواكه', 'yogurt-with-mix-berries', 'Scrambled Eggs', 'Scrambled Eggs'),
(32, 1, 2.25, 0, 1, '2018-07-08 11:13:20', '2019-05-03 19:00:38', 'تيركي ديلايت ساندوتش', 'Delight Turkey Sandwich', 'ساندوتش ديلايت مع شرائح الديك الرومي ، جبنةا لشيدر، الخس ومربى الفراولة المصنوعه لدينا', 'Delight sandwich served with turkey, sliced cheese, lettuce and our homemade delicious strawberry jam.', '1531128753_Delight_Turkey_Sandwich_NEW.jpg', '1531128753_Delight_Turkey_Sandwich_NEW.jpg', 'تيركي-ديلايت-ساندوتش', 'delight-turkey-sandwich', 'Scrambled Eggs', 'Scrambled Eggs'),
(34, 1, 3.65, 0, 1, '2018-07-08 11:24:46', '2019-05-03 19:00:39', 'لايت أومليت', 'Light Omelette', 'لايت اوملت مع اختيارك من الديك الرومي، السلمون المدخن، اللحم المقدد، المشروم او جبنه لايت ', 'Delicious light omelettes with the choices of turkey,smoked salmon,bacon, mushroom or low shredded cheese.', '1531128626_Light_Omelette_NEW.jpg', '1531128626_Light_Omelette_NEW.jpg', 'لايت-أومليت', 'light-omelette', 'Scrambled Eggs', 'Scrambled Eggs'),
(36, 1, 2.25, 0, 1, '2018-07-08 11:26:58', '2019-05-03 19:00:39', 'تيركي ديلايت ساندوتش', 'Delight Turkey Sandwich', 'ساندوتش ديلايت مع شرائح الديك الرومي ، جبنةا لشيدر، الخس ومربى الفراولة المصنوعه لدينا', 'Delight sandwich served with turkey, sliced cheese, lettuce and our homemade delicious strawberry jam.', '1531128544_Delight_Turkey_Sandwich_NEW.jpg', '1531128544_Delight_Turkey_Sandwich_NEW.jpg', 'تيركي-ديلايت-ساندوتش', 'delight-turkey-sandwich', 'Scrambled Eggs', 'Scrambled Eggs'),
(41, 2, 2.75, 0, 1, '2018-07-08 11:33:13', '2019-05-03 19:00:39', 'روبيان ديناميت', 'Prawn Dynamite', 'الروبيان المطهو بالفرن مع الخس والمايونيز وصوص هيلثي بار ', 'Mix of atlantic backed shell-on prawn, lettuce, mayonaise, chives with HealthyBar special sauce.', '1531128084_Prawn_Dynamite_NEW.jpg', '1531128084_Prawn_Dynamite_NEW.jpg', 'روبيان-ديناميت', 'prawn-dynamite', 'Scrambled Eggs', 'Scrambled Eggs'),
(43, 2, 1.25, 0, 1, '2018-07-08 11:34:55', '2019-05-03 19:00:39', 'إدامامي', 'Edamame', 'فول الصويا المطهو على البخار', 'Fresh steamed beans.', '1531127947_Edamama_NEW.jpg', '1531127947_Edamama_NEW.jpg', 'إدامامي', 'edamame', 'Scrambled Eggs', 'Scrambled Eggs'),
(44, 2, 2, 0, 1, '2018-07-08 11:37:45', '2019-05-03 19:00:39', 'أسياخ ساتاي', 'Satay Skewers', 'اسياخ الدجاج المتبله اللذيذه', 'Delicious marinated chicken breast skewers.', '1531127905_Satay_Skewers_NEW.jpg', '1531127905_Satay_Skewers_NEW.jpg', 'أسياخ-ساتاي', 'satay-skewers', 'Scrambled Eggs', 'Scrambled Eggs'),
(46, 2, 1.25, 0, 1, '2018-07-08 11:39:19', '2019-05-03 19:00:39', 'ترياكي (كرات اللحم)', 'Teriyaki Meatballs', 'كرات اللحم اللذيذة تقدم  مع صوص الترياكي', 'Delicious meat balls served with teriyaki sauce.', '1531127809_meatballs_teriyaki_NEW.jpg', '1531127809_meatballs_teriyaki_NEW.jpg', 'ترياكي-كرات-اللحم', 'teriyaki-meatballs', 'Scrambled Eggs', 'Scrambled Eggs'),
(51, 3, 2.25, 0, 1, '2018-07-08 11:49:33', '2019-05-03 19:00:39', 'راب دجاج التندوري', 'Chicken Tandoori Wrap', 'شرائح دجاج التندوري مع الطماطم والاناناس والفلفل والزبادي قليل الدسم وصوص النعناع بخبز القمح', 'Strips of tandoori chicken breast, lettuce, tomatoes, pineapple and capsicum with low fat yoghurt mint dressing in a whole wheat tortilla wrap.', '1531127489_Chicken_Tandoori_Wrap_NEW.jpg', '1531127489_Chicken_Tandoori_Wrap_NEW.jpg', 'راب-دجاج-التندوري', 'chicken-tandoori-wrap', 'Scrambled Eggs', 'Scrambled Eggs'),
(52, 3, 2.25, 1, 1, '2018-07-08 11:53:35', '2019-05-03 19:00:39', 'بوريتو اللحم', 'Burritos (Beef)', 'شرائح اللحم المشوية والخس والطماطم والفلفل و الذرة الحلوة وصوص هيلثي بار الحار و الزبادي بخبز القمح', 'Strips of seasoned Beef , lettuce, tomatoes, capsicum, sweet corn and onions with spicy homemade salsa sauce and yogurt in a whole wheat tortilla wrap.', '1531127438_Burritos_Beef_NEW.jpg', '1531127438_Burritos_Beef_NEW.jpg', 'بوريتو-اللحم', 'burritos--beef-', 'Scrambled Eggs', 'Scrambled Eggs'),
(53, 3, 2.25, 0, 1, '2018-07-08 11:56:44', '2019-05-03 19:00:39', 'ساندوتش الدجاج المشوي', 'Grilled Chicken Sandwich', 'صدر الدجاج المشوي مع الفلفل الاخضر والطماطم والجرجير والخس والخيار وصوص الكال الصحي الخاص بخبز القمح', 'Grilled chicken breast, lettuce, rocca tomatoes, capsicum and cucumber with our special sauce in a whole wheat panera bread.', '1531127390_Grilled_Chicken_Sandwich_NEW.jpg', '1531127390_Grilled_Chicken_Sandwich_NEW.jpg', 'ساندوتش-الدجاج-المشوي', 'grilled-chicken-sandwich', 'Scrambled Eggs', 'Scrambled Eggs'),
(54, 41, 1.25, 0, 1, '2018-07-08 11:57:06', '2019-05-03 19:00:39', 'اميريكان كافيه وسط', 'American Coffee Medium', 'كمية مضاعفة من القهوة الامريكية\r\n\r\n', 'Tripple medium roast espresso shots.\r\n\r\n', '1531127303_American_Coffee_NEW.jpg', '1531127303_American_Coffee_NEW.jpg', 'اميريكان-كافيه-وسط', 'american-coffee-medium', 'Scrambled Eggs', 'Scrambled Eggs'),
(55, 3, 2.5, 1, 1, '2018-07-08 12:04:24', '2019-05-03 19:00:39', 'تونا هيلثي بار', 'HealthyBar Tuna Wrap', 'تونا مع الخس والطماطم والبصل الاحمر والخيار والفلفل الاحمر ويقدم مع صوص التوم والزبادي بخبز القمح', 'Tuna quinoa patty, lettuce, tomatoes, red onions, cucumber, and red capsicum with garlic yogurt sauce in a whole wheat tortilla wrap.', '1531127257_HealthyBar_Tuna_Wrap_NEW.jpg', '1531127257_HealthyBar_Tuna_Wrap_NEW.jpg', 'تونا-هيلثي-بار', 'healthybar-tuna-wrap', 'Scrambled Eggs', 'Scrambled Eggs'),
(56, 3, 2.25, 0, 1, '2018-07-08 12:07:32', '2019-05-03 19:00:39', 'شاورما الدجاج', 'Shawarma (Chicken)', 'شاورما الدجاج المتبل المشوي مع الخس والطماطم والفلفل الاحمر والبصل ومخلل الخيار وصوص الطحينه والزبادي بخبز القمح', 'A whole wheat tortilla wrap filled with chicken breast, lettuce, tomatoes, capsicum, onions, gherkins with tahini yogurt dressing.', '1531127173_Shawarma_Chicken_NEW.jpg', '1531127173_Shawarma_Chicken_NEW.jpg', 'شاورما-الدجاج', 'shawarma--chicken-', 'Scrambled Eggs', 'Scrambled Eggs'),
(57, 3, 2.5, 0, 1, '2018-07-08 12:15:37', '2019-05-03 19:00:39', 'شاورما اللحم', 'Shawarma (Beef)', 'شاورما اللحم المتبل المشوي مع الخس والطماطم والفلفل الاحمر والبصل ومخلل الخيار وصوص الطحينه والزبادي بخبز القمح', 'A whole wheat tortilla wrap filled with beef, lettuce, tomatoes, capsicum, onions, gherkins with tahini yogurt dressing.', '1531127076_Shawarma_Beef_NEW.jpg', '1531127076_Shawarma_Beef_NEW.jpg', 'شاورما-اللحم', 'shawarma--beef-', 'Scrambled Eggs', 'Scrambled Eggs'),
(58, 3, 2, 0, 1, '2018-07-08 12:18:10', '2019-05-03 19:00:40', 'بوريتو الدجاج', 'Burritos (Chicken)', 'شرائح الدجاج المشوية والخس والطماطم والفلفل و الذرة الحلوة وصوص هيلثي بار الحار و الزبادي بخبز القمح', 'Strips of seasoned chicken breast , lettuce, tomatoes, capsicum, sweet corn and onions with spicy homemade salsa sauce and yogurt in a whole wheat tortilla wrap.', '1531127028_Burritos_CHicken_NEW.jpg', '1531127028_Burritos_CHicken_NEW.jpg', 'بوريتو-الدجاج', 'burritos--chicken-', 'Scrambled Eggs', 'Scrambled Eggs'),
(59, 4, 3.25, 0, 1, '2018-07-08 12:23:00', '2019-05-03 19:00:40', 'ميني برجر', 'Sliders', 'تمتع مع ثلاثة من الميني برجر اللحم او الدجاج بالخبز الاسمر', 'Enjoy our mix of 3 mini beef or chicken burgers which are served on whole wheat buns.', '1531126969_Sliders_NEW.jpg', '1531126969_Sliders_NEW.jpg', 'ميني-برجر', 'sliders', 'Scrambled Eggs', 'Scrambled Eggs'),
(60, 4, 2.75, 0, 1, '2018-07-08 12:25:55', '2019-05-03 19:00:40', 'سوبريم برجر', 'Supreme Burger', 'صدر الدجاج المشوي والخس، الجرجير، الطماطم، الخيار و صوص هيلثي بار الخاص بخبز القمح', 'Grilled chicken breast , lettuce, rocca tomatoes cucumber and our special sauce on a whole wheat bun.', '1531126914_Supreme_Byurger_NEW.jpg', '1531126914_Supreme_Byurger_NEW.jpg', 'سوبريم-برجر', 'supreme-burger', 'Scrambled Eggs', 'Scrambled Eggs'),
(61, 41, 1.5, 0, 1, '2018-07-08 12:28:06', '2019-05-03 19:00:40', 'اميريكان كافيه كبير', 'American Coffee Large', 'كمية مضاعفة من القهوة الامريكية\r\n\r\n', 'Tripple medium roast espresso shots.\r\n\r\n', '1531126854_American_Coffee_NEW.jpg', '1531126854_American_Coffee_NEW.jpg', 'اميريكان-كافيه-كبير', 'american-coffee-large', 'Scrambled Eggs', 'Scrambled Eggs'),
(62, 4, 3.85, 0, 1, '2018-07-08 12:29:39', '2019-05-03 19:00:40', 'مشروم برجر', 'Mushroom Burger', 'لحم البرجر مع صوص المشروم اللايت مع الجبنة ', 'Light creamy mushroom burger with cheese.', '1531126803_Mushroom_Burger_NEW.jpg', '1531126803_Mushroom_Burger_NEW.jpg', 'مشروم-برجر', 'mushroom-burger', 'Scrambled Eggs', 'Scrambled Eggs'),
(63, 41, 1, 1, 1, '2018-07-08 12:29:52', '2019-05-03 19:00:40', 'اسبريسو صغير', 'Espresso Small', 'فنجان من قهوة اسبريسو المنعشة \r\n\r\n', 'Medium roast espresso shot.\r\n\r\n', '1531126716_Espresso_NEW_11.jpg', '1531126716_Espresso_NEW_11.jpg', 'اسبريسو-صغير', 'espresso-small', 'Scrambled Eggs', 'Scrambled Eggs'),
(64, 41, 1.25, 1, 1, '2018-07-08 12:30:52', '2019-05-03 19:00:40', 'اسبريسو وسط', 'Espresso Medium', 'فنجان من قهوة اسبريسو المنعشة \r\n\r\n', 'Medium roast espresso shot.\r\n\r\n', '1531126652_Espresso_NEW_11.jpg', '1531126652_Espresso_NEW_11.jpg', 'اسبريسو-وسط', 'espresso-medium', 'Scrambled Eggs', 'Scrambled Eggs'),
(65, 4, 2.75, 0, 1, '2018-07-08 12:32:54', '2019-05-03 19:00:40', 'اوروجينال برجر(قطعة)', 'Original Burger (Single)', 'قطعة من لحم البرجر مع الخس، الجرجير، الطماطم، المخلل وصوص هيلثي بار', 'Single prime beef burger , Lettuce, rocca, tomatoes, gherkins and our special sauce.', '1531126510_Original_Burger_NEW.jpg', '1531126510_Original_Burger_NEW.jpg', 'اوروجينال-برجرقطعة', 'original-burger--single-', 'Scrambled Eggs', 'Scrambled Eggs'),
(66, 4, 3.25, 0, 1, '2018-07-08 12:35:12', '2019-05-03 19:00:40', 'وروجينال برجر(قطعتين)', 'Original Burger (Double)', 'قطعتين من لحم البرجر مع الخس، الجرجير، الطماطم، المخلل وصوص هيلثي بار', 'double prime beef burger , Lettuce, rocca, tomatoes, gherkins and our special sauce.', '1531126431_Original_Burger_NEW.jpg', '1531126431_Original_Burger_NEW.jpg', 'وروجينال-برجرقطعتين', 'original-burger--double-', 'Scrambled Eggs', 'Scrambled Eggs'),
(67, 40, 14.95, 0, 1, '2018-07-08 12:36:15', '2019-05-03 19:00:40', 'الديوانية صندوق صحي 3-4 شخص', 'Diwaniya Healthy Box 3-4 Person', 'سلطة خضراء (لشخصين) أسافين البطاطس الأرز البني (لشخصين) الكورية للشواء تندرلوين (لمدة 3 أشخاص) شطيرة الدجاج بوريتوس الشاورما لحم البقر شطيرة الدجاج التندوري التفاف', 'green salad (for 2 person) potato wedges brown rice (for 2 person) korean bbq tenderloin (for 3 person) burritos chicken sandwich shawarma beef sandwich chicken tandoori wrap.\r\n\r\n', '1531126367_Offer_KD_14.jpg', '1531126367_Offer_KD_14.jpg', 'الديوانية-صندوق-صحي-3-4-شخص', 'diwaniya-healthy-box-3-4-person', 'Scrambled Eggs', 'Scrambled Eggs'),
(69, 13, 2, 0, 1, '2018-07-08 12:39:04', '2019-05-03 19:00:40', 'سلطة الفراوله مع الجرجير', 'Strawberry Rocca Salad', 'مزيج من الخضروات الطازجة والفراولة و صوص هيلثي بار المميز', 'Fresh mix of vegetables and strawberry served with HealthyBar special sauce.', '1531126106_Strawberry_Rocca_Salad_rec.jpg', '1531126106_Strawberry_Rocca_Salad_rec.jpg', 'سلطة-الفراوله-مع-الجرجير', 'strawberry-rocca-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(72, 13, 2.5, 0, 1, '2018-07-08 12:44:13', '2019-05-03 19:00:40', 'سلطة كازابلانكا', 'Casablanca Salad', 'جبنه الحلوم المشوية، الكسكس، الطماطم حبات الرمان ،المشروم، الخس والجرجير', 'Grilled halloumi cheese, couscous, tomatoes, pomegranate seed, mushrooms romaine lettuce and rocca.', '1531125918_Casablanca_Salad_NEW.jpg', '1531125918_Casablanca_Salad_NEW.jpg', 'سلطة-كازابلانكا', 'casablanca-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(77, 13, 1.95, 0, 1, '2018-07-08 12:50:02', '2019-05-03 19:00:40', 'سلطة سيزر', 'Caesar Salad', 'المزيج الصحي من الخس و صدر الدجاج المشوي والخبز المحمص و جبنة البارميزون مع صوص هيلثي بار الخاص', 'A healthy combination of iceberg lettuce, parmesan cheese with HealthyBar homemade ceasar dressing.', '1531125589_Caesar_Salad_NEW.jpg', '1531125589_Caesar_Salad_NEW.jpg', 'سلطة-سيزر', 'caesar-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(78, 13, 2.95, 0, 1, '2018-07-08 12:52:01', '2019-05-03 19:00:41', 'سلطة هيرو', 'Hero Salad', 'كرات لحم هيلثي بار اليونانية مع اللحم المفروم و الخس والخيار والفلفل الاحمر والطماطم الكرزية و جبنة فيتا', 'Homemade greek mini meatballs with minced beef romaine lettuce, cucumbers, red capsicum, cherry tomato and feta cheese.', '1531125540_Hero_Salad_NEW.jpg', '1531125540_Hero_Salad_NEW.jpg', 'سلطة-هيرو', 'hero-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(79, 5, 2, 0, 1, '2018-07-08 13:05:37', '2019-05-03 19:00:41', 'كاساديا', 'Quesadillas', 'خبز تورتيلا القمح مع الجاج المشوي وجبنه الشيدر والفلفل الاحمر والطماطم والكزبره الطازجه وصوص هيلثي بار الطماطم ', 'A whole wheat tortilla filled with chicken breast, cheddar cheese, red capsicum, tomatoes, and fresh coriander with homemade tomato salsa sauce.', '1531125414_Quesadillas_NEW.jpg', '1531125414_Quesadillas_NEW.jpg', 'كاساديا', 'quesadillas', 'Scrambled Eggs', 'Scrambled Eggs'),
(80, 5, 1.25, 0, 1, '2018-07-08 13:07:41', '2019-05-03 19:00:41', 'برجر الدجاج', 'Chicken Burger', 'برجر الدجاج المشوي اللذيذ المصنوع خصيصا للاطفال', 'Deliciously grilled chicken burger made especially for kids.', '1531125357_Chicken_Burger_Kids_NEW.jpg', '1531125357_Chicken_Burger_Kids_NEW.jpg', 'برجر-الدجاج', 'chicken-burger', 'Scrambled Eggs', 'Scrambled Eggs'),
(81, 5, 1.25, 1, 1, '2018-07-08 13:09:16', '2019-05-03 19:00:41', 'البطاطا المشويه مع الجبنه', 'Baked Potato with Cheese', 'البطاطا المشويه مع الجبنه', 'Deliciously baked fresh potato with cheese.', '1531125302_Baked_Potato_with_Cheese_Kids_NEW.jpg', '1531125302_Baked_Potato_with_Cheese_Kids_NEW.jpg', 'البطاطا-المشويه-مع-الجبنه', 'baked-potato-with-cheese', 'Scrambled Eggs', 'Scrambled Eggs'),
(82, 38, 2.95, 0, 1, '2018-07-08 13:10:01', '2019-05-03 19:00:41', 'الكينوا مع الفواكه', 'Quinoa Fruits', 'الكينوا اللذيذة مقدمة مع الكيوي، الفراولة، خليط التوت، والموز وعصير البرتقال ونكهة القرفة\r\n\r\n', 'Quinoa, kiwi, strawberry, blackberry, blueberry, raspberry, and banana dashed by cinnamon and orange juice\r\n\r\n', '1531125209_Quinoa__Avocado_NEW_rec.jpg', '1531125209_Quinoa__Avocado_NEW_rec.jpg', 'الكينوا-مع-الفواكه', 'quinoa-fruits', 'Scrambled Eggs', 'Scrambled Eggs'),
(83, 38, 1.3, 0, 1, '2018-07-08 13:11:25', '2019-05-03 19:00:41', 'الزبادي مع الفواكه', 'Yogurt With Mix berries', 'الزبادي الطازجة مع الغرانولا والتوت المشكل\r\n\r\n', 'Granola mix with yogurt served with Mix berries.\r\n\r\n', '1531069280_Yogurt_with_Fruits_Mix_berries_NEW.jpg', '1531069280_Yogurt_with_Fruits_Mix_berries_NEW.jpg', 'الزبادي-مع-الفواكه', 'yogurt-with-mix-berries', 'Scrambled Eggs', 'Scrambled Eggs'),
(84, 5, 2, 0, 1, '2018-07-08 13:11:27', '2019-05-03 19:00:41', 'مفاجأه الباستا', 'Pasta Surprise', 'معكرونه القمح وصوص هيلثي بار  واللحم المفروم والجزر المبشور', 'Whole wheat pasta with homemade tomato sauce made of minced beef and grated carrot.', '1531069231_Pasta_Surprise_NEW.jpg', '1531069231_Pasta_Surprise_NEW.jpg', 'مفاجأه-الباستا', 'pasta-surprise', 'Scrambled Eggs', 'Scrambled Eggs'),
(87, 5, 1.25, 1, 1, '2018-07-08 13:29:06', '2019-05-03 19:00:41', 'البطاطا المشويه مع الجبنه', 'Baked Potato with Cheese', 'البطاطا المشويه مع الجبنه', 'Deliciously baked fresh potato with cheese.', '1531069083_Baked_Potato_with_Cheese_Kids_NEW.jpg', '1531069083_Baked_Potato_with_Cheese_Kids_NEW.jpg', 'البطاطا-المشويه-مع-الجبنه', 'baked-potato-with-cheese', 'Scrambled Eggs', 'Scrambled Eggs'),
(88, 5, 2, 0, 1, '2018-07-08 13:30:51', '2019-05-03 19:00:41', 'مفاجأه الباستا', 'Pasta Surprise', 'معكرونه القمح وصوص هيلثي بار  واللحم المفروم والجزر المبشور', 'Whole wheat pasta with homemade tomato sauce made of minced beef and grated carrot.', '1531069032_Pasta_Surprise_NEW.jpg', '1531069032_Pasta_Surprise_NEW.jpg', 'مفاجأه-الباستا', 'pasta-surprise', 'Scrambled Eggs', 'Scrambled Eggs'),
(89, 37, 1.5, 1, 1, '2018-07-08 13:33:05', '2019-05-03 19:00:41', 'عصير الافوكادو', 'Avocado', 'عصير الأفوكادو المنعش الطازج\r\n\r\n', 'Refreshing avocado juice.\r\n\r\n', '1531068971_Avocado_Juice_NEW.jpg', '1531068971_Avocado_Juice_NEW.jpg', 'عصير-الافوكادو', 'avocado', 'Scrambled Eggs', 'Scrambled Eggs'),
(90, 5, 1, 1, 1, '2018-07-08 13:34:22', '2019-05-03 19:00:41', 'ناغتس', 'Chicken Nuggets', 'قطع صغيرة من صدر الدجاج الممزوجة بجوز الهند', 'Bite sized chicken breast tenders in a coconut coating.', '1531068900_Chicken_Nuggets_NEW.jpg', '1531068900_Chicken_Nuggets_NEW.jpg', 'ناغتس', 'chicken-nuggets', 'Scrambled Eggs', 'Scrambled Eggs'),
(91, 37, 2.25, 0, 1, '2018-07-08 13:36:16', '2019-05-03 19:00:41', 'عصير التوت المشكل', 'Mix Berries', 'عصير من مكس التوت المنعش الطازج\r\n\r\n', 'Refreshing mix berries juice.\r\n\r\n', '1531068843_Mix_Berries_Juice_NEW.jpg', '1531068843_Mix_Berries_Juice_NEW.jpg', 'عصير-التوت-المشكل', 'mix-berries', 'Scrambled Eggs', 'Scrambled Eggs'),
(92, 7, 1.25, 0, 1, '2018-07-08 13:39:00', '2019-05-03 19:00:41', 'معكرونه القمح الكامل', 'Whole Wheat Pasta', 'معكرونه القمح  الكامل مع صوص هيلثي بار', 'Whole wheat penne pasta with homemade tomato sauce or white sauce with mushroom.', '1531068783_Whole_Wheat_Pasta_NEW.jpg', '1531068783_Whole_Wheat_Pasta_NEW.jpg', 'معكرونه-القمح-الكامل', 'whole-wheat-pasta', 'Scrambled Eggs', 'Scrambled Eggs'),
(93, 37, 1.25, 0, 1, '2018-07-08 13:40:50', '2019-05-03 19:00:41', 'عصير ليمون مع النعناع', 'Lemon With Mint', 'عصير الليمون مع النعناع المنعش الطازج\r\n\r\n', 'Refreshing lemon juice with mint.\r\n\r\n', '1531068738_Lemon_with_Mint_Juice_NEW.jpg', '1531068739_Lemon_with_Mint_Juice_NEW.jpg', 'عصير-ليمون-مع-النعناع', 'lemon-with-mint', 'Scrambled Eggs', 'Scrambled Eggs'),
(94, 37, 1.25, 0, 1, '2018-07-08 13:44:04', '2019-05-03 19:00:41', 'عصير بطيخ', 'Watermelon', 'عصير البطيخ المنعش الطازج\r\n\r\n', 'Refreshing watermelon juice.\r\n\r\n', '1531068700_Watermelon_Juice_NEW.jpg', '1531068700_Watermelon_Juice_NEW.jpg', 'عصير-بطيخ', 'watermelon', 'Scrambled Eggs', 'Scrambled Eggs'),
(95, 37, 1.25, 0, 1, '2018-07-08 13:45:57', '2019-05-03 19:00:41', 'عصير البرتقال', 'Orange', 'عصير البرتقال المنعش الطازج\r\n\r\n', 'Refreshing orange juice.\r\n\r\n', '1531068647_Orange_Juice_NEW.jpg', '1531068647_Orange_Juice_NEW.jpg', 'عصير-البرتقال', 'orange', 'Scrambled Eggs', 'Scrambled Eggs'),
(96, 7, 1.25, 0, 1, '2018-07-08 13:48:48', '2019-05-03 19:00:42', 'الأرز مع الخضراوات', 'Veg. Fried Rice', 'الأرز مع الخضروات المشكلة والصويا صوص', 'Mixed fresh vegetables with soya sauce and rice.', '1531068560_Vegi_Ricerec.jpg', '1531068560_Vegi_Ricerec.jpg', 'الأرز-مع-الخضراوات', 'veg--fried-rice', 'Scrambled Eggs', 'Scrambled Eggs'),
(98, 7, 0.95, 0, 1, '2018-07-08 13:59:12', '2019-05-03 19:00:42', 'شرائح البطاطا الحلوة', 'Sweet Potato Wedges', 'شرائح البطاطا الحلوة المطهوة مع خلطة خاصة من التوابل', 'Slices of baked sweet potato with our spices.', '1531068384_Sweet_Potato_Wedges_NEW.jpg', '1531068384_Sweet_Potato_Wedges_NEW.jpg', 'شرائح-البطاطا-الحلوة', 'sweet-potato-wedges', 'Scrambled Eggs', 'Scrambled Eggs'),
(99, 36, 1.6, 0, 1, '2018-07-08 14:00:42', '2019-05-03 19:00:42', 'كيكة الجزر مع الموز', 'Rabbit Banana Square', 'كيكة الجزر و الموز الشهية\r\n\r\n', 'Freshly baked Banana and carrot cake.\r\n\r\n', '1531068331_Rabbit_Banana_Square_NEW.jpg', '1531068331_Rabbit_Banana_Square_NEW.jpg', 'كيكة-الجزر-مع-الموز', 'rabbit-banana-square', 'Scrambled Eggs', 'Scrambled Eggs'),
(100, 7, 1.5, 0, 1, '2018-07-08 14:02:14', '2019-05-03 19:00:42', 'البطاطا الحلوه المهروسه', 'Sweet Potato Mash', 'البطاطا الحلوه المهروسه تقدم مع العسل', 'Sweet potato mash served with honey.', '1531068276_Sweet_Potato_Mash_NEW.jpg', '1531068276_Sweet_Potato_Mash_NEW.jpg', 'البطاطا-الحلوه-المهروسه', 'sweet-potato-mash', 'Scrambled Eggs', 'Scrambled Eggs'),
(101, 36, 1.5, 0, 1, '2018-07-08 14:03:06', '2019-05-03 19:00:42', 'موس شوكولا', 'Dark Chocolate Mousse', 'موس بكريمة الشوكولا الداكنه\r\n\r\n', 'Heavenly dark creamy chocolate mousse.\r\n\r\n', '1531066660_Dark_Chocolate_Mousse__Raspberry__NEW.jpg', '1531066660_Dark_Chocolate_Mousse__Raspberry__NEW.jpg', 'موس-شوكولا', 'dark-chocolate-mousse', 'Scrambled Eggs', 'Scrambled Eggs'),
(102, 7, 1.25, 1, 1, '2018-07-08 14:04:44', '2019-05-03 19:00:42', 'بطاطا مشوية (جبنه)', 'Baked Potato (Cheese)', 'البطاطا المطهوة بالفرن مع الجبنه', 'A light creamy blend of cheese potato mixed with cheddar cheese, jalapeno, tomato, thyme and spring onion.', '1531066029_Baked_Potato_Cheese_NEW.jpg', '1531066029_Baked_Potato_Cheese_NEW.jpg', 'بطاطا-مشوية-جبنه', 'baked-potato--cheese-', 'Scrambled Eggs', 'Scrambled Eggs'),
(103, 7, 1.5, 0, 1, '2018-07-08 14:06:15', '2019-05-03 19:00:42', 'بطاطا مشوية (تونا)', 'Baked Potato (Tuna)', 'البطاطا المطهوة بالفرن مع التونا', 'A light creamy blend of tuna potato mixed with cheddar cheese, jalapeno, tomato, thyme and spring onion.', '1531065972_Baked_Potato_Tuna_NEW.jpg', '1531065973_Baked_Potato_Tuna_NEW.jpg', 'بطاطا-مشوية-تونا', 'baked-potato--tuna-', 'Scrambled Eggs', 'Scrambled Eggs'),
(104, 36, 1.6, 1, 1, '2018-07-08 14:07:14', '2019-05-03 19:00:42', 'لايت بانا كوتا', 'Light Panna Cotta', 'الباناكوتا الشهية  من الكريمه منزوعة الدسم والفانيلا مع اختيارك من جوز الهند المبشور، خليط التوت، الفراولة، او الموز\r\n\r\n', 'Delicious dessert of our light healthy ingredients with light cream & vanilla served by your choice of shredded coconut, mix berries, strawberry, or banana.\r\n\r\n', '1531065883_Light_Panna_Cotta_NEW_rec.jpg', '1531065883_Light_Panna_Cotta_NEW_rec.jpg', 'لايت-بانا-كوتا', 'light-panna-cotta', 'Scrambled Eggs', 'Scrambled Eggs'),
(105, 7, 1.25, 1, 1, '2018-07-08 14:08:05', '2019-05-03 19:00:42', 'الأرز البني', 'Brown Rice', 'الأرز البني المطهو على البخار', 'Steamed brown rice', '1531065776_Brown_Rice_NEW.jpg', '1531065776_Brown_Rice_NEW.jpg', 'الأرز-البني', 'brown-rice', 'Scrambled Eggs', 'Scrambled Eggs'),
(106, 7, 0.85, 0, 1, '2018-07-08 14:10:27', '2019-05-03 19:00:42', 'شرائح البطاطا', 'Potato Wedges', 'شرائح البطاطا المطهوة مع خلطة خاصة من التوابل', 'Slices of baked potato with our spices.', '1531065736_Potato_Wedges_NEW.jpg', '1531065736_Potato_Wedges_NEW.jpg', 'شرائح-البطاطا', 'potato-wedges', 'Scrambled Eggs', 'Scrambled Eggs'),
(107, 36, 1.6, 1, 1, '2018-07-08 14:11:04', '2019-05-03 19:00:42', 'براوني هيلثي بار', 'Gluten-free Brownie', 'براوني الخاليه من الغلوتين مع خلطة هيلثي بار السريه\r\n\r\n', 'Guilt-free rich chocolate brownie with our secret Ingredients.\r\n\r\n', '1531065682_Gluten-free_Brownie_NEW.jpg', '1531065682_Gluten-free_Brownie_NEW.jpg', 'براوني-هيلثي-بار', 'gluten-free-brownie', 'Scrambled Eggs', 'Scrambled Eggs'),
(108, 7, 1.25, 0, 1, '2018-07-08 14:12:15', '2019-05-03 19:00:43', 'السلطه الخضراء', 'Green Salad', 'السلطة الخضراء المكونه من الخس والطماطم والخيار وخل البلسمك', 'Letucce tomato and cucumber balsamic vinegar dressing.', '1531065602_Green_Salad_NEW.jpg', '1531065602_Green_Salad_NEW.jpg', 'السلطه-الخضراء', 'green-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(109, 7, 1.25, 0, 1, '2018-07-08 14:13:37', '2019-05-03 19:00:43', 'خضراوات مشكلة', 'Mixed Vegie Box', 'مزيج من الخضراوات المشكلة من الزهرة، الفاصولياء الخضراء، الكوسا، الجزر والطماطم الكرزية', 'Steamed cauliflower, green beans, zucchini, carrots, broccoli and cherry tomatoes.', '1531065546_Mixed_Vegie_Box_NEW.jpg', '1531065546_Mixed_Vegie_Box_NEW.jpg', 'خضراوات-مشكلة', 'mixed-vegie-box', 'Scrambled Eggs', 'Scrambled Eggs'),
(110, 7, 1.75, 1, 1, '2018-07-08 14:15:22', '2019-05-03 19:00:43', 'صندوق البروكلي', 'Broccoli Box', 'البروكلي الطازجة المطهوة على البخار', 'Steamed broccoli.', '1531065492_Broccoli_Box_NEW.jpg', '1531065492_Broccoli_Box_NEW.jpg', 'صندوق-البروكلي', 'broccoli-box', 'Scrambled Eggs', 'Scrambled Eggs'),
(112, 8, 3.5, 1, 1, '2018-07-08 14:33:31', '2019-05-03 19:00:43', 'ستروغونوف', 'Stroganoff', 'شرائح الاستيك المتبلة تقدم مع الفطر والبصل', 'Marinated beef with mushroms and onions.', '1531063163_Straganoffrec.jpg', '1531063163_Straganoffrec.jpg', 'ستروغونوف', 'stroganoff', 'Scrambled Eggs', 'Scrambled Eggs'),
(113, 36, 1.5, 1, 1, '2018-07-08 14:35:04', '2019-05-03 19:00:43', 'شوكوليت كوكيز (٣ قطع)', 'Chocolate Cookies (3 Pcs)', 'كوكيز مع قطع الشوكوليت ، زيت الجوز هند مغطاه بوصفة هيلثي بار الصحيه\r\n\r\n', 'Organic Chocolate Chip, Coconut oil indulge with delicious healthybar receipe\r\n\r\n', '1531065409_WhatsApp_Image_2018-05-18_at_20.45.01rec.JPG', '1531065410_WhatsApp_Image_2018-05-18_at_20.45.01rec.JPG', 'شوكوليت-كوكيز-٣-قطع', 'chocolate-cookies--3-pcs-', 'Scrambled Eggs', 'Scrambled Eggs'),
(114, 8, 3.5, 0, 1, '2018-07-08 14:35:49', '2019-05-03 19:00:43', 'شرائح الدجاج المشوية على الطريقة الكورية', 'Korean Chicken BBQ', 'شرائح الدجاج المشوية بالطريقة الكورية مع الفلفل الحلو والجزر الطازج مع السمسم', 'Marinated chicken in korean bbq sauce with mixed capsicum and fresh carrots topped with seasme seed.', '1531063283_Korean_Chicken_BBQrec.jpg', '1531063283_Korean_Chicken_BBQrec.jpg', 'شرائح-الدجاج-المشوية-على-الطريقة-الكورية', 'korean-chicken-bbq', 'Scrambled Eggs', 'Scrambled Eggs'),
(115, 36, 1.6, 1, 1, '2018-07-08 14:37:36', '2019-05-03 19:00:43', 'كرات الشوكولا بالمكسرات', 'Choconut Treats', 'الشوكولا الداكنه الممزوجه مع الجوز واللوز وجوز الهند وبذور السمسم\r\n\r\n', 'Clusters of chopped almonds, walnuts shredded Cocunut dipped in dark chocolate.\r\n\r\n', '1531064907_Choconut_T_NEW.jpg', '1531064907_Choconut_T_NEW.jpg', 'كرات-الشوكولا-بالمكسرات', 'choconut-treats', 'Scrambled Eggs', 'Scrambled Eggs'),
(116, 8, 3.95, 0, 1, '2018-07-08 14:38:05', '2019-05-03 19:00:43', 'لحم الكاري', 'Red Beef Curry', 'اللحم المطهو مع صوص الكاري يقدم مع الخضروات الطازجة', 'Beef with red thai curry & fresh vegtables.', '1531063448_red_beef_curryrec.jpg', '1531063448_red_beef_curryrec.jpg', 'لحم-الكاري', 'red-beef-curry', 'Scrambled Eggs', 'Scrambled Eggs'),
(117, 8, 2.75, 0, 1, '2018-07-08 14:40:01', '2019-05-03 19:00:43', 'سمك الفيليه', 'Fish Fillet', 'سمك الفيليه المشوي مع الخردل والشبت الطازج', 'Marinated white dorri fish in dejon mustard with fresh dill.', '1531063524_Fish_Filleterec.jpg', '1531063524_Fish_Filleterec.jpg', 'سمك-الفيليه', 'fish-fillet', 'Scrambled Eggs', 'Scrambled Eggs'),
(118, 36, 1.25, 0, 1, '2018-07-08 14:40:05', '2019-05-03 19:00:43', 'كيكة الجزر', 'Carrot Cake', 'كيكة الجزر الشهية\r\n\r\n', 'Deliciously baked carrot cake.\r\n\r\n', '1531064484_Carrot_Cake_NEW.jpg', '1531064484_Carrot_Cake_NEW.jpg', 'كيكة-الجزر', 'carrot-cake', 'Scrambled Eggs', 'Scrambled Eggs'),
(119, 8, 4.75, 1, 1, '2018-07-08 14:41:59', '2019-05-03 19:00:43', 'سلمون ترياكي', 'Salmon Teriyaki', 'فيليه السلمون المطهو على البخار مع صوص الترياكي والخضروات الطازجة', 'Steamed salmon marinated in teriyaki sauce with fresh vegtables.', '1531063601_Salmon_Teriyakirec.jpg', '1531063601_Salmon_Teriyakirec.jpg', 'سلمون-ترياكي', 'salmon-teriyaki', 'Scrambled Eggs', 'Scrambled Eggs'),
(121, 8, 3.85, 0, 1, '2018-07-08 14:43:52', '2019-05-03 19:00:43', 'شرائح تندرلوين مشوية على الطريقة الكورية', 'Korean BBQ Tenderloin', 'شرائح اللحم المتبله مع الزنجبيل والصويا صوص والفلفل الحار والبصل والفلفل الاحمر والجزر والسمسم', 'Strips of korean style beef tenderloin, perfectly marinated in ginger, soy sauce and chilli peppers with onions, red capsicum, carrots and sesame seeds.', '1531063732_korean_NEW.jpg', '1531063732_korean_NEW.jpg', 'شرائح-تندرلوين-مشوية-على-الطريقة-الكورية', 'korean-bbq-tenderloin', 'Scrambled Eggs', 'Scrambled Eggs'),
(122, 8, 3.25, 1, 1, '2018-07-08 14:48:04', '2019-05-03 19:00:43', 'فيتوتشيني ألفريدو', 'Alfredo Fettuccini Pasta', 'صدر دجاج مشوي  يقدم مع صوص هيلثي بار البيضاء جبنة البارميزون والأعشاب الطازجة', 'Whole wheat brown pasta served with, grilled chicken, special home made white sauce, parmesan cheese and fresh herbs.', '1531061284_alfredo_pasta_NEW.jpg', '1531061284_alfredo_pasta_NEW.jpg', 'فيتوتشيني-ألفريدو', 'alfredo-fettuccini-pasta', 'Scrambled Eggs', 'Scrambled Eggs'),
(123, 8, 3.5, 0, 1, '2018-07-08 14:50:28', '2019-05-03 19:00:43', 'كرات اللحم مع الكوسا', 'Meatballs Zucchini', 'كرات  اللحم  المقدمة مع صوص هيلثي بار ، جبن الموزاريلا  والكوسا', 'Lean beef meatballs with homemade tomato sauce, mozarella cheese and zucchini noodles.', '1531061428_Meatballs_Zucchini_NEW.jpg', '1531061428_Meatballs_Zucchini_NEW.jpg', 'كرات-اللحم-مع-الكوسا', 'meatballs-zucchini', 'Scrambled Eggs', 'Scrambled Eggs'),
(124, 8, 3.25, 0, 1, '2018-07-08 14:52:42', '2019-05-03 19:00:43', 'دجاج البروكلي على الطريقة المكسيكية', 'Mexican Chicken Broccoli', 'الدجاج المتبل مع البروكلي وصوص هيلثي بار الطماطم', 'Seasoned chicken breast and broccoli with homemade tomato salsa.', '1531061562_Mexican_Chicken_Broccoli_NEW.jpg', '1531061562_Mexican_Chicken_Broccoli_NEW.jpg', 'دجاج-البروكلي-على-الطريقة-المكسيكية', 'mexican-chicken-broccoli', 'Scrambled Eggs', 'Scrambled Eggs'),
(125, 35, 1, 0, 1, '2018-07-08 14:53:57', '2019-05-03 19:00:44', 'ديتوكس انيرجي لايم', 'Energy Lime', 'مياه خالية من السعرات الحرارية تساعد على طرد السموم\r\n\r\n', 'Energizing lime drink.\r\n\r\n', '1531064391_Energy_Lime_NEW.jpg', '1531064391_Energy_Lime_NEW.jpg', 'ديتوكس-انيرجي-لايم', 'energy-lime', 'Scrambled Eggs', 'Scrambled Eggs'),
(126, 8, 3, 0, 1, '2018-07-08 14:54:35', '2019-05-03 19:00:44', 'سباجيتي بولونيز', 'Spaghetti Bolognese', 'معكرونة القمح الكامل تقدم مع صوص الطماطم واللحم المفروم والاعشاب الطازجه', 'Whole wheat brown pasta served with ground beef meat sauce, tomato sauce and fresh herbs.', '1531061675_Spaghetti_Bolognese_NEW.jpg', '1531061675_Spaghetti_Bolognese_NEW.jpg', 'سباجيتي-بولونيز', 'spaghetti-bolognese', 'Scrambled Eggs', 'Scrambled Eggs'),
(127, 35, 1.25, 0, 1, '2018-07-08 14:56:33', '2019-05-03 19:00:44', 'ديتوكس التوت و الليمون', 'Lemon Raspberry', 'مياه خالية من السعرات الحرارية تساعد على طرد السموم\r\n\r\n', 'Detoxifying lemon raspberry drink.\r\n\r\n', '1531064343_Lemon_Raspberry_NEW.jpg', '1531064343_Lemon_Raspberry_NEW.jpg', 'ديتوكس-التوت-و-الليمون', 'lemon-raspberry', 'Scrambled Eggs', 'Scrambled Eggs'),
(129, 35, 1, 0, 1, '2018-07-08 14:57:50', '2019-05-03 19:00:44', 'ديتوكس الخيار و الليمون و النعناع', 'Lemon Cucumber Mint', 'مياه خالية من السعرات الحرارية تساعد على طرد السموم\r\n\r\n', 'Detoxifying lemon cucumber mint drink.\r\n\r\n', '1531064303_Lemon_Cucumber_Mint_NEW.jpg', '1531064303_Lemon_Cucumber_Mint_NEW.jpg', 'ديتوكس-الخيار-و-الليمون-و-النعناع', 'lemon-cucumber-mint', 'Scrambled Eggs', 'Scrambled Eggs'),
(130, 8, 3.25, 1, 1, '2018-07-08 14:58:34', '2019-05-03 19:00:44', 'طبق الطاقة', 'Power Bowl', 'الدجاج المتبل المشوي يقدم مع الفلفل الاحمر والكوسا والاسبراغوس  والبصل الاخضر وجوز الهند المبشور والخل', 'Marinated chicken breast, red capsicum, zucchini, asparagus spring onion and shredded coconut with balsamic vinegar.', '1531061914_Power_Bowl_NEW_copy.jpg', '1531061914_Power_Bowl_NEW_copy.jpg', 'طبق-الطاقة', 'power-bowl', 'Scrambled Eggs', 'Scrambled Eggs'),
(133, 34, 2.5, 1, 1, '2018-07-08 15:03:15', '2019-05-03 19:00:44', 'لوز ديلايت', 'Almond Delight', 'الافكادو وبروتين الفانيلا وحليب اللوز والتفاح الاخضر و الخيار والشمام والموز\r\n\r\n', 'A power boosting blend of avocado, vanilla, almond milk, fresh green apple juice, cucumber, honeymelon and banana.\r\n\r\n', '1531064143_Almond_Delight_NEW.jpg', '1531064143_Almond_Delight_NEW.jpg', 'لوز-ديلايت', 'almond-delight', 'Scrambled Eggs', 'Scrambled Eggs'),
(134, 34, 2.5, 0, 1, '2018-07-08 15:04:21', '2019-05-03 19:00:44', 'التوت والزنجبيل', 'Ginger Berry', 'الفراوله مع الزنجبيل والموز والعسل\r\n\r\n', 'Blend of strawberry, ginger, banana and honey.\r\n\r\n', '1531064093_Ginger_Berry_NEW.jpg', '1531064093_Ginger_Berry_NEW.jpg', 'التوت-والزنجبيل', 'ginger-berry', 'Scrambled Eggs', 'Scrambled Eggs'),
(135, 8, 3.75, 0, 1, '2018-07-08 15:05:16', '2019-05-03 19:00:44', 'لفائف الستيك', 'Steak Rolls', 'شرائح اللحم مع الفلفل الاخضر والاحمر والاصفر والفاصوليا الخضراء', 'Rolls of steak mix with capsicum and beans.', '1531062316_Steak_Rolls_NEW.jpg', '1531062316_Steak_Rolls_NEW.jpg', 'لفائف-الستيك', 'steak-rolls', 'Scrambled Eggs', 'Scrambled Eggs'),
(136, 34, 1.5, 1, 1, '2018-07-08 15:05:35', '2019-05-03 19:00:44', 'الوحش الاخضر', 'Green Monster', 'خليط من اوراق السبانخ الطازجة وزبدة الفول السوداني، حليب خالي الدسم، الموز و الزبادي\r\n\r\n', 'Blend of fresh spinach, peanut butter, fat free milk, banana and yogurt.\r\n\r\n', '1531064056_Green_Monster_NEW.jpg', '1531064056_Green_Monster_NEW.jpg', 'الوحش-الاخضر', 'green-monster', 'Scrambled Eggs', 'Scrambled Eggs'),
(140, 8, 3.85, 1, 1, '2018-07-08 15:10:49', '2019-05-03 19:00:44', 'ستيك اللحم', 'Beef Steak', 'الحم المشوي المقدم مع البروكلي والقرنبيط وصوص الستيك والفلفل المملح', 'Roasted fresh beef tenderloin, broccoli, cauliflower, steak sauce and salted pepper.', '1531062649_Beef_Steak_NEW.jpg', '1531062649_Beef_Steak_NEW.jpg', 'ستيك-اللحم', 'beef-steak', 'Scrambled Eggs', 'Scrambled Eggs'),
(143, 8, 4.75, 1, 1, '2018-07-08 15:15:54', '2019-05-03 19:00:45', 'يخنة السلمون', 'Salmon Ragout', 'فيليه السلمون المشوي يقدم مع الكرز والطماطم والفاصوليا الخضراء والكريمه قليله الدسم و الصوص', 'Roasted salmon fillet, cherry tomato and green beans with low fat cream sauce beans.', '1531062954_Brown_Rice_Salmon_NEW.jpg', '1531062954_Brown_Rice_Salmon_NEW.jpg', 'يخنة-السلمون', 'salmon-ragout', 'Scrambled Eggs', 'Scrambled Eggs'),
(147, 13, 1, 1, 1, '2018-07-09 11:27:19', '2019-05-03 19:00:45', 'سلطة فواكة', 'Fruit Salad', 'سلطة فواكة', 'Fruit Salad', '1531135639_fruit-salad-3.jpg', '1531135639_fruit-salad-3.jpg', 'سلطة-فواكة', 'fruit-salad', 'Scrambled Eggs', 'Scrambled Eggs'),
(150, 1, 1, 0, 1, '2018-07-09 11:39:30', '2019-05-03 19:00:45', 'البيض الأبيض مع اللحم التيركي المقدد', 'Light White Omelette with Turkey Bacon', 'البيض الأبيض مع اللحم التيركي\r\nالمقدد', 'Light White Omelette with\r\nTurkey Bacon', '1531136369_Light_Omelette_NEW.jpg', '1531136370_Light_Omelette_NEW.jpg', 'البيض-الأبيض-مع-اللحم-التيركي-المقدد', 'light-white-omelette-with-turkey-bacon', 'Scrambled Eggs', 'Scrambled Eggs'),
(167, 8, 1, 1, 1, '2018-07-09 12:28:18', '2019-05-03 19:00:45', 'سمك الفيليه صوص ليمون', 'Fish Fillet with Lemon Soup', 'سمك الفيليه صوص ليمون', 'Fish Fillet with Lemon Soup', '1531139298_Fish_Filleterec.jpg', '1531139298_Fish_Filleterec.jpg', 'سمك-الفيليه-صوص-ليمون', 'fish-fillet-with-lemon-soup', 'Scrambled Eggs', 'Scrambled Eggs'),
(190, 1, 0, 1, 0, '2018-07-09 13:31:36', '2019-05-10 01:30:42', 'بيض سكرامبل', 'Scrambled Eggs', 'بيض سكرامبل', 'Scrambled Eggs', '1531143096_scrampledEgg.jpg', '1531143096_scrampledEgg.jpg', 'بيض-سكرامبل', 'scrambled-eggs', 'Scrambled Eggs', 'Scrambled Eggs');

-- --------------------------------------------------------

--
-- Table structure for table `dish_branch_prices`
--

CREATE TABLE `dish_branch_prices` (
  `id` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `dish_branch_prices`
--

INSERT INTO `dish_branch_prices` (`id`, `dish_id`, `branch_id`, `price`) VALUES
(13, 143, 1, 4),
(14, 143, 2, 5),
(23, 190, 1, 4),
(24, 190, 2, 5),
(25, 190, 7, 9654),
(30, 167, 1, 4),
(31, 167, 2, 5),
(32, 167, 7, 5778),
(33, 150, 1, 4),
(34, 150, 2, 5),
(35, 150, 7, 621),
(36, 147, 1, 4),
(37, 147, 2, 5),
(38, 147, 7, 31489),
(39, 143, 7, 9.5),
(40, 140, 1, 4),
(41, 140, 2, 5),
(42, 140, 7, 16),
(46, 136, 1, 4),
(47, 136, 2, 5),
(48, 136, 7, 3698),
(49, 135, 1, 4),
(50, 135, 2, 5),
(51, 135, 7, 14798789),
(52, 134, 1, 4),
(53, 134, 2, 5),
(54, 134, 7, 196),
(55, 133, 1, 4),
(56, 133, 2, 5),
(57, 133, 7, 7895),
(61, 130, 1, 4),
(62, 130, 2, 5),
(63, 130, 7, 20588676),
(64, 129, 1, 4),
(65, 129, 2, 5),
(66, 129, 7, 18),
(67, 127, 1, 4),
(68, 127, 2, 5),
(69, 127, 7, 54),
(70, 126, 1, 4),
(71, 126, 2, 5),
(72, 126, 7, 18),
(73, 125, 1, 4),
(74, 125, 2, 5),
(75, 125, 7, 14845),
(76, 124, 1, 4),
(77, 124, 2, 5),
(78, 124, 7, 17),
(79, 123, 1, 4),
(80, 123, 2, 5),
(81, 123, 7, 22),
(82, 122, 1, 4),
(83, 122, 2, 5),
(84, 122, 7, 17),
(85, 121, 1, 4),
(86, 121, 2, 5),
(87, 121, 7, 6),
(88, 119, 1, 4),
(89, 119, 2, 5),
(90, 119, 7, 21),
(91, 118, 1, 4),
(92, 118, 2, 5),
(93, 118, 7, 20),
(94, 116, 1, 4),
(95, 116, 2, 5),
(96, 116, 7, 36),
(97, 115, 1, 4),
(98, 115, 2, 5),
(99, 115, 7, 8),
(100, 114, 1, 4),
(101, 114, 2, 5),
(102, 114, 7, 6),
(103, 113, 1, 4),
(104, 113, 2, 5),
(105, 113, 7, 1.546456),
(106, 112, 1, 4),
(107, 112, 2, 5),
(108, 112, 7, 6.5),
(109, 110, 1, 4),
(110, 110, 2, 5),
(111, 110, 7, 6),
(112, 109, 1, 4),
(113, 109, 2, 5),
(114, 109, 7, 6),
(115, 107, 1, 4),
(116, 107, 2, 5),
(117, 107, 7, 6),
(118, 106, 1, 4),
(119, 106, 2, 5),
(120, 106, 7, 6),
(121, 105, 1, 4),
(122, 105, 2, 5),
(123, 105, 7, 79),
(124, 104, 1, 4),
(125, 104, 2, 5),
(126, 104, 7, 6),
(127, 103, 1, 4),
(128, 103, 2, 5),
(129, 103, 7, 0.1231254),
(130, 102, 1, 4),
(131, 102, 2, 5),
(132, 102, 7, 69),
(133, 101, 1, 4),
(134, 101, 2, 5),
(135, 101, 7, 6),
(136, 100, 1, 4),
(137, 100, 2, 5),
(138, 100, 7, 80),
(139, 99, 1, 4),
(140, 99, 2, 5),
(141, 99, 7, 47),
(142, 98, 1, 4),
(143, 98, 2, 5),
(144, 98, 7, 6),
(145, 96, 1, 4),
(146, 96, 2, 5),
(147, 96, 7, 81),
(148, 95, 1, 4),
(149, 95, 2, 5),
(150, 95, 7, 90),
(151, 94, 1, 4),
(152, 94, 2, 5),
(153, 94, 7, 84),
(154, 93, 1, 4),
(155, 93, 2, 5),
(156, 93, 7, 0.1545645),
(157, 92, 1, 4),
(158, 92, 2, 5),
(159, 92, 7, 12),
(160, 91, 1, 4),
(161, 91, 2, 5),
(162, 91, 7, 87),
(163, 90, 1, 4),
(164, 90, 2, 5),
(165, 90, 7, 6),
(166, 89, 1, 4),
(167, 89, 2, 5),
(168, 89, 7, 9),
(169, 88, 1, 4),
(170, 88, 2, 5),
(171, 88, 7, 89),
(172, 87, 1, 4),
(173, 87, 2, 5),
(174, 87, 7, 6),
(175, 84, 1, 4),
(176, 84, 2, 5),
(177, 84, 7, 6),
(178, 83, 1, 4),
(179, 83, 2, 5),
(180, 83, 7, 69),
(181, 82, 1, 4),
(182, 82, 2, 5),
(183, 82, 7, 33),
(184, 81, 1, 4),
(185, 81, 2, 5),
(186, 81, 7, 6),
(187, 80, 1, 4),
(188, 80, 2, 5),
(189, 80, 7, 63),
(190, 79, 1, 4),
(191, 79, 2, 5),
(192, 79, 7, 5.8),
(193, 78, 1, 4),
(194, 78, 2, 5),
(195, 78, 7, 6.3),
(196, 77, 1, 4),
(197, 77, 2, 5),
(198, 77, 7, 120),
(199, 72, 1, 4),
(200, 72, 2, 5),
(201, 72, 7, 1.2),
(202, 69, 1, 4),
(203, 69, 2, 5),
(204, 69, 7, 34),
(205, 67, 1, 4),
(206, 67, 2, 5),
(207, 67, 7, 10000000),
(208, 66, 1, 4),
(209, 66, 2, 5),
(210, 66, 7, 4.7),
(211, 65, 1, 4),
(212, 65, 2, 5),
(213, 65, 7, 13),
(214, 64, 1, 4),
(215, 64, 2, 5),
(216, 64, 7, 90000000),
(217, 63, 1, 4),
(218, 63, 2, 5),
(219, 63, 7, 6),
(220, 62, 1, 4),
(221, 62, 2, 5),
(222, 62, 7, 84),
(223, 61, 1, 4),
(224, 61, 2, 5),
(225, 61, 7, 99999999),
(226, 60, 1, 4),
(227, 60, 2, 5),
(228, 60, 7, 6),
(229, 59, 1, 4),
(230, 59, 2, 5),
(231, 59, 7, 63),
(232, 58, 1, 4),
(233, 58, 2, 5),
(234, 58, 7, 0.52),
(235, 57, 1, 4),
(236, 57, 2, 5),
(237, 57, 7, 6),
(238, 56, 1, 4),
(239, 56, 2, 5),
(240, 56, 7, 6),
(241, 55, 1, 4),
(242, 55, 2, 5),
(243, 55, 7, 0.66),
(244, 54, 1, 4),
(245, 54, 2, 5),
(246, 54, 7, 3.4),
(247, 53, 1, 4),
(248, 53, 2, 5),
(249, 53, 7, 96),
(250, 52, 1, 4),
(251, 52, 2, 5),
(252, 52, 7, 0.5555555),
(253, 51, 1, 4),
(254, 51, 2, 5),
(255, 51, 7, 6),
(256, 46, 1, 4),
(257, 46, 2, 5),
(258, 46, 7, 95),
(259, 44, 1, 4),
(260, 44, 2, 5),
(261, 44, 7, 1.5),
(262, 43, 1, 4),
(263, 43, 2, 5),
(264, 43, 7, 2.2),
(265, 41, 1, 4),
(266, 41, 2, 5),
(267, 41, 7, 106),
(268, 36, 1, 4),
(269, 36, 2, 5),
(270, 36, 7, 88),
(271, 34, 1, 4),
(272, 34, 2, 5),
(273, 34, 7, 6),
(274, 32, 1, 4),
(275, 32, 2, 5),
(276, 32, 7, 78),
(277, 29, 1, 4),
(278, 29, 2, 5),
(279, 29, 7, 30),
(283, 27, 1, 4),
(284, 27, 2, 5),
(285, 27, 7, 12),
(289, 24, 1, 4),
(290, 24, 2, 5),
(291, 24, 7, 8.3),
(292, 23, 1, 4),
(293, 23, 2, 5),
(294, 23, 7, 3.5),
(295, 21, 1, 1),
(296, 21, 2, 5),
(297, 21, 7, 1.5),
(298, 22, 1, 4),
(299, 22, 2, 5),
(300, 22, 7, 2.5),
(301, 108, 1, 4),
(302, 108, 2, 5),
(303, 108, 7, 5),
(304, 117, 1, 4),
(305, 117, 2, 5),
(306, 117, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `dish_of_days`
--

CREATE TABLE `dish_of_days` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `dish_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `dish_of_days`
--

INSERT INTO `dish_of_days` (`id`, `slug`, `name_ar`, `name_en`, `dish_id`) VALUES
(1, 'saturday', 'السبت', 'Saturday', 21),
(2, 'sunday', 'الأحد', 'Sunday', 99),
(3, 'monday', 'الإثنين', 'Monday', 23),
(4, 'tuesday', 'الثلاثاء', 'Tuesday', 133),
(5, 'wednesday', 'الاربعاء', 'Wednesday', 21),
(6, 'thursday', 'الخميس', 'Thursday', 27),
(7, 'friday', 'الجمعة', 'Friday', 143);

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
(3, 'How it works', 'كيف تستخدم جاد', 'how_it_works', 'fa-shield', 'style_1', '0', 0, '1', '0', '0', '1', '512_512', '0', 0, 3, 1, 0, 0, '0', 1, '[{\"key\":\"short_desc\",\"type\":\"textarea\",\"name_en\":\"short desc\",\"name_ar\":\"short desc\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '1', 1, '[[{\"rule_key\":\"short_desc\",\"rule_val\":\"required\",\"rule_val_edit\":\"required\"},{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"}]]', '[{\"name\":{\"name_en\":\"Title\",\"name_ar\":\"Title\"},\"details\":{\"name_en\":\"details\",\"name_ar\":\"details\"},\"short\":{\"name_en\":\"Description\",\"name_ar\":\"Description\"},\"upload\":{\"name_en\":\"upload\",\"name_ar\":\"upload\"}}]'),
(4, 'Term and condition', 'الشروط والاحكام', 'term_and_condition', 'fa-shield', 'style_1', '0', 0, '0', '0', '1', '0', '', '0', 1, 9, 0, 0, 0, '0', 0, NULL, '1', '0', 1, '[[]]', '[{\"name\":{\"name_en\":\"\",\"name_ar\":\"\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(5, 'Privacy policy', 'سياسة الخصوصية', 'privacy_policy', 'fa-shield', 'style_1', '0', 0, '0', '0', '1', '0', '', '0', 1, 10, 0, 0, 0, '0', 0, NULL, '1', '0', 1, '[[]]', '[{\"name\":{\"name_en\":\"\",\"name_ar\":\"\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]'),
(6, 'Slider text', 'Slider Text', 'slider_text', 'fa-user', 'style_1', '0', 0, '1', '0', '0', '0', '', '0', 1, 0, 0, 0, 0, '0', 1, '[{\"key\":\"slider_description\",\"type\":\"textarea\",\"name_en\":\"Slider Description\",\"name_ar\":\"Description\",\"class\":\"\",\"sizes\":\"\",\"options_en\":\"\",\"options_ar\":\"\"}]', '0', '0', 1, '[[{\"rule_key\":\"name\",\"rule_val\":\"required|max:75\",\"rule_val_edit\":\"required|max:75\"},{\"rule_key\":\"slider_description\",\"rule_val\":\"required|max:150\",\"rule_val_edit\":\"required|max:150\"}]]', '[{\"name\":{\"name_en\":\"Slider Title\",\"name_ar\":\"Slider Title\"},\"details\":{\"name_en\":\"\",\"name_ar\":\"\"},\"short\":{\"name_en\":\"\",\"name_ar\":\"\"},\"upload\":{\"name_en\":\"\",\"name_ar\":\"\"}}]');

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
(17, 12, 'en', 'fdhfhdfh', 'First', '', '', '1557040842_1537446897_4-light.jpg', NULL, 0, '', ''),
(18, 12, 'ar', 'dfhdfh', 'First', '', '', '1557040845_1537446313_2-light.jpg', NULL, 0, '', ''),
(19, 13, 'en', 'test', 'Slider Text title here', '', '', NULL, '[{\"slider_description\":\"Slider Text Description here\"}]', 0, '', ''),
(20, 13, 'ar', 'test', ' Description', '', '', NULL, '[{\"slider_description\":\" Description\"}]', 0, '', '');

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
(13, 6, 0, 1, 1, 1, '2019-05-02 02:23:51', '2019-05-02 02:23:51');

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
(2, 'Administrator', 'مدير', 'administrator', '2017-05-18 03:00:00', NULL),
(3, 'Operator', 'مشغل', 'operator', '2017-05-18 03:00:00', NULL);

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
(1, 2, 1, 'admin@interteleco.com', '$2y$10$x3irs5cfLxIWJL1nStzfB.qeRiG5v8G7hcYj6Ugnt586vAAa.G3IC', 'Admin', 'interteleco', '1556561447_1501858055_avatar5.png', 0, '', '', 0, 'O8BE5FzIVhJytFHagXRVkMAgkUh3lH0XHeVxBd1BeWluIae5bi1gQbkM1t3R', '2017-05-18 03:00:00', '2019-05-02 00:30:05'),
(2, 2, 1, 'admin@gad.com', '$2y$10$gEvCTKnomWuVwia3Wzxn0.77BpThJdveZJNi/PFuupJC1u0nrbmX6', 'Admin', 'Gad', '1556561367_100_100_1501858055_avatar5.png', 0, '', '', 0, 'TDWukKo4PtkXNnwSZtL0PKkYyXgG4sddxRBLt9M5iFcjYlLYv9YC4AP5aQJG', '2017-08-03 09:27:07', '2019-05-02 03:55:31'),
(3, 3, 1, 'ahmed@interteleco.com', '$2y$10$TgMRNj8BMDtHyzeVRO8ek.KrZSPUZHTRr1bn2MfWcGM7Kguc5mJK6', 'Ahmed', 'Hassan', 'default_avatar_male.png', 0, '', '', 0, 'jc2FEuuksEHPQR1HzdFsN2qLcwiQtjDDFUjHu85rE6uA5q6oAMQys8NNQK3V', '2019-05-01 19:19:27', '2019-05-02 03:55:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_branch_prices`
--
ALTER TABLE `dish_branch_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dish_of_days`
--
ALTER TABLE `dish_of_days`
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
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `dish_branch_prices`
--
ALTER TABLE `dish_branch_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `dish_of_days`
--
ALTER TABLE `dish_of_days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `post_configs`
--
ALTER TABLE `post_configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
