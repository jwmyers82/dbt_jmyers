{{ config(materialized='table') }}

-- place_book
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  osis_book
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.booksWritten)) osis_book
  WHERE place.booksWritten IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, osis_book)) AS pk,
  location_id,
  osis_book
FROM base