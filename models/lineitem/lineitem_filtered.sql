{{ config(materialized='table') }}

SELECT * FROM {{ ref('lineitem_base') }} 
WHERE last_record = 1 