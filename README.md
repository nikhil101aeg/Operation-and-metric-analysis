
# 📊 Metric & User Engagement Analysis Using SQL

This project consists of two parts — analyzing job processing performance and understanding user engagement metrics for a platform — using SQL. It showcases end-to-end data cleaning, transformation, and analytical querying to extract meaningful insights.

---

## 📁 Contents

- `metric project.sql`: Contains all SQL queries for both datasets — job logs and user engagement metrics.

---

## 🔍 Project Overview

### A) Job Review Metrics (job_interviews database)
- Analyzed job processing logs using date formatting and performance metrics.
- Extracted:
  - Average jobs processed per second/hour.
  - Top actors by number of jobs.
  - Duplicate job or actor IDs.
  - Language distribution among jobs.
  - 7-day rolling average throughput.

### B) User Engagement Metrics (metric database)
- Analyzed signup behavior and email event patterns.
- Extracted:
  - Weekly active users (WAU).
  - Weekly new signups.
  - Weeks taken for new users to engage.
  - Device usage analysis.
  - Email open/click/conversion rates.

---

## 🔧 Technologies Used

- **SQL (MySQL)**
- **MySQL Workbench**
- **Window Functions, JOINs, Aggregations, CASE WHEN logic**
- **Date & Time Functions**
- **Basic ETL & Data Formatting**

---

## 📈 Insights

- Identified the most efficient job reviewers and system bottlenecks.
- Tracked weekly user engagement and signup conversion lag.
- Highlighted device usage patterns over time.
- Measured effectiveness of email campaigns.

---

## 🧠 Learning Outcomes

- Improved practical SQL skills for analytics and ETL.
- Understood how to structure queries for business insights.
- Learned how user behavior data impacts business decision-making.

---

## 📎 How to Use

1. Clone this repo or download the `.sql` file.
2. Import the SQL queries into **MySQL Workbench** or any MySQL-compatible DBMS.
3. Run the queries on the relevant datasets (`job_logs.csv`, `users.csv`, etc.) imported into MySQL.

---

## 📝 Author

**Nikhil**  
*Data Enthusiast | SQL Explorer*

---

## 📌 License

This project is for educational and portfolio purposes only.
