-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Nov 2020 pada 03.41
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_daily_book`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 100, 'admin2020-11-06', 1, 0, 0, NULL, 1),
(2, 1, 'user_alfan2020-11-06', 2, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_activity`
--

CREATE TABLE `tb_activity` (
  `id_activity` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `activity` text NOT NULL,
  `solusi` varchar(30) NOT NULL,
  `keluhan` varchar(30) NOT NULL,
  `tanggal_keluhan` datetime NOT NULL,
  `tanggal_solusi` datetime NOT NULL,
  `devisi` varchar(25) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_devisi`
--

CREATE TABLE `tb_devisi` (
  `id_devisi` int(11) NOT NULL,
  `nama_devisi` varchar(100) NOT NULL,
  `kode_devisi` int(11) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_devisi`
--

INSERT INTO `tb_devisi` (`id_devisi`, `nama_devisi`, `kode_devisi`, `ket`) VALUES
(1, 'MIS', 101, ''),
(2, 'UMUM & HRD', 102, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_profile`
--

CREATE TABLE `tb_profile` (
  `id_profile` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `posisi` enum('HO','SITE','RO','PKS') NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_profile`
--

INSERT INTO `tb_profile` (`id_profile`, `id_user`, `nama`, `email`, `nohp`, `foto`, `posisi`, `rate`) VALUES
(1, 1, 'Muazharin Alfan', 'alfanmuazharin@gmail.com', '082243309590', 'avatar.png', 'HO', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rate`
--

CREATE TABLE `tb_rate` (
  `id_rate` int(11) NOT NULL,
  `id_user_anggota` int(11) NOT NULL,
  `id_user_bos` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `rate` int(11) NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `devisi` varchar(25) NOT NULL,
  `level` enum('1','2','3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `devisi`, `level`) VALUES
(1, 'user_alfan', '660226ef92ce415f268148793b0237e7', 'MIS', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_activity`
--
ALTER TABLE `tb_activity`
  ADD PRIMARY KEY (`id_activity`);

--
-- Indeks untuk tabel `tb_devisi`
--
ALTER TABLE `tb_devisi`
  ADD PRIMARY KEY (`id_devisi`);

--
-- Indeks untuk tabel `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD PRIMARY KEY (`id_profile`);

--
-- Indeks untuk tabel `tb_rate`
--
ALTER TABLE `tb_rate`
  ADD PRIMARY KEY (`id_rate`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tb_activity`
--
ALTER TABLE `tb_activity`
  MODIFY `id_activity` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_devisi`
--
ALTER TABLE `tb_devisi`
  MODIFY `id_devisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_profile`
--
ALTER TABLE `tb_profile`
  MODIFY `id_profile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_rate`
--
ALTER TABLE `tb_rate`
  MODIFY `id_rate` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
