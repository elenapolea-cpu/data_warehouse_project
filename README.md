# Data Warehouse Project

Data Warehouse and Analytics Project, step by step

## 🚀 Project Requirements

### 📗 1. Building the Data Warehouse (Data Engineering)

#### :pushpin: Objective
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

#### :pencil2: Specifications
- **Data Sources**: Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality**: Cleanse and resolve data quality issues prior to analysis.
- **Integration**: Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope**: Focus on the latest dataset only; historization of data is not required.
- **Documentation**: Provide clear documentation of the data model to support both business stakeholders and analytics teams.
---

### :bookmark_tabs: Implementation steps
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
- Commit Code in Git Repo

**6. Build Gold Layer** (business ready data)

- Analysing: Explore Business Objects
- Coding: Data Integration
- Validating: Data Integration Checks
- Document: Draw Data Model of Star Schema, extend Data Flow 
- Commit Code in Git Repo
---

**:heavy_check_mark: Medallion data architecture** 
<img width="1302" height="682" alt="image" src="https://github.com/user-attachments/assets/bb27b082-a34e-4d02-a6ed-6e0217440edd" />

**:heavy_check_mark: Source data structure**
<img width="1340" height="405" alt="image" src="https://github.com/user-attachments/assets/f54b56cb-1c48-4c74-9322-adf4e016fd6f" />

**:heavy_check_mark: Gold layer - Fact and Dimension Tables of STAR schema**
<img width="1204" height="703" alt="image" src="https://github.com/user-attachments/assets/c352f5d5-6568-4261-8e9c-6f3a012da9cb" />

---
### :bar_chart: 2. BI: Analytics & Reporting (Data Analysis)

#### :pushpin: Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**

#### :pencil2: Specifications
- **Data Sources**: Golden layer views
- **Scope**: Create reports with key business metrics to analyze Customers and Products, enabling strategic decision-making
- **Documentation**: Save the scripts of the reports with detailed explanations for future use of technical and non-technical stakeholders (directory -  data_warehouse_project/scripts/gold )

#### 

#### Examples of SQL requests in MS SQL Server Management Studio for creating Reports for stakeholders
**:heavy_check_mark: Customer Behavior Report**
<img width="1452" height="961" alt="image" src="https://github.com/user-attachments/assets/644f8e09-8e25-467d-b4f1-cc7abe973a31" />

**:heavy_check_mark: Product Performance Report**
<img width="1460" height="965" alt="image" src="https://github.com/user-attachments/assets/52939c49-b554-4e93-a218-8749fdb0a938" />

#### Examples of SQL requests for calculating key business metrics, that are typically displayed on Dashboards

<img width="1200" height="905" alt="image" src="https://github.com/user-attachments/assets/ab652cb4-334b-4910-becd-efc361a9584b" />

<img width="1213" height="964" alt="image" src="https://github.com/user-attachments/assets/33e37182-5879-41b3-ac43-e1528fc8de54" />

<img width="1206" height="509" alt="image" src="https://github.com/user-attachments/assets/be66608a-0723-47e7-ba31-6579e7639568" />

<img width="1215" height="723" alt="image" src="https://github.com/user-attachments/assets/917ac184-a9b3-4ee0-85b8-3c32fadc332c" />

<img width="1197" height="967" alt="image" src="https://github.com/user-attachments/assets/7b1afdd3-c6a0-4aae-8b79-01bf1183619e" />





















