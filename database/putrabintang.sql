-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2018 at 09:12 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 5.6.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `putrabintang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `kd_admin` int(6) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gambar` varchar(225) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama`, `email`, `password`, `gambar`, `level`) VALUES
(6, 'admin', 'admin@admin.com', 'admin', 'user.png', ''),
(8, 'Tiwi', 'tiwi@gmail.com', 'admin', 'PhotoGrid_1531150120768.jpg', 'supplier'),
(9, 'Putra Bintang', 'putrabintang@gmail.com', 'putrabintang', 'LOGO (1).png', 'admin'),
(10, 'Kumis Toko', 'kumisjaya@gmail.com', 'kumisku', 'HMTI (2).png', 'supplier'),
(11, 'Firda Faradila', 'firdaaaa97@gmail.com', 'firda123', 'PhotoGrid_1531150120768.jpg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_beli` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `satuan`, `harga_jual`, `harga_beli`, `stok`, `status`) VALUES
('BB000001', 'Barang 1', 'PCS', 200000, 180000, 40, '0'),
('BB000002', 'Barang 2', 'DUS', 340000, 300000, 12, '0'),
('BB000003', 'Buku 1', 'DUS', 450000, 400000, 75, '0'),
('BS001', 'Coca-Cola', 'PCS', 4000, 5500, 20, '0'),
('MFS001', 'Fanta Strawberry', 'PCS', 5000, 3500, 10, '0');

-- --------------------------------------------------------

--
-- Table structure for table `barangp_sementara`
--

