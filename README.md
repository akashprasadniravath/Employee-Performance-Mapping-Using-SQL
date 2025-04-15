# Employee-Performance-Mapping-Using-SQL
Analyzing employee performance and salary metrics using SQL for HR appraisal support at a data science startup, featuring stored procedures, views, indexing, and performance-based insights.

# Project Overview
This project focuses on analyzing the employee database of ScienceQtech, a growing data science startup, to support the HR department during the annual appraisal process. As the Junior Database Administrator, the goal was to develop and execute SQL queries that extract critical insights into employee performance, project involvement, salary structures, and organizational role alignment. The results of this analysis are designed to inform appraisal decisions, optimize training initiatives, and enhance overall workforce planning through performance-based reporting.

## Objective
The primary goals of this project were:
To create a relational database from the provided CSV datasets and design an ER diagram to reflect the schema. To extract, transform, and analyze employee data to uncover performance trends, salary variations, and job-role mismatches. To calculate employee bonuses based on salary and rating metrics, and validate employee roles using standardized organizational criteria. To optimize database queries using indexing and functions, thereby improving system efficiency. To support the HR team in their strategic planning for training and salary appraisal cycles.

### Key Features
1. Database Creation and Import
A MySQL database named employee was created, and three CSV files (emp_record_table, proj_table, data_science_team) were imported into corresponding tables.

2. Entity-Relationship (ER) Diagram
An ER diagram was designed to map out relationships between employees, their project involvement, and departmental roles.

3. SQL Queries and Performance Analysis

Extracted employee and department details.

Segmented employees based on performance ratings (low, medium, high).

Used string concatenation to generate full names for finance employees.

Identified employees with direct reports and calculated the number of subordinates.

Applied UNION operations to compare employees across healthcare and finance departments.

Grouped employees by department to analyze maximum performance ratings.

Computed salary extremes per role, and ranked employees based on years of experience.

Created views for high-salary earners, nested queries for identifying experienced staff, and stored procedures for repetitive reporting.

4. Database Optimization and Enhancements

Developed a stored function to validate job profiles based on employee experience.

Created an index on the FIRST_NAME column to enhance search efficiency for name-based queries.

Used execution plan comparisons to confirm index effectiveness.

5. Additional Insights

Calculated bonuses using the formula: 5% of salary * employee rating.

Analyzed average salary distributions by country and continent using window functions.

## Summary of Achievements
This project built a robust SQL-based solution for HR analytics and employee performance mapping. It successfully automated complex reporting needs, optimized query performance, and validated job-role alignment using procedural SQL. It also introduced data-driven insights into bonus allocation and geographic salary trends, offering a strong foundation for scalable HR decision-making.

# Conclusion
This project highlights the power of SQL in workforce analytics. By building structured queries, stored procedures, functions, and views, it empowered ScienceQtech’s HR team to make better decisions backed by data. The process not only improved performance visibility but also ensured organizational alignment with job standards and compensation structures, demonstrating SQL's vital role in human resource management.
