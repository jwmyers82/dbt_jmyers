{{ config(materialized='table') }}

-- place_verse
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  osis_verse
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.verses)) osis_verse
  WHERE place.verses IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, osis_verse)) AS pk,
  location_id,
  osis_verse
FROM base