CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000 
AS
BEGIN
	SELECT FirstName,LastName
	FROM Employees
	WHERE Salary>35000
END


CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber
	@salary DECIMAL(18,4)
AS 
BEGIN
	SELECT FirstName [First Name], LastName [Last Name]
	FROM Employees
	WHERE Salary>=@salary
END


CREATE PROCEDURE usp_GetTownsStartingWith
	@start NVARCHAR(20)
AS 
BEGIN
	SELECT [Name] Town
	FROM Towns
	WHERE LEFT([Name],LEN(@start))=@start
END



CREATE PROCEDURE usp_GetEmployeesFromTown
	@townName NVARCHAR(20)
AS 
BEGIN
	SELECT e.FirstName [First Name]
		   ,e.LastName [Last Name]
	FROM Employees e JOIN Addresses a
	ON e.AddressID=a.AddressID
	JOIN Towns t ON a.TownID=t.TownID
	WHERE t.[Name]=@townName
END


CREATE FUNCTION ufn_GetSalaryLevel(@salary DECIMAL(18,4))
RETURNS VARCHAR(10)
AS 
BEGIN
	DECLARE @level VARCHAR(10)
	IF @salary<30000
	SET @level='Low'
	ELSE IF @salary>=30000 AND @salary<=50000
	SET @level='Average'
	ELSE 
	SET @level='High'

	RETURN @level
END



CREATE PROCEDURE usp_EmployeesBySalaryLevel
	@salaryLevel VARCHAR(10)
AS 
BEGIN
	SELECT FirstName [First Name]
		  ,LastName [Last Name]
	FROM Employees
	WHERE dbo.ufn_GetSalaryLevel(Salary)=@salaryLevel
END



CREATE FUNCTION ufn_IsWordComprised (@setOfLetters NVARCHAR(255), @word NVARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @result BIT = 1;
    DECLARE @letterCount INT = LEN(@word);
    DECLARE @i INT = 1;

    WHILE @i <= @letterCount
    BEGIN
        DECLARE @currentLetter NVARCHAR(1) = SUBSTRING(@word, @i, 1);
        IF CHARINDEX(@currentLetter, @setOfLetters) = 0
        BEGIN
            SET @result = 0;
            BREAK;
        END
        SET @i = @i + 1;
    END

    RETURN @result;
END