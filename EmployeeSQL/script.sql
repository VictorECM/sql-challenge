
CREATE TABLE "Department" (
    "Dept_no" VARCHAR   NOT NULL,
    "Dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "Salary" (
    "Employee_no" INT  NOT NULL,
    "Salary" INT   NOT NULL,
    CONSTRAINT "pk_Salary" PRIMARY KEY (
        "Employee_no"
     )
);


CREATE TABLE "Employees" (
    "Employee_no" INTEGER   NOT NULL,
    "Employee_title_id" VARCHAR   NOT NULL,
    "Birth_date" DATE   NOT NULL,
    "First_Name" VARCHAR   NOT NULL,
    "Last_Name" VARCHAR   NOT NULL,
    "Sex" VARCHAR (3)  NOT NULL,
    "Hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY("Employee_no")
);
SELECT * FROM "Employees";

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR  NOT NULL,
    "Title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);


CREATE TABLE "DEPARTMENT_EMPLY" (
    "Employee_no" INT  NOT NULL,
    "Dept_no" VARCHAR   NOT NULL,
	CONSTRAINT "pk_DEPARTMENT_EMPLY" PRIMARY KEY (
		"Employee_no","Dept_no"
     )
);


CREATE TABLE "DEPT_MANAGERS" (
    "Dept_no" VARCHAR NOT NULL,
    "Employee_no" INT NOT NULL,
	CONSTRAINT "pk_DEPT_MANAGERS" PRIMARY KEY (
        "Dept_no","Employee_no")
);


-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT "Employee_no" from "Salary" s;
select e."Employee_no",e."Last_Name",e."First_Name",e."Sex",s."Salary"
from "Employees" e 
join "Salary" s
on e."Employee_no" = s."Employee_no"
order by e."Employee_no";

--2.List first name, last name, and hire date for employees who were hired in 1986.
--creating view
Select * from "Employees"
where extract(year from "Hire_date") =1986
order by "First_Name","Last_Name";

-- 3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
select e."Employee_no",e."Last_Name",e."First_Name",d."Dept_no",d."Dept_name"
from "Employees" e,"Department" d,"DEPT_MANAGERS" dm
where e."Employee_no" = dm."Employee_no" and dm."Dept_no" = d."Dept_no"
order by e."Employee_no";

-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select e."Employee_no",e."Last_Name",e."First_Name",d."Dept_name"
from "Employees" e,"Department" d,"DEPARTMENT_EMPLY" de
where e."Employee_no" = de."Employee_no" and de."Dept_no" = d."Dept_no"
order by e."Employee_no";

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e."Employee_no",e."Last_Name",e."First_Name",e."Sex"
from "Employees" e
where e."First_Name" = 'Hercules' and e."Last_Name" like 'B%'
order by e."Employee_no";

-- 6.List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.
select e."Employee_no",e."Last_Name",e."First_Name",d."Dept_name"
from "Employees" e,"Department" d,"DEPARTMENT_EMPLY" de
where e."Employee_no" = de."Employee_no" and de."Dept_no" = d."Dept_no" and d."Dept_name" ='Sales'
order by e."Employee_no";

-- 7.List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
select e."Employee_no",e."Last_Name",e."First_Name",d."Dept_name"
from "Employees" e,"Department" d,"DEPARTMENT_EMPLY" de
where e."Employee_no" = de."Employee_no" and de."Dept_no" = d."Dept_no" and d."Dept_name" in ('Sales','Development')
order by e."Employee_no";

-- 8.In descending order, list the 
-- frequency count of employee last names, i.e., how many employees share each last name.
select "Last_Name",count("Last_Name") as "Last_Name_fzy" from "Employees"
group by "Last_Name"
order by "Last_Name_fzy" desc;