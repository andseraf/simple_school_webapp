-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 29, 2024 alle 09:39
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_school`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `aula`
--

CREATE TABLE `aula` (
  `id_aula` int(11) NOT NULL,
  `descrizione` text NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `aula`
--

INSERT INTO `aula` (`id_aula`, `descrizione`, `nome`) VALUES
(1, 'A1 - piano terra, ala sinistra istituto.', 'A1'),
(2, 'A2', 'A2'),
(3, 'LAB-INF - piano primo ala destra.', ''),
(4, 'A3', 'A3'),
(5, 'A4', 'A4');

-- --------------------------------------------------------

--
-- Struttura della tabella `classe`
--

CREATE TABLE `classe` (
  `id_classe` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `dipartimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `classe`
--

INSERT INTO `classe` (`id_classe`, `nome`, `dipartimento_id`) VALUES
(4, 'VB-INF', 1),
(5, 'IVB-INF', 1),
(6, 'VA-LIN', 5);

-- --------------------------------------------------------

--
-- Struttura della tabella `classe_aula`
--

CREATE TABLE `classe_aula` (
  `classe_id` int(11) NOT NULL,
  `aula_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `classe_aula`
--

INSERT INTO `classe_aula` (`classe_id`, `aula_id`) VALUES
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `dipartimento`
--

CREATE TABLE `dipartimento` (
  `nome` varchar(100) DEFAULT NULL,
  `id_dipartimento` int(11) NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `dipartimento`
--

INSERT INTO `dipartimento` (`nome`, `id_dipartimento`, `descrizione`) VALUES
('Informatica', 1, 'Dipartimento di Informatica e Telecomunicazioni.'),
('Liceo Scientifico', 3, 'Liceo Scientifico'),
('Scienze Umane', 4, 'Dipartimento di Scienze Umane.'),
('Liceo Linguistico', 5, 'Dipartimento Linguistico.'),
('Elettrotecnico', 6, 'Dipartimento di Elettrotecnica.');

-- --------------------------------------------------------

--
-- Struttura della tabella `docente`
--

CREATE TABLE `docente` (
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `ruolo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docente_classe`
--

CREATE TABLE `docente_classe` (
  `docente_id` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docente_materia`
--

CREATE TABLE `docente_materia` (
  `materia_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `documentazione`
--

CREATE TABLE `documentazione` (
  `Id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `documentazione`
--

INSERT INTO `documentazione` (`Id`, `nome`, `descrizione`) VALUES
(1, 'nome tabella', 'nome tabella al singolare scritto in minuscolo, possibilmente formato da una sola parola.'),
(2, 'nome attributo', 'nome attributo singolare, formato da una o più parole separate da underscore \"_\".'),
(3, 'nome tabella che rappresenta relazioni tra due entità.', 'il nome è composto dal nome delle entità che creano la relazione esempio: entita1_entita2'),
(4, 'nome chiave primaria', 'esempio id_nometabella'),
(5, 'nome attributo chiave esterna ', 'esempio nometabellaesterna_id'),
(6, 'nome vincolo FK', 'se un vincolo su un attributo si riferisce alla chiave di un altra tabella il nome del vincolo sarà formato come nel seguente esempio:\r\nFK_nometabellafk_nometabellapk\r\n\r\nse un dipentende appartiene a un dipartimento allora il nome del vincolo sarà FK_dipendente_dipartimento');

-- --------------------------------------------------------

--
-- Struttura della tabella `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `titolo` text NOT NULL,
  `descrizione` text NOT NULL,
  `isbn` varchar(100) NOT NULL,
  `materia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descrizione` text NOT NULL,
  `dipartimento_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `ruolo`
--

CREATE TABLE `ruolo` (
  `id_ruolo` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `ruolo`
--

INSERT INTO `ruolo` (`id_ruolo`, `nome`, `descrizione`) VALUES
(1, 'Rappresentante di classe', 'Rappresentante di classe'),
(2, 'Rappresentante di istituto', 'Rappresentante di istituto'),
(3, 'Coordinatore di classe', 'Coordinatore di classe'),
(4, 'Coordinatore di dipartimento', 'Coordinatore di dipartimento');

-- --------------------------------------------------------

--
-- Struttura della tabella `studente`
--

CREATE TABLE `studente` (
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `data_nascita` date NOT NULL,
  `id_studente` int(11) NOT NULL,
  `classe_id` int(11) NOT NULL,
  `ruolo_id` int(11) NOT NULL,
  `telefono` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `studente`
--

INSERT INTO `studente` (`nome`, `cognome`, `data_nascita`, `id_studente`, `classe_id`, `ruolo_id`, `telefono`) VALUES
('mario', 'maria mario', '2004-02-27', 4, 4, 3, '1231241345234'),
('riccardino', 'fuffolo', '2024-02-13', 5, 4, 2, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `studente_verifica`
--

CREATE TABLE `studente_verifica` (
  `studente_id` int(11) NOT NULL,
  `voto` decimal(10,0) NOT NULL,
  `descrizione` int(11) NOT NULL,
  `verifica_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `verifica`
--

CREATE TABLE `verifica` (
  `id_verifica` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `studente_id` int(11) NOT NULL,
  `materia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id_aula`);

--
-- Indici per le tabelle `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`id_classe`),
  ADD KEY `FK_classe_dipartimento` (`dipartimento_id`);

--
-- Indici per le tabelle `classe_aula`
--
ALTER TABLE `classe_aula`
  ADD KEY `FK_classe_aula_aula` (`aula_id`),
  ADD KEY `FK_classe_aula_classe` (`classe_id`);

--
-- Indici per le tabelle `dipartimento`
--
ALTER TABLE `dipartimento`
  ADD PRIMARY KEY (`id_dipartimento`);

--
-- Indici per le tabelle `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `FK_docente_ruolo` (`ruolo_id`);

--
-- Indici per le tabelle `docente_classe`
--
ALTER TABLE `docente_classe`
  ADD KEY `FK_docente_classe_docente` (`docente_id`),
  ADD KEY `FK_docente_classe_classe` (`classe_id`);

--
-- Indici per le tabelle `docente_materia`
--
ALTER TABLE `docente_materia`
  ADD KEY `FK_docente_materia_materia` (`materia_id`),
  ADD KEY `FK_docente_materia_docente` (`docente_id`);

--
-- Indici per le tabelle `documentazione`
--
ALTER TABLE `documentazione`
  ADD PRIMARY KEY (`Id`);

--
-- Indici per le tabelle `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`),
  ADD KEY `FK_LIBRO_MATERIA` (`materia_id`);

--
-- Indici per le tabelle `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`),
  ADD KEY `FK_materia_corso` (`dipartimento_id`);

--
-- Indici per le tabelle `ruolo`
--
ALTER TABLE `ruolo`
  ADD PRIMARY KEY (`id_ruolo`);

--
-- Indici per le tabelle `studente`
--
ALTER TABLE `studente`
  ADD PRIMARY KEY (`id_studente`),
  ADD KEY `FK_studente_ruolo` (`ruolo_id`),
  ADD KEY `FK_studente_classe` (`classe_id`);

--
-- Indici per le tabelle `studente_verifica`
--
ALTER TABLE `studente_verifica`
  ADD KEY `FK_studente_verifica_studente` (`studente_id`),
  ADD KEY `FK_studente_verifica_verifica` (`verifica_id`);

--
-- Indici per le tabelle `verifica`
--
ALTER TABLE `verifica`
  ADD PRIMARY KEY (`id_verifica`),
  ADD KEY `FK_VERIFICA_STUDENTE` (`studente_id`),
  ADD KEY `FK_VERIFICA_MATERIA` (`materia_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `aula`
--
ALTER TABLE `aula`
  MODIFY `id_aula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `classe`
--
ALTER TABLE `classe`
  MODIFY `id_classe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `dipartimento`
--
ALTER TABLE `dipartimento`
  MODIFY `id_dipartimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `documentazione`
--
ALTER TABLE `documentazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `ruolo`
--
ALTER TABLE `ruolo`
  MODIFY `id_ruolo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la tabella `studente`
--
ALTER TABLE `studente`
  MODIFY `id_studente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `FK_classe_dipartimento` FOREIGN KEY (`dipartimento_id`) REFERENCES `dipartimento` (`id_dipartimento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `classe_aula`
--
ALTER TABLE `classe_aula`
  ADD CONSTRAINT `FK_classe_aula_aula` FOREIGN KEY (`aula_id`) REFERENCES `aula` (`id_aula`),
  ADD CONSTRAINT `FK_classe_aula_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id_classe`);

--
-- Limiti per la tabella `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `FK_docente_ruolo` FOREIGN KEY (`ruolo_id`) REFERENCES `ruolo` (`id_ruolo`);

--
-- Limiti per la tabella `docente_classe`
--
ALTER TABLE `docente_classe`
  ADD CONSTRAINT `FK_docente_classe_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `FK_docente_classe_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`);

--
-- Limiti per la tabella `docente_materia`
--
ALTER TABLE `docente_materia`
  ADD CONSTRAINT `FK_docente_materia_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `FK_docente_materia_materia` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id_materia`);

--
-- Limiti per la tabella `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK_LIBRO_MATERIA` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id_materia`);

--
-- Limiti per la tabella `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `FK_materia_corso` FOREIGN KEY (`dipartimento_id`) REFERENCES `dipartimento` (`id_dipartimento`);

--
-- Limiti per la tabella `studente`
--
ALTER TABLE `studente`
  ADD CONSTRAINT `FK_studente_classe` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id_classe`),
  ADD CONSTRAINT `FK_studente_ruolo` FOREIGN KEY (`ruolo_id`) REFERENCES `ruolo` (`id_ruolo`);

--
-- Limiti per la tabella `studente_verifica`
--
ALTER TABLE `studente_verifica`
  ADD CONSTRAINT `FK_studente_verifica_studente` FOREIGN KEY (`studente_id`) REFERENCES `studente` (`id_studente`),
  ADD CONSTRAINT `FK_studente_verifica_verifica` FOREIGN KEY (`verifica_id`) REFERENCES `verifica` (`id_verifica`);

--
-- Limiti per la tabella `verifica`
--
ALTER TABLE `verifica`
  ADD CONSTRAINT `FK_VERIFICA_MATERIA` FOREIGN KEY (`materia_id`) REFERENCES `materia` (`id_materia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
