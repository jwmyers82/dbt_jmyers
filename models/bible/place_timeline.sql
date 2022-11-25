{{ config(materialized='table') }}

-- place_timeline
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.timeline)) timeline_event_name
  WHERE place.timeline IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, timeline_event_name)) AS pk,
  location_id,
  timeline_event_name
FROM base