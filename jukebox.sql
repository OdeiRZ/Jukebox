-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2015 at 02:53 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jukebox`
--
CREATE DATABASE IF NOT EXISTS `jukebox` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `jukebox`;

-- --------------------------------------------------------

--
-- Table structure for table `albumes`
--

CREATE TABLE IF NOT EXISTS `albumes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `artista` varchar(200) NOT NULL,
  `anio` int(10) unsigned NOT NULL,
  `genero` varchar(200) NOT NULL,
  `portada` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `albumes`
--

INSERT INTO `albumes` (`id`, `nombre`, `artista`, `anio`, `genero`, `portada`) VALUES
(1, 'OK Computer', 'Radiohead', 1997, 'Alternativa', 'okcomputer'),
(2, 'Pablo Honey', 'Radiohead', 1993, 'Alternativa', 'pablohoney'),
(3, 'The Bends', 'Radiohead', 1995, 'Alternativa', 'thebends'),
(4, 'The Dark Side of the Moon', 'Pink Floyd', 1973, 'Rock Progresivo', 'thedarksideofthemoon'),
(5, 'The Wall', 'Pink Floyd', 1979, 'Rock Progresivo', 'thewall'),
(6, 'Thriller', 'Michael Jackson', 1982, 'Pop', 'thriller'),
(7, 'Let It Be', 'The Beatles', 1970, 'Pop', 'letitbe'),
(8, 'Senderos de Traición', 'Héroes del Silencio', 1990, 'Rock', 'senderosdetracion'),
(9, 'Alchemist', 'Savant', 2012, 'Dubstep', 'alchemist'),
(10, 'All my Bad Thoughts', 'The Montgolfier Brothers', 2005, 'Indie', 'allmybadthoughts'),
(11, 'Scenes from a Memory', 'Dream Theater', 1999, 'Metal Progresivo', 'scenesfromamemory'),
(12, 'Donnie Darko - Soundtrack & Score', 'Michael Andrews', 2004, 'BSO', 'donniedarko'),
(13, 'Final Fantasy X - Sountrack', 'Nobuo Uematsu', 2001, 'BSO', 'finalfantasyx'),
(14, 'Last of the Mohicans - Sountrack', 'Trevor Jones', 1992, 'BSO', 'lastofthemohicans');

-- --------------------------------------------------------

--
-- Table structure for table `pistas`
--

CREATE TABLE IF NOT EXISTS `pistas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` int(10) unsigned NOT NULL,
  `nombre` text NOT NULL,
  `id_album` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_album` (`id_album`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- Dumping data for table `pistas`
--

INSERT INTO `pistas` (`id`, `numero`, `nombre`, `id_album`) VALUES
(11, 11, 'The Spirits Carries On', 11),
(18, 6, 'Karma Police', 1),
(22, 10, 'No Surprises', 1),
(26, 2, 'Creep', 2),
(86, 4, 'Time', 4),
(95, 5, 'Another Brick in the Wall (Part II)', 5),
(103, 6, 'Billie Jean', 6),
(107, 6, 'Let It Be', 7),
(111, 3, 'La Carta', 8),
(126, 19, 'Pirate Bay (feat. Twistex)', 9),
(130, 6, 'Koffee Pot', 10),
(138, 12, 'The Killing Moon', 12),
(141, 12, 'Suteki da Ne', 13),
(143, 17, 'To Zanarkand', 13),
(146, 6, 'Promentory', 14),
(147, 16, 'Banana Co.', 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pistas`
--
ALTER TABLE `pistas`
  ADD CONSTRAINT `pistas_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `albumes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
