CREATE DATABASE Rodnini
use Rodnini

CREATE TABLE Gradove(
id int PRIMARY KEY,
name_grad NVARCHAR
)

CREATE TABLE People(
id int PRIMARY KEY,
name_ppl NVARCHAR,
lastname NVARCHAR,
tel NVARCHAR,
adres NVARCHAR,
id_grad int FOREIGN KEY 
REFERENCES Gradove(id)
)

go

INSERT Gradove(id,name_grad)
VALUES (1, 'Sofia'),
       (2, 'Harmanli'),
		(3, 'Madzharovo'),

   (4, 'Plovdiv'),

   (5, 'Ruse'),

   (6, 'Varna'),

   (7, 'Burgas'),

   (8, 'Smolyan'),

   (9, 'Shiroka Laka'),

   (10, 'Stara Zagora')

   go

    INSERT people  

 VALUES (1,'Ралица','Георгиева','0898147258','кв. Люлин 5 бл. 14 бх. е',1), 

        (2,'Даниел','Пламенов','0897123654','кв. Овча купел бл. 123 вх.А',1), 

(3,'Иван','Костадинов','0878159753','ул. Старозагорска бл.1 вх.Б',10), 

(4,'Пепа','Илиева','0898552244','ул. Усмивка 3',9), 

(5,'Христина','Димотрова','0898108210','кв. Невястата бл. 4 бх. В',8), 

(6,'Анна','Лекова','0878422668','кв. Райково бл.1 вх. А',8), 

(7,'Сава','Петров','0898172839','ул. Даме Груев 10',4), 

(8,'Петър','Иванов','0886232125','ул. Гоце Делчев 5',4) 