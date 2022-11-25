{{ config(materialized='table') }}

-- place_life_event
WITH birth AS (
SELECT DISTINCT
  place.placeID as location_id,
    "birth" AS life_event,
    character
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.peopleBorn)) character
  WHERE place.peopleBorn IS NOT NULL
),
death AS (
SELECT DISTINCT
  place.placeID as location_id,
    "death" AS life_event,
    character
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.peopleDied)) character
  WHERE place.peopleDied IS NOT NULL
),
base AS (
SELECT * FROM birth
UNION ALL
SELECT * FROM death
)
SELECT
  MD5(CONCAT(location_id, life_event, character)) AS pk,
  location_id,
  life_event,
  character
FROM base