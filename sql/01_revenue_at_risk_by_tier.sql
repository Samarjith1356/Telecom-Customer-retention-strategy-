-- Revenue at risk by churn-risk tier
-- Monthly ARPU held by each tier, and how much of it belongs to customers who actually churned.
SELECT
    risk_tier,
    COUNT(*)                                                        AS customers,
    ROUND(AVG(churn_prob), 3)                                       AS avg_churn_prob,
    SUM(actual_churn)                                               AS actual_churners,
    ROUND(100.0 * SUM(actual_churn) / COUNT(*), 1)                  AS churn_rate_pct,
    ROUND(SUM(monthly_arpu_inr), 0)                                 AS monthly_arpu_inr,
    ROUND(SUM(CASE WHEN actual_churn = 1 THEN monthly_arpu_inr END), 0) AS churned_arpu_inr
FROM risk
GROUP BY risk_tier
ORDER BY avg_churn_prob DESC;
