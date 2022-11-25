{{ config(materialized='table') }}

-- event_location
WITH base AS (
SELECT DISTINCT
  event.id AS timeline_event_id,
  location
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.locations)) location
WHERE event.locations IS NOT NULL
)
SELECT
  MD5(CONCAT(timeline_event_id, location)) AS pk,
  timeline_event_id,
  location
FROM base