-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 03:07 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis`
--

CREATE TABLE `tb_jenis` (
  `kd_jenis` int(11) NOT NULL,
  `jenis_laundry` varchar(100) NOT NULL,
  `lama_proses` int(11) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_jenis`
--

INSERT INTO `tb_jenis` (`kd_jenis`, `jenis_laundry`, `lama_proses`, `tarif`) VALUES
(15, 'Kiloan Epic', 1, 10000),
(17, 'Bed Cover Kecil', 3, 25000),
(18, 'Boneka', 3, 15000),
(19, 'Bed Cover Besar', 3, 25000),
(20, 'Self Service', 0, 12000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_laporan` int(11) NOT NULL,
  `tgl_laporan` date NOT NULL,
  `ket_laporan` int(1) NOT NULL,
  `catatan` text NOT NULL,
  `id_laundry` char(15) DEFAULT NULL,
  `pemasukan` int(11) NOT NULL,
  `id_pengeluaran` char(10) DEFAULT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_laporan`
--

INSERT INTO `tb_laporan` (`id_laporan`, `tgl_laporan`, `ket_laporan`, `catatan`, `id_laundry`, `pemasukan`, `id_pengeluaran`, `pengeluaran`) VALUES
(28, '2022-01-09', 1, '5 baju, 5 celana levis', 'LD-00000001', 70000, NULL, 0),
(29, '2022-01-09', 1, '10 kemeja, 2 celana training', 'LD-00000002', 100000, NULL, 0),
(30, '2022-01-09', 1, 'Karpet 20kg', 'LD-00000003', 200000, NULL, 0),
(31, '2022-01-09', 1, '2 celana, 3 baju, 2 kaus', 'LD-0005', 35000, NULL, 0),
(33, '2023-06-06', 1, 'Baju 5, Celana 3', 'LD-0006', 18000, NULL, 0),
(34, '2023-06-06', 1, '1 Bed Cover', 'LD-0007', 25000, NULL, 0),
(35, '2023-06-12', 1, 'Baju 12, Celana 5', 'LD-0008', 30000, NULL, 0),
(36, '2023-06-20', 1, '3 Bed Cover', 'LD-0010', 75000, NULL, 0),
(38, '2023-07-22', 1, 'sdasdf', '220723004', 30000, NULL, 0),
(39, '2023-07-22', 2, 'Pewangi Lavender', NULL, 0, 'PG-2207230', 96000),
(40, '2023-07-11', 1, 'dasda', 'LD-0000000', 50000, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_laundry`
--

CREATE TABLE `tb_laundry` (
  `id_laundry` char(15) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kd_jenis` char(6) NOT NULL,
  `tgl_terima` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `jml_kilo` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `status_pembayaran` int(1) NOT NULL,
  `status_pengambilan` int(1) NOT NULL,
  `status_pencucian` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_laundry`
--

INSERT INTO `tb_laundry` (`id_laundry`, `id_pelanggan`, `id_user`, `kd_jenis`, `tgl_terima`, `tgl_selesai`, `jml_kilo`, `catatan`, `totalbayar`, `status_pembayaran`, `status_pengambilan`, `status_pencucian`) VALUES
('LD-00000001', 17, 31, '17', '2023-07-11', '2023-07-14', 3, 'jghk', 75000, 0, 0, 0),
('LD-00000002', 20, 31, '18', '2023-07-11', '2023-07-14', 4, 'sadafs', 60000, 0, 0, 0),
('LD-00000003', 18, 31, '17', '2023-07-11', '2023-07-14', 2, 'dasda', 50000, 1, 0, 3),
('LD-220723004', 13, 31, '15', '2023-07-22', '2023-07-23', 3, 'sdasdf', 30000, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(150) NOT NULL,
  `pelanggan_jk` varchar(15) NOT NULL,
  `pelanggan_alamat` text NOT NULL,
  `pelanggan_telp` varchar(20) NOT NULL,
  `pelangganfoto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `pelanggan_jk`, `pelanggan_alamat`, `pelanggan_telp`, `pelangganfoto`) VALUES
(11, 'Isna Mutiara', 'Perempuan', 'Raudlatul Bannat 2', '085312654654', NULL),
(12, 'Mahmud MDA', 'Laki - laki', 'Selokan', '0855454554', NULL),
(13, 'Fauzan Fadhlulbarr', 'Laki - laki', 'Cipasung', '0841545465', NULL),
(17, 'Orazio', 'Perempuan', 'Konoha', '0845552126', NULL),
(18, 'aad', 'Laki - laki', 'afsa', '231231', NULL),
(20, 'ozan', 'Laki - laki', 'Jl. Sekeloa', '084151251', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `id_pengeluaran` char(13) NOT NULL,
  `tgl_pengeluaran` date NOT NULL,
  `catatan` text NOT NULL,
  `pengeluaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`id_pengeluaran`, `tgl_pengeluaran`, `catatan`, `pengeluaran`) VALUES
('PG-22072301', '2023-07-22', 'Pewangi Lavender', 96000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_user` varchar(100) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jenis_kelamin` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  `user_telp` varchar(20) NOT NULL,
  `user_foto` varchar(50) DEFAULT NULL,
  `jabatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id_user`, `username`, `password_user`, `nama`, `jenis_kelamin`, `alamat`, `user_telp`, `user_foto`, `jabatan`) VALUES
(28, 'Kiki', '$2y$10$PEYjU5qPAX4SIYjIgvE6TuXF8fV/9YneUNKc03SwTGXJbi.OEAhui', 'Kiki Mulyadi', 'Laki - laki', 'Bandung', '0895392518509', '61d844f1efc33.jpg', 'kasir'),
(31, 'Ozan', '$2y$10$0N.aQusnmK4DGlaDUELhieMg8I6QohTw9M7uq4oTNlQVmyGbrl/4i', 'Muhammad Fauzan F', 'Laki - laki', 'Tasikmalaya', '089654321', '647606ad40db3.jpg', 'admin'),
(32, 'nabila', '$2y$10$oeQmTbjf75buxevpxX3X7O31y0PkpPTAui5dNCNoGkEHR13eiZchq', 'Nabila N', 'Laki - laki', 'Bandung', '08545412132', '64866886261e6.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  ADD PRIMARY KEY (`kd_jenis`);

--
-- Indexes for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_laporan`);

--
-- Indexes for table `tb_laundry`
--
ALTER TABLE `tb_laundry`
  ADD PRIMARY KEY (`id_laundry`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jenis`
--
ALTER TABLE `tb_jenis`
  MODIFY `kd_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_laporan`
--
ALTER TABLE `tb_laporan`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
