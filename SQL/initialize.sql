-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        5.7.20-log - MySQL Community Server (GPL)
-- 伺服器操作系統:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 傾印 pass 的資料庫結構
CREATE DATABASE IF NOT EXISTS `pass` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pass`;

-- 傾印  表格 pass.homeworks 結構
DROP TABLE IF EXISTS `homeworks`;
CREATE TABLE IF NOT EXISTS `homeworks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `deadline` varchar(20) NOT NULL DEFAULT '0',
  `delay_deadline` bit(1) NOT NULL DEFAULT b'0',
  `information` text,
  `link` tinytext,
  `attach_file_name` varchar(50) DEFAULT NULL,
  `attach_file` mediumblob,
  `UT_file_name` varchar(50) DEFAULT NULL,
  `UT_file` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在傾印表格  pass.homeworks 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `homeworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `homeworks` ENABLE KEYS */;

-- 傾印  表格 pass.submit_homeworks 結構
DROP TABLE IF EXISTS `submit_homeworks`;
CREATE TABLE IF NOT EXISTS `submit_homeworks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_assignment_id` int(11) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `score` int(11) DEFAULT '0',
  `submit_datetime` varchar(20) NOT NULL,
  `homework_file_name` varchar(50) DEFAULT NULL,
  `homework_file` mediumblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在傾印表格  pass.submit_homeworks 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `submit_homeworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `submit_homeworks` ENABLE KEYS */;

-- 傾印  表格 pass.user 結構
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(256) NOT NULL DEFAULT '0',
  `password` varchar(256) NOT NULL DEFAULT '0',
  `role` varchar(256) NOT NULL DEFAULT '0',
  `email` varchar(256) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 正在傾印表格  pass.user 的資料：~0 rows (大約)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `user_id`, `name`, `password`, `role`, `email`) VALUES
	(1, '1', 'admin', '1', 'administrator', 'admin@gmail.com'),
	(2, '123', 'Happy123', '321', 'instructor', 'happy@mail.com'),
	(3, '0', '崔智賢', '0', 'student', 'student@gmail.com'),
	(4, '2', '旻孝援', '2', 'student', 'student2@gmail.com'),
	(5, '3', '崔茂宣', '0', 'student', 'student3@gmail.com'),
	(6, '4', '李怋稿', '4', 'student', 'student4@gmail.com'),
	(7, '5', '織田信長', '5', 'student', 'student5@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
