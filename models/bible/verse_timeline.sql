{{ config(materialized='table') }}

--verse_timeline
WITH base AS (
SELECT DISTINCT
  osisRef AS osis_verse,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.timeline)) timeline_event_name
WHERE verse.timeline IS NOT NULL
)
SELECT
  MD5(CONCAT(osis_verse, timeline_event_name)) AS pk,
  osis_verse,
  timeline_event_name
FROM base