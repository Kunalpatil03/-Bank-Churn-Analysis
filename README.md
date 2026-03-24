# 🏦 Bank Churn Analysis

![Dashboard Preview](dashboard.png)

> A complete SQL-based analysis of bank customer churn — uncovering why customers leave and which segments are most at risk.

---

## 📌 Project Overview

This project analyzes a bank's customer dataset to identify churn patterns across geography, age, gender, balance, and product usage. The goal is to give data-driven insights that help the bank **retain high-risk customers** before they leave.

---

## 📊 Dashboard Highlights

| Metric | Value |
|---|---|
| Total Customers | 10,000 |
| Churned Customers | 2,037 |
| Active Members | 5,151 |
| Overall Churn Rate | **20.37%** |

---

## 🔍 Key Insights

### 1. 🌍 Geography
| Country | Churned |
|---------|---------|
| Germany | 814 |
| France  | 810 |
| Spain   | 413 |

> Germany has the highest churn despite similar customer counts — warrants focused retention efforts.

### 2. 👥 Gender
- Female customers churn at a **higher rate** than males despite lower credit scores on average.

### 3. 🎂 Age Group
| Age Group | Churned | % of Total Churned |
|-----------|---------|-------------------|
| 40–60     | 1,325   | ~48%              |
| 30–39     | 473     | ~17%              |
| Under 30  | 124     | ~5%               |
| 60+       | 115     | ~4%               |

> The **40–60 age group** is the highest-risk segment, contributing nearly half of all churn.

### 4. 💰 Balance Segments
| Segment       | Churn Rate |
|---------------|-----------|
| High Balance  | 59%       |
| Low Balance   | 25%       |
| Zero Balance  | 16%       |

> High-balance customers are paradoxically churning most — a retention priority.

### 5. 📦 Number of Products
- Customers with **1 product** have the highest churn volume.
- Customers with **3–4 products** show near-zero churn.

### 6. ✅ Active Members
- Inactive members churn at a significantly higher rate than active ones.

---

## 🛠️ Tools & Tech

| Tool | Purpose |
|------|---------|
| **MySQL** | Data querying & analysis |
| **Power BI** | Dashboard visualization |
| **SQL Window Functions** | `PARTITION BY`, `OVER()` for advanced aggregation |

---

## 📁 Project Structure

```
bank-churn-analysis/
│
├── bank_churn_analysis.sql   # All 10 SQL analysis queries
├── dashboard.png             # Power BI dashboard screenshot
└── README.md                 # Project documentation
```

---

## 🧠 SQL Concepts Used

- `GROUP BY` with aggregate functions (`COUNT`, `SUM`, `AVG`)
- `CASE WHEN` for custom segmentation (age groups, balance tiers)
- **Window Functions**: `SUM() OVER (PARTITION BY ...)` for running totals
- `CONCAT` + `ROUND` for formatted percentage outputs
- Nested aggregates: `SUM(SUM(...)) OVER()` for percentage of total

---

## 📋 Queries Covered

| # | Analysis |
|---|----------|
| 1 | Overall Churn Rate |
| 2 | Churn by Geography |
| 3 | Churn by Gender |
| 4 | Churn by Age Group |
| 5 | Average Balance: Churned vs Retained |
| 6 | Churn by Number of Products |
| 7 | Churn by Active Member Status |
| 8 | Churn by Age Group & Activity |
| 9 | Churn by Balance Segment |
| 10 | Churn Risk by Products + Activity |

---

## 🚀 How to Run

## 🚀 How to Run

1. Download the dataset from Google Drive:  
   👉 https://drive.google.com/drive/folders/1Mm-hqEV951JWIJHyJoK4x3n4odxpXoJG?usp=drive_link
2. Import the `bank_churn` dataset into your MySQL database.
3. Open `bank_churn_analysis.sql` in MySQL Workbench or any SQL client.
4. Run queries individually or all at once.

---

## 📬 Connect

Feel free to fork, star ⭐, or reach out if you have feedback!

---

*Built with SQL & Power BI*
