/*
SQLyog Ultimate v8.32 
MySQL - 5.5.27 : Database - hotel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hotel`;

/*Table structure for table `dinnertable` */

DROP TABLE IF EXISTS `dinnertable`;

CREATE TABLE `dinnertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(20) DEFAULT NULL,
  `tableStatus` int(11) DEFAULT '0',
  `orderDate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `dinnertable` */

insert  into `dinnertable`(`id`,`tableName`,`tableStatus`,`orderDate`) values (4,'悦蝶轩',0,NULL),(5,'伊芙轩',0,NULL),(6,'飞雪轩',0,NULL),(7,'映月轩',1,'2019/05/05 21:00:31'),(8,'大厅01',1,'2019/05/05 16:53:36'),(9,'大厅02',1,'2019/05/05 16:54:09'),(11,'大厅03',1,'2019/03/11 23:07:46'),(12,'大厅04',1,'2019/03/11 20:43:31'),(13,'大厅99',1,'2019/04/13 22:24:46');

/*Table structure for table `food` */

DROP TABLE IF EXISTS `food`;

CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foodName` varchar(20) DEFAULT NULL,
  `foodType_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `mprice` double DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_food_foodType_id` (`foodType_id`),
  CONSTRAINT `fk_food_foodType_id` FOREIGN KEY (`foodType_id`) REFERENCES `foodtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `food` */

insert  into `food`(`id`,`foodName`,`foodType_id`,`price`,`mprice`,`remark`,`img`) values (3,'毛血旺',3,35,30,'毛血旺--简介','imgs/1550841391.jpg'),(5,'白切鸡',4,60,58,'白切鸡-鸡中战斗鸡','imgs/1550838639.jpg'),(17,'白灼虾',4,35,30,'','imgs/1550817309.jpg'),(18,'猪肉荷兰豆',4,15,13,'','imgs/1550841265.jpg'),(19,'黄埔炒蛋',3,68,65,'','imgs/1550838703.jpg'),(20,'香锅肉丸',4,23,20,'','imgs/1550838763.jpg'),(21,'火腿白菜',3,23,20,'','imgs/1550841229.jpg'),(22,'烧鹅',4,68,65,'','imgs/1550838841.jpg'),(23,'锅头肉',3,35,33,'','imgs/1550838887.jpg'),(24,'河南烩面',55,15,13,'河南烩面--中原人的美味','imgs/1550945527.jpg'),(26,'四喜丸子',4,25,20,'','imgs/1550974473.jpg'),(27,'米饭',55,4,3,'香喷喷的米饭','imgs/rice.jpg'),(28,'牛肉面',55,18,16,'牛肉面','imgs/noddle.jpg'),(29,'可乐',66,5,4,'可乐','imgs/cole.jpg'),(30,'雪碧',66,5,4,'雪碧','imgs/xuebi.jpg'),(31,'矿泉水',66,3,1,'矿泉水','imgs/water.jpg'),(32,'鸡汤',5,32,30,'鸡汤','imgs/ji.jpg'),(33,'排骨汤',5,40,35,'排骨汤','imgs/paigu.jpg');

/*Table structure for table `foodtype` */

DROP TABLE IF EXISTS `foodtype`;

