-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(100) NULL,
  `client_address` VARCHAR(255) NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE INDEX `client_id_UNIQUE` (`client_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `order_id` INT NOT NULL,
  `order_date` DATETIME NULL,
  `client_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_clients_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_clients`
    FOREIGN KEY (`client_id`)
    REFERENCES `mydb`.`Clients` (`client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order_Details` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`),
  INDEX `fk_order_details_products_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_orders`
    FOREIGN KEY (`order_id`)
    REFERENCES `mydb`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
