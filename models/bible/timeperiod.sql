{{ config(materialized='table') }}

-- timeperiod
SELECT DISTINCT
  yearNum AS year_num,
  formattedYear AS year
FROM `mockecommerce-342202.bible.theography_periods`