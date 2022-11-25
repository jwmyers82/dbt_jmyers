{{ config(materialized='table') }}

-- place_book
SELECT DISTINCT
  place.placeID as location_id,
  osis_book
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.booksWritten)) osis_book
  WHERE place.booksWritten IS NOT NULL