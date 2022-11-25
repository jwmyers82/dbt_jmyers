{{ config(materialized='table') }}

-- place_event
WITH base AS (
SELECT DISTINCT
  place.placeID as location_id,
  timeline_event_id
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.eventsHere)) timeline_event_id
  WHERE place.eventsHere IS NOT NULL
)
SELECT
  MD5(CONCAT(location_id, timeline_event_id)) AS pk,
  location_id,
  timeline_event_id
FROM base