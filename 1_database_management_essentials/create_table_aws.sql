-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema module_3
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `module_3` ;

-- -----------------------------------------------------
-- Schema module_3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `module_3` ;
USE `module_3` ;

-- -----------------------------------------------------
-- Table `module_3`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Customer` (
  `custno` VARCHAR(8) NOT NULL COMMENT '',
  `custname` VARCHAR(50) NOT NULL COMMENT '',
  `address` VARCHAR(50) NOT NULL COMMENT '',
  `Internal` CHAR(1) NOT NULL COMMENT '',
  `contact` VARCHAR(50) NOT NULL COMMENT '',
  `phone` INT(7) NOT NULL COMMENT '',
  `city` VARCHAR(30) NOT NULL COMMENT '',
  `state` CHAR(2) NOT NULL COMMENT '',
  `zip` INT(5) NOT NULL COMMENT '',
  PRIMARY KEY (`custno`)  COMMENT '');


-- -----------------------------------------------------
-- Table `module_3`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Employee` (
  `empno` VARCHAR(8) NOT NULL COMMENT '',
  `empname` VARCHAR(30) NOT NULL COMMENT '',
  `department` VARCHAR(20) NOT NULL COMMENT '',
  `email` VARCHAR(30) NOT NULL COMMENT '',
  `phone` CHAR(6) NOT NULL COMMENT '',
  PRIMARY KEY (`empno`)  COMMENT '');


-- -----------------------------------------------------
-- Table `module_3`.`Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Facility` (
  `facno` VARCHAR(8) NOT NULL COMMENT '',
  `facname` VARCHAR(50) NOT NULL COMMENT '',
  PRIMARY KEY (`facno`)  COMMENT '',
  UNIQUE INDEX `UniqueFacName` (`facname` ASC)  COMMENT '');


-- -----------------------------------------------------
-- Table `module_3`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Location` (
  `locno` VARCHAR(8) NOT NULL COMMENT '',
  `facno` CHAR(4) NOT NULL COMMENT '',
  `locname` VARCHAR(20) NOT NULL COMMENT '',
  PRIMARY KEY (`locno`)  COMMENT '',
  INDEX `FK_FACNO` (`facno` ASC)  COMMENT '',
  CONSTRAINT `FK_FACNO`
    FOREIGN KEY (`facno`)
    REFERENCES `module_3`.`Facility` (`facno`));


-- -----------------------------------------------------
-- Table `module_3`.`ResourceTbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`ResourceTbl` (
  `resno` VARCHAR(8) NOT NULL COMMENT '',
  `resname` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `rate` FLOAT NOT NULL COMMENT '',
  PRIMARY KEY (`resno`)  COMMENT '');


-- -----------------------------------------------------
-- Table `module_3`.`EventRequest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`EventRequest` (
  `eventno` VARCHAR(8) NOT NULL COMMENT '',
  `dateheld` DATE NOT NULL COMMENT '',
  `datereq` DATE NOT NULL COMMENT '',
  `facno` CHAR(4) NOT NULL COMMENT '',
  `custno` CHAR(4) NOT NULL COMMENT '',
  `dateauth` DATE NULL DEFAULT NULL COMMENT '',
  `status` VARCHAR(10) NOT NULL COMMENT '',
  `estcost` FLOAT NOT NULL COMMENT '',
  `estaudience` INT(7) NOT NULL COMMENT '',
  `budno` CHAR(5) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`eventno`)  COMMENT '',
  INDEX `FK_custno` (`custno` ASC)  COMMENT '',
  INDEX `FK_facno` (`facno` ASC)  COMMENT '',
  CONSTRAINT `FK_custno`
    FOREIGN KEY (`custno`)
    REFERENCES `module_3`.`Customer` (`custno`),
  CONSTRAINT `FK_facno`
    FOREIGN KEY (`facno`)
    REFERENCES `module_3`.`Facility` (`facno`));


-- -----------------------------------------------------
-- Table `module_3`.`EventPlan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`EventPlan` (
  `planno` VARCHAR(8) NOT NULL COMMENT '',
  `eventno` CHAR(4) NOT NULL COMMENT '',
  `workdate` DATE NOT NULL COMMENT '',
  `notes` VARCHAR(50) NULL DEFAULT NULL COMMENT '',
  `activity` VARCHAR(20) NOT NULL COMMENT '',
  `empno` CHAR(4) NULL DEFAULT NULL COMMENT '',
  PRIMARY KEY (`planno`)  COMMENT '',
  INDEX `FK_empno` (`empno` ASC)  COMMENT '',
  INDEX `FK_eventno` (`eventno` ASC)  COMMENT '',
  CONSTRAINT `FK_empno`
    FOREIGN KEY (`empno`)
    REFERENCES `module_3`.`Employee` (`empno`),
  CONSTRAINT `FK_eventno`
    FOREIGN KEY (`eventno`)
    REFERENCES `module_3`.`EventRequest` (`eventno`));


-- -----------------------------------------------------
-- Table `module_3`.`EventPlanLine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`EventPlanLine` (
  `PlanNo` CHAR(4) NOT NULL COMMENT '',
  `LineNo` VARCHAR(8) NOT NULL COMMENT '',
  `TimeStart` DATETIME NOT NULL COMMENT '',
  `TimeEnd` DATETIME NOT NULL COMMENT '',
  `NumberFld` CHAR(1) NOT NULL COMMENT '',
  `LocNo` CHAR(4) NOT NULL COMMENT '',
  `ResNo` CHAR(4) NOT NULL COMMENT '',
  PRIMARY KEY (`LineNo`)  COMMENT '',
  INDEX `FK_ResNo` (`ResNo` ASC)  COMMENT '',
  INDEX `FK_LocNo` (`LocNo` ASC)  COMMENT '',
  CONSTRAINT `FK_ResNo`
    FOREIGN KEY (`ResNo`)
    REFERENCES `module_3`.`ResourceTbl` (`resno`),
  CONSTRAINT `FK_LocNo`
    FOREIGN KEY (`LocNo`)
    REFERENCES `module_3`.`Location` (`locno`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
