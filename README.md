# ecommerce-analytics-engineering
# 🛒 Automated E-Commerce Analytics Pipeline

## 📌 Project Overview
E-commerce businesses generate massive amounts of raw transactional data. Marketing and Finance teams rely on this data to track Monthly Recurring Revenue (MRR) and customer churn, but querying raw data manually leads to reporting delays and inaccurate metrics. 

This project bridges the gap between raw data and business strategy. I architected an **end-to-end analytics engineering pipeline** that automatically ingests raw transactions, transforms them into optimized data marts, and feeds a dynamic Power BI dashboard for executive decision-making.

## 🏗️ Architecture & Tech Stack
* **Cloud Data Warehouse:** Google BigQuery
* **Data Transformation & Modeling:** dbt (Data Build Tool)
* **Data Visualization:** Power BI
* **Language:** Standard SQL

---

## 📊 Business Dashboards

### 1. The Financial Executive Summary
Designed for the Finance Director to track high-level growth and shipping cost burdens.
* **Key Metrics:** Total Revenue, MoM Growth, Shipping vs. Product Revenue Split.


### 2. Customer Cohort Retention Heatmap
Designed for the Marketing Director to instantly visualize customer churn and identify drop-off months.
* **Key Metrics:** Active Customers per Cohort, Month-over-Month Retention Rate.


---

## ⚙️ Data Engineering & Modeling (dbt)
Instead of querying raw tables, I built a two-layer dbt project to ensure data quality and query performance:

1. **Staging Layer (`staging/`):** Standardized column names, cast data types (e.g., converting strings to TIMESTAMPS), and filtered for completed orders.
2. **Data Marts (`marts/`):** Built complex SQL aggregations utilizing Window Functions and `DATE_DIFF` to calculate lifetime cohort retention.
3. **Data Quality Testing:** Implemented YAML-based automated testing to guarantee `unique` and `not_null` constraints on critical primary keys before deployment.
