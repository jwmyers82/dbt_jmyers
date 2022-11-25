{{ config(materialized='table') }}

-- event_people_groups
SELECT DISTINCT
  event.id AS timeline_event_id,
  people_groups
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.`groups`)) people_groups
WHERE event.`groups` IS NOT NULL