-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema UVisa2017
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UVisa2017` ;

-- -----------------------------------------------------
-- Schema UVisa2017
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UVisa2017` DEFAULT CHARACTER SET utf8 ;
USE `UVisa2017` ;

-- -----------------------------------------------------
-- Table `UVisa2017`.`Carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Carrera` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Carrera` (
  `nombre` VARCHAR(45) NOT NULL,
  `cod_carrera` INT NOT NULL,
  `facultad` VARCHAR(45) NOT NULL,
  `num_cred_opt` INT NOT NULL,
  `num_cred_tran` INT NOT NULL,
  `num_cred_obl` INT NOT NULL,
  PRIMARY KEY (`cod_carrera`),
  UNIQUE INDEX `codigo_carrera_UNIQUE` (`cod_carrera` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Asignatura` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Asignatura` (
  `nombre` VARCHAR(45) NOT NULL,
  `Cod_asignatura` INT NOT NULL,
  `Cod_carrera` INT NULL DEFAULT NULL,
  `creditos` INT NOT NULL,
  `tipo` ENUM('T', 'OP', 'OB', 'TFG') NOT NULL,
  PRIMARY KEY (`Cod_asignatura`),
  UNIQUE INDEX `codigo_asignatura_UNIQUE` (`Cod_asignatura` ASC),
  INDEX `fk_Asignatura_Carrera1_idx` (`Cod_carrera` ASC),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC),
  CONSTRAINT `fk_Asignatura_Carrera1`
    FOREIGN KEY (`Cod_carrera`)
    REFERENCES `UVisa2017`.`Carrera` (`cod_carrera`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Usuario` (
  `NIF` VARCHAR(9) NOT NULL,
  `tipo_user` ENUM('ADMIN', 'ALUMNO', 'PROFESOR') NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido1` VARCHAR(45) NOT NULL,
  `apellido2` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `password` BINARY(64) NOT NULL,
  `CC` VARCHAR(24) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`NIF`),
  UNIQUE INDEX `correo_UNIQUE` (`email` ASC),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC))
ENGINE = InnoDB
INSERT_METHOD = NO
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Alumno` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Alumno` (
  `Usuario_NIF` VARCHAR(9) NOT NULL,
  `Cod_carrera` INT NOT NULL,
  `num_expediente` INT NOT NULL,
  UNIQUE INDEX `num_expediente_UNIQUE` (`num_expediente` ASC),
  PRIMARY KEY (`Usuario_NIF`, `Cod_carrera`, `num_expediente`),
  INDEX `fk_Alumno_Carrera1_idx` (`Cod_carrera` ASC),
  INDEX `fk_Alumno_Usuario1_idx` (`Usuario_NIF` ASC),
  CONSTRAINT `fk_Alumno_Carrera1`
    FOREIGN KEY (`Cod_carrera`)
    REFERENCES `UVisa2017`.`Carrera` (`cod_carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumno_Usuario1`
    FOREIGN KEY (`Usuario_NIF`)
    REFERENCES `UVisa2017`.`Usuario` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Departamento` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Departamento` (
  `codigo` INT NOT NULL,
  `nombre` MEDIUMTEXT NOT NULL,
  `carga` INT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Categoria` (
  `nombre` VARCHAR(45) NOT NULL,
  `horas_semanales` INT NOT NULL,
  PRIMARY KEY (`nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Profesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Profesor` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Profesor` (
  `NIF` VARCHAR(9) NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `antiguedad` INT NULL DEFAULT NULL,
  `num_tramos_investigacion` INT NULL DEFAULT NULL,
  `num_tramos_docentes` INT NULL DEFAULT NULL,
  `departamento` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Profesor_Departamento1_idx` (`departamento` ASC),
  INDEX `fk_Profesor_Categoria1_idx` (`categoria` ASC),
  INDEX `fk_Profesor_Usuario1_idx` (`NIF` ASC),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC),
  CONSTRAINT `fk_Profesor_Departamento1`
    FOREIGN KEY (`departamento`)
    REFERENCES `UVisa2017`.`Departamento` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesor_Categoria1`
    FOREIGN KEY (`categoria`)
    REFERENCES `UVisa2017`.`Categoria` (`nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesor_Usuario1`
    FOREIGN KEY (`NIF`)
    REFERENCES `UVisa2017`.`Usuario` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Nomina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Nomina` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Nomina` (
  `Profesor_NIF` VARCHAR(9) NOT NULL,
  `numero` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `Salario` DOUBLE NOT NULL,
  PRIMARY KEY (`Profesor_NIF`, `numero`),
  INDEX `fk_Nomina_Profesor1_idx` (`Profesor_NIF` ASC),
  UNIQUE INDEX `Profesor_NIF_UNIQUE` (`Profesor_NIF` ASC),
  CONSTRAINT `fk_Nomina_Profesor1`
    FOREIGN KEY (`Profesor_NIF`)
    REFERENCES `UVisa2017`.`Profesor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Matricula` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Matricula` (
  `num_expediente` INT NOT NULL,
  `Curso` YEAR NOT NULL,
  `reserva` TINYINT(1) NOT NULL,
  PRIMARY KEY (`num_expediente`, `Curso`),
  CONSTRAINT `fk_Matricula_Alumno1`
    FOREIGN KEY (`num_expediente`)
    REFERENCES `UVisa2017`.`Alumno` (`num_expediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Pago`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Pago` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Pago` (
  `num_expediente` INT NOT NULL,
  `numero_pago` INT NOT NULL,
  `Tipo_pago` ENUM('FRACIONARIO', 'UNITARIO') NOT NULL,
  `importe` DOUBLE NOT NULL,
  `pagado` TINYINT(1) NOT NULL,
  PRIMARY KEY (`num_expediente`, `numero_pago`),
  UNIQUE INDEX `numero_pago_UNIQUE` (`numero_pago` ASC),
  INDEX `fk_Pago_Matricula1_idx` (`num_expediente` ASC),
  UNIQUE INDEX `num_expediente_UNIQUE` (`num_expediente` ASC),
  CONSTRAINT `fk_Pago_Matricula1`
    FOREIGN KEY (`num_expediente`)
    REFERENCES `UVisa2017`.`Matricula` (`num_expediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Grupo` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Grupo` (
  `id_grupo` INT NOT NULL,
  `actas` TINYINT(1) NULL DEFAULT 0,
  `tipo` ENUM('T', 'L') NULL,
  `miembros` INT NULL DEFAULT 0,
  `Cod_asignatura` INT NOT NULL,
  PRIMARY KEY (`id_grupo`),
  INDEX `fk_Grupo_Asignatura1_idx` (`Cod_asignatura` ASC),
  CONSTRAINT `fk_Grupo_Asignatura1`
    FOREIGN KEY (`Cod_asignatura`)
    REFERENCES `UVisa2017`.`Asignatura` (`Cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Espacio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Espacio` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Espacio` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  `aforo_max` INT NULL DEFAULT NULL,
  `precio_alquiler` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`ReservaProfesor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`ReservaProfesor` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`ReservaProfesor` (
  `Profesor_NIF` VARCHAR(9) NOT NULL,
  `ID_Espacio` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` INT NOT NULL,
  PRIMARY KEY (`ID_Espacio`, `fecha`, `hora`),
  INDEX `fk_ReservaProfesores_Espacio1_idx` (`ID_Espacio` ASC),
  INDEX `fk_ReservaProfesor_Profesor1_idx` (`Profesor_NIF` ASC),
  CONSTRAINT `fk_ReservaProfesores_Espacio1`
    FOREIGN KEY (`ID_Espacio`)
    REFERENCES `UVisa2017`.`Espacio` (`codigo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ReservaProfesor_Profesor1`
    FOREIGN KEY (`Profesor_NIF`)
    REFERENCES `UVisa2017`.`Profesor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`ReservaGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`ReservaGrupo` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`ReservaGrupo` (
  `hora` INT NOT NULL,
  `dia_semana` ENUM('L', 'M', 'MX', 'J', 'V') NOT NULL,
  `ID_Espacio` INT NOT NULL,
  `grupo` INT NOT NULL,
  PRIMARY KEY (`hora`, `dia_semana`, `ID_Espacio`),
  INDEX `fk_ReservaGrupo_Espacio1_idx` (`ID_Espacio` ASC),
  INDEX `fk_ReservaGrupo_Grupo1_idx` (`grupo` ASC),
  CONSTRAINT `fk_ReservaGrupo_Espacio1`
    FOREIGN KEY (`ID_Espacio`)
    REFERENCES `UVisa2017`.`Espacio` (`codigo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ReservaGrupo_Grupo1`
    FOREIGN KEY (`grupo`)
    REFERENCES `UVisa2017`.`Grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Profesor_Grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Profesor_Grupo` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Profesor_Grupo` (
  `grupo_id` INT NOT NULL,
  `Profesor_NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`grupo_id`, `Profesor_NIF`),
  INDEX `fk_Profesor_has_Grupo_Grupo1_idx` (`grupo_id` ASC),
  INDEX `fk_Profesor_Grupo_Profesor1_idx` (`Profesor_NIF` ASC),
  CONSTRAINT `fk_Profesor_has_Grupo_Grupo1`
    FOREIGN KEY (`grupo_id`)
    REFERENCES `UVisa2017`.`Grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesor_Grupo_Profesor1`
    FOREIGN KEY (`Profesor_NIF`)
    REFERENCES `UVisa2017`.`Profesor` (`NIF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `UVisa2017`.`Asignatura_Matriculada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UVisa2017`.`Asignatura_Matriculada` ;

CREATE TABLE IF NOT EXISTS `UVisa2017`.`Asignatura_Matriculada` (
  `Cod_asignatura` INT NOT NULL,
  `num_expediente` INT NOT NULL,
  `Curso` YEAR NOT NULL,
  `Grupo_id_grupo` INT NOT NULL,
  `nota` DECIMAL NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_asignatura`, `num_expediente`, `Curso`),
  INDEX `fk_Matricula_has_Asignatura_Asignatura1_idx` (`Cod_asignatura` ASC),
  INDEX `fk_Matricula_has_Asignatura_Matricula1_idx` (`num_expediente` ASC, `Curso` ASC),
  UNIQUE INDEX `Curso_UNIQUE` (`Curso` ASC),
  INDEX `fk_Asignatura_Matriculada_Grupo1_idx` (`Grupo_id_grupo` ASC),
  CONSTRAINT `fk_Matricula_has_Asignatura_Matricula1`
    FOREIGN KEY (`num_expediente` , `Curso`)
    REFERENCES `UVisa2017`.`Matricula` (`num_expediente` , `Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_has_Asignatura_Asignatura1`
    FOREIGN KEY (`Cod_asignatura`)
    REFERENCES `UVisa2017`.`Asignatura` (`Cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Asignatura_Matriculada_Grupo1`
    FOREIGN KEY (`Grupo_id_grupo`)
    REFERENCES `UVisa2017`.`Grupo` (`id_grupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';

GRANT USAGE ON *.* TO Admin;

DROP USER Admin;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE USER 'Admin' IDENTIFIED BY 'isa2017';


GRANT SELECT ON TABLE `UVisa2017`.* TO 'Admin';

GRANT SELECT, INSERT, TRIGGER ON TABLE `UVisa2017`.* TO 'Admin';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `UVisa2017`.* TO 'Admin';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
