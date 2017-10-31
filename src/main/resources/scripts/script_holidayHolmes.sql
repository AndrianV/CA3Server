-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema holiday_homes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema holiday_homes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `holiday_homes` DEFAULT CHARACTER SET utf8 ;
USE `holiday_homes` ;

-- -----------------------------------------------------
-- Table `holiday_homes`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holiday_homes`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `role` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holiday_homes`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holiday_homes`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zipCode` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holiday_homes`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holiday_homes`.`place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` INT NULL,
  `user` INT NULL,
  `desc` VARCHAR(1000) NOT NULL,
  `imgURL` VARCHAR(1000) NOT NULL,
  `GPS_lat` DOUBLE NULL,
  `GPS_long` DOUBLE NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `user_id_idx` (`user` ASC),
  INDEX `fk_place_address1_idx` (`address` ASC),
  CONSTRAINT `user_id`
    FOREIGN KEY (`user`)
    REFERENCES `holiday_homes`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `address_id`
    FOREIGN KEY (`address`)
    REFERENCES `holiday_homes`.`address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `holiday_homes`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `holiday_homes`.`ratings` (
  `place` INT NOT NULL,
  `rating` INT NOT NULL,
  `user` INT NULL,
  INDEX `place_id_idx` (`place` ASC),
  INDEX `user_id_idx` (`user` ASC),
  CONSTRAINT `place_id`
    FOREIGN KEY (`place`)
    REFERENCES `holiday_homes`.`place` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userID`
    FOREIGN KEY (`user`)
    REFERENCES `holiday_homes`.`user` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO holiday_homes.user (email, password, firstName, lastName, role) VALUES ('admin@gmail.com', 'admin_pass', 'Admin', 'Adminov', 'admin');