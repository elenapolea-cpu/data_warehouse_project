# Data Warehouse Project

Data Warehouse and Analytics Project, step by step

## 🚀 Project Requirements

### Building the Data Warehouse (Data Engineering)

#### Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.
---

### BI: Analytics & Reporting (Data Analysis)

#### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

These insights empower stakeholders with key business metrics, enabling strategic decision-making.  


## Implementation steps
**1. Requirements Analysis**
 
 - Understand requirements, analyze source datasets
 
**2. Design Data Architecture**

- Choose Data Management Approach
- Brainstorm and design the layers
- Draw the data architecture

**3. Project Initialization**

- Define naming rules
- Create GIT repo, create folders, add to Github
- Create DB and Schemas

**4. Build Bronze Layer** (raw, unprocessed data as-is from sources)

- Analyze Source systems
- Coding: Data ingestion
- Validating: Data Completeness and Schema checks
- Commit code: DDL script, stored procedure script

**5. Build Silver Layer** (clean and standardized data) 

- Analysing: Explore & Understand Data
- Document: Draw Data Integration
- Coding: Data Cleaning, Data Standardization, Data Normalization
- Validating: Data Correctness Checks
- Document: Extend Data Flow 
- Commit Code in Git Repo

**6. Build Gold Layer** (business ready data)

- Analysing: Explore Business Objects
- Coding: Data Integration
- Validating: Data Integration Checks
- Document: Draw Data Model of Star Schema (Draw.io)
- Document: Create Data Catalog
- Document: Extend Data Flow (Draw.io)
- Commit Code in Git Repo

Medallion data architecture: 
<img width="1302" height="682" alt="image" src="https://github.com/user-attachments/assets/bb27b082-a34e-4d02-a6ed-6e0217440edd" />

