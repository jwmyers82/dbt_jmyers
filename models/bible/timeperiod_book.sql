{{ config(materialized='table') }}

-- timeperiod_book
WITH base AS (
SELECT DISTINCT
  period.yearNum AS year_num,
  osis_book
FROM `mockecommerce-342202.bible.theography_periods` period,
  UNNEST(SPLIT(period.booksWritten)) osis_book
  WHERE period.booksWritten IS NOT NULL
)
SELECT
  MD5(CONCAT(year_num, osis_book)) AS pk,
  year_num,
  osis_book
FROM base