CREATE TABLE `foodtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `foodtype` */

insert  into `foodtype`(`id`,`typeName`) values (3,'招牌'),(4,'热菜'),(5,'汤'),(55,'主食'),(66,'饮料'),(67,'甜点');

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` char(20) DEFAULT NULL,
  `food_id` int(11) DEFAULT NULL,
  `foodCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderDetail_food_id` (`food_id`),
  KEY `orderdetail_orderId` (`orderId`),
  CONSTRAINT `orderDetail_food_id` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  CONSTRAINT `orderdetail_orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`id`,`orderId`,`food_id`,`foodCount`) values (1,'65ea558ffab04838',18,1),(2,'65ea558ffab04838',23,1),(3,'65ea558ffab04838',21,5),(4,'2910871c641f46c2',23,5),(5,'2910871c641f46c2',18,3),(6,'2910871c641f46c2',21,1),(7,'8560059016e64517',24,4),(8,'f1a7d1692b0f4d98',19,1),(9,'f1a7d1692b0f4d98',21,3),(10,'28e333dc238243a6',21,1),(11,'e00d45172bc2440d',18,1),(12,'e00d45172bc2440d',33,1),(13,'39baf014d4cd422e',29,1),(14,'39baf014d4cd422e',5,1),(15,'13b3d5ba74da430c',29,1),(16,'13b3d5ba74da430c',24,1),(17,'6363ec3fa52c479b',3,1),(18,'6363ec3fa52c479b',32,1),(19,'0a2d4604d0204112',3,1),(20,'0a2d4604d0204112',24,1),(21,'ee751fdf70c84235',3,1),(22,'ee751fdf70c84235',17,1),(23,'ee751fdf70c84235',27,1),(24,'c9e30b253b274de9',3,1),(25,'c9e30b253b274de9',23,1),(26,'71e243febd5247ce',3,1),(27,'abe6938357cf4be4',3,1),(28,'47dc89c55ad342da',3,1),(29,'0178e12591964df7',32,1),(30,'0178e12591964df7',23,1),(31,'8561fe2dc36648bf',3,1),(32,'75b5f0d7195a456e',3,1),(33,'4266203dec534822',23,1),(34,'4266203dec534822',17,1),(35,'95716737c5b1406d',3,1),(36,'95716737c5b1406d',21,1),(37,'95716737c5b1406d',32,1),(38,'5df4de0112454123',17,1),(39,'06952a84e3284e0f',18,1),(40,'c5737d8eaee14f71',3,1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` char(20) NOT NULL,
  `table_id` int(11) DEFAULT NULL,
  `orderDate` char(50) DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `orderStatus` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_table_id` (`table_id`),
  CONSTRAINT `order_table_id` FOREIGN KEY (`table_id`) REFERENCES `dinnertable` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`table_id`,`orderDate`,`totalPrice`,`orderStatus`) values ('0178e12591964df7',4,'2019/04/08 01:51:38',67,1),('06952a84e3284e0f',9,'2019/05/05 16:54:09',15,1),('0a2d4604d0204112',4,'2019/03/12 00:56:18',50,1),('13b3d5ba74da430c',11,'2019/03/11 23:07:46',20,1),('28e333dc238243a6',6,'2019/03/06 11:43:02',23,1),('2910871c641f46c2',5,'2019/02/24 01:03:31',243,1),('39baf014d4cd422e',12,'2019/03/11 20:43:31',65,1),('4266203dec534822',6,'2019/04/09 00:50:15',70,1),('47dc89c55ad342da',4,'2019/04/08 01:50:42',35,1),('5df4de0112454123',8,'2019/05/05 16:53:36',35,1),('6363ec3fa52c479b',4,'2019/03/11 23:10:37',67,1),('65ea558ffab04838',4,'2019/02/23 23:59:28',165,1),('71e243febd5247ce',13,'2019/04/08 01:34:44',35,1),('75b5f0d7195a456e',5,'2019/04/08 23:32:45',35,1),('8560059016e64517',9,'2019/02/24 02:12:58',60,1),('8561fe2dc36648bf',5,'2019/04/08 23:32:44',35,1),('95716737c5b1406d',13,'2019/04/13 22:24:46',90,1),('abe6938357cf4be4',13,'2019/04/08 01:37:05',35,1),('c5737d8eaee14f71',7,'2019/05/05 21:00:31',35,1),('c9e30b253b274de9',4,'2019/04/08 01:31:15',70,1),('e00d45172bc2440d',5,'2019/03/10 18:09:50',55,1),('ee751fdf70c84235',5,'2019/04/07 21:42:28',74,1),('f1a7d1692b0f4d98',6,'2019/02/24 10:18:31',137,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
