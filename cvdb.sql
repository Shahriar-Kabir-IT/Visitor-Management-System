-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2025 at 01:50 PM
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
-- Database: `cvdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `createuser` varchar(255) DEFAULT NULL,
  `deleteuser` varchar(255) DEFAULT NULL,
  `createbid` varchar(255) DEFAULT NULL,
  `updatebid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission`, `createuser`, `deleteuser`, `createbid`, `updatebid`) VALUES
(1, 'Superuser', NULL, NULL, NULL, '1'),
(2, 'Admin', NULL, NULL, '1', '1'),
(3, 'User', NULL, NULL, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `Staffid` varchar(255) DEFAULT NULL,
  `AdminName` varchar(120) DEFAULT NULL,
  `UserName` varchar(120) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Status` int(11) NOT NULL DEFAULT 1,
  `Photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'avatar15.jpg',
  `Password` varchar(120) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  `Factory` varchar(50) DEFAULT 'Head Office'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `Staffid`, `AdminName`, `UserName`, `FirstName`, `LastName`, `MobileNumber`, `Email`, `Status`, `Photo`, `Password`, `AdminRegdate`, `Factory`) VALUES
(2, 'C001', 'Admin', 'admin', 'Md. Shahriar', 'Kabir', 1300833944, 'arko_ict@ananta.com.bd', 1, 'face19.jpg', '81dc9bdb52d04dc20036dbd8313ed055', '2020-07-21 10:18:39', 'HEAD OFFICE'),
(38, 'AGAD 356', 'User', 'moniya', 'Moniya', 'Sultana', 171319954, 'uttaraadmin@ananta.com.bd', 1, 'avatar15.jpg', '9f3bdd90b595b34cda61d13eabfc5168', '2025-06-23 11:00:09', 'Head Office'),
(39, 'AGAD-0389', 'User', 'alif', 'Walid', 'Alif', 1713124888, 'walid_alif@ananta.com.bd', 1, 'avatar15.jpg', '55eca5ab9e401f1b427a26a1a5672e2e', '2025-06-24 09:29:48', 'Head Office'),
(41, '001', 'User', 'abm01', 'ABM Fashion', 'Limited', 1613199267, 'abm_ict@ananta.com.bd', 1, 'avatar15.jpg', '55eca5ab9e401f1b427a26a1a5672e2e', '2025-06-24 11:20:15', 'ABM'),
(42, '001', 'User', 'ajl01', 'Ananta Jeanswear', 'Limited', 1613199267, 'ajl_ict@ananta.com.bd', 1, 'avatar15.jpg', '55eca5ab9e401f1b427a26a1a5672e2e', '2025-06-24 11:21:44', 'AJL'),
(43, '001', 'User', 'agl01', 'Ananta Garments', 'Limited', 1613199267, 'agl_ict@ananta.com.bd', 1, 'avatar15.jpg', '55eca5ab9e401f1b427a26a1a5672e2e', '2025-06-24 11:22:28', 'AGL'),
(44, '001', 'User', 'pwpl01', 'Paradise Washing Plant', 'Limited', 1613199267, 'pwpl_ict@ananta.com.bd', 1, 'avatar15.jpg', '55eca5ab9e401f1b427a26a1a5672e2e', '2025-06-24 11:23:22', 'PWPL'),
(45, 'Pwpl-01', 'Admin', 'admin01', 'ADMIN', 'PWPL', 123456789, 'admin@ananta.com.bd', 1, 'avatar15.jpg', '965b21f9b0929eb034918f57a06065a8', '2025-06-29 04:29:25', 'PWPL'),
(46, 'AGL-01', 'Admin', 'admin02', 'ADMIN', 'AGL', 123456789, 'admin1@ananta.com.bd', 1, 'avatar15.jpg', '965b21f9b0929eb034918f57a06065a8', '2025-06-29 04:42:21', 'AGL'),
(47, 'AJL-01', 'Admin', 'admin03', 'ADMIN', 'AJL', 123456789, 'admin2@ananta.com.bd', 1, 'avatar15.jpg', '965b21f9b0929eb034918f57a06065a8', '2025-06-29 04:48:35', 'AJL'),
(48, 'AGAD-0337', 'User', 'reaz', 'Rezwan', 'Ahmed', 171319956, 'ahmed_reaz@ananta.com.bd', 1, 'avatar15.jpg', '965b21f9b0929eb034918f57a06065a8', '2025-06-29 05:57:29', 'Head Office'),
(49, 'AGIT-0053', 'Admin', 'kazi', 'Kazi Mokammel', 'Hossain', 171319966, 'kazi_mokammel@ananta.com.bd', 1, 'avatar15.jpg', '965b21f9b0929eb034918f57a06065a8', '2025-06-29 09:04:01', 'Head Office');

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitor`
--

