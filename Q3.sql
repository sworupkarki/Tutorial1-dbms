SELECT 
    *
FROM
    tbl_Company;
SELECT 
    *
FROM
    tbl_Employee;
SELECT 
    *
FROM
    tbl_Manages;
SELECT 
    *
FROM
    tbl_Works;



-- q1
UPDATE tbl_Employee 
SET 
    city = 'Newtown'
WHERE
    employee_name = 'Jones';



-- q2
UPDATE tbl_Works 
SET 
    salary = salary * 1.1
WHERE
    company_name = 'First Bank Corporation';



-- q3
UPDATE tbl_Works 
SET 
    manager_salary = manager_salary * 1.1
WHERE
    company_name = 'First Bank Corporation';


