{{ config(materialized='table') }}

-- character_event
SELECT DISTINCT
  person.personLookup AS person_key,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_people` person,
UNNEST(SPLIT(person.events)) timeline_event_name
WHERE person.events IS NOT NULL