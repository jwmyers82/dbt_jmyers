{{ config(materialized='table') }}

-- timeperiod_life_event
WITH birth AS (
  SELECT DISTINCT
    period.yearNum AS year_num,
    "birth" AS life_event,
    person
  FROM `mockecommerce-342202.bible.theography_periods` period,
    UNNEST(SPLIT(period.peopleBorn)) person
    WHERE period.peopleBorn IS NOT NULL
),
death AS (
  SELECT DISTINCT
    period.yearNum AS year_num,
    "death" AS life_event,
    person
  FROM `mockecommerce-342202.bible.theography_periods` period,
    UNNEST(SPLIT(period.peopleDied)) person
    WHERE period.peopleDied IS NOT NULL
)
SELECT * FROM birth
UNION ALL
SELECT * FROM death