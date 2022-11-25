{{ config(materialized='table') }}

-- event_verse
SELECT DISTINCT
  event.id AS timeline_event_id,
  osis_verse
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.verses)) osis_verse
WHERE event.verses IS NOT NULL