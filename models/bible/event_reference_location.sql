{{ config(materialized='table') }}

-- event_reference_location
SELECT DISTINCT
  event.id AS timeline_event_id,
  reference_location
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.places__from_verses_)) reference_location
WHERE event.places__from_verses_ IS NOT NULL