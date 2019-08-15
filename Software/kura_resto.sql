-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Agu 2019 pada 05.42
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kura_resto`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `id_bbaku` int(5) NOT NULL,
  `n_bbaku` varchar(50) NOT NULL,
  `stok` int(7) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bahan_baku`
--

INSERT INTO `bahan_baku` (`id_bbaku`, `n_bbaku`, `stok`, `tgl_kadaluarsa`) VALUES
(2, 'Bawang Merah', 257, '2019-08-22'),
(3, 'Bawang Putih', 90, '2019-08-30'),
(6, 'Minyak Goreng', 50, '2020-08-28'),
(7, 'Jeruk', 50, '2019-12-28'),
(8, 'Gula', 50, '2020-08-07'),
(9, 'Beras', 50, '2019-12-28'),
(10, 'Telur', 50, '2020-03-20'),
(11, 'Garam', 200, '2020-10-09'),
(12, 'Es', 150, '2020-10-02'),
(13, 'Jeruk Nipis', 90, '2020-04-09'),
(14, 'Tahu', 90, '2020-03-28'),
(15, 'Toge', 90, '2020-11-14'),
(16, 'Cabai', 90, '2020-09-12'),
(17, 'Biji Kopi', 90, '2021-07-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `belanja`
--

CREATE TABLE `belanja` (
  `id_belanja` int(7) NOT NULL,
  `id_bbaku` int(5) NOT NULL,
  `tgl_belanja` date NOT NULL,
  `jumlah` int(7) NOT NULL,
  `subharga` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `belanja`
--

INSERT INTO `belanja` (`id_belanja`, `id_bbaku`, `tgl_belanja`, `jumlah`, `subharga`) VALUES
(14, 2, '2019-08-15', 12, 2200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_menu`
--

CREATE TABLE `detail_menu` (
  `id_detail_menu` int(7) NOT NULL,
  `id_menu` int(5) NOT NULL,
  `id_bbaku` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_menu`
--

INSERT INTO `detail_menu` (`id_detail_menu`, `id_menu`, `id_bbaku`) VALUES
(84, 5, 6),
(85, 5, 14),
(87, 5, 16),
(92, 1, 2),
(93, 3, 7),
(94, 3, 8),
(95, 3, 12),
(96, 1, 3),
(97, 1, 6),
(98, 1, 9),
(99, 1, 10),
(100, 1, 11),
(102, 5, 2),
(103, 5, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `id_detail_pesanan` int(7) NOT NULL,
  `id_pesanan` int(7) NOT NULL,
  `id_menu` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL,
  `subharga` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`id_detail_pesanan`, `id_pesanan`, `id_menu`, `jumlah`, `subharga`) VALUES
(1, 2, 5, 9, 90000),
(2, 2, 3, 8, 80000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kuisioner`
--

CREATE TABLE `kuisioner` (
  `id_kuisioner` int(5) NOT NULL,
  `id_pesanan` int(7) NOT NULL,
  `kuisioner` int(3) NOT NULL,
  `saran` text NOT NULL,
  `kritik` text NOT NULL,
  `tgl_kuisioner` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `meja`
--

CREATE TABLE `meja` (
  `no_meja` int(5) NOT NULL,
  `username_meja` varchar(25) NOT NULL,
  `password_meja` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `meja`
--

INSERT INTO `meja` (`no_meja`, `username_meja`, `password_meja`) VALUES
(3, 'meja1', 'yagini');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(5) NOT NULL,
  `n_menu` varchar(50) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `harga` int(6) NOT NULL,
  `keterangan` varchar(25) NOT NULL,
  `kategori` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `n_menu`, `gambar`, `harga`, `keterangan`, `kategori`) VALUES
(1, 'Nasi Goreng Menjerit Keenakan', 'nasi_goreng.jpg', 15000, 'Tersedia', 'Makanan'),
(3, 'Jus Jeruk Segar Menyejukkan', 'jus_jeruk.jpg', 8000, 'Tersedia', 'Minuman'),
(5, 'Gehu Jeletot Seuhah', 'gehu.jpg', 8000, 'Tersedia', 'Makanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `n_pegawai` varchar(50) NOT NULL,
  `jabatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `username`, `password`, `n_pegawai`, `jabatan`) VALUES
(1, 'farhan', '12345', 'Farhan Kohan', 'koki'),
(2, 'senoaeae', '112233', 'Seno Rama', 'customer service'),
(3, 'jajaelani', 'pajudiapa123', 'Budi Setiawan', 'kasir'),
(4, 'bulaimbai', '14432', 'Bilal ', 'pemilik'),
(5, 'suae112', '12345', 'Sukaesih', 'pelayan'),
(6, 'fauziitu', 'fauzisur153', 'Fauzi', 'pantry');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id_pesanan` int(7) NOT NULL,
  `id_pegawai` int(5) NOT NULL,
  `no_meja` int(5) NOT NULL,
  `tgl_pesanan` date NOT NULL,
  `total_harga` int(8) NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`id_pesanan`, `id_pegawai`, `no_meja`, `tgl_pesanan`, `total_harga`, `keterangan`) VALUES
(2, 1, 3, '2019-08-06', 90000, 'Selesai Dibuat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `req_bbaku`
--

CREATE TABLE `req_bbaku` (
  `id_req_bbaku` int(5) NOT NULL,
  `id_bbaku` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `req_bbaku`
--

INSERT INTO `req_bbaku` (`id_req_bbaku`, `id_bbaku`, `jumlah`) VALUES
(2, 3, 60),
(4, 2, 100),
(6, 7, 7),
(7, 2, 89),
(8, 8, 99),
(9, 11, 99);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`id_bbaku`);

--
-- Indeks untuk tabel `belanja`
--
ALTER TABLE `belanja`
  ADD PRIMARY KEY (`id_belanja`),
  ADD KEY `id_bbaku` (`id_bbaku`);

--
-- Indeks untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD PRIMARY KEY (`id_detail_menu`),
  ADD KEY `id_menu` (`id_menu`),
  ADD KEY `id_bbaku` (`id_bbaku`);

--
-- Indeks untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`id_detail_pesanan`),
  ADD KEY `id_pesanan` (`id_pesanan`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indeks untuk tabel `kuisioner`
--
ALTER TABLE `kuisioner`
  ADD PRIMARY KEY (`id_kuisioner`),
  ADD KEY `id_pesanan` (`id_pesanan`);

--
-- Indeks untuk tabel `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`no_meja`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_pesanan`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `no_meja` (`no_meja`);

--
-- Indeks untuk tabel `req_bbaku`
--
ALTER TABLE `req_bbaku`
  ADD PRIMARY KEY (`id_req_bbaku`),
  ADD KEY `id_pegawai` (`id_bbaku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bahan_baku`
--
ALTER TABLE `bahan_baku`
  MODIFY `id_bbaku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `belanja`
--
ALTER TABLE `belanja`
  MODIFY `id_belanja` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  MODIFY `id_detail_menu` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  MODIFY `id_detail_pesanan` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kuisioner`
--
ALTER TABLE `kuisioner`
  MODIFY `id_kuisioner` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `meja`
--
ALTER TABLE `meja`
  MODIFY `no_meja` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_pesanan` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `req_bbaku`
--
ALTER TABLE `req_bbaku`
  MODIFY `id_req_bbaku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_menu`
--
ALTER TABLE `detail_menu`
  ADD CONSTRAINT `detail_menu_ibfk_1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_menu_ibfk_2` FOREIGN KEY (`id_bbaku`) REFERENCES `bahan_baku` (`id_bbaku`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `detail_pesanan_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_pesanan_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kuisioner`
--
ALTER TABLE `kuisioner`
  ADD CONSTRAINT `kuisioner_ibfk_1` FOREIGN KEY (`id_pesanan`) REFERENCES `pesanan` (`id_pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`no_meja`) REFERENCES `meja` (`no_meja`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `req_bbaku`
--
ALTER TABLE `req_bbaku`
  ADD CONSTRAINT `req_bbaku_ibfk_1` FOREIGN KEY (`id_bbaku`) REFERENCES `bahan_baku` (`id_bbaku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
