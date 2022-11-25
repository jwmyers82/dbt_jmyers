{{ config(materialized='table') }}

-- place_character
SELECT DISTINCT
  place.placeID as location_id,
  person
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.hasBeenHere)) person
  WHERE place.hasBeenHere IS NOT NULL