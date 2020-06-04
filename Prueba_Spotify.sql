-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 04-06-2020 a las 07:33:33
-- Versión del servidor: 8.0.20
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Prueba_Spotify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Albumes`
--

CREATE TABLE `Albumes` (
  `idAlbum` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `anio` varchar(50) DEFAULT NULL,
  `idArtista` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Albumes`
--

INSERT INTO `Albumes` (`idAlbum`, `title`, `anio`, `idArtista`) VALUES
(1, 'IMAGINE', '1972', 1),
(2, 'HELP', '1965', 2),
(3, 'TNT', '1982', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Artista`
--

CREATE TABLE `Artista` (
  `idArtista` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `pais` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Artista`
--

INSERT INTO `Artista` (`idArtista`, `nombre`, `pais`, `email`) VALUES
(1, 'JHON LENNON', 'LIVERPOOL', 'tkelf0@pinterest.com'),
(2, 'PAUL MCCARTNEY', 'LIVERPOOL', 'hbein1@behance.net'),
(3, 'ACDC', 'AUSTRALIA', 'ghayden2@ameblo.jp');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cancion`
--

CREATE TABLE `Cancion` (
  `idCancion` int NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `idAlbum` int DEFAULT NULL,
  `idGenero` int DEFAULT NULL,
  `tipo_cancion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Cancion`
--

INSERT INTO `Cancion` (`idCancion`, `title`, `idAlbum`, `idGenero`, `tipo_cancion`) VALUES
(1, 'IMAGINE', 1, 2, 'CLASICA'),
(2, 'YESTERDAY', 2, 1, 'CLASICA'),
(3, 'TNT', 3, 3, 'CLASICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cancion_fav`
--

CREATE TABLE `Cancion_fav` (
  `idFav` int NOT NULL,
  `idUser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Cancion_fav`
--

INSERT INTO `Cancion_fav` (`idFav`, `idUser`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Generos`
--

CREATE TABLE `Generos` (
  `idGenero` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Generos`
--

INSERT INTO `Generos` (`idGenero`, `nombre`) VALUES
(1, 'ROCK'),
(2, 'BALADA'),
(3, 'HEAVY ROCK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Lista_Fav`
--

CREATE TABLE `Lista_Fav` (
  `idCancion` int NOT NULL,
  `idFav` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Lista_Fav`
--

INSERT INTO `Lista_Fav` (`idCancion`, `idFav`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Login`
--

CREATE TABLE `Login` (
  `idLogin` int NOT NULL,
  `Login` timestamp(2) NULL DEFAULT NULL,
  `Logout` timestamp(2) NULL DEFAULT NULL,
  `Cant_Login` int NOT NULL,
  `idUser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Login`
--

INSERT INTO `Login` (`idLogin`, `Login`, `Logout`, `Cant_Login`, `idUser`) VALUES
(1, '2019-06-04 00:00:00.00', '2019-06-04 00:23:54.00', 3, 1),
(2, '2019-06-04 00:00:00.00', '2019-06-04 00:15:20.00', 5, 2),
(3, '2019-06-04 00:00:00.00', '2019-06-04 00:08:30.00', 9, 3),
(4, '2019-06-04 00:00:00.00', '2019-06-04 00:32:43.00', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Playlists`
--

CREATE TABLE `Playlists` (
  `idPlaylist` int NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `idUser` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Playlists`
--

INSERT INTO `Playlists` (`idPlaylist`, `nombre`, `idUser`) VALUES
(1, 'FAVORITOS', 1),
(2, 'DORMIR', 4),
(3, 'REIR', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_cancion`
--

CREATE TABLE `playlist_cancion` (
  `idPlaylist` int NOT NULL,
  `idCancion` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `playlist_cancion`
--

INSERT INTO `playlist_cancion` (`idPlaylist`, `idCancion`) VALUES
(1, 3),
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reproduced`
--

CREATE TABLE `Reproduced` (
  `idCancion` int NOT NULL,
  `idUser` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Reproduced`
--

INSERT INTO `Reproduced` (`idCancion`, `idUser`) VALUES
(1, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE `User` (
  `idUser` int NOT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `contraseña` varchar(20) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `idclass` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`idUser`, `usuario`, `nombre`, `correo`, `contraseña`, `fecha_nac`, `idclass`) VALUES
(1, 'aboteman0', 'Abe', 'acunniffe0@list-manage.com', 'NXYK7utMZ4', '1991-12-20', 3),
(2, 'fharuard1', 'Fernando', 'fmckenzie1@reverbnation.com', 'XsjKHTX8L5', '2004-10-23', 1),
(3, 'wmatyushonok2', 'Wileen', 'wbraban2@bing.com', 'vXtSvNWoH', '1997-12-30', 2),
(4, 'lbaysting3', 'Leslie', 'ldemeis3@narod.ru', 'HJK9CDQk4', '1993-06-06', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User_class`
--

CREATE TABLE `User_class` (
  `idclass` int NOT NULL,
  `Uclass` varchar(50) DEFAULT NULL,
  `fecha_creacion` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `User_class`
--

INSERT INTO `User_class` (`idclass`, `Uclass`, `fecha_creacion`) VALUES
(1, 'FREE', 2019),
(2, 'PREMMIUM', 2019),
(3, 'FAMILY', 2019);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `VISTA_CANCIONES`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `VISTA_CANCIONES` (
`Cancion` varchar(50)
,`Albumes` varchar(50)
,`Artista` varchar(50)
,`Reproducciones_Escuchadas` bigint
,`Reproducciones_usuarios_diferentes` bigint
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `VISTA_INFO_CUENTA`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `VISTA_INFO_CUENTA` (
`Usuario` varchar(50)
,`Nombre` varchar(50)
,`Tipo_Cuenta` varchar(50)
,`FECHA_CREACION_CUENTA` year
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `VISTA_USUARIOS`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `VISTA_USUARIOS` (
`Ultimo_Ingreso` timestamp(2)
,`Usuario` varchar(50)
,`Ingresos_Totales` int
);

-- --------------------------------------------------------

--
-- Estructura para la vista `VISTA_CANCIONES`
--
DROP TABLE IF EXISTS `VISTA_CANCIONES`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VISTA_CANCIONES`  AS  select `Cancion`.`title` AS `Cancion`,`Albumes`.`title` AS `Albumes`,`Artista`.`nombre` AS `Artista`,count(`Reproduced`.`idCancion`) AS `Reproducciones_Escuchadas`,count(distinct `Reproduced`.`idUser`) AS `Reproducciones_usuarios_diferentes` from ((((`Cancion` join `Reproduced`) join `Albumes`) join `Artista`) join `User`) where ((`Artista`.`idArtista` = `Albumes`.`idArtista`) and (`Albumes`.`idAlbum` = `Cancion`.`idAlbum`) and (`Cancion`.`idCancion` = `Reproduced`.`idCancion`) and (`User`.`idUser` = `Reproduced`.`idUser`)) group by `Reproduced`.`idCancion` order by `Reproducciones_Escuchadas` desc ;

-- --------------------------------------------------------

--
-- Estructura para la vista `VISTA_INFO_CUENTA`
--
DROP TABLE IF EXISTS `VISTA_INFO_CUENTA`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VISTA_INFO_CUENTA`  AS  select `User`.`usuario` AS `Usuario`,`User`.`nombre` AS `Nombre`,`User_class`.`Uclass` AS `Tipo_Cuenta`,`User_class`.`fecha_creacion` AS `FECHA_CREACION_CUENTA` from (`User` join `User_class`) where (`User_class`.`idclass` = `User`.`idclass`) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `VISTA_USUARIOS`
--
DROP TABLE IF EXISTS `VISTA_USUARIOS`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VISTA_USUARIOS`  AS  select `Login`.`Logout` AS `Ultimo_Ingreso`,`User`.`usuario` AS `Usuario`,`Login`.`Cant_Login` AS `Ingresos_Totales` from (`User` join `Login`) where (`User`.`idUser` = `Login`.`idUser`) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Albumes`
--
ALTER TABLE `Albumes`
  ADD PRIMARY KEY (`idAlbum`),
  ADD KEY `idArtista_idx` (`idArtista`);

--
-- Indices de la tabla `Artista`
--
ALTER TABLE `Artista`
  ADD PRIMARY KEY (`idArtista`);

--
-- Indices de la tabla `Cancion`
--
ALTER TABLE `Cancion`
  ADD PRIMARY KEY (`idCancion`),
  ADD KEY `idGenero_idx` (`idGenero`),
  ADD KEY `idAlbum_idx` (`idAlbum`);

--
-- Indices de la tabla `Cancion_fav`
--
ALTER TABLE `Cancion_fav`
  ADD PRIMARY KEY (`idFav`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Indices de la tabla `Generos`
--
ALTER TABLE `Generos`
  ADD PRIMARY KEY (`idGenero`);

--
-- Indices de la tabla `Lista_Fav`
--
ALTER TABLE `Lista_Fav`
  ADD PRIMARY KEY (`idCancion`,`idFav`),
  ADD KEY `idFav_idx` (`idFav`);

--
-- Indices de la tabla `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`idLogin`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Indices de la tabla `Playlists`
--
ALTER TABLE `Playlists`
  ADD PRIMARY KEY (`idPlaylist`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Indices de la tabla `playlist_cancion`
--
ALTER TABLE `playlist_cancion`
  ADD PRIMARY KEY (`idCancion`,`idPlaylist`),
  ADD KEY `idPlaylist` (`idPlaylist`),
  ADD KEY `idCancion_idx` (`idCancion`);

--
-- Indices de la tabla `Reproduced`
--
ALTER TABLE `Reproduced`
  ADD PRIMARY KEY (`idCancion`,`idUser`),
  ADD KEY `idUser_idx` (`idUser`);

--
-- Indices de la tabla `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `idclass_idx` (`idclass`);

--
-- Indices de la tabla `User_class`
--
ALTER TABLE `User_class`
  ADD PRIMARY KEY (`idclass`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Albumes`
--
ALTER TABLE `Albumes`
  ADD CONSTRAINT `Albumes_ibfk_1` FOREIGN KEY (`idArtista`) REFERENCES `Artista` (`idArtista`);

--
-- Filtros para la tabla `Cancion`
--
ALTER TABLE `Cancion`
  ADD CONSTRAINT `Cancion_ibfk_1` FOREIGN KEY (`idAlbum`) REFERENCES `Albumes` (`idAlbum`),
  ADD CONSTRAINT `Cancion_ibfk_2` FOREIGN KEY (`idGenero`) REFERENCES `Generos` (`idGenero`);

--
-- Filtros para la tabla `Cancion_fav`
--
ALTER TABLE `Cancion_fav`
  ADD CONSTRAINT `Cancion_fav_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`);

--
-- Filtros para la tabla `Lista_Fav`
--
ALTER TABLE `Lista_Fav`
  ADD CONSTRAINT `Lista_Fav_ibfk_1` FOREIGN KEY (`idCancion`) REFERENCES `Cancion` (`idCancion`),
  ADD CONSTRAINT `Lista_Fav_ibfk_2` FOREIGN KEY (`idFav`) REFERENCES `Cancion_fav` (`idFav`);

--
-- Filtros para la tabla `Login`
--
ALTER TABLE `Login`
  ADD CONSTRAINT `Login_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`);

--
-- Filtros para la tabla `Playlists`
--
ALTER TABLE `Playlists`
  ADD CONSTRAINT `Playlists_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`);

--
-- Filtros para la tabla `playlist_cancion`
--
ALTER TABLE `playlist_cancion`
  ADD CONSTRAINT `playlist_cancion_ibfk_1` FOREIGN KEY (`idPlaylist`) REFERENCES `Playlists` (`idPlaylist`),
  ADD CONSTRAINT `playlist_cancion_ibfk_2` FOREIGN KEY (`idCancion`) REFERENCES `Cancion` (`idCancion`);

--
-- Filtros para la tabla `Reproduced`
--
ALTER TABLE `Reproduced`
  ADD CONSTRAINT `Reproduced_ibfk_1` FOREIGN KEY (`idCancion`) REFERENCES `Cancion` (`idCancion`),
  ADD CONSTRAINT `Reproduced_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `User` (`idUser`);

--
-- Filtros para la tabla `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `User_ibfk_1` FOREIGN KEY (`idclass`) REFERENCES `User_class` (`idclass`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
