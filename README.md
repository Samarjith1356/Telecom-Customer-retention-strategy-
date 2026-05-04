# Telecom Customer Churn Prediction: High-Value Subscriber Retention

## Project Overview
This project addresses the critical business challenge of customer attrition within the telecommunications sector. In highly competitive markets, the cost of acquiring a new customer is significantly higher than retaining an existing one. This initiative specifically focuses on identifying "High-Value Customers" (HVCs) who are likely to churn, providing the business with a 15-day "Action Phase" to intervene before the revenue loss occurs.

---

## The Problem Statement
The primary objective was to predict churn in the ninth month using usage data from the preceding three months (Months 6, 7, and 8). 
* **Target Segment:** High-Value Customers (defined as those in the top 20% of revenue generators).
* **Objective:** Prioritize **Recall** (identifying as many churners as possible) over precision, as the cost of losing a high-value subscriber far outweighs the cost of a retention offer.
* **Constraints:** The dataset featured extreme class imbalance (~91% loyal vs. ~9% churn) and high dimensionality with significant feature correlation.

---

## Methodology & Technical Approach
To solve this, we employed a multi-stage data science pipeline designed for high-performance classification and business interpretability.

### 1. Data Engineering & Pre-processing
* **Churn Definition:** Created a target variable based on usage (Total MOU = 0 and Data Volume = 0) in the churn month (Month 9).
* **High-Value Filtering:** Isolated the top 20% of users based on average revenue from Months 6 and 7.
* **Feature Engineering:** Developed "Velocity" features to capture the rate of change in usage between the "Good Phase" (6 & 7) and the "Action Phase" (8).

### 2. Model Development
Two distinct architectures were deployed to satisfy different stakeholder needs:
* **Tactical Prediction Engine:** A **Gradient Boosting Classifier (GBC)** was utilized for its ability to capture non-linear interactions. We optimized the probability threshold (0.0579) to maximize the **F2-Score**, specifically weighting the model toward Churner detection.
* **Strategic Interpretability Model:** A **Lasso-regularized Logistic Regression** was used to handle multi-collinearity and identify the specific behavioral triggers driving churn.

---

## Results & Key Findings
The final model delivered a robust balance between wide-scale churn capture and operational efficiency.

### Predictive Performance
| Metric | Result | Interpretation |
| :--- | :--- | :--- |
| **Recall** | **82%** | We successfully identify 82 out of every 100 actual churners. |
| **Precision** | **45%** | Nearly half of all flagged customers are confirmed churners, a 60% improvement over baseline. |
| **Accuracy** | **90%** | High overall reliability in distinguishing subscriber types. |
| **F2-Score** | **0.70** | Strong performance in a recall-prioritized business environment. |

### Leading Indicators of Churn
* **Usage Velocity Collapse:** A sharp decline in local incoming minutes and total usage in Month 8 is the primary "red flag."
* **Data Integration:** Subscribers with active 3G/4G monthly data packs demonstrate significantly higher loyalty.
* **Social Connectivity:** A drop in incoming calls from other networks indicates that the user is likely transitioning their primary contact number elsewhere.

---

## Strategic Recommendations
To mitigate churn among the identified at-risk subscribers, the following interventions are recommended:

### 1. Usage-Based Early Warning System
Implement automated triggers based on usage velocity. If a high-value customer’s usage drops by more than 15% over a 7-day rolling window compared to their baseline, the system should trigger an automated service health check or a "Loyalty Bridge" bonus offer.

### 2. Data Stickiness Integration
The data confirms that subscribers integrated into the data ecosystem are more resilient to churn. We recommend transitioning 2G-only users to 3G/4G data packs through free trials or tiered loyalty upgrades. Increasing the subscriber’s data dependency directly increases their switching costs.

### 3. Proactive High-Value Concierge
Use the model’s "Action List" to identify the top 5% of highest-risk revenue generators. These individuals should be assigned to a dedicated retention desk for personalized outbound calls rather than generic automated SMS. This high-touch approach ensures that the network’s most valuable assets feel recognized and valued during their decision-making window.
