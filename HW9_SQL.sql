-- CREATE TABLE "employees" (
--     "emp_no" INTEGER   NOT NULL,
--     "employer_title_ID" VARCHAR   NOT NULL,
--     "birth_date" DATE   NOT NULL,
--     "first_name" VARCHAR   NOT NULL,
--     "last_name" VARCHAR   NOT NULL,
--     "sex" VARCHAR   NOT NULL,
--     "hire_date" DATE   NOT NULL,
--     CONSTRAINT "pk_employees" PRIMARY KEY (
--         "emp_no"
--      )
-- );

-- CREATE TABLE "departments" (
--     "dept_no" VARCHAR   NOT NULL,
--     "dept_name" VARCHAR   NOT NULL,
--     CONSTRAINT "pk_departments" PRIMARY KEY (
--         "dept_no"
--      )
-- );

-- CREATE TABLE "salaries" (
--     "emp_no" INTEGER   NOT NULL,
--     "salary" INTEGER   NOT NULL
-- );

-- CREATE TABLE "titles" (
--     "title_ID" VARCHAR   NOT NULL,
--     "title" VARCHAR   NOT NULL,
--     CONSTRAINT "pk_titles" PRIMARY KEY (
--         "title_ID"
--      )
-- );

-- CREATE TABLE "dept_emp" (
--     "emp_no" INTEGER   NOT NULL,
--     "dept_no" VARCHAR   NOT NULL,
-- 	UNIQUE("emp_no", "dept_no")
-- );

-- CREATE TABLE "dept_manager" (
--     "dept_no" VARCHAR   NOT NULL,
--     "emp_no" INTEGER   NOT NULL
-- );

-- ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_employer_title_ID" FOREIGN KEY("employer_title_ID")
-- REFERENCES "titles" ("title_ID");

-- ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
-- REFERENCES "employees" ("emp_no");

-- ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
-- REFERENCES "departments" ("dept_no");

-- ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no_emp_no" FOREIGN KEY("dept_no", "emp_no")
-- REFERENCES "dept_emp" ("dept_no", "emp_no");

-- SELECT * FROM employees

-- DATA ANALYSIS

--1
-- SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
-- FROM employees as e
-- JOIN salaries as s
-- ON e.emp_no = s.emp_no

--2
-- SELECT first_name, last_name
-- FROM employees
-- WHERE date_part('year', hire_date) = 1986

--3
-- SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
-- FROM dept_manager as dm
-- JOIN dept_emp as de ON de.dept_no = dm.dept_no AND de.emp_no = dm.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no
-- JOIN employees as e on e.emp_no = de.emp_no

--4
-- SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- FROM employees as e
-- JOIN dept_emp as de ON e.emp_no = de.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no

--5
-- SELECT first_name, last_name, sex
-- FROM employees
-- WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--6
-- SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- FROM employees as e
-- JOIN dept_emp as de ON e.emp_no = de.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no
-- WHERE dept_name = 'Sales'

--7
-- SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
-- FROM employees as e
-- JOIN dept_emp as de ON e.emp_no = de.emp_no
-- JOIN departments as d ON d.dept_no = de.dept_no
-- WHERE dept_name IN ('Sales', 'Developmet') 

--8
-- SELECT last_name, COUNT(last_name)
-- FROM employees
-- GROUP BY last_name
-- ORDER BY COUNT(last_name) DESC