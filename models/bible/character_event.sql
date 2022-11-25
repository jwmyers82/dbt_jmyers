{{ config(materialized='table') }}

-- character_event
WITH base AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    timeline_event_name
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.events)) timeline_event_name
  WHERE person.events IS NOT NULL
)
SELECT
  MD5(CONCAT(person_key, timeline_event_name)) AS pk,
  person_key,
  timeline_event_name
FROM base