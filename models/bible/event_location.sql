{{ config(materialized='table') }}

-- event_location
SELECT DISTINCT
  event.id AS timeline_event_id,
  location
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.locations)) location
WHERE event.locations IS NOT NULL