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
(1, 1, 'Regression', 11),
(2, 2, 'Overture 1928', 11),
(3, 3, 'Strange Deja Vu', 11),
(4, 4, 'Through my Words', 11),
(5, 5, 'Fatal Tragedy', 11),
(6, 6, 'Behind this Life', 11),
(7, 7, 'Through her Eyes', 11),
(8, 8, 'Home', 11),
(9, 9, 'The Dance of Eyernity', 11),
(10, 10, 'One Last Time', 11),
(11, 11, 'The Spirits Carries On', 11),
(12, 12, 'Finally Free', 11),
(13, 1, 'Airbag', 1),
(14, 2, 'Paranoid Android', 1),
(15, 3, 'Subterranean Homesick Alien', 1),
(16, 4, 'Exit Music (For a Film)', 1),
(17, 5, 'Let Down', 1),
(18, 6, 'Karma Police', 1),
(19, 7, 'Fitter Happier', 1),
(20, 8, 'Electioneering', 1),
(21, 9, 'Climbing Up the Walls', 1),
(22, 10, 'No Surprises', 1),
(23, 11, 'Lucky', 1),
(24, 12, 'The Tourist', 1),
(25, 1, 'You', 2),
(26, 2, 'Creep', 2),
(27, 6, 'Anyone can Play Guitar', 2),
(28, 8, 'Vegetable', 2),
(29, 12, 'Blow Out', 2),
(30, 15, 'Pop id Dead', 2),
(31, 1, 'Planet Telex', 3),
(32, 2, 'The Bends', 3),
(33, 3, 'High and Dry', 3),
(34, 4, 'Fake Plastic Trees', 3),
(35, 5, 'Bones', 3),
(36, 6, '(Nice Dream)', 3),
(37, 7, 'Just', 3),
(38, 8, 'My Iron Lung', 3),
(39, 9, 'Bullet Proof... I Wish I Was', 3),
(40, 10, 'Black Star', 3),
(41, 11, 'Sulk', 3),
(42, 12, 'Street Spirit (Fade Out)', 3),
(85, 2, 'Breathe (In the Air)', 4),
(86, 4, 'Time', 4),
(87, 5, 'the Great Gig in the Sky', 4),
(88, 6, 'Money', 4),
(89, 7, 'Us and Them', 4),
(90, 9, 'Brain Damage', 4),
(91, 1, 'In the Flesh', 5),
(92, 2, 'The Thin Ice', 5),
(93, 3, 'Another Brick in the Wall (Part I)', 5),
(94, 4, 'The Happiest Days of Our Lives', 5),
(95, 5, 'Another Brick in the Wall (Part II)', 5),
(96, 6, 'Another Brick in the Wall (Part III)', 5),
(97, 7, 'Comfortably Numb', 5),
(98, 1, 'Wanna Be Startin'' Somethin''', 6),
(99, 2, 'Baby Be Mine', 6),
(100, 3, 'The Girl is Mine', 6),
(101, 4, 'Thriller', 6),
(102, 5, 'Beat It', 6),
(103, 6, 'Billie Jean', 6),
(104, 7, 'Human Nature', 6),
(105, 1, 'Two of Us', 7),
(106, 3, 'Across the Universe', 7),
(107, 6, 'Let It Be', 7),
(108, 7, 'Maggie Mae', 7),
(109, 1, 'Entre Dos Tierras', 8),
(110, 2, 'Maldito Duende', 8),
(111, 3, 'La Carta', 8),
(112, 4, 'Malas Intenciones', 8),
(113, 5, 'Sal', 8),
(114, 6, 'Senda', 8),
(115, 7, 'Hechizo', 8),
(116, 8, 'Oración', 8),
(117, 9, 'Despertar', 8),
(118, 10, 'Decadencia', 8),
(119, 11, 'Con Nombre de Guerra', 8),
(120, 12, 'El Cuadro II', 8),
(121, 4, 'Alchemist" (feat. Gino Sydal)', 9),
(122, 11, 'Melody Circus', 9),
(123, 12, 'Fat Cat Shuffle', 9),
(124, 16, 'Paradisco', 9),
(125, 17, 'Black Magic', 9),
(126, 19, 'Pirate Bay (feat. Twistex)', 9),
(127, 1, 'The First Rumours of Spring', 10),
(128, 2, 'Don''t Get Upset If I...', 10),
(129, 3, 'All My Bad Thoughts', 10),
(130, 6, 'Koffee Pot', 10),
(131, 7, 'Brecht''s Lost Waltz / Summer Is Over', 10),
(132, 9, 'Journey''s End', 10),
(133, 10, 'It''s Over, It''s Ended, It''s Finished, It''s Done', 12),
(134, 2, 'Head Over Heels', 12),
(135, 3, 'Under the Milky Way', 12),
(136, 7, 'For Whom the Bell Tolls', 12),
(137, 9, 'Notorious', 12),
(138, 12, 'The Killing Moon', 12),
(139, 2, 'Besaid Island', 13),
(140, 8, 'Path of Repentance', 13),
(141, 12, 'Suteki da Ne', 13),
(142, 13, 'The Sight of Spira', 13),
(143, 17, 'To Zanarkand', 13),
(144, 22, 'Wandering Flame', 13),
(145, 1, 'Main Title', 14),
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
