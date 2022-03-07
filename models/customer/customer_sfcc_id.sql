{{ config(materialized='table') }}

WITH base AS (
    SELECT  
        customer_customerid, 
        customer_salesforceid 
    FROM `mockecommerce-342202.base.suborder` 
    WHERE customer_salesforceid IS NOT NULL 
    GROUP BY 1,2
) 
SELECT 
    MD5(CONCAT(customer_customerid, customer_salesforceid)) AS pk, 
    *
FROM base 