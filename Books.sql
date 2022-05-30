create SCHEMA literature;

USE literature;


CREATE TABLE books(
title VARCHAR(60) NOT NULL,
author VARCHAR(25),
word_count INT,
views INT,
primary key(title)
);


SELECT * FROM books;
INSERT INTO books(title, author, word_count, views) VALUES
("Best Paint Colors", "Maria Charlotte", 814, 14),
("Small Space Decorating Tips", "Juan Perez", 1146, 221),
("Hot Accessories", "Maria Charlotte", 986, 105),
("Mixing Textures", "Maria Charlotte", 765, 22),
("Kitchen Refresh", "Juan Perez", 1242, 307),
("Homemade Art Hacks", "Maria Charlotte", 1002, 193),
("Refinishing Wood Floors", "Gemma Alcocer", 1571, 7542);