CREATE TABLE `tblvisitor` (
  `ID` int(5) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `Deptartment` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvisitor`
--

INSERT INTO `tblvisitor` (`ID`, `FullName`, `Email`, `MobileNumber`, `Address`, `WhomtoMeet`, `Deptartment`, `ReasontoMeet`, `EnterDate`, `remark`, `outtime`) VALUES
(21, 'Maksud Rahman', '163', 177776910, 'Fountain Garments', 'Ataur Rahman', 'Planning', 'Business', '2025-06-23 11:48:26', '1', '2025-07-05 03:50:42'),
(22, 'Anwar', '159', 172268133, 'XH texttile', 'Manoj Kumar Sarkar', 'Merchandising', 'Business', '2025-06-23 12:01:27', '1', '2025-07-05 04:02:39'),
(23, 'Habib', '2nd floor', 178258282, 'Noakhali', 'Mrs. kakoly', 'HR', 'MD sir reference', '2025-06-23 12:07:20', 'out', '2025-06-26 14:55:40'),
(24, 'Mr.Shohag', '186', 171621151, 'SJT', 'Manoj', 'Merchandising', 'Business', '2025-06-23 12:08:39', NULL, NULL),
(25, 'Billah Hossain', '2nd floor', 171590160, 'Billah Motors', 'Firoz', 'Supply Chain', 'Business', '2025-06-24 03:40:38', 'Out', '2025-06-26 07:13:57'),
(26, 'Mainuddin', '2nd floor', 170103385, 'Gazipur', 'Javed', 'HR', 'Interview', '2025-06-24 03:44:52', 'out\r\n', '2025-06-24 04:42:17'),
(27, 'tawhid', '4th floor ', 174698976, 'vouge Sourcing', 'Asad ', 'Merchandising', 'Business', '2025-06-24 03:48:28', 'out', '2025-06-26 11:46:05'),
(28, 'Farhin', '2nd floor', 197490168, 'Abdullahpur', 'Jarif', 'Hr', 'Intern for Hr', '2025-06-24 03:50:43', 'out', '2025-06-24 11:03:20'),
(29, 'Rabbi Nur Hasan', '2nd floor', 170474468, 'Dhaka Cantonment', 'javed', 'Hr', 'UInterview', '2025-06-24 03:53:26', 'out', '2025-06-24 10:10:29'),
(30, 'Shuvo', '159', 181074514, 'JS sourcing', 'Shuvo', 'Merchandising', 'Business', '2025-06-24 04:08:16', 'out', '2025-06-24 04:42:38'),
(31, 'Faruk', '186', 199959892, 'AGL', 'Ruhul', 'Merchandising', 'Sample Review', '2025-06-24 04:10:17', 'Out', '2025-06-26 14:46:41'),
(32, 'Rakib', '2nd floor', 193886477, 'Fusia', 'Rhman', 'Accounts', 'Check Collect', '2025-06-24 04:41:48', 'out', '2025-06-24 04:53:12'),
(33, 'Mr.Palash', '159', 174219347, 'AT accessories', 'Tanvir', 'Merchandising', 'Sample ', '2025-06-24 04:48:26', 'Out', '2025-06-28 12:47:55'),
(34, 'Hakim', '4th floor', 167750967, 'Vouge sourcing', 'Asad', 'Merchandising', 'Sample', '2025-06-24 04:51:18', 'Out', '2025-06-28 11:47:52'),
(35, 'Saidur', 'with him', 173449962, 'assign Design', 'Delwar', 'development', 'Meeting', '2025-06-24 05:13:23', 'Out', '2025-06-28 11:47:35'),
(36, 'Abu Haanif', '2nd floor', 171198261, 'Sritch tect int.', 'rhman', 'Accounts', 'Check Collect', '2025-06-24 05:15:56', 'out', '2025-06-24 05:51:12'),
(37, '1.Mizanur 2.Munjurul', '7th floor', 1841436136, 'revierie', 'Farhan', 'Supply chain', 'meeting', '2025-06-24 05:18:04', 'out', '2025-06-24 10:09:39'),
(38, 'Asgar', '2nd floor', 168293394, 'Eco thred', 'Masud', 'Supply Chain', 'Meet', '2025-06-24 05:42:50', 'out', '2025-06-24 05:51:24'),
(39, 'Md mukamel haq ', '7th floor ', 171304729, 'b tach ', 'business', 'supply chain', 'meeting', '2025-06-24 05:48:56', 'out', '2025-06-24 08:11:18'),
(40, 'Raju', '6th floor', 167982793, 'Midland', 'DMD Sir', 'Higher Management', 'Document', '2025-06-24 05:50:09', 'out', '2025-06-24 06:35:38'),
(41, 'Jasim Uddin', '174', 197544893, 'Winda', 'Abu Bakkar', 'Supply chain', 'Bill submit', '2025-06-24 05:53:42', '1123', '2025-06-29 04:08:29'),
(42, 'mamun ', '7TH FLOOR ', 172473533, 'IDLC ', 'MR Malek ', 'accunts ', 'busncss', '2025-06-24 06:04:43', NULL, NULL),
(43, '1.Sajal 2.Babul 3.Jainal 4.Rajesh', '2nd floor', 183811259, 'L & Z', 'Sany', 'merchandising', 'meeting', '2025-06-24 06:35:15', 'out', '2025-06-24 08:04:21'),
(44, 'Miraz', '2nd floor', 174823106, 'Cool man eng', 'Rhman', 'Accounts', 'check collect', '2025-06-24 06:43:38', 'out', '2025-06-24 07:03:30'),
(45, 'Younus', '168', 163151515, 'Meghpie', 'Mr.Kamal', 'S/C', 'meeting', '2025-06-24 07:24:29', 'out', '2025-06-24 08:10:17'),
(46, 'Shamin', '5th floor', 179741336, 'Midland text', 'Sumon', 'Merchandising', 'Sample', '2025-06-24 07:38:26', 'out', '2025-06-24 08:12:01'),
(47, 'Anamul', '2nd floor', 171324405, 'M&U packaging', 'Palash', 'Merchandising', 'meet', '2025-06-24 08:04:07', 'out', '2025-06-24 09:27:55'),
(48, 'Anutop', '2nd floor', 184541512, 'Amira trv.', 'Reaz', 'Admin', 'visa', '2025-06-24 09:36:19', 'out', '2025-06-24 09:36:45'),
(49, 'Hafiz', '5th floor', 176017889, 'Confidence', 'Manaj', 'Merchandising', 'sample', '2025-06-24 09:49:44', 'out', '2025-06-24 10:01:28'),
(50, 'Sakib', '2nd fl', 17371545, 'Aman BD', 'Kazi belal', 'Merchandising', 'Doc', '2025-06-24 10:01:04', 'out', '2025-06-24 10:09:14'),
(51, 'Musfiq', '159', 164632611, 'mithila Texttile', 'Manaj', 'Merchandising', 'Quality', '2025-06-24 10:03:17', 'out', '2025-06-24 10:17:47'),
(52, 'Mizan', '159', 184145678, 'TNS Button', 'ruhul', 'Merchandising', 'meeting', '2025-06-24 10:12:46', 'out', '2025-06-24 10:19:31'),
(53, 'Faysal', '7th floor', 191071663, 'Avance tech eng', 'mehdi', 'Engineering', 'meeting', '2025-06-24 10:19:10', 'out', '2025-06-24 10:49:42'),
(54, 'Rezaul', '180', 1754825694, 'Argon denim', 'Sohel', 'Commercial', 'Doc', '2025-06-24 10:28:56', 'out', '2025-06-24 11:04:08'),
(55, 'Sourav', '168', 1688605710, 'DBH', 'Malek', 'Accounts', 'Doc', '2025-06-24 10:36:30', 'out', '2025-06-24 11:03:41'),
(56, 'Anwar', '5th floor', 1622893211, 'print tex', 'Saikat', 'merchandising', 'Doc', '2025-06-24 10:40:36', 'out', '2025-06-24 11:04:54'),
(57, 'Subahan', '3rd', 1940352942, 'Sim fabric', 'Sohel', 'commercial', 'Doc', '2025-06-24 10:44:18', 'out', '2025-06-24 11:17:23'),
(58, 'Hanan', '159', 1815474040, 'Uni fil', 'Manaj', 'Commercial', 'sample', '2025-06-24 10:46:28', 'out', '2025-06-24 11:19:23'),
(59, 'Topu', '2nd floor', 162833089, 'HSBC', 'Sharif', 'Commercial', 'Doc', '2025-06-24 10:59:00', 'Out', '2025-06-24 10:59:25'),
(60, 'Arif', '168', 1917868543, 'Sim tech', 'Farhan', 'S/C', 'bill', '2025-06-24 11:17:03', 'out', '2025-06-24 11:21:18'),
(61, 'Rubel', '186', 1929751538, 'Sikdar Garments', 'mahbub', 'Merchandising', 'sample', '2025-06-24 12:35:31', NULL, NULL),
(62, 'Shakil', '2nd floor', 175824031, 'Norshindi', 'Jabed', 'HR', 'Interview', '2025-06-25 03:21:56', NULL, NULL),
(63, 'Rifat', '186', 1773494678, 'M&U packaging', 'Kazi Belal', 'Merchant', 'sample', '2025-06-25 03:23:16', 'out', '2025-06-25 03:28:22'),
(64, 'Mostak', '10', 1725013481, 'southern Traders', 'Subrata', 'Commercial', 'import work', '2025-06-25 03:28:07', 'out', '2025-06-25 03:38:36'),
(65, 'Tanvir', '167', 1866992202, 'power Max', 'Farhan', 'S/C', 'meet', '2025-06-25 03:36:51', 'out', '2025-06-25 04:09:52'),
(66, 'Kanu ', '10', 1575122034, 'AT accessories', 'sohel', 'commercial', 'doc', '2025-06-25 03:38:19', 'out', '2025-06-25 04:00:08'),
(67, 'Mahmudul', '180', 1761918238, 'Naz enterprize', 'parvin', 'Commercial', 'Doc', '2025-06-25 03:44:25', 'out', '2025-06-25 05:22:41'),
(68, 'Nayeem', '2nd floor', 1882887971, 'pwpl', 'javed', 'HR', 'assessment', '2025-06-25 03:54:52', 'out', '2025-06-25 05:08:55'),
(69, '1.Jony 2.ratul', '7th floor', 1827275284, 'Comfort eng', 'Abu bakkar', 'S/C', 'meeting', '2025-06-25 04:35:28', NULL, NULL),
(70, 'Palash', '186', 1742193476, 'At accessories', 'irin', 'Merchants', 'sample', '2025-06-25 04:54:54', 'out', '2025-06-25 05:01:32'),
(71, 'Robin', '7th', 1613458260, 'Titas gas', 'Al-amin', 'S/C', 'met', '2025-06-25 04:55:40', 'out', '2025-06-25 05:25:56'),
(72, 'Salaman', '168', 1706044944, 'Supreme', 'Rakibul', 's/c', 'bill', '2025-06-25 04:56:45', 'out', '2025-06-25 05:09:29'),
(73, 'Reaz', '159', 1404430311, 'Sanjana', 'Shafayt', 'Merchants', 'Sample', '2025-06-25 05:00:50', NULL, NULL),
(74, 'Khalid', '168', 1752040321, 'Green power', 'farhan', 's/c', 'meet', '2025-06-25 05:17:11', 'out', '2025-06-25 05:25:34'),
(75, 'Masud', '2nd', 1719941624, 'prisma techno', 'kamal', 'S/c', 'meet', '2025-06-25 05:22:28', 'out', '2025-06-25 08:18:16'),
(76, 'Momin', '186', 1711972219, 'Loom text', 'Shafayte', 'Merchants', 'business', '2025-06-25 05:24:42', 'out', '2025-06-25 11:42:18'),
(77, 'Siam', '163', 1988284675, 'Mid land', 'Faysal', 'Designer', 'samole', '2025-06-25 05:25:23', NULL, NULL),
(78, 'rakib', '7th', 1772522129, 'officina bd', 'rupok', 's/c', 'bill', '2025-06-25 06:15:09', 'out', '2025-06-25 10:37:10'),
(79, 'Biplob', '6th', 1711936581, 'B3S', 'Badhon', 'admin', 'meet', '2025-06-25 06:20:20', 'out', '2025-06-25 10:37:22'),
(80, 'Shaikat', '2nd floor', 1720484456, 'Mohammadpur', 'Jabed', 'Hr', 'interview', '2025-06-25 08:18:04', 'out', '2025-06-25 10:37:32'),
(81, 'Jubair', '159', 17133635736, 'ABM', 'Ruhul', 'merchants', 'sample', '2025-06-25 08:24:34', 'out', '2025-06-25 10:37:49'),
(82, 'Roni', '174', 1985593890, 'Trust machineries', 'Abu bakkar', 'S/C', 'meeting', '2025-06-25 08:47:03', 'out', '2025-06-25 08:57:08'),
(83, 'Arafat', '2nd', 1313056231, 'ranar motors', 'montacir', 'transport', 'meet', '2025-06-25 09:01:33', 'out', '2025-06-25 10:38:02'),
(84, 'Shaikat', '174', 1998550088, 'pacific association', 'Rakibul', 'S/C', 'Meeting', '2025-06-25 09:36:47', 'out', '2025-06-25 11:26:21'),
(85, 'Taiwan', '2nd floor', 241081253, 'EA CHEN text', 'Masud', 'Supply chain', 'meeting', '2025-06-25 09:55:44', 'out', '2025-06-25 11:25:50'),
(86, '1.Sajal 2.Rajesh 3.Jainal', '4th', 1838112597, 'L & J Denim', 'Ruhul', 'Merchants', 'meeting', '2025-06-25 10:18:37', 'out', '2025-06-25 11:25:35'),
(87, 'Hasan', '180', 1954841713, 'Argoan Denim', 'Sohel', 'commercial', 'doc', '2025-06-25 10:36:52', 'out', '2025-06-25 10:44:35'),
(88, 'Arafat', '10', 1954437863, 'Mid land', 'Sohel', 'commercial', 'doc', '2025-06-25 10:38:55', 'o', '2025-06-25 10:48:55'),
(89, 'Sajib', '158', 1601756111, 'Rent text', 'Rupok', 's/c', 'bill', '2025-06-25 10:52:39', 'out', '2025-06-25 10:59:58'),
(90, '1.Ahikur 2.Sukumar', '7th', 1713462440, 'Earth Square', 'Rafiq', 'Eng', 'Meeting', '2025-06-25 11:28:00', 'out', '2025-06-25 12:25:36'),
(91, 'Joyi', '2nd floor', 1613199125, 'AJL', 'Javed', 'Compliance', 'Assesment', '2025-06-26 03:26:17', 'out', '2025-06-26 05:04:04'),
(92, 'Ahmadullah', '2nd floor', 1609891048, 'Sports ware', 'javed', 'IE', 'doc', '2025-06-26 03:42:05', 'out', '2025-06-26 04:55:43'),
(93, 'Moshfiq', '7th/2nd', 1717496992, 'Veolia', 'Rafiq/Salam sir', 'Eng/Admin', 'Meet', '2025-06-26 04:10:58', 'out', '2025-06-26 04:40:57'),
(94, 'solaiman', '7th', 1713026512, 'Jomir construction', 'rakib', 'S/C', 'meeting', '2025-06-26 04:12:16', 'out', '2025-06-26 04:24:25'),
(95, 'Badar amin', '2nd', 1738735964, 'Ornet', 'rhman', 'Account', 'check', '2025-06-26 04:16:43', 'out', '2025-06-26 04:55:54'),
(96, 'Shawauth', '7th', 1713199578, 'AGL', 'Firoz', 'S/C', 'work', '2025-06-26 04:23:57', 'out', '2025-06-26 08:56:30'),
(97, 'Mahmudul', '7th floor', 1936339942, 'Royal international', 'Rupok', 'S/C', 'bill', '2025-06-26 04:39:52', 'out', '2025-06-26 04:44:09'),
(98, 'Mahtab', '7th', 1828418624, 'ATS power', 'Farhan', 'S/C', 'meet', '2025-06-26 05:13:59', 'out', '2025-06-26 07:15:39'),
(99, 'Shuvo', '159', 1810745143, 'JS sourcing', 'Nabil', 'Merchants', 'doc', '2025-06-26 05:16:05', 'out', '2025-06-26 06:51:07'),
(100, 'palash', '6th floor', 1713125184, 'Thred & thred', 'Salam sir', 'Admin', 'meeting', '2025-06-26 05:27:29', 'out', '2025-06-26 07:15:24'),
(101, 'Jomir', '4th', 1709998610, 'R pack BD', 'Ruhul', 'Merchants', 'Meeting', '2025-06-26 06:41:55', 'out', '2025-06-26 06:51:30'),
(102, 'Sohel', '174', 1813155755, 'SB chemical', 'Rupok', 'S/C', 'bill', '2025-06-26 06:44:26', 'out', '2025-06-26 06:50:54'),
(103, 'Raju', '174', 1966406112, 'AG electric', 'Abu bakkar', 'S/C', 'bill', '2025-06-26 06:50:15', 'out', '2025-06-26 07:15:00'),
(104, 'Shaidul', '7th', 1713242408, 'Poborton Eng', 'Al-amin', 'S/C', 'bill', '2025-06-26 06:52:48', 'out', '2025-06-26 07:15:08'),
(105, 'mamun', '2nd floor', 1712293554, 'pride sis', 'Dehan', 'ict', 'meeting', '2025-06-26 08:58:44', NULL, NULL),
(106, 'Sajib', '3rd', 1881453662, 'Supplier', 'Sohel', 'Commercial', 'Doc', '2025-06-26 09:04:46', 'out', '2025-06-26 09:34:21'),
(107, 'Israt', '2nd floor', 1551247894, 'Kawla,Airport', 'sabuj', 'Hr', 'interview', '2025-06-26 09:05:38', NULL, NULL),
(108, 'Mahin', '2nd', 1911347467, 'bd text', 'Sany', 'merchants', 'meet', '2025-06-26 09:09:29', 'out', '2025-06-26 10:11:12'),
(109, 'Mehdi', '186', 1309379224, 'BTM', 'tanvir', 'Merchants', 'doc', '2025-06-26 09:10:06', 'out', '2025-06-26 10:11:29'),
(110, 'piyash', '2nd', 19715657150, 'SK servecing', 'rhman', 'Account', 'check', '2025-06-26 09:11:28', 'out', '2025-06-26 11:14:12'),
(111, 'Shihab', '4th', 1847327412, 'Usman Interline', 'tarek', 'Merchants', 'Sample', '2025-06-26 09:15:50', 'out', '2025-06-26 10:12:12'),
(112, 'Imran', '5th', 1855555405, 'Indo text', 'Manoj', 'merchants', 'Meeting', '2025-06-26 09:42:30', 'out', '2025-06-26 10:11:58'),
(113, 'Mofrat', '3rd', 1894956571, 'A&E', 'Sohel', 'Commercial', 'doc', '2025-06-26 10:02:50', 'out', '2025-06-26 10:11:47'),
(114, '1.Faruk 2.Siddik', '4th floor', 1999598925, 'AGL', 'Deb', 'Merchants', 'sample', '2025-06-26 10:39:10', 'out', '2025-06-26 11:13:57'),
(115, 'Mahbub', '3rd', 1751549042, 'Mahin', 'Sohel', 'commercial', 'Doc', '2025-06-26 11:14:47', 'out', '2025-06-26 11:21:15'),
(116, 'asad', '168', 1989333304, 'Chowdhury swing', 'rakib', 's/c', 'bill', '2025-06-26 11:20:21', 'out', '2025-06-29 11:34:33'),
(117, 'Raihan Mostafa', '2nd', 1685185743, 'Mokhali', 'Jabed', 'Hr', 'Interview', '2025-06-29 03:09:36', 'out', '2025-06-29 11:34:08'),
(118, 'Maruf', '2nd floor', 1624347094, 'Tongi', 'Javed', 'Hr', 'Interview', '2025-06-29 03:31:22', 'out', '2025-06-29 11:34:21'),
(119, 'Billoal', '2nd', 1715901607, 'billal motors', 'Firoz', 'S/C', 'meet', '2025-06-29 03:40:25', 'out', '2025-06-29 06:16:17'),
(120, 'Fiaz', '2nd', 1332809899, 'Nippon Express', 'Masud', 'S/C', 'meet', '2025-06-29 04:27:52', 'out', '2025-06-29 06:16:27'),
(121, 'Mizan', '186', 1760341431, 'RDS fashion', 'irin', 'Merchants', 'Doc', '2025-06-29 04:40:01', 'out', '2025-06-29 04:44:49'),
(122, 'samiul', '7th', 1873581883, 'multi tech', 'labib', 's/c', 'bill', '2025-06-29 04:48:13', 'out', '2025-06-29 04:59:11'),
(123, 'hashmot', '180', 1715875631, 'DZN label', 'Sohel', 'Commercial', 'doc', '2025-06-29 05:04:08', 'out', '2025-06-29 05:26:03'),
(124, 'Sajib', '2nd floor', 1581079493, 'exoplore freight', 'rhman', 'Accounts', 'check', '2025-06-29 05:07:50', 'out', '2025-06-29 05:18:46'),
(125, '1.Rasel 2.Jahir', '5th', 1845166786, 'New cotton', 'Eva', 'Designer', 'meeting', '2025-06-29 05:09:27', 'out', '2025-06-29 06:15:30'),
(126, '1.Raihan 2.Mod bang 3.Phon', '8th floor', 1678311611, 'Gomor BD', 'Piyash', 'Admin', '8th floor visit', '2025-06-29 05:11:54', 'out', '2025-06-29 05:19:43'),
(127, 'Pavel', '5th', 1678115989, 'Blue fashion', 'Zahid', 'Wash', 'Meeting', '2025-06-29 05:17:59', 'out', '2025-06-29 06:16:03'),
(128, 'Saim', '2nd', 1982409506, 'Care automation', 'Abu bakkar', 'S/C', 'check', '2025-06-29 06:14:22', 'Out', '2025-06-29 07:04:09'),
(129, 'Sohel', '2nd', 1630337272, 'FDM machine', 'Rhman', 'Accounts', 'check', '2025-06-29 06:15:20', 'out', '2025-06-29 07:04:19'),
(130, 'Akib', '186', 1518930228, 'text zipper', 'Manik', 'merchants', 'Doc', '2025-06-29 06:17:59', 'out', '2025-06-29 07:04:33'),
(131, '1.Jony 2.Rasel', '2nd', 1915613297, 'Zayan trims', 'imran', 's/c', 'meet', '2025-06-29 06:21:37', 'out', '2025-06-29 06:35:21'),
(132, 'Shabol', '180', 1975006061, 'Inracco CNG', 'Fahad', 'S/C', 'Bill', '2025-06-29 06:32:59', 'out', '2025-06-29 06:58:32'),
(133, 'Rubel', '7th', 1766458881, 'talukdar ent', 'Rupok', 's/c', 'bill', '2025-06-29 06:39:16', 'out', '2025-06-29 07:04:44'),
(134, 'Solaiman', '158', 1708149402, 'denim soluation/zara', 'Rupok', 's/c', 'bill', '2025-06-29 06:41:33', 'out', '2025-06-29 07:19:22'),
(135, 'Mofazzal', '6th', 1771120496, 'Washing Association', 'DMD sir', 'Higher Management', 'Meet', '2025-06-29 06:58:20', 'out', '2025-06-29 07:19:30'),
(136, 'kazi wahid', '158', 1896171513, 'anex', 'Farhan', 's/c', 'meeting', '2025-06-29 07:03:56', 'out', '2025-06-29 07:19:40'),
(137, 'Nesar', '168', 1731297661, 'Mahi', 'Al-', 'S/C', 'meeting', '2025-06-29 09:00:56', 'out', '2025-06-29 09:08:17'),
(138, 'Sumon', '2nd', 1728194129, 'Airport', 'Jabed', 'hr', 'interview', '2025-06-29 09:01:51', NULL, NULL),
(139, 'sahan', '2nd', 1677465413, 'comfort eng', 'rhman', 'accounting', 'Cheak', '2025-06-29 09:09:39', 'out', '2025-06-29 09:28:28'),
(140, 'Mostahin', '2nd', 1707966262, 'innoel', 'rhman', 'account', 'check', '2025-06-29 09:11:39', 'out', '2025-06-29 09:28:41'),
(141, 'Shamim', '168', 1855535380, 'textto plus', 'abu', 'S/C', 'bill', '2025-06-29 09:12:50', 'out', '2025-06-29 11:33:41'),
(142, 'salman', '168', 1706044944, 'supreme', 'al-main', 's/c', 'bill', '2025-06-29 09:13:39', 'out', '2025-06-29 09:34:33'),
(143, '1.Subunkar 2.Zulhas', '180/159', 1709644291, 'young shine', 'tarek', 'Commercial/Merchanyts', 'bill', '2025-06-29 09:15:40', 'out', '2025-06-29 09:45:03'),
(144, 'Ismail', '2nd', 1710594182, 'Wide technology', 'Rizwan', 'S/C', 'Meet', '2025-06-29 09:23:11', 'out', '2025-06-29 09:29:22'),
(145, 'Arafat', '3rd', 1722998647, 'Merchantile global log', 'Abu taher', 'Commercial', 'meet', '2025-06-29 09:31:04', 'out', '2025-06-29 10:03:33'),
(146, 'Azad', '7th', 1404452671, 'Air com', 'abu b,.', 's/c', 'meet', '2025-06-29 09:33:16', 'out', '2025-06-29 10:17:23'),
(147, 'Deny', '2nd', 13622854747, 'Geocam', 'rhman', 'accounts', 'check', '2025-06-29 09:34:10', 'out', '2025-06-29 10:16:14'),
(148, 'Rukun', '2nd', 1611713550, 'Farder', 'rhman', 'accounts', 'cheak', '2025-06-29 09:39:09', 'out', '2025-06-29 10:17:14'),
(149, '1.Nazmul 2.Abu zafar', '7th', 1914522647, 'System eng', 'kamal', 's/c', 'meeting', '2025-06-29 09:40:58', 'out', '2025-06-29 10:16:35'),
(150, 'shakil', '6th', 1934766476, 'prime bank', 'sharif', 'commercial', 'meet', '2025-06-29 09:44:37', 'out', '2025-06-29 09:46:56'),
(151, '1.Rinkle', '4th', 1704643538, 'Blue bay', 'Monwar', 'Merchants', 'meeting', '2025-06-29 09:57:22', 'out', '2025-06-29 10:23:29'),
(152, '1.harun 2.millat', '7th', 1681703657, 'tool master', 'farhan', 's/c', 'meeting', '2025-06-29 09:58:13', 'out', '2025-06-29 10:23:39'),
(153, 'Shishir', '2nd ', 1911057898, 'personal', 'monwar', 'merchants', 'meet', '2025-06-29 10:15:35', 'out', '2025-06-29 10:25:14'),
(154, 'moin', '186', 1713108226, 'coats bangladesh', 'asad', 'merchants', 'meeting', '2025-06-29 10:19:33', 'out', '2025-06-29 10:27:17'),
(155, '1.sarwar 2.Razvi', '159', 1713430753, 'sim fabrics', 'manoj', 'merchants', 'meeting', '2025-06-29 10:26:53', 'out', '2025-06-29 11:33:12'),
(156, 'tanvir', '158', 1866992202, 'Power max', 'rafiq', 'eng', 'meeting', '2025-06-29 11:07:29', 'out', '2025-06-29 11:33:24'),
(157, 'kawser', '2nd', 1898801799, 'One G', 'rhman', 'accounts', 'check', '2025-06-29 11:36:37', 'out', '2025-06-29 11:43:37'),
(158, 'Motin', '7th', 1711693408, 'Ambition', 'Farhan', 'S/C', 'meeting', '2025-07-01 03:51:48', 'out', '2025-07-01 06:48:45'),
(159, 'Farida', '2nd', 1710991328, 'Friend', 'Kakoly', 'Hr', 'Meet', '2025-07-01 03:52:39', 'out', '2025-07-01 04:28:22'),
(160, 'Asif', '7th floor', 1727228627, 'Power Max', 'Farhan', 'S/C', 'Meeting', '2025-07-01 04:28:12', 'out', '2025-07-01 06:48:33'),
(161, '1.Abul bashar 2.Shahrim', '2nd', 1717923000, 'System  eng', 'Farhan', 'S/C', 'meeting', '2025-07-01 04:34:28', 'out', '2025-07-01 06:48:53'),
(162, '1.Jony 2.Ratul', '7', 1827275284, 'comfort eng', 'abu bakkar', 's/c', 'meeting', '2025-07-01 04:35:37', 'out', '2025-07-01 06:49:04'),
(163, '1.Jahid 2.Kaiser 3.Kader', '2nd', 1682933940, 'Eco thred', 'Masud', 'S/C', 'Meeting', '2025-07-01 05:18:00', 'out', '2025-07-01 06:52:10'),
(164, 'Harun', '7th', 1819507111, 'Global', 'labib', 's/c', 'bill', '2025-07-01 06:48:17', 'out', '2025-07-01 06:59:45'),
(165, 'Mahub', '2nd', 1324536908, 'MR international', 'rhman', 'accounts', 'check', '2025-07-01 06:50:16', 'out', '2025-07-01 08:51:45'),
(166, 'babu', '2nd', 1956933193, 'argon ', 'mamun', 'merchants', 'doc', '2025-07-01 06:59:35', 'out', '2025-07-01 06:59:57'),
(167, 'BATEN', '159', 1945266019, 'ZF FABRIC', 'RUHUL', 'MERCHANTS', 'DOC', '2025-07-01 07:15:40', 'out', '2025-07-01 08:50:54'),
(168, 'Rezaul', '4th', 1789669921, 'AKM', 'Nazmul', 'merchants', 'bill', '2025-07-01 08:51:35', 'out', '2025-07-01 09:05:59'),
(169, 'biplob', '7th', 1317119035, 'denimity lab', 'rupok', 's/c', 'doc', '2025-07-01 08:52:35', 'out', '2025-07-01 09:41:12'),
(170, 'Yousuf', '168', 1709639343, 'Best text', 'Abu bakar', 's/c', 'bill', '2025-07-01 09:05:37', 'out', '2025-07-01 09:54:03'),
(171, 'Kawser', '159', 1613971349, 'Loom text', 'taibur', 'merchants', 'sample', '2025-07-01 09:10:16', 'out', '2025-07-01 09:42:10'),
(172, 'Sajjad', '176', 1779038513, 'Nice denim', 'sultan', 'Commercial', 'doc', '2025-07-01 09:13:46', 'out', '2025-07-01 09:19:42'),
(173, 'Ariful', '7th', 1718704113, 'Raising group', 'Emran', 'procurement', 'meet', '2025-07-01 09:17:59', 'out', '2025-07-01 09:42:28'),
(174, 'Julhas', '176', 1709644291, 'Young shine', 'Monir', 'commercial', 'Doc', '2025-07-01 09:20:52', 'out', '2025-07-01 10:38:28'),
(175, 'Shuvo', '159', 1887968698, 'JS sourcing', 'Nabil', 'merchants', 'Sample', '2025-07-01 09:30:19', 'out', '2025-07-01 09:31:45'),
(176, 'Maruf', '168', 1715881720, 'system eng', 'Abu bakkar', 'S/C', 'bill', '2025-07-01 09:40:31', 'out', '2025-07-01 09:54:15'),
(177, '1.Tarek 2.salauddin', '3rd', 16132198570, 'Central Global', 'Taher', 'commercial', 'meeting', '2025-07-01 10:38:14', 'out', '2025-07-01 11:12:21'),
(178, 'Kanu', '159', 1575122034, 'At accessories', 'Tarek', 'Merchants', 'doc', '2025-07-01 10:43:52', 'out', '2025-07-01 10:50:09'),
(179, 'Bahar', '2nd', 1714833848, 'Bell wben', 'sohel', 'merchants', 'doc', '2025-07-01 10:47:13', 'out', '2025-07-01 11:12:30'),
(180, 'Jahid', '2nd', 1786754432, 'The one', 'Rhman', 'Accounts', 'check', '2025-07-01 11:12:12', 'out', '2025-07-01 11:49:53'),
(181, 'Taleb', '159', 1534937670, 'Royko', 'Sumon', 'Merchants', 'Doc', '2025-07-01 11:51:35', 'out', '2025-07-01 11:56:19'),
(182, 'Jasim', '158', 191577008, 'jf internatinal', 'rizwan', 's/c', 'bill', '2025-07-01 11:59:40', NULL, NULL),
(183, 'Jusama', '2nd', 1641114800, 'Mohammodpur', 'jabed', 'hr', 'interviw', '2025-07-02 03:41:30', 'out', '2025-07-02 06:41:35'),
(184, 'Aoish', '2nd', 1765423601, 'kollanpur', 'jabed', 'Hr', 'interview', '2025-07-02 03:45:58', 'out', '2025-07-02 10:21:38'),
(185, 'Shipon', '2nd', 1784460009, 'Nouga', 'Jabed', 'Hr', 'Interview', '2025-07-02 03:56:59', 'out', '2025-07-02 10:21:52'),
(186, 'Sardar Aslam', '2nd', 1719496729, 'Uttara', 'Jabed', 'Hr', 'Joining', '2025-07-02 04:00:56', NULL, NULL),
(187, 'Arafat', '168', 1624013871, 'fresh & care', 'Monju', 'Accounts', 'Vat tex chalan', '2025-07-02 04:13:36', 'out', '2025-07-02 06:14:22'),
(188, 'Shamim', '2nd', 1715514182, 'Cumilla', 'Ataur', 'Hr', 'Interview', '2025-07-02 04:17:22', 'out', '2025-07-02 06:59:25'),
(189, 'Mostain', '168', 1707966262, 'Eno well', 'Farhan', 'S/C', 'meeting', '2025-07-02 04:35:02', 'out', '2025-07-02 06:15:57'),
(190, 'Farida', '2nd', 1710991328, 'Lions related', 'Kakoly', 'Hr', 'Lions', '2025-07-02 04:35:59', 'out', '2025-07-02 10:32:16'),
(191, 'Harun', '2nd', 1681703657, 'Tool master', 'Farhan', 'S/C', 'Meeting', '2025-07-02 04:49:33', 'out', '2025-07-02 06:16:42'),
(192, 'Amirul ', '186', 1799949223, 'Coats BD', 'Shyla', 'Merchants', 'Sample', '2025-07-02 04:55:13', 'out', '2025-07-02 06:59:12'),
(193, 'Toufiqul', '7th', 1730783199, 'ITS lab test', 'Shakil', 'Account', 'chalan', '2025-07-02 05:55:44', 'out', '2025-07-02 06:18:19'),
(194, 'Hasan', '4th', 1915645360, 'meco denim', 'Ruhul', 'Merchants', 'sample', '2025-07-02 06:19:56', 'out', '2025-07-02 06:58:17'),
(195, 'Boiyan', '2nd', 1713125089, 'PWPL', 'Ataur', 'HR', 'meet', '2025-07-02 06:38:53', 'out', '2025-07-02 09:05:22'),
(196, '1.Awlad 2.Shoyeb', '2nd', 1711956281, 'Serverl share', 'Imran', 'procurment', 'meeting', '2025-07-02 06:40:02', 'out', '2025-07-02 06:41:42'),
(197, 'Jasim', '168', 1981006332, 'JF international', 'al-amin', 'S/C', 'bill', '2025-07-02 06:44:36', 'out', '2025-07-02 06:58:59'),
(198, '1.Hasan 2.Arub', '3rd', 1795890559, 'Bangladesh Air express', 'Sharif', 'Commercial', 'Meeting', '2025-07-02 06:47:45', 'out', '2025-07-02 09:05:29'),
(199, 'Rahmatullah', '4th', 1308543558, 'etacall', 'komol', 'Merchants', 'sample', '2025-07-02 08:56:28', 'out', '2025-07-02 09:05:41'),
(200, 'aminul', '180', 1676766454, 'abedin', 'sohel', 'commercial', 'doc', '2025-07-02 09:05:10', 'out', '2025-07-02 09:18:07'),
(201, 'Humayun', '2nd', 1745461391, 'Gazipur', 'Ataur', 'Hr', 'Interview', '2025-07-02 09:21:42', 'out', '2025-07-02 10:32:48'),
(202, 'Monir', '158', 1678086254, 'Richman', 'Rizwn', 'S/C', 'Meeting', '2025-07-02 10:05:31', 'out', '2025-07-02 10:20:50'),
(203, 'Mahbub', '2nd', 1324536908, 'MR international', 'Rhmna', 'Accounts', 'check', '2025-07-02 10:11:53', 'out', '2025-07-02 10:32:26'),
(204, 'Amzad', '158', 1877669988, 'SHS checmical', 'Al-amin', 'S/C', 'bill', '2025-07-02 10:23:30', 'out', '2025-07-02 10:32:38'),
(205, 'Istiyak', '2nd', 1717058223, 'city bank', 'malek', 'Accounts', 'meet', '2025-07-02 10:24:31', 'out', '2025-07-02 10:26:55'),
(206, 'subhan', '176', 1940352942, 'sim fabric', 'sohel', 'commercial', 'doc', '2025-07-02 10:25:41', 'out', '2025-07-02 10:31:36'),
(207, 'Faruk', '                                                                   158', 1629260558, 'Green chemisty', 'Rupok', 's/c', 'bill', '2025-07-02 10:57:46', 'out', '2025-07-02 11:22:36'),
(208, 'harun', '168', 1730058912, 'Modern Technology', 'rakib', 's/c', 'meeting', '2025-07-02 11:32:00', NULL, NULL),
(209, 'Abul khayer', '2nd', 1706006000, 'Ashulia', 'Jabed', 'Hr', 'interview', '2025-07-03 03:17:57', 'out', '2025-07-03 07:00:17'),
(210, 'Siddik', '2nd', 1620128539, 'Mymensingh', 'Ataur', 'Hr', 'interview', '2025-07-03 03:39:59', 'out', '2025-07-03 06:40:39'),
(211, 'Jasim uddin', '166', 1981006332, 'JF international', 'Sohel', 'S/C', 'Bill', '2025-07-03 04:06:04', 'out', '2025-07-03 06:21:46'),
(212, 'Siam', '158', 1988284675, 'midland', 'Emran', 'S/C', 'doc', '2025-07-03 04:08:30', 'out', '2025-07-03 04:12:58'),
(213, 'Chimoy', '176', 1721807299, 'southern traders', 'Subrata', 'commercial', 'Doc', '2025-07-03 04:14:01', 'out', '2025-07-03 05:06:24'),
(214, 'momin', '186', 1711972219, 'loom', 'ruhul', 'merchants', 'meet', '2025-07-03 04:51:41', 'out', '2025-07-03 06:01:24'),
(215, 'Mamun', '163', 1821397888, 'Bando design', 'sohel', 'Merchants', 'Sample', '2025-07-03 04:52:41', 'out', '2025-07-03 06:01:30'),
(216, 'sohag', '163', 1728838944, 'RMG', 'irin', 'Merchants', 'doc', '2025-07-03 05:19:05', 'out', '2025-07-03 06:01:40'),
(217, 'Rifat', '2nd', 1715756813, 'Prym', 'Sumon', 'merchants', 'meeting', '2025-07-03 05:25:19', 'out', '2025-07-03 06:01:50'),
(218, 'Nayem', '163', 1329694479, 'Young shine', 'Maung', 'Merchants', 'Doc', '2025-07-03 05:26:51', 'out', '2025-07-03 06:01:57'),
(219, 'Mahmudul', '176', 1713488224, 'Colours city', 'Nazmul', 'commercial', 'Bank related', '2025-07-03 05:27:41', 'out', '2025-07-03 06:40:01'),
(220, 'Asgar', 'Emran', 1628933940, 'Eco thred', '7th', 'S/C', 'meet', '2025-07-03 06:01:10', 'out', '2025-07-03 06:40:10'),
(221, '1.sadek 2.erfan', '158', 1831801188, 'International business machine', 'labib', 's/c', 'printer', '2025-07-03 06:21:11', 'out', '2025-07-03 06:44:11'),
(222, 'bimol', '168', 1717484581, 'myras finance', 'amin', 'accounts', 'meeting', '2025-07-03 06:22:44', 'out', '2025-07-03 09:19:15'),
(223, 'Sajal', '2nd', 1764000092, 'Pride sis', 'Dehan', 'ict', 'doc', '2025-07-03 06:45:07', 'out', '2025-07-03 06:50:13'),
(224, 'Toriqul', '2nd', 1885784017, 'Savar', 'Jabed', 'Hr', 'interview', '2025-07-03 08:48:32', 'out', '2025-07-03 08:58:13'),
(225, 'Rana', '7th floor', 1716063622, 'Tech valley', 'Labib', 'S/C', 'Product', '2025-07-03 08:58:03', 'out', '2025-07-03 09:18:57'),
(226, 'Shishir', '2nd', 1717549905, 'Uttara motors', 'muntacir', 'Transport', 'meeting', '2025-07-03 09:18:43', 'out', '2025-07-03 10:26:18'),
(227, 'Shaheen', '2nd', 1740999401, 'Texto plus', 'Rhman', 'Accounts', 'cheak', '2025-07-03 09:23:55', 'out', '2025-07-03 11:49:02'),
(228, 'reza', '4th', 1729269337, 'A&E', 'ruhul', 'merchants', 'meeting', '2025-07-03 09:28:48', 'out', '2025-07-03 09:51:13'),
(229, 'Samrat', '2nd', 1816699623, 'Mater Air express', 'Subrata', 'commercial', 'doc', '2025-07-03 09:50:54', 'out', '2025-07-03 09:52:25'),
(230, 'shabuj', '2nd', 1675487615, 'etacal', 'komol', 'merchants', 'sample', '2025-07-03 10:28:56', 'out', '2025-07-03 10:38:51'),
(231, 'Palash', '186', 1742193472, 'AT acessories', 'Ruhul', 'Merchats', 'Doc', '2025-07-03 10:38:35', 'out', '2025-07-03 10:53:52'),
(232, 'Shahidul', '2nd', 1954426786, 'SGT', 'rhman', 'accounts', 'cheak', '2025-07-03 10:59:38', 'out', '2025-07-03 11:39:40'),
(233, 'sujon', '168', 1728149409, 'zara enterprize', 'rupok', 's/c', 'bill', '2025-07-03 11:11:34', 'out', '2025-07-03 12:08:36'),
(234, '1.Shuvon 2.Tasin, 3.petter 3.shohan 4.sohel 5.alvi 6.tasnim', '2nd', 1713154853, 'Maxim label', 'Ataur', 'Planning', 'Meeting', '2025-07-03 11:20:40', 'out', '2025-07-03 12:44:19'),
(235, '1.Rinku 2.Tuhin', '4th', 1704643538, 'Loobe', 'monwar', 'merchants', 'meeting', '2025-07-03 11:39:16', 'out', '2025-07-03 12:44:26'),
(236, 'Naimur', '2nd', 1610246100, 'Noakhali', 'Jabed', 'Hr', 'interview', '2025-07-05 03:12:35', 'out', '2025-07-05 06:39:13'),
(237, 'Rifat', '2nd', 1799847901, 'Khilgao', 'jabed', 'Hr', 'Interview', '2025-07-05 03:13:55', 'out', '2025-07-05 04:25:26'),
(238, 'Abul khayer', '2nd', 1706006000, 'Ashulia', 'Jabed', 'Hr', 'Joinning', '2025-07-05 03:17:25', 'out', '2025-07-05 05:23:50'),
(239, 'Priyanka', '2nd', 1810984603, 'Shatkhira', 'Jabed', 'Hr', 'interview', '2025-07-05 03:25:37', 'out', '2025-07-05 09:22:58'),
(240, 'Rizwan', '2nd', 1788338922, 'Ashulia', 'jarif', 'Hr', 'Intern', '2025-07-05 04:25:16', 'out', '2025-07-05 10:07:43'),
(241, 'Pobitro', '2nd', 1311405964, 'Priyanka for interview with her relatives', 'Jabed', 'hr', 'Interview girl relative', '2025-07-05 04:26:57', 'out', '2025-07-05 10:07:36'),
(242, 'Anisur', '7th', 1623413003, 'Lejin international', 'Rupok', 'S/C', 'Doc', '2025-07-05 06:38:58', 'out', '2025-07-05 10:07:49'),
(243, 'Mahmud', '7th', 1722784426, 'electo mechanical soluatuion', 'farhan', 's/c', 'drawing', '2025-07-05 09:22:41', 'out', '2025-07-05 10:08:03'),
(244, 'Sanaur', '7th', 1777719792, 'Cross world', 'mehdi', 's/c', 'meeting', '2025-07-06 04:02:07', 'out', '2025-07-06 04:41:37'),
(245, 'Rakib', '7th', 1772522129, 'Officina BD', 'Rupok', 'S/C', 'bill', '2025-07-06 04:22:54', 'out', '2025-07-06 04:41:51'),
(246, '1.Istiyak 2.Inaya', '5th', 171312496, 'Family', 'Eva', 'Designer', 'Her husband & child', '2025-07-06 04:36:25', 'out', '2025-07-06 05:34:25'),
(247, 'Arif', '176,159', 1307450162, 'RDS fashion', 'Kolpona,sohel', 'merchants,commercial', 'doc', '2025-07-06 04:51:23', 'out', '2025-07-06 04:59:13'),
(248, 'Shuvo', '163', 1887968698, 'JS sourcing', 'Shuvo', 'Merchants', 'sample', '2025-07-06 04:52:14', 'out', '2025-07-06 04:59:21'),
(249, 'Bipash', '4th', 1701037935, 'Shikdar', 'Mahbub', 'Merchants', 'Sample', '2025-07-06 04:59:02', 'out', '2025-07-06 05:29:13'),
(250, 'Anisul', '163', 1713124779, 'Thred & Thred', 'Ruhul', 'Merchants', 'sample', '2025-07-06 05:02:47', 'out', '2025-07-06 05:29:02'),
(251, '1.Sanaul 2.Sarwar', '4th floor', 1716179756, 'SIM fabric', 'Monwar', 'Merchants', 'Meeting', '2025-07-06 05:07:16', 'out', '2025-07-06 06:22:06'),
(252, 'Kanu', '159', 1575122034, 'At acessories', 'Manik', 'Merchants', 'Sample', '2025-07-06 05:28:40', 'out', '2025-07-06 08:32:40'),
(253, '1.Anamul 2.karim', '4th', 1713244052, 'M&U packaging', 'palash', 'merchants', 'meet', '2025-07-06 05:53:36', 'out', '2025-07-06 08:32:51'),
(254, 'Robiul', '3rd', 1819129304, 'bigols', 'mamun', 'commercial', 'meeting', '2025-07-06 05:59:53', 'out', '2025-07-06 08:33:10'),
(255, 'Shamim', '166', 1888282791, 'Trade jentrum', 'Rupok', 'S/C', 'Bill', '2025-07-06 06:23:39', 'out', '2025-07-06 08:33:18'),
(256, 'Joy', '2nd', 1782053533, 'good work', 'rhman', 'account', 'cheak', '2025-07-06 08:31:25', 'out', '2025-07-06 09:51:53'),
(257, 'yasin', '163', 1704499660, 'print tex', 'saikat', 'merchants', 'doc', '2025-07-06 08:32:02', 'out', '2025-07-06 08:35:15'),
(258, 'Kanu', '176', 1575122034, 'AT accessories', 'Sohel', 'commercial', 'doc', '2025-07-06 09:17:49', 'out', '2025-07-06 09:37:45'),
(259, 'Polash', '166', 1997014910, 'tool master', 'labib', 's/c', 'bill', '2025-07-06 09:41:41', 'out', '2025-07-06 10:12:02'),
(260, '1.Zafar 2.Mizan ', '7th', 1777790232, 'Adex', 'farhan', 'S/C', 'meeting', '2025-07-06 09:46:32', 'out', '2025-07-06 10:11:48'),
(261, 'Shipon', '7th', 1313016944, 'Pure chemical', 'rupok', 'S/C', 'bill', '2025-07-06 09:48:03', 'out', '2025-07-06 10:11:55'),
(262, '1.Hazrat ali 2.ferdous', '7th', 1761349579, 'Rinova', 'Kamal sir', 's/c', 'meeting', '2025-07-06 10:39:49', NULL, NULL),
(263, 'Nayeem', '163', 1329694479, 'Young shine', 'Kazi belal', 'merchants', 'doc', '2025-07-06 10:53:12', NULL, NULL),
(264, 'Rizwan', '6th', 1778784267, 'R pack', 'Indika', 'merchants', 'Meeting', '2025-07-06 11:02:51', NULL, NULL),
(265, '1.Nahid 2.haider', '7th', 1927732650, 'Green genisis', 'Abu bakkar', 'S/c', 'Meeting', '2025-07-06 11:05:22', NULL, NULL),
(266, 'Bipash', '163', 1701037935, 'Shikdar', 'Palash', 'merchants', 'meeting', '2025-07-06 11:24:13', NULL, NULL),
(267, '1.Iven 2.Chang', '5th', 86150610879, 'Initiao', 'Shaikat', 'Merchants', 'meeting', '2025-07-07 03:46:59', 'out', '2025-07-07 04:38:43'),
(268, 'Asad', '166', 1989333304, 'Chowdhury sweing', 'Rakib', 's/c', 'bill', '2025-07-07 03:48:24', 'out', '2025-07-07 04:03:00'),
(269, 'Shipon', '166', 1313016944, 'Pure chemical', 'rupok', 'S/C', 'Bill', '2025-07-07 03:49:05', 'out', '2025-07-07 03:52:07'),
(270, '1.Jwel 2.Amir', '2nd', 1304445919, 'Las fashion', 'masud', 's/c', 'meet', '2025-07-07 04:27:38', 'out', '2025-07-07 05:44:46'),
(271, '1.Taposh 2.faysal 3.mishu 4.reaz', '7th', 1713147035, 'energy pack', 'farhan', 's/c', 'meeting', '2025-07-07 04:38:25', 'out', '2025-07-07 05:46:35'),
(272, 'Ali', '2nd', 1709740210, 'Perfecr automation', 'Sheli', 'S/C', 'meet', '2025-07-07 05:46:08', 'out', '2025-07-07 06:29:31'),
(273, 'Rahim', '7th', 1915448194, 'GDS chemical', 'Rupok', 'S/C', 'Bill', '2025-07-07 05:55:48', 'out', '2025-07-07 06:29:39'),
(274, 'Ramzan', '176', 1861512483, 'Unifil', 'Sohel', 'Commercial', 'Doc', '2025-07-07 06:08:19', 'out', '2025-07-07 06:42:44'),
(275, '1.Titan 2.Mahir ', '7th', 1757922561, 'Bkash', 'Amin', 'Accounts', 'Meeting', '2025-07-07 06:10:42', 'out', '2025-07-07 06:41:49'),
(276, 'sharif', '7th', 1921311696, 'time tech bd', 'Abu bakkar', 's/c', 'bill', '2025-07-07 06:12:38', 'out', '2025-07-07 06:44:11'),
(277, 'Shafiq', '10', 1977191190, 'Express', 'Taher khan', 'Commercial', 'Meeting', '2025-07-07 06:16:39', 'out', '2025-07-07 07:11:04'),
(278, 'mokammel', '2nd', 17130042383, 'B-Trac eng', 'Farhan', 's/c', 'meeting', '2025-07-07 06:29:19', 'out', '2025-07-07 09:08:43'),
(279, 'Sajib', '2nd', 1920062266, 'United international', 'kamal', 's/c', 'meet', '2025-07-07 06:41:39', 'out', '2025-07-07 09:08:51'),
(280, 'Amir', '6th', 1811480327, 'Denimity lab', 'DMD sir', 'Higher Managenent ', 'Doc', '2025-07-07 07:00:23', 'out', '2025-07-07 09:09:22'),
(281, 'Farhad', '2nd ', 1794652805, 'Green touch', 'Rhman', 'Accounts', 'Cheak', '2025-07-07 07:07:30', 'out', '2025-07-07 09:09:35'),
(282, 'Rifat', '163', 1976749894, 'TMS ', 'Ruhul', 'merchants', 'doc', '2025-07-07 07:29:55', 'out', '2025-07-07 09:09:45'),
(283, 'Artafat', '2nd', 1313056231, 'Rana motors', 'Muntacir', 'traansport', 'meeting', '2025-07-07 09:08:36', 'out', '2025-07-07 09:34:31'),
(284, '1.Hasan 2.Anisur', '166', 17146546385, 'Akiz', 'Rizwan', 's/c', 'meeting', '2025-07-07 09:11:20', 'out', '2025-07-07 12:10:55'),
(285, 'Asgar', '163', 1682933940, 'Eco thred', 'tarek', 'Merchants', 'meet', '2025-07-07 09:21:36', 'out', '2025-07-07 09:49:25'),
(286, 'monwar', '10', 1844083636, 'Pioneer denim', 'sohel', 'commercial', 'doc', '2025-07-07 09:23:10', 'out', '2025-07-07 10:08:50'),
(287, '1.zikrul 2. Monjuriul 3.Jahangir', '7th', 1841436136, 'Reverie', 'Farhan', 'S/C', 'Meeting', '2025-07-07 09:32:57', 'out', '2025-07-07 11:13:53'),
(288, 'Mainuddin', '4th', 1713108226, 'Coats BD', 'Asad', 'merchants', 'Meeting', '2025-07-07 09:49:05', 'out', '2025-07-07 11:14:06'),
(289, 'Ershad', '163', 1710786683, 'A&E', 'Sohel', 'Commercial', 'doc', '2025-07-07 09:58:45', 'out', '2025-07-07 11:14:15'),
(290, '1.Mahfuz 2.Anis 3.burhan 4.gulam 5.masfiq 6.nasir 7.firoz', '7th', 1708574467, 'AB Power', 'Farhan', 's/c', 'meeting', '2025-07-07 10:12:44', 'out', '2025-07-07 12:10:35'),
(291, 'Moin', '2', 1984501564, 'United', '176', 'commercial', 'doc', '2025-07-07 10:20:33', 'out', '2025-07-07 12:10:42'),
(292, 'Yasin', '186', 1704499660, 'print tex', 'Shaikat', 'Merchants', 'doc', '2025-07-07 10:21:09', 'out', '2025-07-07 11:30:28'),
(293, '1.Kamun 2.Raju', '5th', 1312992988, 'sadia text', 'EVa', 'Designer', 'Meeting', '2025-07-07 10:22:08', 'out', '2025-07-07 11:30:36'),
(294, 'bahar', '166', 1613321515, 'Robi', 'Amin', 'Accounts', 'Check', '2025-07-07 10:26:06', 'out', '2025-07-07 11:30:43'),
(295, 'monwar', '4th', 1306404553, 'akm', 'asif', 'merchants', 'sample', '2025-07-07 10:51:16', 'out', '2025-07-07 11:30:51'),
(296, 'Belayat', '2nd', 1969604127, 'SAS international', 'Kamal', 'S/C', 'meet', '2025-07-07 10:58:47', 'out', '2025-07-07 11:31:03'),
(297, 'Rahat', '7th', 1849249994, 'Basundhara', 'Masud', 's/c', 'Meet', '2025-07-07 11:23:35', 'out', '2025-07-07 11:55:05'),
(298, 'Sumon', '168', 17174208873, 'SMM poly', 'Malek', 'Accounts', 'Doc', '2025-07-07 11:30:12', 'out', '2025-07-07 12:17:39'),
(299, 'bulbul', '7th', 1912167545, 'Master right', 'kamal', 'S/C', 'meeting', '2025-07-07 12:04:21', 'out', '2025-07-07 12:17:57'),
(300, 'Shamim', '7th', 1918825980, 'IDLC', 'malek', 'Accounts', 'doc', '2025-07-07 12:07:16', 'out', '2025-07-07 12:18:06'),
(301, 'shamim', '7th', 1816914180, 'light bridge', 'Rizwan', 'S/C', 'Product', '2025-07-07 12:13:10', 'out', '2025-07-07 12:22:49'),
(302, 'Nasir', '159', 1724473744, 'AT acessories', 'Tarek', 'Merchants', 'Doc', '2025-07-08 03:09:38', 'out', '2025-07-08 04:15:40'),
(303, 'Mahbubur', '2nd', 1765651946, 'Mawna,Gazipur', 'jabed', 'Hr', 'Interview', '2025-07-08 03:11:42', 'out', '2025-07-08 07:20:12'),
(304, 'Tawhid', '4th', 1746989767, 'vouge sourcing', 'Asad', 'merchants', 'meeting', '2025-07-08 04:26:44', 'out', '2025-07-08 07:20:19'),
(305, 'Monir', '2nd', 1723658275, 'Prime bank', 'Anwar', 'Merchants', 'Bank', '2025-07-08 04:32:47', 'out', '2025-07-08 07:20:27'),
(306, '1.Fuad 2.jonathan', '2nd', 1708595957, 'Divo solution Ltd.', 'omar', 'ICT', 'meeting', '2025-07-08 04:34:59', 'out', '2025-07-08 07:20:36'),
(307, 'chinmoy', '18', 1721807299, 'southern traders', 'subrata', 'commercial', 'import related issue', '2025-07-08 04:45:21', 'out', '2025-07-08 04:52:11'),
(308, 'Razib', '176', 1874962153, 'Argon denim', 'Sohel', 'Commercial', 'Doc', '2025-07-08 04:46:11', 'out', '2025-07-08 07:20:44'),
(309, 'Mustak', '18', 1745013481, 'Southern traders', 'Subrata', 'Commercial', 'doc', '2025-07-08 05:02:29', 'out', '2025-07-08 07:20:51'),
(310, 'Parves', '176', 1745283769, 'Monohor', 'Sultan', 'Copmmercial', 'Doc', '2025-07-08 08:45:02', 'out', '2025-07-08 08:56:19'),
(311, 'omit', '5th', 1713230408, 'Anwar', 'shibly', 'merchants', 'meeting', '2025-07-08 08:46:46', 'out', '2025-07-08 09:37:50'),
(312, 'Sajjad', '168', 1600004051, 'dexterous', 'Abu bakkar', 'S/c', 'bill', '2025-07-08 08:59:44', 'out', '2025-07-08 09:20:05'),
(313, 'Asad', '7th', 1989333304, 'Chowdhury swing', 'rakib', 'S/C', 'bill', '2025-07-08 09:37:35', 'out', '2025-07-08 09:59:48'),
(314, 'sajal', '2nd', 1838112597, 'Zindal', 'Sany', 'merchants', 'meeting', '2025-07-08 09:40:47', 'out', '2025-07-08 10:38:24'),
(315, 'Mahmudul', '176', 1713488224, 'color city', 'sohel', 'commercial', 'doc', '2025-07-08 09:49:45', 'out', '2025-07-08 10:56:03'),
(316, 'Lotfur', '163', 1910371170, 'LR button', 'Aslam', 'Merchants', 'sample', '2025-07-08 09:54:25', 'out', '2025-07-08 10:56:22'),
(317, 'Helal', '176', 1713442382, 'Fabiyan', 'sohel', 'Commercial', 'doc', '2025-07-08 10:34:30', 'out', '2025-07-08 10:56:33'),
(318, '1Azizul 2.kawser', '7th', 171271744, 'Dhaka gas', 'manik', 's/c', 'meeting', '2025-07-08 10:35:34', 'out', '2025-07-08 11:52:29'),
(319, '1.Hanan 2.tutul', '5th', 1815474040, 'Unifil', 'Manoj', 'merchants', 'meeting', '2025-07-08 10:38:13', 'out', '2025-07-08 11:56:32'),
(320, '1.Animesh', '2nd', 176886047, 'BLue bay asia', 'irin', 'Merchants', 'Meeting', '2025-07-08 10:42:49', 'out', '2025-07-08 11:52:38'),
(321, 'Zakaria', '168', 1595245013, 'comfort eng', 'abu bakkar', 'S/c', 'bill', '2025-07-08 10:50:36', 'out', '2025-07-08 10:55:33'),
(322, 'Zahirul', '163', 1915052983, 'trims world', 'shafayte', 'merchants', 'doc', '2025-07-08 11:00:37', 'out', '2025-07-08 11:56:42'),
(323, 'Biplob', '7th', 1711936581, 'titas gas', 'al-amin', 's/c', 'meeting', '2025-07-08 11:01:23', 'out', '2025-07-08 11:57:11'),
(324, '1.jisan 2.hasib 3.asma', ' 3rd', 1329654687, 'GCL', 'arif', 'compliance', 'meeting', '2025-07-08 11:25:10', 'out', '2025-07-08 12:15:07'),
(325, 'Saidul', '7th', 1708149407, 'denim solu', 'rupok', 'S/C', 'doc', '2025-07-08 11:52:19', 'out', '2025-07-08 12:15:16'),
(326, 'Ohiduzzaman', '2nd', 1890307379, 'Jatrabari', 'Ataur', 'Hr', 'interview', '2025-07-09 03:04:19', 'out', '2025-07-09 04:46:17'),
(327, 'Amanul', '2nd', 1718964767, 'Gazipur', 'Ataur', 'Hr', 'interview', '2025-07-09 03:05:03', 'out', '2025-07-09 05:21:57'),
(328, ' Chondon', '2nd', 1729464985, 'AJL', 'Jabed', 'Hr', 'Joinning', '2025-07-09 03:06:01', 'out', '2025-07-09 05:21:33'),
(329, 'Rashfit', '2nd', 1892223022, 'Mohammadpur', 'Jabed', 'Hr', 'interview', '2025-07-09 03:15:14', 'out', '2025-07-09 06:37:30'),
(330, 'Shampa', '7th', 1787293073, 'Sumcorn', 'Rupok', 'S/C', 'Bill', '2025-07-09 03:19:26', 'out', '2025-07-09 03:37:08'),
(331, 'Azizul', '2nd', 1675341062, 'Khilgoan', 'Jabed', 'Hr', 'Interview', '2025-07-09 03:31:17', 'out', '2025-07-09 04:46:25'),
(332, 'Rakib', '2nd', 1625179578, 'Mirpur', 'jabed', 'Hr', 'interview', '2025-07-09 03:40:19', 'out', '2025-07-09 10:15:10'),
(333, 'Sharif', '7th', 1613220059, 'AJL', 'Rafiq', 'Utility', 'Meet', '2025-07-09 03:44:18', 'out', '2025-07-09 04:49:28'),
(334, 'Rasel', '3rd', 1867599354, 'Daylight ', 'Sohel', 'Commercial', 'doc', '2025-07-09 03:52:50', 'out', '2025-07-09 04:46:49'),
(335, 'Jahid', '163', 1875194456, 'Rainbow', 'Tasir', 'Merchants', 'sample', '2025-07-09 04:01:47', 'out', '2025-07-09 04:46:38'),
(336, '1.Kawser 2.Masud', '2nd', 1612358910, 'Natonal poly mart', 'Rhman', 'accounts', ' cheak', '2025-07-09 04:07:46', 'out', '2025-07-09 05:10:09'),
(337, 'Talukdar', '7th', 1720243802, 'muslim trims', 'Rupok', 'S/C', 'doc', '2025-07-09 04:12:25', 'out', '2025-07-09 04:49:49'),
(338, '1.Arif 2.Roshanur 3.Muhit 4.moshiur', '168', 1712213523, 'Veolia', 'Rafiq', 'Engineering', 'Meeting', '2025-07-09 04:29:45', 'out', '2025-07-09 05:27:57'),
(339, 'bijoy', '168', 1612642591, 'Hauhuwa', 'rupok', 's/c', 'doc', '2025-07-09 04:31:13', 'out', '2025-07-09 05:22:19'),
(340, 'Razib', '168', 1316736322, 'trade zentrum', 'rupok', 's/c', 'bill', '2025-07-09 04:44:54', 'out', '2025-07-09 05:22:25'),
(341, 'Mostafiz', '3rd', 1714134215, 'City BAnk', 'Sharif', 'Commercial', 'meet', '2025-07-09 04:46:00', 'out', '2025-07-09 05:22:33'),
(342, 'kanu', '159', 1575122034, 'At accessories', 'irin', 'merchants', 'sample', '2025-07-09 04:50:32', 'out', '2025-07-09 05:15:21'),
(343, 'Dulal puddar', '7th', 1759996463, 'A1   poly mar', 'Al-amin', 's/c', 'doc', '2025-07-09 05:03:03', 'out', '2025-07-09 06:15:31'),
(344, 'Chinmoy', '173', 1721807299, 'Southern traders', 'Subrata', 'Commercial', 'doc', '2025-07-09 05:09:54', 'out', '2025-07-09 05:16:52'),
(345, 'Zakir', '2nd', 1700799896, 'fed Ex', 'All', 'Merchants', 'sample collect', '2025-07-09 05:15:04', 'out', '2025-07-09 05:28:11'),
(346, 'Sabuj', '166', 1842150661, 'Impex', 'Rakib', 'S/C', 'bill', '2025-07-09 05:18:13', 'out', '2025-07-09 06:37:39'),
(347, 'subahan', '18', 1940352942, 'Sim fabric', 'Sohel', 'Commercial', 'Doc', '2025-07-09 05:27:04', 'out', '2025-07-09 05:43:23'),
(348, 'Mizan', '18', 1913398472, 'Jumuna denim', 'Sohel', 'Commercial', 'Doc', '2025-07-09 05:47:19', 'out', '2025-07-09 06:11:07'),
(349, 'Amir', '168', 1711442083, 'Denimity l;ab', 'Rupok', 'S/C', 'Doc', '2025-07-09 06:06:34', 'out', '2025-07-09 06:19:38'),
(350, 'Rony', 'Al-amin', 1680031104, 'Sonia traders', 'Al-amin', 'S/C', 'sample', '2025-07-09 06:07:43', 'out', '2025-07-09 06:43:07'),
(351, '1.Arif 2.Nafiz', '2nd', 1713249735, 'Debnet ltd', 'omar', 'ict', 'meeting', '2025-07-09 06:13:11', 'out', '2025-07-09 10:14:37'),
(352, 'Sahidul', '7th', 1826487508, 'Power lid', 'Farhan', 'S/C', 'bill', '2025-07-09 06:17:13', 'out', '2025-07-09 06:43:21'),
(353, 'Mithun', '7th', 1774871137, 'Treds india', 'masud', 's/c', 'meet', '2025-07-09 06:28:10', 'out', '2025-07-09 07:01:24'),
(354, '1.Maruf 2.milon', '168', 1915489949, 'Colour fusion', 'Rupok', 's/c', 'meeting', '2025-07-09 06:39:21', 'out', '2025-07-09 07:01:36'),
(355, 'haun', '3rd', 1730097928, 'commercial', 'sharif', 'commercial', 'meeting', '2025-07-09 06:42:21', 'out', '2025-07-09 09:29:13'),
(356, 'Sajib', '3rd', 1581079493, 'Explore', 'subrata', 'commercial', 'doc', '2025-07-09 06:48:41', 'out', '2025-07-09 06:59:34'),
(357, 'Kanu', '159', 1575122034, 'AT acessories', 'Asad', 'merchants', 'DOc', '2025-07-09 06:49:33', 'out', '2025-07-09 06:59:25'),
(358, 'Biplob', '7th', 1711936581, 'Bari', 'al-amin', 's/c', 'meet', '2025-07-09 06:59:08', 'out', '2025-07-09 10:13:16'),
(359, 'Probir', '168', 1774862161, 'Bar text', 'Kamal', 'S/C', 'Meeting', '2025-07-09 07:01:09', 'out', '2025-07-09 10:13:22'),
(360, '1.Reaz ', '2nd floor', 1716933947, 'news 24', 'MD sir', 'Higher management', 'News covee', '2025-07-09 08:37:00', 'out', '2025-07-09 10:13:30'),
(361, 'Belal', '2nd', 1915780725, 'SB fashion', 'masud', 'S/C', 'meeting', '2025-07-09 08:38:39', 'out', '2025-07-09 10:13:36'),
(362, '1.Nahid 2.Abul alam ferdous', '6th', 1711953128, 'UCB', 'MD sir', 'Top Management', 'meet', '2025-07-09 09:12:54', 'out', '2025-07-09 10:13:55'),
(363, 'Amir', '2nd', 171144208, 'Denimity lab', 'DMD sir', 'Top management', 'doc', '2025-07-09 09:18:25', 'out', '2025-07-09 10:14:02'),
(364, '1.Rafia 2.Abu zahid', '186', 1689569922, 'YKK', 'Ruhul', 'Merchants', 'meeting', '2025-07-09 09:27:25', 'out', '2025-07-09 10:14:11'),
(365, 'Bari', '166', 1676900422, 'Meghna cable', 'farhan', 's/c', 'meeting', '2025-07-09 10:21:39', 'out', '2025-07-09 10:43:56'),
(366, '1.Zakaria 2.Faysal', '2nd', 1619795717, 'Nouga', 'jabed', 'Hr', 'Intern', '2025-07-09 10:28:15', NULL, NULL),
(367, 'Anisuzzm', '163', 161399353, 'AJL', 'Ataur', 'Planning', 'Meet', '2025-07-09 11:05:08', NULL, NULL),
(368, 'emi', '4th', 1753777777, 'wa gi', 'monwar', 'merchants', 'meeting', '2025-07-10 04:09:42', 'out', '2025-07-10 09:44:57'),
(369, 'rashed', '166', 1708808070, 'partex', 'farhan', 's/c', 'bill', '2025-07-10 04:13:57', 'out', '2025-07-10 04:52:28'),
(370, 'Zahid', '159', 1875194456, 'Rinbow', 'Tasir', 'Merchants', 'sample', '2025-07-10 04:16:37', 'out', '2025-07-10 04:52:52'),
(371, 'liton', '4th', 1636958802, 'sss design', 'shaikat', 'merchants', 'doc', '2025-07-10 04:23:43', 'out', '2025-07-10 04:52:59'),
(372, 'salaman', '7th', 1726044944, 'supreme', 'al-amin', 's/c', 'bill', '2025-07-10 04:27:00', 'out', '2025-07-10 04:31:54'),
(373, 'Yasin', '166', 1712808515, 'ever swing', 'Rakib', 's/c', 'bill', '2025-07-10 04:52:09', 'out', '2025-07-10 05:29:54'),
(374, 'nannu', '176', 1923112179, 'prime bank', 'subrata', 'commercial', 'doc', '2025-07-10 05:30:59', 'out', '2025-07-10 06:59:31'),
(375, '1.Prosenjit 2.devid ', '2nd', 1844285750, 'Fenada texttile', 'Ruhul', 'merchants', 'meeting', '2025-07-10 06:55:02', 'out', '2025-07-10 08:24:50'),
(376, 'palash', '2nd', 1997014910, 'tool master', 'Rizwan', 's/c', 'meet', '2025-07-10 08:37:12', 'out', '2025-07-10 10:18:00'),
(377, 'Mahbubul', '2nd', 1711568155, 'Gulshan', 'jabed', 'merchants', 'interview', '2025-07-10 09:09:10', 'out', '2025-07-10 11:58:26'),
(378, 'Rhman', '176', 1995649633, 'colotex', 'sohel', 'commercial', 'doc', '2025-07-10 09:26:55', 'out', '2025-07-10 10:18:18'),
(379, 'Apu', '2nd', 1777734199, 'Smart printing soluation', 'Omar', 'ICT', 'Meeting', '2025-07-10 09:43:27', 'out', '2025-07-10 10:17:50'),
(380, 'Jwel', '7th', 197769681, 'mas technoloy', 'Labib', 's/c', 'bill', '2025-07-10 10:45:12', 'out', '2025-07-10 11:00:11'),
(381, 'Shopon', '2nd', 1819276766, 'southest', 'Ridwan Sir', 'Higher Management', 'Meeting', '2025-07-10 10:51:48', 'out', '2025-07-10 11:58:18'),
(382, 'Jwel', '2nd', 1977679818, 'Mas technology', 'arka', 'ict', 'product', '2025-07-10 10:53:33', 'out', '2025-07-10 11:00:30'),
(383, 'Ruhul', '18', 1998215928, 'M&U packaging', 'Sohel', 'Commercial', 'doc', '2025-07-10 11:00:02', 'out', '2025-07-10 11:12:20'),
(384, 'Shihab', '4th', 1847327412, 'usman', 'Tarek', 'merchants', 'sample', '2025-07-10 11:25:37', 'out', '2025-07-10 11:58:05'),
(385, 'Reaz', '4th', 1710417644, 'L&T global', 'Nur', 'Merchants', 'sample', '2025-07-10 11:32:11', 'out', '2025-07-10 11:58:11'),
(386, 'Faisal', '2nd', 1, 'WS', 'jabed', 'hr', 'interview', '2025-07-12 03:14:38', NULL, NULL),
(387, 'Rifat', '7th', 1812375189, 'naf group', 'rafiq', 'eng', 'meeting', '2025-07-12 03:22:31', 'out', '2025-07-12 04:44:06'),
(388, 'Jahangir', '7th', 1729718792, 'AJL', 'Rizwan', 'S/C', 'meet', '2025-07-12 04:12:25', 'out', '2025-07-12 05:29:12'),
(389, 'Bodor', '2nd', 1738735964, 'Ornet design', 'Rhman', 'ACCounts', 'Cheak', '2025-07-12 04:13:30', 'out', '2025-07-12 05:29:21'),
(390, '1.Tahsin 2.Atik 3.Rakib 4.arif', '2nd', 1912450346, 'Inter tech', 'Arif', 'compliance', 'meeting', '2025-07-12 04:32:09', 'out', '2025-07-12 05:45:28'),
(391, 'shamim', '7th', 1712586354, 'Deline', 'Labib', 'S/C', 'Sample', '2025-07-12 04:43:54', 'out', '2025-07-12 04:54:57'),
(392, 'Faisal', '2nd', 1864652061, 'Amber it', 'Omar', 'ICT', 'Sample', '2025-07-12 04:55:53', 'out', '2025-07-12 05:30:46'),
(393, 'Arif', '2nd', 1711937075, 'Rangs motors', 'Montacir', 'Transport', 'meet', '2025-07-12 05:07:34', 'out', '2025-07-12 05:29:53'),
(394, 'Rakibul', '2nd', 1991162227, 'PWPL', 'Reza', 'hr', 'meet', '2025-07-12 05:14:06', 'out', '2025-07-12 05:30:31'),
(395, 'Rafiqul', '2nd', 1818914263, 'Light bridge', 'Rhman', 'Accounts', 'Cheak', '2025-07-12 05:16:16', 'out', '2025-07-12 06:05:35'),
(396, 'Mehdi', '166', 1610118589, 'Print aid', 'Rupok', 'S/C', 'Bill', '2025-07-12 05:21:37', 'out', '2025-07-12 05:30:06');
INSERT INTO `tblvisitor` (`ID`, `FullName`, `Email`, `MobileNumber`, `Address`, `WhomtoMeet`, `Deptartment`, `ReasontoMeet`, `EnterDate`, `remark`, `outtime`) VALUES
(397, 'sakib', '166', 1794274241, 'Elevator eng', 'Farhan', 's/c', 'bill', '2025-07-12 05:34:38', 'out', '2025-07-12 09:18:23'),
(398, 'Kamal', '2nd', 1715867698, 'max eng', 'rhman', 's/c', 'cheak', '2025-07-12 05:43:04', 'out', '2025-07-12 06:05:15'),
(399, 'Bappy ', '2nd', 176013000, 'Renesa ins.1717', 'omar', 'ict', 'meeting', '2025-07-12 05:45:12', 'out', '2025-07-12 05:46:02'),
(400, 'Rishad', '7th', 1766281830, 'Mtm corporation', 'Rupok', 'S/C', 'bill', '2025-07-12 06:02:39', 'out', '2025-07-12 06:46:06'),
(401, 'Mizzan', '176', 1728194713, 'Argon denim', 'Sohel', 'Commercial', 'Doc', '2025-07-12 06:03:14', 'out', '2025-07-12 07:13:45'),
(402, '1.Shamim 2.Mohiuddin', '7th', 1973092892, 'puma', 'Abu bakkar', 's/c', 'meeting', '2025-07-12 06:08:44', 'out', '2025-07-12 06:46:31'),
(403, 'Titam', '168', 1757922561, 'Bkash', 'Amin', 'accounts', 'meet', '2025-07-12 06:11:51', 'out', '2025-07-12 09:16:53'),
(404, 'Arafat', '2nd', 1624013871, 'Fresh & care', 'Piash', 'Admin', 'Meeting', '2025-07-12 06:14:54', 'out', '2025-07-12 09:16:45'),
(405, 'Mahfuz', '2nd', 1323878002, 'solver', 'rhman', 'Accounts', 'cheak', '2025-07-12 06:37:13', 'out', '2025-07-12 09:16:37'),
(406, 'Kawser', '7th', 1612358910, 'National poly ', 'al-amin', 's/c', 'sample', '2025-07-12 07:00:52', 'out', '2025-07-12 07:09:00'),
(407, 'Azam', '7th', 1713452600, 'Multipul power generation', 'Masud', 'S/C', 'meet', '2025-07-12 07:05:12', 'out', '2025-07-12 09:16:28'),
(408, 'Tabassum', '2nd', 1913199110, 'AJL', 'Jabed', 'Hr', 'meet', '2025-07-12 09:16:08', 'out', '2025-07-12 09:46:34'),
(409, 'shahin', '18', 1575220014, 'pioneer denim', 'Sohel', 'commercial', 'doc', '2025-07-12 09:19:33', 'out', '2025-07-12 10:51:50'),
(410, 'Rabbi', '176', 1688280217, 'sim fabrics', 'Sohel', 'commercial', 'Doc', '2025-07-12 09:40:33', 'out', '2025-07-12 10:51:33'),
(411, 'Moshaisk', '2nd', 1743909501, 'Prime bank', 'Jarif', 'hr', 'doc', '2025-07-12 09:46:25', 'out', '2025-07-12 09:48:12'),
(412, 'Ferdous', '7th', 1716415400, 'TK App texrt', 'Labib', 'S/C', 'bill', '2025-07-12 09:52:55', NULL, NULL),
(413, 'Ariful', '7th', 1727275105, 'Money exchange', 'Amin ', 'Accounts', 'Money', '2025-07-12 10:08:55', 'out', '2025-07-12 10:51:13'),
(414, 'Limon', '2nd', 1611686102, 'Residentioal owner', 'Nishan', 'Admin', 'meet', '2025-07-12 10:39:39', 'out', '2025-07-12 10:50:55'),
(415, '1.Faisal 2.Biplob', '168', 1316736322, 'Trade zenturm', 'Masud', 'S/C', 'Meet', '2025-07-12 10:42:41', 'out', '2025-07-12 10:51:04'),
(416, '1.Shimul 2.Denim', '7th', 1817569156, 'Smart tech', 'Kamal', 'S/C', 'Meeting', '2025-07-13 03:29:58', 'out', '2025-07-13 04:22:09'),
(417, 'Chinmoy', '176', 1721807299, 'Southern traders', 'Subrata', 'Commercial', 'Doc', '2025-07-13 03:48:49', 'out', '2025-07-13 04:23:32'),
(418, 'Amir hamza', '7th', 1711442083, 'Denimity lab', 'Rupok', 'S/C', 'bill', '2025-07-13 04:21:46', 'out', '2025-07-13 05:27:25'),
(419, 'Shuvo', '159', 1818598132, 'Rainbow', 'Tithi', 'Design', 'sample', '2025-07-13 04:23:11', 'out', '2025-07-13 04:26:23'),
(420, 'Shaer bani', '7th', 1712388901, 'Apex hossain', 'manik', 'S/C', 'bill', '2025-07-13 04:34:55', 'out', '2025-07-13 05:22:17'),
(421, 'kawser', '159', 1613971349, 'loom', 'taibur', 'merchants', 'sample', '2025-07-13 05:22:02', 'out', '2025-07-13 05:27:16'),
(422, 'kamal', '168', 1915619899, 'Bengle tiles', 'Labib', 'S/C', 'products', '2025-07-13 05:27:08', 'out', '2025-07-13 08:39:43'),
(423, 'Subrata', '7th', 1810226112, 'Glorious tech bd', 'abu bakkar', 's/c', 'bill', '2025-07-13 05:40:23', 'out', '2025-07-13 08:39:51'),
(424, 'Bulbul', '7th', 1715282183, 'ABM', 'Amin', 'Accounts', 'Bill', '2025-07-13 06:55:30', 'out', '2025-07-13 08:39:57'),
(425, 'Mithila', '5th', 1672851108, 'faungyoun', 'shaikat', 'Merchants', 'meet', '2025-07-13 08:38:06', 'out', '2025-07-13 08:40:04'),
(426, 'hasan', '7th', 1722043131, 'prime bank', 'mahbub', 'accounts', 'doc', '2025-07-13 08:47:00', 'out', '2025-07-13 09:13:35'),
(427, 'Ripon', '7th ', 1323729151, 'FR corporation', 'rupok', 's/c', 'bill', '2025-07-13 08:56:35', 'out', '2025-07-13 09:13:44'),
(428, 'Sohel', '168', 1630337273, 'FBM', 'Farhan', 'S/C', 'bill', '2025-07-13 09:15:02', 'out', '2025-07-13 09:48:50'),
(429, '1.ariful 2.Shishir', '7th', 1727275105, 'Money exchange', 'amin', 'Accounts', 'money', '2025-07-13 09:48:39', 'out', '2025-07-13 10:51:13'),
(430, 'Rahmat', '2nd', 1648148636, 'Vulene', 'Shayla', 'Merchants', 'doc', '2025-07-13 09:51:04', 'out', '2025-07-13 09:51:17'),
(431, 'Rakib', '7th', 1799425325, 'Tech touch', 'sheli', 'S/C', 'meeting', '2025-07-13 10:11:24', 'out', '2025-07-13 10:51:06'),
(432, 'Zaman', '7th', 1790492690, 'Trims hut bd', 'Alkas', 'Audit', 'Doc review', '2025-07-13 10:54:14', 'out', '2025-07-13 11:33:25'),
(433, 'Moshiur', '5th', 1683121570, 'Blue fashion', 'Zahid', 'Wash', 'Sample', '2025-07-13 10:56:37', NULL, NULL),
(434, 'Nahid', '6th', 1817019137, 'Friend', 'DMD sir', 'Top Management', 'meet', '2025-07-13 11:32:49', NULL, NULL),
(435, 'Mostak', '7th', 1918996405, 'Famous', 'Masud', 's/c', 'bill', '2025-07-13 11:44:13', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitorabm`
--

CREATE TABLE `tblvisitorabm` (
  `ID` int(5) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `Deptartment` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitoragl`
--

CREATE TABLE `tblvisitoragl` (
  `ID` int(5) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `Deptartment` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvisitoragl`
--

INSERT INTO `tblvisitoragl` (`ID`, `FullName`, `Email`, `MobileNumber`, `Address`, `WhomtoMeet`, `Deptartment`, `ReasontoMeet`, `EnterDate`, `remark`, `outtime`) VALUES
(74, '01. Ahad  02.Shemol ', '003,004', 1405542513, 'HO-Uttara ', 'Shofiuddin Ahmed ', 'Security', 'Meet', '2025-07-05 07:36:52', 'Out\r\n', '2025-07-05 07:38:23'),
(75, 'Mehedi (08:47 AM)', '301', 0, 'Banjjotex', 'Anower', 'Quality ', 'Inspection', '2025-07-06 04:23:23', 'out', '2025-07-06 12:31:17'),
(76, 'Mizan', '302', 0, 'BTex', 'Anower', 'Quality', 'Inspection', '2025-07-06 04:25:14', 'out', '2025-07-06 12:30:47'),
(77, 'Shahidul', '303', 0, 'NTBD', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:22:21', 'out', '2025-07-06 11:47:39'),
(78, 'Rafiq (09:02 Am)', '304', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:24:19', 'out', '2025-07-06 11:48:13'),
(79, 'Nayan (09:15 AM) ', '305', 0, 'RainBow', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:37:26', 'out', '2025-07-06 13:51:09'),
(80, 'Shahen', '306', 0, 'Justic', 'Arif', 'Quality', 'Inspection', '2025-07-06 10:39:01', 'out', '2025-07-07 14:03:37'),
(81, 'Rashed (09:35)', '307', 0, 'GTGS', 'Habib', 'Quality', 'Inspection', '2025-07-06 10:41:14', 'out', '2025-07-06 13:05:26'),
(82, '1. Amdat 2. Safa', '308,309', 0, 'SGT', 'Jaman', 'RPS', 'Inspection', '2025-07-06 10:44:47', 'out', '2025-07-06 13:01:03'),
(83, 'Hasan (09:50 Am)', '310', 0, 'Ling Feng', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:46:41', 'out', '2025-07-06 12:35:02'),
(84, 'Faisal (09:57)', '311', 0, 'Vouge Sourcing', 'Jaman', 'Quality', 'Inspction', '2025-07-06 10:49:20', 'out', '2025-07-06 13:22:11'),
(85, 'Iqbal', '312', 0, 'Banguotex', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:50:44', 'out', '2025-07-06 13:30:40'),
(86, 'Asraf (10:22 am)', '314', 0, 'Banguotex', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:53:25', 'out', '2025-07-07 15:52:20'),
(87, 'Nuruzzaman (10:52 Am)', '315', 0, 'Banguotex\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:54:56', 'out', '2025-07-06 13:21:36'),
(88, '01.Ariful 02.Mozahid ( 11:15 am) ', '316,317', 0, 'Celebrity pink', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:58:35', 'out', '2025-07-06 11:01:47'),
(89, 'Arif (02:50 pm)', '318', 0, 'NTBD', 'Anower', 'Quality', 'Inspection', '2025-07-06 10:59:59', 'out', '2025-07-06 11:53:31'),
(90, 'Ismail ', '319', 0, 'Rainbow', 'Anower', 'Quality', 'Inspection', '2025-07-06 11:01:14', 'out', '2025-07-06 13:50:46'),
(91, 'Mizan ', '301', 0, 'BTex', 'Anower', 'Quality', 'Inspection', '2025-07-07 03:28:03', 'out', '2025-07-07 12:40:35'),
(92, 'Mr. Faisal (09:00 AM)', '302', 0, 'V/S', 'anower', 'Quality', 'Inspection', '2025-07-07 03:34:21', 'out', '2025-07-07 13:46:11'),
(93, 'Mr. Shahen (09:12 AM)', '303', 0, 'Justic', 'Anower', 'Quality', 'Inspection', '2025-07-07 03:35:56', 'out', '2025-07-07 08:56:53'),
(94, 'Mr. Obeidul', '304', 0, 'Kmart', 'Anower', 'Quality', 'Inspection', '2025-07-07 03:37:41', 'out', '2025-07-07 15:51:36'),
(95, 'Ramesh', 'GTGS', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-07 03:38:57', 'out', '2025-07-07 12:29:57'),
(96, 'Rashed (09:47 AM)', '306', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-07 04:14:24', 'out', '2025-07-07 15:52:44'),
(97, 'Mr. Mizan', '307', 0, '5.11', 'Anower', 'Quality', 'Visit', '2025-07-07 04:33:25', 'out', '2025-07-07 12:04:50'),
(98, 'Mr. Shahidul', '308', 0, 'New Time BD', 'Anower', 'Quality', 'Inspection', '2025-07-07 04:35:05', 'out', '2025-07-07 13:57:45'),
(99, 'Mr Hasan (10:53 Am)', '309', 0, 'LingFung', 'Anower', 'Quality', 'Inspection', '2025-07-07 05:51:11', '02.20', '2025-07-07 08:31:37'),
(100, 'Mr. Shahen (11:00 Am)', '310', 0, 'Peak', 'Anower', 'Quality', 'Inspection', '2025-07-07 05:53:07', 'out', '2025-07-07 06:13:55'),
(101, 'Mr.Nuruzzaman +01 (11:35 Am)', '311,312', 0, 'Pioneer Denim', 'Najmul', 'Quality', 'Meeting', '2025-07-07 05:55:05', 'out', '2025-07-07 17:33:53'),
(102, '01.Khademul 02.Rofiq 03. Rashel (11:38 Am)', '313, 314,315', 0, 'Maxtrims', 'Rokon', 'ODNetor', 'Meeting', '2025-07-07 05:58:00', 'out', '2025-07-07 17:33:44'),
(103, 'Tarek (08:55 Am)', '301', 0, 'Auto', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:07:01', 'OUT', '2025-07-08 14:46:09'),
(104, 'Faisal (09:00 Am)', '302', 0, 'V/S', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:08:20', 'OUT', '2025-07-08 14:45:27'),
(105, 'Mizan (09:05 Am)', '303', 0, 'B/Tex', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:09:45', 'OUT', '2025-07-08 14:45:03'),
(106, 'Mr. Romesh (09:00 AM)', '304', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:11:24', 'OUT', '2025-07-08 11:13:25'),
(107, 'Mr. Shahidul (09:00 AM )', '305', 0, 'New Time', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:12:50', 'Out\r\n', '2025-07-08 07:26:27'),
(108, 'Mr. Rafiq (09:25 AM ) ', '306', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:14:34', 'OUT', '2025-07-08 14:13:47'),
(109, 'Mr. Shahen (09:30 Am)', '307', 0, 'Justic', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:16:39', 'OUT', '2025-07-08 14:41:53'),
(110, 'Mr. Rashed (09:30 Am)', '308', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-08 04:20:12', 'OUT', '2025-07-08 15:43:15'),
(111, 'Mr. Ikbal (10:57 Am)', '309', 0, 'B/Tex', 'Anower', 'Quality', 'Inspection', '2025-07-08 06:55:07', 'OUT', '2025-07-08 15:43:35'),
(112, '01. Mr Shahadat 02.Tarikul (10:57 Am)', '310', 0, 'V/S', 'Anower', 'Quality', 'Inspection', '2025-07-08 07:30:10', 'OUT', '2025-07-08 15:44:22'),
(113, 'Mr Hasan (11:11 AM)', '311', 0, 'LungFang', 'Anower', 'Quality', 'Inspection', '2025-07-08 07:31:20', 'OUT', '2025-07-08 15:44:06'),
(114, 'Mr.Ibrahim ', '312', 0, 'B/Tex', 'Anower', 'Quality', 'Inspection', '2025-07-08 07:32:25', 'OUT', '2025-07-08 15:43:51'),
(115, 'Mr. Shofiqul 02. Selim + 01 (11:30 Am )', '313,314,315', 1744618708, 'BGMEA', 'Feroz Sir', 'Adminstation', 'Meeting', '2025-07-08 07:34:36', 'Out', '2025-07-08 07:34:50'),
(116, 'Dr. Nauren', '316', 1778312384, 'BGMEA', 'Feroz Sir', 'Adminstation', 'Meeting', '2025-07-08 07:36:55', 'Out\r\n', '2025-07-08 07:43:01'),
(117, 'Mr Piter', '317', 0, 'B/Tex', 'Feroz Sir', 'Adminstation', 'Inspection', '2025-07-08 07:38:40', 'OUT', '2025-07-08 14:47:18'),
(118, 'Mr Delower (11:50 Am)', '318', 0, 'Brac', 'Feroz Sir ', 'Adminstation', 'Visit', '2025-07-08 07:40:19', 'OUT', '2025-07-08 14:46:57'),
(119, 'Mr Mehedi  (11:50 AM)', '319', 0, 'B/TEx', 'Anower', 'Quality', 'Inspection', '2025-07-08 07:41:30', 'OUT', '2025-07-08 11:38:39'),
(120, 'Mr Selim (01;20 pm)', '320', 0, 'Peak', 'Anower', 'Quality', 'Inspection', '2025-07-08 07:42:45', 'OUT', '2025-07-08 14:43:56'),
(121, 'Mr. Mizan (09:00 AM)', '301', 0, 'B-Tex', 'Mr. Anower', 'Quality', 'Inspection', '2025-07-09 04:46:00', 'Out', '2025-07-10 14:00:06'),
(122, 'Mr. Mehedi (09:03 AM )', '302', 0, 'BangoTex', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:47:35', 'out', '2025-07-09 12:53:18'),
(123, 'Mr Rashed  (09:22 AM)', '303', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:49:15', 'Out', '2025-07-10 14:00:19'),
(124, 'Mr Helal (09:30 AM)', '304', 0, 'Auto', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:51:10', 'Out', '2025-07-10 14:00:39'),
(125, 'Mr Faisal ( 09:30AM)', '305', 0, 'V/S', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:52:20', 'Out', '2025-07-10 14:00:54'),
(126, 'Mr Asraf (09:35 AM)', '306', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:53:26', 'Out', '2025-07-10 14:01:19'),
(127, 'Mr Dulal (09:35 AM)', '307', 0, 'B-Tex\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:55:03', 'out', '2025-07-10 13:41:23'),
(128, '01. Mr Mahadi 02.Rajaul', '308,309', 0, 'Walmart', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:57:11', 'Out', '2025-07-10 13:59:40'),
(129, 'Mr Obydul (09:38 Am)', '310', 0, 'Kmart', 'Anower', 'Quality', 'Inspection', '2025-07-09 04:58:14', 'Out', '2025-07-10 13:59:26'),
(130, 'Mr. Shahidul (09:40 AM) ', '311', 0, 'NewTime', 'Anower', 'Quality', 'Inspection', '2025-07-09 05:00:06', 'Out', '2025-07-10 13:59:12'),
(131, 'Mr Nuruzzaman (10:30 AM)', '312', 0, 'B/W', 'Anower', 'Quality', 'Inspection', '2025-07-09 05:02:07', 'Out', '2025-07-10 13:59:00'),
(132, 'Shaha (10:08 AM) ', '313', 0, 'Justic', 'Anower', 'Quality', 'Inspection', '2025-07-09 05:03:21', 'Out', '2025-07-10 13:58:44'),
(133, 'Mr Hasad (10:30 AM)', '314', 0, 'L/F', 'Anower', 'Quality ', 'Inspection', '2025-07-09 05:04:39', 'Out', '2025-07-10 13:58:29'),
(134, 'Mr Saad (11:10 AM)', '315', 0, 'L-F', 'Anower', 'Quality', 'Meeting', '2025-07-09 07:47:33', 'out', '2025-07-09 09:43:11'),
(135, '01 .Mr .Ibrahim  + 02 Mr. Shahen', '316,317', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-09 07:49:40', 'OUt', '2025-07-10 13:58:09'),
(136, 'Shafiqul +1  (12:05 PM)', '318,319', 0, 'BGMEA', 'Feroz SIr ', 'Adminstation', 'Meeting', '2025-07-09 07:51:30', 'Out', '2025-07-10 13:57:51'),
(137, 'Mr Fahad (01:20 PM) ', '320', 0, 'Walmart', 'Anower', 'Quality', 'Anower', '2025-07-09 07:52:51', 'Out', '2025-07-10 13:57:32'),
(138, 'Mr. Ariful (01:20 PM) ', '321', 0, 'Walmart', 'Anower', 'Quality', 'Inspection', '2025-07-09 07:54:36', 'Out', '2025-07-10 13:57:12'),
(139, 'Mr Rabbi (01:20 Pm)', '322', 0, 'Walmart', 'Anower', 'Quality ', 'Inspection', '2025-07-09 07:56:21', 'Out', '2025-07-10 14:02:15'),
(140, 'SHAKIL', '323', 0, 'B/Tex', 'Anower', 'Quility', 'Inspection', '2025-07-09 11:47:36', 'Out', '2025-07-10 14:02:33'),
(141, 'Prince/Ismail', '324/325', 0, 'Rainbow', 'Anower', 'Quality', 'Inspection', '2025-07-09 11:51:06', 'out', '2025-07-10 14:01:54'),
(142, 'Mr Mizan (08:40 Am)', '301', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 04:35:47', 'out', '2025-07-10 14:44:16'),
(143, 'Mr Shamim + 5 (09', '302-306', 1641974534, 'BGMEA', 'Medical', 'Medical', 'TB test', '2025-07-10 04:39:13', 'out', '2025-07-10 12:38:09'),
(144, 'Mr Faisal (09:05 Am)', '307', 0, 'V/S', 'Anower', 'Quality', 'inspection', '2025-07-10 04:41:10', 'out', '2025-07-10 14:45:23'),
(145, 'Mr Amran (09:25 am)', '309', 1764171914, 'BGMEA', 'Firoz Sir', 'Admin', 'TB Test', '2025-07-10 04:43:20', 'out', '2025-07-10 12:39:26'),
(146, 'Mr Shafiqul  (09:20 Am)', '310', 0, 'BGMEA', 'Firoz Sir', 'Admin', 'TB Test', '2025-07-10 04:44:48', 'out', '2025-07-10 14:45:06'),
(147, 'Mr. Rashed  (09:26 Am)', '311', 0, 'GTGS', 'Habib', 'Quality', 'Inspection', '2025-07-10 08:03:32', 'out', '2025-07-10 14:44:50'),
(148, 'Mr Romesh (09:26 Am)', '311', 0, 'GTGS', 'Habib', 'Quality', 'Inspection', '2025-07-10 08:05:05', 'out', '2025-07-10 14:44:36'),
(149, 'Mr Rafiq (09:26 AM )', '312', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:06:39', 'out', '2025-07-10 14:23:42'),
(150, 'Mr WAhid (09:31 Am)', '313', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:08:00', 'out', '2025-07-10 12:34:39'),
(151, 'Mr Shahen (09:45 Am )', '314', 0, 'Justice', 'Anower', 'Quality ', 'Inspection', '2025-07-10 08:09:22', 'out', '2025-07-10 14:47:46'),
(152, 'Mr Hasad (10:15 AM)', '315', 0, 'L-F', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:10:46', 'out', '2025-07-10 09:07:14'),
(153, 'Mr Iqbal (10:31 Am )', '316', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:12:13', 'out', '2025-07-10 15:03:34'),
(154, 'Mr Tauhid (10:50 AM)', '317', 0, 'V/S', 'ANower', 'Quality', 'Visit', '2025-07-10 08:13:32', 'Out', '2025-07-11 01:36:18'),
(155, 'Mr Arafath (10:52 Am)', '318', 0, 'Bestseller', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:15:42', 'Out', '2025-07-11 01:36:06'),
(156, 'Mr Angus (10:55 AM)', '319', 0, 'GTGS', 'Habib', 'Quality', 'Inspection', '2025-07-10 08:17:07', 'Out', '2025-07-11 01:35:54'),
(157, 'Mr Tarek (11:10 AM)', '320', 0, 'Auto', 'aNOWER', 'Quality', 'Inspection', '2025-07-10 08:18:51', 'out', '2025-07-10 14:48:06'),
(158, 'Ms. Dr Nourin + 7p (11:26 Am) ', '325-332', 1778312364, 'BGMEA', 'Madical', 'Madical', 'TB Test / Visit', '2025-07-10 08:21:42', 'OUT-  02;27 Pm', '2025-07-10 09:54:14'),
(159, 'Mr. Ibrahim (01:11 PM)', '336', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 08:23:18', 'out', '2025-07-10 15:02:52'),
(160, 'Mr; Ashraf ', '337', 0, 'B/Tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 09:15:25', 'out', '2025-07-10 14:23:59'),
(161, 'Mr Dulal', '338', 0, 'B/tex', 'Anower', 'Quality', 'Inspection', '2025-07-10 09:17:44', 'out', '2025-07-10 14:12:04'),
(162, 'Parvez', '339', 0, 'V/s', 'Anower', 'Qualy', 'Inspection', '2025-07-10 09:19:22', 'out', '2025-07-10 12:24:02'),
(163, 'Mr Angus - Rafiq ', '301 ,302', 0, 'GTGS', 'Anower', 'Qualily', 'Inspection', '2025-07-12 04:12:36', 'out', '2025-07-13 04:03:09'),
(164, 'Mr Mizan (08:32 Am) ', '303', 0, 'B-Tex ', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:14:22', 'oUT', '2025-07-12 17:14:11'),
(165, 'Mr . Ashraf (09:20 AM) ', '304', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:17:02', 'out', '2025-07-13 04:02:53'),
(166, 'Mr. Rashed (09:22 AM)', '305', 0, 'GTGS', 'Anower', 'Quality', 'Insopection', '2025-07-12 04:19:01', 'out', '2025-07-13 04:02:40'),
(167, 'Mr Ramesh (09', '306', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:20:11', 'out', '2025-07-13 04:02:22'),
(168, 'Mr Shajib (09:30 Am)', '308', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:22:56', 'out', '2025-07-13 04:02:08'),
(169, 'Mr Wahid', '309', 0, 'B-Tex\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:25:45', 'oUT', '2025-07-12 19:21:53'),
(170, 'Shahidul (10:00 AM)', '310', 0, 'New Time Bd ', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:27:28', 'out', '2025-07-12 11:00:24'),
(171, 'Mr Jacky (10:05 Am)', '311', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:28:50', 'out', '2025-07-13 04:01:53'),
(172, 'Mr Shirajul  (10:05 Am)', '312', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:30:34', 'out', '2025-07-13 04:00:42'),
(173, 'Mr Hasad', '313', 1708124714, 'L/F', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:32:23', 'out', '2025-07-13 04:00:27'),
(174, 'Mr Alal', '313', 0, 'L-F', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:33:13', 'out', '2025-07-13 04:00:08'),
(175, 'Mr Ibrahim', '314', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:34:29', 'out', '2025-07-13 03:59:41'),
(176, 'Mr Nurruzzaman', '317', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-12 04:35:33', 'out', '2025-07-13 03:59:30'),
(177, 'kena ram', '318', 1613199992, 'PWPL', 'Shafiuddin', 'Security', 'Official', '2025-07-12 09:01:17', 'Out', '2025-07-12 09:01:52'),
(178, 'Mr RAbby (10:30 Am)', '318', 0, 'B/T', 'Anower', 'Quality', 'Inspection', '2025-07-12 11:35:11', 'out', '2025-07-13 03:59:08'),
(179, 'Mr Kalam + 1 (11:15 AM)', '319+320', 0, 'L/W', 'Anower', 'Quality', 'Inspection', '2025-07-12 11:37:01', 'out', '2025-07-13 03:58:57'),
(180, 'Mr Shamim (11:30 Am)', '321', 0, 'B-Tex', 'Anower', 'Quality', 'Inspection', '2025-07-12 11:38:21', 'out', '2025-07-13 03:58:47'),
(181, 'Mr Mintu (01:16 PM)', '322', 0, 'Auto\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-12 11:39:41', 'out', '2025-07-13 03:55:23'),
(182, 'Mr Humaon (01:19 PM).', '323', 0, 'Kabirpur ', 'Anower', 'Quality', 'Inspecton', '2025-07-12 11:41:53', 'out', '2025-07-13 03:55:10'),
(183, 'Mr Forhad', '324', 0, 'C-P\r\n\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-12 11:43:26', 'out', '2025-07-13 03:54:58'),
(184, 'Mr.Razib Mullit (9;45 AM)', '308', 0, 'UL', 'Anower', 'Quality', 'Inspection', '2025-07-12 19:35:26', 'out', '2025-07-12 19:36:00'),
(185, 'Mr.Benny (05;30 PM)', '328', 0, 'Walmart (CP)', 'Anower', 'Quality Dep..', 'Inspection', '2025-07-12 22:05:13', 'out', '2025-07-12 22:05:52'),
(186, 'Mr Mizan (08:34 AM)', '301', 0, 'B-TEx', 'Anower', 'Quality', 'Inspection', '2025-07-13 02:47:48', NULL, NULL),
(187, 'Rofiq', '302', 0, 'GTGS', 'Anower', 'Quality', 'Inspection', '2025-07-13 04:09:07', 'out', '2025-07-13 11:32:26'),
(188, 'Faisal', '303', 0, 'Vogusorsin', 'Anower', 'Quality', 'Inspection', '2025-07-13 04:12:26', NULL, NULL),
(189, 'Mehedi', '304', 0, 'Baunjoontex', 'Anower', 'Quality', 'Inspection', '2025-07-13 04:18:26', NULL, NULL),
(190, 'Shohidul', '305', 0, 'Newtime', 'Anower', 'Qaulity', 'Inspection', '2025-07-13 04:22:34', NULL, NULL),
(191, 'Shahen', '306', 0, 'Justis', 'Anower', 'Quality', 'Inspection', '2025-07-13 04:29:02', NULL, NULL),
(192, 'Mr RAbbi (11:14 Am)', '307', 0, 'B-W', 'Anower', 'Quality', 'Inspection', '2025-07-13 05:38:50', NULL, NULL),
(193, 'Mr Ekram (11:20 AM)', '308', 0, 'B-W', 'Anower', 'Quality', 'Inspection', '2025-07-13 05:39:54', NULL, NULL),
(194, 'Mr Mery  (11:20 Am)', '309', 0, 'B-W', 'Anower', 'Quality', 'Ispection', '2025-07-13 05:41:01', NULL, NULL),
(195, 'Mr TAufiz & Miss Sabrina (11:30 Am)', '310,311', 0, 'RSC', 'Mahamud ', 'Compaince', 'Inspection', '2025-07-13 05:43:17', 'out', '2025-07-13 10:38:44'),
(196, 'Mr Arafath (11:36 AM)', '312', 0, 'Uttara\r\n\r\n', 'Anower', 'Quality', 'Inspection', '2025-07-13 05:45:20', 'out', '2025-07-13 10:55:48'),
(197, 'Shamim', '313', 0, 'Pac', 'Anower', 'Quality', 'Inspection', '2025-07-13 06:59:46', NULL, NULL),
(198, 'Nazrul', '317', 0, 'MTL', 'Anower', 'Quality', 'Inspection', '2025-07-13 07:52:28', NULL, NULL),
(199, 'Mr Dulal [2.40 Pm]', '324', 0, 'UL', 'Anower', 'Quality', 'Inspection', '2025-07-13 10:42:50', NULL, NULL),
(200, 'Ashraful [3.26 Pm]', '325', 0, 'B\\W', 'Anower', 'Quality', 'Inspection', '2025-07-13 10:46:22', NULL, NULL),
(201, 'Mr Nurzzaman [4.29 Pm]', '327', 0, 'B/W', 'Anower', 'Quality', 'Inspection', '2025-07-13 10:49:10', NULL, NULL),
(202, 'Mr Sohel [3.40 Pm]', '326', 0, 'WANG', 'Anower', 'Quality', 'Inspection', '2025-07-13 10:51:15', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitorajl`
--

CREATE TABLE `tblvisitorajl` (
  `ID` int(5) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `Deptartment` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvisitorajl`
--

INSERT INTO `tblvisitorajl` (`ID`, `FullName`, `Email`, `MobileNumber`, `Address`, `WhomtoMeet`, `Deptartment`, `ReasontoMeet`, `EnterDate`, `remark`, `outtime`) VALUES
(21, 'Ramesh', '1', 1782995908, 'GTGS', 'Shofiq', 'QA', 'Inspection', '2025-06-26 03:18:40', NULL, NULL),
(22, 'Mitho Sarker', '3', 1886861676, 'Banjootex', 'Shafiul', 'QA', 'Inspection', '2025-06-26 03:23:51', NULL, NULL),
(23, 'Sumon', '2', 1708833196, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-06-26 03:26:48', NULL, NULL),
(24, 'Hridoy Mia', '5', 1704421180, 'PTEC', 'Moshiur', 'HR', 'Internee', '2025-06-26 03:32:23', NULL, NULL),
(25, 'Atik', '4', 1675644748, 'Anko', 'Monir', 'QA', 'Visit', '2025-06-26 03:34:15', NULL, NULL),
(26, 'Rajib', '6', 1758278072, 'FSCD', 'Mizanur', 'Manager', 'Fire Trading', '2025-06-26 03:56:43', NULL, NULL),
(27, 'Shirajul ', '07', 1600114520, 'GTGS', 'Shafiul ', 'QA', 'Inspection', '2025-06-26 05:28:33', NULL, NULL),
(28, '01.Mr.Loshan 02. Moshiur', '8+9', 1680053667, 'Veulia', 'Mr.Sharif', 'Utility', 'Meeting', '2025-06-26 05:46:28', NULL, NULL),
(29, 'Mahabub', '10', 1847066259, 'LCW', 'Manik', 'QA', 'Inspection', '2025-06-26 06:49:45', NULL, NULL),
(30, 'Azad', '11', 0, 'ANKO', 'Monir', 'QA', 'Inspection', '2025-06-26 09:35:07', 'Out', '2025-06-26 11:30:35'),
(31, 'Mr.Rashid', '12', 1708833012, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-06-26 09:38:00', NULL, NULL),
(32, 'Mr.Sumon', '1', 1687972940, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-06-28 03:40:52', NULL, NULL),
(33, 'Mitho Sarker', '02', 1886861686, 'Banjootex', 'Mr.Shafiul', 'QA', 'Inspection', '2025-06-28 03:53:12', NULL, NULL),
(34, 'Sazzad', '03', 1860130309, 'G3', 'Shafiul', 'Q.A', 'Inspection', '2025-06-28 08:06:02', NULL, NULL),
(35, 'Mr.Ramesh', '4', 1782995908, 'GTGS', 'Shafiul', 'QA', 'Inspection', '2025-06-28 08:59:42', NULL, NULL),
(36, 'Mr.Mitho Sarker', '01', 1886861626, 'Banjootex', 'Mr.Shafiul', 'QA', 'Inspection', '2025-06-29 02:12:35', 'out', '2025-06-29 15:19:42'),
(37, 'Ramesh', '02', 1782995908, 'GTGS', 'Mr.Shofiul Islam', 'QA', 'Inspection', '2025-06-29 02:52:16', 'out', '2025-06-29 13:32:03'),
(38, 'Azad', '3', 0, 'ANKO', 'Monir', 'QA', 'Inspection', '2025-06-29 03:28:54', 'Out', '2025-06-29 08:46:32'),
(39, 'Palash', '4', 1918621268, 'GTGS', 'Shofiul', 'QA', 'Inspection', '2025-06-29 03:30:02', 'Out', '2025-06-29 12:36:44'),
(42, '1.Sazzad   2.Samirun', '5+6', 1772154611, 'G3', 'Shofiul', 'QA', 'Inspection', '2025-06-29 04:20:12', 'out', '2025-06-29 12:00:42'),
(43, 'Mr.Abir', '07', 1712289163, 'Tomtailor', 'Mr.Manik', 'QA', 'Inspection', '2025-06-29 05:15:08', 'Out', '2025-06-29 11:15:31'),
(44, 'Mr.Shirajul', '8', 1600114520, 'GTGS', 'Mr.Shafiul', 'QA', 'Inspection', '2025-06-29 06:26:30', 'Out', '2025-06-29 12:36:29'),
(45, 'Anqus', '09', 1720025149, 'GTGS', 'Shafiul', 'Q.A', 'Inspection', '2025-06-29 08:15:49', 'Out', '2025-06-29 11:14:45'),
(46, '01.Ms.Sarah Liu 02.Ms Shea Lv 03.Mr. Masum 04.Mr.Avijit', '10+11+12+13', 0, 'GTGS', 'Mr.Akther', 'Production', 'Visit', '2025-06-29 08:39:59', 'out', '2025-06-29 10:52:43'),
(47, 'Mahabub', '14', 1847066259, 'LCW', 'Manik', 'QA', 'Inspection', '2025-06-29 09:49:29', 'Out', '2025-06-29 13:09:38'),
(48, 'Sumon', '15', 1687972940, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-06-29 10:13:31', 'out', '2025-06-29 13:24:23'),
(49, 'Azad', '1', 0, 'ANKO', 'Monir', 'QA', 'Inspection', '2025-07-01 03:09:38', 'OUT', '2025-07-01 15:01:20'),
(50, 'Rames', '2', 1782995908, 'GTGS', 'Shofiul', 'QA', 'Inspection', '2025-07-01 03:20:52', 'OUT', '2025-07-01 15:02:33'),
(51, 'Mr.Rashid', '03', 1708833012, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-07-01 03:28:11', 'OUT', '2025-07-01 15:02:21'),
(52, 'Mr.Mitho Sarker', '04', 1886861676, 'Banjootex', 'Shafiul', 'QA', 'Inspection', '2025-07-01 03:28:57', 'OUT', '2025-07-01 13:55:37'),
(53, 'Mr.Mahabub', '05', 1847066259, 'LCW', 'Mr.Manik', 'QA', 'Inspection', '2025-07-01 03:39:07', 'out', '2025-07-01 05:31:11'),
(54, 'Mr.Sumon', '06', 1687972940, 'ZXY', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-01 04:07:46', 'OUT', '2025-07-01 13:55:14'),
(55, 'Rafiana ', '7', 1400374156, 'The Saimon Project, DU', 'Mr Osim ', 'Complince ', 'Medical visit', '2025-07-01 04:40:09', 'Out', '2025-07-01 05:18:41'),
(56, 'Mr Abir', '8', 1855509662, 'Tom Tailor ', 'Mr Manik', 'QA', 'Inspection', '2025-07-01 04:46:43', 'OUT', '2025-07-01 13:30:26'),
(57, 'Shewly', '09', 1754344937, 'Simon Project DU', 'Mr.Ashim', 'Compliance', 'Medical', '2025-07-01 05:18:08', 'out', '2025-07-01 05:31:24'),
(58, 'Sazzad', '11', 1860530309, 'G3', 'Shafiul', 'Q.A', 'Inspection', '2025-07-01 07:04:43', 'OUT', '2025-07-02 12:01:28'),
(59, 'Mr.Sumon', '1', 1687972940, 'ZXY', 'Mr.Kharul', 'QA', 'Inspection', '2025-07-02 02:27:06', NULL, NULL),
(60, 'Mr.Ramesh', '2', 1782995908, 'GTGS', 'Mr.Shofiq', 'QA', 'Inspection', '2025-07-02 02:50:43', 'Out', '2025-07-02 11:00:24'),
(61, 'Mr.Rashid', '3', 1708833012, 'ZXY', 'Mr.Khairul', 'QA', 'Inspection', '2025-07-02 02:51:59', 'OUT', '2025-07-02 08:56:48'),
(62, 'Mr.Afruz', '4', 0, 'Kmart(ITS)', 'Mr.Monirul', 'QA', 'Inspection', '2025-07-02 03:18:57', 'OUT', '2025-07-02 07:06:11'),
(63, '01.Mr.Julfik 02.Mr.Mahin', '05+06', 1724281733, 'ZXY', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-02 03:33:42', 'Out', '2025-07-02 11:00:13'),
(64, 'Mr.Mitho Sarker', '07', 1886821676, 'ZXY', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-02 03:34:41', 'OUT', '2025-07-02 08:49:02'),
(65, 'Mr.Mahabub', '8', 1847066259, 'LCW', 'Mr.Manik', 'QA', '	Inspection', '2025-07-02 05:00:46', 'OUT', '2025-07-02 07:05:55'),
(66, 'Mr.Ramesh', '01', 1782995908, 'GTGS', 'Shafiul Islam', 'QA', 'Inspection', '2025-07-03 03:04:04', 'OUT', '2025-07-03 11:38:37'),
(67, 'Mr.Sumon', '02', 1687972990, 'ZXY', 'Khairul Islam', 'QA', 'Inspection', '2025-07-03 03:04:52', 'OUT', '2025-07-03 13:22:57'),
(68, 'Mr.Mitho Sarker', '03', 1886861676, 'Banjootex', 'Shafiul Islam', 'QA', 'Inspection', '2025-07-03 03:16:14', 'Out', '2025-07-03 12:18:04'),
(69, 'Jeamy', '04', 0, 'GTGS', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-03 04:04:14', 'OUT', '2025-07-03 11:08:27'),
(70, 'Mr.Mustafiz', '05', 1701224011, 'ZXY', 'Khairul', 'QA', 'Inspeciton', '2025-07-03 04:05:04', 'Out', '2025-07-03 09:18:59'),
(71, '01.Mr.Alim 02.Mr.Tarek 03.Netol', '06+07+08', 1829609126, 'H&M', 'Mr.Akteruzzaman', 'Production', 'Visit', '2025-07-03 04:06:29', 'Out', '2025-07-03 12:46:46'),
(72, 'Mr.Polash', '09', 1918621268, 'GTGS', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-03 04:53:03', 'OUT', '2025-07-03 11:08:41'),
(73, 'Mr.Shaurla', '10', 1767371767, 'Pimkle', 'H&M QC Mr.Alim', 'QC', 'Inspection', '2025-07-03 06:29:06', NULL, NULL),
(74, 'Mr.Atik', '11', 1675644748, 'Anko', 'Mr.Monir', 'QA', 'Inspection', '2025-07-03 07:01:28', 'Out', '2025-07-03 09:24:06'),
(75, 'Azad', '12', 0, 'Anko', 'Monir', 'Q.A', 'Inspection', '2025-07-03 07:44:49', 'out', '2025-07-03 10:06:44'),
(76, 'Mahabub', '13', 1847066259, 'LCW', 'Manik', 'QA', 'Inaspection', '2025-07-03 09:53:54', 'OUT', '2025-07-03 13:28:56'),
(77, 'Mr.Suleman', '14', 0, 'Banjootex', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-03 12:05:05', 'Out', '2025-07-03 12:17:45'),
(78, 'Mr. Rashed ', '01', 1708833012, 'ZXY', 'Khairul', 'QA', 'Inspection', '2025-07-04 03:40:05', NULL, NULL),
(79, 'Mr.Sumon', '02', 1687572940, 'ZXY', 'Mr.Khairul', 'QA', 'Inspection', '2025-07-04 04:02:53', NULL, NULL),
(80, 'Abu Naim', '03', 1911917617, 'QIMA', 'Khairul', 'QA', 'Inspection', '2025-07-04 07:47:40', NULL, NULL),
(81, 'Mr. Ramesh', '1', 1782995908, 'GTGS', 'Mr. Shafiqul', 'QA', 'Inspection', '2025-07-05 03:09:52', 'OUT', '2025-07-05 10:25:34'),
(82, 'Mitho Sarker', '02', 0, 'Banjootex', 'Shafiul', 'Q.A', 'Inspection', '2025-07-05 03:25:57', 'out', '2025-07-05 12:53:44'),
(84, 'Mr.Polash', '03', 1915621268, 'GTGS', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-05 03:51:00', NULL, NULL),
(85, 'Mr.Sumon', '4', 1687972990, 'ZXY', 'Mr.Khairul', 'QA', 'Inspection', '2025-07-05 05:26:03', 'out', '2025-07-05 09:04:14'),
(86, 'Mr.Rashed', '5', 1708833012, 'ZXY', 'Mr.Khairul', 'QA', 'Inspection', '2025-07-05 10:35:59', 'Out', '2025-07-05 14:38:02'),
(87, 'Mr.Mitho Sarker', '01', 1886821676, 'Banjootex', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-06 03:25:00', 'out', '2025-07-06 13:12:38'),
(88, 'Mr.Ramesh', '02', 1782995908, 'GTGS', 'Khairul Islam', 'QA', 'Inspection', '2025-07-06 03:27:06', 'out\r\n', '2025-07-06 12:53:05'),
(89, 'Mr.Oman', '03', 1405308983, 'Banjootex', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-06 05:05:29', NULL, NULL),
(90, 'Mr.Polash', '8', 1915621268, 'GTGS', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-06 06:14:57', 'out', '2025-07-06 12:47:24'),
(91, 'Habib', '6', 0, 'GTGS', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-06 06:32:13', 'out', '2025-07-06 12:40:52'),
(92, 'Tommy', '7', 0, 'G3', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-06 06:33:40', NULL, NULL),
(93, 'Mr.Azad', '1', 0, 'ANKO', 'Mr.Monir', 'QA', 'Inspection', '2025-07-07 03:18:02', 'out', '2025-07-07 06:56:42'),
(94, 'Mr. Rashed', '02', 1708833012, 'ZXY', 'Khairul', 'Q.A', 'Inspection', '2025-07-07 03:25:34', 'OUT', '2025-07-07 04:49:53'),
(95, 'Mr.Mitho Sarker', '3', 1886821676, 'Banjootex', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-07 03:52:37', 'Out', '2025-07-07 12:06:54'),
(96, 'Mr.Mahabub ', '06', 1847066259, 'LCW', 'Mr. Manik', 'QA', 'Inspection ', '2025-07-07 10:02:52', 'out', '2025-07-07 13:26:09'),
(97, 'Mr.Arafat', '04', 1779218941, 'B-Tex', 'Mr. Safiul', 'QA', 'Inspection', '2025-07-07 10:08:24', 'Out', '2025-07-07 10:42:18'),
(98, 'Mr. Petter', '05', 1779218941, 'B-Tex', 'Mr.Safiul', 'QA', 'Inspection', '2025-07-07 10:09:45', 'Out', '2025-07-07 10:42:09'),
(99, '01.Mr.Jakir 02.Mr.Shimul', '07+08', 181704548, 'BGMEA', 'Mr.Ashim Kumar ', 'Compliance', 'Official', '2025-07-07 10:40:50', NULL, NULL),
(100, 'Mr. Mitho Sarker', '01', 1886821676, 'B-Tex', 'Shafiul', 'Q.A', 'Inspection', '2025-07-08 03:13:42', 'out', '2025-07-08 09:15:16'),
(101, 'Mr.Sumon', '02', 1687972940, 'ZXY', 'Mr.Khairul Islam', 'QA', 'Inspection', '2025-07-08 04:06:28', 'Out', '2025-07-08 12:22:31'),
(102, 'mr.Shamim', '3', 1772154611, 'B-Tex', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-08 04:29:29', 'out', '2025-07-08 11:47:53'),
(103, 'Mr.Kamrul', '4', 1711662772, 'QIMA', 'Mr.Washim Kumar', 'Compliance', 'Audit', '2025-07-08 04:59:32', 'out', '2025-07-08 10:05:01'),
(104, 'Mr.Azad', '6', 0, 'Anko', 'Mr.Monir', 'QA', 'Inspection', '2025-07-08 08:48:43', 'Out', '2025-07-08 09:06:44'),
(105, 'Mr. Mahabub', '07', 1847066259, 'L.C.W', 'Harun', 'Q.A', 'Inspection', '2025-07-08 09:53:51', 'out', '2025-07-08 12:58:38'),
(106, 'Mr.Ramesh', '01', 1782995908, 'GTGS', 'Shafiul Islam', 'QA', 'Inspection', '2025-07-09 03:06:41', 'out', '2025-07-09 12:09:31'),
(107, 'Mr. Azad', '02', 0, 'ANKO', 'Monir', 'Q.A', 'Inspection', '2025-07-09 03:30:22', 'Out', '2025-07-09 05:43:04'),
(108, 'Mr. Sumon', '03', 1687972940, 'ZXY', 'Khairul', 'Q.A', 'Inspection', '2025-07-09 03:46:33', 'out', '2025-07-09 12:09:18'),
(109, 'Mr.Mitho Sorker', '4', 1886861676, 'B-Tex', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-09 04:04:14', 'out', '2025-07-09 12:19:36'),
(110, 'Mr.Sumon', '5', 1812158118, 'IMB', 'Mr.Indika', 'Work Study', 'Meeting', '2025-07-09 04:34:35', 'out', '2025-07-09 05:56:39'),
(111, 'Mr.Kamrul', '6', 1672911666, 'IMB', 'Mr.Indika', 'Work Study', 'Meeting', '2025-07-09 04:36:42', 'Out', '2025-07-09 05:56:46'),
(112, 'Mr.Rashedul', '7', 1713110827, 'Brother', 'Mr.Indika', 'Work Study', 'Meeting', '2025-07-09 04:46:34', 'Out', '2025-07-09 05:56:58'),
(113, 'Mr.Ashraf', '8', 1713110827, 'Brother', 'Mr.Indika', 'Work Study', 'Meeting', '2025-07-09 04:47:23', NULL, NULL),
(114, 'Ms.Sadia', '9', 1819339797, 'Gingham', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-09 04:59:58', 'Out', '2025-07-09 08:37:46'),
(115, 'Mr.Shirajul Islam', '10', 1600114520, 'GTGS', 'Shafiul Islam', 'QA', 'Inspection', '2025-07-09 06:56:08', 'out', '2025-07-09 12:09:00'),
(116, 'Mr.Mahbub', '11', 1847066259, 'LCW', 'Manik', 'QA', 'Inspection', '2025-07-09 07:24:32', 'out', '2025-07-09 12:43:47'),
(117, 'Mr.Atik', '1', 1675644748, 'ANKO', 'Mr.Monir', 'QA', 'Visit', '2025-07-10 03:35:30', 'out', '2025-07-10 08:20:10'),
(118, 'Mr.Sumon', '2', 1687972940, 'ZXY', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-10 03:47:25', 'out', '2025-07-10 12:08:40'),
(119, 'Mr.Polash', '3', 1915621268, 'GTGS', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-10 03:52:18', 'out', '2025-07-10 12:08:15'),
(120, 'Mr.Aulad', '1', 0, 'QIMA', 'Mr.Ashim Kumar', 'Complience', 'Audit', '2025-07-10 04:01:03', NULL, NULL),
(121, 'Mr.Mostafizur', '4', 0, 'ZXY', 'Mr.Khairul', 'QA', 'Inspection', '2025-07-10 04:01:57', 'out', '2025-07-10 12:08:52'),
(122, 'Mr. Mitho Sarker', '05', 1886861676, 'B-Tex', 'Shaiful', 'QA', 'Inspection', '2025-07-10 04:09:45', 'out', '2025-07-10 12:09:08'),
(123, 'Mr.Mahbub', '06', 1847066259, 'LCW', 'Manik', 'QA', 'Inspection', '2025-07-10 07:22:57', 'out', '2025-07-10 12:53:07'),
(124, 'Mr.Jahangir/Selim', '08', 1708833131, 'ZXY', 'Oshim', 'Complance', 'Inspection', '2025-07-10 07:34:57', NULL, NULL),
(125, 'Mr.Shirajul', '09', 1600114520, 'GTGS', 'Shafiul', 'QA', 'Inspection', '2025-07-10 07:39:06', 'out', '2025-07-10 12:09:24'),
(126, 'Mr.Azad', '9', 0, 'Anko', 'Mr.Monir', 'QA', 'Inspection', '2025-07-10 08:50:55', 'Out', '2025-07-10 15:57:46'),
(127, '01.Mr.Sadman 02.Mr.Babul 03.Rafique', '10+11+12', 1676637717, 'Kmart', 'Mr.Manoj', 'QA', 'Inspection', '2025-07-10 12:07:06', 'out', '2025-07-10 12:36:12'),
(128, 'Mr.Sumon', '1', 1687972940, 'ZXY', 'Mr.Khalek', 'QA', 'Inspection', '2025-07-12 03:09:58', 'out', '2025-07-12 12:08:35'),
(129, 'Mr.Ramesh', '1', 1782995908, 'GTGS', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-13 03:21:44', NULL, NULL),
(130, 'Mr.Mitho Sarker', '2', 1886861676, 'B-Tex', 'Mr.Shafiul', 'QA', 'Inspection', '2025-07-13 03:25:14', NULL, NULL),
(131, 'Mr.Azad', '03', 0, 'KAMART', 'Monir', 'QA', 'INspection', '2025-07-13 04:00:46', NULL, NULL),
(132, 'Mr.Polash', '04', 1915621268, 'GTGS', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-13 04:05:13', NULL, NULL),
(133, 'Mr.Shamim', '05', 1772154611, 'Banjootex', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-13 04:15:31', NULL, NULL),
(134, 'Mr.Sazzad', '06', 1860530309, 'G3', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-13 04:17:07', NULL, NULL),
(135, 'Mr.Mahabub', '7', 1847066259, 'LCW', 'Mr.Harun', 'QA', 'Inspection', '2025-07-13 07:25:37', NULL, NULL),
(136, 'Mr.Sumon', '08', 1687972940, 'ZXY', 'Mr.Shafiul Islam', 'QA', 'Inspection', '2025-07-13 08:54:55', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvisitorpwpl`
--

CREATE TABLE `tblvisitorpwpl` (
  `ID` int(5) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `Deptartment` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvisitorpwpl`
--

INSERT INTO `tblvisitorpwpl` (`ID`, `FullName`, `Email`, `MobileNumber`, `Address`, `WhomtoMeet`, `Deptartment`, `ReasontoMeet`, `EnterDate`, `remark`, `outtime`) VALUES
(23, 'Mr. Mehedi', '05', 1676146669, 'Peak Office', 'Mr. Shamim', 'QC', 'Visit', '2025-06-26 05:38:03', 'out', '2025-06-29 06:40:46'),
(24, 'Mr. Shirajul', '06', 1600114520, 'GTGS Office', 'Imran ( G M) Sample', 'QC', 'Visit', '2025-06-26 06:51:27', 'out', '2025-06-29 06:41:31'),
(25, '(1) Mst. Seda  (2) Mr.  Neas  (3) Mr. Mostahid', '7-8-9', 1755536021, 'Peak Office', 'Mr. Shamim', 'QC', 'Visit', '2025-06-26 12:03:49', '06:30 Pm', '2025-06-26 12:35:04'),
(26, 'Mr. Mehedi', '01', 1676146669, 'Peak Office', 'Mr. Shamim ( Sample)', 'QC', 'Visit', '2025-06-27 05:14:09', '03:15PM', '2025-06-27 13:55:08'),
(27, 'Mr. Rasel', '02', 0, 'Natural', 'Mr. Imran', 'N/A', 'Sample Reviewing Purpose', '2025-06-28 04:44:38', 'No Issues were found.', '2025-06-28 06:35:53'),
(28, 'Mr. Mehedi', '03', 1676146669, 'Peak', 'Mr. Shamim', 'QC', 'Visit', '2025-06-28 04:46:00', 'Every thing is ok', '2025-06-28 13:37:17'),
(29, 'Mr. Mustahid & Ms. Seda', '02', 1755536021, 'Peak', 'Mr. Shamim', 'R&D', 'Visit', '2025-06-28 08:48:04', '	No Issues were found.', '2025-06-28 10:40:44'),
(31, 'Mr. Mehedi', '01', 1676146669, 'Peak  Office', 'Mr. Shamim', 'Sample', 'Visit', '2025-06-29 04:08:41', 'No Issues were found.', '2025-06-29 06:13:56'),
(32, 'Mr. Khademul   Mr. Arif     Mr. Faisal', '02,03,04', 1755563421, 'BVCPS ', 'Mr. Rayhan', 'Compliance', 'Audit', '2025-06-29 04:19:27', 'Out', '2025-06-29 13:13:43'),
(33, 'Tonmay', '05', 1766492369, 'Soko Office', 'Mr. Imran AGM', 'R & D', 'Visit', '2025-06-29 05:24:22', 'No Issues were found.', '2025-06-29 05:31:11'),
(34, 'Mr. Salek', '06', 1842077931, 'Vogue Sourching', 'Mr. Masud GM', 'Wash', 'Visit', '2025-06-29 05:28:34', 'Out', '2025-06-29 12:36:40'),
(35, 'Mr. Mustahid & Ms. Seda	', '7,8', 1755536021, 'Peak Office', 'Mr. Shamim', 'Sample', 'Visit', '2025-06-29 06:07:18', 'out', '2025-06-29 07:45:29'),
(36, 'Mr. Mehedi', '09', 1676146669, 'Peak Office', 'Mr', 'Wash', 'Mr. Shamim', '2025-06-29 06:12:30', 'out', '2025-06-29 11:46:43'),
(37, 'Mr. Mannaf', '09', 1816185292, 'Denim Solution', 'Mr. Masud  GM', 'Wash', 'Visit', '2025-06-29 06:54:43', 'out', '2025-06-29 08:34:46'),
(38, 'Mr. Reddoy', '10', 1754624860, 'Vogue', 'Mr. Imran Hossain', 'R&D', 'Visit', '2025-06-29 09:55:16', 'out', '2025-06-29 12:41:23'),
(39, 'Shirajul', '11', 1600114520, 'GTGS', 'Imran', 'Wash', 'Visit', '2025-06-29 10:14:34', 'Out', '2025-06-29 11:04:14'),
(40, 'Polash', '12', 1600114520, 'GTGS', 'Imran', 'Sample', 'Visit', '2025-06-29 10:16:42', 'Out', '2025-06-29 11:03:17'),
(41, 'Mr. Babul', '14', 1949412311, 'Tongi', 'Mr. Polash ', 'T & T', 'Personal', '2025-06-29 11:08:46', '05:30pm', '2025-06-29 11:33:56'),
(42, 'Mr.  Hafizur & Anik ', '1,2', 1716577093, 'Shira gong', 'Mr. Shamim', 'Admin', 'Personal', '2025-07-01 04:49:24', 'Out', '2025-07-01 05:20:21'),
(43, 'Mr. Salek', '03', 1842077931, 'Vogue  Scorching office', 'Mr. Masud  ( G M )', 'Wash', 'Visit', '2025-07-01 04:51:54', 'Out', '2025-07-01 05:44:53'),
(44, ' mr. Nurislam', '04', 1787679135, ' Denim Solution', 'Mr. Masud ( GM )', 'Wash', 'Visit', '2025-07-01 04:53:56', 'Out', '2025-07-01 06:18:28'),
(45, 'Mr. Mahbub ', '05', 1787679135, 'Denim Solution', 'Mr. Masud ( GM )', 'Wash', 'Visit', '2025-07-01 04:56:01', 'Out', '2025-07-01 06:18:09'),
(46, 'Mr. Meihedi', '06', 1676146669, 'Peak Office', 'Mr. Shamim', 'R & E', 'Visit', '2025-07-01 05:32:22', 'Out', '2025-07-01 14:41:05'),
(47, 'Mr. Shirajul', '07', 1600114520, 'GTGS', 'Mr. Shsmim', 'Wash', 'Visit ', '2025-07-01 06:25:17', 'Out', '2025-07-01 16:01:19'),
(48, 'Mr. Mahbub  &  Nur Islam		', '9,10', 178767913, 'DSL', 'Mr.Masud GM', 'Wash', 'Visit', '2025-07-01 06:46:46', 'Out', '2025-07-01 12:33:11'),
(49, 'Mr. Al-Amin', '11', 1713856783, 'DYSIN', 'Mr. Polash', 'T&T', 'Visit', '2025-07-01 10:14:24', 'Out', '2025-07-01 12:32:33'),
(50, 'Mr.Shohag', '12', 1730790707, 'Denim', 'Mr.Masud ', 'Wash', 'Visit', '2025-07-01 11:08:42', 'Out', '2025-07-01 13:07:38'),
(51, 'Mr. Mustahid & Ms. Seda		', '13,14', 1755536021, 'Peak', 'Mr.Shamim', 'Sample', 'Visit', '2025-07-01 13:22:41', 'Out', '2025-07-01 14:29:39'),
(52, 'Mr. Reddoy', '01', 1754624860, 'Vogue', 'Mr. Imran', 'R&D', 'Visit', '2025-07-02 02:21:40', 'Out', '2025-07-02 03:52:19'),
(53, 'Mr. Mahbub', '02', 1730790712, 'DSL', 'Mr. Shakil', 'Wash', 'Trail', '2025-07-02 04:30:31', 'Out', '2025-07-03 04:42:48'),
(54, 'Mr. Walid', '03', 1787451878, 'DSL', 'Mr. Shakil', 'Wash', 'Trail', '2025-07-02 04:31:11', 'Out', '2025-07-03 04:42:35'),
(55, 'Mr. Salek', '04', 1892071931, 'Vogue', 'Mr. Masud', 'Wash', 'Visit', '2025-07-02 04:56:08', 'Out', '2025-07-02 12:10:09'),
(56, 'Mr. Syedul', '05', 1324242963, 'Nice Denim', 'Mr. Shamim', 'Wash', 'Trail', '2025-07-02 05:27:30', 'Out', '2025-07-03 04:42:19'),
(57, 'Mr. Limon ', '06', 1403508583, 'BJTEX', 'Mr. Shakil ', 'Wash', 'Visit', '2025-07-02 06:33:05', 'Out', '2025-07-03 04:41:57'),
(58, 'Mr.Mehedi', '07', 1676146669, 'Peak', 'Mr.Shamim', 'Wash', 'Visit', '2025-07-02 06:53:23', 'Out ', '2025-07-03 04:41:30'),
(59, 'Mr. Rashed', '08', 0, 'ZXY', 'Mr. Pranto (AGM)', 'Wash', 'Visit', '2025-07-02 07:11:42', 'Out', '2025-07-02 11:39:29'),
(60, 'Mr. Anichul', '09', 1714143473, 'InterTech BD', 'Mr. Arif Rayhan', 'Complance', 'Visit', '2025-07-02 07:35:32', '01:30pm', '2025-07-02 08:08:08'),
(61, 'Mr. Mostahid & Seda', '10', 1755536021, 'Peak Office', 'Mr. Shamim', 'Wash', 'Visit', '2025-07-02 11:37:51', 'Out', '2025-07-03 04:37:22'),
(62, 'Mr. Bulbul', '01', 1949412311, 'Dobadia', 'Mr. Polash', 'T & T', 'Visit', '2025-07-03 04:36:29', 'Out', '2025-07-03 04:37:09'),
(63, 'Mr. Bulbul			03-07-2025	10:36:29', '01', 1949412311, 'Dobadia', 'Mr.Polash', 'T & T', 'Visit', '2025-07-03 04:39:42', 'Out', '2025-07-03 07:20:33'),
(64, 'Mr. Shohag.Mannam.Mahbub,Nure alam,Shahin', '02,03,04,05,06', 1730790707, 'DSL', 'Mr. GM Sir', 'Wash', 'Visit', '2025-07-03 05:47:00', 'Out', '2025-07-03 11:34:50'),
(65, 'Mr.Mehedi', '08', 1676146669, 'DSL', 'Mr. Masud (GM)', 'Wash', 'Visit', '2025-07-03 07:17:14', 'out', '2025-07-03 15:41:22'),
(66, 'Mr. Nurislam', '09', 0, 'DSL', 'Mr. Masud (GM)', 'Wash', 'Visit', '2025-07-03 07:19:52', 'Out', '2025-07-03 11:33:55'),
(67, 'Mr. Sukhon', '09', 1411784201, 'Bitex', 'Mr. Masud (GM)', 'Wash', 'Visit', '2025-07-03 11:33:17', 'Out', '2025-07-03 12:49:08'),
(68, 'Mr. Mostahid & Seda', '13', 1755536021, 'Peak', 'Mr, Shamim', 'R&D', 'Visit', '2025-07-03 13:09:40', 'out', '2025-07-03 14:22:28'),
(69, 'Mr. Salek', '01', 1892077931, 'Vogue', 'Mr. Masud (GM)', 'Wash', 'Visit', '2025-07-05 02:36:24', 'Out', '2025-07-05 04:15:32'),
(70, 'Mr. Limon', '02', 1403508583, 'BJTEX', 'Mr. Shakil', 'Wash', 'Visit', '2025-07-05 03:18:22', 'Out', '2025-07-05 09:44:08'),
(71, 'Mr. Mehedi', '3', 1676146669, 'Peak', 'Mr.shmim', 'R&d', 'visit', '2025-07-05 05:21:33', 'Out', '2025-07-05 06:57:16'),
(72, 'Mr. Khadimul And Samuil', '04/05', 1320999003, 'Tringle', 'Mr. Sontusta', 'Utility', 'Visit', '2025-07-05 09:54:51', NULL, NULL),
(73, 'Mr. Mostahid & Seda', '06', 175553604, 'Peak', 'Mr. Shamim', 'Wash', 'Visit', '2025-07-05 10:42:17', 'out', '2025-07-05 11:51:59'),
(74, 'Mr Limon', '01', 1403508583, 'BJTEX, ', 'Mr Shakil', 'wash', 'Visit', '2025-07-06 03:30:51', 'out', '2025-07-06 09:45:54'),
(75, 'Mr.Mehedi', '02', 1676146669, 'Peak', 'shamim', 'R&d', 'visit', '2025-07-06 04:38:42', 'out', '2025-07-06 12:10:04'),
(76, 'Mr. Mustahid & Seda', '03/04', 1755536021, 'Peak', 'Mr.Shamim', 'Wash', 'Visite', '2025-07-06 10:39:01', 'Out', '2025-07-06 11:48:58'),
(77, 'Mr Salek', '05', 1842077931, 'Vogue', 'Mr. Masud', 'Wash', 'Visite', '2025-07-06 11:03:18', 'out', '2025-07-06 12:09:34'),
(78, 'Mr Sukhan ', '01', 1711789201, 'Bitex', 'GM -Masud', 'Wash', 'Visit', '2025-07-07 03:49:10', 'out', '2025-07-07 12:09:21'),
(79, 'Mr.Mehedi', '02', 1676146669, 'Peak', 'Mr.Shamim', 'Wash', 'Visite', '2025-07-07 05:25:20', 'out', '2025-07-07 12:17:47'),
(80, 'Benny/Zhu', '03/04', 1711789201, 'Bitex', 'Mr.Imran', 'Wash', 'Visite', '2025-07-07 05:44:57', 'Out', '2025-07-07 11:19:20'),
(81, 'Mr Borhan and  Resad  Najrul', '6 ', 1717226406, 'Master control', 'Sontosta', 'Mantince', 'visit', '2025-07-07 09:43:06', 'Out', '2025-07-07 09:50:04'),
(82, 'Mr. Mustahid / Seda', '09/10', 1755536021, 'Peak', 'Mr. Shamim', 'Wash', 'Visit', '2025-07-07 10:05:38', 'Out', '2025-07-07 10:58:58'),
(83, 'Mr. Nurunnabi', '11', 1844222173, 'Pionear Denim', 'Mr. Imran', 'R&D', 'Visit', '2025-07-07 10:17:47', 'out', '2025-07-07 12:08:58'),
(84, 'Mr. Monjurul', '12', 1911986992, 'Pionear Denim', 'Mr. Imran', 'R&D', 'Visit', '2025-07-07 10:19:25', 'out', '2025-07-07 12:08:47'),
(85, 'Mr Tarak and Mr Asad', '13/14', 1305685648, 'confidenc', 'Mr masud Sir', 'wash', 'Visit', '2025-07-08 05:32:33', NULL, NULL),
(86, 'Mr Marf', '01', 1712465558, 'Offisina', 'Mr Masud sir', 'Wash', 'Visit', '2025-07-08 08:54:35', NULL, NULL),
(87, 'Mr. Mustahid & Seda', '4/5', 1755536021, 'Peak', 'Mr. Imran', 'Wash', 'Visit', '2025-07-08 09:35:19', 'out', '2025-07-08 10:56:55'),
(88, 'Mr. Parvez', '04', 1681054698, 'Vogue', 'Mr. Rajib', 'Wash', 'Meeting', '2025-07-08 11:06:48', 'Out', '2025-07-08 11:48:49'),
(89, 'Mr. Sukan', '05', 1911789201, 'BTEX', 'Mr. Imran', 'R&D', 'Visit', '2025-07-08 11:09:10', 'Out', '2025-07-08 11:48:32'),
(90, 'Mr. Shirajul', '01', 1600114520, 'GTGS', 'Mr. Masud', 'Wash', 'Visit', '2025-07-09 05:57:56', 'out', '2025-07-09 06:24:17'),
(91, 'Morsalin', '02', 1792008890, 'Officna Bd Ltd', 'GM Masud ', 'Production ', 'Visit', '2025-07-09 06:16:09', 'Out', '2025-07-09 08:17:53'),
(92, 'Seda', '03', 1755536021, 'Peak', 'Mr.Shamim', 'Wash', 'Visit', '2025-07-09 08:49:48', 'out', '2025-07-09 09:10:10'),
(93, 'Mr.Milon', '04', 1914068866, 'CUECHEM', 'Mr.Polash', 'T&T', 'Visit', '2025-07-09 10:20:31', 'out', '2025-07-09 13:22:06'),
(94, 'Mr. Reddoy', '01', 1754624860, 'Vogue', 'Mr.Imran', 'Wash', 'Visit', '2025-07-10 03:45:09', 'out', '2025-07-10 12:38:39'),
(95, 'Mr. Salek', '02', 1892077931, 'Vogue', 'Mr. Masud', 'Wash', 'Visit', '2025-07-10 03:46:21', 'out', '2025-07-10 06:41:25'),
(96, 'Mr. Mahbub', '03', 1730890712, 'DSL', 'Mr. Masud Sir', 'Wash', 'Trail', '2025-07-10 06:30:30', 'out', '2025-07-10 13:10:17'),
(97, 'Mr.Juwel', '04', 1841610187, 'DSL', 'Mr. Masud Sir', 'Wash', 'Trial', '2025-07-10 06:32:10', 'out', '2025-07-10 13:10:07'),
(98, 'Mr. Saiful Islam', '5', 1714685343, 'Narayanganj', 'Mr. Polash', 'T&T', 'Visite', '2025-07-10 09:50:49', 'out', '2025-07-10 11:49:10'),
(99, 'Mr. Atikur', '6', 1794974504, 'Narayanganj', 'Mr. Polash', 'T&T', 'Visite', '2025-07-10 09:51:44', 'out', '2025-07-10 11:49:02'),
(100, 'Mr Sirajul', '7', 1600114520, 'GTGS', 'Mr Masud Sir', 'Wash', 'Visite', '2025-07-10 09:55:15', NULL, NULL),
(101, 'Seda', '8', 1755536021, 'Peak', 'Mr. Shamim', 'Wash', 'Visite', '2025-07-10 10:27:09', 'out', '2025-07-10 11:11:10'),
(102, 'Mr. Farhan', '05', 1714414361, 'ITS', 'Mr. Kamruzzaman', 'Lab', 'Official Work', '2025-07-13 09:14:56', 'out', '2025-07-13 09:23:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisitorabm`
--
ALTER TABLE `tblvisitorabm`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisitoragl`
--
ALTER TABLE `tblvisitoragl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisitorajl`
--
ALTER TABLE `tblvisitorajl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblvisitorpwpl`
--
ALTER TABLE `tblvisitorpwpl`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tblvisitor`
--
ALTER TABLE `tblvisitor`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=436;

--
-- AUTO_INCREMENT for table `tblvisitorabm`
--
ALTER TABLE `tblvisitorabm`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblvisitoragl`
--
ALTER TABLE `tblvisitoragl`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `tblvisitorajl`
--
ALTER TABLE `tblvisitorajl`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `tblvisitorpwpl`
--
ALTER TABLE `tblvisitorpwpl`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
