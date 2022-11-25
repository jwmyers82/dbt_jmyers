{{ config(materialized='table') }}

-- event_character
WITH base AS (
SELECT DISTINCT
  event.id AS timeline_event_id,
  character
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.people__from_verses_)) character
WHERE event.people__from_verses_ IS NOT NULL
)
SELECT
  MD5(CONCAT(timeline_event_id, character)) AS pk,
  timeline_event_id,
  character
FROM base