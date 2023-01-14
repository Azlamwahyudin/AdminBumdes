-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_bumdes1
DROP DATABASE IF EXISTS `db_bumdes1`;
CREATE DATABASE IF NOT EXISTS `db_bumdes1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_bumdes1`;

-- Dumping structure for table db_bumdes1.admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_fullname` text NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_admin
DROP TABLE IF EXISTS `data_admin`;
CREATE TABLE IF NOT EXISTS `data_admin` (
  `id` varchar(15) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `telp` int NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_brg
DROP TABLE IF EXISTS `data_brg`;
CREATE TABLE IF NOT EXISTS `data_brg` (
  `id_brg` varchar(50) NOT NULL,
  `barang` varchar(30) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `hg_beli` int NOT NULL,
  `hg_jual` int NOT NULL,
  `jml_stok` int NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(99) NOT NULL,
  PRIMARY KEY (`id_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_klr
DROP TABLE IF EXISTS `data_klr`;
CREATE TABLE IF NOT EXISTS `data_klr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(100) NOT NULL,
  `tgl_keluar` date NOT NULL,
  `id_brg` int NOT NULL,
  `barang` varchar(50) NOT NULL,
  `jml_keluar` int NOT NULL,
  `total_hrg` int NOT NULL,
  `penerima` varchar(35) NOT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_mitra
DROP TABLE IF EXISTS `data_mitra`;
CREATE TABLE IF NOT EXISTS `data_mitra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mitra` varchar(10) NOT NULL,
  `nama_mitra` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `tgl_gabung` date NOT NULL,
  `barang` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_msk
DROP TABLE IF EXISTS `data_msk`;
CREATE TABLE IF NOT EXISTS `data_msk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(100) NOT NULL,
  `tgl_msk` date NOT NULL,
  `id_brg` varchar(50) NOT NULL,
  `barang` varchar(50) NOT NULL,
  `pengirim` varchar(50) NOT NULL,
  `hg_beli` int NOT NULL,
  `jml_masuk` int NOT NULL,
  `total_hrg` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_ongkir
DROP TABLE IF EXISTS `data_ongkir`;
CREATE TABLE IF NOT EXISTS `data_ongkir` (
  `id_ongkir` int NOT NULL AUTO_INCREMENT,
  `jenis_ongkir` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ongkos_kirim` int NOT NULL,
  PRIMARY KEY (`id_ongkir`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.data_reseller
DROP TABLE IF EXISTS `data_reseller`;
CREATE TABLE IF NOT EXISTS `data_reseller` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_reseller` varchar(10) NOT NULL,
  `nama_reseller` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `tgl_gabung` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.item_preorder
DROP TABLE IF EXISTS `item_preorder`;
CREATE TABLE IF NOT EXISTS `item_preorder` (
  `id_item_preorder` int NOT NULL AUTO_INCREMENT,
  `id_preorder` varchar(100) NOT NULL,
  `id_brg` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id_item_preorder`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.keranjang
DROP TABLE IF EXISTS `keranjang`;
CREATE TABLE IF NOT EXISTS `keranjang` (
  `id_keranjang` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_barang` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `subtotal` int NOT NULL,
  `jenis` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id_keranjang`),
  KEY `id_user` (`id_user`),
  KEY `id_barang` (`id_barang`),
  CONSTRAINT `keranjang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.preorder
DROP TABLE IF EXISTS `preorder`;
CREATE TABLE IF NOT EXISTS `preorder` (
  `id_preorder` varchar(100) NOT NULL,
  `tgl_preorder` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int NOT NULL,
  `penerima` varchar(32) NOT NULL,
  `alamat` varchar(99) NOT NULL,
  `no_telp` char(15) NOT NULL,
  `id_ongkir` int NOT NULL,
  `total_preorder` int NOT NULL,
  `status` varchar(32) NOT NULL,
  PRIMARY KEY (`id_preorder`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.report_klr
DROP TABLE IF EXISTS `report_klr`;
CREATE TABLE IF NOT EXISTS `report_klr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(100) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `penerima` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `total_transaksi` int NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.report_msk
DROP TABLE IF EXISTS `report_msk`;
CREATE TABLE IF NOT EXISTS `report_msk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(50) NOT NULL,
  `tgl_msk` date NOT NULL,
  `id_brg` varchar(50) NOT NULL,
  `barang` varchar(50) NOT NULL,
  `pengirim` varchar(50) NOT NULL,
  `hg_beli` int NOT NULL,
  `jml_masuk` int NOT NULL,
  `total_hrg` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.transaksi
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tgl_transaksi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int NOT NULL,
  `penerima` varchar(36) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `alamat` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `no_telp` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_ongkir` int NOT NULL,
  `resi` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '-',
  `total_transaksi` int NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `bukti_tf` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '-',
  PRIMARY KEY (`id_transaksi`),
  KEY `id_user` (`id_user`),
  KEY `id_ongkir` (`id_ongkir`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_ongkir`) REFERENCES `data_ongkir` (`id_ongkir`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.transaksi_produk
DROP TABLE IF EXISTS `transaksi_produk`;
CREATE TABLE IF NOT EXISTS `transaksi_produk` (
  `id_transaksi_produk` int NOT NULL AUTO_INCREMENT,
  `id_transaksi` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `id_brg` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `qty` int NOT NULL,
  `subtotal` int NOT NULL,
  PRIMARY KEY (`id_transaksi_produk`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table db_bumdes1.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(32) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL DEFAULT 'Not set',
  `username` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `no_telp` char(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto_profil` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
