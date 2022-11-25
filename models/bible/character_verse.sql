{{ config(materialized='table') }}

-- character_verse
SELECT DISTINCT
  person.personLookup AS person_key,
  osis_verse
FROM `mockecommerce-342202.bible.theography_people` person,
UNNEST(SPLIT(person.verses)) osis_verse
WHERE person.verses IS NOT NULL