DROP DATABASE IF EXISTS skte;

CREATE DATABASE skte;
USE skte;

CREATE TABLE lists (
    id INTEGER AUTO_INCREMENT,
    value TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE `tb_get` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_have` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO skte.tb_get(id, question, answer_1, hint, description) VALUES(1, '메시지를 받다.', 'get a message', 'get 사용', NULL);

INSERT INTO skte.tb_have(id, question, answer_1, hint, description) VALUES(1, '꿈이 있다.', 'have a dream', 'have 사용', NULL);


