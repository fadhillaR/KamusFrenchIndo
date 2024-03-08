-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 01:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kamus`
--

-- --------------------------------------------------------

--
-- Table structure for table `kamus`
--

CREATE TABLE `kamus` (
  `id` int(11) NOT NULL,
  `kosakata` varchar(50) NOT NULL,
  `terjemahan` varchar(50) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamus`
--

INSERT INTO `kamus` (`id`, `kosakata`, `terjemahan`, `ket`) VALUES
(1, 'ribut', 'bruyant', '[bʀɥijɑ̃ˌ ɑ̃t] kata sifat\r\ncontoh : Un quartier bruyant - Lingkungan yang bising'),
(2, 'lemah', 'faible', '[fɛbl] kata sifat\r\ncontoh : Un argument faible - Argumen yang lemah'),
(3, 'halo', 'bonjour', '[bɔ̃ʒuʀ] kata benda\r\ncontoh : Bien le bonjour à votre soeur - halo dariku untuk adikmu'),
(4, 'keras', 'Dur', '[dyʀ] kata sifat\r\ncontoh : Frapper, cogner dur - Pukul, pukul dengan keras'),
(5, 'terima kasih', 'merci', '[mɛʀsi] kata benda\r\ncontoh : Mille Mercis - Terimakasih Banyak'),
(6, 'Setuju', 'accepter', '[aksɛpte] kata kerja\r\ncontoh : Il ne peut accepter son échec - Dia tidak bisa menerima kegagalannya\r\n'),
(7, 'pakaian', 'vêtements', '[vɛtmɑ̃]\r\ncontoh : Vêtements de travail - Pakaian kerja'),
(8, 'makanan', 'nourriture', '[nuʀityʀ] kata benda jamak'),
(9, 'binatang', 'animal', '[animal] kata benda\r\ncontoh : Le règne animal - Kerajaan Hewan'),
(10, 'alam', 'naturel', '[natyʀɛl] kata sifat natural\r\ncontoh :\r\nêtre d\'un naturel gai - menjadi ceria secara alami'),
(11, 'kuat', 'fort', '[fɔʀˌ fɔʀt] kata sifat\r\ncontoh :  Serrer très fort - Kencangkan dengan sangat kuat'),
(12, 'cuaca', 'météo', '[meteo] kata sifat\r\ncontoh : Bulletins météo - Laporan cuaca'),
(13, 'tidur', 'dormir', '[dɔʀmiʀ] kata kerja\r\ncontoh : \r\nCommencer à dormir - Mulailah tidur'),
(14, 'main', 'jouer', '[ʒwe] kata kerja\r\ncontoh :  \r\nFaire jouer la clé dans la serrure - Mainkan kunci digembok'),
(15, 'minum', 'boire', '[bwaʀ] kata kerja\r\ncontoh : Boire sans soif - Minum tanpa haus');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamus`
--
ALTER TABLE `kamus`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamus`
--
ALTER TABLE `kamus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
