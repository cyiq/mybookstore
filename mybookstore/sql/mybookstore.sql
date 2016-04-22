/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - mybookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mybookstore` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mybookstore`;

/*Table structure for table `books` */

CREATE TABLE `books` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  `rebate` decimal(3,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `brief` text,
  `content` text,
  `onlinetime` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `books` */

insert  into `books`(`id`,`NAME`,`price`,`img`,`rebate`,`stock`,`brief`,`content`,`onlinetime`) values ('2e53d6fb42074775a8719b4c72924e13','立领九分纯色中长款风衣','144.00','2e53d6fb42074775a8719b4c72924e13nv.jpg','0.99',50,'风衣风衣','立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣立领九分纯色中长款风衣','2016-04-14');
insert  into `books`(`id`,`NAME`,`price`,`img`,`rebate`,`stock`,`brief`,`content`,`onlinetime`) values ('82393bfb494045e79607513365e03977','针织条纹连衣裙','159.00','82393bfb494045e79607513365e03977nv2.jpg','0.90',50,'针织条纹连衣裙','针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙针织条纹连衣裙','2016-04-14');
insert  into `books`(`id`,`NAME`,`price`,`img`,`rebate`,`stock`,`brief`,`content`,`onlinetime`) values ('f3896504f2d8425985a4af10ec0ecfe7','233','3.00','f3896504f2d8425985a4af10ec0ecfe7nz3.jpg','0.50',50,'555555555','66666666666666666666666666666666666666666666666666','2016-04-15 11:23:00');
insert  into `books`(`id`,`NAME`,`price`,`img`,`rebate`,`stock`,`brief`,`content`,`onlinetime`) values ('fb53089207f04753a508bf3230ed7a32','时尚撞色领短袖T恤','68.00','fb53089207f04753a508bf3230ed7a32nz.jpg','1.00',20,'3333','11','2016-04-14');

/*Table structure for table `booktype` */

CREATE TABLE `booktype` (
  `bookid` varchar(32) NOT NULL,
  `typeid` varchar(32) NOT NULL,
  PRIMARY KEY (`bookid`,`typeid`),
  KEY `btfk2` (`typeid`),
  CONSTRAINT `btfk1` FOREIGN KEY (`bookid`) REFERENCES `books` (`id`),
  CONSTRAINT `btfk2` FOREIGN KEY (`typeid`) REFERENCES `types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booktype` */

insert  into `booktype`(`bookid`,`typeid`) values ('2e53d6fb42074775a8719b4c72924e13','T001');
insert  into `booktype`(`bookid`,`typeid`) values ('82393bfb494045e79607513365e03977','T001');
insert  into `booktype`(`bookid`,`typeid`) values ('fb53089207f04753a508bf3230ed7a32','T001');
insert  into `booktype`(`bookid`,`typeid`) values ('f3896504f2d8425985a4af10ec0ecfe7','T002');

/*Table structure for table `collect` */

CREATE TABLE `collect` (
  `collectid` varchar(40) NOT NULL,
  `bookid` varchar(40) DEFAULT NULL,
  `userid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`collectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

insert  into `collect`(`collectid`,`bookid`,`userid`) values ('8f73945621474d3ab339c36e60693817','fb53089207f04753a508bf3230ed7a32','b5e477548ed04ebfb06384ec814f39ac');
insert  into `collect`(`collectid`,`bookid`,`userid`) values ('b679e93501a44390b72f1c4450c7555f','82393bfb494045e79607513365e03977','b5e477548ed04ebfb06384ec814f39ac');

/*Table structure for table `orderline` */

CREATE TABLE `orderline` (
  `id` varchar(32) NOT NULL,
  `bookid` varchar(32) DEFAULT NULL,
  `cont` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `orderid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `o1_fk1` (`bookid`),
  KEY `o1_fk2` (`orderid`),
  CONSTRAINT `o1_fk1` FOREIGN KEY (`bookid`) REFERENCES `books` (`id`),
  CONSTRAINT `o1_fk2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderline` */

insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('15d5427e2ca04d92b4b5cd7d6d687f59','fb53089207f04753a508bf3230ed7a32',1,'68.00','862945064');
insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('173a74ef790a4c70af59f288aa54b246','2e53d6fb42074775a8719b4c72924e13',1,'142.56','1625077687');
insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('47e34646887242c6979a61c5ef7203b0','82393bfb494045e79607513365e03977',1,'143.10','590404772');
insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('5dff81478d6c41468a43f95ab0d160cf','fb53089207f04753a508bf3230ed7a32',1,'68.00','30476073');
insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('d0025bcedc8b4b29b1f4e6e02eb40719','fb53089207f04753a508bf3230ed7a32',2,'68.00','396779139');
insert  into `orderline`(`id`,`bookid`,`cont`,`price`,`orderid`) values ('f676a85193064898a27685f4f22fb5ec','2e53d6fb42074775a8719b4c72924e13',1,'142.56','2010017441');

/*Table structure for table `orders` */

CREATE TABLE `orders` (
  `id` varchar(11) NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  `stat` char(1) DEFAULT NULL,
  `uid` varchar(32) DEFAULT NULL,
  `ctime` varchar(19) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_fk` (`uid`),
  CONSTRAINT `order_fk` FOREIGN KEY (`uid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('1625077687','142.56','0','b5e477548ed04ebfb06384ec814f39ac','2016-04-15 11:05:36');
insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('2010017441','142.56','0','34600b32ed58474983d7fe35e61950f9','2016-04-15 11:18:41');
insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('30476073','68.00','0','34600b32ed58474983d7fe35e61950f9','2016-04-15 11:11:44');
insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('396779139','136.00','0','b5e477548ed04ebfb06384ec814f39ac','2016-04-15 11:24:09');
insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('590404772','143.10','0','34600b32ed58474983d7fe35e61950f9','2016-04-15 11:18:23');
insert  into `orders`(`id`,`money`,`stat`,`uid`,`ctime`) values ('862945064','68.00','0','34600b32ed58474983d7fe35e61950f9','2016-04-15 11:09:31');

/*Table structure for table `types` */

CREATE TABLE `types` (
  `id` varchar(32) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `des` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `types` */

insert  into `types`(`id`,`NAME`,`des`) values ('T001','服装类','服装类');
insert  into `types`(`id`,`NAME`,`des`) values ('T002','电子类','电子类');
insert  into `types`(`id`,`NAME`,`des`) values ('T003','图书类','图书类');
insert  into `types`(`id`,`NAME`,`des`) values ('T004','aaa','aaa');

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` varchar(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `pwd` varchar(32) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`pwd`,`mail`) values ('34600b32ed58474983d7fe35e61950f9','12345','b5affe411dbda39f7f67d49bc42b81ae',NULL);
insert  into `users`(`id`,`name`,`pwd`,`mail`) values ('b5e477548ed04ebfb06384ec814f39ac','admin','70727e78c9a6f4f692d8995d99cf6e12','a@aa.x');
insert  into `users`(`id`,`name`,`pwd`,`mail`) values ('c1110c2fe727405f99ec56b950ad8c2e','222','aeb02557d89e87dc1ef535942b4a26cf',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
