-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:8889
-- Généré le :  Mer 16 Janvier 2019 à 16:53
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `dbProject`
--

-- --------------------------------------------------------

--
-- Structure de la table `answered`
--

CREATE TABLE `answered` (
  `id` bigint(20) NOT NULL,
  `q_id` bigint(20) DEFAULT NULL,
  `u_id` bigint(20) DEFAULT NULL,
  `e_id` bigint(20) DEFAULT NULL,
  `rate` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `answered`
--

INSERT INTO `answered` (`id`, `q_id`, `u_id`, `e_id`, `rate`) VALUES
(2, 1, 5, 12, 6.75),
(3, 1, 4, 12, 10),
(4, 1, 7, 2, 3),
(5, 1, 8, 8, 2),
(6, 1, 9, 1, 7),
(8, 1, 10, 7, 6.75),
(9, 5, 5, 12, 6.2),
(10, 5, 5, 12, 6.8),
(11, 3, 5, 12, 5),
(12, 3, 9, 1, 9.25),
(13, 1, 12, 11, 10),
(14, 1, 13, 11, 4.25),
(15, 1, 15, 6, 5.4),
(16, 5, 15, 6, 8),
(17, 2, 5, 12, 7.4),
(18, 1, 16, 12, 6),
(19, 1, 17, 4, 7.4),
(20, 1, 18, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `axe`
--

CREATE TABLE `axe` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `axe`
--

INSERT INTO `axe` (`id`, `name`) VALUES
(1, 'ORGANISATION DE L\'ENSEIGNEMENT'),
(2, 'PROCESSUS DE FORMATION'),
(3, 'PROGRAMME DE FORMATION'),
(4, 'RESSOURCES HUMAINES'),
(5, 'RESSOURCES MATERIELLE'),
(6, 'RESULTATS');

-- --------------------------------------------------------

--
-- Structure de la table `cible`
--

CREATE TABLE `cible` (
  `id` bigint(20) NOT NULL,
  `id_cible` bigint(20) DEFAULT NULL,
  `id_questionnaire` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ecole`
--

CREATE TABLE `ecole` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ecole`
--

INSERT INTO `ecole` (`id`, `name`) VALUES
(1, 'ENSIAS'),
(2, 'ENSEM'),
(3, 'EMI'),
(4, 'EHTP'),
(5, 'ENIM'),
(6, 'ENSET'),
(7, 'ENSAM'),
(8, 'ENSA'),
(9, 'IAV'),
(10, 'INSEA'),
(11, 'ESI'),
(12, 'AIAC'),
(13, 'ISEM');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

CREATE TABLE `proposition` (
  `id` bigint(20) NOT NULL,
  `proposition` varchar(255) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `rate` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `proposition`
--

INSERT INTO `proposition` (`id`, `proposition`, `question_id`, `rate`) VALUES
(1, 'Très satisfait', 1, 10),
(2, 'satistait', 1, 7),
(3, 'insatisfait', 1, 3),
(4, 'Très insatisfait', 1, 0),
(5, 'Très satisfait', 2, 10),
(6, 'satistait', 2, 7),
(7, 'insatisfait', 2, 3),
(8, 'Très insatisfait', 2, 0),
(9, 'Très satisfait', 3, 10),
(10, 'satistait', 3, 7),
(11, 'insatisfait', 3, 3),
(12, 'Très insatisfait', 3, 0),
(13, 'Très satisfait', 4, 10),
(14, 'satistait', 4, 7),
(15, 'insatisfait', 4, 3),
(16, 'Très insatisfait', 4, 0),
(22, 'Très satisfait', 5, 10),
(23, 'satistait', 5, 7),
(24, 'insatisfait', 5, 3),
(25, 'Très insatisfait', 5, 0),
(26, 'Très satisfait', 6, 10),
(27, 'satistait', 6, 7),
(28, 'insatisfait', 6, 3),
(29, 'Très insatisfait', 6, 0),
(30, 'Très satisfait', 7, 10),
(31, 'satistait', 7, 7),
(32, 'insatisfait', 7, 3),
(33, 'Très insatisfait', 7, 0),
(34, 'Très satisfait', 8, 10),
(35, 'satistait', 8, 7),
(36, 'insatisfait', 8, 3),
(37, 'Très insatisfait', 8, 0),
(38, 'Très satisfait', 9, 10),
(39, 'satistait', 9, 7),
(40, 'insatisfait', 9, 3),
(41, 'Très insatisfait', 9, 0),
(42, 'Très satisfait', 10, 10),
(43, 'satistait', 10, 7),
(44, 'insatisfait', 10, 3),
(45, 'Très insatisfait', 10, 0),
(46, 'Très satisfait', 11, 10),
(47, 'satistait', 11, 7),
(48, 'insatisfait', 11, 3),
(49, 'Très insatisfait', 11, 0),
(50, 'Très satisfait', 12, 10),
(51, 'satistait', 12, 7),
(52, 'insatisfait', 12, 3),
(53, 'Très insatisfait', 12, 0),
(54, 'Très satisfait', 13, 10),
(55, 'satistait', 13, 7),
(56, 'insatisfait', 13, 3),
(57, 'Très insatisfait', 13, 0),
(58, 'Très satisfait', 14, 10),
(59, 'satistait', 14, 7),
(60, 'insatisfait', 14, 3),
(61, 'Très insatisfait', 14, 0),
(62, 'Très satisfait', 15, 10),
(63, 'satistait', 15, 7),
(64, 'insatisfait', 15, 3),
(65, 'Très insatisfait', 15, 0),
(66, 'Très satisfait', 16, 10),
(67, 'satistait', 16, 7),
(68, 'insatisfait', 16, 3),
(69, 'Très insatisfait', 16, 0),
(70, 'Très satisfait', 17, 10),
(71, 'satistait', 17, 7),
(72, 'insatisfait', 17, 3),
(73, 'Très insatisfait', 17, 0),
(74, 'Très satisfait', 18, 10),
(75, 'satistait', 18, 7),
(76, 'insatisfait', 18, 3),
(77, 'Très insatisfait', 18, 0),
(78, 'Très satisfait', 19, 10),
(79, 'satistait', 19, 7),
(80, 'insatisfait', 19, 3),
(81, 'Très insatisfait', 19, 0),
(82, 'Très satisfait', 20, 10),
(83, 'satistait', 20, 7),
(84, 'insatisfait', 20, 3),
(85, 'Très insatisfait', 20, 0),
(86, 'Très satisfait', 21, 10),
(87, 'satistait', 21, 7),
(88, 'insatisfait', 21, 3),
(89, 'Très insatisfait', 21, 0),
(90, 'Très satisfait', 22, 10),
(91, 'satistait', 22, 7),
(92, 'insatisfait', 22, 3),
(93, 'Très insatisfait', 22, 0),
(94, 'Très satisfait', 23, 10),
(95, 'satistait', 23, 7),
(96, 'insatisfait', 23, 3),
(97, 'Très insatisfait', 23, 0),
(98, 'Très satisfait', 24, 10),
(99, 'satistait', 24, 7),
(100, 'insatisfait', 24, 3),
(101, 'Très insatisfait', 24, 0),
(102, 'Très satisfait', 25, 10),
(103, 'satistait', 25, 7),
(104, 'insatisfait', 25, 3),
(105, 'Très insatisfait', 25, 0),
(106, 'Très satisfait', 26, 10),
(107, 'satistait', 26, 7),
(108, 'insatisfait', 26, 3),
(109, 'Très insatisfait', 26, 0),
(110, 'Très satisfait', 27, 10),
(111, 'satistait', 27, 7),
(112, 'insatisfait', 27, 3),
(113, 'Très insatisfait', 27, 0),
(114, 'Très satisfait', 28, 10),
(115, 'satistait', 28, 7),
(116, 'insatisfait', 28, 3),
(117, 'Très insatisfait', 28, 0),
(124, 'Très satisfait', 31, 10),
(125, 'satisfait', 31, 7),
(126, 'insatisfait', 31, 3),
(127, 'Très insatisfait', 31, 0),
(132, 'Très satisfait', 33, 10),
(133, 'satisfait', 33, 7),
(134, 'insatisfait', 33, 3),
(135, 'Très insatisfait', 33, 0);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `questionnaire_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `question`
--

INSERT INTO `question` (`id`, `name`, `questionnaire_id`) VALUES
(1, 'Question1', 1),
(2, 'Question2', 1),
(3, 'Question3', 1),
(4, 'Question4', 1),
(5, 'Question1', 2),
(6, 'Question2', 2),
(7, 'Question3', 2),
(8, 'Question4', 2),
(9, 'Question5', 2),
(10, 'Question1', 3),
(11, 'Question2', 3),
(12, 'Question3', 3),
(13, 'Question4', 3),
(14, 'Question1', 4),
(15, 'Question2', 4),
(16, 'Question3', 4),
(17, 'Question4', 4),
(18, 'Question5', 4),
(19, 'Que pensez-vous des ressources matérielles de votre ecole', 5),
(20, 'Question2', 5),
(21, 'Question3', 5),
(22, 'Question4', 5),
(23, 'Question5', 5),
(24, 'Question1', 6),
(25, 'Question2', 6),
(26, 'Question3', 6),
(27, 'Question4', 6),
(28, 'Question5', 6),
(33, 'Question5', 1);

-- --------------------------------------------------------

--
-- Structure de la table `questionnaire`
--

CREATE TABLE `questionnaire` (
  `id` bigint(20) NOT NULL,
  `axe_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `questionnaire`
--

INSERT INTO `questionnaire` (`id`, `axe_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ecole` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `nom`, `password`, `prenom`, `type`, `ecole`) VALUES
(4, 'abdomeftahi97@gmail.com', 'Meftahi', 'malikawx12', 'Abderrahman', 'Etudiant', 'AIAC'),
(5, 'abdomeftahi7@gmail.com', 'Meftahi', 'malikawx12', 'Abderrahman', 'Etudiant', 'AIAC'),
(7, 'loubnaabbas@gmail.com', 'Abbass', 'malikawx', 'Loubna', 'Administrateur', 'ENSEM'),
(8, 'mahabenfares@gmail.com', 'Benfares', 'malikawx12', 'Maha', 'Etudiant', 'ENSA'),
(10, 'malikamestaghanmi@gmail.com', 'Mestaghanmi ', 'maliakwx12', 'Malika', 'Etudiant', 'ENSAM'),
(11, 'mahaabbass@gmail.com', 'Abbass', 'malikawx12', 'maha', 'Etudiant', 'IAV'),
(12, 'benfaresloubna@gmail.com', 'Benfares', 'malikawx12', 'loubna', 'Etudiant', 'ESI'),
(14, 'admin@gmail.com', 'admin', 'admin12', 'admin', 'admin', NULL),
(15, 'saharmsellek@gmail.com', 'Msellek ', 'malikawx12', 'Sahar', 'Etudiant', 'ENSET'),
(16, 'hammouchyassine@gmail.com', 'Meftahi', 'malikawx12', 'Abderrahman', 'Etudiant', 'AIAC'),
(17, 'fteza@gmail.com', 'FTEZA', 'malikawx12', 'FTEZA', 'Etudiant', 'EHTP'),
(18, 'hajjouji@gmail.com', 'Badr', 'malikawx12', 'hajjouji', 'Etudiant', 'ENSIAS'),
(20, 'hossambahja@gmail.com', 'Bahja', 'malikawx12', 'Hossam', 'Etudiant', 'EMI'),
(21, 'redServ@gmail.com', 'redouane', 'malikawx12', 'serveur', 'Etudiant', 'ENSIAS');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `answered`
--
ALTER TABLE `answered`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `axe`
--
ALTER TABLE `axe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cible`
--
ALTER TABLE `cible`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ecole`
--
ALTER TABLE `ecole`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `answered`
--
ALTER TABLE `answered`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `axe`
--
ALTER TABLE `axe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `cible`
--
ALTER TABLE `cible`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `ecole`
--
ALTER TABLE `ecole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `proposition`
--
ALTER TABLE `proposition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `questionnaire`
--
ALTER TABLE `questionnaire`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;