# 📊 SQL Analysis – Bank Loan Dataset

This folder contains SQL scripts and PDF documentation used to analyze the bank loan dataset.

The SQL analysis focuses on extracting business insights such as approval rates, loan distributions, and time-based trends.

---

## 📂 Folder Contents

```
SQL_analysis/
│
├── bank_loan_sql_analysis.sql   # SQL analysis queries
├── bank_loan_query_doc.pdf      # Query explanations + outputs
└── README.md                    # SQL section documentation
```


---

## 📄 Files Explained

### bank_loan_sql_analysis.sql

Contains SQL queries used for:

- Loan status analysis  
- Aggregate KPIs  
- Time-based metrics  
- Grouped summaries  

---

### 📌 Documentation

Each query is documented in **SQL_Query_Documentation.pdf**, which includes:

- Business question  
- Output snippet (screenshots)   

This provides clear traceability between problem statements and results.

---

## 🧾 Analysis Covered

The SQL analysis answers a comprehensive set of business questions related to loan performance, borrower behavior, and financial KPIs.

### 🔹 Core KPIs

- Total loan applications  
- Month-to-Date (MTD) loan applications  
- Previous Month-to-Date (PMTD) loan applications  

- Total funded amount (overall, MTD, PMTD)  
- Total amount received (overall, MTD, PMTD)  

- Average interest rate (overall, MTD, PMTD)  
- Average Debt-to-Income (DTI) ratio (overall, MTD, PMTD)

---

### 🔹 Good vs Bad Loans

Loans are classified as:

- **Good Loans:** Fully Paid or Current  
- **Bad Loans:** Charged Off  

Metrics calculated:

- Percentage of good loans  
- Total good loans issued  
- Funded amount for good loans  
- Amount received from good loans  

- Percentage of bad loans  
- Total bad loans issued  
- Funded amount for bad loans  
- Amount received from bad loans  

---

### 🔹 Loan Status Breakdown

Detailed metrics grouped by loan status:

- Loan count  
- Total funded amount  
- Total amount received  
- Average interest rate  
- Average DTI  

Also includes Month-to-Date (MTD) breakdown by loan status.

---

### 🔹 Time-Based Analysis

- Monthly summary of:
  - Loan applications  
  - Funded amount  
  - Amount received  

Used to identify seasonal trends and performance changes across months.

---

### 🔹 Geographic Analysis

- State-wise summary including:
  - Total loan applications  
  - Total funded amount  
  - Total amount received  

Helps identify top-performing and low-performing regions.

---

### 🔹 Borrower & Loan Characteristics

Grouped analysis based on:

- Loan term (36 months vs 60 months)
- Employee length
- Loan purpose (debt consolidation, credit card, home improvement, etc.)
- Home ownership (rent, mortgage, own, others)

Each category includes:

- Total applications  
- Total funded amount  
- Total amount received  

---

## ▶ How to Run

1. Import `bank_loan_data_csv.csv` into your SQL database (MySQL / PostgreSQL / SQL Server).

2. Open `bank_loan_sql_analysis.sql` in your SQL client.

3. Execute queries sequentially.

4. Refer to `back_loan_query_doc.pdf` for expected outputs.

---

## 💡 Purpose of SQL Analysis

SQL is used here to simulate real business reporting:

- Financial KPIs  
- Operational metrics  
- Trend analysis  
- Decision-support queries  

---

## 🧠 Skills Practiced

- SELECT, WHERE, GROUP BY, ORDER BY  
- Aggregate functions  
- Date functions  
- Business-oriented querying  
- Query documentation  
