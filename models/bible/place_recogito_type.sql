{{ config(materialized='table') }}

-- place_recogito_type
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  recogito_type
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.recogitoType)) recogito_type
  WHERE place.recogitoType IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, recogito_type)) AS pk,
  location_id,
  recogito_type
FROM base