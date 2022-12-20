-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 19, 2021 at 03:17 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id17106548_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `api_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `controller` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` date DEFAULT NULL,
  `date_modified` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `api_limit`
--

CREATE TABLE `api_limit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uri` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
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
  `tgl_update` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `foto`, `barcode`, `nama`, `satuan_id`, `harga_beli`, `harga_jual`, `stok_qty`, `keterangan`, `bagian`, `terhapus`, `tgl_update`) VALUES
(1, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2\"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(2, '2e884ddb-0e28-415a-a6d7-a54bfd5a3447.png', '8991389301692', 'BUKU HARD COVER QUARTO 100 PPL', 6, 0, 9000, 0, 'isi 5 buku', 'A', 'N', '2020-10-29 08:44:09'),
(3, '85c6f63b-6893-4dd4-9d93-b293f485b6cd.png', '4974052815522', 'BOLPEN ARTLINE GOLD 1900', 1, 4000, 7000, -1, '', 'A', 'N', '2020-11-02 07:19:44'),
(4, 'placeholder.png', NULL, 'SPIDOL SNOWMAN GP-12 GOLD', 1, 0, 0, 0, NULL, 'A', 'Y', '2020-10-29 03:26:54'),
(5, 'placeholder.png', NULL, 'TIPEX KIRIKO 0810', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(6, 'placeholder.png', NULL, 'TEPAK MAGNET MC-8088 TIMBUL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(7, 'placeholder.png', NULL, 'KOTAK PENSIL MAGNET JUMBO KT-1017', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(8, '0ed0cfeb-6fe1-462f-9e73-56aa738c6755.png', '', 'PLAKBAN LINEN SKM 1,5\"', 1, 8750, 11500, -1, 'ukuran sedang', 'A', 'N', '2021-09-26 08:47:54'),
(9, 'placeholder.png', NULL, 'TIPEX SAFARI SF-177/188', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(10, 'placeholder.png', '', 'KERTAS STIKER GLOSSY VANCO A4', 6, 19000, 25000, 0, 'kertas sticker, stiker', 'A', 'N', '2020-10-30 08:34:41'),
(11, 'placeholder.png', '', 'KERTAS FOTO GLOSSY BLUE PRINT A4 230gsm', 1, 0, 0, 0, '', 'A', 'N', '2020-11-01 02:41:54'),
(12, 'placeholder.png', NULL, 'AMPLOP PPL 90', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(13, 'placeholder.png', '', 'MIKA COVER BENING', 1, 0, 28500, 0, '', 'A', 'N', '2021-09-24 08:41:53'),
(14, 'placeholder.png', NULL, 'KERTAS DOUBLE FOLIO SIDU 100', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:20'),
(15, 'placeholder.png', NULL, 'LAMINATING V-TEC 100mic', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(16, 'placeholder.png', NULL, 'KERTAS BUFALLO PHYTON HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:33'),
(17, 'placeholder.png', NULL, 'BUKU AGENDA 1732 32K', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:50:08'),
(18, 'placeholder.png', NULL, 'BUKU AGENDA 6832', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:50:14'),
(19, '00ca9680-0b2a-4c07-9627-55631ed9010b.png', '', 'SIMPOA TANGGUNG 8590', 1, 0, 18000, 0, 'drawing and writing board 8950', 'A', 'N', '2021-09-04 00:19:28'),
(20, 'placeholder.png', NULL, 'CRAYON APIK 12W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(21, 'placeholder.png', NULL, 'PITA KADO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(22, 'placeholder.png', NULL, 'PITA MERAH PUTIH 1\"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(23, 'placeholder.png', NULL, 'STAPLER DELI no.0329', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(24, 'placeholder.png', NULL, 'BOLPEN TG 340 HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(25, 'placeholder.png', NULL, 'BUKU KWARTO 100 VISION', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:53:48'),
(26, 'placeholder.png', '', 'BUKU HARD COVER FOLIO 100 PPL', 1, 0, 0, 0, '', 'A', 'N', '2020-10-29 03:06:52'),
(27, '172e0676-7722-423d-a1d3-29d55039666a.png', '8991389308233', 'KWITANSI PAPERLINE KECIL KT 40M', 1, 0, 3500, 0, '', 'A', 'N', '2020-10-22 13:54:58'),
(28, 'placeholder.png', NULL, 'ISI CUTTER BESAR KENKO L150', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(29, 'c70a5c9e-69a9-4d15-b8e1-fe1dd1f71c26.png', '6957990901395', 'MEMO STICK VS MS 01', 6, 0, 16000, 0, '', 'A', 'N', '2020-10-24 05:05:57'),
(30, '258c2b90-771e-4319-bf52-109ccfbe3df4.png', '', 'BUKU TULIS VISION 38', 6, 0, 28000, 0, 'isi 10 buku', 'A', 'N', '2021-09-28 23:28:20'),
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
(47, 'placeholder.png', '', 'BINDER CLIP LINKO 200', 6, 0, 13000, 0, 'eceran 1500', 'A', 'N', '2021-09-25 05:11:35'),
(48, 'placeholder.png', NULL, 'BINDER CLIP LINKO 107', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(49, 'placeholder.png', NULL, 'BINDER CLIP SMILE 155', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(52, 'placeholder.png', '', 'BINDER CLIP LINKO 260', 1, 0, 2250, 0, '', 'A', 'N', '2021-09-24 06:13:01'),
(53, '0fa4140d-7128-42a9-8fbf-fd3a7b4126b1.png', '', 'PENSIL 2B FABER CASTELL', 1, 0, 4500, 0, '', 'A', 'N', '2020-10-24 05:04:35'),
(54, 'placeholder.png', '', 'BUKU TULIS VISION 32', 6, 0, 21000, 0, '', 'A', 'N', '2020-10-22 09:24:47'),
(55, '423402ad-618b-40db-bf5b-2c680b75517d.png', '8993988060130', 'CUTTER JOYKO L-500 SG', 1, 0, 23000, 0, '', 'A', 'N', '2020-10-22 00:18:59'),
(56, 'placeholder.png', '', 'BUKU HARD COVER OKTAVO 100 PPL', 1, 0, 0, 0, '', 'A', 'N', '2020-10-29 03:09:17'),
(57, 'placeholder.png', NULL, 'SAMPUL OPP BIG DLX 0,5 KWARTO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(59, 'placeholder.png', '', 'BUKU GAMBAR SIDU A3', 1, 0, 8500, 0, 'buku gambar besar', 'A', 'N', '2021-08-29 12:35:28'),
(61, 'placeholder.png', NULL, 'KERTAS DOUBLE FOLIO SIDU 200 TEBAL 70gsm', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-27 22:54:27'),
(62, 'placeholder.png', NULL, 'TIPEX JOYKO CF-S209A', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(63, 'placeholder.png', NULL, 'TINTA YAMURA STANDART VIOLET', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(65, '1d452f4e-61ca-478e-b0b4-f5bf558771be.png', '', 'PENGGARIS BUTTERFLY 30CM', 1, 0, 3500, 0, '', 'A', 'N', '2020-10-23 06:24:02'),
(66, '2360d83f-12b0-4291-93b0-a18346917e5e.png', '', 'BUKU NOTA RANGKAP 1', 1, 0, 3500, 0, '', 'A', 'N', '2021-09-12 11:18:01'),
(67, 'e38b0d3e-03eb-44f5-a2b9-13b83cb51f5b.png', '', 'KERTAS LABEL HARGA 112 PHOENIX', 6, 0, 5000, 0, '', 'A', 'N', '2020-10-24 02:45:47'),
(68, 'feda7773-117e-4937-9dfc-60731c5a4be7.png', '8991389248034', 'NOTA KONTAN PAPERLINE RANGKAP 2 (Eceran)', 1, 0, 4000, 0, 'NOTA PAPERLINE NK K2 NCR TK', 'A', 'N', '2021-08-29 08:18:21'),
(69, 'placeholder.png', NULL, 'KALKULATOR RERISAI PE-812BC', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(70, 'placeholder.png', NULL, 'KOTAK PENSIL KARTON KK-3C4D-08', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(71, 'placeholder.png', NULL, 'STICKNOTE MONTANA 213', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(72, 'placeholder.png', NULL, 'PENSIL TABUNG  SW-2116', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(73, 'placeholder.png', NULL, 'STICKNOTE BIG 76 X 51 5W', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(74, 'placeholder.png', NULL, 'STABILLO GM-3001', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(75, 'placeholder.png', NULL, 'BOLPEN WEIYADA E681 BIRU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(76, 'placeholder.png', '', 'MAP JARING SW 3809 MERAH', 1, 0, 15000, 0, '', 'A', 'N', '2021-09-28 23:26:42'),
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
(93, 'placeholder.png', '', 'BOLPEN 4W TRIFELO TF-729', 1, 0, 5000, 0, 'bolpen 4 warna trifelo', 'A', 'N', '2021-09-25 05:15:42'),
(94, 'placeholder.png', NULL, 'BOLPEN HY Q6032', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(95, '7b1744dc-2772-4059-863c-77526637b36c.png', '4970129754015', 'BOLPEN SNOWMAN V7', 5, 0, 26000, 0, '', 'A', 'N', '2020-10-23 06:21:37'),
(96, 'placeholder.png', NULL, 'BOLPEN SAFARI SF-979', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(97, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 1,5\" MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
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
(148, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2\" MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(149, 'placeholder.png', NULL, 'BK TULIS SINAR DUNIA 58', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(150, 'placeholder.png', NULL, 'BK TULIS SINAR DUNIA 78', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(151, 'placeholder.png', NULL, 'TEPAK PENSIL MIKA', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(152, '3ab2838e-4ed7-442c-b484-24ea5735d190.png', '', 'KERTAS KARBON DAITO', 1, 0, 2000, 0, 'carbon paper merk daito eceran', 'A', 'N', '2021-09-29 11:48:26'),
(153, 'placeholder.png', NULL, 'CLIP BOARD BENING LINKO', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(154, 'f38fe59a-d5aa-4da2-be57-324e55cffe85.png', '', 'AGENDA ERICA 156', 1, 0, 5000, 0, '', 'A', 'N', '2020-10-22 14:08:12'),
(155, 'placeholder.png', NULL, 'BOLPEN TG346', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(156, 'placeholder.png', NULL, 'BOLPEN IPEN-X SF-2019', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(157, 'placeholder.png', NULL, 'BOLPEN K7 FABER CASTEL', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(158, 'placeholder.png', NULL, 'BOLPEN PILOT BPT-P HITAM', 1, 0, 0, 0, NULL, 'A', 'Y', '2021-09-03 23:13:44'),
(159, 'placeholder.png', NULL, 'PITA MERAH PUTIH 1/2\"', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(160, 'placeholder.png', NULL, 'HVS MAXI BRITE F4 70 GSM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(161, 'placeholder.png', NULL, 'RAUTAN 388A', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(162, 'placeholder.png', NULL, 'MAP KANCING FOLDER 1 MERAH', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(163, 'placeholder.png', NULL, 'BK KAS FOLIO 100 3K KIKY', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(164, 'placeholder.png', '', 'STABILLO SUNWELL HL-500', 1, 0, 3500, 0, '', 'A', 'N', '2021-09-25 05:16:43'),
(165, 'placeholder.png', NULL, 'SPIDOL SNOWMAN PW1A HITAM', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
(166, 'placeholder.png', '', 'BUFALLO PHYTON PUTIH', 1, 0, 27500, 0, '', 'A', 'N', '2021-09-08 00:34:18'),
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
(179, 'placeholder.png', NULL, 'PLAKBAN LINEN SKM 2\" HIJAU', 1, 0, 0, 0, NULL, 'A', 'N', '2020-10-22 09:24:47'),
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
(259, 'placeholder.png', '', 'JILID (PONDOK)', 1, 0, 3000, -47, '', 'A', 'N', '2021-08-29 12:05:02'),
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
(270, 'placeholder.png', '', 'JASA LAMINATING (PONDOK)', 1, 0, 3000, 0, '', 'A', 'N', '2021-08-29 12:00:52'),
(271, 'placeholder.png', '', 'JASA LAMINATING (UMUM)', 1, 0, 4000, 0, '', 'A', 'N', '2020-10-30 06:30:39'),
(272, 'a02fdd84-46f4-4b83-99c6-99422ee7eabd.png', '9789791680028', 'BUKU  SHERLOCK HOLMES KELOMPOK LINGKARAN MERAH', 1, 12750, 15000, 1, 'keterangan', 'A', 'N', '2020-10-27 22:52:39'),
(274, 'placeholder.png', '', 'LEM GLUVINAL BESAR', 1, 0, 5000, 0, '', 'A', 'N', NULL),
(275, 'a98c8d28-00cc-4b04-bd01-47f4872f267a.png', '8993242600997', 'KERTAS F4 APRIL PPLITE 75g/m2', 2, 0, 50000, 0, '', 'A', 'N', '2021-08-29 12:05:48'),
(276, 'bda8814f-7a44-4c56-b30a-b4a24059ae44.png', '8991389308035', 'NOTA KONTAN PAPERLINE RANGKAP 2', 6, 0, 34000, 0, 'NOTA KONTAN PAPERLINE PPL NK K2 NCR', 'A', 'N', '2021-09-28 01:11:06'),
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
(317, 'c2792fd9-2615-497d-a295-73e0d9ee8108.png', '6956953519707', 'BOLPEN SF-979 SAFARI GEL PEN', 5, 0, 23000, 0, 'isi 12 pcs', 'A', 'N', '2021-09-03 21:18:03'),
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
(329, 'placeholder.png', '', 'FOTO COPY BOLAK BALIK (PONDOK)', 1, 0, 350, 0, '', 'A', 'N', NULL),
(330, '41703cb1-8f21-4d1f-9da1-0f02f2e8bbcd.png', '', 'KAPUR TULIS WARNA PUTIH', 1, 0, 5000, 0, '', 'A', 'N', '2021-09-22 11:22:50'),
(331, 'ea858312-ab8e-4e97-abd3-414f2feed3ec.png', '', 'PEMOTONG KUKU', 1, 0, 4000, 0, '', 'A', 'N', NULL),
(332, 'placeholder.png', '', 'FOTOCOPY PONDOK SATU SISI', 1, 0, 260, 0, '', 'A', 'N', NULL),
(333, 'placeholder.png', '', 'FOTOCOPY PONDOK 2 SISI', 1, 0, 360, 0, '', 'A', 'N', NULL),
(334, 'placeholder.png', '', 'FOTOCOPY UMUM 1 SISI', 1, 0, 300, 0, '', 'A', 'N', NULL),
(335, 'placeholder.png', '', 'FOTOCOPY UMUM 2 SISI', 1, 0, 400, 0, '', 'A', 'N', NULL),
(336, 'placeholder.png', '', 'KERTAS MANILA', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(337, 'placeholder.png', '', 'MIE INSTANT KUAH', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(338, '77b3b0b9-9ee9-4ea5-a7ca-dd6469894e12.png', '8997006400069', 'PENGHAPUS PAPAN TULIS', 1, 0, 7000, 0, '', 'A', 'N', '2021-08-31 00:35:41'),
(339, 'c9b15306-7b73-4ccd-b2d5-68ceb2abfcb3.png', '8997226730052', 'ISI STAPLES', 1, 0, 2000, 0, 'refill staples', 'A', 'N', '2021-10-17 11:58:17'),
(340, 'a6f65fa2-67ee-470f-b055-c1f758aa59d9.png', '', 'REX RX 107 TAS PLASTIK', 1, 0, 5000, 0, '', 'A', 'N', '2021-09-04 00:16:31'),
(341, 'f06909ac-1f45-4aa8-a9ad-5cd51a5df16c.png', '6970873897523', 'BOLPEN COMPASS', 1, 0, 2500, 0, '', 'A', 'N', NULL),
(342, '49dc10e9-e36f-44d7-ae65-d2bc196b1bc6.png', '8994793005774', 'FORTE A5 TAB DIVIDER', 1, 0, 6500, 0, 'pembatas buku binder', 'A', 'N', NULL),
(343, '8cc1b8b0-8f57-454e-aaa9-0db7cd719a80.png', '', 'BUKU TABUNGAN KECIL', 1, 0, 1000, 0, '', 'A', 'N', NULL),
(344, 'ec4309ad-74ba-44b5-8a7f-ca2bf7ce9bfb.png', '4005401158523', 'CRAYON PANJANG FABER CASTELL', 1, 0, 33000, 0, '', 'A', 'N', '2021-09-01 14:20:17'),
(345, '74f61faa-ccf6-4276-a642-f563407afb89.png', '', 'KERTAS STICKER VAN ART', 1, 0, 25000, 0, '', 'A', 'N', NULL),
(346, 'f13049d4-a3d1-4fba-ab22-04058df8867e.png', '8991389241592', 'BUKU HARDCOVER PAPERLINE 100 LEMBAR', 1, 0, 15000, 0, '', 'A', 'N', NULL),
(347, '762fc1bb-1c95-4aeb-81a7-435d6580f76f.png', '8991389144756', 'KERTAS F4 AONE 1 RIM', 2, 0, 50000, 0, '', 'A', 'N', NULL),
(348, '69f15310-3fcd-4c48-a54c-a3447c31534b.png', '', 'JASA CETAK KARTU VAKSIN', 1, 0, 7500, 0, '', 'A', 'N', '2021-09-17 01:05:22'),
(349, 'd483b379-c7c4-4c65-975c-5050edba2a44.png', '8991389247013', 'AMPLOP BUKLET PUTIH 90 PPS PAPERLINE', 6, 0, 25000, 0, 'harga ecer 500', 'A', 'N', '2021-09-04 09:53:02'),
(350, '724372fe-c8d2-4aa1-ac90-0f89790cb95c.png', '6956953519707', 'BOLPEN SF-979', 6, 0, 23000, 0, 'bolpen pulpen safari brand black pearl sf 978 ukuran 0.5', 'A', 'Y', '2021-09-03 21:17:44'),
(351, 'placeholder.png', '8993988060055', 'JOYKO ISI CUTTER L-150', 6, 0, 7000, 0, 'isi cutter joyko; cutter blade', 'A', 'N', NULL),
(352, '7e4d9f04-c39b-48b5-8dc9-2b5c4c57471b.png', '6932124701256', 'VIS 1 TRIGONAL CLIPS NO 3', 6, 0, 2000, 0, '', 'A', 'N', '2021-09-03 21:26:41'),
(353, '487cec84-d80b-4a85-9d9b-24d74d12d87f.png', '', 'BOLPEN PILOT BPT-P BLACK', 1, 0, 3000, 0, 'bolpen pulpen pilot hitam bpt-p ball point pen', 'A', 'N', '2021-09-04 00:16:54'),
(354, '8668338c-dc32-42f1-bb71-92e282934117.png', '', 'ALQURAN KECIL TERJEMAHAN YASMINA', 1, 0, 60000, 0, '', 'A', 'N', '2021-09-04 02:50:44'),
(355, '379a5ef1-2a4b-4b77-ab10-07debd70a096.png', '', 'ISI PENSIL', 6, 0, 2000, 0, 'isi ulang pensil', 'A', 'N', NULL),
(356, 'df344580-a56d-433b-8f74-ffc6eb967397.png', '6979971903884', 'TEPAK KOTAK PENSIL KK-338-1', 1, 0, 29000, 0, '', 'A', 'N', NULL),
(357, 'placeholder.png', '', 'LARUTAN CAP KAKI TIGA ANAK KALENG', 1, 0, 6000, 0, '', 'A', 'N', NULL),
(358, '7679d2a0-5c9d-4d5f-9e42-36b6f5c6c12b.png', '', 'LINKO BINDER CLIPS NO 200 ECERAN', 1, 0, 2000, 0, 'harga eceran 1 pcs', 'A', 'N', NULL),
(359, '9283cfd2-75be-48f5-aa2e-bd3b227cf1c3.png', '8886008101053', 'AQUA KECIL 600ML DINGIN', 1, 0, 3500, 0, '', 'A', 'N', NULL),
(360, '90ca56e8-9c65-44c3-b21f-08520e44e97b.png', '8998667100763', 'JESSCOOL TABLET EFFERVESCENT', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(361, '7acff655-d455-4ece-9b88-280b0e8c7646.png', '8992770061034', 'SAJIKU TEPUNG BUMBU', 1, 0, 1500, 0, '', 'A', 'N', NULL),
(362, 'b17e4723-77df-4d04-946f-d9aa4219135c.png', '8991389241608', 'BUKU TULIS SAMPUL TEBAK ISI 200 LEMBAR', 1, 0, 35000, 0, '', 'A', 'N', NULL),
(363, '557011d9-bb31-43fe-9916-547865e18756.png', '8991389241585', 'BUKU TULIS SAMPUL TEBAL ISI 100 LEMBAR', 1, 0, 20000, 0, '', 'A', 'N', NULL),
(364, 'c60abe73-e909-4489-bbf6-fa8f9d1c858d.png', '8995757223203', 'BK FOLIO KAS 3K 100', 1, 0, 25000, 0, '', 'A', 'N', NULL),
(365, 'f22e228c-5c30-45bd-a528-fdcb147e267d.png', '8991389232033', 'LOOSE LEAF B5 ISI 100 LEMBAR MERK BIG BOSS', 1, 0, 11000, 0, '', 'A', 'N', NULL),
(366, '91d91e4b-c36a-433a-a1a0-17e5e8acb9b2.png', '8991389242049', 'LOOSE LEAF B5 ISI 100 LEMBAR MERK PAPERLINE', 1, 0, 10000, 0, '', 'A', 'N', '2021-09-22 11:17:24'),
(367, 'bcd523e9-510a-458c-a311-5e46dc7fe382.png', '8994793005798', 'FORTE B5 TAB DIVIDER', 1, 0, 7500, 0, 'pembatas buku b5 isi 10 merk forte', 'A', 'N', NULL),
(368, '36e64f08-7327-42ce-8d8f-6e6d931a8006.png', '', 'TALI KOOR PRAMUKA', 1, 0, 6500, 0, '', 'A', 'N', NULL),
(369, '6f92bca0-a08f-44b3-a6c9-080861902dbd.png', '6955114619393', 'POLPEN BATIK', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(370, 'placeholder.png', '', 'KERTAS BUFALO PUTIH ', 6, 0, 27500, 0, '', 'A', 'N', NULL),
(371, 'f385e070-ed70-4ec3-ac72-7481f58fa3b2.png', '', 'COLORING BOOK ', 1, 0, 4500, 0, '', 'A', 'N', NULL),
(372, '9ecde256-335f-4a12-a61a-c4120f1bbd4a.png', '8993988270157', 'JOYKO TWIST CRAYON 12 COLORS', 6, 0, 31000, 0, 'krayon putar', 'A', 'N', '2021-09-25 05:14:44'),
(373, '00319f5a-868e-477d-ade2-37131b3da5b6.png', '', 'NACHI TAPE', 1, 0, 14000, 0, 'isolasi bening besar', 'A', 'N', NULL),
(374, '9730f0bd-9972-46df-b1dc-b75872ac0164.png', '', 'NACHI MASKING TAPE 48MM', 1, 0, 14000, 0, 'isolasi kertas ukuran 48 mm', 'A', 'N', NULL),
(375, 'placeholder.png', '', 'NACHI MASKING TAPE 24MM', 1, 0, 7500, 0, '', 'A', 'N', NULL),
(376, 'placeholder.png', '', 'KERTAS BURAM', 2, 0, 32500, 0, 'kertas buram isi 500 lembar', 'A', 'N', NULL),
(377, 'placeholder.png', '', 'ISI LEM TEMBAK', 1, 0, 1500, 0, '', 'A', 'N', NULL),
(378, '2216ae59-2ad3-4081-ac23-1baefba09430.png', '', 'NOTA KONTAN PAPERLINE RANGKAP 1 (Eceran)', 1, 0, 3500, 0, '', 'A', 'N', NULL),
(379, '174257a5-e4c8-41c6-afbf-35904d2f6d17.png', '8999908285003', 'BODREX EXTRA', 6, 0, 3000, 0, 'harga 1 plex', 'A', 'N', NULL),
(380, 'placeholder.png', '', 'KERTAS MINYAK', 6, 0, 1000, 0, 'per pak isi 7', 'A', 'N', NULL),
(381, 'placeholder.png', '', 'MIE SUKSES', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(382, 'placeholder.png', '', 'GALON + ISI AQUA', 1, 0, 21000, 0, '', 'A', 'N', NULL),
(383, 'placeholder.png', '', 'AQUA KECIL 600ML', 1, 0, 3000, 0, '', 'A', 'N', NULL),
(384, 'placeholder.png', '', 'AQUA 1.5L ', 1, 0, 6000, 0, '', 'A', 'N', NULL),
(385, 'ec66ddd5-ead5-4b5e-91ab-35c82b6207fb.png', '8994151710623', 'MAP BISNIS REX RX-106 FC', 1, 0, 3500, 0, 'business file / map snail', 'A', 'N', NULL),
(386, 'placeholder.png', '', 'KERTAS KLOBOT', 1, 0, 1500, 0, 'kertas berwarna untuk membuat hiasan maulud', 'A', 'N', '2021-10-09 02:55:26');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `isi` text COLLATE utf8mb4_unicode_ci DEFAULT '',
  `tgl_buat` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`id`, `user_id`, `isi`, `tgl_buat`) VALUES
(1, 1, 'lina hutang 5500', '2021-08-29 15:17:33'),
(2, 1, '', '2021-08-31 08:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `ci_session`
--

CREATE TABLE `ci_session` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `data` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_session`
--

INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00uklfrlmoeihl370rd2vpencfvmjkke', '112.215.243.145', 1630635696, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633353639363b),
('019d8j681kfk82ng474erkdf1cpsg435', '112.215.237.208', 1633430876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303837363b),
('075iaggdqi4ck4hag7lff2ph0vkmnj8u', '112.215.154.250', 1632308880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383838303b),
('0bamt9min0mk93gh84obh2sht7helr1r', '192.168.8.100', 1604217234, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373233333b),
('0bdi4quemu674uvu97uassu5f84ei6g3', '192.168.8.102', 1604272798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323739373b),
('0c1no70svacirho8qhavgs4a7v8iu677', '192.168.8.102', 1603909933, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393933323b),
('0dad5emanmklc2norine6d6mvoh6qlt1', '112.215.237.251', 1634656511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343635363531313b),
('0der0ferkhu1v1ssi4vkcsmqgrpqsjol', '112.215.154.234', 1630370314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303331343b),
('0dvucgke93apf4e4msptug44knf5jq6d', '112.215.243.134', 1633164799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333136343739393b),
('0ejnkedjfrbobempotbmcbl6gki3lfrj', '140.213.219.147', 1630723823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333832333b),
('0fe1t559pr7e04om56t3uu9mj95ermqe', '140.213.219.147', 1630710831, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303833313b),
('0jdufp5kvapepcg47v2srhl4magoqc9s', '140.213.59.30', 1630238652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383635323b),
('0ji9h2vcj8jbhnu6en84looolaj6bvrt', '140.213.59.30', 1630238842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383834323b),
('0kenndjg3g504pfp775nl3k9ni6jm3k7', '192.168.8.102', 1604220019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303031383b),
('0lb2it6f1rpfmlhcn4986adil6bc94s6', '192.168.8.102', 1604275274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353237343b),
('0m3fmdvvukk60p170ndv6pauevjcqvb1', '140.213.59.30', 1630239008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233393030383b),
('0nqhpl9tp7hee4ot7o4cjguegs8s9o10', '140.213.59.143', 1632372151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323337323135313b),
('0ntoeo04ep6cb216kq604onfs5ll4omi', '192.168.8.102', 1604269976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393937353b),
('0os9rul5p62ocvmbfipre0ehtjh9hbt3', '192.168.8.102', 1604268971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383937313b),
('0pg8hpjcmnbsg1p5v1jn9s6srdn4ra5g', '140.213.219.147', 1630724400, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732343430303b),
('0pk7lqrqk4obmmbhs5h0m4l961gsbrsb', '112.215.243.145', 1630631849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313834393b),
('0pom02jl14j45hb804cmo9m17lnp3t5n', '112.215.153.10', 1631445352, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353335323b),
('0qpnrtolimlpbr0c3jgusc8il4rnfmmb', '112.215.154.250', 1632309777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393737373b),
('0rc7fbngsaibinoam939kqptegrj6e7s', '140.213.59.30', 1630238656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383635363b),
('0ulasehdrngnu10jb6cga3dt713qqn0i', '112.215.153.183', 1632916106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363130363b),
('127s1rl4nm7c0b4unhoudk33mec2iq04', '112.215.172.27', 1632547621, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373632313b),
('12sbpa7d1hhec8pljjkum24ch4rf9qca', '112.215.172.194', 1630749164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303734393136343b),
('143uh2lmnooai2qqh08cl1s0pq278ern', '112.215.154.234', 1630370141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303134313b),
('14qav5eanni6kid13nf9luvql9ts9e8q', '192.168.8.101', 1603875233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353233323b),
('15kmrqmcrs9kin21c54fcjp6umv8eh4a', '192.168.8.100', 1604219317, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393331363b),
('15llp4s7657u0kngkh83u7lfsdqbgnc8', '112.215.153.146', 1633910325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333931303332353b),
('15uav99aoue6qkm74qse6falest5lmj4', '192.168.8.100', 1604219009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393030393b),
('17bsf3qi15fsfodqr41uuq41vjr85vhb', '192.168.8.102', 1603908023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383032323b),
('17ptnsf1eb1qf5ltoct2mdtb6rd7mhll', '192.168.8.101', 1603874728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343732383b),
('19qda9ls3u4on9pt7uuagpilql3f35uu', '192.168.8.101', 1603877529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532383b),
('1a4n5gc24e7a61djp41hb32gnvfvkc7j', '140.213.219.45', 1631492578, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439323537383b),
('1cah8otvjpukm3n4taffjicook1ctm0p', '112.215.240.51', 1630704401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343430313b),
('1cnk1p9ag3jh44ttc2lh4boml8j3h0cc', '112.215.172.104', 1630806020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830363032303b),
('1d2r9hl2aee01hhnscb54gibak85b10q', '112.215.154.234', 1630372541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323534313b),
('1f6an359fvoj3dkhqohvt9fjnrrk01ks', '140.213.219.147', 1630714598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343539383b),
('1fshtrnmq7gq6vatpgg7gdu8o536244e', '112.215.172.27', 1632546668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363636383b),
('1g4skb3d64lkdng1a0gmu9fititkjj0f', '192.168.8.100', 1604217467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373436373b),
('1h6ah8d9lsoh6hmfl5e023ds982ep8ir', '192.168.8.102', 1604269045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393034343b),
('1l9dp2ff9uls6rnv8vatnpkrn0f4qm0v', '112.215.237.208', 1633403896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333430333839363b),
('1lk9u5anc980pg8pv9b8kkrdpervf19m', '192.168.8.100', 1604218657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383635373b),
('1mlt61k45sj4gr0rfv2ui487d3o516u8', '192.168.8.101', 1603877494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373439333b),
('1n5gsnbn4eh54v8m7nr27j7q3dhd8r1s', '192.168.8.100', 1604217539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373533393b),
('1nlbi1cfadcrlphfsf0nm8dod60uod7a', '112.215.154.250', 1632293167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323239333136373b),
('1obvso68unmeivtebq6rea121rbs0aqb', '112.215.154.250', 1632309451, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393435313b),
('1oge907esas7vpvis95fu3c2tk5t6bpf', '112.215.243.145', 1630631796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313739363b),
('1pe8a7ba8upkijsbb59vrjuqetm1v5gg', '112.215.243.145', 1630631968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313936383b),
('1q3hjcj1nsnhddvbvqb1ia495enkhk5j', '112.215.240.51', 1630703627, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333632373b),
('1q7g11eq07v0bb36v9bc68qfbc761h97', '140.213.59.143', 1632372077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323337323037373b),
('1r98e04ok5o1h23leq4soh463c0ial13', '192.168.8.101', 1603877563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373536323b),
('1rb3fhrrf2v0gg7i17feu0dd4gmaatpb', '112.215.154.250', 1632308251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383235313b),
('1rmcehv5jf35rtfh6aqduig7ma918qfv', '112.215.153.240', 1632791474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313437343b),
('1u20abqos4rhjtugjvrgrh7iu7smn1tn', '192.168.8.101', 1603878464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383436343b),
('1u9n4s2sl6rl3m9jvicc5kugbk2e81u7', '112.215.154.234', 1630370109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303130393b),
('211v0ipav0252cjci6o30eqivscbo6gs', '116.203.134.67', 1632787208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738373230383b),
('213neujqagg6lo3fnb7k490d57sjvkpo', '192.168.8.101', 1603873862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333836323b),
('21c23ljvl3o5hvkplq7clahr4t4tgstl', '192.168.8.100', 1604211004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313030343b),
('21s084fr6hcbest92k2vje4dhqb9k2fo', '192.168.8.101', 1603875679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353637383b),
('23l7drvjjmpelkac3jffob7k1va8vehr', '112.215.240.51', 1630703883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333838333b),
('23lt49ttta8q766q6jqu7pcmuve0n9nd', '112.215.172.27', 1632546664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363636343b),
('24kaloovdk1qsi0r81eosdanmlodll9d', '112.215.172.194', 1630749182, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303734393138323b),
('24mcfu4la0f0cfl9ki2vrp7ta48v821v', '116.203.134.67', 1632528008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323532383030383b),
('25am4g1ocuvtg6bqn1eetjol7vgbb4o0', '112.215.240.51', 1630703873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333837333b),
('25u3r8ccqhecbuvjdj6vmn82gbcj7lih', '112.215.153.10', 1631425103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353130333b),
('273anve3q58ertjm59hf8mh4la1csv45', '140.213.56.6', 1630493214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303439333231343b),
('27lj9cmqg29sn0064f4a0g2cma7o36d9', '192.168.8.100', 1604218326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383332363b),
('27qgnlsr2bf3p79k7vndu1nghuqhtnsd', '112.215.154.234', 1630370223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303232333b),
('2888tofnevrl8aaajnrrgkseilspg760', '192.168.8.102', 1603905908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930353930373b),
('29h10t93uvudq5u7ubbqak51r3uookt8', '112.215.237.228', 1632871663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313636333b),
('2bavlfbbnmqh3rdlpg3cfetpu4rfprmo', '192.168.8.101', 1603878784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383738333b),
('2boj02qsoc0e34jqr72vi23a6euimv26', '112.215.240.51', 1630704381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343338313b),
('2bt9nb76pu8sj8cj48dpl18c8rj3c00p', '116.203.134.67', 1630540808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534303830383b),
('2cdb8tdu67c9hlm3rsfq954v2u1n80r2', '140.213.58.51', 1632472448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323434383b),
('2g1r7uh88folm23mt637bhr1vcpsk1mf', '192.168.8.102', 1603908269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383236393b),
('2hf4cbk8bqleakpfnkrh8tkfq92jp79n', '140.213.56.6', 1630485965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438353936353b),
('2ho0lgd0mon8cf5092mb4slp9ec9v8tl', '192.168.8.101', 1603875284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353238333b),
('2icrkklrer1q213a7clb3220pd1fn52r', '192.168.8.100', 1604215092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353039323b),
('2ige3773iks5tfuud5jjmtph9ofd84or', '112.215.241.140', 1631840722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303732323b),
('2l1huvs1rtl503lhdpm37f3nmsaqojs1', '192.168.8.101', 1603875275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353237343b),
('2mu4s9b0r1qnuo1hoqbe2vk9mhko3iuj', '192.168.8.102', 1604219478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393437383b),
('2n4d0rksqbp8pa1rblv42nh2plkqd3jl', '192.168.8.101', 1603877506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373530363b),
('2o65a51iqmtifqefpekgggpuk5rimqfo', '116.203.134.67', 1633132807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323830373b),
('2p5picmf4bsjgl30ci9m54eunme118db', '192.168.8.101', 1603879086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393038363b),
('2p7fojk4vjlp5tt1edm5gaedb8lmvqj6', '192.168.8.102', 1604208489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383438393b),
('2rrkjd1krq6rfecg5ehja053tf5vadc8', '112.215.241.228', 1633748102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383130323b),
('2rv8r689jjt3tq3gc8650bvmll1lrrdr', '112.215.237.208', 1633430935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303933353b),
('2sbthd2abn7nbqcrd38iutnspsfmet35', '112.215.243.10', 1631535371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353337313b),
('2snot3e8hb4v1pmauv73u72v3ll0vfo1', '112.215.153.10', 1631445447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353434373b),
('2sq5h2fl1v1kc1gte48j89qe67m1qi38', '112.215.153.188', 1630566391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363339313b),
('2tehd3c6n8803ktjjqikg1c4cvbq77ie', '112.215.240.41', 1630285131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303238353133313b),
('2unaqqvvg6tcmbslhui1lqec8f26b35q', '140.213.59.143', 1632363565, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333536353b),
('318tishe3c3lmq2k6h2876puncguogug', '140.213.59.30', 1630238452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383435323b),
('31osecu7mkho533k8m5j36lmasbfejqp', '112.215.154.217', 1630321100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303332313130303b),
('345009nvia2ilpnn15jmlmef7lgrfihm', '140.213.58.119', 1632646101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634363130313b),
('34bv77d8q2gj5fucsvm2tv2sctecis38', '192.168.8.100', 1604215212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353231313b),
('34endkh8u9fbe6lffniottdj02d9mgei', '192.168.8.102', 1604220242, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303234323b),
('355mcphj882c1pgmcid6ohhqfr6a71g8', '140.213.56.6', 1630506017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363031373b),
('361jikt6hsjmnprtiq4an88ej75njer7', '112.215.240.51', 1630704059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343035393b),
('369mjfntc09hoqjbecdn3q7l2uivp9fl', '140.213.58.51', 1632484190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343139303b),
('37ggr0q6sb900qj8bb50598u3sapevqi', '140.213.58.119', 1632645918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353931383b),
('393hqdmfc7f6iii67jf6fl957ir2uj6i', '112.215.172.27', 1632547338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373333383b),
('39mfn3ir7r3r79b8sqv7br32vqjb770m', '112.215.154.234', 1630372539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323533393b),
('3ab2kkg9vsb80sueaf28pi1q2u1mhcco', '112.215.172.27', 1632546695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363639353b),
('3b8fuk5g987poojm3h7ritnglqtd678c', '192.168.8.101', 1603873349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333334393b),
('3clc22ecsvep8q388d26i7ct2dg6ouhp', '112.215.153.10', 1631445486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353438363b),
('3deb7brmo8ff9annemdgfk0grote897c', '192.168.8.102', 1604208160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383136303b),
('3e81o0ha4dhhko60ur4k4hmdijpf4bs2', '116.203.134.67', 1634342407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343334323430373b),
('3ggc2v34jnposvvp3b6t1hiess7gofp2', '112.215.243.10', 1631535475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353437353b),
('3iic16m32c588j8mb841fnka9svmj022', '112.215.243.10', 1631535572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353537323b),
('3jeindt1pks16a6m2edm6gjr6do8uu34', '140.213.56.6', 1630505994, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353939343b),
('3kbajidrskpsf27b9jsktnbi0i8ik5oe', '192.168.8.102', 1604238779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383737393b),
('3l05q5lgmffuqcfh334gbhmqloip58rr', '192.168.8.102', 1604272761, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323736303b),
('3n4o2nukvjf7ufe8tqfvucc0kio025tl', '112.215.154.250', 1632309324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393332343b),
('3ojalgdfl1vsntqop7al8ut2ssn0lpq0', '112.215.241.140', 1631840510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303531303b),
('3q6d6lmce4n1f3ntpoathos462efosva', '192.168.8.102', 1604269256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393235363b),
('3qtoq4b7luc36a2o68q18o0qi9tl7qm2', '192.168.8.102', 1604221368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313336373b),
('3r37meuvir8iho1aq98lud75p4n0q9pb', '112.215.153.91', 1633339921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333333393932313b),
('3s3oncecdp7njret1fo9c7qdd7q6qi1h', '192.168.8.102', 1604269547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393534363b),
('40827jp01rqflarrmmvu8sfabqu20f4l', '140.213.59.30', 1630224771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343737313b),
('40uqbtv9ra0a3rmf4o4ikp00a6rve30d', '140.213.219.147', 1630714552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343535323b),
('43n7n9lptrejcfcst3fbre6u59gnod17', '112.215.153.183', 1632916052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363035323b),
('448ki70ep3mucgc28dqpoptdc8ak7ejd', '192.168.8.102', 1604276357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363335363b),
('45e8vo1v9215k87nml0tmhkppvqmp6sp', '140.213.219.45', 1631492590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439323539303b),
('47atkpga44cdvk2o6u88k7fj45emuepm', '192.168.8.100', 1604211079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313037393b),
('47gj3rf7v728r8j1ob97fqv1br8m6psh', '140.213.59.30', 1630225093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353039333b),
('47ic62ofpij93krqsf7jnsqsu2lj6iah', '112.215.154.250', 1632309253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393235333b),
('48n36na9negqg1spqj161lr0a6nofjq8', '192.168.8.101', 1603878966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383936353b),
('49tqj1t2fq26pvdp47mrm8fdnvci7kit', '112.215.153.10', 1631425099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353039393b),
('4a4o2rhbf3d62t897lvgbtinutnblav7', '140.213.58.51', 1632472854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323835343b),
('4a80pivtth6mndvoigk8q7qjc9f1tdl2', '140.213.219.147', 1630714768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343736383b),
('4acr0q8vsbgueke1tohl2ooch5rhpmhg', '192.168.8.101', 1603878391, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383339313b),
('4bd2vgmmv31rs8930aapfknuik3h3ua5', '112.215.153.91', 1633340130, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333334303133303b),
('4d027lnbfm4nb8vn9dj6k6cs094mnjct', '112.215.153.240', 1632791485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313438353b),
('4d507hbh0vq9pf6ug1oq91vcbk1tqdtk', '140.213.58.138', 1633132053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323035333b),
('4ehr33s55kt7pr8c0d3o0p7h3rnphriq', '112.215.154.234', 1630372636, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323633363b),
('4f1010j33qcijjinvv846dstj0m4s1j1', '203.78.118.195', 1633862539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836323533393b),
('4g42iieljqni2oj5mtolmrcbu7bhj1r8', '140.213.219.147', 1630710722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303732323b),
('4gk590b8tqe0fc6o459alfnhgak81snb', '192.168.8.101', 1603878336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383333353b),
('4gmfu4pkhkaqaumbfp8gl8pg1ndma1em', '140.213.59.30', 1630224847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343834373b),
('4h36vmmd1hn70c5oa5km4e22a4adg98v', '112.215.153.240', 1632789355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738393335353b),
('4il00bll0gcq3uah0obgio4i8otongs2', '192.168.8.102', 1604208496, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383439363b),
('4j4c4hio2qasgmu4otic8hu40541qs5f', '140.213.59.30', 1630224522, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343439343b),
('4k1753gnsg367iqib0n3qr13m0u7qh37', '140.213.58.138', 1633132125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323132353b),
('4k9otscos5gql5vh3ho7v3mikrsce45i', '112.215.172.27', 1632546942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363934323b),
('4kme3jgde9kooru5nv54f3jir5tsg9n3', '192.168.8.100', 1604217370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373337303b),
('4kp85u66cke9ffrq21f4oe7fg247e9v4', '112.215.154.217', 1630321080, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303332313038303b),
('4l1e4h0bjb8a0k989fg8iugthd8r298o', '112.215.172.194', 1630749167, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303734393136373b),
('4lj21qlii0h8lsqkvg7d8848sffpbrr7', '116.203.134.67', 1630627207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303632373230373b),
('4obno97k5gv2qmk993ufsbdmmitptukp', '192.168.8.101', 1603874800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739393b),
('4q24k545u62tve9inkusodtag75gfgn5', '112.215.172.27', 1632547535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373533353b),
('4t0j3a0auj2rnhmm0eqcm7ju0fn7j3ef', '203.78.118.88', 1634471870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313837303b),
('4taq9aqg83v3mh606v1vfraukg08ruck', '192.168.8.102', 1604269325, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393332353b),
('4tkctvj45152qt7e0g6udv51ca5ekbpq', '112.215.153.188', 1630566303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363330333b),
('4tkkm916rokm6ro3p5dsctdv94s88m45', '192.168.8.102', 1603909244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393234343b),
('50ogoe7j5d4l4op10e79htsa317ojmdq', '112.215.154.250', 1632309117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393131373b),
('515o1944ul7ecri15bd9kj63lhr1lj2u', '140.213.59.30', 1630238722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383732323b),
('5217nn7oap7gk6i98qj8nfq96tlo2h87', '112.215.173.148', 1630919311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303931393331313b),
('535auak2h5gerak3pap4gfl0uieuo2vp', '112.215.153.10', 1631424923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432343932333b),
('56mjbjp7rm67elvs22uc3tcqm8vf9fbf', '192.168.8.102', 1604269850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393835303b),
('57gmglkbpiqrtr1tkpdv3d756k19ijdg', '192.168.8.101', 1603877832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373833313b),
('58e0dcab8kf8vc7l5gm0celj13auelen', '112.215.172.27', 1632546658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363635383b),
('58me3fj9q6bddjgok9amajjhm91q7omr', '116.203.134.67', 1632441608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323434313630383b),
('59hfj120bn7ionkicd1hjqvqe7g7roj3', '112.215.154.250', 1632309799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393739393b),
('5auk2totogqt977167jmkt2c4jjuieuc', '140.213.58.51', 1632472902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323930323b),
('5bj273lplhstuarjfiqfcaab2vf96fu6', '192.168.8.102', 1604275070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353036393b),
('5bngp328e33cu14gpr9snpttba3ht3du', '192.168.8.102', 1604272862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323836323b),
('5dulvq87e5u25ugjiovg0j0icfsk1d87', '192.168.8.102', 1603909949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393934383b),
('5eq26tpttkr55lk6qu8ihfaatrbsugvl', '192.168.8.102', 1603906180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363138303b),
('5gaq7dngmbjm2up7j93pvihkhrncdb55', '192.168.8.100', 1604210693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303639333b),
('5hkaho35vsmdprgfjbis9kshtav39u44', '140.213.59.30', 1630224887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343838373b),
('5k18naf13qu5aqk05l2libq9icdjeofg', '140.213.59.30', 1630226552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363535323b),
('5lhvt28ihgi93mc76gfsqmcr6omt4j2u', '140.213.56.6', 1630485927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438353932373b),
('5nf0ul9a5as0mlo9d8hopvim0u9t7df7', '116.203.134.67', 1631232007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313233323030373b),
('5ovpmlsip2mbq466kg9rj769e8s6jjbq', '112.215.154.250', 1632309770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393737303b),
('5q2majtci505to948g8h993smuu7vq5j', '116.203.134.67', 1631404807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313430343830373b),
('5sabsjleaad5c7nsokssefhd7n6aubrk', '112.215.153.10', 1631445481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353438313b),
('5tdshnd087d91mctkmuumoa8qt348m30', '116.203.134.67', 1634601607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343630313630373b),
('5uu6f2v89ihhts6khasamed8u5t29h9c', '112.215.154.250', 1632308251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383235313b),
('5v79kkmhpjicdcdve4d4d01b5v77u668', '140.213.59.30', 1630224753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343735333b),
('6053eq3np9d5mnmnke7e471io16rg0dm', '192.168.8.100', 1604219405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393430343b),
('60jnggdtsdmksf9v6rsukurqcatgh3dr', '116.203.134.67', 1630281607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303238313630373b),
('62q517k7sod5itmkgkpvrj5dg3bf7tb6', '140.213.57.48', 1630290939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303239303933393b),
('65tuhj442dg0h6fb8ns99p1nevvhoqbb', '192.168.8.102', 1603906375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363337353b),
('66a531r26gig6ofekbug4pm9sgo9ufou', '112.215.154.250', 1632308769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383736393b),
('68sl06c9nc5a5j4ql7f725s0g6svq2e2', '112.215.153.188', 1630545151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353135313b),
('691pmjqcl0c6sra4cnl942rlreiu0o1m', '192.168.8.102', 1604275163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353136333b),
('69u7egam77hk3m00lc62a0l0llm3fi5h', '192.168.8.102', 1604220297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303239363b),
('6baudlshd8cll02mah1idqlim3aqr8cd', '192.168.8.100', 1604218673, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383637333b),
('6cma3sqgjaik1mhm2c3apm8jood7v80t', '203.78.118.88', 1634482632, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343438323633323b),
('6d6btm0fu5lurvh2qn326hhk3evcmp80', '192.168.8.102', 1603908314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383331343b),
('6f79hvld9mlk4uu08f81e62k6l6vn5nl', '140.213.219.147', 1630724356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732343335363b),
('6fii3s66q2nk5o2v08p4r5dmg7qaoed0', '192.168.8.102', 1604208239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383233383b),
('6g3glu8e2o56qbohvt08gml1bunkd6k4', '116.203.134.67', 1631577608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313537373630383b),
('6guibroste15k8rbf149j4bgk759nosn', '112.215.241.228', 1633748113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383131333b),
('6h1dp06f3mlahcmofuhknsidtn97kosv', '140.213.58.51', 1632472455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323435353b),
('6h4e4lgl81dfe3d2q2vad9f1vgn7efjq', '140.213.59.30', 1630251178, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303235313137383b),
('6ihmpndducr1srt9ca81h36l1glc1l78', '140.213.218.17', 1634377262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343337373236323b),
('6jtju6uvkkqjjb60ue2mvr5d4p4d9u98', '140.213.59.30', 1630238758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383735383b),
('6k1t0l0crsmib2g1qrv0ho2bf2q37r4r', '203.78.118.195', 1633863308, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836333330383b),
('6kuvbtcv15sqp0eeo9d32kc94d10rrcd', '112.215.243.10', 1631535372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353337323b),
('6lvgj578chkshc0ktkqso589820qo6n1', '140.213.59.30', 1630238553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383535333b),
('6n3i35jbdlpbj62fv1vproth543iftp7', '112.215.153.91', 1633321745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333332313734353b),
('6n8oi0f8clorfog0lvna8pmqjv2phmfg', '192.168.8.101', 1603874895, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343839343b),
('6noukels5m4k1pp98sbkl57b08chnqoa', '112.215.154.250', 1632309331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393333313b),
('6o4jc0oqctra0ct93l85rnp7bo761las', '192.168.8.102', 1604276338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363333373b),
('6plkftgkmu18ea1v5u27q0qedvi4tvhn', '140.213.58.138', 1633132061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323036313b),
('6qa3pnkvpdvan807k2dtvtfc1lclhv2f', '112.215.240.51', 1630704356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343335363b),
('6r30hspuh0ev4mv3ufcpv444518pf4m5', '118.98.26.6', 1634482633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343438323633333b),
('6re6ljp5i2lq802fh39j9ok2uf1rkr2l', '116.203.134.67', 1633219208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333231393230383b),
('6suv9ft27fnb43e28q09rqr4efedtvvq', '192.168.8.102', 1604269953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393935333b),
('6tuksm7nkuamr708hsship9dv9qnl1ku', '112.215.154.250', 1632309065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393036353b),
('6tuqc5us7ffdt6593pa4gjur0b2v4nuc', '116.203.134.67', 1631059208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313035393230383b),
('6u74ug1nbrjl6i704vil445vno9o9p3o', '112.215.153.240', 1632791466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313436363b),
('6u86pc7etejcpb37dl1nd2uqu412sjpo', '140.213.59.30', 1630238927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383932373b),
('70fhi6r376885l2b50gptrp7ut3b0dla', '140.213.219.45', 1631494536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343533363b),
('70jorbn2oc13k2sp8bfh1is1hc7i8jkr', '112.215.241.228', 1633748088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383038383b),
('70kprgnucqcikhvhnrf9o9kiq25oedcj', '140.213.56.6', 1630505999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353939393b),
('73k78osqis14c1ir1v8evoef7s45aech', '192.168.8.102', 1604239366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336353b),
('74ijhdgccor5q176f2f7nafq9rglmd1d', '112.215.172.27', 1632546871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363837313b),
('76dqh8lfhhko78b1r7mmljd3oqcbcf5i', '112.215.154.234', 1630370079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303037393b),
('77ucfuuscnt27k7idbh14mo7b8vk7eh5', '116.203.134.67', 1633651208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333635313230383b),
('7a7vcpru1s2piou0sq15aeorbklb8scl', '192.168.8.101', 1603878102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383130323b),
('7c29j7ihro8o9ben9g2l6mjq4ul86uip', '112.215.153.146', 1633909397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333930393339373b),
('7c6vrfsh16oma9vvmj5uq2tq8j8fhoug', '112.215.240.51', 1630704311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343331313b),
('7e9ob4s1dl9mpm4eqknvgbvdge1pdmt8', '140.213.219.147', 1630714602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343630323b),
('7f50vgl741fr1c7bsg6k9ujgqrdisd44', '192.168.8.102', 1603908274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237333b),
('7femdktj4mkg77vsf6app7jp2j7l8gb2', '112.215.154.250', 1632308835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383833353b),
('7fsvmhrre3n223p52ff85lie8vl6pj52', '192.168.8.101', 1603878509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383530383b),
('7g4ffa4og5r0hhcbnlncv7fi65uqld6l', '140.213.56.6', 1630485949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438353934393b),
('7gh5omma7vvaasclegm9dqpi0faikt9e', '116.203.134.67', 1633392007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333339323030373b),
('7jn991mfm74hgeoketcjdcmpikfcbgfu', '192.168.8.100', 1604210612, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303631323b),
('7lb3nemiie51hie61u8atps1o9rc476a', '192.168.8.101', 1603875262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353236313b),
('7lkm3jt91a05easqsq3f2emund4b6b5e', '112.215.172.104', 1630806096, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830363039363b),
('7n6pmnk3l1sdbe4933u8gpg3qojd2uop', '140.213.58.119', 1632645931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353933313b),
('7nkmlaj6dm9p04aqp4dmecmbdq9em292', '140.213.59.30', 1630238694, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383639343b),
('7o0rlbtv6pk084kafq8p38h56ods3l4l', '112.215.243.145', 1630631884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313838343b),
('7r9mbe2rh13h3lp7e79i3ueodlnscjqk', '112.215.172.27', 1632546922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363932323b),
('7rm0opfhqdarbji6khefnsb9t16elkh1', '192.168.8.102', 1603906086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363038363b),
('7sbe17s324nn3j2a9ip2jsiranfb3tpr', '192.168.8.100', 1604215505, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353530343b),
('7sg8jn278cfqejbbj38ij3e943up05cd', '192.168.8.102', 1604269900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393839393b),
('7sq1e2s8qm7u9rov4bddfitav5l0mali', '140.213.59.214', 1631868942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313836383934323b),
('7ubtcn4721pqfnlmeh7b9r4f4d0ncegs', '192.168.8.102', 1604276385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363338343b),
('80hnem6s7nudb2u58jge0lovgmmgtp08', '112.215.154.250', 1632309751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393735313b),
('81hbs7eq3kuacd2gc5elilofrbfr932o', '140.213.219.45', 1631494527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343532373b),
('81krfj1fvjs3k9lqk8iki3dgflb5d3ke', '116.203.134.67', 1632355208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323335353230383b),
('82ru4leh1oebummn6t52psn0307a6n03', '192.168.8.101', 1603878960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383936303b),
('832avr9lt85uvj1s25c53k7q3hdkhfdf', '192.168.8.101', 1603873553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333535333b),
('83k52udms72pvghdndpd34kejgm6mqdn', '116.203.134.67', 1630972807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303937323830373b),
('84270gmon2q52ji68kbsc1bqlclg3tmg', '112.215.172.27', 1632546764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363736343b),
('84jn6nsj1b9ukjssmf0v91i5m1ospkd5', '140.213.219.147', 1630714559, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343535393b),
('8544h28f2abi1p2qqc02qqaa54uu8f07', '140.213.58.138', 1633132082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323038323b),
('857qkmrefiomnnb26me4nks8qp4ddm99', '112.215.153.183', 1632916076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363037363b),
('859ugrocva1k5r3k0m7t1sf6ma5jfbuj', '140.213.59.30', 1630238928, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383932383b),
('864iu40gujtgi4kkqljq1etudml5jffm', '112.215.172.104', 1630806027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830363032363b),
('86skpjd1e6u59qsd32misgv72fl13qie', '140.213.219.147', 1630724359, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732343335393b),
('870rd7s06stlcd9jav9s87ddedgcjp0r', '112.215.242.139', 1630965906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303936353930363b),
('87pv6ib9ndve9485b8evvph51smmcual', '192.168.8.102', 1604208850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383835303b),
('88e6k2eul4kejsms8e2vfeu7booroa6c', '112.215.172.27', 1632547472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373437323b),
('8a173gliurme6ddjfkmrb505skrgkbn9', '140.213.219.147', 1630714620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343632303b),
('8a6k16k994hgph07uthbsv8qpmap3o85', '140.213.219.147', 1630723706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333730363b),
('8am30qrh2ggbuvalinp549cltm5rjqpe', '140.213.219.147', 1630707026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730373032363b),
('8d843jg5ee893deanaljq8kqvgpus5e4', '112.215.172.27', 1632547802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373830323b),
('8eum4cfv9b4aimvg7dubvvmth4ehjut8', '140.213.56.6', 1630505945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353934353b),
('8fcobv25h8o6cds4k3bh5mhir9vuuild', '192.168.8.102', 1604269747, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393734363b),
('8foeqoqdq1dcmstu9lumfu9rl5ov3688', '192.168.8.102', 1604239619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393631393b),
('8frvm6509rcj1s9n8heq22946k3fctiu', '192.168.8.100', 1604218883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383838323b),
('8hmh7h6mfihr6v6av21jrufh1lpovn1i', '192.168.8.102', 1604276108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363130383b),
('8hmo4ievv24bb8fdkff5ir8vnvmg88mj', '192.168.8.102', 1604208641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383634313b),
('8ij8edqff1a5e7s5dm4q36vhirni4cpr', '140.213.56.6', 1630485987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438353938373b),
('8j0e9bf0qskg3i11c6fu2hihv2gvo6aq', '192.168.8.100', 1604211051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313035313b),
('8ja7sdhoos3ma7ogc3fnmocoa9dlueij', '192.168.8.102', 1603907775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373737353b),
('8jbathd36ub42hnhep8g79rdg3d73ltg', '112.215.153.10', 1631425125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353132353b),
('8k1b0gf4ad1hmsgl708ocqg3r5d0de6d', '140.213.219.147', 1630714591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343539313b),
('8kbbocgqj7jcuhbk7lmdlocbikmvd038', '140.213.219.147', 1630710703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303730333b),
('8lmc44mhe65oe5jk5esjsc97qjgorgq6', '192.168.8.102', 1604238671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383637313b),
('8mn7ke7kad89vohbnluu4tc1di9ngvrn', '192.168.8.100', 1604219132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393133313b),
('8nefh6p8ct1ijeek045ttgvlqvn8bhjc', '192.168.8.102', 1604268544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383534343b),
('8nfs5d4uliq2pf6kkbau9ffk6cnt2f5v', '140.213.59.143', 1632363144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333134343b),
('8nolpanir3gd97nf2d8gir9b2c8frq9v', '112.215.241.140', 1631840655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303635353b),
('8o80qqlc8eoi1br9m1hi33i5lv4jn2ci', '140.213.219.147', 1630710820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303832303b),
('8rfs034divvb0so5k3os77hmibn5i93q', '112.215.172.27', 1632547351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373335313b),
('8u1lksnon6cjg837uct7bmpiutsr9ac0', '140.213.219.147', 1630714745, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343734353b),
('8v5hm2ujdkh1hnni95ku1aijf32hn0u6', '112.215.154.250', 1632309256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393235363b),
('977uvqp7meh0b3h0iq4aj24dcjtkcas7', '192.168.8.101', 1603878456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383435363b),
('97ll13ckjni6ic8hr3umr4genojrh3v3', '192.168.8.102', 1604268965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383936343b),
('97tt5orgagffd86eu56nb6q9aq4qdofl', '192.168.8.101', 1603878372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383337313b),
('9876m478v6iph6hp6672d67rp7mpg7b0', '192.168.8.101', 1603878038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383033383b),
('98f5nq0r4gp26u6v8s6pj7s1v6jhng5i', '112.215.153.91', 1633327360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333332373336303b),
('98p7r6tqhhsl9toi5f7j2d6jm3s1gjra', '112.215.153.10', 1631425126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353132363b),
('9bv59124br7e3jrp28raa8j8817s8gtn', '112.215.172.27', 1632547783, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373738333b),
('9cbjn5q2ltfqemt0mrijrppg3amb6010', '192.168.8.101', 1603877544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373534343b),
('9cp05dborl8i09sl01pbs7f6ngd8ikd6', '192.168.8.101', 1603874787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343738373b),
('9e25f6dv2igrenfdco64shvinn1tkmhc', '116.203.134.67', 1634515207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343531353230373b),
('9g5drai48a9nmotgm9d020clko0odd8i', '140.213.58.138', 1633132180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323138303b),
('9iic3t6hlualf4hj3qfcokd2l6lao1j3', '112.215.154.234', 1630370021, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303032313b),
('9j5dcdhf7l01m7u3e1rsc1f9et2p8brf', '140.213.58.119', 1632646074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634363037343b),
('9jhqanag1tgovj4rci3ahfg9ntcmf64c', '112.215.153.10', 1631425263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353236333b),
('9jn1ra8pm4kqe140sifv8a8jjuul8b8v', '112.215.172.27', 1632547584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373538343b),
('9lbue7je2d5rebhucpttl8c9gh9c8bln', '112.215.237.208', 1633404088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333430343038383b),
('9ohgirckcgtkb2huol7kn67gpnp92oli', '192.168.8.100', 1604217472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373437313b),
('9p34eg9h3ll2dresoiio65teuficp268', '203.78.118.162', 1631239403, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313233393430333b),
('9q7sasu9d1hf4cjvrebs1ks8ido3kc95', '112.215.153.10', 1631425081, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353038313b),
('9rba24blhpfc26s1gtmv1ch1jhkursou', '140.213.219.64', 1632463981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333938313b),
('9rga6g3878c3das1brjeuqdgrs8m7e77', '140.213.59.30', 1630238676, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383637363b),
('9sl5lj5one0gl3tson7emg8trgurun5j', '203.78.118.195', 1633862575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836323537353b),
('9suga6t4lhan70cu88fcm6d61ben6jod', '192.168.8.102', 1604276800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363830303b),
('9tkku427h8i1p6q43sp7jrtu1lp280uc', '112.215.243.10', 1631535552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353535323b),
('9toakvpvfohuoeks70dam6ml98ta7uds', '192.168.8.102', 1603908927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383932363b),
('a0clir73d4gk8m1dop56uog5r9pldh1k', '112.215.237.228', 1632871678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313637383b),
('a0eqtu188bfbt8psq480gmjefvjjatf1', '112.215.154.250', 1632309444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393434343b),
('a1m0crqhos1fj42e960d4nb9ihk55ai2', '192.168.8.101', 1604754315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331353b),
('a1qehgeibou41ebni6l7mkihqeasppqg', '112.215.237.228', 1632871602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313630323b),
('a26j0h9ii9uteqh82ddbdoduulbkiog1', '140.213.219.45', 1631532705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533323730353b),
('a3cg38jaftom9ssnks99ks5t4bb6913u', '192.168.8.101', 1603878427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383432373b),
('a4aj3747mdrohi5i9e7hcmsg50sgtcjg', '192.168.8.102', 1604276364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336343b),
('a4edonj4cho61oo932d7d7tgh7dl736v', '140.213.219.147', 1630714753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343735333b),
('a6env787kisqubhgqhsbam34ni39othu', '112.215.173.148', 1630919334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303931393333343b),
('a6mfbm7ach5i44lcrau4ebbdgnruplcp', '140.213.219.147', 1630710738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303733383b),
('a8cr4uhmjipljrlbvfk8a9h949j7vnb5', '203.78.118.88', 1634471897, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313839373b),
('a8f8mkqsrf3in35kdmvs1ogpm8f99pte', '112.215.153.10', 1631425128, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353132383b),
('a90ovnoupj5cd80abog6t3vav14pij6i', '112.215.172.27', 1632546709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363730393b),
('a9du4ef0b81c8da781oe0s2fi9l8tf86', '116.203.134.67', 1630886407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303838363430373b),
('a9qivgcsqdsvrmem3bim30l3sn5m8ldk', '140.213.56.6', 1630505984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353938343b),
('aatimu84fgnqjo22mbdcb1klijfiobd6', '112.215.153.10', 1631445363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353336333b),
('abahvfigu9s1hm0ef0kmubnejkja288e', '140.213.59.30', 1630244140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234343134303b),
('abk9a12o7vesgom43arv001fmhrbti6e', '192.168.8.100', 1604211102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313130323b),
('acot6ghsrj1tuhr8kqrg7dsh1f2hcdm3', '140.213.56.6', 1630505883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353838333b),
('adivfgmae5npbteplv7uu3sr0actnt3u', '192.168.8.100', 1604211135, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313133353b),
('adpgd37qk3gr9me60f74tqrkt6g7vu1p', '112.215.243.145', 1630631793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313739333b),
('aecka4ga4mh2fn4j4mrrl6c5p6u4ubd1', '203.78.118.88', 1634471846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313834363b),
('agvq4egrbul448lf9h21r56nql0q7jsm', '140.213.57.48', 1630294558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303239343535383b),
('ah176eagp69ls4ktd3can8cu1acf3vmt', '112.215.153.10', 1631445544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353534343b),
('ai6hs34a58r5s65tdj8s2ae2a79cm5h5', '116.203.134.67', 1632960008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323936303030383b),
('ai9ilh17g5nl64devumvohob6573od55', '192.168.8.102', 1604208690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383638393b),
('ailcfblqs55b012es8rigg9e65ndn6i8', '112.215.153.240', 1632791383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313338333b),
('aj07mf7mtd5sgrorart2u7m0c3ohl9rg', '192.168.8.102', 1603907984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373938343b),
('aj1bgj60s8jma89tqbv8nuvialcmfsr8', '140.213.58.119', 1632645918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353931383b),
('amm21pi6490mta87s643rua6gpofrsg4', '112.215.241.23', 1631061223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313232333b),
('anit20cg4rlrn1ijdk91uir8bvcco6ms', '140.213.59.30', 1630225085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353038353b),
('aouomkllh8er2jv4kf2jpd5kqi87hlh0', '112.215.154.234', 1630370111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303131313b),
('ap54pqn52fntinmpsb0a6vpolajl2rmp', '112.215.153.91', 1633340122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333334303132323b),
('aquiqco8hsron3j3m3dbj2rb3alnhtcp', '140.213.58.51', 1632472878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323837383b),
('arr6fqg92157usnfs540cs1ae77qe5pi', '192.168.8.100', 1604210610, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303630393b),
('arstmeo4jt4ol39cdn3bn362trcjqpul', '140.213.59.30', 1630225152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353135323b),
('as72efpcef41ansn6bh4bdi9pl4kajna', '192.168.8.100', 1604218455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383435343b),
('asftprpdivhg7lpanad09nnvho57re3f', '112.215.153.91', 1633321750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333332313735303b),
('atiijoupf6ravmhpao5t1seo695v5159', '140.213.56.6', 1630506208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363230383b),
('av4gfedk9rmelb8hpv5ik9arnv34iqjr', '112.215.154.250', 1632308954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383935343b),
('avj06m70m2jtmp9lvg6thepvrsjntjc6', '112.215.154.234', 1630370082, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303038323b),
('b206qehevloj1vluose4cg56mc1pl8ov', '192.168.8.100', 1604210975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303937343b),
('b29qc3rluvkst4ap81ta3meslc41tmgq', '192.168.8.102', 1604208530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383532393b),
('b2dvc44ahmm21uvsqhejs04cqehukrj3', '112.215.153.91', 1633321746, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333332313734363b),
('b3clpc2h425stac3i20red21dlsrecdl', '112.215.241.228', 1633748126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383132363b),
('b4gasr6adpq2728eopda951aqr0389di', '192.168.8.101', 1603877525, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532343b),
('b69qd2lnsv6stori6c2nf6876k2rulm5', '112.215.237.208', 1633403888, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333430333838383b),
('b9aikccppnrkvreavlk0n3b91akm0u5g', '116.203.134.67', 1632096008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323039363030383b),
('b9qolf4634qjdf2pops9qmj59eo62iou', '192.168.8.100', 1604217341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373334303b),
('baaskmi6b4hp43fb62mt76dqd1aihmn1', '192.168.8.100', 1604219381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393338313b);
INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('bbenv5i23e079c6vdgr30n8d3ouucv8i', '140.213.59.143', 1632372091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323337323039313b),
('bcsat2gh0dteg9mfmaro1dsebj6dnq6j', '192.168.8.101', 1603877995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373939353b),
('bd9jevnrd08m1mo39spa7jmcct6i0ffc', '112.215.241.140', 1631840692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303639323b),
('bde5qg5ab7pnvibdupr6da1o2j27qqb2', '140.213.218.17', 1634377255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343337373235353b),
('bdeb70u9vtk087iop3bq72lihkk35dti', '192.168.8.100', 1604215327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353332373b),
('bee2kupjfeso9qs1g6nlapogjk4c6bpf', '140.213.58.51', 1632472897, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323839373b),
('bf5h6sqhfauh8soo91a3hua4qogigsbm', '140.213.59.30', 1630238838, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383833383b),
('bfl9n2emokd8j97eu3050idn0dt070g4', '112.215.173.148', 1630919297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303931393239373b),
('bl188mp2om5370e8aje3i2os5h5jbeeb', '112.215.153.188', 1630545221, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353232313b),
('bls319fmpnprsfkr6fqku9nvfkjpr9t0', '192.168.8.102', 1604269549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393534383b),
('bn2ktp54liv7imqmprodd4ru0f77d20h', '116.203.134.67', 1631491209, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439313230393b),
('bnnsg93dlqdfqf4bpo7sbpqgl471s12h', '192.168.8.101', 1603877647, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373634373b),
('bok46mts8j06cdlsdt6mo2s2urus7dc6', '192.168.8.102', 1604268592, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383539313b),
('bp6ee3qbb4qjhefqtaine7opaovs61a0', '192.168.8.101', 1603878059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383035393b),
('bp6rc5kjt3bsq5ca3itabapohqbnl2pg', '116.203.134.67', 1633910407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333931303430373b),
('bq1qn4b77uajh3r92k287oed6oeb6re7', '192.168.8.100', 1604211099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313039393b),
('bqu24brfjc4s2skefblo1pcpvg1llvfg', '192.168.8.100', 1604217743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373734323b),
('bqv7n60a9ra4c2dt99pjosr117l6t32o', '112.215.172.27', 1632547840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373834303b),
('brsrfmjv5iikg9ebaj0vnop0608ha370', '112.215.242.139', 1630965893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303936353839333b),
('bs15k1qhr9i78cmdhlk0uud3khvkr45c', '192.168.8.102', 1603908014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383031333b),
('bt5d037slorjv3no9dtqh9l76marqv2j', '192.168.8.101', 1603874786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343738363b),
('bucl81qjfhombc2am9k0mr4ast408fad', '112.215.172.27', 1632547735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373733353b),
('bv3accoqbvc4rr52pf0qhs4gvihfojjc', '140.213.219.45', 1631494516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343531363b),
('bve18upklgqqjc1n0qdnf5e4okhec5n2', '192.168.8.102', 1604208751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383735313b),
('c0e9h3epa915cnv3qej2aaehfh4vaq6s', '192.168.8.102', 1604219731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393733303b),
('c0f97rjs1lgt762omesl692tg8fb5ut1', '112.215.173.187', 1630929915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303932393931353b),
('c1go3f1mr9tk4a76oe3itfdl5ngsrk54', '116.203.134.67', 1632268808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323236383830383b),
('c3jd1i4nmjqab0i748bkcr8bh15hndc9', '112.215.237.208', 1633430877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303837373b),
('c44eb2itovs9cu98uervibu0kcjg8s75', '192.168.8.102', 1603907574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373537333b),
('c59geirid9g8hqtbjm7sasuo1iclplmm', '112.215.153.188', 1630545154, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353135343b),
('c5g3e6q38lkfios6ugofqejtn5qpl9js', '192.168.8.101', 1603877639, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373633383b),
('c6qlnq5ln7953s1mhpshifsla148poes', '112.215.240.51', 1630703629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333632393b),
('c7s86cdh1lt1abeqd8e5modhafkueslu', '192.168.8.102', 1604218193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383139333b),
('c8vnhb80et32j1ghm8clc4ken05mfqvt', '140.213.219.147', 1630710837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303833373b),
('c93roiehid4q5t0mi4mf3vuouc1shubq', '192.168.8.102', 1604239409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393430393b),
('c9p35ljkk8mor9341nc7sfna27c4q5ds', '192.168.8.102', 1604208321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383332303b),
('capclrtfs36ksg813mk1ep584nbru5j7', '140.213.219.45', 1631494576, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343537363b),
('caue17hj83tl4e8fedhv509h82btav2u', '192.168.8.102', 1604220126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303132353b),
('cbmbpv68p0d18377s8ju9lh12ee2a7ue', '192.168.8.102', 1604271235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233353b),
('cd63mhvn7gpvfvs9tq40sgc3k19kb03h', '112.215.237.208', 1633430880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303838303b),
('cf6k1v042dkqsu0gvtr7font5eg7llde', '140.213.219.147', 1630723825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333832353b),
('cg2pcu1tdrm7d7ep5vjjnd4q2drmcp2f', '192.168.8.100', 1604219011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393031313b),
('cgc70e89849as05d3atjiib3rpvqnk6q', '140.213.59.143', 1632363091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333039313b),
('ch116ks3koq0k7oob47cnlnmqkuqtslf', '140.213.56.6', 1630485950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438353935303b),
('chfbe7edgf3a644jcr74hac3fdp94bk4', '192.168.8.102', 1604276349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363334383b),
('chm0fd6359rj74mat33ns3n1gkh4algr', '140.213.56.6', 1630493198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303439333139383b),
('cjthm1789k4vbgnhovgvtvd4bhgfj5d1', '140.213.219.147', 1630710829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303832393b),
('ckf7kbufmu2cjbm5fv952uoktg93joth', '192.168.8.100', 1604219250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393235303b),
('ckjeh39edgonuos1a67elofjolpc5i05', '112.215.172.27', 1632546777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363737373b),
('ckn9a68gm5qls1kuseaa91f4oi7v6v6u', '112.215.172.27', 1632547463, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373436333b),
('cmqoc9qb7d9egqpj7iejl27vpab78ort', '140.213.59.30', 1630238976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383937363b),
('cpu09r4ogap2bk4getsnn9uij0n1rs9n', '140.213.58.138', 1633132033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323033333b),
('cq55b6de2kotdd8ihfr6jb83bsgr7rvl', '112.215.240.51', 1630703877, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333837373b),
('cv3sljfdo1arncaleiv3dpcjor3ddao6', '140.213.59.143', 1632363556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333535363b),
('d16dmb75c04nlaclvg44lqoiada679ln', '192.168.8.101', 1603875690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353638393b),
('d19cvtedqckf9too008t32b4jucglleq', '192.168.8.101', 1603877560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373536303b),
('d44rtu3sigmm7va03lrv8shn9peke5qq', '140.213.59.30', 1630224970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343937303b),
('d5h220ru5ibrfiicie6lv503i351ufkq', '192.168.8.102', 1604208381, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383338303b),
('d5psnndjdjjheig4c2ijh9gvf30k9k0h', '112.215.240.51', 1630703864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333836343b),
('d613ouhtr6ceauqrugaevk1956uvkcfa', '203.78.118.88', 1634471883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313838333b),
('d8bba3b30825dui3qgbl0bos8cuub684', '116.203.134.67', 1630713607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731333630373b),
('dbcjb9udpqd5t6ttkbie2pibvcelnv8p', '112.215.154.250', 1632293164, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323239333136343b),
('dd2l1lo8agbhiva538n37enr887qh2sq', '140.213.58.138', 1633132017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323031373b),
('dd3j8495gns5fpbjdm2fffcjomrirfe7', '192.168.8.101', 1604754312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331323b),
('ddtbnnv6urblut4pv8jhl1rsbeh1vkjd', '112.215.153.183', 1632916094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363039343b),
('dehcuov36k77n4e67qm84ttng3flo7b3', '192.168.8.100', 1604215133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133323b),
('df3gtgg6n1099iieinok0nttofss9coc', '140.213.59.30', 1630239014, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233393031343b),
('dg9vhe94ij9anqrb0lph23svl23q5plq', '116.203.134.67', 1631836808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313833363830383b),
('dgti8kakq2r3l055ruqr4onq9sdn79ss', '192.168.8.101', 1603878239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383233383b),
('dhh48gc214or3ctmajt33t3cdp7795ut', '112.215.153.91', 1633340290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333334303239303b),
('dhnnblm5rf8nmfrpoiber94roag5qf0p', '112.215.153.188', 1630545134, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353133343b),
('dj6l09ngbnr6dkp63kj10eufcd7m79cr', '192.168.8.102', 1604208192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383139323b),
('dm0l7bqv601bjfp6sflgvio65udrns9o', '112.215.172.27', 1632546908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363930383b),
('dofadg8ij3p69ijk5i14af4v1dlgkpm6', '192.168.8.102', 1603907840, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373834303b),
('doplbt5u7usooik09sgmekvj1pjlcgct', '140.213.59.30', 1630238686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383638363b),
('dp1upk4bv263tsl9hk0op75rcno8304n', '192.168.8.101', 1603877835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373833353b),
('dpuh0t8uitl4i0vu675clinl3vevamf3', '192.168.8.102', 1604219629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393632383b),
('drmpcj7rgkl2k63iu7rmhtjheesdqlrp', '140.213.218.17', 1634377256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343337373235363b),
('dtfkf257fbg4doenocsgqiqfgjopkgjf', '112.215.172.27', 1632546705, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363730353b),
('dv84fed3ijadafr362t5vnti6j4lpcg2', '112.215.153.10', 1631425069, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353036393b),
('dvf9dkg4mkbgl8nlg4224ujv26ms4m4l', '192.168.8.102', 1604272775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737353b),
('e4o61sme3adkimd8kg2dbrqq478292mo', '140.213.219.147', 1630714529, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343532393b),
('e4qfuq3q8ugnpadpci2u7nt2jd6e2s83', '140.213.59.30', 1630225053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353035333b),
('e5lgca0c5q653803373ok4i8k69adlf3', '192.168.8.102', 1604220298, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303239383b),
('e6j7e0cnbpb5of43842gpimr0uvvqkgh', '192.168.8.101', 1603875244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353234333b),
('e703qhmb5g4fhl30dortqh8j2gosh7f2', '112.215.153.240', 1632789347, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738393334373b),
('e7nio8fk1jjjltlvbkl1sdnoshi6s1f0', '192.168.8.101', 1603878500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383530303b),
('e87ktecc1klj8fapcf1gtgoahoj1q68j', '140.213.219.147', 1630714541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343534313b),
('e884evve3cupm8bamgccc230acpnea86', '192.168.8.101', 1603874775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343737353b),
('e8e99gslges27ol23g4krdguie4e7gkp', '140.213.219.45', 1631492593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439323539333b),
('e94mor61lvbgeanepoo44knqmmno5l86', '140.213.219.64', 1632463947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333934373b),
('e9m5bqtja2b59lk87eanp1t8gaodp68d', '140.213.59.30', 1630238618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383631383b),
('eaam33fge3jh9khkrhhl7723g5csq4h6', '192.168.8.100', 1604219324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393332333b),
('eabnjoj78cc1r2q10li2c906r2ag9bgt', '112.215.237.228', 1632871700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313730303b),
('ecavcktavdb8dhrt84tknk2lbook1ito', '112.215.154.250', 1632308963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383936333b),
('ed502u2jb7njp9hc9edaqclcmidf55hk', '192.168.8.102', 1604219797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393739373b),
('edcr1u34qb221320a38dbpean91sv1d1', '140.213.219.147', 1630714669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343636393b),
('edqrkv3l642bcqm2h93c4v92ek0f56sp', '112.215.237.208', 1633430893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303839333b),
('edr4nji3moukrrfosj52qrs7b5i91em2', '112.215.172.27', 1632547833, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373833333b),
('eeh7m6i3li9bpla1sv5525vluv1aosts', '192.168.8.101', 1603875251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353235313b),
('ef0e9mog65q1c7qubu4oosttna1j5fan', '140.213.59.143', 1632363099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333039393b),
('eg4tp9l3itk24dekg6nt0qjc31ldovbq', '112.215.153.91', 1633340300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333334303330303b),
('egdicrh4m80c1ahqvj274bil84ge746o', '112.215.241.140', 1631840518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303531383b),
('eharffc093hd8elpo6ohsao8c83i5pn4', '112.215.172.27', 1632547537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373533373b),
('ejobt6vi9u4ldresbb92aifer6n0cn8j', '112.215.153.183', 1632916070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363037303b),
('ekcha8ghk9teosvtd00umj6nrc5ci2es', '112.215.243.10', 1631535490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353439303b),
('ekd6pn9uinrea0vjl880vossca1jd3de', '192.168.8.102', 1604238574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233383537333b),
('emid0k9opgcgmq8b6gij9j92b51csv5p', '112.215.172.27', 1632546731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363733313b),
('en9bjuakj9gp6pa7dqnl538g2taafsaa', '192.168.8.102', 1604220017, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303031373b),
('enckq71cog8vkiltudn0jok6r1d8tej4', '112.215.243.145', 1630631872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313837323b),
('envar9ib1590kt8nnn818faj1f4nv7ke', '112.215.172.27', 1632546953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363935333b),
('eotcp00sj19vfe46c0llgg2ee3p4e003', '112.215.154.234', 1630370212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303231323b),
('eq9h87s478anufvqqqb3q3vsr9u2ioip', '192.168.8.102', 1604229056, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393035363b),
('eqsof8sthtju6t8ci1uk5ssg7e9lsr0o', '192.168.8.102', 1604269236, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393233353b),
('er4nlcpv7qssvt344rpbqughdd8vopbt', '112.215.154.250', 1632309435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393433353b),
('era5ra2nknpnkb1r0t8js44p4k4knq1p', '112.215.241.23', 1631061250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313235303b),
('erjs75cg0s5f80aqvcp82mm5thfgr9hp', '112.215.237.228', 1632871690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313639303b),
('es4ei5h21i8gvs36r0q4966j3cd1rpet', '140.213.58.51', 1632472913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323931333b),
('eucg4t66q0crvjd6v9eghkqmjvmsrqun', '112.215.153.183', 1632916137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363133373b),
('evujiq9d2r39t3geb61u73itbpsm0dhg', '192.168.8.100', 1604215594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353539333b),
('f1i09itd8h15igo7v2mudl0poq47smmm', '140.213.219.45', 1631494544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343534343b),
('f1mpdg90ha5urf7uiighr810l4122csf', '112.215.153.188', 1630566423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363432333b),
('f2ip3uf9juh12fqnpap7t1ggg9s4dcov', '140.213.59.30', 1630238748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383734383b),
('f2ovufp15867i569ep3l386qatqbuqkp', '112.215.154.234', 1630372668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323636373b),
('f3hbp8v1m867b7igtedannnqe378elq1', '192.168.8.100', 1604217354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373335343b),
('f453iqie41vtfk71ht4alv5aaqgf11bo', '112.215.243.145', 1630627281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303632373238313b),
('f45fbo67qn4la2ipgg6mjfv0pmn71dce', '192.168.8.100', 1604210972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303937323b),
('f6n5n54hvpucide3hmv3op1cden4r325', '192.168.8.100', 1604218572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383537323b),
('f9dno2k35ogeq3idormjp5odt34j2f1l', '192.168.8.102', 1604239375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393337353b),
('f9i1iie4gn91lllgrklml1lsd6qi4bie', '140.213.219.45', 1631532728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533323732383b),
('fabcg7fi0e7n73mrlqugdug4n0h550th', '112.215.172.27', 1632546873, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363837333b),
('fcfca7msvbf0346j3q2n8v049o3mlfl1', '140.213.219.147', 1630710813, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303831333b),
('femvbkvg8m8qs5s061af5jvs5p146h4t', '112.215.173.148', 1630919308, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303931393330383b),
('fji19s7hgen444rh2lo60o4sh1kcu3d1', '140.213.219.147', 1630723670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333637303b),
('fkd0s7fh27eqhq8m2c4aaeofd917tvkp', '192.168.8.102', 1604276667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363636363b),
('fkfpinbj9arn2ubcg3mevso2lk4j0i6c', '112.215.153.91', 1633340285, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333334303238353b),
('fl5l1fddmva5mtbtj08vm8oujetj6egr', '192.168.8.102', 1603907939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373933383b),
('fm8t0tmpkosd5dsqfar608qtqv3fc6ht', '112.215.237.228', 1632871572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313537323b),
('fmhpta0608di4taqc9rbb3pfk8tffmvr', '140.213.58.51', 1632484321, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343332313b),
('fo4btkbmefgar0j0qc6gietd19elqefs', '140.213.59.30', 1630238954, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383935343b),
('fov7gem1do08cp6u6b3eh5u9cr6inf3t', '203.78.118.88', 1634471869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313836393b),
('fpl66hkrp44qdoqm11kngu4ill2n6554', '112.215.154.250', 1632308754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383735343b),
('fq0esm20q2rqchqgn0m6n19q7gb0agpo', '192.168.8.100', 1604211126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313132353b),
('fqr757969q3apiangl8caolnhhfkkuvg', '112.215.241.140', 1631840737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303733373b),
('fr98hjo1v7kj2rbd2gifpj5ofu5ivo4j', '116.203.134.67', 1632614407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323631343430373b),
('fsf5m0gve02s7isupclncnq7hqrd13pb', '140.213.219.45', 1631492590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439323539303b),
('fu3g7fsa9005gp9qt4hbq0g29rf3rm8l', '192.168.8.100', 1604218375, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383337353b),
('fv1qs3n20k4h5aqq5k0pettakk621chl', '140.213.219.147', 1630723669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333636393b),
('g1gt5lskvp6g6tbkrgofe2sih14t1oif', '192.168.8.102', 1604272860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323836303b),
('g21ioevke9n0op442a54sk36ape07j8u', '116.203.134.67', 1630800007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830303030373b),
('g265q1tkccndop9j0c4uto1s4849en23', '140.213.219.147', 1630710615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303631353b),
('g2bbq7b2u5rino5igg3e79t177qqus75', '140.213.219.147', 1630714757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343735373b),
('g5c0hogs22gbpc7rq1hnur85puhcbjbj', '140.213.59.30', 1630238702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383730323b),
('g5qcjlv00lgib3v4aokrec06epceufd1', '112.215.153.10', 1631445357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353335373b),
('g5qft15loe6f97ig9ohqe9fm958qa7rr', '140.213.56.6', 1630506025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363032353b),
('g9t3m68ue1iui01o6u7qup1abjo63vqf', '140.213.219.64', 1632463968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333936383b),
('giccs66pie3ij74f0hien73g9h00dba5', '140.213.58.119', 1632640019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634303031393b),
('gijc8uj01jp5eo744moh08fun92e52kb', '192.168.8.102', 1604269756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393735353b),
('gijf88gak6apnn3ncuflojqja6ntujoq', '192.168.8.102', 1604269333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393333323b),
('gimdvibioutk9m3lur24j3e1r0nq7a6u', '192.168.8.100', 1604215501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353530313b),
('gkj0v8dq2n61derbob1vd3u5et40r67t', '112.215.243.10', 1631535626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353632363b),
('gl3n6i7rvnncp3bit8phbg6oqsgmajia', '140.213.219.147', 1630710744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303734343b),
('gm6hfjgfmv7uff8r60bcfg3t5oavh5c7', '112.215.172.104', 1630806085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830363038333b),
('gmaltig0bs6hf8aemi9llo67l51511et', '112.215.154.250', 1632309817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393831373b),
('gp56ofb9ltbm4mjk9pen8cpc49obcb4r', '112.215.153.188', 1630545133, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353133333b),
('gsubmfn6lgc5togo7nnht0nrqoj4li08', '140.213.218.205', 1633083099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333038333039393b),
('gu6m9m1qluc3d1s3kb0vs9b8vmg27sdl', '192.168.8.101', 1603875457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353435373b),
('h19jpm2tsd42oubio20lmirq6p0is6ed', '112.215.154.234', 1630372652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323635323b),
('h1qnpboru45qvjocoeruvpfkm1asnp1f', '192.168.8.102', 1603907781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373738313b),
('h1vdkk36it4dlj4cps4gic24hg3ebni5', '112.215.154.234', 1630380491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303338303439313b),
('h34376mo1iug7q2gp35g63hok4u5he1c', '203.78.118.88', 1634471876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313837363b),
('h46tanlmvmj7a99re0sm7vg3dn45d29t', '112.215.172.27', 1632547518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373531383b),
('h5bi3jcs6prbka2o1r6gs6dshp139ugr', '192.168.8.102', 1603907780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373737393b),
('h79130pm9vk8o2u40c9o5mb7egk2cgb9', '112.215.241.228', 1633748100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383130303b),
('h79lj553u4lisl0dbpqt8kudt9gsb3lh', '192.168.8.102', 1604269961, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393936313b),
('h9p4sbe7ctoif3sl37vaqtrd50n99ub3', '192.168.8.102', 1603906169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363136393b),
('ha7djamhd0c54i1scrdfic0tjem8lp96', '192.168.8.102', 1604272859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323835393b),
('haa8l8jp05si50v04eq2pcdrk1s35pv7', '112.215.240.51', 1630703844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333834343b),
('hc17f8fru473j72pb85cutrit759qpvb', '192.168.8.101', 1603873518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333531373b),
('hd8bgdgm3igocripjjcdgea3e6qvqo6r', '140.213.56.6', 1630506169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363136393b),
('hdar7f1r149uroiqa0edcrik66eknc1j', '140.213.219.45', 1631532733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533323733333b),
('he58b0rgiaevvjhllmt425lb1umquk6d', '192.168.8.102', 1604269251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393235313b),
('heenb8mt38fh1ou4q29maongd6j63jqg', '140.213.59.30', 1630238866, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383836363b),
('herlc920bjivbb4a5qp7c44h4vdv4enl', '140.213.59.30', 1630225101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353130313b),
('hfci70ro00pfdv15cr6dam2u333sncmt', '116.203.134.67', 1633564807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333536343830373b),
('hfqsphq1ma148c5nc8ivhishfpbpcntr', '192.168.8.101', 1603878149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383134393b),
('hgf9jtl25bd29f272el4bod0j6pi038h', '140.213.58.119', 1632645921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353932313b),
('hh2nieae5qik3c4ras0klv4s77ut7t1f', '140.213.59.30', 1630251170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303235313137303b),
('hjdo9j71a32qoqfnokdfr4v0pvnnqbis', '112.215.154.250', 1632308943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383934333b),
('hk612lfrciui3ptub14la9a382vohrke', '140.213.59.30', 1630238652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383635323b),
('hl3qfsb7kse63trvpkdp2q11alh5ipj3', '140.213.58.119', 1632640006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634303030363b),
('hl9s7rv9sp6e9g3qls0jm3h8gbc8tt1m', '116.203.134.67', 1633305607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333330353630373b),
('hm1hv6b8uslk6l1c7je0qkv82pnnn2ve', '140.213.59.30', 1630240518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234303531383b),
('hmkdkarp6c2jcojaj5bg59qcdp71ghii', '140.213.58.138', 1633132030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323033303b),
('hn1pt8ef3jdmt3bjnjmtmpr67rmnddnh', '192.168.8.101', 1603878220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383231393b),
('hnikod09f0s3u9kkh56j83jpjgft9aie', '192.168.8.101', 1603878936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383933353b),
('hnqeph7vb3o4toi860v8v6sbgi58b4c4', '112.215.154.234', 1630370146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303134363b),
('ho18uch7h6v3ohj2ant6j3vgmrhg9nq1', '192.168.8.102', 1604276363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336333b),
('ho88k3rujrhu36b8e4p2aa4aga12aomu', '112.215.154.234', 1630370040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303034303b),
('hon1027nuvc4g9pcc8a060repe6d6sfv', '192.168.8.101', 1603878987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383938373b),
('hrj0cent6rs6l0cm7239vaf5nob6l0fj', '112.215.153.240', 1632789349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738393334393b),
('hs3bes1j70530cednan6rcnisgk66eep', '192.168.8.100', 1604215131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133313b),
('hvl724lmuf7r2533ruec2njrr9l5d2dt', '112.215.237.208', 1633430885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303838353b),
('hvnivnj03rcttr5vbo5jkl6t0lq4p31e', '112.215.172.27', 1632546991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363939313b),
('i0rg77ejkgjjha1qtb8olg2nm8h5c8au', '140.213.59.30', 1630240558, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234303535383b),
('i130oeejdlbgtc8kspa3t3ikhaebt8tm', '116.203.134.67', 1632009608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323030393630383b),
('i1lgk3t53vich88ul1jl0u3vh72op3ld', '192.168.8.101', 1603874770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343737303b),
('i39jhqbuug1116n4ncrenshtebh8dj62', '112.215.172.27', 1632546860, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363836303b),
('i512nmd0ilpfmqop84hgc4vp42up1c2c', '192.168.8.101', 1603878163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383136333b),
('i6fpqmrjnl19c3ka6r1uv7l0hq49l621', '112.215.241.140', 1631840703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303730333b),
('i7gbiu5jr622r4thh0ns1lrmgo4kqt27', '192.168.8.102', 1604276767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363736373b),
('i95apcr3ad9irnj2je0bbk0kmqbtpl7e', '192.168.8.102', 1604239362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336313b),
('i9g3jd6e4qgk3un226gggp1d43iutrtb', '192.168.8.102', 1604239487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393438373b),
('i9j179uqmvhlcnhc1m9skjohjoe45din', '192.168.8.102', 1604220921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303932313b),
('i9jjng65a2sohdnc8iaq7881h1v7di10', '140.213.59.30', 1630238949, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383934393b),
('iab4juhalrf6tc6663436478q2trvsrn', '140.213.219.147', 1630710764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303736343b),
('ibrpqukg8hi27ig5heogftgi166ftj3r', '192.168.8.102', 1604268554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383535343b),
('ich3a6p5hv8uv5f0j8sbgk61eki3tl5q', '192.168.8.101', 1603874844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343834343b),
('idapsvgisndl1k76umjnv3vt882okj6e', '140.213.59.30', 1630238859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383835393b),
('ifmhd1eg82j0ra3qhn3ulfo9hmk84dnv', '112.215.154.217', 1630321104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303332313130343b),
('ig9arseuti8f5q3hbkjuq4g29bel8b56', '192.168.8.100', 1604219402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393430323b),
('iifkbcscjuhq7aneho866qkuuldsmugg', '192.168.8.102', 1604271250, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313235303b),
('ikkmplm6qt06n2ugtsjdn1eo988iibep', '140.213.219.147', 1630710778, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303737383b),
('ikop5jmjkbav0ifbm6epabqkb1ki4lor', '112.215.172.27', 1632546655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363635353b),
('inmtfgd6h5jpsde0c3s2d78o6d11f3o7', '112.215.241.23', 1631061217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313231373b),
('ipns593457po8go76aunhlh27625fl91', '112.215.240.51', 1630704152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343135323b),
('iq30i0pru6n5ihbb9mo6et087uenqt3h', '140.213.59.30', 1630238993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383939333b),
('ir7d7v8c448ap8ruu8upse2ic38jh6ov', '192.168.8.102', 1604218190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383138393b),
('irss3lstjeri4dh4ssma01p4akaonkm7', '112.215.154.250', 1632308936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383933363b),
('it4876vpiegdnhddbq8rprqqjpahdm9o', '140.213.59.30', 1630244148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234343134383b),
('itvjgsgea3gsga33g0pv4j79o8t04fub', '192.168.8.102', 1604229145, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393134353b),
('ivbqo9c8mqafta5hh4vkbsi7g1ji4o16', '192.168.8.100', 1604217339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373333393b),
('ivo272erjflmpacdi6h6fjm8e0juvdfl', '112.215.240.51', 1630704387, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343338373b),
('j04m51ivch86r8op4re3b2ht3lbkr7e6', '140.213.219.45', 1631492572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439323537323b),
('j2474jcdjufus1ovoovsd4k2kprjl5j3', '112.215.240.51', 1630704273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343237333b),
('j3006va0rgisdst761hpfj3ntf03claa', '203.78.118.162', 1631239420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313233393432303b),
('j4e1iv4nhbg575uota8jn9pveg9adoif', '112.215.241.23', 1631061258, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313235383b),
('j51008ahe1aa0pcaa1ecf6jrnhruko3u', '116.203.134.67', 1633824007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333832343030373b),
('j6hfjsug4scs0j7jp50gqpmsjn8li2cd', '192.168.8.102', 1604272440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323434303b),
('j6ioo86v7cbb34okcdfrjcrk88p2l8mi', '140.213.59.30', 1630226544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363534343b),
('j7674dc33saprte7nuvg706mp4vuliiq', '140.213.59.30', 1630224752, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343735323b),
('j8qvh9a93qsj6lt9ei7fj5km719278ua', '192.168.8.102', 1604269847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393834373b),
('j97ja5a7827kp7ladoeo4aevj8lilb2i', '140.213.56.6', 1630486063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438363036333b),
('ja6tmpduhddja3e2sqbeihun36src785', '140.213.58.138', 1633131764, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133313736343b),
('jb56rm24jh535dgh6ugmp3f76enccjeh', '192.168.8.101', 1603879122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393132323b),
('jh83iaog0qs6tpj8jg3snjkq7352c1p2', '140.213.219.147', 1630710824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303832343b),
('jik9lf0mljalousj9ppu1s8e9c8coail', '192.168.8.102', 1603907533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373533333b),
('jjcen8r1mtvnv7vgrm6peb2452nslovi', '140.213.56.6', 1630505859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353835393b),
('jjfrud10vfkag940vm4cgrb470ab9qou', '112.215.172.27', 1632547768, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373736383b),
('jl019rio4rlpobl5kbr2gbkbf2eui5t6', '140.213.59.30', 1630224962, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343936323b),
('jpk189493o403j30s8u5cs650o1l7q38', '140.213.219.147', 1630710751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303735313b),
('jqhdcn4fabm6jicdmt6em42kp91tgvtd', '192.168.8.100', 1604218712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383731323b),
('jrd4gqhuov1bqetiugn5k4gqcuc01qqf', '203.78.118.195', 1633863299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836333239393b),
('jskdnjpaosr4qd7u9dn6c9u4bofp577v', '116.203.134.67', 1631750408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313735303430383b),
('jtf9j93bdvjut9lj99q2gg86as7vr9di', '116.203.134.67', 1633737607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333733373630373b),
('jtp6f2qjesbe8i6ii7pkqe1abho9emo6', '112.215.154.250', 1632309428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393432383b),
('juiq85qd0si14j8qslfnf9cv1srbffk4', '192.168.8.100', 1604218579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383537393b),
('jvc1v2ed8dsvs6i4oo8a5mtcu1125kfm', '192.168.8.100', 1604215099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353039393b),
('k0dq3qo6q5ali5qqeoqo6ko04s689dab', '192.168.8.102', 1604275277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353237373b),
('k0ii4va55t2fhb3amcim2lnt5j2l6oa7', '192.168.8.101', 1604754319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343735343331393b),
('k2l1k2ea8j56umlmi5la4a72n8bflvf6', '116.203.134.67', 1630454408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303435343430383b),
('k3hs4lg74qli0g3sq5qgo4dndpiifbee', '112.215.243.145', 1630631936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313933363b),
('k429hmj42ftet6cah85ln42f75534vmo', '112.215.153.10', 1631425050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353035303b),
('k5qoudph7ud7v9rs1179i8v9ojf185t4', '140.213.56.6', 1630506094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363039343b),
('k68tcsa9qltgbj9bo8aoua0rf7r1j017', '203.78.118.162', 1631239416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313233393431363b),
('k98olk9fkh83sm1i1ddlv59439gdoqv9', '192.168.8.102', 1603907591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373539313b),
('ka8hpat0u98se9fk2hnqtgrt5795n2qc', '140.213.219.45', 1631494543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343534333b),
('kb619og2e49uatt1is9rt0qfbo7163pp', '140.213.59.30', 1630240515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234303531353b),
('kcdansoonkalrk3mfl5t170ng4v03dpg', '192.168.8.102', 1604239422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393432313b),
('kfphihhffc267l7ghfcedqvh7rls6u3k', '192.168.8.100', 1604210919, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303931393b),
('kftnnhjdkubmkc068s2kkhh7td5fm1oc', '112.215.154.234', 1630370067, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303036373b),
('kicqck6p416vmth6r01hiforj0d83oem', '140.213.59.30', 1630224922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343932323b),
('kiv5mf62h7rvbt8h87e701ac2fikd2i2', '140.213.219.64', 1632463948, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333934383b),
('kjha1pi6kk39eb0rnummm0khqgud0c18', '192.168.8.101', 1603878292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383239323b),
('kk04f2ebn433la1vn8itkqtvv09eqrc5', '112.215.172.27', 1632546884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363838343b),
('kkmglm7cg6q3mkseahee8c4lrld33cec', '112.215.242.139', 1630965915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303936353931353b),
('kknehu4tdikr196c0v4mnseri9cskoa3', '140.213.58.51', 1632472892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323839323b),
('kof0cs412vi267f04mhmf9tdae3c03qi', '112.215.172.194', 1630748913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303734383931333b),
('kot60k0q83e50a1m8l7a0p9a4l57ptgp', '192.168.8.101', 1603878435, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383433343b),
('kqeko87gp7nlom8mji85eok46iqgeavi', '192.168.8.101', 1603878329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383332383b),
('kqlpg8esdpifpihk4sr60ogjpt90sl40', '112.215.153.10', 1631425109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353130393b),
('kr4mp5k21oqltqjh12lam1e9n6s56vhd', '112.215.153.10', 1631425147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353134373b),
('kud25ud3cn8d0pgt146pcm9pb9anatu3', '140.213.58.138', 1633132097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323039373b),
('l22kdu4f0kepji911ugklkeunab14d16', '112.215.153.183', 1632916065, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363036353b),
('l2njb8u2ng0ap750pj3godtenfkgm5pc', '140.213.58.138', 1633132127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323132373b),
('l2sed3mscmn0134ecatealn9ut6uvsdd', '140.213.219.45', 1631494526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343532363b),
('l49hh6fltvqdru0n7sm39vhoa4hameb9', '116.203.134.67', 1631664008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313636343030383b),
('l562f166cajvd7egoos5rag8usd8pho6', '192.168.8.102', 1603908913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383931333b),
('l5svdlmgieceakb142nqe9kavgbk3mm4', '140.213.58.138', 1633131731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133313733313b),
('l66vs51ofl1hav5rc3jjr7hsq7id0jik', '192.168.8.100', 1604218368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383336383b),
('l9bisp4n3tp9gmuk2945l2t3bl6lmm97', '140.213.59.30', 1630238446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383434363b),
('l9prs5opg25d434e97gsoglqu6nhll2t', '112.215.172.27', 1632547467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373436373b),
('lahk2knk6r468ns7qr92581c7s6v3ob8', '112.215.241.140', 1631840619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303631393b),
('laiasbgh07br4ht8i02vqdnnn0r46mkl', '192.168.8.102', 1604220195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303139353b),
('latpnmc91hngsgr2fktn5le2hdseb3ke', '140.213.59.30', 1630238641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383634313b),
('lbli83u4fhi2mhapve12ls63c44don4b', '116.203.134.67', 1631923208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313932333230383b),
('lcfc444tteae3dbavt33njosafglfa6c', '192.168.8.102', 1604220360, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303336303b),
('lcqpiehhe50inhcf52drir01879snhan', '192.168.8.100', 1604215458, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353435373b),
('ld5no8mjk6v8biq3n2ekphg9hidi8h7k', '112.215.243.145', 1630631740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313734303b),
('ler4qu41knegns8moj4gt5qeot2taoqo', '116.203.134.67', 1632182408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323138323430383b),
('lf9qcrbhe5iok8dfc0ivnq9g9b7vrbil', '112.215.153.240', 1632789413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738393431333b),
('lg2kr1qbc5puqu3rqs9qjvqln619ups9', '140.213.219.147', 1630710609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303630393b),
('lguu5stsqi80jb454h74mgr0fkj43oe6', '112.215.154.250', 1632308844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383834343b),
('lhen3606cfnoa8qkslcn6mn9ar9i2jpb', '192.168.8.102', 1604228297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383239363b),
('ljbsjj7994rmqk0v6nq5k36hbbc63d2r', '192.168.8.102', 1603907921, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373932303b),
('ljsfcoagihmsa6j4ic61nedtdg7e5khs', '192.168.8.102', 1604275076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353037363b),
('lkv30t5b7uthkeo3258avrsoq165k1e7', '112.215.153.91', 1633321731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333332313733313b),
('llgtbthib0ml35vbsrib3ctrg73hfu15', '140.213.219.147', 1630710608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303630383b),
('llr6laf8ksilomhmqallgkpjoqnhf07u', '203.78.118.88', 1634471858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343437313835383b),
('lniqddgbh0nr5kn0fskckns1f2pncc3t', '140.213.219.147', 1630710765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303736353b),
('lnpch6vvdu8ibin7m3mctf2djqfsc2ij', '140.213.59.30', 1630238634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383633343b),
('lqh61jn3r6kevikf01min7hse16fmcf5', '112.215.153.10', 1631425263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353236333b),
('lrc0jr1cohu60i97h08h065trjotrni7', '192.168.8.102', 1603906235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363233353b),
('lrjlqmcjpjk1rv34np2415rvn959lhgn', '192.168.8.102', 1604229089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393038393b),
('lt993c5ucdsqa5708j5uc1vce6qotcht', '203.78.118.195', 1633862555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836323535353b),
('m0rbu4ma2t3tc8gaujqkrgdurtm3sp7n', '112.215.172.27', 1632547240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373234303b),
('m1h03g3smfr1g9dftq75pjitgn3b1d78', '112.215.154.234', 1630372539, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337323533393b),
('m3os72r1jmlp19r29nvfag0s1luouj90', '112.215.153.183', 1632916120, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363132303b),
('m3vjsjarpruq50o0k4c0bipd9miujl0n', '112.215.154.250', 1632309126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393132363b),
('m72kqv9d2dvks42ocs2scnhjf2852fdh', '192.168.8.102', 1604272855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323835353b),
('m73ledq2f9cdq0bp1tnc7bb2v44t8as8', '112.215.172.27', 1632547326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373332363b),
('m8rr0kbltdl8p8n3it2e1v85d33soalc', '116.203.134.67', 1632700807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323730303830373b),
('mca2su8t7n3j4cm8vge7ji7bf112q0dp', '140.213.56.6', 1630505846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353834363b),
('mcnhcbcv12t7qikpit8ra3j3vl1t6v0c', '116.203.134.67', 1633478407, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333437383430373b),
('md0kdfiajs5ait33tgp92m3juf9dlnd3', '140.213.219.147', 1630710742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303734323b),
('meh5594fhdnbkun2n9lqhqpgl9qoikk0', '203.78.118.195', 1633863319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836333331393b),
('mfmkl67prrfjs4030l4m1r42h6mafo6o', '192.168.8.102', 1604219149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393134383b),
('mfve5m1sqa8di0t41ed4488ltms169p5', '112.215.153.10', 1631425068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432353036383b),
('mh2tl58kkoun8c1129o6rvmbqvj5knjp', '112.215.154.234', 1630370060, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303036303b),
('mh75o1q191552158h7rtcome2a92e0j4', '112.215.153.188', 1630545213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353231333b),
('mjlv0ocqkk7r7gd7umvov055c9chn3he', '112.215.237.208', 1633430941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303934313b),
('mkuhke8ahl5i0pmu56tis6lp5gfpkrec', '192.168.8.102', 1604274902, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343930323b),
('mn2cej2agv5ids386ll4uebg7bi6ujhj', '112.215.153.188', 1630566378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363337383b),
('mn505b3ecimuioc9ml60636gtlkoqn95', '140.213.56.6', 1630505684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353638343b),
('mnchcue1caopi0peg30g92hosjdgkfie', '192.168.8.102', 1604208216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383231363b),
('mndqucvhehtkmup19h3l61bcqa5t1je3', '112.215.241.23', 1631061216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313231363b),
('mnudsonvg2t49ub0ge25jdsi7e52gsg6', '112.215.243.145', 1630631956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313935363b),
('mof4co60lc84fkmkve9j57n31t11av4q', '140.213.59.30', 1630226556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363535363b),
('mr2po0kv1rj982ee26v4kt0ifsdj045r', '192.168.8.102', 1604269844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393834333b),
('mrrn3u2c82rusf8cb99dueq0d9435s3p', '112.215.242.139', 1630965880, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303936353838303b),
('msre5qf603g244aja8dhp8s7uuk4ofmq', '192.168.8.101', 1603877521, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532303b),
('msvhao011bcgfgg223do5entrub0vc04', '140.213.219.64', 1632463963, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333936333b),
('mujren0rtvj0nvegh64hi07ik4rfl896', '112.215.172.27', 1632547248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373234383b),
('muus50g77bnv15uja8kbebdocdtvckjq', '112.215.173.148', 1630919309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303931393330393b),
('mv27tnfrm2916h49gd7o5blpi7fp601q', '140.213.59.30', 1630238438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383433383b),
('n0ga9rpop8n433l4ef1hskcu62aercvp', '192.168.8.102', 1604268465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383436343b),
('n352k3rvhdg5au4p00jad682flla5f2i', '112.215.172.27', 1632547263, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373236333b),
('n35o82sijmv3a7nldfelhb3up9epe4qs', '192.168.8.101', 1603873875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837333837353b),
('n41mjdfb5urcr7e2tft3oatvrp11v4bi', '192.168.8.102', 1604218351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383335313b),
('n5r78v92tmbv4j55aukpi27mrc0ek29c', '192.168.8.102', 1604272779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737393b),
('n5s2hslethu3kfg0g956v3oarulsi6kv', '140.213.219.45', 1631493511, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439333531313b),
('n6rao14qme1433amste1019pefgii97t', '140.213.58.51', 1632484278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343237383b),
('n6s7kiq9ulk0brd4fgcli3tjpc65hhap', '192.168.8.101', 1603879111, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393131303b),
('n75jc0feprlfk14cejilnah6cg26qfd0', '192.168.8.102', 1604275161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237353136303b),
('n7pmhmq21r9sth4buu6mlecfccpev0na', '192.168.8.101', 1603874792, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739313b),
('n8ffka7i7ngbk17pn8mnimctcnq1tov9', '192.168.8.101', 1603875261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353236303b),
('n8ungb39930d915mtkn98sgf2moj92el', '192.168.8.101', 1603875455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353435353b),
('n9ddeiit6d9b1ur6086o0u858pge8uut', '192.168.8.102', 1604271232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233323b),
('nad8l07hh4i9c0qnktas1mmds8dletgl', '140.213.59.30', 1630238893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383839333b),
('narie39b3oieak97p6j2g9jdp0p5j1ni', '140.213.219.147', 1630710692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303639323b),
('nauup02470v992dneo0g93p03e8sikb2', '112.215.154.234', 1630370229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303232393b),
('nd2f5860c50456u7ahaan3gsavrkpr9j', '140.213.58.51', 1632484198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343139383b);
INSERT INTO `ci_session` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ndb7b1iuh8cjll1qppgrq5521ftbek14', '192.168.8.100', 1604211002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313030313b),
('ndittlm85g0mlj42f495h3hsck2k9p3k', '192.168.8.101', 1603874900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343839393b),
('ndt7ins2p817n6venmofsbioh2iasftq', '140.213.59.143', 1632363519, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333531393b),
('nfmhpdgsfar30hocgmrn2g63o78r6alh', '112.215.241.140', 1631840729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303732393b),
('ng4s6lst4r63c0gcj23eintm71q9hebu', '192.168.8.100', 1604214876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231343837353b),
('nhiujtk5jm6li6f86pb0d565ge304tk7', '140.213.58.51', 1632484276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343237363b),
('nifgc4mkjdejuktuehcv92bunqgrimn4', '140.213.219.147', 1630710715, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303731353b),
('nj7j2h6jgvtv1k5v2g0k95srqrmahmc1', '192.168.8.101', 1603878979, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383937383b),
('njhrvqsnadh0521j5936b8encktg0tlb', '192.168.8.102', 1604276329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363332393b),
('nkf0c4j180d8ptgn5rg6ic9bll7u9k5o', '140.213.219.45', 1631532730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533323733303b),
('nm6kqfgmt39330o9gbhpscm13kt22hg4', '192.168.8.102', 1604274908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343930373b),
('nmbof7noaj694330e05eacokm0rkc5nj', '192.168.8.102', 1603909542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393534323b),
('nmog2httm9d144dgne5p1k1562bb6ued', '112.215.153.10', 1631445535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353533353b),
('nn2nctq3cu3ibn35bf250tj37jjmod6r', '112.215.154.250', 1632309891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393839313b),
('nn8bf4udgsrbpsj64lh6ijq9kndnhm3p', '192.168.8.102', 1603908291, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383239303b),
('nolca8b6bpnem8antcdiaf8o2jvcgoun', '112.215.153.10', 1631424983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432343938333b),
('nsilm5taf7609glapla4nh9mj9le2fkf', '192.168.8.102', 1603907587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373538363b),
('nt29tut7hbtjvc37ca6vb4talnved4ua', '112.215.153.240', 1632789337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323738393333373b),
('nu6mo6crpmtjnmrfo5lc58udukus6iqh', '192.168.8.102', 1603907904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373930333b),
('nva7d3ofksc0do535sm5qde5l7gd3meq', '112.215.154.250', 1632308743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383734333b),
('o1f8g0sslpa4csa1d2sgdualdkn6n9hb', '112.215.172.27', 1632546788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363738383b),
('o1r93fqb45u8l1ct9jobb6sghgmbkr0l', '192.168.8.102', 1603909237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930393233373b),
('o3mbs1e4pk9qd832hfropsfkpjk4csc6', '192.168.8.102', 1604219799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393739393b),
('o56qd16ckgtb1iep4k17v2hnp33d0aba', '140.213.219.45', 1631532704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533323730343b),
('o5thb2andn9a0dekq0usnhbpklahd3h5', '112.215.153.10', 1631424927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432343932373b),
('o6jrrfl95g611gcqj1akqlh0cir9bu9h', '112.215.241.140', 1631840743, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303734333b),
('o729ephuqk1htbmvhjoot5808brpgqcl', '140.213.58.51', 1632484275, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323438343237353b),
('oc7ud79s2j3pvn4t2oep216lcgiegbmg', '116.203.134.67', 1634256007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343235363030373b),
('od8gc7jujgqh5ts8ai5hhe8l2l6m5sm7', '192.168.8.102', 1604226514, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232363531343b),
('oes0r0lcuvh7ccsrv55914jnoouasu19', '112.215.172.194', 1630748972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303734383937323b),
('ofatd1jfl98g44hc5m2gdnbmte6tb7n8', '140.213.56.6', 1630506158, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363135383b),
('ofpu268u214lrglne3sqau6cvl2mj3bi', '192.168.8.102', 1604269965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393936343b),
('ofu2r0chs54rpfb3utcq6tstelikg421', '112.215.154.250', 1632309414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393431343b),
('oh53so44abufbndct9t4pn849o28iit6', '192.168.8.100', 1604210697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303639363b),
('ok6o99u1smpdcl1pmfrbk6ct7b0dsr8f', '112.215.154.250', 1632309754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393735343b),
('om236kp0viakmu455ct49pb10l0os9bq', '140.213.219.147', 1630710802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303830323b),
('om7r6elji3j2ccp0o235mvr7dv63tmmi', '112.215.237.228', 1632871581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313538313b),
('omgd9m27hsgqma2fghahj1evt4b42vsv', '112.215.237.208', 1633430862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333433303836323b),
('onbgvmoq6hd6dndbou3o08of5pdctg6p', '112.215.241.140', 1631840706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303730363b),
('oqu94g3b44hvpsraq11ul4nelg9r84hg', '140.213.59.30', 1630239004, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233393030343b),
('osgg7qf1jqfk843v6r4o6doda90fc6db', '140.213.57.48', 1630294555, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303239343535353b),
('osug7l9lls7erfapq805tkh4srfdtj4t', '112.215.241.140', 1631840483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303438333b),
('otq230m091ql4mtpbacc1tmcgm0jg4c6', '140.213.219.147', 1630710812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303831323b),
('otsqkmh7p30fokd89fe6ripps6o6lso1', '112.215.241.140', 1631840481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303438313b),
('ouepnr3huc3nh0m4k4aa2tsr9narnlvo', '140.213.219.147', 1630714640, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343634303b),
('ovihn7s8inprg4kvoqj2sg54a694oghq', '192.168.8.100', 1604211078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313037383b),
('p0avqd2ss6vqk747c3isvr4d8d65rhfn', '192.168.8.101', 1603879099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393039383b),
('p1722oj29gs8oho5cqpibee76q0vvhad', '112.215.243.145', 1630631864, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313836343b),
('p1722rfj7912mmvo4a788kcauqt5a7kg', '112.215.240.51', 1630704177, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343137373b),
('p1begid7kce6vnu1n3q8p5iahtp6jkfb', '192.168.8.102', 1604268562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383536313b),
('p2hso8cojf9986ej2ic4fkr08efkog27', '112.215.240.51', 1630703834, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333833343b),
('p38am53fs5km81ssg5oversunok2bm0g', '116.203.134.67', 1634169608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343136393630383b),
('p3o9hh6ubolth7i3boilim6a094r02qd', '192.168.8.102', 1604269244, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393234343b),
('p4cjtjp0317257bne36vuts0diculrsr', '192.168.8.102', 1604272776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323737363b),
('p5okvt172pup6p01ks164saang8084lf', '140.213.59.30', 1630226579, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363537393b),
('p75bmg2so6mughrbuvc54dem16trj5k0', '140.213.59.30', 1630238741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383734313b),
('p7iuddh2it0verhf6von7psv88oqrrnt', '192.168.8.101', 1603877827, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373832373b),
('p8ppk4129rfv1b1glnhsa5uu4ndmr7dn', '192.168.8.101', 1603877225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373232343b),
('paeb3srm1igif6fgrjv23odp54kel60k', '192.168.8.102', 1603908277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237363b),
('pb9b9i4vbkpss9emfp0cgo8dmd98n3qt', '140.213.219.147', 1630710819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303831393b),
('pbb5ams4mof0k2par0e10fk91ju7m2m7', '192.168.8.102', 1603908255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383235353b),
('pbf2f8s6d9f43alpn8u1ppdetu7gucuh', '192.168.8.102', 1603906188, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363138383b),
('pbkpbhdu76656t7uvhj8p2c7eq1mj6uo', '140.213.56.6', 1630505934, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353933343b),
('pcpj3n1d0gqi1eedp7tpj0a2336hcsnc', '116.203.134.67', 1632873608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837333630383b),
('pf3i7gm7tjer6gu7ummdiaqbshsele30', '203.78.118.195', 1633862554, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836323535343b),
('pfauk1u06pg87k6e2jf2h8lkqs3h4efu', '112.215.172.27', 1632547619, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373631393b),
('pi5sd93ieg83q46g46higo9e2l47fl9i', '112.215.172.27', 1632547575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373537353b),
('pijupcuhmebcphp4pob7qjt3prkock70', '140.213.59.30', 1630226414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363431343b),
('pitvoo2ua3fj6l81tkkd11b011srspi0', '112.215.153.183', 1632916097, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363039373b),
('piuuse2gm4imbeqtimhaa3t9p91t3qvm', '140.213.59.30', 1630224839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343833393b),
('pjk26n3pi0gh57juh6p9355r65v10j20', '140.213.58.138', 1633132070, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323037303b),
('pjm5hrh033csk1pna272vl4dojrmmsh6', '140.213.218.205', 1633083125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333038333132353b),
('pjvrta22l6ic107ut4os1pjcatjijmjf', '116.203.134.67', 1633996807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333939363830373b),
('pk8a77ne2mopi20llsue9pkbpkch0h6e', '112.215.172.27', 1632547230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373233303b),
('pktkn97hnu7olp9gekjp82mfee2g9er2', '192.168.8.102', 1604268967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236383936373b),
('pl2acoqmfp5318c8g9ouqnl6ohg1rvm3', '192.168.8.100', 1604219254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393235333b),
('pnccormqgk6hc3nnifrl1vb40a9jbokt', '112.215.154.234', 1630380497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303338303439373b),
('pnj3ratu0e8ae9kbe8lc53g2gq5conbb', '192.168.8.102', 1604220192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303139313b),
('prp1gvjevdsd6g5ns2c8i96l98h08kaf', '112.215.154.234', 1630370019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303031393b),
('psfiqon466sn1m9ac4rb31d8hvnsg5hk', '192.168.8.102', 1603906489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363438393b),
('pt19ifbdao8ui299d9ls5kvkveh6qbdo', '112.215.153.188', 1630566307, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363330373b),
('pt8e6n9srk1m4ocpt22vs6lfv4d3b5h6', '192.168.8.102', 1604220122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303132313b),
('pugm0uks5tru58djfblbt97thphf8q44', '112.215.172.27', 1632547606, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373630363b),
('pur5s5qni4i3pv5b15v6i0n6fhir29rb', '192.168.8.102', 1604228420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383431393b),
('pvh6gf5mcj03ltfkl8phhi5vef854gq8', '112.215.154.234', 1630370075, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303037353b),
('pvoajdupckicf7a5kmlv09sm6lbc85g9', '192.168.8.100', 1604218648, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383634383b),
('q17m600fqcalmk60e4u4q3ue04e85d03', '192.168.8.102', 1604271238, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237313233383b),
('q2ghofp66i2j45at4pic69bre27q4k6m', '112.215.240.51', 1630703717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333731373b),
('q2ikh68rhba1jrkkrqsu4mua4kukuono', '140.213.59.30', 1630238620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383632303b),
('q4jlsu67lfhiu1p9i7otgktdak93qbt8', '112.215.154.250', 1632309136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393133363b),
('q4rqf5lj9dgin2arjk452vfsc5d5rud1', '192.168.8.102', 1603908251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383235313b),
('q4va070jds0vfm4gnlhae4nq9hmr6i7s', '112.215.154.234', 1630370049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337303034393b),
('qa2q38ls6ho6iolnunbp50n084mfie3g', '192.168.8.101', 1603877497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373439363b),
('qcojgap2p47vknpmchcsirpvd27m60no', '192.168.8.102', 1604228969, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383936393b),
('qfdicg3610ucd5itmfici10f6le8sh9s', '140.213.59.143', 1632363568, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323336333536383b),
('qhnou1ir84e0lpftfbo0qqp4ol79q1a7', '112.215.153.10', 1631445509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313434353530393b),
('qhs7tgijg3kr4590tjiq22v0a3n6c0lp', '192.168.8.100', 1604211118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313131383b),
('qiv51bj1avmea8u1740i6p8j6tfns7mr', '192.168.8.101', 1603878203, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383230333b),
('qjuidj1q06om3joamtqlm8lklp6gfmlk', '192.168.8.101', 1603879116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837393131353b),
('ql5mter4bhhkd7frpt14rfstasva5988', '192.168.8.100', 1604211063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231313036333b),
('ql75skaurossr6nhckoihmmv9rbdm7g3', '112.215.243.145', 1630627331, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303632373333313b),
('qlrs4aemjk348rgfp8490duq92vsvcrt', '112.215.243.10', 1631535494, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313533353439343b),
('qmb88fnkj1hud254j9u2k45o57n0o1r8', '140.213.219.147', 1630723671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333637313b),
('qp4781ckqses4892uf1k490c5otg2jin', '140.213.58.119', 1632645931, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353933313b),
('qpfvl7vpmp5vnmsrivpfoba66r63vmv1', '140.213.58.138', 1633132149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133323134393b),
('qqv8i1v2mi1f2pds2clclf7dqso13uol', '112.215.154.250', 1632293173, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323239333137333b),
('qs3pj4uud9a26a7erlfkver2asvksals', '140.213.219.147', 1630710737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303733373b),
('qt0q3lua92jmhllntj0ckrqlagk9i51m', '116.203.134.67', 1634083207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343038333230373b),
('qtat1ocuftnse1fices6trvmmgkh5d3e', '192.168.8.102', 1604221318, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313331373b),
('r10m2bpmj9gp62is5nd9ea1g1ajlduar', '140.213.219.147', 1630710771, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303737313b),
('r1lqk5acak9cs8l696pobho872sm37t3', '192.168.8.102', 1604220245, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303234353b),
('r292rje0v6p8hg5dgvmvruf8jvu77vle', '192.168.8.101', 1603878146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383134353b),
('r29v3sal3utkt8hbafip621q2klhkf50', '192.168.8.100', 1604215137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353133363b),
('r2jti0id52n0sld1uc6pfdvuqs10fg1n', '140.213.219.45', 1631494546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343534363b),
('r4dp36dil1uj0j9pvfio5mkovcgesu1o', '192.168.8.101', 1603878449, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383434383b),
('r5h04002jeojgau7mjeh14q5jo70q32k', '112.215.154.250', 1632309480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393438303b),
('r6ktoliqb8g2iii7r90fkgqoi03apvun', '116.203.134.67', 1630368008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303336383030383b),
('r9ianrod7g336b17o0c67nlishjfveur', '112.215.172.27', 1632547476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373437363b),
('r9l1ofvijrkol9ple411c2hamb51unva', '140.213.56.6', 1630506087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363038373b),
('ra405m4mm2b9gsrpe45b2iistc44lj98', '192.168.8.101', 1603878493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383439323b),
('rcd6n2l6lplpvsi8k39l392tmrftav43', '112.215.240.51', 1630703650, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333635303b),
('reoi35d7a8ol0iitmfp33o6q1fqfum5k', '192.168.8.102', 1604221314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232313331343b),
('rjb8u9vp4d3diopn0ke26p3kc0uvnbe3', '116.203.134.67', 1631318408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313331383430383b),
('rl9mod9ms001lji36sr02nqf9r0df193', '192.168.8.102', 1604269315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393331343b),
('rm4op390ggob770kus9icku279p1v9al', '192.168.8.102', 1604208779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383737393b),
('rml0shqvsnicgo0rbi2gltanoe0uqta0', '192.168.8.102', 1604229006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393030363b),
('rmmnkjpra16p9kb690fdu96l583jihkc', '140.213.219.45', 1631494575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343537353b),
('rok29cv01cejqc8me7imbh89sij8uofv', '203.78.118.162', 1631239417, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313233393431373b),
('rp6vuo6cc1iji1fbuv0d8k3isuv4g8kj', '192.168.8.102', 1604239363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393336333b),
('rs0l891tarihi0tnha9sh6nj94h9rcbg', '140.213.59.30', 1630226421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363432313b),
('rttd2r8vuv1d2e2j6s0u279hshs6t3g4', '112.215.154.250', 1632309402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393430323b),
('rutj7fqgpj4dq8sucgajaq1motcci42l', '112.215.153.188', 1630545122, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353132313b),
('s0aemh87edf4jco8hder6jduf6vlicvn', '112.215.153.188', 1630566439, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363433393b),
('s2e9i9cgeehqi7bt24bev7iv6jcb3jji', '112.215.243.145', 1630631892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313839313b),
('s3adqj2god0qcrbeqtm7ph769ccaaips', '140.213.58.51', 1632472851, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323437323835313b),
('s43jfkboeicfal78unfpm3jn1dmthf03', '140.213.58.119', 1632645892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634353839323b),
('s44fn62mfpf5ldc1dnrpna93vguc6rcn', '203.78.118.195', 1633863292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333836333239323b),
('s4b4n238k7274kttmju2pk8m31mssv4k', '140.213.56.6', 1630506176, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363137363b),
('s4l7lg0v3ci87er4m4l32stmdlphc1nh', '192.168.8.102', 1604220354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232303335333b),
('s6imipic4g18f4mh4dmh2hiuja9ck6ag', '192.168.8.102', 1604239393, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393339323b),
('s6t6h0b36acomuqh6kjd0rs773nefiiq', '140.213.58.119', 1632640020, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323634303032303b),
('s8llfp728c1tab5qq9v3hubte99q3k88', '112.215.153.240', 1632791485, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313438353b),
('sbanl4mvo4aeidk4buf594gkdm2k5hnc', '192.168.8.101', 1603877526, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373532353b),
('sbkkge770oqlkr0knqot1pg7l7polf13', '140.213.56.6', 1630505678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530353637383b),
('scksohlsegbj3lrdu20u3ef1mflj3lvn', '112.215.172.27', 1632547490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373439303b),
('scm4419mpg99l6u82gd4ti3a98ufqh3m', '192.168.8.102', 1603907750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373735303b),
('scmqvfa77tu5o41cdfpd5t24e6raptjt', '192.168.8.102', 1604274793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237343739333b),
('sdhkddc6s1fhn85abbva5f43gqfpkhch', '140.213.59.30', 1630240528, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303234303532383b),
('sffuv502ohh30t5j4jdmvqgh1ttpeb6j', '140.213.219.64', 1632463908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323436333930383b),
('sh2j6lj5ej11qvmvhhvgb6iaq4v278b8', '192.168.8.100', 1604217216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231373231353b),
('si3lobicrk3ot41anbqnnb0f33jo2239', '192.168.8.102', 1603907799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373739393b),
('si52lsn7gj7negocbqes113at2utjjs4', '112.215.153.240', 1632791457, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739313435373b),
('skavqsv6ig3j0de3d22djh446rf4rcak', '192.168.8.102', 1604218187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383138363b),
('snp39rbffq43lchnas2bvr383cfjgo0p', '192.168.8.102', 1604239587, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343233393538373b),
('so2mtdul3nvr8gv6uen02l9qjuok0i7d', '140.213.59.30', 1630226545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232363534353b),
('sofq9m987n1orvib9i9k4kgebiuv4t2m', '112.215.241.140', 1631840626, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303632363b),
('sq7l3jn8dejfvr57v627m9bc04m98l5g', '192.168.8.101', 1603878301, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383330313b),
('sqb86l006ggk7gmnt6q8iebntrvgcpue', '112.215.153.188', 1630545226, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303534353232363b),
('sqe3damjce39bckknbm1qtdhhhrmk2bq', '192.168.8.101', 1603877641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837373634313b),
('sqqq9f9qo0qjau9htb9b8hh89jbjapsa', '112.215.243.145', 1630627268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303632373236383b),
('ssj0oicd6kubcn7aisq86rigm9ddci1a', '192.168.8.100', 1604215600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353630303b),
('su8h86ddl44tdle5omkp1kh5hb146rg5', '112.215.240.51', 1630704314, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730343331343b),
('sud84qgun69tnni12dd23o7egok74egt', '192.168.8.100', 1604218881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383838303b),
('sue02klumnbg5onsar0ben39095hmsap', '140.213.59.30', 1630238896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383839363b),
('svk0fnqvbsf2403tvi0rb2a68oimgrs2', '192.168.8.100', 1604210909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231303930393b),
('t010gqsc3jbgbgejaiq2htpdb04t5to8', '112.215.243.145', 1630627280, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303632373238303b),
('t03ouc99t8k4qrpk4bb51m5g8m7cu9og', '192.168.8.102', 1603906562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930363536323b),
('t0lq8g7kj14jm29q3s2ipvaff3g6pavq', '112.215.241.140', 1631840486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303438363b),
('t0m14co2s9p3s85v85q3ljevujjeo2m8', '112.215.153.10', 1631424909, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432343930393b),
('t1f9kn63ui8rous5hgh73verga9l2imk', '112.215.243.145', 1630631868, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313836383b),
('t6ghuqig6vtnrnovcek91seb0e9ktlds', '192.168.8.102', 1604364803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343336343830323b),
('t6hpdc0lic05fh1lfujrncfnvmfgj2cb', '112.215.172.27', 1632547003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373030333b),
('t8sl7l04ng9pjctehmf9s5ler1282lj2', '112.215.154.250', 1632293162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323239333136323b),
('t9a56nb6acaqu2p8v2lcucarg9e5a7ss', '112.215.154.250', 1632309410, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393431303b),
('tbub9uof0udpd1empg07otru7407i98i', '192.168.8.102', 1604208651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383635313b),
('tdd7ogngb8r26lrctqtmnpadc8k9plgh', '116.203.134.67', 1633046408, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333034363430383b),
('te0r8ip1tqhrl9t06q7k0r2chjna680g', '112.215.172.27', 1632547220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534373232303b),
('tfpdhjb78o263cujj29rdo6hmc3bin05', '140.213.219.45', 1631494535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313439343533353b),
('timtgaet9io027ih9dn9bmcso2ml76mv', '192.168.8.101', 1603875276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353237353b),
('tjfqoclkjhg73ri0i3l457q1arc3mvml', '192.168.8.100', 1604215339, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353333383b),
('tkiplqr19ekstc46e818ctlhgbltg9j3', '140.213.59.30', 1630238583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383538333b),
('tlt358uf7lud8djjl1iq538g9odse7pr', '192.168.8.102', 1603907766, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373736363b),
('tmmtviad984r5rfkp6gilsh9u89f2db6', '192.168.8.102', 1603907801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373830303b),
('togdrejihalkrbjev6u38pv51k2ic8n7', '112.215.241.140', 1631840469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303436393b),
('turo0ajol68255vakl6pus364jenadja', '112.215.153.183', 1632916113, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323931363131333b),
('tvi4g2j5dkcisi0cclgkgpof8pfh12ta', '192.168.8.100', 1604215465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353436343b),
('u0ai7pvcdoabqbijc2a92m5tc95gsbgr', '140.213.218.17', 1634377237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633343337373233373b),
('u1gjdaore2s6cpmqr563mksn5q5lqv63', '192.168.8.101', 1603874799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837343739383b),
('u23vnkjhki28d9ce3t8fs7mn5c5j61ru', '192.168.8.100', 1604218668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231383636373b),
('u3me9nak6mrlqeitnr6lftmrqg1imqm4', '192.168.8.102', 1604228459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232383435383b),
('u3ojo2fg9d200tph2396ou77hds7blcl', '192.168.8.101', 1603875470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837353437303b),
('u4nolcl2evggjrm4ira2scjqv219qh5n', '112.215.154.217', 1630321101, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303332313130313b),
('u79gmhuhmupknupch1gkv54qa7ittumt', '192.168.8.102', 1603907788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930373738383b),
('u7n4nq422rqr3725unalvk5bhf6c55u3', '192.168.8.102', 1603905890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930353838393b),
('u9dlqltb54g8pv3l5fmv51fa6rbp20ke', '112.215.241.23', 1631061204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313036313230343b),
('ua1iovk3g7ddhlp8picjl4dumlc4vdid', '192.168.8.101', 1603878175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383137353b),
('ub7l5v60rq6tagkfu9navq0imfpe1t6h', '192.168.8.102', 1604276804, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363830343b),
('ucb1sornjo43n689oba0qtdv083u233i', '192.168.8.102', 1603908563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383536323b),
('ucin3f27s2j1p3hnqorlrqdlgld7tqav', '112.215.237.228', 1632871591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323837313539313b),
('ucm1moq1o48kkvbu6ul6kt7i1vlo6807', '140.213.59.30', 1630225027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232353032373b),
('ucusmbmvklangfmtqlhd5gn7gs4ufv4m', '112.215.154.250', 1632308882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330383838323b),
('udfqocikbortse1mk68h0h722qh6tucq', '112.215.240.51', 1630703862, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303730333836323b),
('udm0gcccic8kjrrnn5knl6jklpqfslft', '112.215.153.146', 1633909401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333930393430313b),
('ue593mcd4hspvuu592n4hlv0r8sevdfi', '140.213.218.205', 1633083124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333038333132343b),
('ugpvle388a54ulo41v6gvei4g6to71qq', '192.168.8.102', 1604208830, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343230383832393b),
('ugsp7mqq0q9bf4pdjlmb71fb7itdt6qt', '::1', 1605763891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630353736333839313b),
('uhoaarv0rrdup0m1em7s3udlgljusi3k', '112.215.243.145', 1630631951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303633313935313b),
('uiaducnq9fcvpckojm388q0me3cuota5', '192.168.8.102', 1604276368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237363336383b),
('uikj3n9sp8a3h9sfosjm1fnpam8l8gn3', '112.215.241.228', 1633748106, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333734383130363b),
('uj3sjdk6nl4m8f633gup2md2flfv3rnc', '192.168.8.100', 1604215498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231353439373b),
('ukk35nqc0r7fsr86f6596ukpdb3g9lor', '192.168.8.101', 1603878207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383230363b),
('umm6i7mg4c81phrm86klf1ahie0rvp7i', '112.215.172.104', 1630806018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303830363031383b),
('uq020o3pmknv0dheivvue901g6huv07t', '140.213.59.30', 1630238811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383831313b),
('uqtearpp4b3ihd1ttk90lg3l99d8sn8f', '140.213.219.147', 1630714614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343631343b),
('uv0efb8cg74r9hb6lnrhuvdii6ihd11a', '::1', 1603943085, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333934323931353b),
('uvcgt9pif8nq3r6oj2ppros0qu4vovit', '140.213.219.147', 1630723844, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303732333834343b),
('uvleaqsdoemtpacgetbt6pcfr526o2qi', '192.168.8.101', 1603878459, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333837383435393b),
('v2mmtk6fvado0jkemici5ibdr8f9tpgt', '112.215.241.140', 1631840654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313834303635343b),
('v4bo1f0bldh3vsm3eelm8jlc3fsjn5df', '112.215.153.188', 1630566456, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363435363b),
('v4nr6fu9s0h5ajpood1hhb1iivmq5q31', '112.215.154.217', 1630321131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303332313133313b),
('v5505rhet1b0rfp1umv3upod721hj4tm', '140.213.59.30', 1630224879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343837393b),
('v5a94g2siuu0mt2183olsg5ejbhvq7hk', '112.215.154.234', 1630373328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337333332383b),
('v6j8vsbmmkpbfi7eg2kkbna2uhe53fp6', '140.213.58.138', 1633131733, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333133313733333b),
('v88hetka58fg4h3f1cdkd9v019430kcl', '140.213.59.143', 1632372144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323337323134343b),
('v96emvt9np8go30ler91f4p8d6r4trbo', '192.168.8.102', 1604272871, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343237323837303b),
('vb5fo0tnh8pb9qe1kcgia8fiolqegvl7', '112.215.242.139', 1630965875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303936353837353b),
('vd0ur2todlg5dp5jndp1sf9vqp21ij38', '140.213.219.147', 1630714540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731343534303b),
('vd8j9noi49vnfjtftssfhns14f2h5f8q', '192.168.8.102', 1604269311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393331303b),
('vdrp4usjj968upjq6gbdg26paiqp86dc', '192.168.8.100', 1604219129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343231393132383b),
('vereq4p8se8i79h5jqil2mqgec50uksb', '192.168.8.102', 1604229161, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343232393136303b),
('vgank25hi7qjbm1f2vv9097mg9su77q7', '112.215.154.250', 1632309884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323330393838343b),
('vgiq5p268j4rph919u3g7u2o1fnpk8be', '140.213.59.30', 1630238754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383735343b),
('vgvvdf5qkk0b4ab806nl4a5khomkstlh', '140.213.59.30', 1630238820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383832303b),
('vjmqhc2s217238jsgbnk4mtcu17qduil', '192.168.8.102', 1604364749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343336343734393b),
('vkrhut1mpbhtbf3bci8la5nt0bpb6mub', '112.215.153.10', 1631424924, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313432343932343b),
('vl5d7dk4fnhclchdj9v2qemj7fdur4dj', '112.215.154.250', 1632293149, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323239333134393b),
('vma0af6boduupiv27gppdb12nourlqbb', '140.213.219.147', 1630710769, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303731303736393b),
('vmtvcm4j6f7f0tt2s8nd3i0qvikqs1jb', '112.215.243.134', 1633164803, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633333136343830333b),
('vmuj3hrr3oa0mnav6nfiec40q68qav7q', '140.213.59.30', 1630238985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303233383938353b),
('vnei44qmgmp7vrg6ktu553dn05fncckc', '112.215.172.27', 1632546727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323534363732373b),
('vsm5sgs7edf3svadpq4h0oid5r4ioot3', '140.213.59.30', 1630224793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303232343739333b),
('vug0gni5j63kmkq7j7luur0klb0h5o3k', '192.168.8.102', 1603908273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630333930383237323b),
('vuuuknc1mg7kepmd1qk066rroqt3foot', '116.203.134.67', 1631145607, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633313134353630373b),
('vvuev029l0kgrdcl61tns9r8438apr72', '192.168.8.102', 1604269984, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630343236393938333b);

-- --------------------------------------------------------

--
-- Table structure for table `log_barang`
--

CREATE TABLE `log_barang` (
  `id` int(11) NOT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `tgl` datetime NOT NULL,
  `total_harga_jual` double DEFAULT NULL,
  `total_harga_beli` double DEFAULT NULL,
  `bayar_tunai` double DEFAULT NULL,
  `nama_pembeli` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `tgl`, `total_harga_jual`, `total_harga_beli`, `bayar_tunai`, `nama_pembeli`, `created_user_id`) VALUES
(1, '2020-11-02 08:00:54', 3600, NULL, NULL, NULL, NULL),
(2, '2020-11-02 08:40:39', 2000, NULL, NULL, NULL, NULL),
(3, '2020-11-03 07:18:46', 26000, NULL, NULL, NULL, NULL),
(4, '2021-09-26 15:47:54', 11500, 8750, 20000, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(11) NOT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `barang_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `harga_beli` double DEFAULT NULL,
  `harga_jual` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `penjualan_id`, `barang_id`, `qty`, `harga_beli`, `harga_jual`) VALUES
(1, 1, 260, 12, NULL, 300),
(2, 2, 281, 4, NULL, 500),
(3, 3, 258, 84, NULL, 250),
(4, 3, 259, 2, NULL, 2500),
(5, 4, 8, 1, 8750, 11500);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_log_bayar`
--

CREATE TABLE `penjualan_log_bayar` (
  `id` int(11) NOT NULL,
  `tgl` datetime DEFAULT NULL,
  `penjualan_id` int(11) DEFAULT NULL,
  `bayar_tunai` double DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penjualan_log_bayar`
--

INSERT INTO `penjualan_log_bayar` (`id`, `tgl`, `penjualan_id`, `bayar_tunai`, `created_user_id`) VALUES
(1, '2021-09-26 15:47:54', 4, 20000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `satuan`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `satuan_konversi`
--

CREATE TABLE `satuan_konversi` (
  `id` int(11) NOT NULL,
  `asal` int(11) DEFAULT NULL,
  `tujuan` int(11) DEFAULT NULL,
  `pengali` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('admin','kasir') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bagian` enum('A','B') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firebase_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `bagian`, `firebase_token`) VALUES
(1, 'fotocopy', '598c4f3b1fbe651ca58a31f2b09a380071c4cca2', 'kasir', 'A', 'cjE-ilCfTnmOw_Hfn3MM6Z:APA91bGsmUSmM-ocMCSJcZh0LQX6zqBdThq6oRX_ezL7-R4idMJN4kSXWl6decLlQO5NtFy6tpDD62H5MWpBnODLM64NHstPitQgtJUyL9W4GkWEHqUGWKQcfm5lcNXB8USg098hFNBP'),
(2, 'toko', '67e6ea6352359c16b3964bced760498ebc00ce10', 'kasir', 'B', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_limit`
--
ALTER TABLE `api_limit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nama_satuan_id` (`nama`,`satuan_id`);
ALTER TABLE `barang` ADD FULLTEXT KEY `nama_keterangan` (`nama`,`keterangan`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ci_session`
--
ALTER TABLE `ci_session`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE;

--
-- Indexes for table `log_barang`
--
ALTER TABLE `log_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan_log_bayar`
--
ALTER TABLE `penjualan_log_bayar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `satuan_konversi`
--
ALTER TABLE `satuan_konversi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_limit`
--
ALTER TABLE `api_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=387;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `log_barang`
--
ALTER TABLE `log_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan_log_bayar`
--
ALTER TABLE `penjualan_log_bayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `satuan_konversi`
--
ALTER TABLE `satuan_konversi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
