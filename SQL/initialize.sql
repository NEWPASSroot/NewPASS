-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 服務器版本:                        5.7.8-rc-log - MySQL Community Server (GPL)
-- 服務器操作系統:                      Win64
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 導出 pass 的資料庫結構
CREATE DATABASE IF NOT EXISTS `pass` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pass`;

-- 導出  表 pass.courses 結構
CREATE TABLE IF NOT EXISTS `courses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` varchar(6) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `instructor_id` varchar(20) NOT NULL,
  `TA_id` varchar(20) DEFAULT NULL,
  `introduction` varchar(256) DEFAULT NULL,
  `credits` int(11) NOT NULL,
  KEY `primarykey` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在導出表  pass.courses 的資料：~2 rows (大約)
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`ID`, `course_id`, `Name`, `instructor_id`, `TA_id`, `introduction`, `credits`) VALUES
	(2, 'SE1031', 'SE', 'SE Teacher', 'SE TA', 'We will learn the knowledge of SE.', 0),
	(5, 'Markey', 'Mark', 'Mark', NULL, 'Mark Ideal', 0);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- 導出  表 pass.homeworks 結構
CREATE TABLE IF NOT EXISTS `homeworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `deadline` varchar(20) NOT NULL DEFAULT '0',
  `information` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在導出表  pass.homeworks 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `homeworks` DISABLE KEYS */;
INSERT INTO `homeworks` (`id`, `name`, `deadline`, `information`) VALUES
	(1, 'Are you kidding me~', '2012/12/21', '������~'),
	(2, '屋', '2012', '我中二');
/*!40000 ALTER TABLE `homeworks` ENABLE KEYS */;

-- 導出  表 pass.user 結構
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '0',
  `password` varchar(256) NOT NULL DEFAULT '0',
  `role` varchar(256) NOT NULL DEFAULT '0',
  `email` varchar(256) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在導出表  pass.user 的資料：~2 rows (大約)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `user_id`, `name`, `password`, `role`, `email`) VALUES
	(1, '1', 'admin', '1', 'administrator', 'admin@gmail.com'),
	(2, '123', 'Happy123', '321', 'instructor', 'happy@mail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
