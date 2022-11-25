{{ config(materialized='table') }}

--verse_timeline
SELECT DISTINCT
  osisRef AS osis_verse,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.timeline)) timeline_event_name
WHERE verse.timeline IS NOT NULL