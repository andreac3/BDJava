-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-07-2020 a las 16:57:43
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database_links`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(8) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `contraseña` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `nombre`, `direccion`, `telefono`, `contraseña`) VALUES
(1001, 'Bernardo', NULL, 305, 9876),
(1234, 'SYS', NULL, NULL, 1234);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbero`
--

CREATE TABLE `barbero` (
  `id` int(8) NOT NULL,
  `nombre` varchar(10) NOT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` int(10) NOT NULL,
  `maquinaAsignada` int(2) NOT NULL,
  `porcentajeComision` int(2) NOT NULL,
  `contraseña` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `barbero`
--

INSERT INTO `barbero` (`id`, `nombre`, `direccion`, `telefono`, `maquinaAsignada`, `porcentajeComision`, `contraseña`) VALUES
(1, 'Yeison', NULL, 2, 1, 15, 6746),
(2209, 'Juan', NULL, 321, 1, 2, 7645),
(4564, 'Alex', 'Cr 45 99-01', 316, 3, 3, 909),
(5678, 'Anderson', 'Cll 34 20-60', 312, 2, 5, 4467);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(21, 'Pablo', NULL, 320),
(2345, 'Juan', 'Cll 48 79-1', 321),
(4564, 'Stiven', NULL, 316),
(5678, 'Camilo', 'Cl 48 79 - 23', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte`
--

CREATE TABLE `corte` (
  `precio` int(5) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigo` int(8) NOT NULL,
  `productoObligatorio1` int(8) NOT NULL,
  `productoObligatorio2` int(8) NOT NULL,
  `extras` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `corte`
--

INSERT INTO `corte` (`precio`, `nombre`, `codigo`, `productoObligatorio1`, `productoObligatorio2`, `extras`) VALUES
(8000, 'Calvo', 1, 1, 2, NULL),
(10000, 'Degradado', 2, 1, 2, NULL),
(15000, 'Crew', 3, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `codigoProducto` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `codigoProveedor` int(8) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `costo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`codigoProducto`, `nombre`, `codigoProveedor`, `cantidad`, `costo`) VALUES
(1, 'Cuchillas', 3456, 100, 200),
(2, 'Toalla cuello', 3019, 200, 100),
(3, 'Gomina', 3409, 15, 900),
(4, 'Tinte negro', 3409, 10, 8500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `nombre`) VALUES
(1, 'Cuchillas'),
(2, 'Toalla cuello'),
(3, 'Gomina'),
(4, 'Tinte negro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(8) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `direccion` varchar(20) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id`, `nombre`, `direccion`, `telefono`) VALUES
(3019, 'Aseo y desinfeccion ', 'Cl 60 #56-70', 1234556),
(3409, 'Soluciones Barberia ', NULL, 23335590),
(3456, 'Maquinas y cuchillas', 'Cl 30sur # 50-25', 46900334),
(6712, 'Muebleria la 80', NULL, 3214562);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(8) NOT NULL,
  `idCorte` int(8) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idCliente` int(8) NOT NULL,
  `idBarbero` int(8) NOT NULL,
  `costo` int(8) NOT NULL,
  `propina` int(8) NOT NULL,
  `porcentajeComision` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id`, `idCorte`, `fecha`, `idCliente`, `idBarbero`, `costo`, `propina`, `porcentajeComision`) VALUES
(1, 1, '2020-07-19 17:14:00', 21, 2209, 15000, 3000, 2),
(2, 2, '2020-07-19 19:14:07', 5678, 1, 10000, 0, 5),
(3, 3, '2020-07-19 23:07:30', 4564, 4564, 8000, 0, 3),
(4, 3, '2020-07-20 00:14:07', 2345, 5678, 8000, 1000, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `barbero`
--
ALTER TABLE `barbero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `corte`
--
ALTER TABLE `corte`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`codigoProducto`),
  ADD KEY `codigoProveedor` (`codigoProveedor`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBarbero` (`idBarbero`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idCorte` (`idCorte`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`codigoProveedor`) REFERENCES `proveedor` (`id`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`codigoProducto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `idBarbero` FOREIGN KEY (`idBarbero`) REFERENCES `barbero` (`id`),
  ADD CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `idCorte` FOREIGN KEY (`idCorte`) REFERENCES `corte` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
