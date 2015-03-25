-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema join_practice
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ecommerce` ;

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`users` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `artist` VARCHAR(45) NOT NULL,
  `name` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `price` FLOAT NOT NULL,
  `inventory` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`images` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `url` TEXT NOT NULL,
  `main` TINYINT(1) NOT NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`id`, `product_id`),
  INDEX `fk_images_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_images_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`addresses` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `line_1` TEXT NOT NULL,
  `line_2` TEXT NOT NULL,
  `city` TEXT NOT NULL,
  `state` TEXT NOT NULL,
  `zip` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() on update NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`billlings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`billlings` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`billlings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `card` INT NOT NULL,
  `expires` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() on update NOW(),
  PRIMARY KEY (`id`, `address_id`),
  INDEX `fk_addresses_idx` (`address_id` ASC),
  CONSTRAINT `fk_addresses`
    FOREIGN KEY (`address_id`)
    REFERENCES `ecommerce`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`orders` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `billIng_id` INT NOT NULL,
  `shipping_id` INT NOT NULL,
  `status` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() on update NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_billing_idx` (`billIng_id` ASC),
  INDEX `fk_shipping_idx` (`shipping_id` ASC),
  CONSTRAINT `fk_billings`
    FOREIGN KEY (`billIng_id`)
    REFERENCES `ecommerce`.`billlings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipping`
    FOREIGN KEY (`shipping_id`)
    REFERENCES `ecommerce`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`genres` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`genres` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() on update NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products_genres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products_genres` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`products_genres` (
  `product_id` INT NOT NULL,
  `genre_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `genre_id`),
  INDEX `fk_products_has_categories_categories1_idx` (`genre_id` ASC),
  INDEX `fk_products_has_categories_products_idx` (`product_id` ASC),
  CONSTRAINT `fk_products_has_categories_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_categories_categories1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `ecommerce`.`genres` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products_orders` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`products_orders` (
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `order_id`),
  INDEX `fk_products_has_orders_orders1_idx` (`order_id` ASC),
  INDEX `fk_products_has_orders_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_products_has_orders_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_orders_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `ecommerce`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`similar_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`similar_products` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`similar_products` (
  `product_id` INT NOT NULL,
  `similar_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `similar_id`),
  INDEX `fk_products_has_products_products2_idx` (`similar_id` ASC),
  INDEX `fk_products_has_products_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_products_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `ecommerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_products_products2`
    FOREIGN KEY (`similar_id`)
    REFERENCES `ecommerce`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`users` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`following`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`following` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`following` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `follower_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_following_users3_idx` (`user_id` ASC),
  INDEX `fk_following_users4_idx` (`follower_id` ASC),
  CONSTRAINT `fk_following_users3`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_following_users4`
    FOREIGN KEY (`follower_id`)
    REFERENCES `ecommerce`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`users` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`users` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`following`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`following` ;

CREATE TABLE IF NOT EXISTS `ecommerce`.`following` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `follower_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_following_users3_idx` (`user_id` ASC),
  INDEX `fk_following_users4_idx` (`follower_id` ASC),
  CONSTRAINT `fk_following_users3`
    FOREIGN KEY (`user_id`)
    REFERENCES `ecommerce`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_following_users4`
    FOREIGN KEY (`follower_id`)
    REFERENCES `ecommerce`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
