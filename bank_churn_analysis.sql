-- ============================================================
--  BANK CHURN ANALYSIS - SQL Queries
--  Dataset : bank_churn
--  Author  : [Kunal Patil]
--  Date    : 2025
-- ============================================================

-- Preview full dataset
SELECT * FROM bank_churn;

-- ============================================================
-- 1) Overall Churn Rate
-- ============================================================
SELECT
    COUNT(CustomerID)                          AS Total_Customers,
    SUM(Exited)                                AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %') AS Churn_Rate
FROM bank_churn;

-- ============================================================
-- 2) Churn Rate by Geography
-- ============================================================
SELECT DISTINCT Geography FROM bank_churn;

SELECT DISTINCT
    Geography,
    SUM(Exited) OVER (PARTITION BY Geography) AS Churned_Customers
FROM bank_churn
ORDER BY Churned_Customers DESC;

-- ============================================================
-- 3) Churn Rate by Gender
-- ============================================================
SELECT
    Gender,
    COUNT(*)                                   AS Total_Customers,
    SUM(Exited)                                AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %') AS Churn_Rate
FROM bank_churn
GROUP BY Gender;

-- ============================================================
-- 4) Churn by Age Group
-- ============================================================
SELECT
    CASE
        WHEN Age < 30              THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 60 THEN '40-60'
        ELSE '60+'
    END                                                                         AS Age_Group,
    COUNT(*)                                                                    AS Total_Customers,
    SUM(Exited)                                                                 AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %')                                  AS Avg_Churn_Rate,
    CONCAT(ROUND(SUM(Exited) * 100.0 / SUM(SUM(Exited)) OVER (), 2), ' %')    AS Pct_Of_Total_Churned
FROM bank_churn
GROUP BY Age_Group
ORDER BY Churned_Customers DESC;

-- ============================================================
-- 5) Average Balance: Churned vs Retained
-- ============================================================
SELECT
    Exited,
    COUNT(*)                   AS Total_Customers,
    ROUND(AVG(Balance), 2)     AS Avg_Balance
FROM bank_churn
GROUP BY Exited;

-- ============================================================
-- 6) Churn by Number of Products
-- ============================================================
SELECT
    `Num Of Products`,
    COUNT(*)    AS Total_Customers,
    SUM(Exited) AS Churned_Customers
FROM bank_churn
GROUP BY `Num Of Products`;

-- ============================================================
-- 7) Churn by Active Member Status
-- ============================================================
SELECT
    IsActiveMember,
    COUNT(*)                                   AS Total_Customers,
    SUM(Exited)                                AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %') AS Churn_Rate
FROM bank_churn
GROUP BY IsActiveMember;

-- ============================================================
-- 8) Churn by Age Group & Activity Status
-- ============================================================
SELECT
    CASE
        WHEN Age < 40 THEN 'Under 40'
        ELSE '40+'
    END                                                          AS Age_Group,
    COUNT(*)                                                     AS Total_Customers,
    SUM(IsActiveMember)                                          AS Active_Members,
    SUM(CASE WHEN IsActiveMember = 0 THEN 1 ELSE 0 END)         AS Inactive_Members,
    SUM(Exited)                                                  AS Churned_Customers
FROM bank_churn
GROUP BY Age_Group;

-- ============================================================
-- 9) Churn by Balance Segment (Customer Value Analysis)
-- ============================================================
SELECT MAX(Balance), MIN(Balance) FROM bank_churn;   -- range check

SELECT
    CASE
        WHEN Balance = 0                     THEN 'Zero Balance'
        WHEN Balance BETWEEN 1 AND 100000    THEN 'Low Balance'
        ELSE 'High Balance'
    END                                                AS Balance_Segment,
    COUNT(*)                                           AS Total_Customers,
    SUM(Exited)                                        AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %')         AS Avg_Churn_Rate
FROM bank_churn
GROUP BY Balance_Segment;

-- ============================================================
-- 10) Churn Risk by Products + Activity
-- ============================================================
SELECT
    `Num Of Products`,
    SUM(IsActiveMember)                                          AS Active_Members,
    SUM(CASE WHEN IsActiveMember = 0 THEN 1 ELSE 0 END)         AS Inactive_Members,
    COUNT(*)                                                     AS Total_Customers,
    SUM(Exited)                                                  AS Churned_Customers,
    CONCAT(ROUND(AVG(Exited) * 100, 2), ' %')                   AS Avg_Churn_Rate
FROM bank_churn
GROUP BY `Num Of Products`;