CREATE TABLE `barangp_sementara` (
  `id_barangp` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barangp` varchar(225) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_barangp` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `barang_pembelian`
--

CREATE TABLE `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_pembelian`
--

INSERT INTO `barang_pembelian` (`kd_barang_beli`, `kd_pembelian`, `nama_barang_beli`, `satuan`, `harga_beli`, `item`, `total`, `status`) VALUES
(107, 'PEM00001', 'Buku 2', 'DUS', 120000, 30, 3600000, '0'),
(109, 'PEM00002', 'Barang1', 'PCS', 200, 4, 800, '0'),
(110, 'PEM00003', 'Coca-Cola', 'PCS', 10000, 2, 20000, '0'),
(112, 'PEM00005', 'Buku 1', 'DUS', 450000, 5, 2250000, '0'),
(113, 'PEM00006', 'Coca-Cola', 'PCS', 4000, 6, 24000, '0'),
(114, 'PEM00007', 'Coca-Cola', 'PCS', 4000, 7, 28000, '0'),
(115, 'PEM00008', 'Fanta Strawberry', 'PCS', 5000, 5, 25000, '0'),
(116, 'PEM00009', 'Barang 1', 'PCS', 200000, 2, 400000, '0'),
(117, 'PEM00009', 'Buku 1', 'DUS', 450000, 2, 900000, '0'),
(118, 'PEM00009', 'Coca-Cola', 'PCS', 4000, 2, 8000, '0');

-- --------------------------------------------------------

--
-- Table structure for table `d_pembelian`
--

CREATE TABLE `d_pembelian` (
  `id_pembelian` int(6) NOT NULL,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang_beli` int(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_pembelian`
--

INSERT INTO `d_pembelian` (`id_pembelian`, `kd_pembelian`, `kd_barang_beli`, `jumlah`, `subtotal`) VALUES
(162, 'PEM00002', 109, 4, 800),
(168, 'PEM00008', 115, 5, 25000),
(169, 'PEM00009', 116, 2, 400000),
(170, 'PEM00009', 117, 2, 900000),
(171, 'PEM00009', 118, 2, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `d_penjualan`
--

CREATE TABLE `d_penjualan` (
  `id_penjualan` int(6) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `jumlah` int(4) NOT NULL,
  `subtotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `d_penjualan`
--

INSERT INTO `d_penjualan` (`id_penjualan`, `kd_penjualan`, `kd_barang`, `jumlah`, `subtotal`) VALUES
(55, 'PEN00001', 'BB000003', 5, 2250000),
(56, 'PEN00002', 'BS001', 10, 40000),
(57, 'PEN00003', 'BB000001', 10, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL,
  `bukti_pembayaran` varchar(100) NOT NULL,
  `status_bayar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`kd_pembelian`, `tgl_pembelian`, `kd_admin`, `kd_supplier`, `total_pembelian`, `bukti_pembayaran`, `status_bayar`) VALUES
('PEM00002', '2018-12-10', 9, 1, 800, '', 0),
('PEM00008', '2018-10-26', 10, 5, 25000, '', 0),
('PEM00009', '2018-10-28', 10, 5, 1308000, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kd_penjualan` char(8) NOT NULL,
  `tgl_penjualan` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `dibayar` double NOT NULL,
  `total_penjualan` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kd_penjualan`, `tgl_penjualan`, `kd_admin`, `dibayar`, `total_penjualan`) VALUES
('PEN00001', '2016-03-13', 6, 2260000, 2250000),
('PEN00002', '2018-10-22', 9, 100000, 40000),
('PEN00003', '2018-10-25', 9, 2000000, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_sementara`
--

CREATE TABLE `penjualan_sementara` (
  `id_penjualan_sementara` int(11) NOT NULL,
  `kd_penjualan` char(8) NOT NULL,
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `kota` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`kd_perusahaan`, `nama_perusahaan`, `alamat`, `pemilik`, `kota`) VALUES
(1, 'PUTRA BINTANG', 'Patrol Indramayu, Jawa Barat Indonesia', 'Hasri Habbeana P', 'Indramayu');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kd_supplier` int(6) NOT NULL,
  `kd_admin` int(10) NOT NULL,
  `nama_supplier` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `kd_admin`, `nama_supplier`, `alamat`) VALUES
(1, 0, 'Toko Anjas', 'condong catur, sleman'),
(3, 0, 'TB Agus Hokya', 'Kuningan, Bandung Barat Selatan Ke Utara'),
(4, 0, 'Toko Putra', 'jl. merdeka, boyolali, jakarta selatan'),
(5, 10, 'Kumis Toko', 'Indamayu BP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`kd_admin`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  ADD PRIMARY KEY (`id_barangp`),
  ADD KEY `kd_pembelian` (`kd_pembelian`);

--
-- Indexes for table `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  ADD PRIMARY KEY (`kd_barang_beli`);

--
-- Indexes for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `kd_pembelian` (`kd_pembelian`),
  ADD KEY `kd_pembelian_2` (`kd_pembelian`),
  ADD KEY `kd_barang_beli` (`kd_barang_beli`),
  ADD KEY `kd_barang_beli_2` (`kd_barang_beli`);

--
-- Indexes for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `kd_penjualan` (`kd_penjualan`),
  ADD KEY `kd_barang` (`kd_barang`),
  ADD KEY `kd_barang_2` (`kd_barang`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`kd_pembelian`),
  ADD KEY `kd_admin` (`kd_admin`),
  ADD KEY `kd_supplier` (`kd_supplier`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kd_penjualan`),
  ADD KEY `kd_admin` (`kd_admin`);

--
-- Indexes for table `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  ADD PRIMARY KEY (`id_penjualan_sementara`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`kd_perusahaan`),
  ADD KEY `kd_perusahaan` (`kd_perusahaan`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kd_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `kd_admin` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `barangp_sementara`
--
ALTER TABLE `barangp_sementara`
  MODIFY `id_barangp` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `barang_pembelian`
--
ALTER TABLE `barang_pembelian`
  MODIFY `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  MODIFY `id_pembelian` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  MODIFY `id_penjualan` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `penjualan_sementara`
--
ALTER TABLE `penjualan_sementara`
  MODIFY `id_penjualan_sementara` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `kd_supplier` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang_beli`) REFERENCES `barang_pembelian` (`kd_barang_beli`);

--
-- Constraints for table `d_penjualan`
--
ALTER TABLE `d_penjualan`
  ADD CONSTRAINT `d_penjualan_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`),
  ADD CONSTRAINT `d_penjualan_ibfk_4` FOREIGN KEY (`kd_penjualan`) REFERENCES `penjualan` (`kd_penjualan`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
