# Snowflake Hotel Booking – End-to-End Analytics Pipeline

End-to-end hotel booking analytics pipeline built on **Snowflake** using **Medallion Architecture (Bronze–Silver–Gold)**.  
The project ingests raw CSV data, applies data quality and business transformations using SQL, and delivers analytics-ready datasets powering a **Snowsight BI dashboard**.

---

## 1. Project Overview

This project demonstrates how to design and implement a production-style analytics pipeline on Snowflake, starting from raw CSV files and ending with executive-ready dashboards.

Key goals:
- Build a scalable **Bronze → Silver → Gold** data model
- Apply real-world **data cleaning and validation rules**
- Transform raw data into **business-ready analytics tables**
- Deliver insights through **Snowsight dashboards**

---

## 2. Business Requirements

The hotel management team needs a clear, reliable view of booking and revenue performance.

### Key Questions
- What is the total revenue and total bookings?
- How do bookings and revenue trend over time?
- Which cities generate the most revenue?
- How are bookings distributed by room type and booking status?
- What are the key operational KPIs for leadership?

---

## 3. Architecture Overview

![Dashboard Preview](https://github.com/manojnadakuduru/Snowflake-Hotel-Booking-EndtoEnd-Pipeline/architecture/ArchitectureDiagram.png)

The pipeline follows a Snowflake-based Medallion Architecture.

**Flow:**  
CSV Files → Stage → Bronze → Silver → Gold → Snowsight Dashboard

### Layers
- **Stage**: Raw CSV files stored using Snowflake stages
- **Bronze**: Raw, unmodified ingestion tables
- **Silver**: Cleaned, validated, business-conformed data
- **Gold**: Aggregated and analytics-ready tables for BI consumption


---

## 4. Data Ingestion (Bronze Layer)

### Source
- CSV file containing hotel booking data

### Steps
- Define CSV file format
- Create Snowflake stage
- Load data into Bronze table using `COPY INTO`

### Design Principles
- Bronze tables store **raw, immutable data**
- No business logic applied at this stage
- Acts as a reliable source of truth for reprocessing

---

## 5. Data Transformation & Quality Checks (Silver Layer)

The Silver layer standardizes and cleans the raw data before analytics.

### Key Transformations
- Cast string fields to appropriate data types
- Standardize city and customer names
- Normalize email addresses
- Convert date fields safely using `TRY_TO_DATE`
- Enforce positive revenue values
- Correct booking status typos
- Remove logically invalid records (e.g., checkout before check-in)

### Result
- Clean, validated, business-ready booking dataset
- Safe foundation for analytical modeling

---

## 6. Analytics Modeling (Gold Layer)

The Gold layer contains datasets optimized for reporting and dashboards.

### Tables Created
- Daily booking and revenue aggregates
- City-level revenue summaries
- Clean booking fact table

### Purpose
- Minimize computation at query time
- Enable fast, consistent BI queries
- Align tables directly with business requirements

---

## 7. Dashboard & KPIs (Snowsight)

The Gold layer powers a Snowsight dashboard designed for business stakeholders.

### KPIs
- Average Booking Value
- Total Guests
- Total Bookings
- Total Revenue

### Visualizations
- Monthly Revenue Trend (line chart)
- Monthly Booking Trend (line chart)
- Top Cities by Revenue (bar chart)
- Bookings by Status (bar chart)
- Bookings by Room Type (bar chart)

Dashboard SQL queries are included in the `sql/` directory, and dashboard screenshots are available in the `dashboards/` folder.

---

## 8. Repository Structure

Snowflake-Hotel-Booking-EndtoEnd-Pipeline/
│
├── architecture/ # Architecture & data flow diagram
├── dashboards/ # Snowsight dashboard screenshot
├── data/ # Source CSV file
├── docs/ # Business requirements & documentation
├── sql/
│ ├── stage_setup.sql
│ ├── bronze_load.sql
│ ├── silver_transformations.sql
│ └── gold_analytics.sql
└── README.md

---

## 9. Technologies Used

- **Snowflake**
- **SQL**
- **Snowflake Stages & COPY INTO**
- **Medallion Architecture (Bronze–Silver–Gold)**
- **Snowsight BI Dashboard**

---

## 10. Key Takeaways

- Demonstrates real-world Snowflake data modeling patterns
- Shows how raw data evolves into analytics-ready insights
- Aligns technical implementation directly with business requirements
- Designed to be scalable, readable, and production-oriented


