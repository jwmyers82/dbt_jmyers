{{ config(materialized='table') }}

-- place_timeline
SELECT DISTINCT
  place.placeID as location_id,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.timeline)) timeline_event_name
  WHERE place.timeline IS NOT NULL