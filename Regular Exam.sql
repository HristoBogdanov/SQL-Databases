use master
CREATE DATABASE TouristAgency

CREATE TABLE Countries(
Id INT PRIMARY KEY Identity,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Destinations(
Id INT PRIMARY KEY Identity,
[Name] NVARCHAR(50) NOT NULL,
CountryId INT NOT NULL FOREIGN KEY
REFERENCES Countries(Id) 
)

CREATE TABLE Rooms(
Id INT PRIMARY KEY Identity,
[Type] NVARCHAR(40) NOT NULL,
Price Decimal(18,2) NOT NULL,
BedCount INT NOT NULL
CHECK (BedCount > 0 AND BedCount <= 10)
)

CREATE TABLE Hotels(
Id INT PRIMARY KEY Identity,
[Name] NVARCHAR(50) NOT NULL,
DestinationId INT NOT NULL FOREIGN KEY
REFERENCES Destinations(Id)
)

CREATE TABLE Tourists(
Id INT PRIMARY KEY Identity,
[Name] NVARCHAR(80) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL,
Email VARCHAR(80),
CountryId INT NOT NULL FOREIGN KEY 
REFERENCES Countries(Id)
)

CREATE TABLE Bookings(
Id INT PRIMARY KEY Identity,
ArrivalDate DATETIME2 NOT NULL,
DepartureDate DATETIME2 NOT NULL,
AdultsCount INT NOT NULL
CHECK (AdultsCount >= 1 AND AdultsCount <= 10),
ChildrenCount INT NOT NULL
CHECK (ChildrenCount >= 0 AND ChildrenCount <= 9),
TouristId INT NOT NULL FOREIGN KEY 
REFERENCES Tourists(Id),
HotelId INT NOT NULL FOREIGN KEY
REFERENCES Hotels(Id),
RoomId INT NOT NULL FOREIGN KEY
REFERENCES Rooms(Id)
)

CREATE TABLE HotelsRooms(
HotelId INT NOT NULL FOREIGN KEY 
REFERENCES Hotels(Id),
RoomId INT NOT NULL FOREIGN KEY
REFERENCES Rooms(Id),
PRIMARY KEY(HotelId,RoomId)
)



INSERT INTO Tourists ([Name],PhoneNumber,Email,CountryId)
VALUES 
('John Rivers','653-551-1555','john.rivers@example.com',6),
('Adeline Aglaé','122-654-8726','adeline.aglae@example.com',2),
('Sergio Ramirez','233-465-2876','s.ramirez@example.com',3),
('Johan Müller','322-876-9826','j.muller@example.com',7),
('Johan Müller','322-876-9826','j.muller@example.com',7)

INSERT INTO Bookings(ArrivalDate,DepartureDate,AdultsCount,ChildrenCount,TouristId,HotelId,RoomId)
VALUES 
('2024-03-01','2024-03-11',1,0,21,3,5),
('2023-12-28','2024-01-06',2,1,22,13,3),
('2023-11-15','2023-11-20',1,2,23,19,7),
('2023-12-05','2023-12-09',4,0,24,6,4),
('2024-05-01','2024-05-07',6,0,25,14,6)


UPDATE Bookings
SET DepartureDate = DATEADD(DAY,1,DepartureDate)
WHERE DATEPART(YEAR,DepartureDate)=2023 AND DATEPART(MONTH,DepartureDate)=12

UPDATE Tourists
SET Email=NULL
WHERE [Name] LIKE '%MA%'


WITH TouristsToDelete AS (
    SELECT Id
    FROM Tourists
    WHERE Name LIKE '%Smith%'
)
DELETE FROM Bookings
WHERE TouristID IN (SELECT TouristID FROM TouristsToDelete);


WITH TouristsToDelete2 AS (
    SELECT Id
    FROM Tourists
    WHERE Name LIKE '%Smith%'
)
DELETE FROM Tourists
WHERE Id IN (SELECT Id FROM TouristsToDelete2);




DELETE FROM Bookings
WHERE TouristId IN (SELECT Id FROM Tourists WHERE [Name] LIKE '% Smith %');

DELETE FROM Tourists
WHERE [Name] LIKE '% Smith %';



SELECT FORMAT(ArrivalDate, 'yyyy-MM-dd') as ArrivalDate,AdultsCount,ChildrenCount
FROM Bookings b
JOIN Rooms r
ON b.RoomId=r.Id
ORDER BY r.Price DESC,ArrivalDate



SELECT h.Id, h.[Name]
FROM Hotels h
JOIN HotelsRooms hr ON h.Id = hr.HotelId
JOIN Rooms r ON hr.RoomId = r.Id
LEFT JOIN Bookings b ON h.Id = b.HotelId
WHERE r.[Type] = 'VIP Apartment'
GROUP BY h.Id, h.[Name]
ORDER BY COUNT(DISTINCT b.Id) DESC;




SELECT t.Id, t.[Name], t.PhoneNumber
FROM Tourists t
WHERE t.Id NOT IN (SELECT DISTINCT TouristId FROM Bookings)
ORDER BY t.[Name] ASC;


SELECT TOP 10 h.[Name] HotelName, d.[Name] DestinationName, c.[Name] CountryName
FROM Bookings b JOIN Hotels h
ON b.HotelId=h.Id JOIN Destinations d
ON h.DestinationId=d.Id JOIN Countries c
ON c.Id=d.CountryId
WHERE ArrivalDate<'2023-12-31 00:00:00.0000000' 
AND b.HotelId%2=1
ORDER BY c.[Name],ArrivalDate

SELECT h.[Name] AS HotelName, r.Price AS RoomPrice
FROM Hotels h
JOIN Bookings b ON h.Id=b.HotelId
 JOIN Rooms r ON b.RoomId = r.Id
 JOIN Tourists t ON b.TouristId = t.Id
WHERE t.[Name] NOT LIKE '%EZ'
ORDER BY r.Price DESC;


SELECT h.[Name] HotelName, SUM(r.Price*DATEDIFF(DAY,b.ArrivalDate,b.DepartureDate))HotelRevenue
FROM Bookings b JOIN Hotels h
ON h.Id=b.HotelId JOIN Rooms r
ON r.Id=b.RoomId
GROUP BY h.[Name]
ORDER BY HotelRevenue DESC

SELECT * FROM Bookings b JOIN Hotels h
ON b.HotelId=h.Id
ORDER BY h.Name




CREATE FUNCTION udf_RoomsWithTourists (@name NVARCHAR(40))
RETURNS INT
AS
BEGIN
    DECLARE @totalTourists INT;

    SELECT @totalTourists = SUM(ISNULL(b.AdultsCount, 0) + ISNULL(b.ChildrenCount, 0))
    FROM Bookings b
    JOIN Rooms r ON b.RoomId = r.Id
    WHERE r.[Type] = @name;

    RETURN @totalTourists;
END;

CREATE PROCEDURE usp_SearchByCountry
@country NVARCHAR(40)
AS
BEGIN
	SELECT t.[Name], t.PhoneNumber,t.Email,
	COUNT(b.TouristId) CountOfBookings
	FROM Countries c JOIN Tourists t
	ON t.CountryId=c.Id JOIN Bookings b
	ON b.TouristId=t.Id
	WHERE t.CountryId=(SELECT Id FROM Countries WHERE [Name]=@country)
	GROUP BY t.[Name], t.PhoneNumber,t.Email
	ORDER BY t.[Name],CountOfBookings
END


	