-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 20 Août 2017 à 22:29
-- Version du serveur :  5.6.21
-- Version de PHP :  5.6.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `tp1`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE IF NOT EXISTS `compte` (
  `ID` varchar(255) NOT NULL,
  `SOLDE` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compte`
--

INSERT INTO `compte` (`ID`, `SOLDE`) VALUES
('EE1', 123),
('EE2', 200);

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE IF NOT EXISTS `operation` (
  `ID` bigint(20) NOT NULL,
  `DATEOPERATION` date DEFAULT NULL,
  `MONTANT` double DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `COMPTE_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `operation`
--

INSERT INTO `operation` (`ID`, `DATEOPERATION`, `MONTANT`, `TYPE`, `COMPTE_ID`) VALUES
(1, '2017-08-16', 1, 1, 'EE1'),
(2, '2017-08-22', 3, 1, 'EE2');

-- --------------------------------------------------------

--
-- Structure de la table `sequence`
--

CREATE TABLE IF NOT EXISTS `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', '50');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
 ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
 ADD PRIMARY KEY (`ID`), ADD KEY `FK_OPERATION_COMPTE_ID` (`COMPTE_ID`);

--
-- Index pour la table `sequence`
--
ALTER TABLE `sequence`
 ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `operation`
--
ALTER TABLE `operation`
ADD CONSTRAINT `FK_OPERATION_COMPTE_ID` FOREIGN KEY (`COMPTE_ID`) REFERENCES `compte` (`ID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
