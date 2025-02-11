-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8mb4 ;
USE `blog` ;

-- -----------------------------------------------------
-- Table `blog`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`categorias` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK9qte5svl2i6n82lpdyyheoi1h` (`nome` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `blog`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`usuarios` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `criado_em` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(100) NOT NULL,
  `google_id` VARCHAR(255) NULL DEFAULT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `tipo` ENUM('ADMIN', 'MOD', 'USUARIO') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UKkfsp0s1tflm1cwlj8idhqsad0` (`email` ASC),
  UNIQUE INDEX `UK69mcqeeg7pulu0ouige5ytybm` (`google_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `blog`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`posts` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `atualizado_em` DATETIME(6) NULL DEFAULT NULL,
  `conteudo` TINYTEXT NOT NULL,
  `criado_em` DATETIME(6) NULL DEFAULT NULL,
  `imagem_url` VARCHAR(255) NULL DEFAULT NULL,
  `video_url` VARCHAR(255) NULL DEFAULT NULL,
  `categoria_id` BIGINT(20) NOT NULL,
  `usuario_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK7tmopttp2y52o6g2ykslryni5` (`categoria_id` ASC),
  INDEX `FKsw0f5g0937m4w1rmmpmbvoyev` (`usuario_id` ASC),
  CONSTRAINT `FK7tmopttp2y52o6g2ykslryni5`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `blog`.`categorias` (`id`),
  CONSTRAINT `FKsw0f5g0937m4w1rmmpmbvoyev`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `blog`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `blog`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`comentarios` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `conteudo` TINYTEXT NOT NULL,
  `criado_em` DATETIME(6) NOT NULL,
  `post_id` BIGINT(20) NOT NULL,
  `usuario_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKakyu93p9g5jcjfufxujiunr30` (`post_id` ASC),
  INDEX `FKdts62yj83qe3k748cgcjvm48r` (`usuario_id` ASC),
  CONSTRAINT `FKakyu93p9g5jcjfufxujiunr30`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`posts` (`id`),
  CONSTRAINT `FKdts62yj83qe3k748cgcjvm48r`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `blog`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `blog`.`compartilhamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`compartilhamentos` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `criado_em` DATETIME(6) NULL DEFAULT NULL,
  `plataforma` ENUM('FACEBOOK', 'INSTAGRAM', 'LINKEDIN', 'TWITTER') NOT NULL,
  `post_id` BIGINT(20) NOT NULL,
  `usuario_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK4nav6a4oks3j5pm16q8gnkkyt` (`post_id` ASC),
  INDEX `FKhofk1ubic7r1ebooj043cl4xq` (`usuario_id` ASC),
  CONSTRAINT `FK4nav6a4oks3j5pm16q8gnkkyt`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`posts` (`id`),
  CONSTRAINT `FKhofk1ubic7r1ebooj043cl4xq`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `blog`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `blog`.`curtidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blog`.`curtidas` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `criado_em` DATETIME(6) NULL DEFAULT NULL,
  `post_id` BIGINT(20) NOT NULL,
  `usuario_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKf00pug2etslb4y3qhosx0x3dk` (`post_id` ASC),
  INDEX `FK8stnn0bnoa9uja4106pq7anuj` (`usuario_id` ASC),
  CONSTRAINT `FK8stnn0bnoa9uja4106pq7anuj`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `blog`.`usuarios` (`id`),
  CONSTRAINT `FKf00pug2etslb4y3qhosx0x3dk`
    FOREIGN KEY (`post_id`)
    REFERENCES `blog`.`posts` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
