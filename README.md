# Pewlett_Hackard_Analysis

This project examined number of retiring employees at Pewlett Hackard.  In addition, prediction of available positions will be generated. Files given and returned are CSV.  Tools used during analysis includes PostgresSQL and pgAdmin.
Final query includes creating a list of potential mentors.
  
 In Module 7’s challenge, we were asked to create a list of potential mentors.  Six different CSV files were given: “Departments.csv,” “ Dept_emp.csv,” “Employees.csv,” “Dept_manager.csv,” “Salaries.csv,” and “Titles.csv.”  To organize our thoughts, we created a quick database diagram (QDB) titled “EmployeeDB.png” through https://www.quickdatabasediagrams.com/.  Creating the QDB helped establish relationships and connections between the given files.  In addition, content of each file and its’ datatypes are included in the QDB.  Primary keys were also noted.  
![Figure1](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/EmployeeDB.png.png)

The first chart made, “retiring_title1.csv” includes a list of employees name, their ID number, title, salary, birthdate, and their start date.  To be considered eligible for retirement, current employees born between 1952 to 1955 was examined.  The number of employees in “retiring_title1.csv” may not be accurate as it may contain duplicate entries where employees moved up in position over the years and CSV didn’t reflect its current state.  Therefore, a table titled “non_duplicate1.csv” was created to eliminate duplicate entries of employees.  It also contains their current position and salaries.  According to this chart, the number of individuals retiring should be 53,977 people.  
![Figure 2.](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge.sql)
![Table 1.Retiring_title1](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge/retiring_title1.csv)
![table 2. non_duplicate1](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge/non_duplicate1.csv)

We further filter our retirees by title based on their start date that they started that position.  This evaluation is listed under “frequency_by_date_title.csv”  A simple view of number of retirees for each title is listed under “frequency_by_title1.csv”
![Table 3. Frequency_by_date_title](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge/frequency_by_date_title.csv)
![Table 4.Frequency_by_title1](
https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge/frequency_by_title1.csv)
 
For our exercise, mentors are established to be born in the year 1965.  The list of employees is given through, “mentor.csv.”  According to our calculations, number of employees eligible for mentorship is 1550 people.  

![Table 5. Mentor](https://github.com/hhnguyenn/Pewlett_Hackard_Analysis/blob/master/Challenge/mentor.csv)

The number of new hires is difficult to extract as one person retirement doesn’t necessarily equate to one new hire due to various reasons including cost effectiveness.   We can look at cost-revenue ratio for employees as in how much the company pay the employee vs how much output they predictably generate.    In addition, if it’s reasonable to replace them.  We can also use that same methd for departments and evaluate the necessity of those departments.
	 
