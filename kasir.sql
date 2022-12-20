-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.10-MariaDB-1:10.5.10+maria~focal - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6337
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kasir
DROP DATABASE IF EXISTS `kasir`;
CREATE DATABASE IF NOT EXISTS `kasir` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `kasir`;

-- Dumping structure for table kasir.api_keys
DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE IF NOT EXISTS `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.api_keys: ~0 rows (approximately)
DELETE FROM `api_keys`;
/*!40000 ALTER TABLE `api_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_keys` ENABLE KEYS */;

-- Dumping structure for table kasir.api_limit
DROP TABLE IF EXISTS `api_limit`;
CREATE TABLE IF NOT EXISTS `api_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `uri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.api_limit: ~0 rows (approximately)
DELETE FROM `api_limit`;
/*!40000 ALTER TABLE `api_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_limit` ENABLE KEYS */;

-- Dumping structure for table kasir.barang
DROP TABLE IF EXISTS `barang`;
CREATE TABLE IF NOT EXISTS `barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foto` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'placeholder.png',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satuan_id` int(11) DEFAULT 1,
  `harga_beli` double DEFAULT 0,
  `harga_jual` double DEFAULT 0,
  `stok_qty` int(11) DEFAULT 1,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bagian` char(50) COLLATE utf8mb4_unicode_ci DEFAULT 'A',
  `terhapus` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `tgl_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nama_satuan_id` (`nama`,`satuan_id`),
  FULLTEXT KEY `nama_keterangan` (`nama`,`keterangan`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.barang: ~305 rows (approximately)
DELETE FROM `barang`;
/*!40000 ALTER TABLE `barang` DISABLE KEYS */;
INSERT INTO `barang` (`id`, `foto`, `barcode`, `nama`, `satuan_id`, `harga_beli`, `harga_jual`, `stok_qty`, `keterangan`, `bagian`, `terhapus`, `tgl_update`) VALUES
	(1, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(2, '2e884ddb-0e28-415a-a6d7-a54bfd5a3447.png', '8991389301692', 'BUKU HARD COVER QUARTO 100 PPL', 6, 0, 9000, 0, 'isi 5 buku', 'A', 'N', '2020-10-29 08:44:09'),
	(3, '85c6f63b-6893-4dd4-9d93-b293f485b6cd.png', '4974052815522', 'BOLPEN ARTLINE GOLD 1900', 1, 4000, 7000, -1, '', 'A', 'N', '2020-11-02 07:19:44'),
	(4, 'placeholder.png', NULL, 'SPIDOL SNOWMAN GP-12 GOLD', 1, 0, 0, 0, NULL, 'A', 'Y', '2020-10-29 03:26:54'),
	(5, 'placeholder.png', NULL, 'TIPEX KIRIKO 0810', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(6, 'placeholder.png', NULL, 'TEPAK MAGNET MC-8088 TIMBUL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(7, 'placeholder.png', NULL, 'KOTAK PENSIL MAGNET JUMBO KT-1017', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(8, 'placeholder.png', '', 'PLAKBAN LINEN SKM 1,5"', 1, 8750, 11000, 0, '', 'A', 'N', '2020-10-29 03:10:15'),
	(9, 'placeholder.png', NULL, 'TIPEX SAFARI SF-177/188', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(10, 'placeholder.png', '', 'KERTAS STIKER GLOSSY VANCO A4', 6, 19000, 25000, 0, 'kertas sticker, stiker', 'A', 'N', '2020-10-30 08:34:41'),
	(11, 'placeholder.png', '', 'KERTAS FOTO GLOSSY BLUE PRINT A4 230gsm', 1, 0, 0, 0, '', 'A', 'N', '2020-11-01 02:41:54'),
	(12, 'placeholder.png', NULL, 'AMPLOP PPL 90', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(13, 'placeholder.png', NULL, 'MIKA COVER BENING', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(14, 'placeholder.png', NULL, 'KERTAS DOUBLE FOLIO SIDU 100', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:20'),
	(15, 'placeholder.png', NULL, 'LAMINATING V-TEC 100mic', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(16, 'placeholder.png', NULL, 'KERTAS BUFALLO PHYTON HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:33'),
	(17, 'placeholder.png', NULL, 'BUKU AGENDA 1732 32K', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:50:08'),
	(18, 'placeholder.png', NULL, 'BUKU AGENDA 6832', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:50:14'),
	(19, 'placeholder.png', NULL, 'SIMPOA TANGGUNG 8590', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(20, 'placeholder.png', NULL, 'CRAYON APIK 12W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(21, 'placeholder.png', NULL, 'PITA KADO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(22, 'placeholder.png', NULL, 'PITA MERAH PUTIH 1"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(23, 'placeholder.png', NULL, 'STAPLER DELI no.0329', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(24, 'placeholder.png', NULL, 'BOLPEN TG 340 HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(25, 'placeholder.png', NULL, 'BUKU KWARTO 100 VISION', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:48'),
	(26, 'placeholder.png', '', 'BUKU HARD COVER FOLIO 100 PPL', 1, 0, 0, 0, '', 'A', 'N', '2020-10-29 03:06:52'),
	(27, '172e0676-7722-423d-a1d3-29d55039666a.png', '8991389308233', 'KWITANSI PAPERLINE KECIL KT 40M', 1, 0, 3500, 0, '', 'A', 'N', '2020-10-22 13:54:58'),
	(28, 'placeholder.png', NULL, 'ISI CUTTER BESAR KENKO L150', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(29, 'c70a5c9e-69a9-4d15-b8e1-fe1dd1f71c26.png', '6957990901395', 'MEMO STICK VS MS 01', 6, 0, 16000, 0, '', 'A', 'N', '2020-10-24 05:05:57'),
	(30, '258c2b90-771e-4319-bf52-109ccfbe3df4.png', '', 'BUKU TULIS VISION 38', 6, 0, 23000, 0, 'isi 10 buku', 'A', 'N', '2020-10-22 08:43:40'),
	(31, '72bf2edf-427c-4cbe-8589-13cf7163e419.png', '', 'BUKU TULIS VISION B5', 6, 0, 24000, 0, 'isi 6 buku', 'A', 'N', '2020-10-22 09:32:52'),
	(32, 'placeholder.png', NULL, 'BUKU AGENDA 8832 32K', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:58'),
	(33, 'placeholder.png', NULL, 'TEPAK MOBIL SET B-363', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(34, 'placeholder.png', NULL, 'TEPAK MAGNET MINI KT-593', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(35, 'placeholder.png', NULL, 'KOTAK PENSIL KARTON KK-116-2', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(36, 'placeholder.png', NULL, 'RAUTAN BUNGAN MATAHARI 8091B-1', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(37, 'placeholder.png', NULL, 'RAUTAN MIKA RABBIT NO.931', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(38, 'placeholder.png', NULL, 'RAUTAN GOSTAR NO.201530', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(39, 'placeholder.png', NULL, 'MIKA PRESS TEPI BOLA DUNIA FOLIO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(40, 'edbe5d9a-3d5b-4809-89e7-3a50eac4bc34.png', '8994238004058', 'STAPLER SUNWELL ST-50', 1, 0, 25000, 2, 'use stalpes 24/6 or 26/6', 'A', 'N', '2020-10-28 09:42:43'),
	(41, '22d3462c-5205-4c6d-89e5-ed828170fc80.png', '4893055096281', 'STAPLER PUTAR EAGLE 9628', 1, 0, 50000, 1, '', 'A', 'N', '2020-10-28 09:44:52'),
	(42, 'placeholder.png', NULL, 'PAPER CLIP SAFARI NO.3', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(43, 'placeholder.png', NULL, 'STOP MAP KERTAS MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(44, 'placeholder.png', NULL, 'MAP BISNIS FILE MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(45, '3870fcdc-6dfe-405f-95e0-7af4f0597fc0.png', '', 'PENGGARIS BUTTERFLY 20CM', 1, 0, 2500, 0, '', 'A', 'N', '2020-10-23 06:24:48'),
	(46, 'placeholder.png', NULL, 'BOLPEN TRIFELLO TF-342B', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(47, 'placeholder.png', NULL, 'BINDER CLIP LINKO 200', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(48, 'placeholder.png', NULL, 'BINDER CLIP LINKO 107', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(49, 'placeholder.png', NULL, 'BINDER CLIP SMILE 155', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(52, 'placeholder.png', NULL, 'BINDER CLIP LINKO 260', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(53, '0fa4140d-7128-42a9-8fbf-fd3a7b4126b1.png', '', 'PENSIL 2B FABER CASTELL', 1, 0, 4500, 0, '', 'A', 'N', '2020-10-24 05:04:35'),
	(54, 'placeholder.png', '', 'BUKU TULIS VISION 32', 6, 0, 21000, 0, '', 'A', 'N', '2020-10-22 09:24:47'),
	(55, '423402ad-618b-40db-bf5b-2c680b75517d.png', '8993988060130', 'CUTTER JOYKO L-500 SG', 1, 0, 23000, 0, '', 'A', 'N', '2020-10-22 00:18:59'),
	(56, 'placeholder.png', '', 'BUKU HARD COVER OKTAVO 100 PPL', 1, 0, 0, 0, '', 'A', 'N', '2020-10-29 03:09:17'),
	(57, 'placeholder.png', NULL, 'SAMPUL OPP BIG DLX 0,5 KWARTO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(59, 'placeholder.png', NULL, 'BUKU GAMBAR SIDU A3', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(61, 'placeholder.png', NULL, 'KERTAS DOUBLE FOLIO SIDU 200 TEBAL 70gsm', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:54:27'),
	(62, 'placeholder.png', NULL, 'TIPEX JOYKO CF-S209A', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(63, 'placeholder.png', NULL, 'TINTA YAMURA STANDART VIOLET', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(65, '1d452f4e-61ca-478e-b0b4-f5bf558771be.png', '', 'PENGGARIS BUTTERFLY 30CM', 1, 0, 3500, 0, '', 'A', 'N', '2020-10-23 06:24:02'),
	(66, 'placeholder.png', NULL, 'BUKU NOTA CH K1', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:54:33'),
	(67, 'e38b0d3e-03eb-44f5-a2b9-13b83cb51f5b.png', '', 'KERTAS LABEL HARGA 112 PHOENIX', 6, 0, 5000, 0, '', 'A', 'N', '2020-10-24 02:45:47'),
	(68, 'feda7773-117e-4937-9dfc-60731c5a4be7.png', '8991389248034', 'NOTA KONTAN PAPERLINE RANGKAP 2 (Eceran)', 1, 0, 3500, 0, 'NOTA PAPERLINE NK K2 NCR TK', 'A', 'N', '2020-10-22 13:21:27'),
	(69, 'placeholder.png', NULL, 'KALKULATOR RERISAI PE-812BC', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(70, 'placeholder.png', NULL, 'KOTAK PENSIL KARTON KK-3C4D-08', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(71, 'placeholder.png', NULL, 'STICKNOTE MONTANA 213', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(72, 'placeholder.png', NULL, 'PENSIL TABUNG  SW-2116', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(73, 'placeholder.png', NULL, 'STICKNOTE BIG 76 X 51 5W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(74, 'placeholder.png', NULL, 'STABILLO GM-3001', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(75, 'placeholder.png', NULL, 'BOLPEN WEIYADA E681 BIRU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(76, 'placeholder.png', NULL, 'MAP JARING SW 3809 MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(77, 'placeholder.png', NULL, 'BOLPEN SNOWMAN V5', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(78, 'placeholder.png', NULL, 'HVS MAXI BRITE A4 70 GSM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(79, 'placeholder.png', NULL, 'CRAYON TITI 12W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(80, 'placeholder.png', NULL, 'KALKULATOR RERISAI PE-137', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(81, 'placeholder.png', NULL, 'ERBA 88162', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(82, 'placeholder.png', NULL, 'BINDER CLIP LINKO 111', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(83, 'ee7c30da-b8ea-4118-9b44-1dd7febdad8a.png', '', 'LEM GLUVINAL KECIL', 1, 0, 3000, 0, '', 'A', 'N', '2020-10-22 07:20:56'),
	(84, '71b708b6-c58b-451e-ab81-7c6803e24b38.png', '8993988310037', ' JOYKO PEMBOLONG KERTAS NO.30 XL', 1, 0, 17500, 2, 'pembolong kertas 2 lubang, punch', 'A', 'N', '2020-10-28 18:04:50'),
	(85, 'ba497020-689a-4395-be06-43ed901f7039.png', '4084900701638', 'SETIP / PENGHAPUS LYRA', 1, 0, 2500, 0, 'penghapus lyra 2b', 'A', 'N', '2020-10-24 05:02:28'),
	(86, 'fc83af92-7203-4043-b8ad-3fd6f6714f4f.png', '6931040230079', 'PENGGARIS BESI 30cm VAN ART', 1, 0, 4000, 0, '', 'A', 'N', '2020-10-23 06:26:28'),
	(87, 'placeholder.png', NULL, 'ERBA 88185', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(88, '1ddeff28-3b37-44e4-8dbf-136b96fb7cda.png', '4970129703013', 'BOLPEN SNOWMAN V3', 5, 0, 34000, 0, '', 'A', 'N', '2020-10-22 00:21:42'),
	(89, 'placeholder.png', NULL, 'MAP BINDER JOYKO B5 CAMPUS', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(90, '063db0d9-28b2-4ff3-a15b-43559a5cd0fe.png', '', 'LOOSE LEAF BIGBOSS A5 100', 1, 0, 7000, 0, '', 'A', 'N', '2020-10-22 14:09:50'),
	(91, '13587407-0893-4813-9546-22e6aa4773ce.png', '', 'PENSIL 2B STAEDLER', 1, 0, 4000, 0, '', 'A', 'N', '2020-10-24 02:37:02'),
	(92, 'e3cd7b99-f635-4746-963a-12c832b6c4d1.png', '', 'PENSIL 2B LYRA', 1, 0, 3500, 0, 'pensil ujian', 'A', 'N', '2020-10-24 02:42:52'),
	(93, 'placeholder.png', NULL, 'BOLPEN 4W TRIFELO TF-729', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(94, 'placeholder.png', NULL, 'BOLPEN HY Q6032', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(95, '7b1744dc-2772-4059-863c-77526637b36c.png', '4970129754015', 'BOLPEN SNOWMAN V7', 5, 0, 26000, 0, '', 'A', 'N', '2020-10-23 06:21:37'),
	(96, 'placeholder.png', NULL, 'BOLPEN SAFARI SF-979', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(97, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 1,5" MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(98, 'placeholder.png', NULL, 'STEMPEL JOYKO LUNAS S 68', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(99, '762b039f-08d2-4691-b52d-2bade2320fec.png', '8993988355519', 'STEMPEL JOYKO TANGGAL D3', 1, 0, 15000, 0, '', 'A', 'N', '2020-10-22 13:31:05'),
	(100, 'placeholder.png', NULL, 'SPIDOL SNOWMAN PW1A MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(101, 'placeholder.png', NULL, 'BK ABSEN TOP LINE', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(102, 'placeholder.png', NULL, 'BK TULIS KOTAK TGG VISION', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(103, 'placeholder.png', NULL, 'BUSUR MIKA CHEVAL 3,5', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(104, 'placeholder.png', NULL, 'CRAYON TITI 24W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(105, 'placeholder.png', NULL, 'KERTAS CD TA', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(106, 'placeholder.png', NULL, 'PUSH PIN AZ', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(107, 'de82c78d-adba-4cb7-a432-65cfaac9c662.png', '4970129727514', 'SPIDOL SNOWMAN BG12 HITAM', 1, 0, 8000, 0, '', 'A', 'N', '2020-10-22 00:35:51'),
	(108, '729a1383-b71e-43b8-82ac-dbd468e9dc6d.png', '4970129726517', 'SPIDOL SNOWMAN PERMANENT G-12 HITAM', 1, 0, 8000, 0, 'spidol besar snowman permanen g12', 'A', 'N', '2020-10-24 05:00:07'),
	(109, '781f35d2-7ff8-4c4e-ad13-d6cfa69c6cd0.png', '8994793004074', 'ORIGAMI KERTAS LIPAT FORTE 12 X 12', 6, 0, 2500, 0, '', 'A', 'N', '2020-10-22 12:58:08'),
	(110, '746ee772-03a3-4775-9b07-cf01d6b88531.png', '8994793004081', 'ORIGAMI KERTAS LIPAT FORTE 14 X 14', 6, 0, 3500, 0, '', 'A', 'N', '2020-10-22 12:46:12'),
	(111, 'bc6a297b-ce38-4d83-b83e-f93e28025861.png', '8994793004098', 'ORIGAMI KERTAS LIPAT FORTE 16 X 16', 6, 0, 4500, 0, '', 'A', 'N', '2020-10-22 12:52:55'),
	(112, 'placeholder.png', NULL, 'BK GAMBAR DODO A4', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(113, 'placeholder.png', NULL, 'ISI LEM BAKAR KECIL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(114, 'bd0a57bb-6148-40c9-a4bf-c6adee499ba2.png', '', 'LABEL HARGA 103 PHOENIX', 6, 0, 5000, 0, '', 'A', 'N', '2020-10-24 02:46:58'),
	(115, '8da27fb3-e1d2-4411-bdf4-1cf2df569570.png', '8998820010007', 'ID CARD TALI OFFICIA', 1, 0, 5000, 0, '', 'A', 'N', '2020-10-22 12:39:31'),
	(116, 'placeholder.png', NULL, 'MAP KANCING 1', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(117, 'placeholder.png', NULL, 'AMPLOP TALI 310 AIRMAIL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(118, 'placeholder.png', NULL, 'LAMINATING KYOTO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(119, 'placeholder.png', NULL, 'MAP JARING SW 3809 HIJAU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(120, 'placeholder.png', NULL, 'RAUTAN CL-169', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(121, 'placeholder.png', NULL, 'NOTA PPL B2', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(122, 'placeholder.png', NULL, 'ISI STAPLES MAX 24/6', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(123, 'placeholder.png', NULL, 'ISI STAPLES KANGORO 23/13', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(125, 'placeholder.png', NULL, 'BOLPEN KASIR V-TEC TGP307', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(126, '926329fd-23aa-42ff-82d9-207c006c76fa.png', '8991389228227', 'KWITANSI PAPERLINE TANGGUNG KT 40T', 1, 0, 7000, 0, 'KWITANSI PPL TANGGUNG KT 40T', 'A', 'N', '2020-10-22 13:53:44'),
	(127, 'placeholder.png', NULL, 'TINTA YAMURA STANDART BIRU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(128, '1e28f31b-c470-452a-9490-9d3fc6cd7807.png', '8993988355526', 'STEMPEL JOYKO TANGGAL D-4', 1, 0, 14000, 0, '', 'A', 'N', '2020-10-22 13:32:11'),
	(129, 'placeholder.png', NULL, 'CLIPBOARD GAMBAR FANCY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(130, 'placeholder.png', NULL, 'BOLPEN KENKO EASY FLOW 6', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(131, 'placeholder.png', NULL, 'BOLPEN TIZO TG 340 BIRU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(132, '8a747f52-3ce9-4699-95af-51b26a6d7818.png', '4007817524206', 'SETIP / PENGHAPUS STAEDLER', 1, 0, 0, 0, '', 'A', 'N', '2020-10-24 05:03:41'),
	(133, 'placeholder.png', NULL, 'BOLPEN GEL SF-1761', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(134, 'placeholder.png', NULL, 'PENSIL MEKANIK 2.0 FANCY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(135, 'placeholder.png', NULL, 'STAND BOOK V-TEC VT ST-065', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(136, 'placeholder.png', NULL, 'CLIP BOARD KAYU DATA EX', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(137, 'placeholder.png', NULL, 'STAND BOOK V-TEC VT ST-07', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(138, 'placeholder.png', '4970129732518', 'REFILL BOARDMARKER SNOWMAN HITAM', 1, 0, 17500, 0, '', 'A', 'N', '2020-10-22 13:34:34'),
	(139, 'placeholder.png', NULL, 'CRAYON TITI 48W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(140, 'placeholder.png', NULL, 'TEPAK MOBIL QZ-7001', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(141, 'placeholder.png', NULL, 'TEPAK KAIN 8 DIMENSI', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(142, 'placeholder.png', NULL, 'SETIP JERSY B-40C', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(143, 'placeholder.png', '', 'BOLPEN AE7 STANDART HITAM', 1, 0, 2000, 0, '', 'A', 'N', '2020-10-29 10:03:21'),
	(144, 'placeholder.png', NULL, 'BOLPEN FLEX OFFICE TRENDEE', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(145, 'placeholder.png', NULL, 'RAUTAN DORAEMON NO-613D', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(146, 'placeholder.png', NULL, 'BOLPEN SAFARI SF 888', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(147, 'placeholder.png', NULL, 'BOLPEN FASTER C600', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(148, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2" MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(149, 'placeholder.png', NULL, 'BK TULIS SINAR DUNIA 58', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(150, 'placeholder.png', NULL, 'BK TULIS SINAR DUNIA 78', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(151, 'placeholder.png', NULL, 'TEPAK PENSIL MIKA', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(152, '3ab2838e-4ed7-442c-b484-24ea5735d190.png', '', 'KERTAS KARBON DAITO', 1, 0, 2000, 0, 'carbon paper merk daito', 'A', 'N', '2020-10-24 02:40:55'),
	(153, 'placeholder.png', NULL, 'CLIP BOARD BENING LINKO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(154, 'f38fe59a-d5aa-4da2-be57-324e55cffe85.png', '', 'AGENDA ERICA 156', 1, 0, 5000, 0, '', 'A', 'N', '2020-10-22 14:08:12'),
	(155, 'placeholder.png', NULL, 'BOLPEN TG346', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(156, 'placeholder.png', NULL, 'BOLPEN IPEN-X SF-2019', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(157, 'placeholder.png', NULL, 'BOLPEN K7 FABER CASTEL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(158, 'placeholder.png', NULL, 'BOLPEN PILOT BPT-P HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(159, 'placeholder.png', NULL, 'PITA MERAH PUTIH 1/2"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(160, 'placeholder.png', NULL, 'HVS MAXI BRITE F4 70 GSM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(161, 'placeholder.png', NULL, 'RAUTAN 388A', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(162, 'placeholder.png', NULL, 'MAP KANCING FOLDER 1 MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(163, 'placeholder.png', NULL, 'BK KAS FOLIO 100 3K KIKY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(164, 'placeholder.png', NULL, 'STABILLO SUNWELL HL-500', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(165, 'placeholder.png', NULL, 'SPIDOL SNOWMAN PW1A HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(166, 'placeholder.png', NULL, 'BUFALLO PHYTON PUTIH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(167, 'placeholder.png', NULL, 'BUFALLO PHYTON MT', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(168, 'placeholder.png', NULL, 'PAPER CLIP V-TEC NO.3', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(169, 'placeholder.png', NULL, 'PENGGARIS BESI 40cm POP 1', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(170, 'placeholder.png', NULL, 'PAPER CLIP VAN-ART WARNA', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(171, 'placeholder.png', NULL, 'STIKER GLOSSY CARTA A4', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(172, 'placeholder.png', NULL, 'KADO TRULY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(173, 'placeholder.png', NULL, 'SAMPUL BUKU BATIK', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(174, 'placeholder.png', NULL, 'SAMPUL BUKU GAMBAR', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(175, 'placeholder.png', NULL, 'STICKNOTE BIG 76 X 51 SW', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(176, 'dcc6bafa-6095-434b-8bd7-1620c4ea02a2.png', '3211621137902', 'ID CARD B2', 1, 0, 1500, 0, 'CARDCASE ID CARD B2 IDC-902 B2', 'A', 'N', '2020-10-22 13:18:29'),
	(177, 'placeholder.png', NULL, 'TALI ID CARD BIRU PLASTIK', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(178, 'placeholder.png', NULL, 'WHITE BOARD ERASER POP 1', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(179, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2" HIJAU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(182, 'placeholder.png', NULL, 'AMPLOP SAMSON KW B', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(183, 'placeholder.png', NULL, 'TALI ID CARD MERAH PLASTIK', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(184, 'ec073c1c-0e54-457e-8d7a-9d2efe713809.png', '', 'ID CARD A1 HS-801', 1, 0, 1000, 0, 'GLUE CARD ID CARD A1 HS-801', 'A', 'N', '2020-10-22 13:19:12'),
	(185, 'placeholder.png', NULL, 'ID CARD A2', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(186, 'd1969448-fdf2-4ba3-9beb-c49e5ae4a61e.png', '', 'ID CARD A3', 1, 0, 2000, 0, '', 'A', 'N', '2020-10-24 02:49:06'),
	(187, '61addaf9-5f55-49bd-a48a-4864d73ae3cd.png', '', 'ID CARD B1 HS-901', 1, 0, 1000, 0, 'GLUE CARD ID CARD B1 HS-901', 'A', 'N', '2020-10-22 13:19:15'),
	(188, '722eb250-e52d-4efb-ad09-6718d05d0a5f.png', '', 'ID CARD B3', 1, 0, 2000, 0, 'CARDCASE ID CARD B3 IDC-903 B3', 'A', 'N', '2020-10-22 13:18:59'),
	(189, '2385a537-fa51-4598-ae06-28c38e718fa1.png', '', 'ID CARD B4', 1, 0, 2500, 0, 'GLUE CARD ID CARD B4 JY-904', 'A', 'N', '2020-10-22 13:18:40'),
	(190, 'placeholder.png', NULL, 'BOLPEN GEL GP-939', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(192, 'placeholder.png', NULL, 'RISALAH TUNTUNAN SHOLAT LENGKAP', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(193, 'placeholder.png', NULL, 'SURAT YASIN TAHLIL WAQIAH MULK', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(194, 'placeholder.png', NULL, 'BUKU TURUTAN', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(195, 'placeholder.png', NULL, 'BUKU BANJANJI', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(196, 'placeholder.png', NULL, 'NOTEBOOK B5 VINTAGE KIKY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(197, 'f9368677-c93f-4216-bb90-3e5c9cdafd81.png', '5702234211102', 'CLIPBOARD WITH COVER BANTEX F4', 1, 0, 35000, 0, 'clipboard fc with cover 4210 10', 'A', 'N', '2020-10-22 13:59:12'),
	(198, 'aa164bed-d387-4e8f-aa43-863f2eec24d4.png', '8997226730083', 'SPIDOL WHITEBOARD MARKER MONTANA', 1, 0, 5000, 0, 'tipe mw-12', 'A', 'N', '2020-10-24 04:53:19'),
	(199, 'placeholder.png', NULL, 'RANSEL SEKOLAH MINI KARAKTER', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(200, 'placeholder.png', NULL, 'CRAYON MINYAK TITI TI-P-24CR', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(201, 'placeholder.png', NULL, 'HVS COPY PAPER A4 70GSM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(202, 'a6686b3c-23ad-4521-bd0a-81def1e49e66.png', '8993988111092', 'GLUE STICK JOYKO GS 100', 1, 0, 0, 0, 'joyko glue stick gs100 gs-100', 'A', 'N', '2020-10-24 05:08:25'),
	(203, 'placeholder.png', NULL, 'FATIH F 7711', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(204, 'placeholder.png', NULL, 'FATIH F 7712', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(205, 'placeholder.png', NULL, 'FATIH F 7713', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(206, 'placeholder.png', NULL, 'FATIH F 7714', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(207, 'placeholder.png', NULL, 'FATIH F 7715', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(208, 'placeholder.png', NULL, 'FATIH F 7716', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(209, 'placeholder.png', NULL, 'FATIH F 7717', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(210, 'placeholder.png', NULL, 'FATIH F 7718', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(211, 'placeholder.png', NULL, 'FATIH F 7719', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(212, 'placeholder.png', NULL, 'FATIH F 7720', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(213, 'placeholder.png', NULL, 'FATIH F 7721', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(214, 'placeholder.png', NULL, 'FATIH F 7722', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(215, 'placeholder.png', NULL, 'FATIH F 7723', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(216, 'placeholder.png', NULL, 'FATIH F 7724', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(217, 'placeholder.png', NULL, 'TULIP T 8850', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(218, 'placeholder.png', NULL, 'TULIP T 8851', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(219, 'placeholder.png', NULL, 'TULIP T 8852', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(220, 'placeholder.png', NULL, 'TULIP T 8853', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(221, 'placeholder.png', NULL, 'TULIP T 8854', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(222, 'placeholder.png', NULL, 'TULIP T 8855', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(223, 'placeholder.png', NULL, 'TULIP T 8856', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(224, 'placeholder.png', NULL, 'TULIP T 8857', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(225, 'placeholder.png', NULL, 'TULIP T 8858', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(226, 'placeholder.png', NULL, 'TULIP T 8859', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(227, 'placeholder.png', NULL, 'TULIP T 8860', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(228, 'placeholder.png', NULL, 'TULIP T 8861', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(229, 'placeholder.png', NULL, 'TULIP T 8862', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(230, '06f0dd8e-8414-4e02-8e02-fb40fa97da87.png', '8991948103514', 'CRAFT KNIVE V-TEC CK351SB', 1, 0, 25000, 0, '', 'A', 'N', '2020-10-22 00:11:33'),
	(231, '706561d6-65ee-49e3-8308-d4b42597d8c3.png', '', 'BOLPEN KASIR / TABLE TOP PEN TRIFELO TF-315', 1, 10000, 13000, -2, '', 'A', 'N', '2020-11-02 06:21:10'),
	(232, 'placeholder.png', NULL, 'CLIP FILE FOLDER 1 KUNING', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(233, 'placeholder.png', NULL, 'MAP JARING SW 3809 BIRU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(234, 'placeholder.png', NULL, 'STIK NOTE PLASTIK HOLO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(235, 'placeholder.png', NULL, 'MONTANA STIK NOTES 212', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(236, 'placeholder.png', NULL, 'MONTANA STIK NOTES 213', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(237, 'placeholder.png', NULL, '1188 JANGKA SET GOZTAR', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(238, '76618977-dd50-43c6-9e89-9a98e5e47e3d.png', '', '84001 VAN ART JANGKA', 1, 0, 10000, 0, 'compass set', 'A', 'N', '2020-10-22 14:23:49'),
	(239, 'placeholder.png', NULL, 'EXSIS MAINAN MALAM TGG', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:48:35'),
	(240, 'placeholder.png', NULL, 'AICE AICE OBOR', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(241, 'placeholder.png', NULL, 'AICE OBOR VANILA', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(242, 'placeholder.png', '', 'AICE STRAWBERRY CRISPY', 1, 0, 3000, 0, '', 'B', 'N', '2020-11-01 02:41:18'),
	(243, 'placeholder.png', NULL, 'AICE CHOCO COOKIES', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(244, 'placeholder.png', NULL, 'AICE CHOCOLATE CRISPY', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(245, 'placeholder.png', '', 'AICE COFFE CRISPY', 1, 0, 3000, 0, '', 'B', 'N', '2020-11-01 02:42:15'),
	(246, 'placeholder.png', NULL, 'AICE MOCHI VANILLA', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(247, 'placeholder.png', '', 'AICE MOCHI STRAWBERRY', 1, 0, 3000, 0, '', 'B', 'N', '2020-11-01 02:41:01'),
	(248, 'placeholder.png', '', 'AICE MOCHI CHOCOLATE', 1, 0, 3000, 0, '', 'B', 'N', '2020-11-01 02:39:01'),
	(249, 'placeholder.png', NULL, 'AICE MOCHI DURIAN', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(250, 'placeholder.png', NULL, 'AICE TARO', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(251, 'placeholder.png', NULL, 'AICE CHOCOLATE CONDENSED', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(252, 'placeholder.png', NULL, 'AICE SWEET CORN', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(253, 'placeholder.png', NULL, 'AICE MILK', 1, 0, 0, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(254, 'placeholder.png', NULL, 'AICE MANGGO SLUSH', 1, 0, 4000, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(255, 'placeholder.png', NULL, 'AICE NANAS', 1, 0, 2000, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(256, 'placeholder.png', '', 'AICE MILK MELON', 1, 0, 2500, 0, '', 'B', 'N', '2020-11-01 02:39:31'),
	(257, 'placeholder.png', NULL, 'AICE SEMANGKA', 1, 0, 2000, 0, NULL, 'B', 'N', '2020-10-22 09:24:47'),
	(258, 'placeholder.png', '', 'FOTO COPY (PONDOK)', 1, 0, 250, -611, '', 'A', 'N', '2020-10-30 09:18:23'),
	(259, 'placeholder.png', '', 'JILID (PONDOK)', 1, 0, 2500, -47, '', 'A', 'N', '2020-10-30 09:18:23'),
	(260, 'placeholder.png', '', 'FOTO COPY (UMUM)', 1, 0, 300, -92, '', 'A', 'N', '2020-10-30 06:30:05'),
	(261, 'placeholder.png', '', 'JASA JILID (UMUM)', 1, 0, 3000, 0, '', 'A', 'N', '2020-10-30 06:31:01'),
	(262, 'placeholder.png', '', 'CETAK FOTO 3x4 (1 PAKET ISI 4 FOTO)', 1, 0, 5000, -1, '', 'A', 'N', '2020-10-29 07:30:43'),
	(263, 'placeholder.png', '', 'CETAK FOTO 4x6', 1, 0, 2500, 0, '', 'A', 'N', '2020-10-22 13:05:24'),
	(264, 'placeholder.png', '', 'CETAK FOTO 2R (60x90 mm)', 1, 3500, 0, 0, '', 'A', 'N', '2020-10-29 07:02:49'),
	(265, 'placeholder.png', '', 'CETAK FOTO 3R (90x130 mm)', 1, 0, 4000, -2, '', 'A', 'N', '2020-10-29 07:30:43'),
	(266, 'placeholder.png', NULL, 'CETAK FOTO 4R (100 x 150 mm)', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(267, 'placeholder.png', '', 'CETAK FOTO 5R (130 x 180 mm)', 1, 0, 8000, -1, '', 'A', 'N', '2020-10-29 07:30:43'),
	(268, 'placeholder.png', NULL, 'CETAK FOTO 8R (200 x 250 mm)', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
	(269, 'placeholder.png', '', 'CETAK FOTO 10R', 1, 0, 18000, 0, '', 'A', 'N', '2020-10-29 07:01:56'),
	(270, 'placeholder.png', NULL, 'JASA LAMINATING (PONDOK)', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:49:57'),
	(271, 'placeholder.png', '', 'JASA LAMINATING (UMUM)', 1, 0, 4000, 0, '', 'A', 'N', '2020-10-30 06:30:39'),
	(272, 'a02fdd84-46f4-4b83-99c6-99422ee7eabd.png', '9789791680028', 'BUKU  SHERLOCK HOLMES KELOMPOK LINGKARAN MERAH', 1, 12750, 15000, 1, 'keterangan', 'A', 'N', '2020-10-27 22:52:39'),
	(274, 'placeholder.png', '', 'LEM GLUVINAL BESAR', 1, 0, 5000, 0, '', 'A', 'N', NULL),
	(275, 'a98c8d28-00cc-4b04-bd01-47f4872f267a.png', '8993242600997', 'KERTAS F4 APRIL PPLITE 75g/m2', 2, 0, 45000, 0, '', 'A', 'N', '2020-10-27 22:50:28'),
	(276, 'bda8814f-7a44-4c56-b30a-b4a24059ae44.png', '8991389308035', 'NOTA KONTAN PAPERLINE RANGKAP 2', 6, 0, 28000, 0, 'NOTA KONTAN PAPERLINE PPL NK K2 NCR', 'A', 'N', '2020-10-22 13:21:15'),
	(277, '4127742b-d5e3-4f31-ae79-67e0fc74535e.png', '8991389308059', 'NOTA KONTAN PAPERLINE RANGKAP 3', 6, 0, 40000, 0, 'NOTA KONTAN PAPERLINE PPL NK K3 NCR', 'A', 'N', '2020-10-22 13:20:24'),
	(278, 'fc8ccbd5-4953-4d40-8d83-83e1cdfe5ada.png', '876547895580', 'BUKU TULIS VISION 58', 6, 0, 33000, 0, 'isi 10 buku', 'A', 'N', '2020-10-22 08:46:37'),
	(279, 'placeholder.png', '', 'BUKU KOTAK KECIL 38 VISION ', 6, 0, 23000, 0, 'isi 10 buku', 'A', 'N', NULL),
	(280, 'placeholder.png', '', 'BUKU KOTAK TANGGUNG VISION', 6, 0, 22000, 0, 'isi 10 buku', 'A', 'N', NULL),
	(281, '0889d28e-8d5d-43ec-9a2a-074213c2afdc.png', '', 'BOX FILE', 1, 0, 15000, 0, '', 'A', 'N', NULL),
	(282, '236f365f-50b4-452b-968f-aa9a2ecea3c6.png', '8994793010280', 'BOX FILE FORTE LEVER ARC FILE', 1, 0, 25000, 0, 'ukuran folio 75 mm', 'A', 'N', NULL),
	(283, '25d56e75-7370-4523-98ef-208605a77680.png', '8993988055174', 'TIPEX KERTAS JOYKO CT-522', 1, 0, 7000, 0, '', 'A', 'N', '2020-10-27 22:50:54'),
	(298, 'placeholder.png', '8993988355502', 'STEMPEL TANGGAL JOYKO S-68', 1, 0, 15000, 0, '', 'A', 'N', '2020-10-27 22:51:05'),
	(299, '02c1b0a1-be09-439d-a313-8d18fc44e51d.png', '8993988345039', 'JOYKO BAK STEMPEL TANPA TINTA', 1, 0, 7000, 12, 'stamp pad', 'A', 'N', '2020-10-28 09:48:20'),
	(300, '582e6ad6-0f61-4704-9a5a-aa0f83c810fe.png', '', 'HERO STAMP PAD DENGAN TINTA', 1, 0, 8000, 0, '', 'A', 'N', '2020-10-22 13:41:19'),
	(301, '56f6badd-a6e9-4ad3-8a48-18ea1b04d40f.png', '6928649268077', 'VANCO HIGHLIGHTER PEN', 1, 0, 5000, 0, '', 'A', 'N', '2020-10-22 13:44:52'),
	(302, 'c0a5d006-d941-4514-957c-a01a62f1fef5.png', '8991624300121', ' HIGHLIGHTER PEN GAJAH MADA TWIN HEAD', 1, 0, 6000, 0, '', 'A', 'N', '2020-10-27 22:51:15'),
	(303, '40ef86f1-4661-4d8f-8721-19342015738c.png', '6942375400204', 'STATIONERY SERIES AS6008', 1, 0, 16000, 0, 'merk aosdu', 'A', 'N', NULL),
	(304, 'de594b1e-ebc0-4b81-a229-e9644d467e9f.png', '4970129724483', 'COLORING MARKER SNOWMAN 12  PW-12A', 1, 0, 15000, 0, '', 'A', 'N', '2020-10-27 22:51:28'),
	(305, '81579108-4b44-4efb-9030-2873f08ac4c7.png', '6923936683816', 'EXSIS COLOUR PEN EX-838-12', 1, 0, 7000, 0, '', 'A', 'N', NULL),
	(306, '358bef94-d01f-47d4-af69-abb9bdf0a4d8.png', '8997006400243', 'APIK OIL PASTEL', 1, 0, 8000, 0, '', 'A', 'N', '2020-10-22 14:14:17'),
	(307, 'bee591bd-3182-4a95-8127-90ecb9014aa7.png', '8801076190198', 'TITI OIL PASTELS', 1, 0, 15000, 0, '', 'A', 'N', NULL),
	(308, '4f5706c3-8906-4486-8bb9-46e680b198ef.png', '6923450102121', 'VAN ART OIL PASTEL 12 COLORS', 1, 0, 12000, 0, '0102-12s', 'A', 'N', NULL),
	(309, '0ffc00df-5128-4536-aa9e-77aeb6f2b0c7.png', '6922680200386', 'NOTEBOOK EMAS JINHUISTATIONERY', 1, 0, 15000, 0, '', 'A', 'N', NULL),
	(310, '17cafe34-20f4-4ad3-869c-c67cdc46f434.png', '8991389300091', 'BUKU TULIS SIDU 32', 6, 0, 23000, 0, 'isi 10 buku', 'A', 'N', NULL),
	(311, '15f071fe-c806-49de-bf9f-76378125b2d4.png', '8991389300107', 'BUKU TULIS SIDU 38', 6, 0, 26500, 0, 'isi 10 buku', 'A', 'N', NULL),
	(312, '074690e4-8af3-4bfb-9208-9823ddece287.png', '8991389300145', 'BUKU TULIS SIDU 58', 6, 0, 36000, 0, 'isi 10 buku', 'A', 'N', NULL),
	(313, '303fa682-f159-431b-ad7c-9e0bc3b97ad4.png', '8998866201711', 'KRIS BEE KRUNCHY RASA JAGUNG BAKAR MENTEGA', 1, 0, 7000, 0, 'ukuran 75 gr', 'B', 'N', '2020-10-27 22:51:41'),
	(314, 'dd221be6-6bfa-41a0-a2e7-437ca5ade646.png', '8996001304020', 'SLAI OLAI NANAS 240g', 1, 0, 11000, 0, '', 'B', 'N', '2020-10-27 22:51:49'),
	(315, '0fd37163-de6b-44a7-8000-5936a1e87192.png', '8999909096004', 'SAMPOERNA MILD 16', 6, 0, 25000, 0, '', 'B', 'N', '2020-10-27 22:51:52'),
	(316, 'decb3bd9-5be9-4a1c-9d5e-f4e815e67d3e.png', '6920709356816', 'A+Z PUSH PIN WARNA CLEAR TRANSP', 6, 0, 5000, 0, 'isi 30 pcs', 'A', 'N', '2020-10-23 06:16:53'),
	(317, 'c2792fd9-2615-497d-a295-73e0d9ee8108.png', '6956953519707', 'BOLPEN SF-979 SAFARI GEL PEN', 5, 0, 20000, 0, 'isi 12 pcs', 'A', 'N', NULL),
	(318, 'placeholder.png', '6943160585519', 'BOLPEN SF-888 SAFARI BRAND', 5, 0, 17000, 0, '', 'A', 'N', NULL),
	(319, '3fac2730-1ca0-45cb-874c-2fb0490b9375.png', '', 'BOLPEN SNOWMAN V3 ECERAN', 1, 0, 4000, 0, '', 'A', 'N', NULL),
	(320, '81b7ce8a-6022-4add-91ce-10475ff62971.png', '', 'WHITEBOARD MARKER HIJAU PIPO', 1, 0, 6000, 0, '', 'A', 'N', '2020-10-27 22:52:11'),
	(321, 'f8c8a29c-4339-49f1-a146-47f935ed3ba8.png', '', 'MINUMAN MIZONE', 1, 0, 5000, 0, '', 'B', 'N', '2020-10-27 22:52:24'),
	(322, 'f2488f76-b694-4364-86fd-145345b4fbeb.png', '4970129745013', 'BOLPEN SNOWMAN V5', 5, 0, 34000, 11, '', 'A', 'N', '2020-10-28 09:34:07'),
	(323, 'e5ef04d8-45b4-4847-b25f-b4087759afe1.png', '4970129006640', 'SNOWMAN PAINT MARKER WHITE PERMANENT WP-12', 1, 0, 16000, 12, '', 'A', 'N', '2020-10-29 06:37:54'),
	(324, '516bbc58-f1bb-4c74-9462-317d18bcc8f1.png', '', 'SNOWMAN PAINT MARKER GOLD GP-12 PERMANENT', 1, 0, 18000, 11, 'warna gold', 'A', 'N', '2020-10-29 06:33:29'),
	(325, 'f4612622-70cf-42e5-a79a-a8ce67e82f71.png', '', 'BUKU HARD COVER QUARTO 200 PPL', 6, 0, 15000, 0, '', 'A', 'N', '2020-10-29 08:54:50'),
	(326, 'placeholder.png', '', 'BOLPEN HONAGA', 1, 0, 1000, 0, '', 'A', 'N', NULL),
	(327, 'placeholder.png', '', 'JASA PRINT STICKER JAMU', 1, 0, 3500, 0, 'untuk satu kertas sticker', 'A', 'N', NULL),
	(328, 'placeholder.png', '', 'POSTER', 1, 1250, 2500, 0, '', 'A', 'N', NULL),
	(329, 'placeholder.png', '', 'FOTO COPY BOLAK BALIK (PONDOK)', 1, 0, 350, 0, '', 'A', 'N', NULL);
/*!40000 ALTER TABLE `barang` ENABLE KEYS */;

-- Dumping structure for table kasir.cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.cart: ~0 rows (approximately)
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- Dumping structure for table kasir.catatan
DROP TABLE IF EXISTS `catatan`;
CREATE TABLE IF NOT EXISTS `catatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tgl_buat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.catatan: ~0 rows (approximately)
DELETE FROM `catatan`;
/*!40000 ALTER TABLE `catatan` DISABLE KEYS */;
/*!40000 ALTER TABLE `catatan` ENABLE KEYS */;

