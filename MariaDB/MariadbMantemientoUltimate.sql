-- MySQL Script generated by MySQL Workbench
-- jue 22 mar 2018 02:12:30 CST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mantenimientoPC
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mantenimientoPC` ;

-- -----------------------------------------------------
-- Schema mantenimientoPC
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mantenimientoPC` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `mantenimientoPC` ;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Prioridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Prioridad` (
  `pk_idPrioridad` INT(2) NOT NULL AUTO_INCREMENT,
  `PrioridadNivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_idPrioridad`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Sub_TipoMantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Sub_TipoMantenimiento` (
  `pk_idSub_TipoMantenimiento` INT(2) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`pk_idSub_TipoMantenimiento`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`TipoMantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`TipoMantenimiento` (
  `pk_idTipoMantenimiento` INT(2) NOT NULL AUTO_INCREMENT,
  `fk_idSub_TipoMantenimiento` INT(2) NOT NULL,
  `descripcion` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`pk_idTipoMantenimiento`),
  CONSTRAINT `fk_TipoMantenimiento_Sub_TipoMantenimiento1`
    FOREIGN KEY (`fk_idSub_TipoMantenimiento`)
    REFERENCES `mantenimientoPC`.`Sub_TipoMantenimiento` (`pk_idSub_TipoMantenimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_TipoMantenimiento_Sub_TipoMantenimiento1_idx` ON `mantenimientoPC`.`TipoMantenimiento` (`fk_idSub_TipoMantenimiento` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Unidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Unidad` (
  `pk_idUnidad` INT(2) NOT NULL AUTO_INCREMENT,
  `UnidadNombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`pk_idUnidad`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Solicitud` (
  `pk_idSolicitud` INT(3) NOT NULL AUTO_INCREMENT,
  `solicitante` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `correo` VARCHAR(150) NULL,
  PRIMARY KEY (`pk_idSolicitud`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`OrdenTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`OrdenTrabajo` (
  `pk_idOrdenTrabajo` INT(6) NOT NULL AUTO_INCREMENT,
  `fk_idPrioridad` INT(2) NOT NULL,
  `fk_idTipoMantenimiento` INT(2) NOT NULL,
  `fk_idUnidad` INT(2) NOT NULL,
  `fk_idOrigenSolicitud` INT(3) NOT NULL,
  `solicitudDescripcion` TEXT NULL,
  `solicitudFecha` DATE NULL,
  `clienteNombre` VARCHAR(45) NULL,
  `clienteEmail` VARCHAR(45) NULL,
  `clienteTelefono` VARCHAR(15) NULL,
  `clienteDomicilio` VARCHAR(45) NULL,
  `Estado` TINYINT(1) NOT NULL,
  `ordenTrabajoAprobadaFecha` DATE NULL,
  `tecnicoDiagnostico` TEXT NULL,
  `posibleFechaEntrega` DATE NULL,
  PRIMARY KEY (`pk_idOrdenTrabajo`),
  CONSTRAINT `fk_OrdenTrabajo_Prioridad`
    FOREIGN KEY (`fk_idPrioridad`)
    REFERENCES `mantenimientoPC`.`Prioridad` (`pk_idPrioridad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenTrabajo_TipoMantenimiento1`
    FOREIGN KEY (`fk_idTipoMantenimiento`)
    REFERENCES `mantenimientoPC`.`TipoMantenimiento` (`pk_idTipoMantenimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenTrabajo_Unidad1`
    FOREIGN KEY (`fk_idUnidad`)
    REFERENCES `mantenimientoPC`.`Unidad` (`pk_idUnidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdenTrabajo_OrigenSolicitud1`
    FOREIGN KEY (`fk_idOrigenSolicitud`)
    REFERENCES `mantenimientoPC`.`Solicitud` (`pk_idSolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_OrdenTrabajo_Prioridad_idx` ON `mantenimientoPC`.`OrdenTrabajo` (`fk_idPrioridad` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_OrdenTrabajo_TipoMantenimiento1_idx` ON `mantenimientoPC`.`OrdenTrabajo` (`fk_idTipoMantenimiento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_OrdenTrabajo_Unidad1_idx` ON `mantenimientoPC`.`OrdenTrabajo` (`fk_idUnidad` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_OrdenTrabajo_OrigenSolicitud1_idx` ON `mantenimientoPC`.`OrdenTrabajo` (`fk_idOrigenSolicitud` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`fabricantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`fabricantes` (
  `idFabricante` INT NOT NULL AUTO_INCREMENT,
  `nombre_Fabricante` VARCHAR(60) NOT NULL,
  `descripcion_Fabricante` TEXT NULL,
  `correo_Fabricante` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` TEXT NULL,
  PRIMARY KEY (`idFabricante`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Equipo_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Equipo_detalle` (
  `pk_EDnoSerie` VARCHAR(15) NOT NULL,
  `fk_PadreIdNoSerie` VARCHAR(15) NOT NULL,
  `fabricantes_idFabricante` INT NOT NULL,
  `noInventario` VARCHAR(30) NULL,
  `partNumber` VARCHAR(20) NULL,
  `modelo` VARCHAR(45) NULL,
  `hardware_sofware` TINYINT(1) NOT NULL,
  `sofware` VARCHAR(45) NULL,
  `version` VARCHAR(20) NULL,
  `arquitectura3264` TINYINT(1) NULL,
  `licencia` TINYINT(1) NULL,
  `observaciones` TEXT NULL,
  PRIMARY KEY (`pk_EDnoSerie`),
  CONSTRAINT `fk_Equipo_detalle_Equipo_detalle1`
    FOREIGN KEY (`fk_PadreIdNoSerie`)
    REFERENCES `mantenimientoPC`.`Equipo_detalle` (`pk_EDnoSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipo_detalle_fabricantes1`
    FOREIGN KEY (`fabricantes_idFabricante`)
    REFERENCES `mantenimientoPC`.`fabricantes` (`idFabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Equipo_detalle_Equipo_detalle1_idx` ON `mantenimientoPC`.`Equipo_detalle` (`fk_PadreIdNoSerie` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Equipo_detalle_fabricantes1_idx` ON `mantenimientoPC`.`Equipo_detalle` (`fabricantes_idFabricante` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Personal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Personal` (
  `pk_idPersonal` INT(3) NOT NULL AUTO_INCREMENT,
  `fk_padrePersonal` INT(3) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `dui` VARCHAR(45) NOT NULL,
  `nit` VARCHAR(45) NOT NULL,
  `estado` TINYINT(1) NOT NULL,
  `empleadoEstudiante` TINYINT(1) NOT NULL,
  `due` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_idPersonal`),
  CONSTRAINT `fk_Tecnico_Tecnico1`
    FOREIGN KEY (`fk_padrePersonal`)
    REFERENCES `mantenimientoPC`.`Personal` (`pk_idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Tecnico_Tecnico1_idx` ON `mantenimientoPC`.`Personal` (`fk_padrePersonal` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Diagnostico` (
  `pK_idDiagnostico` INT(2) NOT NULL,
  `OrdenTrabajo_pk_idOrdenTrabajo` INT(6) NOT NULL,
  PRIMARY KEY (`pK_idDiagnostico`, `OrdenTrabajo_pk_idOrdenTrabajo`),
  CONSTRAINT `fk_Diagnostico_OrdenTrabajo1`
    FOREIGN KEY (`OrdenTrabajo_pk_idOrdenTrabajo`)
    REFERENCES `mantenimientoPC`.`OrdenTrabajo` (`pk_idOrdenTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Dianostico_parte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Dianostico_parte` (
  `pk_idDianostico_parte` INT(3) NOT NULL,
  `OrdenTrabajo_pk_idOrdenTrabajo` INT(6) NOT NULL,
  `Equipo_detalle_pk_EDnoSerie` VARCHAR(15) NOT NULL,
  `Diagnostico_pK_idDiagnostico` INT(2) NOT NULL,
  `Diagnostico_OrdenTrabajo_pk_idOrdenTrabajo` INT(6) NOT NULL,
  `descripcionProblema` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_idDianostico_parte`),
  CONSTRAINT `fk_Dianostico_parte_OrdenTrabajo1`
    FOREIGN KEY (`OrdenTrabajo_pk_idOrdenTrabajo`)
    REFERENCES `mantenimientoPC`.`OrdenTrabajo` (`pk_idOrdenTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dianostico_parte_Equipo_detalle1`
    FOREIGN KEY (`Equipo_detalle_pk_EDnoSerie`)
    REFERENCES `mantenimientoPC`.`Equipo_detalle` (`pk_EDnoSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dianostico_parte_Diagnostico1`
    FOREIGN KEY (`Diagnostico_pK_idDiagnostico` , `Diagnostico_OrdenTrabajo_pk_idOrdenTrabajo`)
    REFERENCES `mantenimientoPC`.`Diagnostico` (`pK_idDiagnostico` , `OrdenTrabajo_pk_idOrdenTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Dianostico_parte_OrdenTrabajo1_idx` ON `mantenimientoPC`.`Dianostico_parte` (`OrdenTrabajo_pk_idOrdenTrabajo` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Dianostico_parte_Equipo_detalle1_idx` ON `mantenimientoPC`.`Dianostico_parte` (`Equipo_detalle_pk_EDnoSerie` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Dianostico_parte_Diagnostico1_idx` ON `mantenimientoPC`.`Dianostico_parte` (`Diagnostico_pK_idDiagnostico` ASC, `Diagnostico_OrdenTrabajo_pk_idOrdenTrabajo` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Pasos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Pasos` (
  `pk_idPaso` INT(3) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `observacion` TEXT NULL,
  `duracion_Paso` VARCHAR(45) NULL,
  PRIMARY KEY (`pk_idPaso`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Tipo_procedimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Tipo_procedimiento` (
  `pk_idTipo_procedimiento` INT(3) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `observacion` TEXT NULL,
  PRIMARY KEY (`pk_idTipo_procedimiento`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Procedimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Procedimientos` (
  `Dianostico_parte_pk_idDianostico_parte` INT(3) NOT NULL,
  `Pasos_pk_idPaso` INT(3) NOT NULL,
  `Tipo_procedimiento_pk_idTipo_procedimiento` INT(3) NOT NULL,
  `nombre_Procedimiento` VARCHAR(60) NULL,
  PRIMARY KEY (`Dianostico_parte_pk_idDianostico_parte`, `Pasos_pk_idPaso`, `Tipo_procedimiento_pk_idTipo_procedimiento`),
  CONSTRAINT `fk_Procedimientos_Dianostico_parte1`
    FOREIGN KEY (`Dianostico_parte_pk_idDianostico_parte`)
    REFERENCES `mantenimientoPC`.`Dianostico_parte` (`pk_idDianostico_parte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Procedimientos_Pasos1`
    FOREIGN KEY (`Pasos_pk_idPaso`)
    REFERENCES `mantenimientoPC`.`Pasos` (`pk_idPaso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Procedimientos_Tipo_procedimiento1`
    FOREIGN KEY (`Tipo_procedimiento_pk_idTipo_procedimiento`)
    REFERENCES `mantenimientoPC`.`Tipo_procedimiento` (`pk_idTipo_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Procedimientos_Dianostico_parte1_idx` ON `mantenimientoPC`.`Procedimientos` (`Dianostico_parte_pk_idDianostico_parte` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Procedimientos_Pasos1_idx` ON `mantenimientoPC`.`Procedimientos` (`Pasos_pk_idPaso` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Procedimientos_Tipo_procedimiento1_idx` ON `mantenimientoPC`.`Procedimientos` (`Tipo_procedimiento_pk_idTipo_procedimiento` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Estado` (
  `pk_idEstado` INT(2) NOT NULL,
  `EstadoNombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `Procedimientos_Dianostico_parte_pk_idDianostico_parte` INT(3) NOT NULL,
  `Procedimientos_Pasos_pk_idPaso` INT(3) NOT NULL,
  `Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento` INT(3) NOT NULL,
  PRIMARY KEY (`pk_idEstado`, `Procedimientos_Dianostico_parte_pk_idDianostico_parte`, `Procedimientos_Pasos_pk_idPaso`, `Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento`),
  CONSTRAINT `fk_Estado_Procedimientos1`
    FOREIGN KEY (`Procedimientos_Dianostico_parte_pk_idDianostico_parte` , `Procedimientos_Pasos_pk_idPaso` , `Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento`)
    REFERENCES `mantenimientoPC`.`Procedimientos` (`Dianostico_parte_pk_idDianostico_parte` , `Pasos_pk_idPaso` , `Tipo_procedimiento_pk_idTipo_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Estado_Procedimientos1_idx` ON `mantenimientoPC`.`Estado` (`Procedimientos_Dianostico_parte_pk_idDianostico_parte` ASC, `Procedimientos_Pasos_pk_idPaso` ASC, `Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Estado_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Estado_detalle` (
  `Personal_pk_idPersonal` INT(3) NOT NULL,
  `Estado_pk_idEstado` INT(2) NOT NULL,
  PRIMARY KEY (`Personal_pk_idPersonal`, `Estado_pk_idEstado`),
  CONSTRAINT `fk_Estado_detalle_Personal1`
    FOREIGN KEY (`Personal_pk_idPersonal`)
    REFERENCES `mantenimientoPC`.`Personal` (`pk_idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estado_detalle_Estado1`
    FOREIGN KEY (`Estado_pk_idEstado`)
    REFERENCES `mantenimientoPC`.`Estado` (`pk_idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Estado_detalle_Estado1_idx` ON `mantenimientoPC`.`Estado_detalle` (`Estado_pk_idEstado` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Mantenimiento_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Mantenimiento_detalle` (
  `pk_idMantenimiento_detallecol` INT(4) NOT NULL,
  `OrdenTrabajo_pk_idOrdenTrabajo` INT(6) NOT NULL,
  `fecha` DATE NOT NULL,
  `observaciones` TEXT NULL,
  `Estado_pk_idEstado` INT(2) NOT NULL,
  `Estado_Procedimientos_Dianostico_parte_pk_idDianostico_parte` INT(3) NOT NULL,
  `Estado_Procedimientos_Pasos_pk_idPaso` INT(3) NOT NULL,
  `Estado_Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento` INT(3) NOT NULL,
  `Equipo_detalle_pk_EDnoSerie` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`pk_idMantenimiento_detallecol`, `OrdenTrabajo_pk_idOrdenTrabajo`),
  CONSTRAINT `fk_Mantenimiento_detalle_OrdenTrabajo1`
    FOREIGN KEY (`OrdenTrabajo_pk_idOrdenTrabajo`)
    REFERENCES `mantenimientoPC`.`OrdenTrabajo` (`pk_idOrdenTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mantenimiento_detalle_Estado1`
    FOREIGN KEY (`Estado_pk_idEstado` , `Estado_Procedimientos_Dianostico_parte_pk_idDianostico_parte` , `Estado_Procedimientos_Pasos_pk_idPaso` , `Estado_Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento`)
    REFERENCES `mantenimientoPC`.`Estado` (`pk_idEstado` , `Procedimientos_Dianostico_parte_pk_idDianostico_parte` , `Procedimientos_Pasos_pk_idPaso` , `Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mantenimiento_detalle_Equipo_detalle1`
    FOREIGN KEY (`Equipo_detalle_pk_EDnoSerie`)
    REFERENCES `mantenimientoPC`.`Equipo_detalle` (`pk_EDnoSerie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Mantenimiento_detalle_OrdenTrabajo1_idx` ON `mantenimientoPC`.`Mantenimiento_detalle` (`OrdenTrabajo_pk_idOrdenTrabajo` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Mantenimiento_detalle_Estado1_idx` ON `mantenimientoPC`.`Mantenimiento_detalle` (`Estado_pk_idEstado` ASC, `Estado_Procedimientos_Dianostico_parte_pk_idDianostico_parte` ASC, `Estado_Procedimientos_Pasos_pk_idPaso` ASC, `Estado_Procedimientos_Tipo_procedimiento_pk_idTipo_procedimiento` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_Mantenimiento_detalle_Equipo_detalle1_idx` ON `mantenimientoPC`.`Mantenimiento_detalle` (`Equipo_detalle_pk_EDnoSerie` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Rol` (
  `pk_idRol` INT(3) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pk_idRol`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`HistorialTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`HistorialTrabajo` (
  `pk_idHistorialTrabajo` INT(6) NOT NULL AUTO_INCREMENT,
  `Personal_pk_idPersonal` INT(3) NOT NULL,
  `Rol_pk_idRol` INT(3) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  PRIMARY KEY (`pk_idHistorialTrabajo`),
  CONSTRAINT `fk_HistorialTrabajo_Personal1`
    FOREIGN KEY (`Personal_pk_idPersonal`)
    REFERENCES `mantenimientoPC`.`Personal` (`pk_idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HistorialTrabajo_Rol1`
    FOREIGN KEY (`Rol_pk_idRol`)
    REFERENCES `mantenimientoPC`.`Rol` (`pk_idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_HistorialTrabajo_Personal1_idx` ON `mantenimientoPC`.`HistorialTrabajo` (`Personal_pk_idPersonal` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_HistorialTrabajo_Rol1_idx` ON `mantenimientoPC`.`HistorialTrabajo` (`Rol_pk_idRol` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Telefono` (
  `pk_idTelefono` INT(5) NOT NULL AUTO_INCREMENT,
  `Telefono` VARCHAR(45) NOT NULL,
  `Soporte_pk_idSoporte` INT(3) NOT NULL,
  PRIMARY KEY (`pk_idTelefono`),
  CONSTRAINT `fk_Telefono_Soporte1`
    FOREIGN KEY (`Soporte_pk_idSoporte`)
    REFERENCES `mantenimientoPC`.`Personal` (`pk_idPersonal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Telefono_Soporte1_idx` ON `mantenimientoPC`.`Telefono` (`Soporte_pk_idSoporte` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `mantenimientoPC`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mantenimientoPC`.`Calendario` (
  `idCalendario` INT NOT NULL AUTO_INCREMENT,
  `fecha_mantenimiento` DATE NOT NULL,
  `excepcion` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idCalendario`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
