{{ config(materialized='table') }}

-- place_verse
SELECT DISTINCT
  place.placeID as location_id,
  osis_verse
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.verses)) osis_verse
  WHERE place.verses IS NOT NULL