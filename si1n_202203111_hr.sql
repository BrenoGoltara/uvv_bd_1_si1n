SELECT
'INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
(' || employee_id || '',''' || start_date || '',''' || end_date || ''',' || job_id || ',''' || department_id);'
FROM job_history;

SELECT
'INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
(' || job_id || ',''' || job_title || '',''' || min_salary || ','' || max_salary);'
FROM jobs;

SELECT
'INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(' || department_id || department_name || manager_id || location_id);'
FROM departments;


SELECT
'INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES
(' || location_id || '','' || street_address || ',''' || postal_code || ','' || city || '',''' || state_province || ',''' || country_id ||);'
FROM locations;

SELECT 
'INSERT INTO countries (country_id, country_name, region_id) VALUES
(' || country_id || ', ''' || country_name || '',''' region_id ||);'
FROM countries;

SELECT
'INSERT INTO regions (region_id, region_name) VALUES
(' || region_id ||  ',''' || region_name || ''');'
FROM regions;

SELECT
'INSERT INTO employees (id_employee, name, email,
phone_number, hire_date, id_cargo, salary,
comissao, id_supervisor, id_employee) VALUES
(' || employee_id || ', ''' || first_name || ' ' ||
last_name || ''', ''' || email || ''', ''' ||
phone_number || ''', ''' ||
TO_CHAR(hire_date, 'YYYY-MM-DD') || ', ''' ||
job_id || ''', ' || salary || ', ' ||
NVL(TO_CHAR(commission_pct), 'null') || ', ' ||
NVL(TO_CHAR(manager_id), 'null') || ', ' ||
NVL(TO_CHAR(department_id), 'null') || ');'
FROM employees;
