-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`lookup` (
  `lookup_id` INT NOT NULL AUTO_INCREMENT,
  `lookup_type` VARCHAR(45) BINARY NOT NULL,
  `lookup_value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`lookup_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`user_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`user_info` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `account_username_UNIQUE` (`user_name` ASC) VISIBLE,
  UNIQUE INDEX `account_email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`account` (
  `user_id` INT NOT NULL,
  `lookup_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  INDEX `fk_account_lookup1_idx` (`lookup_id` ASC) VISIBLE,
  INDEX `fk_account_user_info1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_lookup1`
    FOREIGN KEY (`lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_user_info1`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`user_info` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT NOT NULL AUTO_INCREMENT,
  `lookup_id` INT NOT NULL,
  `channel_name` VARCHAR(45) NOT NULL,
  `channel_creators` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channel_lookup1_idx` (`lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_lookup1`
    FOREIGN KEY (`lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `channel_id` INT NOT NULL,
  `lookup_id` INT NOT NULL,
  `video_name` VARCHAR(45) NOT NULL,
  `video_length` TIME NOT NULL,
  `video_date` DATE NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_videos_chanel1_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_video_lookup1_idx` (`lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_chanel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_lookup1`
    FOREIGN KEY (`lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`creator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`creator` (
  `creator_id` INT NOT NULL AUTO_INCREMENT,
  `creator_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`creator_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel_creator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel_creator` (
  `channel_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  PRIMARY KEY (`channel_id`, `creator_id`),
  INDEX `fk_channel_has_creator_channel_creator_channel1_idx` (`creator_id` ASC) VISIBLE,
  INDEX `fk_channel_has_creator_channel_channel1_idx` (`channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_has_creator_channel_channel1`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_channel_has_creator_channel_creator_channel1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `youtube`.`creator` (`creator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`account_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`account_channel` (
  `user_id` INT NOT NULL,
  `channel_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `channel_id`),
  INDEX `fk_account_has_channel_channel2_idx` (`channel_id` ASC) VISIBLE,
  INDEX `fk_account_has_channel_account2_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_has_channel_account2`
    FOREIGN KEY (`user_id`)
    REFERENCES `youtube`.`account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_has_channel_channel2`
    FOREIGN KEY (`channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
