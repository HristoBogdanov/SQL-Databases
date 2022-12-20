CREATE DATABASE Deliveres_articles
use Deliveres_articles

go

Create Table deliveres(
id int Primary key,
name_deliverers nvarchar(30),
phone char(10)
)

go

Create table articles(
id int Primary key,
name nvarchar(20),
price decimal,
id_deliverer int FOREIGN KEY
REFERENCES deliveres(id)
)

go

INSERT articles
VALUES (100, 'article 1',90.30, 5),
       (101, 'article 2', 120.99, 5),
	   (102, 'article 3', 199.99,5),
	   (103, 'article 4', 29.69, 3),
	   (104, 'article 5',69.89,3),
	   (105,'article 6', 89.99,1),
	   (106,'article 7',749.99,1),
	   (107,'article 8', 199.99,2),
	   (108,'article 9', 259.59,2),
	   (109,'article 10', 99.99,4),
	   (110,'article 11', 999.99,1),
	   (111,'article 12', 329.99,1),
	   (112,'article 13', 35.99,4)


go

INSERT deliveres
VALUES (1, 'Deliverer 1', '0898741245'),
       (2,'Deliverer 2', '0887123654'),
	   (3, 'Deliverer 3', '0899789654'),
	   (4, 'Deliverer 4', '0883214561'),
         (5, 'Deliverer 5', '0867551592')


go

USE Deliveres_articles

SELECT COUNT (*) FROM articles WHERE (id_deliverer=4)

go

SELECT SUM (price) FROM articles WHERE (id_deliverer=1)

go

SELECT AVG (price) FROM articles

go

SELECT MAX (price) FROM articles 

go

SELECT MIN (price) FROM articles 

go

SELECT id_deliverer FROM articles WHERE(name = 'article 5')

go

SELECT name FROM articles WHERE(id_deliverer=1 OR id_deliverer=5)

go


ALTER TABLE articles
ADD belejkii nvarchar(20)

UPDATE articles 
SET belejkii = 'hair product' WHERE (id=100)

go

UPDATE articles 
SET belejkii = 'body product' WHERE (id=107)

go

UPDATE articles 
SET belejkii = 'family product' WHERE (id=110)


go

SELECT COUNT (*) FROM articles WHERE (belejkii <> null)


go

SELECT art.name,art.price,art.id_deliverer,del.name_deliverers,del.phone FROM deliveres as del
JOIN articles as art 
ON del.id=art.id_deliverer
GROUP BY del.name_deliverers,art.name,art.price,art.id_deliverer,del.phone

go

SELECT art.name,del.name_deliverers FROM articles as art 
JOIN deliveres as del
ON art.id_deliverer=del.id
WHERE(del.name_deliverers='Deliverer 3')

go

SELECT art.name,del.name_deliverers FROM articles as art 
JOIN deliveres as del
ON del.id=art.id_deliverer
GROUP BY del.name_deliverers,art.name