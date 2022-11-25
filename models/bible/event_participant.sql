{{ config(materialized='table') }}

-- event_participant
WITH base AS (
SELECT DISTINCT
  event.id AS timeline_event_id,
  participant
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.participants)) participant
WHERE event.participants IS NOT NULL
)
SELECT
  MD5(CONCAT(timeline_event_id, participant)) AS pk,
  timeline_event_id,
  participant
FROM base