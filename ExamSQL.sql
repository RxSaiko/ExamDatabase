-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS `exam_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `exam_db` ;

-- -----------------------------------------------------
-- Table `exam_db`.`candidate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_db`.`candidate` (
  `CondidateID` INT NOT NULL AUTO_INCREMENT,
  `CondidateFirstName` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  `CandidateLastName` VARCHAR(50) CHARACTER SET 'utf8mb3' NOT NULL,
  PRIMARY KEY (`CondidateID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `exam_db`.`examsession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_db`.`examsession` (
  `ExamId` INT NOT NULL AUTO_INCREMENT,
  `ExamName` VARCHAR(50) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`ExamId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `exam_db`.`ToPass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exam_db`.`ToPass` (
  `candidate_CondidateID` INT NOT NULL,
  `examsession_ExamId` INT NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (`candidate_CondidateID`, `examsession_ExamId`),
  INDEX `fk_candidate_has_examsession_examsession1_idx` (`examsession_ExamId` ASC) VISIBLE,
  INDEX `fk_candidate_has_examsession_candidate_idx` (`candidate_CondidateID` ASC) VISIBLE,
  CONSTRAINT `fk_candidate_has_examsession_candidate`
    FOREIGN KEY (`candidate_CondidateID`)
    REFERENCES `exam_db`.`candidate` (`CondidateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_candidate_has_examsession_examsession1`
    FOREIGN KEY (`examsession_ExamId`)
    REFERENCES `exam_db`.`examsession` (`ExamId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
