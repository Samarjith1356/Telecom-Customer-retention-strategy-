-- Retention priority list
-- Flagged customers ranked by expected monthly revenue at risk (probability x ARPU).
SELECT
    customer_id,
    risk_tier,
    ROUND(churn_prob, 3)                         AS churn_prob,
    ROUND(monthly_arpu_inr, 0)                   AS monthly_arpu_inr,
    ROUND(churn_prob * monthly_arpu_inr, 0)      AS expected_arpu_at_risk_inr
FROM risk
WHERE flagged = 1
ORDER BY expected_arpu_at_risk_inr DESC
LIMIT 15;
