{{ config(materialized='table') }}

-- timeperiod_event
WITH base AS (
SELECT DISTINCT
  period.yearNum AS year_num,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_periods` period,
  UNNEST(SPLIT(period.events)) timeline_event_name
  WHERE period.events IS NOT NULL
)
SELECT
  MD5(CONCAT(year_num, timeline_event_name)) AS pk,
  year_num,
  timeline_event_name
FROM base