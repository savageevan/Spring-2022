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
-- Table `youtube`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`account` (
  `account_id` INT NOT NULL AUTO_INCREMENT,
  `account_firstname` VARCHAR(45) NOT NULL,
  `account_lastname` VARCHAR(45) NOT NULL,
  `account_username` VARCHAR(45) NOT NULL,
  `account_email` VARCHAR(45) NOT NULL,
  `account_typel` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`account_id`),
  UNIQUE INDEX `accountusername_UNIQUE` (`account_username` ASC) VISIBLE,
  UNIQUE INDEX `account_email_UNIQUE` (`account_email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`lookup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`lookup` (
  `lookup_id` INT NOT NULL,
  `lookup_type` VARCHAR(45) BINARY NOT NULL,
  `lookup_value` VARCHAR(45) NOT NULL,
  `account_id` INT NOT NULL,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NULL,
  PRIMARY KEY (`lookup_id`),
  INDEX `fk_lookup_account1_idx` (`account_id` ASC) VISIBLE,
  CONSTRAINT `fk_lookup_account1`
    FOREIGN KEY (`account_id`)
    REFERENCES `youtube`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`memberships`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`memberships` (
  `memberships_id` INT NOT NULL,
  `lookup_id` INT NOT NULL,
  `membership_type` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`memberships_id`),
  INDEX `fk_subscription_account_lookup1_idx` (`lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_account_lookup1`
    FOREIGN KEY (`lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`youtubetv`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`youtubetv` (
  `youtubetv_id` INT NOT NULL,
  PRIMARY KEY (`youtubetv_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Premium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`Premium` (
  `premium_id` INT NOT NULL,
  PRIMARY KEY (`premium_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`music_song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`music_song` (
  `library_id` INT NOT NULL,
  PRIMARY KEY (`library_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`music` (
  `music_id` INT NOT NULL,
  `music_songs_library_id` INT NOT NULL,
  PRIMARY KEY (`music_id`),
  INDEX `fk_Music_music_songs1_idx` (`music_songs_library_id` ASC) VISIBLE,
  CONSTRAINT `fk_Music_music_songs1`
    FOREIGN KEY (`music_songs_library_id`)
    REFERENCES `youtube`.`music_song` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT NOT NULL,
  `lookup_lookup_id` INT NOT NULL,
  `channel_name` VARCHAR(45) NOT NULL,
  `channel_type` VARCHAR(45) NOT NULL,
  `channel_creators` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channel_lookup1_idx` (`lookup_lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_lookup1`
    FOREIGN KEY (`lookup_lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`reaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`reaction` (
  `reaction_id` INT UNSIGNED NOT NULL,
  `reaction` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reaction_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`account_video_reaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`account_video_reaction` (
  `likedvideos_id` INT UNSIGNED NOT NULL,
  `reaction_id` INT UNSIGNED NOT NULL,
  `lookup_lookup_id` INT NOT NULL,
  PRIMARY KEY (`likedvideos_id`),
  INDEX `fk_account_video_reaction_reation1_idx` (`reaction_id` ASC) VISIBLE,
  INDEX `fk_account_video_reaction_lookup1_idx` (`lookup_lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_account_video_reaction_reation1`
    FOREIGN KEY (`reaction_id`)
    REFERENCES `youtube`.`reaction` (`reaction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_video_reaction_lookup1`
    FOREIGN KEY (`lookup_lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `videos_id` INT UNSIGNED NOT NULL,
  `chanel_channel_id` INT NOT NULL,
  `video_name` VARCHAR(45) NOT NULL,
  `video_length` VARCHAR(45) NOT NULL,
  `video_date` DATE NOT NULL,
  `account_video_reaction_likedvideos_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`videos_id`),
  INDEX `fk_videos_chanel1_idx` (`chanel_channel_id` ASC) VISIBLE,
  INDEX `fk_video_account_video_reaction1_idx` (`account_video_reaction_likedvideos_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_chanel1`
    FOREIGN KEY (`chanel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_account_video_reaction1`
    FOREIGN KEY (`account_video_reaction_likedvideos_id`)
    REFERENCES `youtube`.`account_video_reaction` (`likedvideos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`recording`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`recording` (
  `recordings_id` INT NOT NULL,
  `youtubetv_youtubetv_id` INT NOT NULL,
  PRIMARY KEY (`recordings_id`),
  INDEX `fk_recordings_youtubetv1_idx` (`youtubetv_youtubetv_id` ASC) VISIBLE,
  CONSTRAINT `fk_recordings_youtubetv1`
    FOREIGN KEY (`youtubetv_youtubetv_id`)
    REFERENCES `youtube`.`youtubetv` (`youtubetv_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`song` (
  `songs_id` INT NOT NULL,
  `music_songs_library_id` INT NOT NULL,
  `song_artist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`songs_id`),
  INDEX `fk_songs_music_songs1_idx` (`music_songs_library_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_music_songs1`
    FOREIGN KEY (`music_songs_library_id`)
    REFERENCES `youtube`.`music_song` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `youtube`.`creator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`creator` (
  `idcreator_channel` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  PRIMARY KEY (`idcreator_channel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channel_creator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channel_creator` (
  `channel_channel_id` INT NOT NULL,
  `creator_channel_idcreator_channel` INT NOT NULL,
  PRIMARY KEY (`channel_channel_id`, `creator_channel_idcreator_channel`),
  INDEX `fk_channel_has_creator_channel_creator_channel1_idx` (`creator_channel_idcreator_channel` ASC) VISIBLE,
  INDEX `fk_channel_has_creator_channel_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_has_creator_channel_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_channel_has_creator_channel_creator_channel1`
    FOREIGN KEY (`creator_channel_idcreator_channel`)
    REFERENCES `youtube`.`creator` (`idcreator_channel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscription` (
  `account_account_id` INT NOT NULL,
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `lookup_lookup_id` INT NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_account2_idx` (`account_account_id` ASC) VISIBLE,
  INDEX `fk_subscription_lookup1_idx` (`lookup_lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_account2`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `youtube`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_lookup1`
    FOREIGN KEY (`lookup_lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscription` (
  `account_account_id` INT NOT NULL,
  `subscription_id` INT NOT NULL AUTO_INCREMENT,
  `lookup_lookup_id` INT NOT NULL,
  PRIMARY KEY (`subscription_id`),
  INDEX `fk_subscription_account2_idx` (`account_account_id` ASC) VISIBLE,
  INDEX `fk_subscription_lookup1_idx` (`lookup_lookup_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_account2`
    FOREIGN KEY (`account_account_id`)
    REFERENCES `youtube`.`account` (`account_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_lookup1`
    FOREIGN KEY (`lookup_lookup_id`)
    REFERENCES `youtube`.`lookup` (`lookup_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscription_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscription_channel` (
  `subscription_subscription_id` INT NOT NULL,
  `channel_channel_id` INT NOT NULL,
  PRIMARY KEY (`subscription_subscription_id`, `channel_channel_id`),
  INDEX `fk_subscription_has_channel_channel1_idx` (`channel_channel_id` ASC) VISIBLE,
  INDEX `fk_subscription_has_channel_subscription1_idx` (`subscription_subscription_id` ASC) VISIBLE,
  CONSTRAINT `fk_subscription_has_channel_subscription1`
    FOREIGN KEY (`subscription_subscription_id`)
    REFERENCES `youtube`.`subscription` (`subscription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscription_has_channel_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
