{{ config(materialized='table') }}

-- character_verse
WITH base AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    osis_verse
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.verses)) osis_verse
  WHERE person.verses IS NOT NULL
)
SELECT
  MD5(CONCAT(person_key, osis_verse)) AS pk,
  person_key,
  osis_verse
FROM base