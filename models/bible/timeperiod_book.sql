{{ config(materialized='table') }}

-- timeperiod_book
SELECT DISTINCT
  period.yearNum AS year_num,
  osis_book
FROM `mockecommerce-342202.bible.theography_periods` period,
  UNNEST(SPLIT(period.booksWritten)) osis_book
  WHERE period.booksWritten IS NOT NULL