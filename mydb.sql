-- MySQL Workbench Forward Engineering

-- Desactivar comprobaciones temporales de clave única y clave foránea
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- Establecer el modo SQL a un valor adecuado
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
  
);

-- Insertar registros de prueba en la tabla de Usuarios
INSERT INTO `mydb`.`user` (`id`, `username`, `email`, `password`, `create_time`) VALUES
(1, 'Usuario1', 'usuario1@example.com', 'contraseña1', NOW()),
(2, 'Usuario2', 'usuario2@example.com', 'contraseña2', NOW()),
(3, 'Usuario3', 'usuario3@example.com', 'contraseña3', NOW()),
(4, 'Usuario4', 'usuario4@example.com', 'contraseña4', NOW()),
(5, 'Usuario5', 'usuario5@example.com', 'contraseña5', NOW()),
(6, 'Usuario6', 'usuario6@example.com', 'contraseña6', NOW()),
(7, 'Usuario7', 'usuario7@example.com', 'contraseña7', NOW()),
(8, 'Usuario8', 'usuario8@example.com', 'contraseña8', NOW()),
(9, 'Usuario9', 'usuario9@example.com', 'contraseña9', NOW()),
(10, 'Usuario10', 'usuario10@example.com', 'contraseña10', NOW());


-- -----------------------------------------------------
-- Table `mydb`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`notas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `fecha_modificacion` DATETIME NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  `puede_eliminar` TINYINT NOT NULL,
  `usuario_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_user_idx` (`usuario_id` ASC) VISIBLE,
  UNIQUE INDEX `titulo_UNIQUE` (`titulo` ASC) VISIBLE,
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_notas_user`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
-- Insertar registros de prueba en la tabla de Notas
INSERT INTO `mydb`.`notas` (`id`, `titulo`, `fecha_creacion`, `fecha_modificacion`, `descripcion`, `puede_eliminar`, `usuario_id`) VALUES
(1, 'Nota 1', NOW(), NOW(), 'Esta es la nota 1', 1, 1),
(2, 'Nota 2', NOW(), NOW(), 'Esta es la nota 2', 1, 2),
(3, 'Nota 3', NOW(), NOW(), 'Esta es la nota 3', 1, 3),
(4, 'Nota 4', NOW(), NOW(), 'Esta es la nota 4', 1, 4),
(5, 'Nota 5', NOW(), NOW(), 'Esta es la nota 5', 1, 5),
(6, 'Nota 6', NOW(), NOW(), 'Esta es la nota 6', 1, 6),
(7, 'Nota 7', NOW(), NOW(), 'Esta es la nota 7', 1, 7),
(8, 'Nota 8', NOW(), NOW(), 'Esta es la nota 8', 1, 8),
(9, 'Nota 9', NOW(), NOW(), 'Esta es la nota 9', 1, 9),
(10, 'Nota 10', NOW(), NOW(), 'Esta es la nota 10', 1, 10);


-- -----------------------------------------------------
-- Table `mydb`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_categoria_UNIQUE` (`nombre_categoria` ASC) VISIBLE
);

-- Insertar registros de prueba en la tabla de Categorías
INSERT INTO `mydb`.`categorias` (`id`, `nombre_categoria`) VALUES
(1, 'Categoría 1'),
(2, 'Categoría 2'),
(3, 'Categoría 3'),
(4, 'Categoría 4'),
(5, 'Categoría 5');


-- -----------------------------------------------------
-- Table `mydb`.`tabla_asociacion_notas_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tabla_asociacion_notas_categorias` (
  `id` INT NOT NULL,
  `nota_id` INT NULL,
  `categoria_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_asociacion_notas_idx` (`nota_id` ASC) VISIBLE,
  INDEX `fk_asociacion_categorias_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_asociacion_notas`
    FOREIGN KEY (`nota_id`)
    REFERENCES `mydb`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_asociacion_categorias`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `mydb`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Insertar registros de prueba en la tabla de Asociación entre Notas y Categorías
INSERT INTO `mydb`.`tabla_asociacion_notas_categorias` (`id`, `nota_id`, `categoria_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 2),
(5, 3, 3),
(6, 4, 3),
(7, 4, 4),
(8, 5, 4),
(9, 5, 5),
(10, 1, 5);

-- Restaurar las comprobaciones de clave única y clave foránea
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;






