{{ config(materialized='table') }}

-- place_event
SELECT DISTINCT
  place.placeID as location_id,
  timeline_event_id
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.eventsHere)) timeline_event_id
  WHERE place.eventsHere IS NOT NULL