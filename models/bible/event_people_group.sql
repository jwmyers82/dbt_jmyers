{{ config(materialized='table') }}

-- event_people_groups
WITH base AS (
SELECT DISTINCT
  event.id AS timeline_event_id,
  people_group
FROM `mockecommerce-342202.bible.theography_events` event,
UNNEST(SPLIT(event.`groups`)) people_group
WHERE event.`groups` IS NOT NULL
)
SELECT
  MD5(CONCAT(timeline_event_id, people_group)) AS pk,
  timeline_event_id,
  people_group
FROM base