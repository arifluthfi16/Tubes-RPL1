/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.38-MariaDB : Database - kura_resto
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kura_resto` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `kura_resto`;

/*Table structure for table `bahan_baku` */

DROP TABLE IF EXISTS `bahan_baku`;

CREATE TABLE `bahan_baku` (
  `id_bbaku` int(5) NOT NULL AUTO_INCREMENT,
  `n_bbaku` varchar(50) NOT NULL,
  `stok` int(7) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  PRIMARY KEY (`id_bbaku`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `belanja` */

DROP TABLE IF EXISTS `belanja`;

CREATE TABLE `belanja` (
  `id_belanja` int(7) NOT NULL AUTO_INCREMENT,
  `id_bbaku` int(5) NOT NULL,
  `tgl_belanja` date NOT NULL,
  `jumlah` int(7) NOT NULL,
  `subharga` int(7) NOT NULL,
  PRIMARY KEY (`id_belanja`),
  KEY `id_bbaku` (`id_bbaku`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `detail_menu` */

DROP TABLE IF EXISTS `detail_menu`;

CREATE TABLE `detail_menu` (
  `id_detail_menu` int(7) NOT NULL AUTO_INCREMENT,
  `id_menu` int(5) NOT NULL,
  `id_bbaku` int(5) NOT NULL,
  PRIMARY KEY (`id_detail_menu`),
  KEY `id_menu` (`id_menu`),
  KEY `id_bbaku` (`id_bbaku`),
  CONSTRAINT `detail_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_menu_ibfk_2` FOREIGN KEY (`id_bbaku`) REFERENCES `bahan_baku` (`id_bbaku`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;

/*Table structure for table `detail_pesanan` */

DROP TABLE IF EXISTS `detail_pesanan`;

CREATE TABLE `detail_pesanan` (
  `id_detail_pesanan` int(7) NOT NULL AUTO_INCREMENT,
  `id_pesanan` int(7) NOT NULL,
  `id_menu` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `subharga` int(7) NOT NULL,
  PRIMARY KEY (`id_detail_pesanan`),
  KEY `id_pesanan` (`id_pesanan`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `kuisioner` */

DROP TABLE IF EXISTS `kuisioner`;

CREATE TABLE `kuisioner` (
  `id_kuisioner` int(5) NOT NULL AUTO_INCREMENT,
  `id_pesanan` int(7) NOT NULL,
  `kuisioner` int(3) NOT NULL,
  `saran` text NOT NULL,
  `kritik` text NOT NULL,
  `tgl_kuisioner` date NOT NULL,
  PRIMARY KEY (`id_kuisioner`),
  KEY `id_pesanan` (`id_pesanan`),
  CONSTRAINT `kuisioner_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `meja` */

DROP TABLE IF EXISTS `meja`;

CREATE TABLE `meja` (
  `no_meja` int(5) NOT NULL AUTO_INCREMENT,
  `username_meja` varchar(25) NOT NULL,
  `password_meja` varchar(25) NOT NULL,
  PRIMARY KEY (`no_meja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL AUTO_INCREMENT,
  `n_menu` varchar(50) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `harga` int(6) NOT NULL,
  `keterangan` varchar(25) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `id_pegawai` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `n_pegawai` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `pesanan` */

DROP TABLE IF EXISTS `pesanan`;

CREATE TABLE `pesanan` (
  `id_pesanan` int(7) NOT NULL AUTO_INCREMENT,
  `id_pegawai` int(5) DEFAULT NULL,
  `no_meja` int(5) NOT NULL,
  `tgl_pesanan` date NOT NULL,
  `total_harga` int(8) NOT NULL,
  `keterangan` varchar(25) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_pesanan`),
  KEY `id_pegawai` (`id_pegawai`),
  KEY `no_meja` (`no_meja`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`no_meja`) REFERENCES `meja` (`no_meja`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `req_bbaku` */

DROP TABLE IF EXISTS `req_bbaku`;

CREATE TABLE `req_bbaku` (
  `id_req_bbaku` int(5) NOT NULL AUTO_INCREMENT,
  `id_bbaku` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  PRIMARY KEY (`id_req_bbaku`),
  KEY `id_pegawai` (`id_bbaku`),
  CONSTRAINT `req_bbaku_ibfk_1` FOREIGN KEY (`id_bbaku`) REFERENCES `bahan_baku` (`id_bbaku`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
