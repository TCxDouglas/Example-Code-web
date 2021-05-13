-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2021 at 06:51 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `escolares`
--

-- --------------------------------------------------------

--
-- Table structure for table `calificaciones`
--

CREATE TABLE `calificaciones` (
  `idCalificacion` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idEvaluacion` int(11) NOT NULL,
  `Puntaje` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `idAlumno`, `idEvaluacion`, `Puntaje`) VALUES
(5, 3, 1, '8'),
(6, 4, 1, '7'),
(7, 4, 2, '7'),
(8, 5, 2, '0'),
(9, 5, 1, '5'),
(10, 7, 1, '10');

-- --------------------------------------------------------

--
-- Table structure for table `docente`
--

CREATE TABLE `docente` (
  `idDocente` int(11) NOT NULL,
  `nombreDocente` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `docente`
--

INSERT INTO `docente` (`idDocente`, `nombreDocente`, `apellido`) VALUES
(1, 'Juan carlos', 'Perez'),
(2, 'El Johan', 'Del anime');

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones`
--

CREATE TABLE `evaluaciones` (
  `idEvaluacion` int(11) NOT NULL,
  `idDocente` int(11) NOT NULL,
  `nombreEvaluacion` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `materia` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `evaluaciones`
--

INSERT INTO `evaluaciones` (`idEvaluacion`, `idDocente`, `nombreEvaluacion`, `descripcion`, `materia`, `tiempo`) VALUES
(1, 1, 'Laboratorio 1', 'Primer laboratorio, conteste todas las preguntas prro', 'Ciencias y salud', '45 min'),
(2, 2, 'Parcial 1 - Anime', 'Contesta las preguntas para ver su nivel de otaku', 'Cultura Japonesa', '50 min');

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE `preguntas` (
  `idPregunta` int(11) NOT NULL,
  `idEvaluacion` int(11) NOT NULL,
  `pregunta` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `opcion1` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `opcion2` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `opcion3` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `respuesta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `preguntas`
--

INSERT INTO `preguntas` (`idPregunta`, `idEvaluacion`, `pregunta`, `opcion1`, `opcion2`, `opcion3`, `respuesta`) VALUES
(2, 1, 'Porque ella no me ama?', 'Por feo y acabado', 'Por pobre y no tener carro', 'Todas son correctas', 'Todas son correctas'),
(3, 1, 'Porque no conseguimos novia?', 'Nadie nos quiere', 'Somos unos inutiles', 'Todas son correctas', 'Todas son correctas'),
(4, 2, 'Quies es el prota de OnePuch?', 'El calvito', 'EL del sombrero', 'El de pelo largo', 'El calvito'),
(5, 2, 'Que significa las siglas SAO', 'Siempre Atentos Ok ', 'Sword Art Online ', 'Show art Online', 'Sword Art Online ');

-- --------------------------------------------------------

--
-- Table structure for table `respuestas`
--

CREATE TABLE `respuestas` (
  `idRespuesta` int(11) NOT NULL,
  `idCalificacion` int(11) NOT NULL,
  `idPregunta` int(11) NOT NULL,
  `respuesta` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `respuestas`
--

INSERT INTO `respuestas` (`idRespuesta`, `idCalificacion`, `idPregunta`, `respuesta`, `estado`) VALUES
(1, 5, 2, 'Todas son correctas', 'correcta'),
(2, 5, 3, 'Somos unos inutiles', 'incorrecta'),
(3, 6, 2, 'Por pobre y no tener carro', 'incorrecta'),
(4, 6, 3, 'Nadie nos quiere', 'incorrecta'),
(5, 7, 4, 'El calvito', 'correcta'),
(6, 7, 5, 'Sword Art Online ', 'correcta'),
(7, 8, 4, 'El de pelo largo', 'incorrecta'),
(8, 8, 5, 'Siempre Atentos Ok ', 'incorrecta'),
(9, 9, 3, 'Todas son correctas', 'correcta');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(15) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `pass`, `telefono`, `tipo`) VALUES
(1, 'Prueba de usuario', 'prueba@gmail.com', 'prueba1234', '7412-9852', 'Prueba'),
(2, 'Prueba de usuario', 'prueba@gmail.com', 'prueba1234', '7412-9852', 'Prueba'),
(3, 'El inutil', 'tasca@inutil.com', 'tasca1234', '7412-9852', 'estudiante'),
(4, 'Douglas', 'eldo@inutil.com', 'tasca1234', '7412-9852', 'estudiante'),
(5, 'Climaco', 'Baboso@inutil.com', 'baboo1478', '7412-9852', 'estudiante'),
(6, 'Victir', 'victor@gmail.com', 'victor1234', '7412-9852', 'estudiante');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`idCalificacion`);

--
-- Indexes for table `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`idDocente`);

--
-- Indexes for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  ADD PRIMARY KEY (`idEvaluacion`);

--
-- Indexes for table `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`idPregunta`);

--
-- Indexes for table `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`idRespuesta`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `idCalificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `docente`
--
ALTER TABLE `docente`
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idEvaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `idRespuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
