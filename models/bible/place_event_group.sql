{{ config(materialized='table') }}

-- place_event_group
SELECT DISTINCT
  place.placeID as location_id,
  event_group
FROM `mockecommerce-342202.bible.theography_places` place,
  UNNEST(SPLIT(place.eventGroups)) event_group
  WHERE place.eventGroups IS NOT NULL