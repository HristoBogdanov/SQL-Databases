Create database klasni_students

use klasni_students

go

create table klasnir(
id int primary key,
name nvarchar(20),
surname nvarchar(20),
speciality nvarchar(30),
workage tinyint 
)

go

create table students(
id int primary key,
name nvarchar(20),
surname nvarchar(20),
klasni_id int Foreign key
references klasnir(id)
)

INSERT klasnir
VALUES (1,'Svetlana' , 'Stefanova' , 'Mathematics',30),
(2,'Svetlana' , 'Krusteva' , 'Sports',28),
(3,'Ani' , 'Kadieva' , 'Informatika',23),
(4,'Svetlana' , 'Nenkova' , 'BEL',24)


go

INSERT students
VALUES (1,'Alexandur','Glushkov',1),
(2,'Alexandur','Prodanov',1),
(3,'Alexandur','Bonchev',3),
(4,'Angel','Momov',3),
(5,'Bogdan','Minchev',1),
(6,'Alexandur','Popov',2),
(7,'Vencislav','Monev',2),
(8,'Aleksandra','Petrova',4),
(9,'Atina','Georgieva',4),
(10,'Viktoriq','Ivanova',2)


use klasni_students
SELECT st.name,st.surname,kl.name,kl.surname 
FROM students as st
JOIN klasnir as kl
ON kl.id=st.klasni_id
ORDER BY kl.name,kl.surname

go

SELECT st.name,st.surname,kl.name,kl.surname FROM students as st
JOIN klasnir as kl
ON st.klasni_id=kl.id
WHERE (kl.name='Svetlana')

go

SELECT st.name,st.surname,kl.name,kl.surname,kl.speciality FROM students as st
JOIN klasnir as kl
ON st.klasni_id=kl.id
WHERE(kl.speciality='BEL')

go

SELECT st.name,st.surname,kl.name,kl.surname,kl.workage FROM students as st
JOIN klasnir as kl
ON st.klasni_id=kl.id
WHERE(kl.workage<=28)

