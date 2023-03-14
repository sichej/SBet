-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mar 14, 2023 alle 17:27
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

--
-- Dump dei dati per la tabella `bet`
--

INSERT INTO `bet` (`id_bet`, `total_quote`, `amount_betted`) VALUES
('Kkw8Uxv6zam9neoA', 9.61, 10),
('KswztjekbmoFEeE5', 1.92, 3),
('vxeF1nvKC2PV1MPc', 2.66, 2),
('WqIYsxuZkWOiYoTX', 4.4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_game`
--

CREATE TABLE `bet_game` (
  `id_single_bet` varchar(16) NOT NULL,
  `id_bet` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bet_game`
--

INSERT INTO `bet_game` (`id_single_bet`, `id_bet`) VALUES
('1JMQmNlowQdAIL7n', 'Kkw8Uxv6zam9neoA'),
('XObKTigNuEWsSVQw', 'Kkw8Uxv6zam9neoA'),
('NibnlgT5dcoT9hp5', 'Kkw8Uxv6zam9neoA'),
('qZs45GxTyqc2tftg', 'Kkw8Uxv6zam9neoA'),
('IrcI7Xwoe4nVsKxV', 'KswztjekbmoFEeE5'),
('nMrtjWFHRHsrG6iQ', 'KswztjekbmoFEeE5'),
('j1TQILOurMFPCpch', 'WqIYsxuZkWOiYoTX'),
('OTv1jzbvOiPxIy8v', 'WqIYsxuZkWOiYoTX'),
('W07uLGDwMR5kKnYg', 'vxeF1nvKC2PV1MPc');

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_single_game`
--

CREATE TABLE `bet_single_game` (
  `id_game` varchar(16) NOT NULL,
  `betted_result` int(10) UNSIGNED NOT NULL,
  `id_single_bet` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bet_single_game`
--

INSERT INTO `bet_single_game` (`id_game`, `betted_result`, `id_single_bet`) VALUES
('1T4Bs407lYksRcBH', 1, '1JMQmNlowQdAIL7n'),
('JwCAG1CoWn2HtnZj', 1, 'NibnlgT5dcoT9hp5'),
('ri3CnTMaHV6IscDv', 2, 'qZs45GxTyqc2tftg'),
('1T4Bs407lYksRcBH', 2, 'IrcI7Xwoe4nVsKxV'),
('gUBgkrTEDON2E05M', 1, 'nMrtjWFHRHsrG6iQ'),
('8H1FYFOmXfbZH05M', 2, 'OTv1jzbvOiPxIy8v');

-- --------------------------------------------------------

--
-- Struttura della tabella `bet_user`
--

CREATE TABLE `bet_user` (
  `id_bet` varchar(16) NOT NULL,
  `username` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `bet_user`
--

INSERT INTO `bet_user` (`id_bet`, `username`) VALUES
('Kkw8Uxv6zam9neoA', 'sichej'),
('KswztjekbmoFEeE5', 'sichej'),
('WqIYsxuZkWOiYoTX', 'sichej'),
('vxeF1nvKC2PV1MPc', 'sichej');

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

--
-- Dump dei dati per la tabella `game`
--

INSERT INTO `game` (`sport`, `team1`, `team2`, `result`, `id_game`) VALUES
('volleyball', 'LPM BAM MONDOVÌ', 'VOLLEYBALL SANT\'ELIA', NULL, '1mU8X2LOe48EuHe7'),
('calcio', 'Torino', 'Monza', NULL, '1T4Bs407lYksRcBH'),
('calcio', 'Roma', 'Lecce', NULL, '8H1FYFOmXfbZH05M'),
('basket', 'New York Knicks', 'Philadelphia 76ers', NULL, 'gUBgkrTEDON2E05M'),
('calcio', 'Sassuolo', 'Milan', NULL, 'HJO6H44FK6KVLACo'),
('basket', 'Detroit Pistons', 'Cleveland Cavaliers', NULL, 'i59vQLchUY4kwNTV'),
('calcio', 'Lazio', 'Sampdoria', NULL, 'JwCAG1CoWn2HtnZj'),
('basket', 'Boston Celtics', 'Indiana Pacers', NULL, 'KwIAFO51B8z64TTX'),
('volleyball', 'ITAS TRENTINO', 'MILLENIUM BRESCIA', NULL, 'P5vasRtMXrJHYbm1'),
('volleyball', 'RAMONDA MONTECCHIO', 'US ESPERIA CREMONA', NULL, 'QahsfwDkY32xFsrE'),
('calcio', 'Empoli', 'Cremonese', NULL, 'rCQFZMbOtRgEWs1g'),
('calcio', 'Juventus', 'Spezia', NULL, 'ri3CnTMaHV6IscDv'),
('volleyball', 'GROUP MARTIGNACCO', 'INTERNATIONAL SOVERATO', NULL, 'sHCojT813pO5zVxG'),
('volleyball', 'CDA TALMASSONS', 'SANT\'ANNA MESSINA', NULL, 'SNr19onr3EsqtWTh'),
('calcio', 'Salernitana', 'Verona', NULL, 'Svz0tVV3XzwgCIZq'),
('volleyball', 'CLUB ITALIA CRAI', '3M PALLAVOLO PERUGIA', NULL, 'T9EpCu1zkrSH3sRc'),
('calcio', 'Inter', 'Fiorentina', NULL, 'XqdQFyx8thXnHMoK'),
('volleyball', 'ROMA VOLLEY CLUB', 'GIOVANI BUSTO ARSIZIO', NULL, 'y8c1UXwkHa78VW83'),
('volleyball', 'ALBESE VOLLEY COMO', 'ANTHEA VICENZA', NULL, 'ySF9pcm5KmG6UqWL'),
('basket', 'Milwaukee Bucks', 'Toronto Raptors', NULL, 'zoT3B4GUdjwsmUzZ');

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

--
-- Dump dei dati per la tabella `quote`
--

INSERT INTO `quote` (`id_quote`, `one`, `x`, `two`, `id_game`) VALUES
('3e2S4EGlJh4ZBGq6', '1.82', '2.2', '1.27', 'rCQFZMbOtRgEWs1g'),
('8nMCbwP8twj6yJgZ', '1.48', NULL, '1.97', 'QahsfwDkY32xFsrE'),
('Bv2Y7hqfPWFInYub', '1.73', NULL, '1.07', 'SNr19onr3EsqtWTh'),
('G4WqbKqvL3qk5d3q', '1.62', '2.66', '1.36', '1T4Bs407lYksRcBH'),
('GvwIxrN4ZhGyRjUS', '1.18', '2.93', '1.23', 'JwCAG1CoWn2HtnZj'),
('JcGtG4V0s8HDwyeQ', '1.11', '2.9', '1.4', 'XqdQFyx8thXnHMoK'),
('jHaAccC55zkAO9Im', '1.31', NULL, '1.4', 'T9EpCu1zkrSH3sRc'),
('k80v1KH1Xb52NmHW', '1.08', NULL, '1.76', 'P5vasRtMXrJHYbm1'),
('KfAQOHdqsrcFyV8H', '1.36', NULL, '1.26', 'sHCojT813pO5zVxG'),
('m1WsBnLWINxjpgzp', '1.81', NULL, '1.51', 'i59vQLchUY4kwNTV'),
('MsFme3NQItF35Ouu', '1.85', '2.04', '1.27', 'Svz0tVV3XzwgCIZq'),
('MZT6sPWFSSOtHb6j', '1.41', NULL, '1.21', 'gUBgkrTEDON2E05M'),
('p5NC9auMKeoHi1AJ', '1.59', '2.54', '2.0', '8H1FYFOmXfbZH05M'),
('pVoKakS5GPEnmtBw', '1.22', NULL, '1.04', 'zoT3B4GUdjwsmUzZ'),
('q9rjUnRLfOk59Nhg', '1.44', '2.2', '1.38', 'HJO6H44FK6KVLACo'),
('QQj9ky9DqGG9rhd9', '1.11', NULL, '1.56', 'ySF9pcm5KmG6UqWL'),
('TCYu39AQAwyM39JV', '1.61', '2.96', '1.98', 'ri3CnTMaHV6IscDv'),
('ulNakPUTc1pSVMky', '1.15', NULL, '1.35', '1mU8X2LOe48EuHe7'),
('XUJJ4Mc9niFMVsZ0', '1.44', NULL, '1.28', 'KwIAFO51B8z64TTX'),
('ZIWAtine8UoJ1YiF', '1.55', NULL, '1.93', 'y8c1UXwkHa78VW83');

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
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`username`, `password`, `money`) VALUES
('sichej', '9dd4e461268c8034f5c8564e155c67a6', 83);

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
