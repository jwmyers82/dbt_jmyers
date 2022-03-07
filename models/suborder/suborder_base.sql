{{ config(materialized='table') }}

SELECT  
    order_number, 
    suborderid AS suborder_number, 
    row_number() over (partition by suborderid order by modifiedat DESC) as last_record, 
    DATETIME(createdat, "America/New_York") AS purchase_at_est, 
    DATETIME(delivery_starttime, "America/New_York") AS delivery_at_est, 
    first_value(DATETIME(delivery_starttime, "America/New_York")) over (partition by suborderid order by __hevo__ingested_at rows between unbounded preceding and unbounded following) as original_delivery_at_utc,
    REGEXP_REPLACE(customer_phone, '([^0-9])', '') AS customer_phone, 
    REGEXP_REPLACE(recipient_phone, '([^0-9])', '') AS recipient_phone, 
    DATETIME(statusdate, "America/New_York") AS status_at_est, 
    DATETIME(fulfillmentdate, "America/New_York") AS fulfillment_at_est,
    __hevo__marked_deleted AS is_deleted 
FROM `mockecommerce-342202.base.suborder` 