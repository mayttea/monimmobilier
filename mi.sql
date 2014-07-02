-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mer 02 Juillet 2014 à 17:47
-- Version du serveur: 5.5.37
-- Version de PHP: 5.4.4-14+deb7u11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `e1395529`
--

-- --------------------------------------------------------

--
-- Structure de la table `mi_adresse`
--

CREATE TABLE IF NOT EXISTS `mi_adresse` (
  `ID_adresse` int(11) NOT NULL AUTO_INCREMENT,
  `no_rue` int(11) NOT NULL,
  `rue` varchar(30) NOT NULL,
  `codepostal` varchar(7) NOT NULL,
  `ID_ville` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID_adresse`),
  KEY `ID_ville` (`ID_ville`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_agence`
--

CREATE TABLE IF NOT EXISTS `mi_agence` (
  `ID_agence` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `courriel` varchar(50) NOT NULL,
  `siteweb` varchar(50) NOT NULL,
  `telephone` int(10) NOT NULL,
  `ID_adresse` int(11) NOT NULL,
  `ID_photo` int(11) NOT NULL,
  PRIMARY KEY (`ID_agence`),
  KEY `ID_adresse` (`ID_adresse`),
  KEY `ID_photo` (`ID_photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_annonce`
--

CREATE TABLE IF NOT EXISTS `mi_annonce` (
  `ID_annonce` int(11) NOT NULL AUTO_INCREMENT,
  `Date_annonce` date NOT NULL,
  `prix` int(11) NOT NULL,
  `ID_statut` int(11) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `ID_adresse` int(11) NOT NULL,
  `ID_typedebien` int(11) NOT NULL,
  `ID_caracteristique` int(11) NOT NULL,
  `ID_evaluation` int(11) NOT NULL,
  PRIMARY KEY (`ID_annonce`),
  KEY `ID_statut` (`ID_statut`),
  KEY `ID_user` (`ID_user`),
  KEY `ID_adresse` (`ID_adresse`),
  KEY `ID_typedebien` (`ID_typedebien`),
  KEY `ID_caracteristique` (`ID_caracteristique`),
  KEY `ID_evaluation` (`ID_evaluation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_billets`
--

CREATE TABLE IF NOT EXISTS `mi_billets` (
  `ID_billet` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `titre_billet` varchar(50) NOT NULL,
  `contenue_billet` varchar(250) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_billet`),
  KEY `ID_user` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_caracteristique`
--

CREATE TABLE IF NOT EXISTS `mi_caracteristique` (
  `ID_caracteristique` int(11) NOT NULL AUTO_INCREMENT,
  `nb_chambre` int(11) NOT NULL,
  `nb_salledebains` int(11) NOT NULL,
  `nb_pieces` int(11) NOT NULL,
  `info_general` text NOT NULL,
  `superficie_habitable` int(11) NOT NULL,
  `annee_construction` year(4) NOT NULL,
  PRIMARY KEY (`ID_caracteristique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_categorie`
--

CREATE TABLE IF NOT EXISTS `mi_categorie` (
  `ID_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `mi_categorie`
--

INSERT INTO `mi_categorie` (`ID_categorie`, `categorie`) VALUES
(1, 'residentiel'),
(2, 'commercial'),
(3, 'multilogement'),
(4, 'terrain'),
(5, 'ferme');

-- --------------------------------------------------------

--
-- Structure de la table `mi_commentaire`
--

CREATE TABLE IF NOT EXISTS `mi_commentaire` (
  `ID_commentaire` int(11) NOT NULL AUTO_INCREMENT,
  `ID_billet` int(11) NOT NULL,
  `contenu_commentaire` varchar(250) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_user` int(11) NOT NULL,
  PRIMARY KEY (`ID_commentaire`),
  KEY `ID_billet` (`ID_billet`),
  KEY `ID_user` (`ID_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_evaluation`
--

CREATE TABLE IF NOT EXISTS `mi_evaluation` (
  `ID_evaluation` int(11) NOT NULL AUTO_INCREMENT,
  `annee_evaluation` year(4) NOT NULL,
  `evaluation_dubatiment` int(11) NOT NULL,
  `evaluation_duterrain` int(11) NOT NULL,
  PRIMARY KEY (`ID_evaluation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_forfaits`
--

CREATE TABLE IF NOT EXISTS `mi_forfaits` (
  `ID_forfait` int(11) NOT NULL AUTO_INCREMENT,
  `nom_forfait` varchar(20) NOT NULL,
  `prix` int(11) NOT NULL,
  `description` text NOT NULL,
  `duree` int(11) NOT NULL,
  PRIMARY KEY (`ID_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_photo`
--

CREATE TABLE IF NOT EXISTS `mi_photo` (
  `ID_photo` int(11) NOT NULL AUTO_INCREMENT,
  `ID_type_photo` int(11) NOT NULL,
  `chemin_large` varchar(30) NOT NULL,
  `chemin_thumbnail` varchar(30) NOT NULL,
  PRIMARY KEY (`ID_photo`),
  KEY `ID_type_photo` (`ID_type_photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_province`
--

CREATE TABLE IF NOT EXISTS `mi_province` (
  `ID_province` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `province` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_province`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_role`
--

CREATE TABLE IF NOT EXISTS `mi_role` (
  `ID_role` int(11) NOT NULL AUTO_INCREMENT,
  `type_role` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_statut`
--

CREATE TABLE IF NOT EXISTS `mi_statut` (
  `ID_statut` int(11) NOT NULL AUTO_INCREMENT,
  `statut` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_statut`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `mi_statut`
--

INSERT INTO `mi_statut` (`ID_statut`, `statut`) VALUES
(1, 'vendre'),
(2, 'louer'),
(3, 'hors ligne');

-- --------------------------------------------------------

--
-- Structure de la table `mi_transactions`
--

CREATE TABLE IF NOT EXISTS `mi_transactions` (
  `ID_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ID_forfait` int(11) NOT NULL,
  `ID_agence` int(11) NOT NULL,
  `confirmation_paiement` int(11) NOT NULL,
  PRIMARY KEY (`ID_transaction`),
  KEY `ID_user` (`ID_user`),
  KEY `ID_agence` (`ID_agence`),
  KEY `ID_forfait` (`ID_forfait`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_type_debien`
--

CREATE TABLE IF NOT EXISTS `mi_type_debien` (
  `ID_typedebien` int(11) NOT NULL AUTO_INCREMENT,
  `typedebien` varchar(20) NOT NULL,
  `ID_categorie` int(11) NOT NULL,
  PRIMARY KEY (`ID_typedebien`),
  KEY `ID_categorie` (`ID_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `mi_type_debien`
--

INSERT INTO `mi_type_debien` (`ID_typedebien`, `typedebien`, `ID_categorie`) VALUES
(1, 'Condo', 1),
(2, 'Appartement', 1),
(3, 'Maison', 1),
(4, 'Chalet', 1),
(5, 'Bungalow', 1),
(6, 'Condo commercial', 2),
(7, 'Location d''espace co', 2),
(8, 'Bâtisse et terrain i', 2),
(9, 'Condo industriel', 2),
(10, 'Duplex', 3),
(11, 'Triplex', 3),
(12, 'Quadruplex', 3),
(13, 'Quintuplex', 3),
(14, 'Terrain vacant', 4),
(15, 'Terre à bois', 4),
(16, 'Ferme', 5);

-- --------------------------------------------------------

--
-- Structure de la table `mi_type_photo`
--

CREATE TABLE IF NOT EXISTS `mi_type_photo` (
  `ID_type_photo` int(11) NOT NULL AUTO_INCREMENT,
  `type_photo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_type_photo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `mi_type_photo`
--

INSERT INTO `mi_type_photo` (`ID_type_photo`, `type_photo`) VALUES
(1, 'Logo'),
(2, 'Photo'),
(3, 'Thumbnail');

-- --------------------------------------------------------

--
-- Structure de la table `mi_utilisateurs`
--

CREATE TABLE IF NOT EXISTS `mi_utilisateurs` (
  `ID_utilisateurs` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `courriel` varchar(50) NOT NULL,
  `nom_utilisateur` int(11) NOT NULL,
  `mot_de_passe` varchar(15) NOT NULL,
  `sexe` enum('M','F') NOT NULL,
  `DOB` date NOT NULL,
  `ID_adresse` int(11) NOT NULL,
  `ID_forfait` int(11) NOT NULL,
  `ID_agence` int(11) NOT NULL,
  `ID_photo` int(11) NOT NULL,
  `ID_role` int(11) NOT NULL,
  PRIMARY KEY (`ID_utilisateurs`),
  KEY `ID_adresse` (`ID_adresse`),
  KEY `ID_forfait` (`ID_forfait`),
  KEY `ID_agence` (`ID_agence`),
  KEY `ID_photo` (`ID_photo`),
  KEY `ID_role` (`ID_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mi_ville`
--

CREATE TABLE IF NOT EXISTS `mi_ville` (
  `ID_ville` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_province` int(11) unsigned NOT NULL,
  `ville` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_ville`),
  KEY `ID_province` (`ID_province`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `mi_adresse`
--
ALTER TABLE `mi_adresse`
  ADD CONSTRAINT `mi_adresse_ibfk_1` FOREIGN KEY (`ID_ville`) REFERENCES `mi_ville` (`ID_ville`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_agence`
--
ALTER TABLE `mi_agence`
  ADD CONSTRAINT `mi_agence_ibfk_2` FOREIGN KEY (`ID_photo`) REFERENCES `mi_photo` (`ID_photo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_agence_ibfk_1` FOREIGN KEY (`ID_adresse`) REFERENCES `mi_adresse` (`ID_adresse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_annonce`
--
ALTER TABLE `mi_annonce`
  ADD CONSTRAINT `mi_annonce_ibfk_6` FOREIGN KEY (`ID_evaluation`) REFERENCES `mi_evaluation` (`ID_evaluation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_annonce_ibfk_1` FOREIGN KEY (`ID_statut`) REFERENCES `mi_statut` (`ID_statut`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_annonce_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `mi_utilisateurs` (`ID_utilisateurs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_annonce_ibfk_3` FOREIGN KEY (`ID_adresse`) REFERENCES `mi_adresse` (`ID_adresse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_annonce_ibfk_4` FOREIGN KEY (`ID_typedebien`) REFERENCES `mi_type_debien` (`ID_typedebien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_annonce_ibfk_5` FOREIGN KEY (`ID_caracteristique`) REFERENCES `mi_caracteristique` (`ID_caracteristique`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_billets`
--
ALTER TABLE `mi_billets`
  ADD CONSTRAINT `mi_billets_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `mi_utilisateurs` (`ID_utilisateurs`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_commentaire`
--
ALTER TABLE `mi_commentaire`
  ADD CONSTRAINT `mi_commentaire_ibfk_2` FOREIGN KEY (`ID_user`) REFERENCES `mi_utilisateurs` (`ID_utilisateurs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_commentaire_ibfk_1` FOREIGN KEY (`ID_billet`) REFERENCES `mi_billets` (`ID_billet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_photo`
--
ALTER TABLE `mi_photo`
  ADD CONSTRAINT `mi_photo_ibfk_1` FOREIGN KEY (`ID_type_photo`) REFERENCES `mi_type_photo` (`ID_type_photo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_transactions`
--
ALTER TABLE `mi_transactions`
  ADD CONSTRAINT `mi_transactions_ibfk_3` FOREIGN KEY (`ID_forfait`) REFERENCES `mi_forfaits` (`ID_forfait`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_transactions_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `mi_utilisateurs` (`ID_utilisateurs`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_transactions_ibfk_2` FOREIGN KEY (`ID_agence`) REFERENCES `mi_agence` (`ID_agence`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_type_debien`
--
ALTER TABLE `mi_type_debien`
  ADD CONSTRAINT `mi_type_debien_ibfk_1` FOREIGN KEY (`ID_categorie`) REFERENCES `mi_categorie` (`ID_categorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_utilisateurs`
--
ALTER TABLE `mi_utilisateurs`
  ADD CONSTRAINT `mi_utilisateurs_ibfk_5` FOREIGN KEY (`ID_role`) REFERENCES `mi_role` (`ID_role`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_utilisateurs_ibfk_1` FOREIGN KEY (`ID_adresse`) REFERENCES `mi_adresse` (`ID_adresse`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_utilisateurs_ibfk_2` FOREIGN KEY (`ID_forfait`) REFERENCES `mi_forfaits` (`ID_forfait`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_utilisateurs_ibfk_3` FOREIGN KEY (`ID_agence`) REFERENCES `mi_agence` (`ID_agence`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mi_utilisateurs_ibfk_4` FOREIGN KEY (`ID_photo`) REFERENCES `mi_photo` (`ID_photo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `mi_ville`
--
ALTER TABLE `mi_ville`
  ADD CONSTRAINT `mi_ville_ibfk_1` FOREIGN KEY (`ID_province`) REFERENCES `mi_province` (`ID_province`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
