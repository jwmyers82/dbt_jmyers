{{ config(materialized='table') }}

-- place_character
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  character
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.hasBeenHere)) character
  WHERE place.hasBeenHere IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, character)) AS pk,
  location_id,
  character
FROM base