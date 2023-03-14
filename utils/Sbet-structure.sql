-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Ago 21, 2022 alle 12:44
-- Versione del server: 10.4.21-MariaDB
-- Versione PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Sbet`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `bet`
--

CREATE TABLE `bet` (
  `id_bet` varchar(16) NOT NULL,
  `total_quote` float UNSIGNED NOT NULL,
  `amount_betted` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_game`
--

CREATE TABLE `bet_game` (
  `id_single_bet` varchar(16) NOT NULL,
  `id_bet` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_single_game`
--

CREATE TABLE `bet_single_game` (
  `id_game` varchar(16) NOT NULL,
  `betted_result` int(10) UNSIGNED NOT NULL,
  `id_single_bet` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_user`
--

CREATE TABLE `bet_user` (
  `id_bet` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `game`
--

CREATE TABLE `game` (
  `sport` varchar(16) NOT NULL,
  `team1` varchar(24) NOT NULL,
  `team2` varchar(24) NOT NULL,
  `result` int(11) UNSIGNED DEFAULT NULL,
  `id_game` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `quote`
--

CREATE TABLE `quote` (
  `id_quote` varchar(16) NOT NULL,
  `one` varchar(16) NOT NULL,
  `x` varchar(16) DEFAULT NULL,
  `two` varchar(16) NOT NULL,
  `id_game` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` varchar(32) NOT NULL,
  `money` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `bet`
--
ALTER TABLE `bet`
  ADD PRIMARY KEY (`id_bet`);

--
-- Indici per le tabelle `bet_game`
--
ALTER TABLE `bet_game`
  ADD KEY `id_bet` (`id_bet`),
  ADD KEY `id_game` (`id_single_bet`);

--
-- Indici per le tabelle `bet_single_game`
--
ALTER TABLE `bet_single_game`
  ADD KEY `id_game` (`id_game`),
  ADD KEY `id_single_bet` (`id_single_bet`);

--
-- Indici per le tabelle `bet_user`
--
ALTER TABLE `bet_user`
  ADD KEY `id_bet` (`id_bet`),
  ADD KEY `username` (`username`);

--
-- Indici per le tabelle `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id_game`);

--
-- Indici per le tabelle `quote`
--
ALTER TABLE `quote`
  ADD PRIMARY KEY (`id_quote`),
  ADD KEY `id_game` (`id_game`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `bet_game`
--
ALTER TABLE `bet_game`
  ADD CONSTRAINT `bet_game_ibfk_1` FOREIGN KEY (`id_bet`) REFERENCES `bet` (`id_bet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `bet_single_game`
--
ALTER TABLE `bet_single_game`
  ADD CONSTRAINT `bet_single_game_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bet_single_game_ibfk_2` FOREIGN KEY (`id_single_bet`) REFERENCES `bet_game` (`id_single_bet`);

--
-- Limiti per la tabella `bet_user`
--
ALTER TABLE `bet_user`
  ADD CONSTRAINT `bet_user_ibfk_1` FOREIGN KEY (`id_bet`) REFERENCES `bet` (`id_bet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bet_user_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `quote`
--
ALTER TABLE `quote`
  ADD CONSTRAINT `quote_ibfk_1` FOREIGN KEY (`id_game`) REFERENCES `game` (`id_game`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
