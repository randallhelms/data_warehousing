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
  `custno` VARCHAR(8) NOT NULL,
  `custname` VARCHAR(50) NOT NULL,
  `address` VARCHAR(50) NOT NULL,
  `Internal` CHAR(1) NOT NULL,
  `contact` VARCHAR(50) NOT NULL,
  `phone` INT(7) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `state` CHAR(2) NOT NULL,
  `zip` INT(5) NOT NULL,
  PRIMARY KEY (`custno`));


-- -----------------------------------------------------
-- Table `module_3`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Employee` (
  `empno` VARCHAR(8) NOT NULL,
  `empname` VARCHAR(30) NOT NULL,
  `department` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `phone` CHAR(6) NOT NULL,
  PRIMARY KEY (`empno`));


-- -----------------------------------------------------
-- Table `module_3`.`Facility`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Facility` (
  `facno` VARCHAR(8) NOT NULL,
  `facname` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`facno`),
  UNIQUE INDEX `UniqueFacName` (`facname` ASC));


-- -----------------------------------------------------
-- Table `module_3`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`Location` (
  `locno` VARCHAR(8) NOT NULL,
  `facno` CHAR(4) NOT NULL,
  `locname` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`locno`),
  INDEX `FK_FACNO` (`facno` ASC),
  CONSTRAINT `FK_FACNO`
    FOREIGN KEY (`facno`)
    REFERENCES `module_3`.`Facility` (`facno`));


-- -----------------------------------------------------
-- Table `module_3`.`ResourceTbl`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`ResourceTbl` (
  `resno` VARCHAR(8) NOT NULL,
  `resname` VARCHAR(20) NULL DEFAULT NULL,
  `rate` FLOAT NOT NULL,
  PRIMARY KEY (`resno`));


-- -----------------------------------------------------
-- Table `module_3`.`EventRequest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `module_3`.`EventRequest` (
  `eventno` VARCHAR(8) NOT NULL,
  `dateheld` DATE NOT NULL,
  `datereq` DATE NOT NULL,
  `facno` CHAR(4) NOT NULL,
  `custno` CHAR(4) NOT NULL,
  `dateauth` DATE NULL DEFAULT NULL,
  `status` VARCHAR(10) NOT NULL,
  `estcost` FLOAT NOT NULL,
  `estaudience` INT(7) NOT NULL,
  `budno` CHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`eventno`),
  INDEX `FK_custno` (`custno` ASC),
  INDEX `FK_facno` (`facno` ASC),
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
  `planno` VARCHAR(8) NOT NULL,
  `eventno` CHAR(4) NOT NULL,
  `workdate` DATE NOT NULL,
  `notes` VARCHAR(50) NULL DEFAULT NULL,
  `activity` VARCHAR(20) NOT NULL,
  `empno` CHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`planno`),
  INDEX `FK_empno` (`empno` ASC),
  INDEX `FK_eventno` (`eventno` ASC),
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
  `PlanNo` CHAR(4) NOT NULL,
  `LineNo` VARCHAR(8) NOT NULL,
  `TimeStart` DATETIME NOT NULL,
  `TimeEnd` DATETIME NOT NULL,
  `NumberFld` CHAR(1) NOT NULL,
  `LocNo` CHAR(4) NOT NULL,
  `ResNo` CHAR(4) NOT NULL,
  PRIMARY KEY (`LineNo`),
  INDEX `FK_ResNo` (`ResNo` ASC),
  INDEX `FK_LocNo` (`LocNo` ASC),
  CONSTRAINT `FK_ResNo`
    FOREIGN KEY (`ResNo`)
    REFERENCES `module_3`.`ResourceTbl` (`resno`),
  CONSTRAINT `FK_LocNo`
    FOREIGN KEY (`LocNo`)
    REFERENCES `module_3`.`Location` (`locno`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
