SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`users` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `alias` VARCHAR(255) NOT NULL ,
  `email` VARCHAR(255) NOT NULL ,
  `password` VARCHAR(255) NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() ON UPDATE NOW() ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` TEXT NOT NULL ,
  `description` VARCHAR(255) NOT NULL ,
  `price` FLOAT NOT NULL ,
  `inventory` INT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() ON UPDATE NOW() ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`images` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `product_id` INT NOT NULL ,
  `url` VARCHAR(255) NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT NOW() ON UPDATE NOW() ,
  PRIMARY KEY (`id`, `product_id`) ,
  INDEX `fk_images_products1_idx` (`product_id` ASC) ,
  CONSTRAINT `fk_images_products1`
    FOREIGN KEY (`product_id` )
    REFERENCES `ecommerce`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`addresses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`addresses` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `line_1` TEXT NOT NULL ,
  `line_2` TEXT NOT NULL ,
  `city` TEXT NOT NULL ,
  `state` TEXT NOT NULL ,
  `zip` INT NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT now() on update now() ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`billlings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`billlings` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`billlings` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `address_id` INT NOT NULL ,
  `card` INT NOT NULL ,
  `expires` VARCHAR(45) NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT now() on update now() ,
  PRIMARY KEY (`id`, `address_id`) ,
  INDEX `fk_addresses_idx` (`address_id` ASC) ,
  CONSTRAINT `fk_addresses`
    FOREIGN KEY (`address_id` )
    REFERENCES `ecommerce`.`addresses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`orders` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `billIng_id` INT NOT NULL ,
  `shipping_id` INT NOT NULL ,
  `status` INT NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT now() on update now() ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_billing_idx` (`billIng_id` ASC) ,
  INDEX `fk_shipping_idx` (`shipping_id` ASC) ,
  CONSTRAINT `fk_billings`
    FOREIGN KEY (`billIng_id` )
    REFERENCES `ecommerce`.`billlings` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shipping`
    FOREIGN KEY (`shipping_id` )
    REFERENCES `ecommerce`.`addresses` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`categories` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type` TEXT NOT NULL ,
  `name` TEXT NOT NULL ,
  `created_at` TIMESTAMP NULL ,
  `updated_at` TIMESTAMP NULL DEFAULT now() on update now() ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products_categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products_categories` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`products_categories` (
  `product_id` INT NOT NULL ,
  `category_id` INT NOT NULL ,
  PRIMARY KEY (`product_id`, `category_id`) ,
  INDEX `fk_products_has_categories_categories1_idx` (`category_id` ASC) ,
  INDEX `fk_products_has_categories_products_idx` (`product_id` ASC) ,
  CONSTRAINT `fk_products_has_categories_products`
    FOREIGN KEY (`product_id` )
    REFERENCES `ecommerce`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_categories_categories1`
    FOREIGN KEY (`category_id` )
    REFERENCES `ecommerce`.`categories` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`products_orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ecommerce`.`products_orders` ;

CREATE  TABLE IF NOT EXISTS `ecommerce`.`products_orders` (
  `product_id` INT NOT NULL ,
  `order_id` INT NOT NULL ,
  PRIMARY KEY (`product_id`, `order_id`) ,
  INDEX `fk_products_has_orders_orders1_idx` (`order_id` ASC) ,
  INDEX `fk_products_has_orders_products1_idx` (`product_id` ASC) ,
  CONSTRAINT `fk_products_has_orders_products1`
    FOREIGN KEY (`product_id` )
    REFERENCES `ecommerce`.`products` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_orders_orders1`
    FOREIGN KEY (`order_id` )
    REFERENCES `ecommerce`.`orders` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ecommerce` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
