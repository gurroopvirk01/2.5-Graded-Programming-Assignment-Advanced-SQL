-- Exercise 2: SQL Joins & Aggregations
-- Tables: employees(id, name, department, salary, hire_date, manager_id)
--         departments(id, name, budget)

-- Exercise 1: Employees and Department Budgets
SELECT
    e.name AS employee_name,
    e.department AS department_name,
    e.salary,
    d.budget AS department_budget
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department = d.name
ORDER BY e.name;

-- Exercise 2: Employees and Their Managers
SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
    ON e.manager_id = m.id
ORDER BY e.name;

-- Exercise 3: Employee Count by Department
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC;

-- Exercise 4: Average Salary by Department
SELECT
    department,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;

-- Exercise 5: Salary Summary by Department
SELECT
    department,
    COUNT(*) AS employee_count,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY department;

-- Exercise 6: Departments with More Than Two Employees
SELECT
    department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 2
ORDER BY employee_count DESC;

-- Exercise 7: Department Budget and Salary Comparison
SELECT
    d.name AS department_name,
    d.budget AS department_budget,
