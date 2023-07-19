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
    tbl_Works;
SELECT 
    *
FROM
    tbl_Manages;



-- q1
SELECT 
    employee_name
FROM
    tbl_Works
WHERE
    company_name = 'First Bank Corporation';

-- q2
SELECT 
    employee_name, city
FROM
    tbl_Employee
WHERE
    employee_name IN (SELECT 
            employee_name
        FROM
            tbl_Works
        WHERE
            company_name = 'Small Bank Corporation');

-- q3
SELECT 
    *
FROM
    tbl_Employee
WHERE
    employee_name IN (SELECT 
            employee_name
        FROM
            tbl_Works
        WHERE
            company_name = 'Small Bank Corporation'
                AND salary > 80000);

-- q4
SELECT 
    employee_name
FROM
    tbl_Employee
WHERE
    city IN (SELECT 
            city
        FROM
            tbl_Company
        WHERE
            company_name IN (SELECT 
                    company_name
                FROM
                    tbl_Works
                WHERE
                    tbl_Works.employee_name = tbl_Employee.employee_name));

-- q5
SELECT 
    employee_name
FROM
    tbl_Manages
WHERE
    manager_street IN (SELECT 
            street
        FROM
            tbl_Employee
        WHERE
            tbl_Employee.employee_name = tbl_Manages.employee_name)
        AND manager_city IN (SELECT 
            city
        FROM
            tbl_Employee
        WHERE
            tbl_Employee.employee_name = tbl_Manages.employee_name);



-- q6
SELECT 
    employee_name
FROM
    tbl_Works
WHERE
    company_name != 'Small Bank Corporation';



-- q7
SELECT 
    employee_name
FROM
    tbl_Works
WHERE
    salary > (SELECT 
            MAX(SALARY)
        FROM
            tbl_Works
        WHERE
            company_name = 'First Bank Corporation');



-- q8
SELECT 
    company_name
FROM
    tbl_Company
WHERE
    city = (SELECT 
            city
        FROM
            tbl_Company
        WHERE
            company_name = 'Small Bank Corporation');



-- q9
SELECT 
    employee_name
FROM
    tbl_Works
WHERE
    salary > ANY (SELECT 
            AVG(salary)
        FROM
            tbl_Works
        GROUP BY (company_name));



-- q10
SELECT 
    company_name
FROM
    tbl_Works
GROUP BY (company_name)
HAVING COUNT(employee_name) >= ALL (SELECT 
        COUNT(employee_name)
    FROM
        tbl_Works
    GROUP BY (company_name));



-- q11
SELECT 
    company_name
FROM
    tbl_Works
WHERE
    salary <= ALL (SELECT 
            salary
        FROM
            tbl_Works);



-- q12
SELECT 
    company_name
FROM
    tbl_Works
GROUP BY (company_name)
HAVING AVG(salary) > (SELECT 
        AVG(salary)
    FROM
        tbl_Works
    WHERE
        company_name = 'First Bank Corporation');
