CREATE DATABASE Students_exams

use Students_exams

CREATE TABLE Students(
ime nvarchar(20) not null,
fak_nomer int Primary Key,
prezime nvarchar(20)not null,
familiq nvarchar(20)not null,
speciality nvarchar(30)not null
)

CREATE TABLE Exams(
exam_id int Primary Key,
name_predmet nvarchar(30),
place nvarchar(30),
dataa DATE
)

CREATE TABLE Students_Exams(
id_student int FOREIGN KEY 
REFERENCES Students(fak_nomer),
id_exam int FOREIGN KEY
REFERENCES Exams(exam_id)
)

go

INSERT students(fak_nomer, ime,prezime,familiq,speciality)
VALUES (1, 'Alexander', 'Grigorov', 'Simov', 'Mathematics'),
(2, 'Alexander', 'Stanimirov', 'Mitev', 'information systems'),
(3, 'Anastasia', 'Nikolaeva', 'Nedyalkova', 'mathematics'),
(4, 'Burke', 'Denislavov', 'Bodurov', 'Informatics'),
(5, 'Boyan', 'Stanimirov', 'Marinov', 'Informatics'),
(6, 'Vasilena', 'Petkova', 'Stoyanova', 'information systems'),
(7, 'Victor', 'Bonev', 'Glushkov', 'Applied Physics'),
(8, 'Victor', 'Kaloyanov', 'Nedelchev', 'mathematics'),
(9, 'Victoria', 'Vladislavova', 'Dimitrova', 'Applied Physics'),
(10, 'Victoria', 'Marianova', 'Ilieva', 'information systems'),
(11, 'Vladimir', 'Svetlozarov', 'Stoyanov', 'information systems'),
(12, 'Vladislav', 'Vladimirov', 'Gagov', 'mathematics'),
(13, 'Georgi', 'Atanasov', 'Kostov', 'Applied Physics'),
(14, 'Georgi', 'Ognyanov', 'Kirev', 'mathematics'),
(15, 'David', 'Zhivkov', 'Kirilov', 'information systems'),
(16, 'Daria', 'Valentinova', 'Taneva', 'Applied Physics'),
(17, 'Dimitar', 'Stoyanov', 'Dimitrov', 'mathematics'),
(18, 'Dragomir', 'Marinov', 'Kirilov', 'mathematics'),
(19, 'Emanuel', 'Nikolaev', 'Tsvetkov', 'information systems'),
(20, 'Emil', 'Georgiev', 'Smilov', 'Applied Physics'),
(21, 'Zhiveslav', 'Dimitrov', 'Vlasakiev', 'information systems'),
(22, 'Ivayla', 'Georgieva', 'Atanasova', 'Applied Physics'),
(23, 'Ivaylo', 'Krasimirov', 'Dimov', 'mathematics'),
(24, 'Ivaylo', 'Petkov', 'Dimitrov', 'mathematics'),
(25, 'Kaloyan', 'Dimitrov', 'Dryanov', 'information systems'),
(26, 'Kaloyan', 'Ivaylov', 'Hristov', 'Applied Physics'),
(27, 'Kaloyan', 'Krasimirov', 'Stratiev', 'Applied Physics'),
(28, 'Christian', 'Ivanov', 'Angelov', 'mathematics'),
(29, 'Liliana', 'Svetoslavova', 'Koseva', 'information systems'),
(30, 'Lachezar', 'Dobrinov', 'Georgiev', 'information systems'),
(31, 'Lubomir', 'Zlatev', 'Bozhilov', 'Applied Physics'),
(32, 'Maxim', 'Nikolaev', 'Gospodinov', 'information systems'),
(33, 'Marian', 'Stoyanov', 'Ivanov', 'information systems'),
(34, 'Martin', 'Andreev', 'Tonev', 'mathematics'),
(35, 'Martina', 'Dinkova', 'Koleva', 'Applied Physics'),
(36, 'Mikhail', 'Emilov', 'Dimov', 'mathematics'),
(37, 'Momchil', 'Hassan', 'Ramzi', 'information systems'),
(38, 'Monica', 'Ivaylova', 'Toteva', 'mathematics'),
(39, 'Nicole', 'Slavova', 'Dinkova', 'Applied Physics'),
(40, 'Nikola', 'Vassilev', 'Zhelyazkov', 'information systems'),
(41, 'Nikola', 'Nikolaev', 'Basamakov', 'information systems'),
(42, 'Nikolina', 'Tuncai', 'Memed', 'Applied Physics'),
(43, 'Nikolai', 'Todorov', 'Iliev', 'mathematics'),
(44, 'Nikoleta', 'Mikhailova', 'Georgieva', 'mathematics'),
(45, 'Pavel', 'Erolov', 'Komarev', 'information systems'),
(46, 'Peter', 'Atanasov', 'Gospodinov', 'Applied Physics'),
(47, 'Svetlin', 'Filipov', 'Khlebarov', 'mathematics'),
(48, 'Svetoslav', 'Nikolaev', 'Petkov', 'information systems'),
(49, 'Siana', 'Ivanova', 'Kovacheva', 'Applied Physics'),
(50, 'Stefana', 'Dinkova', 'Dimova', 'Applied physics'),
(51, 'Fatme', 'Beihan', 'Uidun', 'information systems'),
(52, 'Theodore', 'Danielov', 'Hristov', 'Mathematics');


