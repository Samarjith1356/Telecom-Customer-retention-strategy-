-- Decile lift table
-- Customers ranked by churn probability and split into 10 equal groups.
-- Lift = churn rate in the decile divided by the overall churn rate.
WITH ranked AS (
    SELECT *, NTILE(10) OVER (ORDER BY churn_prob DESC) AS decile
    FROM risk
),
overall AS (
    SELECT AVG(actual_churn) AS base_rate, SUM(actual_churn) AS total_churners FROM risk
)
SELECT
    decile,
    COUNT(*)                                                         AS customers,
    SUM(actual_churn)                                                AS churners,
    ROUND(100.0 * AVG(actual_churn), 1)                              AS churn_rate_pct,
    ROUND(AVG(actual_churn) / MAX(o.base_rate), 2)                   AS lift,
    ROUND(100.0 * SUM(SUM(actual_churn)) OVER (ORDER BY decile)
          / MAX(o.total_churners), 1)                                AS cumulative_churners_captured_pct
FROM ranked, overall o
GROUP BY decile
ORDER BY decile;
