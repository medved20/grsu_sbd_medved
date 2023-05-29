DROP DATABASE IF EXISTS `sql_coursework`;
CREATE DATABASE `sql_coursework`;
USE `sql_coursework`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `clients` (
`client_id` int(4) NOT NULL AUTO_INCREMENT,
`name` char(50),
`age` int (3),
`gender` char(15),
`passport` char(8),
PRIMARY KEY (`client_id`)
);
INSERT INTO `clients` VALUES (NULL,'Грузов Никита Витальевич',19,'Мужской','KH148564');
INSERT INTO `clients` VALUES (NULL,'Коваленко Евгений Федорович',32,'Мужской','KH846681');
INSERT INTO `clients` VALUES (NULL,'Мартынюк Жанна Владимировна',22,'Женский','KH465869');
INSERT INTO `clients` VALUES (NULL,'Хлебов Григорий Петров',26,'Мужской','KH135871');
INSERT INTO `clients` VALUES (NULL,'Голиков Алексей Евгениевич',20,'Мужской','KH985135');
INSERT INTO `clients` VALUES (NULL,'Буравчик Егор Никитыч',51,'Мужской','KH369815');
INSERT INTO `clients` VALUES (NULL,'Снегирь Елена Викторовна',33,'Женский','KH531656');
INSERT INTO `clients` VALUES (NULL,'Дубова Екатерина Андреевна',29,'Женский','KH284619');

CREATE TABLE `employees` (
`employee_id` int(4) NOT NULL AUTO_INCREMENT,
`name` char(50),
`position` char(20),
`age` int(3),
`gender` char(15),
`passport` char(8),
PRIMARY KEY (`employee_id`)
);
INSERT INTO `employees` VALUES (NULL,'Денисов Артём Михайлович','Менеджер',26,'Мужской','KH151520');
INSERT INTO `employees` VALUES (NULL,'Фомина Полина Владимировна','Консультант',20,'Женский','KH359051');
INSERT INTO `employees` VALUES (NULL,'Егорова Анна Никитична','Консультант',30,'Женский','KH516612');
INSERT INTO `employees` VALUES (NULL,'Никонов Артём Евгеньевич','Консультант',22,'Мужской','KH910331');
INSERT INTO `employees` VALUES (NULL,'Соколова Ярослава Тихоновна','Уборщик',32,'Женский','KH844518');

CREATE TABLE `transport` (
`transport_id` int(4) NOT NULL AUTO_INCREMENT,
`type` char(15),
`manufacturer` char(25),
`model` char(25),
`license_plate` char(16),
PRIMARY KEY (`transport_id`)
);
INSERT INTO `transport` VALUES (NULL,'Самолет','Boeing','787',NULL);
INSERT INTO `transport` VALUES (NULL,'Автобус','Volgabus','4541','RU-2486HT');

CREATE TABLE `routes` (
`route_id` int(4) NOT NULL AUTO_INCREMENT,
`tour_id` int(4) NOT NULL,
`transport_id` int(4) NOT NULL,
`date` char(40),
PRIMARY KEY (`route_id`),
KEY (`tour_id`),
KEY (`transport_id`)
);
INSERT INTO `routes` VALUES (NULL,0,1,'2023-05-29 06:00:00 PM');
INSERT INTO `routes` VALUES (NULL,0,1,'2023-06-05 06:00:00 AM');
INSERT INTO `routes` VALUES (NULL,1,0,'2023-07-15 12:00:00 PM');

CREATE TABLE `countries` (
`country_id` int(4) NOT NULL AUTO_INCREMENT,
`name` char(25),
`capital` char(25),
`population` int(20),
`language` char(25),
`currency` char(25),
`extra_info` char(250),
PRIMARY KEY (`country_id`)
);
INSERT INTO `countries` VALUES (NULL,'Россия','Москва',584646541,'Русский','Рубль',NULL);
INSERT INTO `countries` VALUES (NULL,'США','Вашшингтон',495188433,'Английский','Доллар США',NULL);
INSERT INTO `countries` VALUES (NULL,'Бразилия','Бразилиа',15816644,'Португальский','Бразильский Реал','7:1 kekw');

CREATE TABLE `locations` (
`location_id` int(4) NOT NULL AUTO_INCREMENT,
`country_id` int(4) NOT NULL,
`name` char(25),
`description` char(250),
PRIMARY KEY (`location_id`),
KEY `lct_count_id` (`country_id`)
);
INSERT INTO `locations` VALUES (NULL,0,'Ижевск','Крутой город');
INSERT INTO `locations` VALUES (NULL,0,'Тула',NULL);
INSERT INTO `locations` VALUES (NULL,1,'Сиаттл',NULL);
INSERT INTO `locations` VALUES (NULL,0,'Москва','Столица');
INSERT INTO `locations` VALUES (NULL,1,'Сан-Франциско',NULL);
INSERT INTO `locations` VALUES (NULL,2,'Бразалиа','Столица');

CREATE TABLE `hotels` (
`hotel_id` int(4) NOT NULL AUTO_INCREMENT,
`location_id` int(4) NOT NULL,
`name` char(25),
`service` int(1),
`rating` int(1),
`address` char(50),
PRIMARY KEY (`hotel_id`),
KEY `htl_loc_id` (`location_id`)
);
INSERT INTO `hotels` VALUES (NULL,0,'Trivago',5,5,'Somewhere City, Ayehope Ave.17');

CREATE TABLE `tours` (
`tour_id` int(4) NOT NULL AUTO_INCREMENT,
`location_id` int(4) NOT NULL,
`name` char(25),
`cost` int(10),
`length` int(3),
`description` char(250),
PRIMARY KEY (`tour_id`),
KEY `trs_loc_id` (`location_id`)
);
INSERT INTO `tours` VALUES (NULL,1,'Первый тур',1100,5,NULL);
INSERT INTO `tours` VALUES (NULL,4,'Второй тур',600,2,NULL);
INSERT INTO `tours` VALUES (NULL,2,'Третий тур',1100,4,NULL);
INSERT INTO `tours` VALUES (NULL,5,'Четвертый тур',2400,7,NULL);

CREATE TABLE `tickets` (
`ticket_id` int(4) NOT NULL AUTO_INCREMENT,
`client_id` int(4) NOT NULL,
`employee_id` int(4) NOT NULL,
`hotel_id` int(4),
`route_id` int(4) NOT NULL,
`adult_amount` int(2),
`child_amount` int(2),
`extra_info` char(100),
PRIMARY KEY (`ticket_id`),
KEY `tct_client_id` (`client_id`),
KEY `tct_emp_id` (`employee_id`),
KEY `tct_hotel_id` (`hotel_id`),
KEY `tct_route_id` (`route_id`)
);
INSERT INTO `tickets` VALUES (NULL,0,1,0,0,1,0,NULL);
INSERT INTO `tickets` VALUES (NULL,2,1,NULL,0,2,1,NULL);
INSERT INTO `tickets` VALUES (NULL,7,3,0,1,1,0,NULL);