{{ config(materialized='table') }}

-- event_character
SELECT DISTINCT
  event.id AS timeline_event_id,
  character
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.people__from_verses_)) character
WHERE event.people__from_verses_ IS NOT NULL