CREATE DATABASE  IF NOT EXISTS `projectdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `projectdb`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
 `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
	`category_id` int NOT NULL DEFAULT -1,
    `category_name` varchar(50) NOT NULL DEFAULT 'UNSPECIFIED' UNIQUE,
    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
	`item_id` int NOT NULL DEFAULT -1,
    `item_name` varchar(50),
    `category_name` varchar(50) DEFAULT NULL,
    `minimum_price`int DEFAULT NULL,
    `current_bid` int DEFAULT NULL,
    `closing_date_time` datetime DEFAULT NULL,
    PRIMARY KEY (`item_id`),
    CONSTRAINT `fk_item_catgName`FOREIGN KEY (`category_name`) references `category` (`category_name`) ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

 DROP TABLE IF EXISTS `reserve`;
 CREATE TABLE `reserve` (
	`item_id` int NOT NULL DEFAULT -1,
    `reserve_value` int NOT NULL DEFAULT -1,
    PRIMARY KEY(`item_id`),
    CONSTRAINT `fk_itemID_reserve` FOREIGN KEY(`item_id`) references `item` (`item_id`) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `auto_bid`;
 CREATE TABLE `auto_bid` (
	`index` int NOT NULL AUTO_INCREMENT,
	`item_id` int NOT NULL DEFAULT -1,
    `username` varchar(50) NOT NULL DEFAULT '',
    `increments` int NOT NULL DEFAULT 1,
    `min_bid` int,
    `max_bid` int,
    KEY (`index`),
    PRIMARY KEY(`item_id`, `username`),
    FOREIGN KEY(`item_id`) references `item` (`item_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(`username`) references `user` (`username`) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `bids`;
CREATE TABLE `bids` (
	`item_id` int NOT NULL DEFAULT -1,
	`bid` int NOT NULL DEFAULT -1,
    `username` varchar(50) NOT NULL DEFAULT '',
    PRIMARY KEY (`item_id`,`bid`,`username`),
    FOREIGN KEY (`item_id`) references `item`(`item_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`username`) references `user`(`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `purchased`;
CREATE TABLE `purchased` (
	`item_id` int NOT NULL DEFAULT -1,
    `sale_price` int NOT NULL DEFAULT -1,
    `category_name` varchar(50),
    `purchased_by` varchar(50) NOT NULL DEFAULT '',
    PRIMARY KEY (`item_id`, `purchased_by`),
    FOREIGN KEY(`item_id`) references `item` (`item_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(`category_name`) references `category` (`category_name`) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY(`purchased_by`) references `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `sell_list`;
CREATE TABLE `sell_list` (
	`item_id` int NOT NULL DEFAULT -1,
    `seller` varchar(50) NOT NULL DEFAULT '',
    PRIMARY KEY (`item_id`, `seller`),
    FOREIGN KEY(`item_id`) references `item` (`item_id`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(`seller`) references `user` (`username`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
	`admin_id` varchar(50) NOT NULL DEFAULT 'admin',
    `password` varchar(50) NOT NULL DEFAULT 'admin',
    PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO admin VALUES ('admin', 'admin'); 

DROP TABLE IF EXISTS `customerRep`;
CREATE TABLE `customerRep` (
	`cr_username` varchar(50) NOT NULL DEFAULT '' UNIQUE,
    `cr_firstname` varchar(50) NOT NULL DEFAULT '',
    `cr_lastname` varchar(50) NOT NULL DEFAULT '',
    `cr_password` varchar(50) NOT NULL DEFAULT '',
    `employee_id` int NOT NULL DEFAULT -1,
    PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `customerRep` VALUES ('customerrep', 'customerrep', 'customerrep', 'customerrep', 123456);

DROP TABLE IF EXISTS `questions`; 
CREATE TABLE `questions`(
	`q_id` int NOT NULL UNIQUE,
    `username` varchar(50) NOT NULL DEFAULT '',
    `question` varchar(500) NOT NULL DEFAULT '',
    PRIMARY KEY(`q_id`),
    FOREIGN KEY(`username`) REFERENCES user(`username`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
    
DROP TABLE IF EXISTS `answers`; 
CREATE TABLE `answers`(
	`q_id` int NOT NULL,
    `answer` varchar(500) NOT NULL DEFAULT '',
    `answered_by` varchar(50) NOT NULL,
    PRIMARY KEY(`q_id`),
    FOREIGN KEY(`q_id`) REFERENCES questions(`q_id`),
    FOREIGN KEY(`answered_by`) REFERENCES customerRep(`cr_username`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


 
