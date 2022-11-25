{{ config(materialized='table') }}

-- place_alias
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  alias
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.aliases)) alias
  WHERE place.aliases IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, alias)) AS pk,
  location_id,
  alias
FROM base