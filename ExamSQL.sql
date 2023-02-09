
USE `exam_db` ;

CREATE TABLE IF NOT EXISTS `exam_db`.`candidate` (
  `CondidateID` INT NOT NULL AUTO_INCREMENT,
  `CondidateFirstName` NVARCHAR(50)  NOT NULL,
  `CandidateLastName` NVARCHAR(50)  NOT NULL,
  PRIMARY KEY (`CondidateID`));
  
CREATE TABLE IF NOT EXISTS `exam_db`.`examsession` (
  `ExamId` INT NOT NULL AUTO_INCREMENT,
  `ExamName` VARCHAR(50)  not NULL,
  PRIMARY KEY (`ExamId`));
  
CREATE TABLE IF NOT EXISTS `exam_db`.`ToPass` (
  `candidate_CondidateID` INT NOT NULL,
  `examsession_ExamId` INT NOT NULL,
  `grade` INT NULL,
  PRIMARY KEY (candidate_CondidateID, examsession_ExamId),
    FOREIGN KEY (`candidate_CondidateID`)
    REFERENCES `exam_db`.`candidate` (`CondidateID`),
    FOREIGN KEY (`examsession_ExamId`)
    REFERENCES `exam_db`.`examsession` (`ExamId`)
);
