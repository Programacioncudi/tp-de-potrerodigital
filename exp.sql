-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.39 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para nuevaesperanza
CREATE DATABASE IF NOT EXISTS `nuevaesperanza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nuevaesperanza`;

-- Volcando estructura para tabla nuevaesperanza.carrito
CREATE TABLE IF NOT EXISTS `carrito` (
  `id_carrito` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `total` int NOT NULL,
  `fecha_agregado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.carrito: ~7 rows (aproximadamente)
DELETE FROM `carrito`;
INSERT INTO `carrito` (`id_carrito`, `id_usuario`, `id_producto`, `cantidad`, `total`, `fecha_agregado`) VALUES
	(1, 4, 2, 2, 6000, '2024-12-15 16:34:36'),
	(2, 4, 2, 4, 12000, '2024-12-15 16:37:42'),
	(3, 4, 2, 2, 6000, '2024-12-15 16:40:50'),
	(4, 4, 2, 2, 6000, '2024-12-15 16:53:18'),
	(5, 4, 2, 5, 15000, '2024-12-15 16:55:03'),
	(6, 4, 2, 4, 12000, '2024-12-15 17:00:54'),
	(7, 4, 1, 4, 12000, '2024-12-17 23:00:36');

-- Volcando estructura para tabla nuevaesperanza.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.categorias: ~5 rows (aproximadamente)
DELETE FROM `categorias`;
INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
	(1, 'lácteos', 'lacteos'),
	(2, 'verduras y frutas', 'granja'),
	(3, 'Bebidas', 'aguas '),
	(4, 'panadería', 'panificados'),
	(5, 'varios', 'electronica');

-- Volcando estructura para tabla nuevaesperanza.comentarios
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id_comentario` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_usuario` int NOT NULL,
  `comentario` text NOT NULL,
  `calificacion` int DEFAULT NULL,
  `fecha_comentario` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comentario`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `comentarios_chk_1` CHECK ((`calificacion` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.comentarios: ~0 rows (aproximadamente)
DELETE FROM `comentarios`;

-- Volcando estructura para tabla nuevaesperanza.contacto
CREATE TABLE IF NOT EXISTS `contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.contacto: ~32 rows (aproximadamente)
DELETE FROM `contacto`;
INSERT INTO `contacto` (`id`, `nombre`, `email`, `mensaje`, `fecha`) VALUES
	(1, 'a', 'alejan4drdqjadvi822e2rpetyveri@gmail.com', 'ERERER', '2024-12-07 00:10:46'),
	(2, '3338222d2dq4', 'alejan4drdqjadvi822e2rpetyveri@gmail.com', 'CZXVVCXCX', '2024-12-07 00:44:25'),
	(3, '3338222d2dq4', 'alejan4drdqjadvi822e2rpetyveri@gmail.com', 'CZXVVCXCX', '2024-12-07 00:58:41'),
	(4, '3338222d2dq4', 'alejan4drdqjadvi822e2rpetyveri@gmail.com', 'CZXVVCXCX', '2024-12-07 01:02:22'),
	(5, '3338222d2dq4', 'alejan4drdqjadvi822e2rpetyveri@gmail.com', 'CZXVVCXCX', '2024-12-07 01:02:24'),
	(6, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'rrr', '2024-12-07 22:15:23'),
	(7, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'rrr', '2024-12-07 22:20:00'),
	(8, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'sddffsfsdf', '2024-12-07 22:20:40'),
	(9, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'DDDDDDDDDD', '2024-12-07 22:23:46'),
	(10, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'DDDDDDDDDD', '2024-12-07 22:24:15'),
	(11, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'SDSSSSSSSSSSS', '2024-12-07 22:28:03'),
	(12, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'DSSFDFDSF', '2024-12-07 22:44:52'),
	(13, 'Alejandro Peveri', 'fox1234567890@hotmail.com', 'SDADASDASD', '2024-12-07 22:59:03'),
	(14, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'dsffdsfdsf', '2024-12-08 16:01:23'),
	(15, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'sdsadasd', '2024-12-08 16:12:40'),
	(16, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'gfhgfhfgh', '2024-12-08 16:19:35'),
	(17, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'fsfsdfsdf', '2024-12-08 16:37:29'),
	(18, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'dsfsdfsdf', '2024-12-08 19:29:08'),
	(19, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'sdsd', '2024-12-08 19:42:54'),
	(20, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'sdsd', '2024-12-08 19:59:26'),
	(21, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'cxzczxc', '2024-12-08 20:01:44'),
	(22, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'illtul', '2024-12-08 20:02:58'),
	(23, 'Alejandro Peveri', 'alejandrojavierpeveri@gmail.com', 'illtul', '2024-12-08 20:03:09'),
	(24, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'zgzddg', '2024-12-08 20:12:30'),
	(25, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'jytyjytj', '2024-12-08 20:16:26'),
	(26, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'jytyjytj', '2024-12-08 20:16:32'),
	(27, 'Alejandro', 'fox1234567890@hotmail.com', 'thtrhrh', '2024-12-08 20:37:14'),
	(28, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'utuytuyt', '2024-12-08 20:39:18'),
	(29, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'utuytuyt', '2024-12-08 20:41:25'),
	(30, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'utuytuyt', '2024-12-08 20:41:35'),
	(31, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'utuytuyt', '2024-12-08 20:42:21'),
	(32, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'vhjkhjkh', '2024-12-08 20:42:43'),
	(33, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'fghfh', '2024-12-08 20:53:21'),
	(34, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'fghfh', '2024-12-08 20:53:22'),
	(35, 'Alejandro', 'alejandrojavierpeveri@gmail.com', 'hjkhjkjh', '2024-12-11 18:42:16');

-- Volcando estructura para tabla nuevaesperanza.detalles_pedido
CREATE TABLE IF NOT EXISTS `detalles_pedido` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_pedido` (`id_pedido`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.detalles_pedido: ~0 rows (aproximadamente)
DELETE FROM `detalles_pedido`;

-- Volcando estructura para tabla nuevaesperanza.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `fecha_pago` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.pagos: ~0 rows (aproximadamente)
DELETE FROM `pagos`;

-- Volcando estructura para tabla nuevaesperanza.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `fecha_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(50) DEFAULT 'pendiente',
  PRIMARY KEY (`id_pedido`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.pedidos: ~0 rows (aproximadamente)
DELETE FROM `pedidos`;

-- Volcando estructura para tabla nuevaesperanza.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categoria` int DEFAULT NULL,
  `enpromocion` int DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.productos: ~14 rows (aproximadamente)
DELETE FROM `productos`;
INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`, `fecha_creacion`, `id_categoria`, `enpromocion`, `foto`) VALUES
	(1, 'manteca catalina', 'manteca', 3000.00, 146, 'lácteos', '2024-12-04 00:27:52', 1, 1, 'manteca.jpg'),
	(2, 'aji', 'colorado', 3000.00, 496, 'verduras y frutas', '2024-12-04 00:29:24', 2, 1, 'aji.jpg'),
	(3, 'agua saborizada', 'marca ddddd', 150.00, 1000, 'bebidas', '2024-12-04 00:30:16', 3, 1, 'beb.jpg'),
	(4, 'pan dulce ', 'don satur', 11110.00, 1499, 'panadería', '2024-12-04 00:31:25', 4, 1, 'pandulce.jpg'),
	(5, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(6, 'alcohol', '1', 11111.00, 1, 'varios', '2024-12-04 01:11:30', 1, 1, 'beb.jpg'),
	(7, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(8, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(9, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(10, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(11, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(12, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(13, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg'),
	(14, 'tv', 'rca', 150000.00, 100, 'varios', '2024-12-04 00:32:00', 5, 1, 'tvrca.jpg');

-- Volcando estructura para tabla nuevaesperanza.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tipousuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla nuevaesperanza.usuarios: ~1 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `direccion`, `telefono`, `fecha_creacion`, `tipousuario`) VALUES
	(3, 'Alejandro Ja3vier ', 'alejandro3javierpeveri@gmail.com', '$2y$10$DXFfJEm0vZO47SlfRCDQEuEhvYdrn9dKRSkWhJWo7A.mAa.KmvXpK', 'Jacobo W1att 3262', '011617245155', '2024-12-03 20:36:55', 'deshabilitado'),
	(4, 'Alejandro Javier', 'alejandrojavierpeveri@gmail.com', '$2y$10$inL6Leu3MSIlD.Xa4TZjReFve.VPaMFsPYWdvFdqptM8Nb.fk5jva', 'Jacobo Watt 3262', '01161724555', '2024-12-08 22:08:58', 'admin');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
