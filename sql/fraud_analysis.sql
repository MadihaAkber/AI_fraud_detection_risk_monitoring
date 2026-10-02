
-- AI Fraud Detection & Risk Monitoring
-- Portfolio SQL Analysis

-- 1. Overall transaction volume
SELECT
    COUNT(*) AS total_transactions,
    ROUND(SUM(Amount), 2) AS total_transaction_value
FROM transactions;


-- 2. Transactions by risk level
SELECT
    Risk_Level,
    COUNT(*) AS transaction_count,
    ROUND(SUM(Amount), 2) AS transaction_value,
    ROUND(AVG(Fraud_Probability), 3) AS avg_fraud_probability
FROM transactions
GROUP BY Risk_Level
ORDER BY avg_fraud_probability DESC;


-- 3. Investigation alerts
SELECT
    COUNT(*) AS total_alerts,
    ROUND(SUM(Amount), 2) AS alert_transaction_value,
    ROUND(AVG(Fraud_Probability), 3) AS avg_risk_score
FROM transactions
WHERE Alert = 'Investigate';


-- 4. Model outcomes
SELECT
    Prediction_Result,
    COUNT(*) AS transaction_count,
    ROUND(SUM(Amount), 2) AS transaction_value,
    ROUND(AVG(Amount), 2) AS avg_transaction_value
FROM transactions
GROUP BY Prediction_Result
ORDER BY transaction_count DESC;


-- 5. Highest-risk transactions
SELECT
    Transaction_ID,
    Amount,
    ROUND(Fraud_Probability, 4) AS fraud_probability,
    Risk_Level,
    Alert
FROM transactions
WHERE Alert = 'Investigate'
ORDER BY Fraud_Probability DESC
LIMIT 10;
