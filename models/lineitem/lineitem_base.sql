{{ config(materialized='table') }}

SELECT 
    MD5(CONCAT(__hevo_ref_id, __hevo_array_index, __hevo__ingested_at)) AS pk, 
    row_number() over (partition by CONCAT(RIGHT(__hevo_ref_id, LENGTH(__hevo_ref_id)-(STRPOS(__hevo_ref_id, ":")+9)), '-', __hevo_array_index) order by __hevo__ingested_at DESC) as last_record,
    -- RIGHT(LEFT(__hevo_ref_id, STRPOS(__hevo_ref_id, ":")-1), LENGTH(LEFT(__hevo_ref_id, STRPOS(__hevo_ref_id, ":")-1))-6) AS order_number, 
    RIGHT(__hevo_ref_id, LENGTH(__hevo_ref_id)-(STRPOS(__hevo_ref_id, ":")+9)) AS suborder_number, 
    CONCAT(RIGHT(__hevo_ref_id, LENGTH(__hevo_ref_id)-(STRPOS(__hevo_ref_id, ":")+9)), '-', __hevo_array_index) AS lineitem_number, 
    TIMESTAMP_MILLIS(__hevo__ingested_at) AS ingested_at_utc, 
    DATETIME(TIMESTAMP_MILLIS(__hevo__ingested_at), "America/New_York") AS ingested_at_est, 
    * 
FROM `mockecommerce-342202.base.lineitem` 