-- Dumping structure for table kasir.ci_session
DROP TABLE IF EXISTS `ci_session`;
CREATE TABLE IF NOT EXISTS `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` int(10) unsigned DEFAULT NULL,
  `data` blob DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table kasir.ci_session: ~337 rows (approximately)
DELETE FROM `ci_session`;
/*!40000 ALTER TABLE `ci_session` DISABLE KEYS */;
INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
	('0bamt9min0mk93gh84obh2sht7helr1r', '192.168.8.100', 1604217234, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373233333b),
	('0bdi4quemu674uvu97uassu5f84ei6g3', '192.168.8.102', 1604272798, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323739373b),
	('0c1no70svacirho8qhavgs4a7v8iu677', '192.168.8.102', 1603909933, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393933323b),
	('0kenndjg3g504pfp775nl3k9ni6jm3k7', '192.168.8.102', 1604220019, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303031383b),
	('0lb2it6f1rpfmlhcn4986adil6bc94s6', '192.168.8.102', 1604275274, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353237343b),
	('0ntoeo04ep6cb216kq604onfs5ll4omi', '192.168.8.102', 1604269976, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393937353b),
	('0os9rul5p62ocvmbfipre0ehtjh9hbt3', '192.168.8.102', 1604268971, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383937313b),
	('14qav5eanni6kid13nf9luvql9ts9e8q', '192.168.8.101', 1603875233, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353233323b),
	('15kmrqmcrs9kin21c54fcjp6umv8eh4a', '192.168.8.100', 1604219317, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393331363b),
	('15uav99aoue6qkm74qse6falest5lmj4', '192.168.8.100', 1604219009, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393030393b),
	('17bsf3qi15fsfodqr41uuq41vjr85vhb', '192.168.8.102', 1603908023, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383032323b),
	('17ptnsf1eb1qf5ltoct2mdtb6rd7mhll', '192.168.8.101', 1603874728, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343732383b),
	('19qda9ls3u4on9pt7uuagpilql3f35uu', '192.168.8.101', 1603877529, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532383b),
	('1g4skb3d64lkdng1a0gmu9fititkjj0f', '192.168.8.100', 1604217467, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373436373b),
	('1h6ah8d9lsoh6hmfl5e023ds982ep8ir', '192.168.8.102', 1604269045, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393034343b),
	('1lk9u5anc980pg8pv9b8kkrdpervf19m', '192.168.8.100', 1604218657, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383635373b),
	('1mlt61k45sj4gr0rfv2ui487d3o516u8', '192.168.8.101', 1603877494, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373439333b),
	('1n5gsnbn4eh54v8m7nr27j7q3dhd8r1s', '192.168.8.100', 1604217539, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373533393b),
	('1r98e04ok5o1h23leq4soh463c0ial13', '192.168.8.101', 1603877563, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373536323b),
	('1u20abqos4rhjtugjvrgrh7iu7smn1tn', '192.168.8.101', 1603878464, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383436343b),
	('213neujqagg6lo3fnb7k490d57sjvkpo', '192.168.8.101', 1603873862, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333836323b),
	('21c23ljvl3o5hvkplq7clahr4t4tgstl', '192.168.8.100', 1604211004, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313030343b),
	('21s084fr6hcbest92k2vje4dhqb9k2fo', '192.168.8.101', 1603875679, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353637383b),
	('27lj9cmqg29sn0064f4a0g2cma7o36d9', '192.168.8.100', 1604218326, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383332363b),
	('2888tofnevrl8aaajnrrgkseilspg760', '192.168.8.102', 1603905908, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930353930373b),
	('2bavlfbbnmqh3rdlpg3cfetpu4rfprmo', '192.168.8.101', 1603878784, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383738333b),
	('2g1r7uh88folm23mt637bhr1vcpsk1mf', '192.168.8.102', 1603908269, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383236393b),
	('2ho0lgd0mon8cf5092mb4slp9ec9v8tl', '192.168.8.101', 1603875284, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353238333b),
	('2icrkklrer1q213a7clb3220pd1fn52r', '192.168.8.100', 1604215092, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353039323b),
	('2l1huvs1rtl503lhdpm37f3nmsaqojs1', '192.168.8.101', 1603875275, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353237343b),
	('2mu4s9b0r1qnuo1hoqbe2vk9mhko3iuj', '192.168.8.102', 1604219478, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393437383b),
	('2n4d0rksqbp8pa1rblv42nh2plkqd3jl', '192.168.8.101', 1603877506, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373530363b),
	('2p5picmf4bsjgl30ci9m54eunme118db', '192.168.8.101', 1603879086, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393038363b),
	('2p7fojk4vjlp5tt1edm5gaedb8lmvqj6', '192.168.8.102', 1604208489, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383438393b),
	('34bv77d8q2gj5fucsvm2tv2sctecis38', '192.168.8.100', 1604215212, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353231313b),
	('34endkh8u9fbe6lffniottdj02d9mgei', '192.168.8.102', 1604220242, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303234323b),
	('3b8fuk5g987poojm3h7ritnglqtd678c', '192.168.8.101', 1603873349, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333334393b),
	('3deb7brmo8ff9annemdgfk0grote897c', '192.168.8.102', 1604208160, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383136303b),
	('3kbajidrskpsf27b9jsktnbi0i8ik5oe', '192.168.8.102', 1604238779, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383737393b),
	('3l05q5lgmffuqcfh334gbhmqloip58rr', '192.168.8.102', 1604272761, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323736303b),
	('3q6d6lmce4n1f3ntpoathos462efosva', '192.168.8.102', 1604269256, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393235363b),
	('3qtoq4b7luc36a2o68q18o0qi9tl7qm2', '192.168.8.102', 1604221368, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313336373b),
	('3s3oncecdp7njret1fo9c7qdd7q6qi1h', '192.168.8.102', 1604269547, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393534363b),
	('448ki70ep3mucgc28dqpoptdc8ak7ejd', '192.168.8.102', 1604276357, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363335363b),
	('47atkpga44cdvk2o6u88k7fj45emuepm', '192.168.8.100', 1604211079, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313037393b),
	('48n36na9negqg1spqj161lr0a6nofjq8', '192.168.8.101', 1603878966, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383936353b),
	('4acr0q8vsbgueke1tohl2ooch5rhpmhg', '192.168.8.101', 1603878391, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383339313b),
	('4gk590b8tqe0fc6o459alfnhgak81snb', '192.168.8.101', 1603878336, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383333353b),
	('4il00bll0gcq3uah0obgio4i8otongs2', '192.168.8.102', 1604208496, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383439363b),
	('4kme3jgde9kooru5nv54f3jir5tsg9n3', '192.168.8.100', 1604217370, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373337303b),
	('4obno97k5gv2qmk993ufsbdmmitptukp', '192.168.8.101', 1603874800, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739393b),
	('4taq9aqg83v3mh606v1vfraukg08ruck', '192.168.8.102', 1604269325, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393332353b),
	('4tkkm916rokm6ro3p5dsctdv94s88m45', '192.168.8.102', 1603909244, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393234343b),
	('56mjbjp7rm67elvs22uc3tcqm8vf9fbf', '192.168.8.102', 1604269850, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393835303b),
	('57gmglkbpiqrtr1tkpdv3d756k19ijdg', '192.168.8.101', 1603877832, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373833313b),
	('5bj273lplhstuarjfiqfcaab2vf96fu6', '192.168.8.102', 1604275070, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353036393b),
	('5bngp328e33cu14gpr9snpttba3ht3du', '192.168.8.102', 1604272862, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323836323b),
	('5dulvq87e5u25ugjiovg0j0icfsk1d87', '192.168.8.102', 1603909949, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393934383b),
	('5eq26tpttkr55lk6qu8ihfaatrbsugvl', '192.168.8.102', 1603906180, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363138303b),
	('5gaq7dngmbjm2up7j93pvihkhrncdb55', '192.168.8.100', 1604210693, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303639333b),
	('6053eq3np9d5mnmnke7e471io16rg0dm', '192.168.8.100', 1604219405, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393430343b),
	('65tuhj442dg0h6fb8ns99p1nevvhoqbb', '192.168.8.102', 1603906375, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363337353b),
	('691pmjqcl0c6sra4cnl942rlreiu0o1m', '192.168.8.102', 1604275163, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353136333b),
	('69u7egam77hk3m00lc62a0l0llm3fi5h', '192.168.8.102', 1604220297, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303239363b),
	('6baudlshd8cll02mah1idqlim3aqr8cd', '192.168.8.100', 1604218673, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383637333b),
	('6d6btm0fu5lurvh2qn326hhk3evcmp80', '192.168.8.102', 1603908314, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383331343b),
	('6fii3s66q2nk5o2v08p4r5dmg7qaoed0', '192.168.8.102', 1604208239, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383233383b),
	('6n8oi0f8clorfog0lvna8pmqjv2phmfg', '192.168.8.101', 1603874895, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343839343b),
	('6o4jc0oqctra0ct93l85rnp7bo761las', '192.168.8.102', 1604276338, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363333373b),
	('6suv9ft27fnb43e28q09rqr4efedtvvq', '192.168.8.102', 1604269953, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393935333b),
	('73k78osqis14c1ir1v8evoef7s45aech', '192.168.8.102', 1604239366, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336353b),
	('7a7vcpru1s2piou0sq15aeorbklb8scl', '192.168.8.101', 1603878102, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383130323b),
	('7f50vgl741fr1c7bsg6k9ujgqrdisd44', '192.168.8.102', 1603908274, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237333b),
	('7fsvmhrre3n223p52ff85lie8vl6pj52', '192.168.8.101', 1603878509, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383530383b),
	('7jn991mfm74hgeoketcjdcmpikfcbgfu', '192.168.8.100', 1604210612, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303631323b),
	('7lb3nemiie51hie61u8atps1o9rc476a', '192.168.8.101', 1603875262, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353236313b),
	('7rm0opfhqdarbji6khefnsb9t16elkh1', '192.168.8.102', 1603906086, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363038363b),
	('7sbe17s324nn3j2a9ip2jsiranfb3tpr', '192.168.8.100', 1604215505, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353530343b),
	('7sg8jn278cfqejbbj38ij3e943up05cd', '192.168.8.102', 1604269900, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393839393b),
	('7ubtcn4721pqfnlmeh7b9r4f4d0ncegs', '192.168.8.102', 1604276385, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363338343b),
	('82ru4leh1oebummn6t52psn0307a6n03', '192.168.8.101', 1603878960, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383936303b),
	('832avr9lt85uvj1s25c53k7q3hdkhfdf', '192.168.8.101', 1603873553, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333535333b),
	('87pv6ib9ndve9485b8evvph51smmcual', '192.168.8.102', 1604208850, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383835303b),
	('8fcobv25h8o6cds4k3bh5mhir9vuuild', '192.168.8.102', 1604269747, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393734363b),
	('8foeqoqdq1dcmstu9lumfu9rl5ov3688', '192.168.8.102', 1604239619, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393631393b),
	('8frvm6509rcj1s9n8heq22946k3fctiu', '192.168.8.100', 1604218883, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383838323b),
	('8hmh7h6mfihr6v6av21jrufh1lpovn1i', '192.168.8.102', 1604276108, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363130383b),
	('8hmo4ievv24bb8fdkff5ir8vnvmg88mj', '192.168.8.102', 1604208641, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383634313b),
	('8j0e9bf0qskg3i11c6fu2hihv2gvo6aq', '192.168.8.100', 1604211051, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313035313b),
	('8ja7sdhoos3ma7ogc3fnmocoa9dlueij', '192.168.8.102', 1603907775, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373737353b),
	('8lmc44mhe65oe5jk5esjsc97qjgorgq6', '192.168.8.102', 1604238671, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383637313b),
	('8mn7ke7kad89vohbnluu4tc1di9ngvrn', '192.168.8.100', 1604219132, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393133313b),
	('8nefh6p8ct1ijeek045ttgvlqvn8bhjc', '192.168.8.102', 1604268544, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383534343b),
	('977uvqp7meh0b3h0iq4aj24dcjtkcas7', '192.168.8.101', 1603878456, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383435363b),
	('97ll13ckjni6ic8hr3umr4genojrh3v3', '192.168.8.102', 1604268965, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383936343b),
	('97tt5orgagffd86eu56nb6q9aq4qdofl', '192.168.8.101', 1603878372, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383337313b),
	('9876m478v6iph6hp6672d67rp7mpg7b0', '192.168.8.101', 1603878038, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383033383b),
	('9cbjn5q2ltfqemt0mrijrppg3amb6010', '192.168.8.101', 1603877544, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373534343b),
	('9cp05dborl8i09sl01pbs7f6ngd8ikd6', '192.168.8.101', 1603874787, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343738373b),
	('9ohgirckcgtkb2huol7kn67gpnp92oli', '192.168.8.100', 1604217472, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373437313b),
	('9suga6t4lhan70cu88fcm6d61ben6jod', '192.168.8.102', 1604276800, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363830303b),
	('9toakvpvfohuoeks70dam6ml98ta7uds', '192.168.8.102', 1603908927, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383932363b),
	('a1m0crqhos1fj42e960d4nb9ihk55ai2', '192.168.8.101', 1604754315, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331353b),
	('a3cg38jaftom9ssnks99ks5t4bb6913u', '192.168.8.101', 1603878427, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383432373b),
	('a4aj3747mdrohi5i9e7hcmsg50sgtcjg', '192.168.8.102', 1604276364, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336343b),
	('abk9a12o7vesgom43arv001fmhrbti6e', '192.168.8.100', 1604211102, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313130323b),
	('adivfgmae5npbteplv7uu3sr0actnt3u', '192.168.8.100', 1604211135, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313133353b),
	('ai9ilh17g5nl64devumvohob6573od55', '192.168.8.102', 1604208690, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383638393b),
	('aj07mf7mtd5sgrorart2u7m0c3ohl9rg', '192.168.8.102', 1603907984, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373938343b),
	('arr6fqg92157usnfs540cs1ae77qe5pi', '192.168.8.100', 1604210610, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303630393b),
	('as72efpcef41ansn6bh4bdi9pl4kajna', '192.168.8.100', 1604218455, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383435343b),
	('b206qehevloj1vluose4cg56mc1pl8ov', '192.168.8.100', 1604210975, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303937343b),
	('b29qc3rluvkst4ap81ta3meslc41tmgq', '192.168.8.102', 1604208530, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383532393b),
	('b4gasr6adpq2728eopda951aqr0389di', '192.168.8.101', 1603877525, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532343b),
	('b9qolf4634qjdf2pops9qmj59eo62iou', '192.168.8.100', 1604217341, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373334303b),
	('baaskmi6b4hp43fb62mt76dqd1aihmn1', '192.168.8.100', 1604219381, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393338313b),
	('bcsat2gh0dteg9mfmaro1dsebj6dnq6j', '192.168.8.101', 1603877995, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373939353b),
	('bdeb70u9vtk087iop3bq72lihkk35dti', '192.168.8.100', 1604215327, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353332373b),
	('bls319fmpnprsfkr6fqku9nvfkjpr9t0', '192.168.8.102', 1604269549, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393534383b),
	('bnnsg93dlqdfqf4bpo7sbpqgl471s12h', '192.168.8.101', 1603877647, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373634373b),
	('bok46mts8j06cdlsdt6mo2s2urus7dc6', '192.168.8.102', 1604268592, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383539313b),
	('bp6ee3qbb4qjhefqtaine7opaovs61a0', '192.168.8.101', 1603878059, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383035393b),
	('bq1qn4b77uajh3r92k287oed6oeb6re7', '192.168.8.100', 1604211099, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313039393b),
	('bqu24brfjc4s2skefblo1pcpvg1llvfg', '192.168.8.100', 1604217743, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373734323b),
	('bs15k1qhr9i78cmdhlk0uud3khvkr45c', '192.168.8.102', 1603908014, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383031333b),
	('bt5d037slorjv3no9dtqh9l76marqv2j', '192.168.8.101', 1603874786, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343738363b),
	('bve18upklgqqjc1n0qdnf5e4okhec5n2', '192.168.8.102', 1604208751, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383735313b),
	('c0e9h3epa915cnv3qej2aaehfh4vaq6s', '192.168.8.102', 1604219731, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393733303b),
	('c44eb2itovs9cu98uervibu0kcjg8s75', '192.168.8.102', 1603907574, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373537333b),
	('c5g3e6q38lkfios6ugofqejtn5qpl9js', '192.168.8.101', 1603877639, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373633383b),
	('c7s86cdh1lt1abeqd8e5modhafkueslu', '192.168.8.102', 1604218193, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383139333b),
	('c93roiehid4q5t0mi4mf3vuouc1shubq', '192.168.8.102', 1604239409, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393430393b),
	('c9p35ljkk8mor9341nc7sfna27c4q5ds', '192.168.8.102', 1604208321, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383332303b),
	('caue17hj83tl4e8fedhv509h82btav2u', '192.168.8.102', 1604220126, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303132353b),
	('cbmbpv68p0d18377s8ju9lh12ee2a7ue', '192.168.8.102', 1604271235, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233353b),
	('cg2pcu1tdrm7d7ep5vjjnd4q2drmcp2f', '192.168.8.100', 1604219011, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393031313b),
	('chfbe7edgf3a644jcr74hac3fdp94bk4', '192.168.8.102', 1604276349, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363334383b),
	('ckf7kbufmu2cjbm5fv952uoktg93joth', '192.168.8.100', 1604219250, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393235303b),
	('d16dmb75c04nlaclvg44lqoiada679ln', '192.168.8.101', 1603875690, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353638393b),
	('d19cvtedqckf9too008t32b4jucglleq', '192.168.8.101', 1603877560, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373536303b),
	('d5h220ru5ibrfiicie6lv503i351ufkq', '192.168.8.102', 1604208381, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383338303b),
	('dd3j8495gns5fpbjdm2fffcjomrirfe7', '192.168.8.101', 1604754312, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331323b),
	('dehcuov36k77n4e67qm84ttng3flo7b3', '192.168.8.100', 1604215133, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133323b),
	('dgti8kakq2r3l055ruqr4onq9sdn79ss', '192.168.8.101', 1603878239, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383233383b),
	('dj6l09ngbnr6dkp63kj10eufcd7m79cr', '192.168.8.102', 1604208192, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383139323b),
	('dofadg8ij3p69ijk5i14af4v1dlgkpm6', '192.168.8.102', 1603907840, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373834303b),
	('dp1upk4bv263tsl9hk0op75rcno8304n', '192.168.8.101', 1603877835, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373833353b),
	('dpuh0t8uitl4i0vu675clinl3vevamf3', '192.168.8.102', 1604219629, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393632383b),
	('dvf9dkg4mkbgl8nlg4224ujv26ms4m4l', '192.168.8.102', 1604272775, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737353b),
	('e5lgca0c5q653803373ok4i8k69adlf3', '192.168.8.102', 1604220298, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303239383b),
	('e6j7e0cnbpb5of43842gpimr0uvvqkgh', '192.168.8.101', 1603875244, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353234333b),
	('e7nio8fk1jjjltlvbkl1sdnoshi6s1f0', '192.168.8.101', 1603878500, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383530303b),
	('e884evve3cupm8bamgccc230acpnea86', '192.168.8.101', 1603874775, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343737353b),
	('eaam33fge3jh9khkrhhl7723g5csq4h6', '192.168.8.100', 1604219324, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393332333b),
	('ed502u2jb7njp9hc9edaqclcmidf55hk', '192.168.8.102', 1604219797, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393739373b),
	('eeh7m6i3li9bpla1sv5525vluv1aosts', '192.168.8.101', 1603875251, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353235313b),
	('ekd6pn9uinrea0vjl880vossca1jd3de', '192.168.8.102', 1604238574, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383537333b),
	('en9bjuakj9gp6pa7dqnl538g2taafsaa', '192.168.8.102', 1604220017, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303031373b),
	('eq9h87s478anufvqqqb3q3vsr9u2ioip', '192.168.8.102', 1604229056, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393035363b),
	('eqsof8sthtju6t8ci1uk5ssg7e9lsr0o', '192.168.8.102', 1604269236, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393233353b),
	('evujiq9d2r39t3geb61u73itbpsm0dhg', '192.168.8.100', 1604215594, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353539333b),
	('f3hbp8v1m867b7igtedannnqe378elq1', '192.168.8.100', 1604217354, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373335343b),
	('f45fbo67qn4la2ipgg6mjfv0pmn71dce', '192.168.8.100', 1604210972, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303937323b),
	('f6n5n54hvpucide3hmv3op1cden4r325', '192.168.8.100', 1604218572, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383537323b),
	('f9dno2k35ogeq3idormjp5odt34j2f1l', '192.168.8.102', 1604239375, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393337353b),
	('fkd0s7fh27eqhq8m2c4aaeofd917tvkp', '192.168.8.102', 1604276667, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363636363b),
	('fl5l1fddmva5mtbtj08vm8oujetj6egr', '192.168.8.102', 1603907939, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373933383b),
	('fq0esm20q2rqchqgn0m6n19q7gb0agpo', '192.168.8.100', 1604211126, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313132353b),
	('fu3g7fsa9005gp9qt4hbq0g29rf3rm8l', '192.168.8.100', 1604218375, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383337353b),
	('g1gt5lskvp6g6tbkrgofe2sih14t1oif', '192.168.8.102', 1604272860, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323836303b),
	('gijc8uj01jp5eo744moh08fun92e52kb', '192.168.8.102', 1604269756, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393735353b),
	('gijf88gak6apnn3ncuflojqja6ntujoq', '192.168.8.102', 1604269333, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393333323b),
	('gimdvibioutk9m3lur24j3e1r0nq7a6u', '192.168.8.100', 1604215501, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353530313b),
	('gu6m9m1qluc3d1s3kb0vs9b8vmg27sdl', '192.168.8.101', 1603875457, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353435373b),
	('h1qnpboru45qvjocoeruvpfkm1asnp1f', '192.168.8.102', 1603907781, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373738313b),
	('h5bi3jcs6prbka2o1r6gs6dshp139ugr', '192.168.8.102', 1603907780, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373737393b),
	('h79lj553u4lisl0dbpqt8kudt9gsb3lh', '192.168.8.102', 1604269961, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393936313b),
	('h9p4sbe7ctoif3sl37vaqtrd50n99ub3', '192.168.8.102', 1603906169, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363136393b),
	('ha7djamhd0c54i1scrdfic0tjem8lp96', '192.168.8.102', 1604272859, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323835393b),
	('hc17f8fru473j72pb85cutrit759qpvb', '192.168.8.101', 1603873518, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333531373b),
	('he58b0rgiaevvjhllmt425lb1umquk6d', '192.168.8.102', 1604269251, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393235313b),
	('hfqsphq1ma148c5nc8ivhishfpbpcntr', '192.168.8.101', 1603878149, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383134393b),
	('hn1pt8ef3jdmt3bjnjmtmpr67rmnddnh', '192.168.8.101', 1603878220, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383231393b),
	('hnikod09f0s3u9kkh56j83jpjgft9aie', '192.168.8.101', 1603878936, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383933353b),
	('ho18uch7h6v3ohj2ant6j3vgmrhg9nq1', '192.168.8.102', 1604276363, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336333b),
	('hon1027nuvc4g9pcc8a060repe6d6sfv', '192.168.8.101', 1603878987, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383938373b),
	('hs3bes1j70530cednan6rcnisgk66eep', '192.168.8.100', 1604215131, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133313b),
	('i1lgk3t53vich88ul1jl0u3vh72op3ld', '192.168.8.101', 1603874770, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343737303b),
	('i512nmd0ilpfmqop84hgc4vp42up1c2c', '192.168.8.101', 1603878163, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383136333b),
	('i7gbiu5jr622r4thh0ns1lrmgo4kqt27', '192.168.8.102', 1604276767, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363736373b),
	('i95apcr3ad9irnj2je0bbk0kmqbtpl7e', '192.168.8.102', 1604239362, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336313b),
	('i9g3jd6e4qgk3un226gggp1d43iutrtb', '192.168.8.102', 1604239487, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393438373b),
	('i9j179uqmvhlcnhc1m9skjohjoe45din', '192.168.8.102', 1604220921, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303932313b),
	('ibrpqukg8hi27ig5heogftgi166ftj3r', '192.168.8.102', 1604268554, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383535343b),
	('ich3a6p5hv8uv5f0j8sbgk61eki3tl5q', '192.168.8.101', 1603874844, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343834343b),
	('ig9arseuti8f5q3hbkjuq4g29bel8b56', '192.168.8.100', 1604219402, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393430323b),
	('iifkbcscjuhq7aneho866qkuuldsmugg', '192.168.8.102', 1604271250, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313235303b),
	('ir7d7v8c448ap8ruu8upse2ic38jh6ov', '192.168.8.102', 1604218190, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383138393b),
	('itvjgsgea3gsga33g0pv4j79o8t04fub', '192.168.8.102', 1604229145, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393134353b),
	('ivbqo9c8mqafta5hh4vkbsi7g1ji4o16', '192.168.8.100', 1604217339, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373333393b),
	('j6hfjsug4scs0j7jp50gqpmsjn8li2cd', '192.168.8.102', 1604272440, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323434303b),
	('j8qvh9a93qsj6lt9ei7fj5km719278ua', '192.168.8.102', 1604269847, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393834373b),
	('jb56rm24jh535dgh6ugmp3f76enccjeh', '192.168.8.101', 1603879122, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393132323b),
	('jik9lf0mljalousj9ppu1s8e9c8coail', '192.168.8.102', 1603907533, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373533333b),
	('jqhdcn4fabm6jicdmt6em42kp91tgvtd', '192.168.8.100', 1604218712, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383731323b),
	('juiq85qd0si14j8qslfnf9cv1srbffk4', '192.168.8.100', 1604218579, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383537393b),
	('jvc1v2ed8dsvs6i4oo8a5mtcu1125kfm', '192.168.8.100', 1604215099, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353039393b),
	('k0dq3qo6q5ali5qqeoqo6ko04s689dab', '192.168.8.102', 1604275277, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353237373b),
	('k0ii4va55t2fhb3amcim2lnt5j2l6oa7', '192.168.8.101', 1604754319, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331393b),
	('k98olk9fkh83sm1i1ddlv59439gdoqv9', '192.168.8.102', 1603907591, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373539313b),
	('kcdansoonkalrk3mfl5t170ng4v03dpg', '192.168.8.102', 1604239422, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393432313b),
	('kfphihhffc267l7ghfcedqvh7rls6u3k', '192.168.8.100', 1604210919, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303931393b),
	('kjha1pi6kk39eb0rnummm0khqgud0c18', '192.168.8.101', 1603878292, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383239323b),
	('kot60k0q83e50a1m8l7a0p9a4l57ptgp', '192.168.8.101', 1603878435, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383433343b),
	('kqeko87gp7nlom8mji85eok46iqgeavi', '192.168.8.101', 1603878329, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383332383b),
	('l562f166cajvd7egoos5rag8usd8pho6', '192.168.8.102', 1603908913, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383931333b),
	('l66vs51ofl1hav5rc3jjr7hsq7id0jik', '192.168.8.100', 1604218368, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383336383b),
	('laiasbgh07br4ht8i02vqdnnn0r46mkl', '192.168.8.102', 1604220195, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303139353b),
	('lcfc444tteae3dbavt33njosafglfa6c', '192.168.8.102', 1604220360, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303336303b),
	('lcqpiehhe50inhcf52drir01879snhan', '192.168.8.100', 1604215458, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353435373b),
	('lhen3606cfnoa8qkslcn6mn9ar9i2jpb', '192.168.8.102', 1604228297, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383239363b),
	('ljbsjj7994rmqk0v6nq5k36hbbc63d2r', '192.168.8.102', 1603907921, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373932303b),
	('ljsfcoagihmsa6j4ic61nedtdg7e5khs', '192.168.8.102', 1604275076, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353037363b),
	('lrc0jr1cohu60i97h08h065trjotrni7', '192.168.8.102', 1603906235, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363233353b),
	('lrjlqmcjpjk1rv34np2415rvn959lhgn', '192.168.8.102', 1604229089, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393038393b),
	('m72kqv9d2dvks42ocs2scnhjf2852fdh', '192.168.8.102', 1604272855, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323835353b),
	('mfmkl67prrfjs4030l4m1r42h6mafo6o', '192.168.8.102', 1604219149, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393134383b),
	('mkuhke8ahl5i0pmu56tis6lp5gfpkrec', '192.168.8.102', 1604274902, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343930323b),
	('mnchcue1caopi0peg30g92hosjdgkfie', '192.168.8.102', 1604208216, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383231363b),
	('mr2po0kv1rj982ee26v4kt0ifsdj045r', '192.168.8.102', 1604269844, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393834333b),
	('msre5qf603g244aja8dhp8s7uuk4ofmq', '192.168.8.101', 1603877521, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532303b),
	('n0ga9rpop8n433l4ef1hskcu62aercvp', '192.168.8.102', 1604268465, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383436343b),
	('n35o82sijmv3a7nldfelhb3up9epe4qs', '192.168.8.101', 1603873875, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333837353b),
	('n41mjdfb5urcr7e2tft3oatvrp11v4bi', '192.168.8.102', 1604218351, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383335313b),
	('n5r78v92tmbv4j55aukpi27mrc0ek29c', '192.168.8.102', 1604272779, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737393b),
	('n6s7kiq9ulk0brd4fgcli3tjpc65hhap', '192.168.8.101', 1603879111, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393131303b),
	('n75jc0feprlfk14cejilnah6cg26qfd0', '192.168.8.102', 1604275161, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353136303b),
	('n7pmhmq21r9sth4buu6mlecfccpev0na', '192.168.8.101', 1603874792, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739313b),
	('n8ffka7i7ngbk17pn8mnimctcnq1tov9', '192.168.8.101', 1603875261, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353236303b),
	('n8ungb39930d915mtkn98sgf2moj92el', '192.168.8.101', 1603875455, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353435353b),
	('n9ddeiit6d9b1ur6086o0u858pge8uut', '192.168.8.102', 1604271232, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233323b),
	('ndb7b1iuh8cjll1qppgrq5521ftbek14', '192.168.8.100', 1604211002, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313030313b),
	('ndittlm85g0mlj42f495h3hsck2k9p3k', '192.168.8.101', 1603874900, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343839393b),
	('ng4s6lst4r63c0gcj23eintm71q9hebu', '192.168.8.100', 1604214876, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231343837353b),
	('nj7j2h6jgvtv1k5v2g0k95srqrmahmc1', '192.168.8.101', 1603878979, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383937383b),
	('njhrvqsnadh0521j5936b8encktg0tlb', '192.168.8.102', 1604276329, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363332393b),
	('nm6kqfgmt39330o9gbhpscm13kt22hg4', '192.168.8.102', 1604274908, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343930373b),
	('nmbof7noaj694330e05eacokm0rkc5nj', '192.168.8.102', 1603909542, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393534323b),
	('nn8bf4udgsrbpsj64lh6ijq9kndnhm3p', '192.168.8.102', 1603908291, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383239303b),
	('nsilm5taf7609glapla4nh9mj9le2fkf', '192.168.8.102', 1603907587, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373538363b),
	('nu6mo6crpmtjnmrfo5lc58udukus6iqh', '192.168.8.102', 1603907904, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373930333b),
	('o1r93fqb45u8l1ct9jobb6sghgmbkr0l', '192.168.8.102', 1603909237, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393233373b),
	('o3mbs1e4pk9qd832hfropsfkpjk4csc6', '192.168.8.102', 1604219799, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393739393b),
	('od8gc7jujgqh5ts8ai5hhe8l2l6m5sm7', '192.168.8.102', 1604226514, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232363531343b),
	('ofpu268u214lrglne3sqau6cvl2mj3bi', '192.168.8.102', 1604269965, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393936343b),
	('oh53so44abufbndct9t4pn849o28iit6', '192.168.8.100', 1604210697, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303639363b),
	('ovihn7s8inprg4kvoqj2sg54a694oghq', '192.168.8.100', 1604211078, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313037383b),
	('p0avqd2ss6vqk747c3isvr4d8d65rhfn', '192.168.8.101', 1603879099, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393039383b),
	('p1begid7kce6vnu1n3q8p5iahtp6jkfb', '192.168.8.102', 1604268562, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383536313b),
	('p3o9hh6ubolth7i3boilim6a094r02qd', '192.168.8.102', 1604269244, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393234343b),
	('p4cjtjp0317257bne36vuts0diculrsr', '192.168.8.102', 1604272776, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737363b),
	('p7iuddh2it0verhf6von7psv88oqrrnt', '192.168.8.101', 1603877827, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373832373b),
	('p8ppk4129rfv1b1glnhsa5uu4ndmr7dn', '192.168.8.101', 1603877225, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373232343b),
	('paeb3srm1igif6fgrjv23odp54kel60k', '192.168.8.102', 1603908277, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237363b),
	('pbb5ams4mof0k2par0e10fk91ju7m2m7', '192.168.8.102', 1603908255, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383235353b),
	('pbf2f8s6d9f43alpn8u1ppdetu7gucuh', '192.168.8.102', 1603906188, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363138383b),
	('pktkn97hnu7olp9gekjp82mfee2g9er2', '192.168.8.102', 1604268967, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383936373b),
	('pl2acoqmfp5318c8g9ouqnl6ohg1rvm3', '192.168.8.100', 1604219254, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393235333b),
	('pnj3ratu0e8ae9kbe8lc53g2gq5conbb', '192.168.8.102', 1604220192, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303139313b),
	('psfiqon466sn1m9ac4rb31d8hvnsg5hk', '192.168.8.102', 1603906489, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363438393b),
	('pt8e6n9srk1m4ocpt22vs6lfv4d3b5h6', '192.168.8.102', 1604220122, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303132313b),
	('pur5s5qni4i3pv5b15v6i0n6fhir29rb', '192.168.8.102', 1604228420, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383431393b),
	('pvoajdupckicf7a5kmlv09sm6lbc85g9', '192.168.8.100', 1604218648, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383634383b),
	('q17m600fqcalmk60e4u4q3ue04e85d03', '192.168.8.102', 1604271238, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233383b),
	('q4rqf5lj9dgin2arjk452vfsc5d5rud1', '192.168.8.102', 1603908251, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383235313b),
	('qa2q38ls6ho6iolnunbp50n084mfie3g', '192.168.8.101', 1603877497, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373439363b),
	('qcojgap2p47vknpmchcsirpvd27m60no', '192.168.8.102', 1604228969, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383936393b),
	('qhs7tgijg3kr4590tjiq22v0a3n6c0lp', '192.168.8.100', 1604211118, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313131383b),
	('qiv51bj1avmea8u1740i6p8j6tfns7mr', '192.168.8.101', 1603878203, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383230333b),
	('qjuidj1q06om3joamtqlm8lklp6gfmlk', '192.168.8.101', 1603879116, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393131353b),
	('ql5mter4bhhkd7frpt14rfstasva5988', '192.168.8.100', 1604211063, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313036333b),
	('qtat1ocuftnse1fices6trvmmgkh5d3e', '192.168.8.102', 1604221318, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313331373b),
	('r1lqk5acak9cs8l696pobho872sm37t3', '192.168.8.102', 1604220245, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303234353b),
	('r292rje0v6p8hg5dgvmvruf8jvu77vle', '192.168.8.101', 1603878146, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383134353b),
	('r29v3sal3utkt8hbafip621q2klhkf50', '192.168.8.100', 1604215137, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133363b),
	('r4dp36dil1uj0j9pvfio5mkovcgesu1o', '192.168.8.101', 1603878449, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383434383b),
	('ra405m4mm2b9gsrpe45b2iistc44lj98', '192.168.8.101', 1603878493, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383439323b),
	('reoi35d7a8ol0iitmfp33o6q1fqfum5k', '192.168.8.102', 1604221314, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313331343b),
	('rl9mod9ms001lji36sr02nqf9r0df193', '192.168.8.102', 1604269315, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393331343b),
	('rm4op390ggob770kus9icku279p1v9al', '192.168.8.102', 1604208779, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383737393b),
	('rml0shqvsnicgo0rbi2gltanoe0uqta0', '192.168.8.102', 1604229006, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393030363b),
	('rp6vuo6cc1iji1fbuv0d8k3isuv4g8kj', '192.168.8.102', 1604239363, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336333b),
	('s4l7lg0v3ci87er4m4l32stmdlphc1nh', '192.168.8.102', 1604220354, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303335333b),
	('s6imipic4g18f4mh4dmh2hiuja9ck6ag', '192.168.8.102', 1604239393, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393339323b),
	('sbanl4mvo4aeidk4buf594gkdm2k5hnc', '192.168.8.101', 1603877526, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532353b),
	('scm4419mpg99l6u82gd4ti3a98ufqh3m', '192.168.8.102', 1603907750, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373735303b),
	('scmqvfa77tu5o41cdfpd5t24e6raptjt', '192.168.8.102', 1604274793, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343739333b),
	('sh2j6lj5ej11qvmvhhvgb6iaq4v278b8', '192.168.8.100', 1604217216, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373231353b),
	('si3lobicrk3ot41anbqnnb0f33jo2239', '192.168.8.102', 1603907799, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373739393b),
	('skavqsv6ig3j0de3d22djh446rf4rcak', '192.168.8.102', 1604218187, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383138363b),
	('snp39rbffq43lchnas2bvr383cfjgo0p', '192.168.8.102', 1604239587, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393538373b),
	('sq7l3jn8dejfvr57v627m9bc04m98l5g', '192.168.8.101', 1603878301, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383330313b),
	('sqe3damjce39bckknbm1qtdhhhrmk2bq', '192.168.8.101', 1603877641, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373634313b),
	('ssj0oicd6kubcn7aisq86rigm9ddci1a', '192.168.8.100', 1604215600, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353630303b),
	('sud84qgun69tnni12dd23o7egok74egt', '192.168.8.100', 1604218881, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383838303b),
	('svk0fnqvbsf2403tvi0rb2a68oimgrs2', '192.168.8.100', 1604210909, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303930393b),
	('t03ouc99t8k4qrpk4bb51m5g8m7cu9og', '192.168.8.102', 1603906562, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363536323b),
	('t6ghuqig6vtnrnovcek91seb0e9ktlds', '192.168.8.102', 1604364803, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343336343830323b),
	('tbub9uof0udpd1empg07otru7407i98i', '192.168.8.102', 1604208651, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383635313b),
	('timtgaet9io027ih9dn9bmcso2ml76mv', '192.168.8.101', 1603875276, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353237353b),
	('tjfqoclkjhg73ri0i3l457q1arc3mvml', '192.168.8.100', 1604215339, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353333383b),
	('tlt358uf7lud8djjl1iq538g9odse7pr', '192.168.8.102', 1603907766, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373736363b),
	('tmmtviad984r5rfkp6gilsh9u89f2db6', '192.168.8.102', 1603907801, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373830303b),
	('tvi4g2j5dkcisi0cclgkgpof8pfh12ta', '192.168.8.100', 1604215465, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353436343b),
	('u1gjdaore2s6cpmqr563mksn5q5lqv63', '192.168.8.101', 1603874799, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739383b),
	('u23vnkjhki28d9ce3t8fs7mn5c5j61ru', '192.168.8.100', 1604218668, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383636373b),
	('u3me9nak6mrlqeitnr6lftmrqg1imqm4', '192.168.8.102', 1604228459, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383435383b),
	('u3ojo2fg9d200tph2396ou77hds7blcl', '192.168.8.101', 1603875470, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353437303b),
	('u79gmhuhmupknupch1gkv54qa7ittumt', '192.168.8.102', 1603907788, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373738383b),
	('u7n4nq422rqr3725unalvk5bhf6c55u3', '192.168.8.102', 1603905890, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930353838393b),
	('ua1iovk3g7ddhlp8picjl4dumlc4vdid', '192.168.8.101', 1603878175, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383137353b),
	('ub7l5v60rq6tagkfu9navq0imfpe1t6h', '192.168.8.102', 1604276804, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363830343b),
	('ucb1sornjo43n689oba0qtdv083u233i', '192.168.8.102', 1603908563, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383536323b),
	('ugpvle388a54ulo41v6gvei4g6to71qq', '192.168.8.102', 1604208830, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383832393b),
	('ugsp7mqq0q9bf4pdjlmb71fb7itdt6qt', '::1', 1605763891, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353736333839313b),
	('uiaducnq9fcvpckojm388q0me3cuota5', '192.168.8.102', 1604276368, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336383b),
	('uj3sjdk6nl4m8f633gup2md2flfv3rnc', '192.168.8.100', 1604215498, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353439373b),
	('ukk35nqc0r7fsr86f6596ukpdb3g9lor', '192.168.8.101', 1603878207, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383230363b),
	('uv0efb8cg74r9hb6lnrhuvdii6ihd11a', '::1', 1603943085, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333934323931353b),
	('uvleaqsdoemtpacgetbt6pcfr526o2qi', '192.168.8.101', 1603878459, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383435393b),
	('v96emvt9np8go30ler91f4p8d6r4trbo', '192.168.8.102', 1604272871, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323837303b),
	('vd8j9noi49vnfjtftssfhns14f2h5f8q', '192.168.8.102', 1604269311, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393331303b),
	('vdrp4usjj968upjq6gbdg26paiqp86dc', '192.168.8.100', 1604219129, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393132383b),
	('vereq4p8se8i79h5jqil2mqgec50uksb', '192.168.8.102', 1604229161, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393136303b),
	('vjmqhc2s217238jsgbnk4mtcu17qduil', '192.168.8.102', 1604364749, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343336343734393b),
	('vug0gni5j63kmkq7j7luur0klb0h5o3k', '192.168.8.102', 1603908273, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237323b),
	('vvuev029l0kgrdcl61tns9r8438apr72', '192.168.8.102', 1604269984, _binary 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393938333b);
