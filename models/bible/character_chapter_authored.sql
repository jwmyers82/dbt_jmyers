{{ config(materialized='table') }}

-- character_chapter_authored
SELECT DISTINCT
  person.personLookup AS person_key,
  osis_chapter
FROM `mockecommerce-342202.bible.theography_people` person,
UNNEST(SPLIT(person.chaptersWritten)) osis_chapter
WHERE person.chaptersWritten IS NOT NULL