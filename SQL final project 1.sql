/*1.	Create a database named employee, then import data_science_team.csv proj_table.csv
 and emp_record_table.csv into the employee database from the given resources.*/
 
create database employee;

-- 2.	Create an ER diagram for the given employee database.
-- screenshot is updated in the word file

/* 3.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT
 from the employee record table, and make a list of employees and details of their department.*/
 use employee;
SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT
FROM
    emp_record_table;

/* 4.	Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 
●	less than two
●	greater than four 
●	between two and four */

-- lesss   than 2

SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    emp_record_table
WHERE
    EMP_RATING <2 ;
    
 -- greater than 4 
 
 SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    emp_record_table
WHERE
    EMP_RATING >4;
    
-- between 2 and 4

SELECT 
    EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING
FROM
    emp_record_table
WHERE
   EMP_RATING  between 2 and 4;
    
    
/*5.	Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department 
from the employee table and then give the resultant column alias as NAME.*/

select FIRST_NAME,LAST_NAME,DEPT,concat_ws('  ',FIRST_NAME,LAST_NAME ) as NAME
from emp_record_table
where DEPT = 'Finance';

/* 6.	Write a query to list only those employees who have someone reporting to them.
 Also, show the number of reporters (including the President).*/
 
SELECT 
    e1.EMP_ID,
    e1.ROLE,
    e1.FIRST_NAME,
    COUNT(e2.MANAGER_ID) AS no_of_reporters
FROM
    emp_record_table AS e1
        LEFT JOIN
    emp_record_table AS e2 ON e1.EMP_ID = e2.MANAGER_ID
GROUP BY EMP_ID , FIRST_NAME,role
HAVING COUNT(e2.MANAGER_ID) > 0;

/* 7.	Write a query to list down all the employees from the healthcare and finance departments using union. 
Take data from the employee record table.*/


select FIRST_NAME,DEPT
from emp_record_table
 where DEPT='healthcare'
union
select FIRST_NAME,DEPT
from emp_record_table
WHERE DEPT='Finance';


/*8.	Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. 
Also include the respective employee rating along with the max emp rating for the department.*/

SELECT 
    EMP_ID,
    FIRST_NAME,
    LAST_NAME,
    ROLE,
    DEPT,
    EMP_RATING,
    (SELECT 
            MAX(EMP_RATING)
        FROM
            emp_record_table e2
        WHERE
            e2.DEPT = e.DEPT) AS max_rating
FROM
    emp_record_table e;
    
    
    /*9.	Write a query to calculate the minimum and the maximum salary of the employees in each role.
    Take data from the employee record table.*/
    
   SELECT 
    ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM
    emp_record_table
GROUP BY ROLE;

/* 10.	Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.*/


select EMP_ID,EXP,
RANK() OVER(ORDER BY EXP DESC) AS rank_exp
from emp_record_table;

/* 11.	Write a query to create a view that displays employees in various countries whose salary is more than six thousand.
 Take data from the employee record table.*/
 
 create view high_employees as 
 select EMP_ID,FIRST_NAME,SALARY
 from emp_record_table
 where SALARY >6000;
 
select * from high_employees;

/*12.	Write a nested query to find employees with experience of more than ten years. Take data from the employee record table.*/

select EMP_ID,FIRST_NAME,EXP
from emp_record_table
where EXP>10;


/*13.	Write a query to create a stored procedure to retrieve the details of the employees whose experience is more than three years. 
Take data from the employee record table.*/

DELIMITER //

create procedure experienced_employees()
begin 
select EMP_ID,FIRST_NAME,LAST_NAME,GENDER,ROLE,DEPT,EXP,COUNTRY,CONTINENT,SALARY,EMP_RATING,MANAGER_ID,PROJ_ID
from emp_record_table
where EXP >3;
end//

DELIMITER ;


CALL experienced_employees();


/*14.	Write a query using stored functions in the project table to check whether the job profile assigned to each employee in the data science team
 matches the organization’s set standard.

The standard being:
For an employee with experience less than or equal to 2 years assign 'JUNIOR DATA SCIENTIST',
For an employee with the experience of 2 to 5 years assign 'ASSOCIATE DATA SCIENTIST',
For an employee with the experience of 5 to 10 years assign 'SENIOR DATA SCIENTIST',
For an employee with the experience of 10 to 12 years assign 'LEAD DATA SCIENTIST',
For an employee with the experience of 12 to 16 years assign 'MANAGER'.*/

DELIMITER $$

CREATE FUNCTION employee_standard(EXP INT)
RETURNS VARCHAR(50) 
DETERMINISTIC 
BEGIN
    DECLARE EMPLOYEE_EXP VARCHAR(50) DEFAULT '';
    
    IF EXP <= 2 THEN
        SET EMPLOYEE_EXP = 'JUNIOR DATA SCIENTIST';
    ELSEIF EXP BETWEEN 2 AND 5 THEN
        SET EMPLOYEE_EXP = 'ASSOCIATE DATA SCIENTIST';
    ELSEIF EXP BETWEEN 5 AND 10 THEN
        SET EMPLOYEE_EXP = 'SENIOR DATA SCIENTIST';
    ELSEIF EXP BETWEEN 10 AND 12 THEN
        SET EMPLOYEE_EXP = 'LEAD DATA SCIENTIST';
    ELSE
        SET EMPLOYEE_EXP = 'MANAGER';
    END IF;
    
    RETURN EMPLOYEE_EXP;
END $$

DELIMITER ;

SELECT EMP_ID,FIRST_NAME,ROLE,Employee_standard(EXP) AS Job_Profile
FROM data_science_team;

DESCRIBE emp_record_table;

/*15.	Create an index to improve the cost and performance of the query to find the employee whose
 FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.*/
 
 SELECT FIRST_NAME FROM emp_record_table
 WHERE FIRST_NAME LIKE 'ERIC%';
 
 CREATE index NAME_INDEX
 ON emp_record_table(FIRST_NAME(255));
 
  SELECT FIRST_NAME FROM emp_record_table
 WHERE FIRST_NAME LIKE 'ERIC%';
 
 
/*16.	Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).*/

SELECT EMP_ID,(SALARY*0.05) * EMP_RATING AS BONUS
FROM emp_record_table;


/*17.	Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.*/

SELECT COUNTRY,CONTINENT,
AVG(SALARY) OVER (partition by CONTINENT) as avg_continent,
AVG(SALARY) OVER (partition by country) as avg_country
FROM emp_record_table;





