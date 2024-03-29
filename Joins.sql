SELECT COUNT(CUSTOMER_ID) FROM CUSTOMERS

SELECT JOB_ID, COUNT(EMPLOYEE_ID) FROM EMPLOYEES 
GROUP BY JOB_ID

SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES
WHERE MANAGER_ID=100

SELECT CUSTOMER_ID, COUNT(ORDER_ID) AS TOTAL
FROM ORDERS
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID)>3

-- JOIN QUARIES -- 

SELECT FNAME, LNAME, COUNT(ORDER_ID) AS TOTAL_ORDERS
FROM ORDERS O RIGHT JOIN CUSTOMERS C
ON O.CUSTOMER_ID=C.CUSTOMER_ID
GROUP BY FNAME,LNAME
ORDER BY TOTAL_ORDERS DESC

SELECT FNAME, LNAME, JOB_TITLE
FROM EMPLOYEES E JOIN JOBS J
ON J.JOB_ID=E.JOB_ID

SELECT C.FNAME,C.LNAME,CO.NAME,R.NAME
FROM CUSTOMERS C JOIN COUNTRIES CO
ON C.COUNTRY_ID=CO.COUNTRY_ID
JOIN REGIONS R
ON R.REGION_ID=CO.REGION_ID

SELECT C.FNAME,C.LNAME,SUM(OI.UNIT_PRICE*OI.QUANTITY) AS TOTAL_ORDERS_PRICE
FROM CUSTOMERS C JOIN ORDERS O
ON O.CUSTOMER_ID=C.CUSTOMER_ID
JOIN ORDER_ITEMS OI 
ON OI.ORDER_ID=O.ORDER_ID
JOIN PRODUCTS P
ON P.PRODUCT_ID=OI.PRODUCT_ID
GROUP BY C.FNAME,C.LNAME



SELECT C.FNAME,C.LNAME,SUM(OI.UNIT_PRICE*OI.QUANTITY) AS TOTAL_ORDERS_PRICE
FROM CUSTOMERS C JOIN ORDERS O
ON O.CUSTOMER_ID=C.CUSTOMER_ID
JOIN ORDER_ITEMS OI 
ON OI.ORDER_ID=O.ORDER_ID
JOIN PRODUCTS P
ON P.PRODUCT_ID=OI.PRODUCT_ID
GROUP BY C.FNAME,C.LNAME
HAVING SUM(OI.UNIT_PRICE*OI.QUANTITY)>10000


SELECT D.[NAME], COUNT(E.DEPARTMENT_ID) AS NUMBER_OF_EMPLOYEES
FROM DEPARTMENTS D JOIN EMPLOYEES E
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.[NAME]
HAVING COUNT(E.DEPARTMENT_ID)>5


SELECT D.[NAME], COUNT(E.DEPARTMENT_ID) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN COUNTRIES C
ON D.COUNTRY_ID=C.COUNTRY_ID
WHERE D.COUNTRY_ID IN ('US', 'DE')
GROUP BY D.[NAME]
HAVING COUNT(E.DEPARTMENT_ID)>5

SELECT P.NAME, SUM(OI.QUANTITY) AS TOTAL
FROM PRODUCTS P JOIN ORDER_ITEMS OI
ON OI.PRODUCT_ID=P.PRODUCT_ID
GROUP BY P.NAME
HAVING SUM(OI.QUANTITY)>1000
ORDER BY TOTAL DESC

SELECT E.FNAME+' '+E.LNAME AS EMPLOYEE, M.FNAME+' '+M.LNAME AS MANAGER
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGER_ID=M.EMPLOYEE_ID



SELECT FNAME,LNAME,SALARY
FROM EMPLOYEES
WHERE SALARY >(SELECT SALARY
				FROM EMPLOYEES
				WHERE FNAME='Peter' AND LNAME='Hall')


SELECT E.FNAME,E.LNAME, E.SALARY 
FROM EMPLOYEES E JOIN EMPLOYEES PH
ON E.SALARY>PH.SALARY
WHERE PH.FNAME='Peter' AND PH.LNAME='Hall'


SELECT FNAME,LNAME
FROM EMPLOYEES
WHERE SALARY>ANY(SELECT SALARY
				 FROM EMPLOYEES
				 WHERE DEPARTMENT_ID=80)


SELECT *
FROM EMPLOYEES
WHERE HIRE_DATE>ANY(SELECT HIRE_DATE
					FROM EMPLOYEES
					WHERE DEPARTMENT_ID=80)


SELECT *
FROM EMPLOYEES E
WHERE SALARY> ALL(SELECT MIN_SALARY
				 FROM JOBS J
				 WHERE MIN_SALARY IS NOT NULL)


SELECT FNAME,LNAME,HIRE_DATE,CONVERT(VARCHAR, HIRE_DATE,109) AS NEW_DATE
FROM EMPLOYEES

SELECT FNAME,LNAME
FROM EMPLOYEES
WHERE LNAME LIKE 'M%'

SELECT NAME
FROM COUNTRIES C JOIN CUSTOMERS CU
ON C.COUNTRY_ID=CU.COUNTRY_ID
UNION
SELECT C.NAME
FROM COUNTRIES C JOIN DEPARTMENTS D
ON C.COUNTRY_ID=D.COUNTRY_ID

SELECT FNAME 
FROM EMPLOYEES
INTERSECT
SELECT FNAME
FROM CUSTOMERS

SELECT DISTINCT FNAME
FROM EMPLOYEES
WHERE FNAME=ANY(SELECT FNAME FROM CUSTOMERS)

SELECT DISTINCT FNAME
FROM EMPLOYEES
WHERE EXISTS(SELECT FNAME FROM CUSTOMERS)

SELECT FNAME
FROM EMPLOYEES
EXCEPT
SELECT FNAME
FROM CUSTOMERS

SELECT C.NAME 
FROM COUNTRIES C
JOIN CUSTOMERS CU
ON C.COUNTRY_ID=CU.COUNTRY_ID
INTERSECT 
SELECT C.NAME
FROM COUNTRIES C
JOIN DEPARTMENTS D
ON C.COUNTRY_ID=D.COUNTRY_ID


SELECT O.ORDER_ID,ORDER_DATE,SUM(UNIT_PRICE*QUANTITY) AS TOTAL
FROM ORDERS O JOIN ORDER_ITEMS OI
ON O.ORDER_ID=OI.ORDER_ID
WHERE YEAR(ORDER_DATE)=2000
GROUP BY O.ORDER_ID,ORDER_DATE


SELECT O.ORDER_ID,ORDER_DATE,SUM(UNIT_PRICE*QUANTITY) AS TOTAL,
DATEADD(DAY,7,ORDER_DATE) AS PAID_DATE
FROM ORDERS O JOIN ORDER_ITEMS OI
ON O.ORDER_ID=OI.ORDER_ID
GROUP BY O.ORDER_ID,ORDER_DATE



