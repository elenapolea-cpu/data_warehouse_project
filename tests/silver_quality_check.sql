/*
Quality Checks

Script purpose:
This script performs various quality checks for data consistency, 
accuracy and standardization across the 'silver' schema. It includes checks for:
- Null or duplicate primary keys
- Unwanted spaces in string fields
- Data standardization and consistency
- Invalid date ranges and orders
- Data consistency between related fields

Usage Notes:
- Run these checks after data loading to silver Layer
- Investigate and resolve any problems found during the checks

*/
-- =================================
-- Check silver.crm_cust_info
-- =================================
-- Check if duplicated id from Broze layer were not passed to Silver
-- Expectation: No Result
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
FROM silver.crm_cust_info
WHERE cst_id = 29466

-- check for all duplicates
-- Expectation: No Result
SELECT
* 
FROM (
	SELECT
	*,
	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as flag_last
	FROM silver.crm_cust_info
)t WHERE flag_last!=1

-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Result

SELECT
cst_id,
COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

-- Check for unwanted spaces
-- Expectation: No Result

SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname) OR cst_firstname IS NULL;

SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname) ;

-- Data Standardization & Consistency
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info;

--==============================================
-- Check silver.crm_prd_info
--==============================================
-- Check for NULLs or Duplicates in Primary Key
-- Expectation: No Result

SELECT
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Check for unwanted Spaces
-- Expectation: No Result

SELECT prd_nm
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLS or Negative Numbers
-- Expectation: No Result

SELECT prd_cost
FROM silver.crm_prd_info
WHERE prd_cost <0 OR prd_cost IS NULL;

-- Data Standardiztion & Consistency
SELECT DISTINCT prd_line
FROM silver.crm_prd_info;

-- Check for Invalid Date Orders
SELECT *
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- Check if the dates have been updated
SELECT
prd_id,
prd_key,
prd_nm,
prd_start_dt,
prd_end_dt,
LEAD(prd_start_dt) OVER (PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS prd_end_dt_test
FROM bronze.crm_prd_info
WHERE prd_key IN ('AC-HE-HL-U509-R','AC-HE-HL-U509' );

SELECT 
*
FROM silver.crm_prd_info
WHERE prd_id = 215;

--===================================
-- Check silver.crm_sales_details
--===================================
-- Check silver data
SELECT * FROM silver.crm_sales_details
WHERE sls_ord_num != TRIM(sls_ord_num)

-- Check for NULLs
-- Expectation: No Result
SELECT
sls_sales,
sls_quantity,
sls_price
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price 
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <= 0 OR sls_quantity <=0 OR sls_price <=0 

-- Check the consequence of dates
SELECT
*
FROM silver.crm_sales_details
WHERE sls_order_dt> sls_ship_dt OR sls_order_dt>sls_due_dt
--===================================
-- Checking 'bronze.erp_px_cat_g1v2'
--===================================
-- Check ids
SELECT 
id
FROM bronze.erp_px_cat_g1v2
WHERE id NOT IN (SELECT prd_key FROM bronze.crm_prd_info )

-- Check for unwanted spaces
SELECT * FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)
