-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2025 at 05:59 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `umkm_mamzasildb`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailtransaksi`
--

CREATE TABLE `detailtransaksi` (
  `id_detail` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `id_menu` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL CHECK (`jumlah` > 0),
  `subtotal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailtransaksi`
--

INSERT INTO `detailtransaksi` (`id_detail`, `id_transaksi`, `id_menu`, `jumlah`, `subtotal`) VALUES
(1, 1, 1, 3, 39000),
(2, 2, 3, 2, 20000),
(3, 3, 8, 2, 10000),
(4, 4, 13, 1, 5000),
(5, 5, 11, 5, 25000),
(6, 6, 1, 1, 13000),
(7, 7, 9, 1, 5000),
(8, 8, 7, 1, 10000),
(9, 9, 2, 2, 26000),
(10, 10, 5, 1, 13000),
(11, 11, 6, 1, 10000),
(12, 12, 4, 1, 10000),
(13, 13, 1, 1, 13000),
(14, 14, 10, 1, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(100) DEFAULT NULL,
  `jabatan` enum('pelayan','kasir','juru masak','pemilik') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `jabatan`) VALUES
(1, 'Iis', 'juru masak'),
(2, 'Asep', 'pemilik');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'makanan'),
(2, 'minuman');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL CHECK (`stok` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `harga`, `id_kategori`, `stok`) VALUES
(1, 'Nasi Ayam Penyet', 13000, 1, 50),
(2, 'Nasi Pecel Lele', 13000, 1, 50),
(3, 'Nasi Telur Dadar', 10000, 1, 50),
(4, 'Nasi Bakar Ayam Kemangi', 10000, 1, 35),
(5, 'Nasi Bakar Cumi Asin', 10000, 1, 35),
(6, 'Nasi Ayam Goreng Original', 13000, 1, 50),
(7, 'Indomie + Telur', 10000, 1, 10),
(8, 'Dimsum Ayam', 5000, 1, 40),
(9, 'Wonton Spicy', 5000, 1, 40),
(10, 'Pempek', 5000, 1, 40),
(11, 'Nutrisari', 5000, 2, 50),
(12, 'Dancow', 5000, 2, 50),
(13, 'Milo', 5000, 2, 50),
(14, 'Es Teh Manis', 3000, 2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `no_hp`, `alamat`, `email`) VALUES
(1, 'Fatin Mufhlus Tsani', '081234567891', 'Sukapura', 'fatin.tsani@gmail.com'),
(2, 'Muhammad Rondyka', '081234567892', 'Sukabirus', 'muhammad.rondyka@gmail.com'),
(3, 'Muhammad Saddam Mahluby', '081234567893', 'Cikoneng', 'm.saddam@gmail.com'),
(4, 'Muhammad Rizki Ramdani', '081234567894', 'Cijeruk', 'rizki.ramdani@gmail.com'),
(5, 'Falah Nuralref Aprizal', '081234567895', 'Ciganitri', 'falah.aprizal@gmail.com'),
(6, 'Muhammad Vazry Pulensky', '081234567896', 'Sukapura', 'vazry.pulensky@gmail.com'),
(7, 'Muhammad Fadhil Ralab Putra', '081234567897', 'Sukabirus', 'fadhil.putra@gmail.com'),
(8, 'Dyo Maldini', '081234567898', 'Cikoneng', 'dyo.maldini@gmail.com'),
(9, 'Audrey Felissia', '081234567899', 'Cijeruk', 'audrey.felissia@gmail.com'),
(10, 'Aghza Hiyyati Ulwa', '081234567800', 'Ciganitri', 'aghza.ulwa@gmail.com'),
(11, 'Jauzana Zahira', '081234567801', 'Sukapura', 'jauzana.zahira@gmail.com'),
(12, 'Afwadatul Afdhal', '081234567802', 'Sukabirus', 'afwadatul.afdhal@gmail.com'),
(13, 'Rizqi Priyo Utomo', '081234567803', 'Cikoneng', 'rizqi.utomo@gmail.com'),
(14, 'Mohammad Rizqi', '081234567804', 'Cijeruk', 'm.rizqi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `metode_pembayaran` enum('tunai','transfer','QRIS','debit') DEFAULT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `metode_pembayaran`, `jumlah_bayar`) VALUES
(1, 1, 'tunai', 39000),
(2, 2, 'QRIS', 20000),
(3, 3, 'tunai', 10000),
(4, 4, 'debit', 5000),
(5, 5, 'transfer', 25000),
(6, 6, 'tunai', 13000),
(7, 7, 'QRIS', 5000),
(8, 8, 'tunai', 10000),
(9, 9, 'tunai', 26000),
(10, 10, 'QRIS', 13000),
(11, 11, 'transfer', 10000),
(12, 12, 'debit', 10000),
(13, 13, 'QRIS', 13000),
(14, 14, 'tunai', 5000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `total_pembayaran` int(11) DEFAULT NULL,
  `status` enum('selesai','dibatalkan','menunggu') DEFAULT 'selesai',
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pelanggan`, `tanggal`, `total_pembayaran`, `status`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-05-10', 39000, 'selesai', 'pesan tanpa pedas', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(2, 2, '2025-05-11', 20000, 'selesai', 'minta sambal tambahan', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(3, 3, '2025-06-10', 10000, 'selesai', 'tanpa es', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(4, 4, '2025-06-10', 5000, 'selesai', NULL, '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(5, 5, '2025-06-11', 25000, 'selesai', 'makan di tempat', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(6, 6, '2025-06-12', 13000, 'selesai', 'dibungkus', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(7, 7, '2025-06-12', 5000, 'selesai', 'tanpa kuah', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(8, 8, '2025-06-13', 10000, 'selesai', 'pakai sambal ijo', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(9, 9, '2025-06-13', 26000, 'selesai', 'extra kerupuk', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(10, 10, '2025-06-14', 13000, 'selesai', 'ambil jam 12', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(11, 11, '2025-06-14', 10000, 'selesai', 'diantar ke kosan', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(12, 12, '2025-06-15', 10000, 'selesai', NULL, '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(13, 13, '2025-06-15', 13000, 'selesai', 'bungkus 2 porsi', '2025-06-17 15:22:49', '2025-06-17 15:22:49'),
(14, 14, '2025-06-16', 5000, 'selesai', 'makan bareng teman', '2025-06-17 15:22:49', '2025-06-17 15:22:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detailtransaksi`
--
ALTER TABLE `detailtransaksi`
  ADD CONSTRAINT `detailtransaksi_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `detailtransaksi_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
