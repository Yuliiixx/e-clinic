-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 11, 2024 at 02:23 AM
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
-- Database: `db_klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokters`
--

CREATE TABLE `dokters` (
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nip` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `spesialis` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dokters`
--

INSERT INTO `dokters` (`dokter_id`, `user_id`, `nip`, `name`, `tempat_lahir`, `tgl_lahir`, `gender`, `alamat`, `no_telp`, `spesialis`, `created_at`, `updated_at`) VALUES
(6, 57, '12345678', 'dokter', 'padang', '1999-07-28', 'Perempuan', 'padang', '081266673375', 'dokter anak', '2024-02-09 21:18:33', '2024-02-09 21:37:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_pemeriksaans`
--

CREATE TABLE `hasil_pemeriksaans` (
  `hasil_pemeriksaan_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `jenis_pemeriksaan` varchar(50) NOT NULL,
  `diagnosa` varchar(50) NOT NULL,
  `obat` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasil_pemeriksaans`
--

INSERT INTO `hasil_pemeriksaans` (`hasil_pemeriksaan_id`, `dokter_id`, `pasien_id`, `jenis_pemeriksaan`, `diagnosa`, `obat`, `created_at`, `updated_at`) VALUES
(5, 6, 13, 'bpjs', 'demam', 'paracetamol', '2024-02-09 21:39:36', '2024-02-09 21:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_dokters`
--

CREATE TABLE `jadwal_dokters` (
  `jadwal_dokter_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `hari` varchar(20) NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal_dokters`
--

INSERT INTO `jadwal_dokters` (`jadwal_dokter_id`, `dokter_id`, `hari`, `waktu`, `created_at`, `updated_at`) VALUES
(8, 6, 'Senin', '2024-02-10', '2024-02-09 21:18:55', '2024-02-09 21:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pemeriksaans`
--

CREATE TABLE `jadwal_pemeriksaans` (
  `jadwal_pemeriksaan_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `hari` varchar(20) NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Pending','Approved','Rejected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwal_pemeriksaans`
--

INSERT INTO `jadwal_pemeriksaans` (`jadwal_pemeriksaan_id`, `dokter_id`, `pasien_id`, `hari`, `waktu`, `created_at`, `updated_at`, `status`) VALUES
(1, 6, 13, 'Senin', '2024-02-10', '2024-02-09 21:28:55', '2024-02-09 21:28:55', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_03_073415_create_admins_table', 2),
(6, '2024_01_03_075410_create_pasiens_table', 3),
(7, '2024_01_03_080610_create_dokters_table', 4),
(8, '2024_01_03_082658_create_jadwal_dokters_table', 5),
(9, '2024_01_03_083516_create_ruangs_table', 6),
(10, '2024_01_03_095055_create_jadwal_pemeriksaans_table', 7),
(11, '2024_01_03_101008_add_status_to_jadwal_pemeriksaans_table', 8),
(12, '2024_01_03_101916_change_migration_jadwal_dokter_to_dokter_id', 9),
(13, '2024_01_03_102156_drop__migration_jadwal_dokter_to_dokter_id', 10),
(14, '2024_01_03_103614_drop_jadwal_dokters_table', 11),
(15, '2024_01_03_104214_drop_ruangs_table', 12),
(16, '2024_01_03_104442_create_hasil_pemeriksaans_table', 13),
(17, '2024_01_03_104845_create_surat_keterangans_table', 14),
(18, '2024_01_03_105718_create_tabel_ruang', 15),
(19, '2024_01_03_110111_create_tabel_jadwal_dokter', 16),
(20, '2024_01_17_155633_modify_table_dokters', 17),
(21, '2024_01_17_160255_modify_table_pasiens', 17),
(22, '2024_01_17_172405_modify_role_users', 17),
(23, '2024_01_20_173924_modify_table_surat_keterangans', 18),
(24, '2024_01_20_174940_drop_column_table_surat_keterangans', 18),
(25, '2024_01_20_175253_drop_column_hari_surat_keterangans', 18),
(26, '2024_01_20_175454_add_column_waktu2_surat_keterangans', 18),
(27, '2024_01_26_162928_create_contacts_table', 19),
(28, '2024_01_26_175118_add_column_time_contacts', 19);

-- --------------------------------------------------------

--
-- Table structure for table `pasiens`
--

CREATE TABLE `pasiens` (
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('Laki-laki','Perempuan') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pasiens`
--

INSERT INTO `pasiens` (`pasien_id`, `user_id`, `name`, `tempat_lahir`, `tgl_lahir`, `gender`, `alamat`, `no_telp`, `created_at`, `updated_at`) VALUES
(13, 60, 'cobapasien', 'padang', '2011-02-10', 'Laki-laki', 'padang', '081266673375', '2024-02-09 21:28:12', '2024-02-09 21:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ruangs`
--

CREATE TABLE `ruangs` (
  `ruang_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `nama_ruangan` varchar(50) NOT NULL,
  `jenis_ruangan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ruangs`
--

INSERT INTO `ruangs` (`ruang_id`, `dokter_id`, `nama_ruangan`, `jenis_ruangan`, `created_at`, `updated_at`) VALUES
(16, 6, 'poli anak', 'poli anak', '2024-02-09 21:19:27', '2024-02-09 21:19:27');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keterangans`
--

CREATE TABLE `surat_keterangans` (
  `surat_keterangan_id` bigint(20) UNSIGNED NOT NULL,
  `dokter_id` bigint(20) UNSIGNED NOT NULL,
  `pasien_id` bigint(20) UNSIGNED NOT NULL,
  `keterangan` enum('Sehat','Sakit') NOT NULL,
  `waktu1` date NOT NULL,
  `waktu2` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `surat_keterangans`
--

INSERT INTO `surat_keterangans` (`surat_keterangan_id`, `dokter_id`, `pasien_id`, `keterangan`, `waktu1`, `waktu2`, `created_at`, `updated_at`) VALUES
(4, 6, 13, 'Sakit', '2024-02-10', '2024-02-19', '2024-02-10 00:51:08', '2024-02-10 00:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Pasien','Dokter','Admin') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(55, 'admin', 'admin@gmail.com', NULL, '$2y$12$Ot7lASHd/Gpj8fIl2aReDezHFh8a0deVafCdxM2nNywM7MSYJZTHS', 'Admin', NULL, '2024-02-09 21:16:35', '2024-02-09 21:16:35'),
(57, 'dokter', 'dokter@gmail.com', NULL, '$2y$12$tpTla43egRIJ3jT4aMyeJ.cw3qvUkCaVrmvUDwsm/6taoqmx.tqDq', 'Dokter', NULL, '2024-02-09 21:18:32', '2024-02-10 10:41:42'),
(58, 'pasien', 'pasien@gmail.com', NULL, '$2y$12$KLRU6k2IFFH7t0Goq5sXdeCoVIp2mBTzCFBo30blSUGJ46dLwk0Tq', 'Pasien', NULL, '2024-02-09 21:20:34', '2024-02-09 21:20:34'),
(60, 'cobapasien', 'cobapasien@gmail.com', NULL, '$2y$12$axyvhY9WPzGisEB3Z42Uu.Ln1ymLl8KCFPZrtDaaXRXacgaT0JYj.', 'Pasien', NULL, '2024-02-09 21:28:12', '2024-02-09 21:28:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_email_unique` (`email`);

--
-- Indexes for table `dokters`
--
ALTER TABLE `dokters`
  ADD PRIMARY KEY (`dokter_id`),
  ADD KEY `dokters_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hasil_pemeriksaans`
--
ALTER TABLE `hasil_pemeriksaans`
  ADD PRIMARY KEY (`hasil_pemeriksaan_id`),
  ADD KEY `hasil_pemeriksaans_dokter_id_foreign` (`dokter_id`),
  ADD KEY `hasil_pemeriksaans_pasien_id_foreign` (`pasien_id`);

--
-- Indexes for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  ADD PRIMARY KEY (`jadwal_dokter_id`),
  ADD KEY `jadwal_dokters_dokter_id_foreign` (`dokter_id`);

--
-- Indexes for table `jadwal_pemeriksaans`
--
ALTER TABLE `jadwal_pemeriksaans`
  ADD PRIMARY KEY (`jadwal_pemeriksaan_id`),
  ADD KEY `jadwal_pemeriksaans_dokter_id_foreign` (`dokter_id`),
  ADD KEY `jadwal_pemeriksaans_pasien_id_foreign` (`pasien_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD PRIMARY KEY (`pasien_id`),
  ADD KEY `pasiens_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `ruangs`
--
ALTER TABLE `ruangs`
  ADD PRIMARY KEY (`ruang_id`),
  ADD KEY `ruangs_dokter_id_foreign` (`dokter_id`);

--
-- Indexes for table `surat_keterangans`
--
ALTER TABLE `surat_keterangans`
  ADD PRIMARY KEY (`surat_keterangan_id`),
  ADD KEY `surat_keterangans_dokter_id_foreign` (`dokter_id`),
  ADD KEY `surat_keterangans_pasien_id_foreign` (`pasien_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dokters`
--
ALTER TABLE `dokters`
  MODIFY `dokter_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_pemeriksaans`
--
ALTER TABLE `hasil_pemeriksaans`
  MODIFY `hasil_pemeriksaan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  MODIFY `jadwal_dokter_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jadwal_pemeriksaans`
--
ALTER TABLE `jadwal_pemeriksaans`
  MODIFY `jadwal_pemeriksaan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pasiens`
--
ALTER TABLE `pasiens`
  MODIFY `pasien_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ruangs`
--
ALTER TABLE `ruangs`
  MODIFY `ruang_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `surat_keterangans`
--
ALTER TABLE `surat_keterangans`
  MODIFY `surat_keterangan_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokters`
--
ALTER TABLE `dokters`
  ADD CONSTRAINT `dokters_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasil_pemeriksaans`
--
ALTER TABLE `hasil_pemeriksaans`
  ADD CONSTRAINT `hasil_pemeriksaans_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`dokter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasil_pemeriksaans_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`pasien_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_dokters`
--
ALTER TABLE `jadwal_dokters`
  ADD CONSTRAINT `jadwal_dokters_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`dokter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal_pemeriksaans`
--
ALTER TABLE `jadwal_pemeriksaans`
  ADD CONSTRAINT `jadwal_pemeriksaans_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`dokter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_pemeriksaans_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`pasien_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasiens`
--
ALTER TABLE `pasiens`
  ADD CONSTRAINT `pasiens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ruangs`
--
ALTER TABLE `ruangs`
  ADD CONSTRAINT `ruangs_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`dokter_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `surat_keterangans`
--
ALTER TABLE `surat_keterangans`
  ADD CONSTRAINT `surat_keterangans_dokter_id_foreign` FOREIGN KEY (`dokter_id`) REFERENCES `dokters` (`dokter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `surat_keterangans_pasien_id_foreign` FOREIGN KEY (`pasien_id`) REFERENCES `pasiens` (`pasien_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
