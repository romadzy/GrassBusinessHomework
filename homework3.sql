-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.29 - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.0.0.5958
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица homework3.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `balance` int(10) unsigned DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`currency_id`),
  KEY `FK_accounts_currencies` (`currency_id`),
  CONSTRAINT `FK_accounts_currencies` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `FK_accounts_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.accounts: ~7 rows (приблизительно)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `user_id`, `balance`, `currency_id`) VALUES
	(1, 1, 1000, 1),
	(2, 1, 5000, 3),
	(3, 2, 8000, 3),
	(4, 2, 17000, 2),
	(5, 2, 500, 1),
	(6, 3, 780, 2),
	(7, 3, 7000, 3);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Дамп структуры для таблица homework3.amounts
CREATE TABLE IF NOT EXISTS `amounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cashbox_id` int(10) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cashbox_id` (`cashbox_id`,`value`),
  CONSTRAINT `FK__cashboxes` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.amounts: ~5 rows (приблизительно)
/*!40000 ALTER TABLE `amounts` DISABLE KEYS */;
INSERT INTO `amounts` (`id`, `cashbox_id`, `value`, `quantity`) VALUES
	(1, 1, 100, 50),
	(2, 1, 50, 100),
	(3, 4, 1000, 20),
	(4, 4, 500, 500),
	(5, 4, 100, 200);
/*!40000 ALTER TABLE `amounts` ENABLE KEYS */;

-- Дамп структуры для таблица homework3.cashboxes
CREATE TABLE IF NOT EXISTS `cashboxes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `currency_id` (`currency_id`),
  CONSTRAINT `FK__currencies` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.cashboxes: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `cashboxes` DISABLE KEYS */;
INSERT INTO `cashboxes` (`id`, `city`, `model`, `currency_id`) VALUES
	(1, 'Kyiv', 'AT150', 1),
	(3, 'Kyiv', 'AT150', 3),
	(4, 'Poltava', 'AT130', 2);
/*!40000 ALTER TABLE `cashboxes` ENABLE KEYS */;

-- Дамп структуры для таблица homework3.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.currencies: ~3 rows (приблизительно)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `sign`, `name`) VALUES
	(1, '$', 'USD'),
	(2, '₴', 'UAH'),
	(3, '€', 'EUR');
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Дамп структуры для таблица homework3.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `cashbox_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__accounts` (`account_id`),
  KEY `FK_logs_cashboxes` (`cashbox_id`),
  CONSTRAINT `FK__accounts` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FK_logs_cashboxes` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.logs: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `date`, `cashbox_id`, `account_id`, `amount`) VALUES
	(1, '2020-10-04 19:05:37', 1, 1, 100),
	(2, '2019-10-04 20:29:10', 4, 3, 54),
	(3, '2020-10-04 20:29:49', 3, 3, 87),
	(4, '2020-10-04 20:30:13', 1, 6, 100),
	(5, '2020-10-04 20:30:44', 3, 7, 78),
	(6, '2020-10-05 20:30:58', 4, 2, 96),
	(7, '2020-10-04 20:31:12', 3, 4, 127),
	(8, '2020-10-04 20:31:29', 4, 5, 74),
	(9, '2020-10-04 20:31:40', 3, 6, 458),
	(10, '2020-10-04 20:31:55', 1, 3, 368);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Дамп структуры для таблица homework3.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int(10) unsigned NOT NULL DEFAULT '18',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы homework3.users: ~2 rows (приблизительно)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `age`) VALUES
	(1, 'Jack', 32),
	(2, 'Matthew', 54),
	(3, 'Valeriy', 54);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
