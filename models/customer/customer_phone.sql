{{ config(materialized='table') }}

WITH base AS (
    SELECT  
        customer_customerid, 
        REGEXP_REPLACE(customer_phone, '([^0-9])', '') AS customer_phone
    FROM `mockecommerce-342202.base.suborder` 
    WHERE customer_phone IS NOT NULL 
    GROUP BY 1,2
) 
SELECT 
    MD5(CONCAT(customer_customerid, customer_phone)) AS pk, 
    *
FROM base 