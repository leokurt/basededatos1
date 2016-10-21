-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2016 a las 03:48:55
-- Versión del servidor: 5.6.25
-- Versión de PHP: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletas`
--

CREATE TABLE IF NOT EXISTS `boletas` (
  `numero_boleta` int(10) unsigned NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  `Oficina_venta` mediumtext,
  `ganadores_idganadores` int(10) unsigned NOT NULL,
  `premios_idpremios1` int(10) unsigned NOT NULL,
  `sorteos_idsorteos` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `idclientes` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31758964 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idclientes`, `nombre`, `telefono`, `direccion`, `email`) VALUES
(26874952, 'estefani salazar', '3154857692', 'carrera 24 c', 'laestefa@gmail.com'),
(31758963, 'yasuri rodriguez', '3224753685', 'calle 25 ', 'yasu@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_has_boletas`
--

CREATE TABLE IF NOT EXISTS `clientes_has_boletas` (
  `clientes_idclientes` int(11) NOT NULL,
  `boletas_numero_boleta` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganadores`
--

CREATE TABLE IF NOT EXISTS `ganadores` (
  `idganadores` int(10) unsigned NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `premio` mediumtext,
  `numero_boleta` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `premios_idpremios` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas`
--

CREATE TABLE IF NOT EXISTS `oficinas` (
  `idoficinas` int(11) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `ventas` varchar(45) DEFAULT NULL,
  `vendedores_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas_has_boletas`
--

CREATE TABLE IF NOT EXISTS `oficinas_has_boletas` (
  `oficinas_idoficinas` int(11) NOT NULL,
  `oficinas_vendedores_id` int(11) NOT NULL,
  `boletas_numero_boleta` int(10) unsigned NOT NULL,
  `boletas_ganadores_idganadores` int(10) unsigned NOT NULL,
  `boletas_premios_idpremios1` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficinas_has_ventas`
--

CREATE TABLE IF NOT EXISTS `oficinas_has_ventas` (
  `oficinas_idoficinas` int(11) NOT NULL,
  `oficinas_vendedores_id` int(11) NOT NULL,
  `ventas_idventas` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

CREATE TABLE IF NOT EXISTS `premios` (
  `idpremios` int(10) unsigned NOT NULL,
  `valor_premio` float DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `ganador` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios_has_proveedores`
--

CREATE TABLE IF NOT EXISTS `premios_has_proveedores` (
  `premios_idpremios` int(10) unsigned NOT NULL,
  `proveedores_idprovedores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `idprovedores` int(11) NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `articulo_que_provee` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sorteos`
--

CREATE TABLE IF NOT EXISTS `sorteos` (
  `idsorteos` int(10) unsigned NOT NULL,
  `premio` mediumtext,
  `ganador` varchar(45) DEFAULT NULL,
  `fecha_sorteo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sorteos`
--

INSERT INTO `sorteos` (`idsorteos`, `premio`, `ganador`, `fecha_sorteo`) VALUES
(1, '1000000', 'estefani salazar', 'mydb');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombre_completo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direcccion` varchar(45) DEFAULT NULL,
  `oficinas_idoficinas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE IF NOT EXISTS `vendedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id`, `nombre`, `direccion`, `email`, `contraseña`, `fecha_nacimiento`) VALUES
(1, 'la yurani ', 'calle 45', 'layura@gmail.com', '123456', '2006-04-11'),
(2, 'la maryu', 'calle 36', 'lamaryu@gmail.com', '123456', '2016-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores_has_boletas`
--

CREATE TABLE IF NOT EXISTS `vendedores_has_boletas` (
  `vendedores_id` int(11) NOT NULL,
  `boletas_numero_boleta` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores_has_clientes`
--

CREATE TABLE IF NOT EXISTS `vendedores_has_clientes` (
  `vendedores_id` int(11) NOT NULL,
  `clientes_idclientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores_has_usuarios`
--

CREATE TABLE IF NOT EXISTS `vendedores_has_usuarios` (
  `vendedores_id` int(11) NOT NULL,
  `usuarios_idusuarios` int(11) NOT NULL,
  `usuarios_oficinas_idoficinas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores_has_ventas`
--

CREATE TABLE IF NOT EXISTS `vendedores_has_ventas` (
  `vendedores_id` int(11) NOT NULL,
  `ventas_idventas` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `idventas` int(10) unsigned NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idventas`, `fecha`) VALUES
(1, '2016-10-10');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletas`
--
ALTER TABLE `boletas`
  ADD PRIMARY KEY (`numero_boleta`,`ganadores_idganadores`,`premios_idpremios1`,`sorteos_idsorteos`),
  ADD KEY `fk_boletas_ganadores1_idx` (`ganadores_idganadores`),
  ADD KEY `fk_boletas_premios1_idx` (`premios_idpremios1`),
  ADD KEY `fk_boletas_sorteos1_idx` (`sorteos_idsorteos`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idclientes`);

--
-- Indices de la tabla `clientes_has_boletas`
--
ALTER TABLE `clientes_has_boletas`
  ADD PRIMARY KEY (`clientes_idclientes`,`boletas_numero_boleta`),
  ADD KEY `fk_clientes_has_boletas_boletas1_idx` (`boletas_numero_boleta`),
  ADD KEY `fk_clientes_has_boletas_clientes1_idx` (`clientes_idclientes`);

--
-- Indices de la tabla `ganadores`
--
ALTER TABLE `ganadores`
  ADD PRIMARY KEY (`idganadores`,`numero_boleta`,`premios_idpremios`),
  ADD KEY `fk_ganadores_premios1_idx` (`premios_idpremios`);

--
-- Indices de la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD PRIMARY KEY (`idoficinas`,`vendedores_id`),
  ADD KEY `fk_oficinas_vendedores1_idx` (`vendedores_id`);

--
-- Indices de la tabla `oficinas_has_boletas`
--
ALTER TABLE `oficinas_has_boletas`
  ADD PRIMARY KEY (`oficinas_idoficinas`,`oficinas_vendedores_id`,`boletas_numero_boleta`,`boletas_ganadores_idganadores`,`boletas_premios_idpremios1`),
  ADD KEY `fk_oficinas_has_boletas_boletas1_idx` (`boletas_numero_boleta`,`boletas_ganadores_idganadores`,`boletas_premios_idpremios1`),
  ADD KEY `fk_oficinas_has_boletas_oficinas1_idx` (`oficinas_idoficinas`,`oficinas_vendedores_id`);

--
-- Indices de la tabla `oficinas_has_ventas`
--
ALTER TABLE `oficinas_has_ventas`
  ADD PRIMARY KEY (`oficinas_idoficinas`,`oficinas_vendedores_id`,`ventas_idventas`),
  ADD KEY `fk_oficinas_has_ventas_ventas1_idx` (`ventas_idventas`),
  ADD KEY `fk_oficinas_has_ventas_oficinas1_idx` (`oficinas_idoficinas`,`oficinas_vendedores_id`);

--
-- Indices de la tabla `premios`
--
ALTER TABLE `premios`
  ADD PRIMARY KEY (`idpremios`);

--
-- Indices de la tabla `premios_has_proveedores`
--
ALTER TABLE `premios_has_proveedores`
  ADD PRIMARY KEY (`premios_idpremios`,`proveedores_idprovedores`),
  ADD KEY `fk_premios_has_proveedores_proveedores1_idx` (`proveedores_idprovedores`),
  ADD KEY `fk_premios_has_proveedores_premios1_idx` (`premios_idpremios`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idprovedores`);

--
-- Indices de la tabla `sorteos`
--
ALTER TABLE `sorteos`
  ADD PRIMARY KEY (`idsorteos`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`,`oficinas_idoficinas`),
  ADD KEY `fk_usuarios_oficinas1_idx` (`oficinas_idoficinas`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `vendedores_has_boletas`
--
ALTER TABLE `vendedores_has_boletas`
  ADD PRIMARY KEY (`vendedores_id`,`boletas_numero_boleta`),
  ADD KEY `fk_vendedores_has_boletas_boletas1_idx` (`boletas_numero_boleta`),
  ADD KEY `fk_vendedores_has_boletas_vendedores1_idx` (`vendedores_id`);

--
-- Indices de la tabla `vendedores_has_clientes`
--
ALTER TABLE `vendedores_has_clientes`
  ADD PRIMARY KEY (`vendedores_id`,`clientes_idclientes`),
  ADD KEY `fk_vendedores_has_clientes_clientes1_idx` (`clientes_idclientes`),
  ADD KEY `fk_vendedores_has_clientes_vendedores1_idx` (`vendedores_id`);

--
-- Indices de la tabla `vendedores_has_usuarios`
--
ALTER TABLE `vendedores_has_usuarios`
  ADD PRIMARY KEY (`vendedores_id`,`usuarios_idusuarios`,`usuarios_oficinas_idoficinas`),
  ADD KEY `fk_vendedores_has_usuarios_usuarios1_idx` (`usuarios_idusuarios`,`usuarios_oficinas_idoficinas`),
  ADD KEY `fk_vendedores_has_usuarios_vendedores1_idx` (`vendedores_id`);

--
-- Indices de la tabla `vendedores_has_ventas`
--
ALTER TABLE `vendedores_has_ventas`
  ADD PRIMARY KEY (`vendedores_id`,`ventas_idventas`),
  ADD KEY `fk_vendedores_has_ventas_ventas1_idx` (`ventas_idventas`),
  ADD KEY `fk_vendedores_has_ventas_vendedores1_idx` (`vendedores_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idventas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletas`
--
ALTER TABLE `boletas`
  MODIFY `numero_boleta` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idclientes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31758964;
--
-- AUTO_INCREMENT de la tabla `ganadores`
--
ALTER TABLE `ganadores`
  MODIFY `idganadores` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `premios`
--
ALTER TABLE `premios`
  MODIFY `idpremios` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `sorteos`
--
ALTER TABLE `sorteos`
  MODIFY `idsorteos` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idventas` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletas`
--
ALTER TABLE `boletas`
  ADD CONSTRAINT `fk_boletas_ganadores1` FOREIGN KEY (`ganadores_idganadores`) REFERENCES `ganadores` (`idganadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletas_premios1` FOREIGN KEY (`premios_idpremios1`) REFERENCES `premios` (`idpremios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_boletas_sorteos1` FOREIGN KEY (`sorteos_idsorteos`) REFERENCES `sorteos` (`idsorteos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes_has_boletas`
--
ALTER TABLE `clientes_has_boletas`
  ADD CONSTRAINT `fk_clientes_has_boletas_boletas1` FOREIGN KEY (`boletas_numero_boleta`) REFERENCES `boletas` (`numero_boleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_has_boletas_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ganadores`
--
ALTER TABLE `ganadores`
  ADD CONSTRAINT `fk_ganadores_premios1` FOREIGN KEY (`premios_idpremios`) REFERENCES `premios` (`idpremios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oficinas`
--
ALTER TABLE `oficinas`
  ADD CONSTRAINT `fk_oficinas_vendedores1` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oficinas_has_boletas`
--
ALTER TABLE `oficinas_has_boletas`
  ADD CONSTRAINT `fk_oficinas_has_boletas_boletas1` FOREIGN KEY (`boletas_numero_boleta`, `boletas_ganadores_idganadores`, `boletas_premios_idpremios1`) REFERENCES `boletas` (`numero_boleta`, `ganadores_idganadores`, `premios_idpremios1`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_oficinas_has_boletas_oficinas1` FOREIGN KEY (`oficinas_idoficinas`, `oficinas_vendedores_id`) REFERENCES `oficinas` (`idoficinas`, `vendedores_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `oficinas_has_ventas`
--
ALTER TABLE `oficinas_has_ventas`
  ADD CONSTRAINT `fk_oficinas_has_ventas_oficinas1` FOREIGN KEY (`oficinas_idoficinas`, `oficinas_vendedores_id`) REFERENCES `oficinas` (`idoficinas`, `vendedores_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_oficinas_has_ventas_ventas1` FOREIGN KEY (`ventas_idventas`) REFERENCES `ventas` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `premios_has_proveedores`
--
ALTER TABLE `premios_has_proveedores`
  ADD CONSTRAINT `fk_premios_has_proveedores_premios1` FOREIGN KEY (`premios_idpremios`) REFERENCES `premios` (`idpremios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_premios_has_proveedores_proveedores1` FOREIGN KEY (`proveedores_idprovedores`) REFERENCES `proveedores` (`idprovedores`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_oficinas1` FOREIGN KEY (`oficinas_idoficinas`) REFERENCES `oficinas` (`idoficinas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vendedores_has_boletas`
--
ALTER TABLE `vendedores_has_boletas`
  ADD CONSTRAINT `fk_vendedores_has_boletas_boletas1` FOREIGN KEY (`boletas_numero_boleta`) REFERENCES `boletas` (`numero_boleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedores_has_boletas_vendedores1` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vendedores_has_clientes`
--
ALTER TABLE `vendedores_has_clientes`
  ADD CONSTRAINT `fk_vendedores_has_clientes_clientes1` FOREIGN KEY (`clientes_idclientes`) REFERENCES `clientes` (`idclientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedores_has_clientes_vendedores1` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vendedores_has_usuarios`
--
ALTER TABLE `vendedores_has_usuarios`
  ADD CONSTRAINT `fk_vendedores_has_usuarios_usuarios1` FOREIGN KEY (`usuarios_idusuarios`, `usuarios_oficinas_idoficinas`) REFERENCES `usuarios` (`idusuarios`, `oficinas_idoficinas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedores_has_usuarios_vendedores1` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vendedores_has_ventas`
--
ALTER TABLE `vendedores_has_ventas`
  ADD CONSTRAINT `fk_vendedores_has_ventas_vendedores1` FOREIGN KEY (`vendedores_id`) REFERENCES `vendedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendedores_has_ventas_ventas1` FOREIGN KEY (`ventas_idventas`) REFERENCES `ventas` (`idventas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
