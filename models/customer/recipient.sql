{{ config(materialized='table') }}

WITH base AS (
    SELECT  
        MD5(CONCAT(REGEXP_REPLACE(recipient_phone, '([^0-9])', ''), LOWER(recipient_email))) AS pk, 
        modifiedat, 
        LOWER(recipient_firstname) AS recipient_firstname, 
        LOWER(recipient_lastname) AS recipient_lastname, 
        LOWER(recipient_email) AS recipient_email, 
        REGEXP_REPLACE(recipient_phone, '([^0-9])', '') AS recipient_phone, 
        LOWER(recipient_address1) AS recipient_address1, 
        LOWER(recipient_address2) AS recipient_address2,  
        LOWER(recipient_city) AS recipient_city, 
        UPPER(recipient_state) AS recipient_state, 
        recipient_zipcode 
    FROM `mockecommerce-342202.base.suborder` 
    GROUP BY 1,2,3,4,5,6,7,8,9,10,11 
), 
flag AS (
    SELECT 
        *, 
        row_number() over (partition by pk order by modifiedat DESC) as last_record 
    FROM base
)
SELECT * FROM flag 
WHERE last_record = 1 