/*!40000 ALTER TABLE `ci_session` ENABLE KEYS */;

-- Dumping structure for table kasir.log_barang
DROP TABLE IF EXISTS `log_barang`;
CREATE TABLE IF NOT EXISTS `log_barang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barang_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.log_barang: ~0 rows (approximately)
DELETE FROM `log_barang`;
/*!40000 ALTER TABLE `log_barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_barang` ENABLE KEYS */;

-- Dumping structure for table kasir.penjualan
DROP TABLE IF EXISTS `penjualan`;
CREATE TABLE IF NOT EXISTS `penjualan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` datetime NOT NULL,
  `total_harga_jual` double DEFAULT NULL,
  `total_harga_beli` double DEFAULT NULL,
  `bayar_tunai` double DEFAULT NULL,
  `nama_pembeli` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.penjualan: ~3 rows (approximately)
DELETE FROM `penjualan`;
/*!40000 ALTER TABLE `penjualan` DISABLE KEYS */;
INSERT INTO `penjualan` (`id`, `tgl`, `total_harga_jual`, `total_harga_beli`, `bayar_tunai`, `nama_pembeli`, `created_user_id`) VALUES
	(1, '2020-11-02 08:00:54', 3600, NULL, NULL, NULL, NULL),
	(2, '2020-11-02 08:40:39', 2000, NULL, NULL, NULL, NULL),
	(3, '2020-11-03 07:18:46', 26000, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `penjualan` ENABLE KEYS */;

-- Dumping structure for table kasir.penjualan_detail
DROP TABLE IF EXISTS `penjualan_detail`;
CREATE TABLE IF NOT EXISTS `penjualan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penjualan_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.penjualan_detail: ~4 rows (approximately)
DELETE FROM `penjualan_detail`;
/*!40000 ALTER TABLE `penjualan_detail` DISABLE KEYS */;
INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `qty`, `harga_beli`, `harga_jual`) VALUES
	(1, 1, 260, 12, NULL, 300),
	(2, 2, 281, 4, NULL, 500),
	(3, 3, 258, 84, NULL, 250),
	(4, 3, 259, 2, NULL, 2500);
