USE myLibs;

CREATE TABLE tbl_books (
	isbn		CHAR(13)	PRIMARY KEY,
    title		VARCHAR(255),
	link		VARCHAR(255),		
	image		VARCHAR(255),		
	author		VARCHAR(50),	
	price		BIGINT,
	discount	BIGINT,
	publisher	VARCHAR(255),
	description	VARCHAR(2000),
	pubdate	VARCHAR(20)
);