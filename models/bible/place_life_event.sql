{{ config(materialized='table') }}

-- place_life_event
WITH birth AS (
SELECT DISTINCT
  place.placeID as location_id,
    "birth" AS life_event,
    person
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.peopleBorn)) person
  WHERE place.peopleBorn IS NOT NULL
),
death AS (
SELECT DISTINCT
  place.placeID as location_id,
    "death" AS life_event,
    person
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.peopleDied)) person
  WHERE place.peopleDied IS NOT NULL
)
SELECT * FROM birth
UNION ALL
SELECT * FROM death