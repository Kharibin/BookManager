USE test;
DROP TABLE IF EXISTS book;
CREATE TABLE `book` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(100) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  `author`      VARCHAR(100) NOT NULL,
  `isbn`        VARCHAR(20)  NOT NULL,
  `printYear`   INT(11)      NOT NULL,
  `readAlready` TINYINT(1)   NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 0
  DEFAULT CHARSET = utf8;

INSERT INTO `test`.`book`
(`title`,
 `description`,
 `author`,
 `isbn`,
 `printYear`)
VALUES
  ("Title0", "description0", "author0", "isbn0", 0),
  ("Title1", "description1", "author1", "isbn1", 1),
  ("Title2", "description2", "author2", "isbn2", 2),
  ("Title3", "description3", "author3", "isbn3", 3),
  ("Title4", "description4", "author4", "isbn4", 4),
  ("Title5", "description5", "author5", "isbn5", 5),
  ("Title6", "description6", "author6", "isbn6", 6),
  ("Title7", "description7", "author7", "isbn7", 7),
  ("Title8", "description8", "author8", "isbn8", 8),
  ("Title9", "description9", "author9", "isbn9", 9),
  ("Title10", "description10", "author10", "isbn10", 10),
  ("Title11", "description11", "author11", "isbn11", 11),
  ("Title12", "description12", "author12", "isbn12", 12),
  ("Title13", "description13", "author13", "isbn13", 13),
  ("Title14", "description14", "author14", "isbn14", 14),
  ("Title15", "description15", "author15", "isbn15", 15),
  ("Title16", "description16", "author16", "isbn16", 16),
  ("Title17", "description17", "author17", "isbn17", 17),
  ("Title18", "description18", "author18", "isbn18", 18),
  ("Title19", "description19", "author19", "isbn19", 19),
  ("Title20", "description20", "author20", "isbn20", 20),
  ("Title21", "description21", "author21", "isbn21", 21),
  ("Title22", "description22", "author22", "isbn22", 22),
  ("Title23", "description23", "author23", "isbn23", 23),
  ("Title24", "description24", "author24", "isbn24", 24),
  ("Title25", "description25", "author25", "isbn25", 25),
  ("Title26", "description26", "author26", "isbn26", 26),
  ("Title27", "description27", "author27", "isbn27", 27),
  ("Title28", "description28", "author28", "isbn28", 28),
  ("Title29", "description29", "author29", "isbn29", 29),
  ("Title30", "description30", "author30", "isbn30", 30),
  ("Title31", "description31", "author31", "isbn31", 31),
  ("Title32", "description32", "author32", "isbn32", 32),
  ("Title33", "description33", "author33", "isbn33", 33),
  ("Title34", "description34", "author34", "isbn34", 34);