/*!40000 ALTER TABLE `penjualan_detail` ENABLE KEYS */;

-- Dumping structure for table kasir.penjualan_log_bayar
DROP TABLE IF EXISTS `penjualan_log_bayar`;
CREATE TABLE IF NOT EXISTS `penjualan_log_bayar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` datetime DEFAULT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `bayar_tunai` double DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.penjualan_log_bayar: ~0 rows (approximately)
DELETE FROM `penjualan_log_bayar`;
/*!40000 ALTER TABLE `penjualan_log_bayar` DISABLE KEYS */;
/*!40000 ALTER TABLE `penjualan_log_bayar` ENABLE KEYS */;

-- Dumping structure for table kasir.satuan
DROP TABLE IF EXISTS `satuan`;
CREATE TABLE IF NOT EXISTS `satuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.satuan: ~12 rows (approximately)
DELETE FROM `satuan`;
/*!40000 ALTER TABLE `satuan` DISABLE KEYS */;
INSERT INTO `satuan` (`id`, `nama`, `keterangan`) VALUES
	(1, 'PCS', 'Pieces, Ukuran terkecil'),
	(2, 'RIM', '500 Lembar'),
	(3, 'GROSS', '144 PCS'),
	(4, 'KODI', '20 PCS'),
	(5, 'LUSIN', '12 PCS'),
	(6, 'PAK', NULL),
	(7, 'SLOP', NULL),
	(8, 'BOX', NULL),
	(9, 'ROLL', NULL),
	(10, 'METER', NULL),
	(11, 'RENTENG', NULL),
	(12, 'PAKET', NULL);
/*!40000 ALTER TABLE `satuan` ENABLE KEYS */;

-- Dumping structure for table kasir.satuan_konversi
DROP TABLE IF EXISTS `satuan_konversi`;
CREATE TABLE IF NOT EXISTS `satuan_konversi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asal` int(11) DEFAULT NULL,
  `tujuan` int(11) DEFAULT NULL,
  `pengali` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.satuan_konversi: ~0 rows (approximately)
DELETE FROM `satuan_konversi`;
/*!40000 ALTER TABLE `satuan_konversi` DISABLE KEYS */;
/*!40000 ALTER TABLE `satuan_konversi` ENABLE KEYS */;

-- Dumping structure for table kasir.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('admin','kasir') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bagian` enum('A','B') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table kasir.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `level`, `bagian`, `firebase_token`) VALUES
	(1, 'fotocopy', '598c4f3b1fbe651ca58a31f2b09a380071c4cca2', 'kasir', 'A', 'cQv6eicPTDeZQiuBqY9c9-:APA91bEUbMvbTNGakQD2lT1Z2pRl_7Vt0O8bT47U5SseIq8Mo_2-Q5UX910_jtHY7iWtsVK_XzBWbY05N1mqHKCkjTNdnfKe1xmrE5LkNqfApCb_rWCTIWhIeR4xoA8Jrx_AdLulfade'),
	(2, 'toko', '67e6ea6352359c16b3964bced760498ebc00ce10', 'kasir', 'B', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
