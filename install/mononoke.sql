-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Feb 2022 um 01:26
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mononoke`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `anime`
--

DROP TABLE IF EXISTS `anime`;
CREATE TABLE `anime` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET latin1 NOT NULL,
  `alternates` longblob DEFAULT NULL,
  `year` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(4) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL,
  `description` text CHARACTER SET latin1 DEFAULT NULL,
  `anisearch` int(11) DEFAULT NULL,
  `9anime` text CHARACTER SET latin1 DEFAULT NULL,
  `animixplay` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gogoanime` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twist` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `anime_tag_cloud`
--

DROP TABLE IF EXISTS `anime_tag_cloud`;
CREATE TABLE `anime_tag_cloud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `anime_tag_relations`
--

DROP TABLE IF EXISTS `anime_tag_relations`;
CREATE TABLE `anime_tag_relations` (
  `id` int(11) NOT NULL,
  `anime` int(11) NOT NULL,
  `tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL,
  `anime` int(11) NOT NULL,
  `episode` int(11) NOT NULL,
  `host` int(11) NOT NULL,
  `url` text NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `public` int(11) NOT NULL,
  `closed` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_posts`
--

DROP TABLE IF EXISTS `forum_posts`;
CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `forum` int(11) NOT NULL,
  `thread` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `forum_threads`
--

DROP TABLE IF EXISTS `forum_threads`;
CREATE TABLE `forum_threads` (
  `id` int(11) NOT NULL,
  `forum` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `closed` int(11) NOT NULL,
  `sticky` int(11) NOT NULL,
  `deleted` int(11) NOT NULL,
  `posted` datetime NOT NULL DEFAULT current_timestamp(),
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schedule`
--

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL,
  `anime` int(11) NOT NULL,
  `release` time NOT NULL,
  `tleft` datetime DEFAULT NULL,
  `added` datetime NOT NULL DEFAULT current_timestamp(),
  `day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `image` varchar(255) NOT NULL,
  `theme` int(11) NOT NULL,
  `lang` varchar(10) NOT NULL,
  `public_profile` int(11) NOT NULL,
  `public_watchlist` int(11) NOT NULL,
  `read_announce` int(11) NOT NULL,
  `forum_signature` varchar(500) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_forgot`
--

DROP TABLE IF EXISTS `user_forgot`;
CREATE TABLE `user_forgot` (
  `user` varchar(250) NOT NULL,
  `token` text NOT NULL,
  `from` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_tokens`
--

DROP TABLE IF EXISTS `user_tokens`;
CREATE TABLE `user_tokens` (
  `token` text NOT NULL,
  `user` varchar(250) NOT NULL,
  `from` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user_verification`
--

DROP TABLE IF EXISTS `user_verification`;
CREATE TABLE `user_verification` (
  `user` varchar(250) NOT NULL,
  `token` text NOT NULL,
  `from` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `anime`
--
ALTER TABLE `anime`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `anime_tag_cloud`
--
ALTER TABLE `anime_tag_cloud`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `anime_tag_relations`
--
ALTER TABLE `anime_tag_relations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `forum_threads`
--
ALTER TABLE `forum_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `anime`
--
ALTER TABLE `anime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `anime_tag_cloud`
--
ALTER TABLE `anime_tag_cloud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `anime_tag_relations`
--
ALTER TABLE `anime_tag_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum`
--
ALTER TABLE `forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `forum_threads`
--
ALTER TABLE `forum_threads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
