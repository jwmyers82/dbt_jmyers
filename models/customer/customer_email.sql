{{ config(materialized='table') }}

WITH base AS (
    SELECT  
        customer_customerid, 
        LOWER(customer_email) AS customer_email
    FROM `mockecommerce-342202.base.suborder` 
    WHERE customer_email IS NOT NULL 
    GROUP BY 1,2
) 
SELECT 
    MD5(CONCAT(customer_customerid, customer_email)) AS pk, 
    *
FROM base 