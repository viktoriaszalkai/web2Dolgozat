-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 17. 12:15
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `tagsag`
--
CREATE DATABASE IF NOT EXISTS `tagsag` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `tagsag`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `felhAzon` int(11) NOT NULL AUTO_INCREMENT,
  `nev` varchar(30) NOT NULL,
  `jogosultsag` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  PRIMARY KEY (`felhAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`felhAzon`, `nev`, `jogosultsag`, `email`) VALUES
(1, 'Aladár', 1, 'nagyaladar@gmail.com'),
(2, 'Béla', 1, 'kisbela@gmail.com'),
(3, 'Cecil', 1, 'szepcecil@gmail.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `klub`
--

DROP TABLE IF EXISTS `klub`;
CREATE TABLE IF NOT EXISTS `klub` (
  `klubAzon` int(11) NOT NULL AUTO_INCREMENT,
  `datum` date NOT NULL,
  `hely` varchar(30) NOT NULL,
  `maxMeret` int(11) NOT NULL,
  `nev` varchar(30) NOT NULL,
  PRIMARY KEY (`klubAzon`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `klub`
--

INSERT INTO `klub` (`klubAzon`, `datum`, `hely`, `maxMeret`, `nev`) VALUES
(10, '2024-04-17', 'Budapest', 30, 'Tánc klub'),
(20, '2024-04-17', 'Budapest', 40, 'Vadász klub'),
(30, '2024-04-17', 'Karacslapulytő', 10, 'Cserkész klub');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `klubAzon` int(11) NOT NULL,
  `felhAzon` int(11) NOT NULL,
  `pozicio` int(11) NOT NULL,
  PRIMARY KEY (`klubAzon`,`felhAzon`),
  KEY `felhAzon` (`felhAzon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `tag`
--

INSERT INTO `tag` (`klubAzon`, `felhAzon`, `pozicio`) VALUES
(10, 1, 1),
(20, 2, 1),
(30, 3, 1);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `tag_ibfk_1` FOREIGN KEY (`felhAzon`) REFERENCES `felhasznalo` (`felhAzon`),
  ADD CONSTRAINT `tag_ibfk_2` FOREIGN KEY (`klubAzon`) REFERENCES `klub` (`klubAzon`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
