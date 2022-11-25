{{ config(materialized='table') }}

-- event_verse
WITH base AS (
SELECT DISTINCT
  event.id AS timeline_event_id,
  osis_verse
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.verses)) osis_verse
WHERE event.verses IS NOT NULL
)
SELECT
  MD5(CONCAT(timeline_event_id, osis_verse)) AS pk,
  timeline_event_id,
  osis_verse
FROM base