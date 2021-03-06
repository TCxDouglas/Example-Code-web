-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2021 at 08:31 PM
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
  `Puntaje` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `calificaciones`
--

INSERT INTO `calificaciones` (`idCalificacion`, `idAlumno`, `idEvaluacion`, `Puntaje`, `fecha`) VALUES
(5, 3, 1, '8', '5-05-2021'),
(6, 4, 1, '7', '04-05-2021'),
(7, 4, 2, '7', '07-05-2021'),
(8, 5, 2, '0', '01-05-2021'),
(9, 5, 1, '5', '05-05-2021'),
(10, 7, 1, '10', '15-05-2021');

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
(2, 'El Johan', 'Del anime'),
(3, 'Admin', 'Mamadisimo');

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
(2, 2, 'Parcial 1 - Anime', 'Contesta las preguntas para ver su nivel de otaku', 'Cultura Japonesa', '50 min'),
(3, 3, 'Matematica', 'Responda las siguiente operaciones matematicas seleccionando las opcion correcta', 'Matematica', '45 min'),
(4, 3, 'Lenguaje', 'Responda las siguiente preguntas seleccionando las opcion correcta', 'Lenguaje', '45 Min'),
(5, 3, 'Ciencia', 'Responda las siguiente preguntas seleccionando las opcion correcta', 'Ciencia', '45 Min'),
(6, 3, 'Sociales', 'Responda las siguiente preguntas seleccionando las opcion correcta', 'Sociales', '45 Min');

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
(5, 2, 'Que significa las siglas SAO', 'Siempre Atentos Ok ', 'Sword Art Online ', 'Show art Online', 'Sword Art Online '),
(6, 3, '??Cu??nto es 10 - 5?', '9', '0', '5', '5'),
(7, 3, '??Cu??nto es 2 + 2?', '1', '4', '9', '4'),
(8, 3, '??Cu??nto es 10 + 10?', '20', '18', '22', '20'),
(9, 3, '??Cu??nto es 20 ??? 15?', '35', '4', '5', '5'),
(10, 3, '??Cu??nto es 25 ?? 5?', '10', '5', '1', '5'),
(11, 3, '??Cu??nto es 5 X 5?', '60', '25', '10', '25'),
(12, 3, '??Cuantos lados tiene un tri??ngulo?', 'Tres', 'Cinco', 'Dos', 'Tres'),
(13, 3, 'Seleccione los n??meros pares', '5, 7, 9, 3', '2, 6, 8, 4', '9, 4, 3, 6', '2, 6, 8, 4'),
(14, 3, '??Cu??l es el resultado de multiplicar 2x2?', '6', '4', '5', '4'),
(15, 3, '??Cu??l es el resultado de sumar 4 + 4 + 4?', '10', '12', '8', '12'),
(16, 4, 'Los elementos de una comunicaci??n son:', 'emisor, mensaje, receptor, c??digo y canal.', 'receptor, morfema, emisor, mensaje y canal.', 'receptor, morfema, fonema, canal y c??digo.', 'emisor, mensaje, receptor, c??digo y canal.'),
(17, 4, '??Qu?? debemos preguntar para saber su nombre?', '??Como eres?', '??Como est??s?', '??Como te llamas?', '??Como te llamas? '),
(18, 4, '??Qu?? idioma hablamos?', 'ingles', 'espa??ol', 'aleman', 'espa??ol'),
(19, 4, '??Selecciona la palabra correcta?', 'Avi??n', 'Abion', 'Hab??on', 'Avi??n'),
(20, 4, '??Selecciona la palabra aguda?', 'Mam??', 'Agua', 'Computadora', 'Mam??'),
(21, 4, 'Completa esta oraci??n con la palabra correcta: Echa el az??car cuando la leche....', 'Hierba', 'Hierva', 'ierva', 'Hierva'),
(22, 4, '??CU??L ES EL IDIOMA M??S HABLADO EN EL MUNDO?', 'Espa??ol', 'Ingles', 'Frances', 'Ingles'),
(23, 4, 'Seleccione la palabra correcta', 'Herencia', 'Erencia', 'Erensia', 'Herencia'),
(24, 4, '??Por cuantas letras est?? compuesto el abecedario?', '30', '25', '27', '27'),
(25, 4, '??Cu??ntas formas literarias hay?', '3', '1', '8', 'Ninguna'),
(26, 4, 'Las palabras que llevan tilde en la s??laba t??nica cuando terminan en vocal, -n o -s son?', 'llanas o graves', 'agudas', 'esdr??julas', 'agudas'),
(27, 5, 'son todos aquellos que tienen cr??neo, cola, y una espina dorsal o columna vertebral que divide su cuerpo en dos partes iguales.', 'animales vertebrados', 'animales invertebrados', 'Ambas son correctas', 'animales vertebrados'),
(28, 5, '??Cu??l es el animal m??s alto de la tierra? ', 'perro ', 'Leon ', 'Jirafa', 'Jirafa'),
(29, 5, 'Es un ejemplo de animal carn??voro', 'caballo', 'cabra', 'Le??n', 'Le??n'),
(30, 5, 'Es un ejemplo de animal dom??stico', 'perro', 'Le??n', 'elefante', 'Le??n'),
(31, 5, '??Cual es un animal mam??fero?', 'Cocodrilo', 'Perro', 'Tortuga', 'Perro'),
(32, 5, '??Cu??les son los estados del agua?', 'S??lido, fr??a y caliente', 'S??lido, fr??a y caliente', 'Solido, liquido y gaseoso', 'Solido, liquido y gaseoso'),
(33, 5, 'Seleccione de que est??n cubiertas las gallinas', 'Plumas', 'Pelos', 'Escamas', 'Plumas'),
(34, 5, '??Que da la vaca?', 'La Leche', 'La crema', 'El yogurt', 'La Leche'),
(35, 5, '??Cu??l es el instrumento que se usa para medir la temperatura?', 'Cronometro', 'puls??metro', 'term??metro', 'term??metro'),
(36, 5, '??De que especie es el cocodrilo?', 'Mamifero', 'Anfibio', 'Reptil', 'Anfibio'),
(37, 6, '??Quien descubri?? Am??rica?', 'Cristobal Colon', 'Arist??teles', 'Luis Garza ', 'Cristobal Colon'),
(38, 6, '??Como se llama nuestro pa??s?', 'Guatemala', 'Nicaragua', 'El Salvador', 'El Salvador'),
(39, 6, '??Qu?? colores tiene nuestra bandera?', 'azul y morado', 'azul y rojo', 'azul y blanco', 'azul y blanco'),
(40, 6, '??Cuantos departamentos tiene el Salvador?', '14', '16', '12', '14'),
(41, 6, '??D??nde se encuentra ubicado el volcan chaparrastique?', 'Santa Ana', 'Sonsonate', 'San Miguel', 'San Miguel'),
(42, 6, '??Cu??les son los colores de la bandera de Guatemala?', 'Celeste y azul', 'Blanco y azul', 'Celeste y blanco', 'Celeste y blanco'),
(43, 6, '??Por cuantos pa??ses est?? conformado centro Am??rica?', '4', '7', '9', '7'),
(44, 6, '??Cu??l es el ave nacional de nuestro pa??s?', 'El perico', 'El aguila', 'El torogoz', 'El torogoz'),
(45, 6, '??Cu??l es la flor nacional de nuestro pa??s?', 'Los girasoles', 'El izote', 'Los tulipanes', 'El izote'),
(46, 6, '??Cu??l es la capital de El Salvador?', 'San Salvador', 'San Miguel', 'Usulutan', 'San Salvador');

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
  MODIFY `idDocente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `evaluaciones`
--
ALTER TABLE `evaluaciones`
  MODIFY `idEvaluacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
