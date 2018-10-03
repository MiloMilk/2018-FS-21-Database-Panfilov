-- MySQL Script generated by MySQL Workbench
-- Mon Oct  1 06:52:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`users` ;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NULL,
  `reg_dttm` TIMESTAMP NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`payments` ;

CREATE TABLE IF NOT EXISTS `mydb`.`payments` (
  `payment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `payment_sum` DOUBLE NOT NULL,
  `payment_dttm` TIMESTAMP NOT NULL,
  UNIQUE INDEX `payment_id_UNIQUE` (`payment_id` ASC) VISIBLE,
  INDEX `FK_PAYEDBY_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_PAYEDBY`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`sessions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`sessions` (
  `session_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `begin_dttm` TIMESTAMP NOT NULL,
  `end_dttm` TIMESTAMP NOT NULL,
  UNIQUE INDEX `session_id_UNIQUE` (`session_id` ASC) VISIBLE,
  INDEX `FK_PAYBY_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_LOGBY`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`timestamps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`timestamps` ;

CREATE TABLE IF NOT EXISTS `mydb`.`timestamps` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


-- -----------------------------------------------------
-- Table `mydb`.`timestamps_1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`timestamps_1` ;

CREATE TABLE IF NOT EXISTS `mydb`.`timestamps_1` (
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NULL);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
