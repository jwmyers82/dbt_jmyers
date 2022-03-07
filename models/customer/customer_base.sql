{{ config(materialized='table') }}

WITH base AS (
    SELECT  
        customer_customerid, 
        DATETIME(customer_createdat, "America/New_York") AS customer_created_at_est, 
        LOWER(customer_firstname) AS customer_firstname, 
        LOWER(customer_lastname) AS customer_lastname, 
        row_number() over (partition by suborderid order by modifiedat DESC) as last_record, 
        createdat, 
        orderid, 
        suborderid 
    FROM `mockecommerce-342202.base.suborder` 
) 
SELECT 
    customer_customerid, 
    customer_created_at_est, 
    customer_firstname, 
    customer_lastname, 
    MIN(DATETIME(createdat, "America/New_York")) AS first_purchase_date_est, 
    MAX(DATETIME(createdat, "America/New_York")) AS most_recent_purchase_date_est, 
    COUNT(DISTINCT orderid) AS lifetime_orders, 
    COUNT(DISTINCT suborderid) AS lifetime_suborders 
FROM base 
WHERE last_record = 1 
GROUP BY 1,2,3,4 