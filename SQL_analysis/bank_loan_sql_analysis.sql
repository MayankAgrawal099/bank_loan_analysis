select * from bank_loan_data

--1. Summary
--KPIs
--A. Loan Applications
--Q1. What is the total number of loan applications?

select count(id) as Total_Loan_Applications
from bank_loan_data

--Q2. What is the total number of Month-to-Date (MTD) loan applications?

select count(id) as MTD_Loan_Applications
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Q3. What is the total number of Previous-Month-to-Date (PMTD) loan applications?

select count(id) as PMTD_Loan_Applications
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

--B. Funded Amount
--Q1. What is the total funded amount for all loan applications?

select sum(loan_amount) as Total_Funded_Amount
from bank_loan_data

--Q2. What is the total funded amount for Month-to-Date (MTD) loan applications?

select sum(loan_amount) as MTD_Funded_Amount
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Q3. What is the total funded amount for Previous-Month-to-Date (PMTD) loan applications?

select sum(loan_amount) as PMTD_Funded_Amount
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

--C. Amount Received
--Q1. What is the total amount received for all loan applications?

select sum(total_payment) as Total_Amount_Received
from bank_loan_data

--Q2. What is the total amount received for Month-to-Date (MTD) loan applications?

select sum(total_payment) as MTD_Amount_Received
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Q3. What is the total amount received for Previous-Month-to-Date (PMTD) loan applications?

select sum(total_payment) as PMTD_Amount_Received
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

--D. Average Interest Rate
--Q1. What is the average interest rate for all loan applications?

select avg(int_rate)*100 as Average_Interest_Rate
from bank_loan_data

--Q2. What is the average interest rate for Month-to-Date (MTD) loan applications?

select avg(int_rate)*100 as MTD_Average_Interest_Rate
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Q3. What is the average interest rate for Previous-Month-to-Date (PMTD) loan applications?

select avg(int_rate)*100 as PMTD_Average_Interest_Rate
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

--E. Average Debt-to-Income Ratio (DTI)
--Q1. What is the average debt-to-income ratio for all loan applications?

select avg(dti)*100 as Average_DTI
from bank_loan_data

--Q2. What is the average debt-to-income ratio for Month-to-Date (MTD) loan applications?

select avg(dti)*100 as MTD_Average_DTI
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021

--Q3. What is the average debt-to-income ratio for Previous-Month-to-Date (PMTD) loan applications?

select avg(dti)*100 as PMTD_Average_DTI
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021

--Good Loan Issued
--Q1. What is the percentage of good loans issued (loan_status = 'Fully Paid' or 'Current')?

select (count(case when loan_status = 'Fully Paid' OR loan_status = 'Current' then id end) * 100.0) / 
count(id) AS Good_Loan_Percentage
from bank_loan_data

--Q2. What is the total number of good loans issued?

select count(id) as Total_Good_Loans_Issued
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Q3. What is the total funded amount for good loans?

select sum(loan_amount) as Funded_Amount_Good_Loans
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Q4. What is the total amount received for good loans?

select sum(total_payment) as Amount_Received_Good_Loans
from bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

--Bad Loan Issued
--Q1. What is the percentage of bad loan issued (loan_status = 'Charged Off')?

select (count(case when loan_status = 'Charged Off' then id end) * 100.0) /
count(id) AS Bad_Loan_Percentage
from bank_loan_data

--Q2. What is the total number of bad loans issued?

select count(id) as Total_Bad_Loans_Issued
from bank_loan_data
where loan_status = 'Charged Off'

--Q3. What is the total funded amount for bad loans?

select sum(loan_amount) as Funded_Amount_Bad_Loans
from bank_loan_data
where loan_status = 'Charged Off'

--Q4. What is the total amount received for bad loans?

select sum(total_payment) as Amount_Received_Bad_Loans
from bank_loan_data
where loan_status = 'Charged Off'

--Loan Status
--Q1. What is the breakdown of loan status with key metrics?

SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status

--Q2. What is the breakdown of loan status for Month-to-Date (MTD) loan applications with key metrics?

SELECT
    loan_status,
    COUNT(id) AS MTD_LoanCount,
    SUM(total_payment) AS MTD_Total_Amount_Received,
    SUM(loan_amount) AS MTD_Total_Funded_Amount,
    AVG(int_rate * 100) AS MTD_Interest_Rate,
    AVG(dti * 100) AS MTD_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021
GROUP BY loan_status


--2. Overview
--Q1. What is the monthly summary of loan applications, funded amount, and amount received?

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--Q2. What is the state-wise summary of loan applications, funded amount, and amount received?

SELECT 
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY Total_Loan_Applications DESC

--Q3. What is the term-wise summary of loan applications, funded amount, and amount received?

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term

--Q4. What is the employee-length-wise summary of loan applications, funded amount, and amount received?

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length


--Q5. What is the purpose-wise summary of loan applications, funded amount, and amount received?

SELECT 
    purpose AS Purpose, 
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY Total_Loan_Applications DESC

--Q6.  What is the home-ownership-wise summary of loan applications, funded amount, and amount received?

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership
