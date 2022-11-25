{{ config(materialized='table') }}

-- event_participant
SELECT DISTINCT
  event.id AS timeline_event_id,
  participant
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.participants)) participant
WHERE event.participants IS NOT NULL