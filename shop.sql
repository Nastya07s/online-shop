-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema shop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-- -----------------------------------------------------
-- Table `shop`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`category` (
  `idcategory` INT NOT NULL,
  `categoryname` VARCHAR(45) NULL,
  PRIMARY KEY (`idcategory`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`size`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`size` (
  `idsize` INT NOT NULL,
  `sizetype` VARCHAR(5) NULL,
  PRIMARY KEY (`idsize`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`color` (
  `idcolor` INT NOT NULL,
  `colorname` VARCHAR(45) NULL,
  PRIMARY KEY (`idcolor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shop`.`good`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`good` (
  `idgood` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `price` INT NOT NULL,
  `stock_presence` TINYINT NULL,
  `img` VARCHAR(45) NULL,
  `idcategory` INT NULL,
  `idsize` INT NULL,
  `idcolor` INT NULL,
  PRIMARY KEY (`idgood`),
  INDEX `idcategory_idx` (`idcategory` ASC) VISIBLE,
  INDEX `idsize_idx` (`idsize` ASC) VISIBLE,
  INDEX `idcolor_idx` (`idcolor` ASC) VISIBLE,
  CONSTRAINT `idcategory`
    FOREIGN KEY (`idcategory`)
    REFERENCES `shop`.`category` (`idcategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idsize`
    FOREIGN KEY (`idsize`)
    REFERENCES `shop`.`size` (`idsize`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcolor`
    FOREIGN KEY (`idcolor`)
    REFERENCES `shop`.`color` (`idcolor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `shop`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`category` (`idcategory`, `categoryname`) VALUES (1, 'Men');
INSERT INTO `shop`.`category` (`idcategory`, `categoryname`) VALUES (2, 'Women');
INSERT INTO `shop`.`category` (`idcategory`, `categoryname`) VALUES (3, 'Kids');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shop`.`size`
-- -----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`size` (`idsize`, `sizetype`) VALUES (1, 'XS');
INSERT INTO `shop`.`size` (`idsize`, `sizetype`) VALUES (2, 'S');
INSERT INTO `shop`.`size` (`idsize`, `sizetype`) VALUES (3, 'M');
INSERT INTO `shop`.`size` (`idsize`, `sizetype`) VALUES (4, 'L');
INSERT INTO `shop`.`size` (`idsize`, `sizetype`) VALUES (5, 'XL');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shop`.`color`
-- -----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`color` (`idcolor`, `colorname`) VALUES (1, 'Black');
INSERT INTO `shop`.`color` (`idcolor`, `colorname`) VALUES (2, 'White');
INSERT INTO `shop`.`color` (`idcolor`, `colorname`) VALUES (3, 'Floral');
INSERT INTO `shop`.`color` (`idcolor`, `colorname`) VALUES (4, 'Pink');

COMMIT;


-- -----------------------------------------------------
-- Data for table `shop`.`good`
-- -----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`good` (`idgood`, `name`, `description`, `price`, `stock_presence`, `img`, `idcategory`, `idsize`, `idcolor`) VALUES (1, 'T-shirt', 'jcknsdfklkl', 333, true, 'app/img/tshirt.webp', 1, 2, 2);
INSERT INTO `shop`.`good` (`idgood`, `name`, `description`, `price`, `stock_presence`, `img`, `idcategory`, `idsize`, `idcolor`) VALUES (2, 'Pants', 'sljkgnf', 22, true, 'app/img/pants-desert.jpg', 1, 3, 4);

COMMIT;

