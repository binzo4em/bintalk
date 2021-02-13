DROP DATABASE IF EXISTS bintalk;

CREATE DATABASE bintalk;
USE bintalk;

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_take` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_do` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_make` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_go` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_be` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `tb_be-ing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO bintalk.tb_get(id, question, answer_1, hint, description) VALUES(1, '메시지를 받다.', 'get a message', 'get 사용', '나에게 생긴 모든 것을 말하기');

INSERT INTO bintalk.tb_have(id, question, answer_1, hint, description) VALUES(1, '꿈이 있다.', 'have a dream', 'have 사용', '내가 가진 모든 것을 말하기');

INSERT INTO bintalk.tb_take(id, question, answer_1, hint, description) VALUES(1, '비타민을 복용하다.', 'take vitamins', 'take 사용', '내가 지금 가지려고 하는 모든 것을 말하기');

INSERT INTO bintalk.tb_do(id, question, answer_1, hint, description) VALUES(1, '집안일을 하다.', 'do the housework', 'do 사용', '내가 매일 하는 것');

INSERT INTO bintalk.tb_make(id, question, answer_1, hint, description) VALUES(1, '예약하다(장소).', 'make a reservation', 'make 사용', '어쩌다 한 번 만들어내는 일을 말하기');

INSERT INTO bintalk.tb_go(id, question, answer_1, hint, description) VALUES(1, '휴가를 떠나다.', 'go on a vacation', 'go 사용', '돌아다니는 일을 말하기');

INSERT INTO bintalk.tb_be(id, question, answer_1, hint, description) VALUES(1, '다이어트 중이다.', 'be on a diet', 'be 사용', '가만히 있는 그 주어를 묘사하자');

INSERT INTO bintalk.tb_being(id, question, answer_1, hint, description) VALUES(1, '저는 지금 아침 먹는 중이에요.', 'I am having breakfast.', 'be-ing 사용', '현재 무엇을 하는 중이다.');


