{{ config(materialized='table') }}

SELECT * FROM {{ ref('suborder_base') }} 
WHERE last_record = 1 