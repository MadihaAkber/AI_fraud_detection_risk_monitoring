# AI Fraud Detection & Transaction Risk Monitoring

An end-to-end machine learning and business intelligence project for detecting fraudulent credit card transactions, assigning transaction risk scores, generating investigation alerts, and monitoring fraud through an interactive Power BI dashboard.

## Project Overview

This project demonstrates an end-to-end fraud detection workflow using Python, machine learning, explainable AI, SQL and Power BI.

The objective was not only to predict fraudulent transactions, but also to convert model predictions into a practical transaction risk-monitoring system that could support fraud investigation.

The workflow included:

- Exploratory data analysis and data cleaning
- Fraud class imbalance analysis
- Logistic Regression, Random Forest and XGBoost modelling
- Model evaluation using precision, recall, F1, ROC-AUC and PR-AUC
- Decision-threshold analysis
- SHAP model explainability
- Transaction-level fraud probability scoring
- Risk classification and investigation alerts
- SQL business analysis
- Power BI fraud monitoring dashboard

## Dataset

The project uses the Credit Card Fraud Detection dataset containing:

- 284,807 original transactions
- 492 original fraudulent transactions
- 30 predictor variables
- Transaction amount and fraud classification

After removing duplicate records:

- 283,726 transactions remained
- 473 were fraudulent transactions

The dataset is highly imbalanced, making fraud detection a challenging classification problem.

## Machine Learning Models

Three classification models were evaluated:

| Model | Precision | Recall | F1 Score | ROC-AUC | PR-AUC |
|---|---:|---:|---:|---:|---:|
| Logistic Regression | 0.06 | 0.87 | 0.11 | 0.966 | 0.672 |
| Random Forest | 0.97 | 0.71 | 0.82 | 0.925 | 0.796 |
| XGBoost | 0.41 | 0.83 | 0.54 | 0.969 | 0.785 |

XGBoost was used for the final transaction risk-scoring pipeline because it provided a useful balance between fraud detection sensitivity and false-positive control.

## Threshold Analysis

Rather than relying only on the default classification threshold, multiple probability thresholds were evaluated.

A 0.90 threshold was used for the final monitoring demonstration.

At this threshold:

- 56,746 test transactions were evaluated
- 94 transactions generated investigation alerts
- 74 fraudulent transactions were correctly detected
- 21 fraudulent transactions were missed
- 20 legitimate transactions generated false-positive alerts
- Fraud recall was 77.89%

The threshold is presented as an operational demonstration rather than a universally optimal threshold. In a real fraud system, the threshold would be selected according to fraud losses, investigation capacity and the relative cost of false positives and false negatives.

## Explainable AI

SHAP was used to understand how individual features influenced XGBoost fraud predictions.

The analysis identified variables including V14, V4, V12 and V10 among the most influential features in the trained model.

This also demonstrated the difference between simple feature correlation and feature influence within a trained machine-learning model.

## Risk Monitoring System

Each test transaction received:

- Fraud probability
- Predicted fraud status
- Risk level
- Investigation alert
- Prediction outcome

Transactions were classified into:

- Low Risk
- Medium Risk
- High Risk
- Critical Risk

Critical transactions meeting the final alert threshold were added to an investigation queue.

## SQL Analysis

The machine-learning results were loaded into SQLite and analysed using SQL.

SQL was used to investigate:

- Total transaction volume and value
- Transactions by risk level
- Investigation alert volume
- True positives and false positives
- False negatives
- Transaction value by prediction outcome
- Highest-risk transactions

## Power BI Dashboard

The Power BI Fraud Risk Monitoring Dashboard provides an interactive view of model performance and transaction risk.

Key dashboard KPIs include:

- 56.7K transactions analysed
- 5.04M total transaction value
- 94 investigation alerts
- 74 fraud cases detected
- 21 fraud cases missed
- 77.89% fraud recall
- 10.96K detected fraudulent transaction value

The dashboard also includes risk-level analysis, model prediction outcomes, transaction risk visualisation and interactive filtering.

![Fraud Risk Monitoring Dashboard](dashboard_screenshot.png)

## Technologies Used

- Python
- Pandas
- NumPy
- Scikit-learn
- XGBoost
- SHAP
- SQL / SQLite
- Power BI
- DAX
- Google Colab
- GitHub

## Project Files

- `AI_Fraud_Detection_Project.ipynb` – complete Python analysis and machine-learning workflow
- `fraud_analysis.sql` – SQL business analysis
- `Fraud_Risk_Monitoring_Dashboard.pbix` – interactive Power BI dashboard
- `fraud_detection_results.csv` – transaction-level model results
- `fraud_investigation_queue.csv` – transactions flagged for investigation
- `shap_summary.png` – SHAP model explainability visualisation

## Key Learning

This project demonstrates that fraud detection is not simply an accuracy problem.

Because fraudulent transactions are rare, model evaluation requires metrics such as precision, recall and PR-AUC alongside consideration of false-positive investigation burden.

The project therefore extends beyond model training into threshold selection, explainability, SQL analysis and business-facing risk monitoring.
