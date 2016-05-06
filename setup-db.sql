CREATE DATABASE IF NOT EXISTS library DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON library.* TO 'library'@'localhost' IDENTIFIED BY 'V!OSvw^4QMY:Q4F+G';
USE library;

CREATE TABLE IF NOT EXISTS user (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pesel VARCHAR(11) NOT NULL,
	password VARCHAR(255) NOT NULL,
	name VARCHAR(32) NOT NULL,
	surname VARCHAR(32) NOT NULL,
	town VARCHAR(64) NOT NULL,
	postCode VARCHAR(5) NOT NULL,
	street VARCHAR(32) NOT NULL,
	houseNumber VARCHAR(10) NOT NULL,
	permission TINYINT(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS publisher (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(64) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS book (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	isbn VARCHAR(32) NOT NULL,
	title VARCHAR(128) NOT NULL,
	publicationYear VARCHAR(4) NOT NULL,
	publisher INT UNSIGNED NOT NULL,
	status TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
	description VARCHAR(512),
	FOREIGN KEY (publisher) REFERENCES publisher(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS writer (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(32) NOT NULL,
	surname VARCHAR(32) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS author (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	book INT UNSIGNED NOT NULL,
	writer INT UNSIGNED NOT NULL,
	FOREIGN KEY (book) REFERENCES book(id),
	FOREIGN KEY (writer) REFERENCES writer(id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS reservation (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	reserver INT UNSIGNED NOT NULL,
	book INT UNSIGNED NOT NULL,
	status TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
	description VARCHAR(512),
	FOREIGN KEY (reserver) REFERENCES user(id),
	FOREIGN KEY (book) REFERENCES book(id)
) ENGINE=InnoDB;

-- Some default users
INSERT IGNORE INTO user (id, pesel, password, name, surname, town, postCode, street, houseNumber, permission) VALUES
(1, '0', '$2y$11$imUZili8Mlb4cGuH2rel/eWJ9sG1a/O6Nd.p944hh1NpOmvzqCha6', 'Charlie', 'Root', 'Debug Valley', '00000', 'Test', '1', 1),
(2, '1', '$2y$11$/ArvUc3R1RqjRh8k4Ptuxe6sZuzvg36FGx0geSvwVhrwdvsOSfgjG', 'Lame', 'User', 'Debug Valley', '00000', 'Test', '2', 0);
