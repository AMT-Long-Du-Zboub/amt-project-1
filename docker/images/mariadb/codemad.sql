-- MySQL Script generated by MySQL Workbench
-- Wed Oct  7 09:52:48 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema codemad
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema codemad
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `codemad`;
CREATE SCHEMA IF NOT EXISTS `codemad` DEFAULT CHARACTER SET utf8mb4 ;
USE `codemad` ;

-- -----------------------------------------------------
-- Table `codemad`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`User` (
  `idUser` VARCHAR(36) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `password` VARCHAR(24) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Question` (
  `idQuestion` VARCHAR(36) NOT NULL,
  `idUser` VARCHAR(36) NOT NULL,
  `title` VARCHAR(60) NULL,
  `text` LONGTEXT NULL,
  PRIMARY KEY (`idQuestion`),
  INDEX `fk_Question_User1_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Question_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `codemad`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Answer` (
  `idAnswer` VARCHAR(36) NOT NULL,
  `idUser` VARCHAR(36) NOT NULL,
  `idQuestion` VARCHAR(36) NOT NULL,
  `text` LONGTEXT NULL,
  PRIMARY KEY (`idAnswer`),
  INDEX `fk_Answer_User1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_Answer_Question1_idx` (`idQuestion` ASC) VISIBLE,
  CONSTRAINT `fk_Answer_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `codemad`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Answer_Question1`
    FOREIGN KEY (`idQuestion`)
    REFERENCES `codemad`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Commentary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Commentary` (
  `idCommentary` VARCHAR(36) NOT NULL,
  `idUser` VARCHAR(36) NOT NULL,
  `idAnswer` VARCHAR(36) NULL,
  `idQuestion` VARCHAR(36) NULL,
  `text` LONGTEXT NULL,
  PRIMARY KEY (`idCommentary`, `idUser`),
  INDEX `fk_Commentary_User1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_Commentary_Answer1_idx` (`idAnswer` ASC) VISIBLE,
  INDEX `fk_Commentary_Question1_idx` (`idQuestion` ASC) VISIBLE,
  CONSTRAINT `fk_Commentary_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `codemad`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentary_Answer1`
    FOREIGN KEY (`idAnswer`)
    REFERENCES `codemad`.`Answer` (`idAnswer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentary_Question1`
    FOREIGN KEY (`idQuestion`)
    REFERENCES `codemad`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Vote` (
  `idVote` VARCHAR(36) NOT NULL,
  `idUser` VARCHAR(36) NOT NULL,
  `idQuestion` VARCHAR(36) NULL,
  `idCommentary` VARCHAR(36) NULL,
  `vote` TINYINT NULL,
  PRIMARY KEY (`idVote`, `idUser`),
  INDEX `fk_Vote_User1_idx` (`idUser` ASC) VISIBLE,
  INDEX `fk_Vote_Question1_idx` (`idQuestion` ASC) VISIBLE,
  INDEX `fk_Vote_Commentary1_idx` (`idCommentary` ASC) VISIBLE,
  CONSTRAINT `fk_Vote_User1`
    FOREIGN KEY (`idUser`)
    REFERENCES `codemad`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vote_Question1`
    FOREIGN KEY (`idQuestion`)
    REFERENCES `codemad`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vote_Commentary1`
    FOREIGN KEY (`idCommentary`)
    REFERENCES `codemad`.`Commentary` (`idCommentary`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Tag` (
  `idTag` VARCHAR(36) NOT NULL,
  `tag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTag`),
  UNIQUE INDEX `tag_UNIQUE` (`tag` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `codemad`.`Question_Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `codemad`.`Question_Tag` (
  `idQuestion` VARCHAR(36) NOT NULL,
  `idTag` VARCHAR(36) NOT NULL,
  PRIMARY KEY (`idQuestion`, `idTag`),
  INDEX `fk_Question_has_Tag_Tag1_idx` (`idTag` ASC) VISIBLE,
  INDEX `fk_Question_has_Tag_Question1_idx` (`idQuestion` ASC) VISIBLE,
  CONSTRAINT `fk_Question_has_Tag_Question1`
    FOREIGN KEY (`idQuestion`)
    REFERENCES `codemad`.`Question` (`idQuestion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Question_has_Tag_Tag1`
    FOREIGN KEY (`idTag`)
    REFERENCES `codemad`.`Tag` (`idTag`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'C');
INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'C++');
INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'Java');
INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'Python');
INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'SCALA');
INSERT INTO `codemad`.`Tag`(idTag, tag) VALUES (UUID(), 'JavaScript');
