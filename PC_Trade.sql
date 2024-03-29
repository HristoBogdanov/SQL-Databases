CREATE DATABASE PCTRADE

USE PCTRADE

CREATE TABLE REGIONS
(
	REGION_ID SMALLINT PRIMARY KEY,
	[NAME] VARCHAR(25) NOT NULL
)

CREATE TABLE JOBS
(
	JOB_ID VARCHAR(10) PRIMARY KEY,
	JOB_TITLE VARCHAR(35) NOT NULL,
	MIN_SALARY NUMERIC(6) NULL,
	MAX_SALARY NUMERIC(6) NULL
)

CREATE TABLE PRODUCTS
(
	PRODUCT_ID INT PRIMARY KEY, 
	NAME VARCHAR(50) NOT NULL,
	PRICE NUMERIC(8,2) NOT NULL,
	DESCR VARCHAR(2000) NULL
)

CREATE TABLE COUNTRIES
(
	COUNTRY_ID CHAR(2) PRIMARY KEY,
	NAME VARCHAR(40) NOT NULL,
	REGION_ID SMALLINT FOREIGN KEY
	REFERENCES REGIONS(REGION_ID)
	ON DELETE SET NULL
)

CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID NUMERIC(6) PRIMARY KEY,
	COUNTRY_ID CHAR(2) FOREIGN KEY 
	REFERENCES COUNTRIES(COUNTRY_ID) NOT NULL,
	FNAME VARCHAR(20) NOT NULL,
	LNAME VARCHAR(20) NOT NULL,
	[ADDRESS] TEXT,
	EMAIL VARCHAR(30),
	GENDER CHAR(1)
)

ALTER TABLE CUSTOMERS 
ADD CONSTRAINT GENDER_CHECK 
CHECK (GENDER IS NULL OR GENDER IN ('F', 'M'))

CREATE TABLE DEPARTMENTS
(
	DEPARTMENT_ID INT PRIMARY KEY,
	[NAME] VARCHAR(30) NOT NULL,
	MANAGER_ID INT,
	COUNTRY_ID CHAR(2) NOT NULL FOREIGN KEY
	REFERENCES COUNTRIES(COUNTRY_ID),
	CITY VARCHAR(30) NOT NULL,
	[STATE] VARCHAR(25),
	[ADDRESS] VARCHAR(40),
	POSTAL_CODE VARCHAR(12)
)


CREATE TABLE EMPLOYEES
(
	EMPLOYEE_ID INT PRIMARY KEY,
	FNAME VARCHAR(20) NOT NULL,
	LNAME VARCHAR(25) NOT NULL,
	EMAIL VARCHAR(25) NOT NULL UNIQUE,
	PHONE VARCHAR(20),
	HIRE_DATE DATETIME NOT NULL,
	SALARY NUMERIC(8,2) NOT NULL,
	MANAGER_ID INT FOREIGN KEY
	REFERENCES EMPLOYEES(EMPLOYEE_ID),
	JOB_ID VARCHAR(10) NOT NULL FOREIGN KEY
	REFERENCES JOBS,
	DEPARTMENT_ID INT DEFAULT 1000 FOREIGN KEY
	REFERENCES DEPARTMENTS
	ON DELETE SET DEFAULT
)

ALTER TABLE DEPARTMENTS 
ADD FOREIGN KEY (MANAGER_ID)
REFERENCES EMPLOYEES


CREATE TABLE ORDERS
(
	ORDER_ID INT PRIMARY KEY,
	ORDER_DATE DATETIME NOT NULL,
	CUSTOMER_ID NUMERIC(6) NOT NULL FOREIGN KEY
	REFERENCES CUSTOMERS,
	EMPLOYEE_ID INT NOT NULL FOREIGN KEY
	REFERENCES EMPLOYEES,
	SHIP_ADDRESS VARCHAR(150)
)


CREATE TABLE ORDER_ITEMS
(
	ORDER_ID INT NOT NULL FOREIGN KEY
	REFERENCES ORDERS
	ON DELETE CASCADE,
	PRODUCT_ID INT NOT NULL FOREIGN KEY
	REFERENCES PRODUCTS,
	UNIT_PRICE NUMERIC(8,2) NOT NULL,
	QUANTITY NUMERIC(8) NOT NULL
)

