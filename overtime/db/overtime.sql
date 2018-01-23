/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.56-log : Database - overtime
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`overtime` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `overtime`;

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`dept_id`,`dept_name`) values (1,'HR'),(2,'资讯管理课'),(3,'RESOURCE');

/*Table structure for table `tb_emp` */

DROP TABLE IF EXISTS `tb_emp`;

CREATE TABLE `tb_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(100) NOT NULL,
  `emp_time` decimal(10,2) DEFAULT NULL,
  `emp_date` date DEFAULT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `tb_emp` */

insert  into `tb_emp`(`emp_id`,`emp_name`,`emp_time`,`emp_date`,`d_id`) values (1,'305130','2.50','2017-12-01',2),(2,'305130','8.00','2017-12-03',2),(3,'305130','2.50','2017-12-04',2),(4,'305130','2.50','2017-12-06',2),(5,'305130','2.50','2017-12-07',2),(6,'305130','2.50','2017-12-08',2),(7,'305130','8.00','2017-12-09',2),(8,'305130','8.00','2017-12-10',2),(9,'305130','2.50','2017-12-11',2),(10,'305130','2.50','2017-12-12',2),(11,'305130','2.50','2017-12-13',2),(12,'305130','5.00','2017-12-14',2),(13,'305130','2.50','2017-12-15',2),(14,'305130','8.00','2017-12-16',2),(15,'305130','2.50','2017-12-18',2),(16,'305130','2.50','2017-12-20',2),(17,'305130','2.50','2017-12-22',2),(18,'305130','8.00','2017-12-24',2),(19,'305130','2.50','2017-12-25',2),(20,'305130','3.00','2017-12-26',2),(21,'305130','2.50','2017-12-28',1),(22,'305130','8.00','2017-12-30',2),(23,'305130','8.00','2017-12-31',2),(24,'305130','8.50','2018-01-01',2),(25,'305130','2.50','2018-01-02',2),(30,'305130','2.50','2018-01-03',2),(39,'305130','8.00','2018-01-07',2),(40,'305130','2.50','2018-01-08',2),(41,'305130','2.50','2018-01-09',2),(42,'305130','8.00','2018-01-13',2),(43,'305130','2.50','2018-01-15',2),(44,'305130','8.00','2018-01-14',2),(45,'305130','2.50','2018-01-17',2),(46,'305130','2.50','2018-01-19',2),(49,'305130','8.00','2018-01-21',2),(50,'305130','2.50','2018-01-22',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