go

INSERT exams
VALUES (1, 'Mathematical Analysis', 'Hall 1', '2021-12-19'),
       (2, 'analytical geometry', 'hall 2', '2021-12-1'),
(3, 'Informatics Part 1', 'CC 1', '2021-12-5'),
(4, 'mechanics', 'hall 3', '2021-12-10'),
(5, 'programming - C ++', 'CC 2', '2021-12-20'),
(6, 'complex analysis', 'hall 4', '2021-12-15')

INSERT Students_Exams
VALUES (1, 1),(1, 6),(1, 2),(2, 2),(2,5),(3, 1),(3,3),(3,5),(3,4),(4,2),(4,6),(4,1),(5,2),(5,3),(5,6),
	   (6,2),(6,3),(7,1),(7,3),(7,5),(8,2),(8,4),(8,6),(9,2),(9,6),(10,6),(10,3),
	   (11,3),(12,6),(12,4),(13,2),(13,5),(14,3),(14,6),(15,1),(15,4),(16,3),(16,4),(17,3),
	   (18,2),(19,5),( 19,6), (20,4),(20,5),(21,1),(21,4),(22,3),(22,6),(23,6),(23,5),(24,3),
	   (25,3),(25,1),(26,4),(27,6),(27,5),(27,1),(28,2),(28,4),(28,5),(29,3),(30,5),(31,5),(32,6),
	   (32,4),(33,1),(33,6),(33,3),(33,4),(33,5),(33,2),(34,2),(35,1),(36,5),(37,1),(37,2),(37,5),
	   (38,4),(39,2),(39,6),(40,6),(41,1),(42,5),(42,3),(43,3),(43,6),(43,1),(44,2),(45,6),(47,3),
	   (48,4),(48,1),(49,1),(49,6),(50,1),(50,5),(51,4),(52,4)


go


use Students_exams
SELECT ime,familiq from Students 
WHERE(speciality='information systems')

go

SELECT ime,familiq from Students 
WHERE(speciality='Applied Physics')

go

SELECT ime,familiq from Students 
WHERE(speciality='Mathematics')

go

SELECT ime,prezime,familiq from Students
ORDER BY ime DESC,prezime ASC,familiq DESC


go
SELECT st.ime,st.familiq,ex.exam_id,ex.name_predmet,ex.dataa FROM Students as st
JOIN Students_Exams as stex
ON st.fak_nomer=stex.id_student
JOIN Exams as ex 
ON ex.exam_id=stex.id_exam


go

SELECT st.ime,st.familiq,st.speciality,ex.name_predmet,ex.dataa FROM Students as st
JOIN Students_Exams as stex 
ON st.fak_nomer=stex.id_student
JOIN Exams as ex 
ON ex.exam_id=stex.id_exam
WHERE (st.ime='Nikolai' AND st.prezime='Todorov')

go

SELECT st.ime,st.familiq,st.speciality,ex.name_predmet,ex.dataa FROM Students as st
JOIN Students_Exams as stex
ON st.fak_nomer=stex.id_student
JOIN Exams as ex
ON ex.exam_id=stex.id_exam
WHERE(ex.dataa='2021-12-15')
GROUP BY ex.name_predmet,ex.dataa,st.ime,st.familiq,st.speciality 



