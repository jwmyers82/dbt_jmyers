{{ config(materialized='table') }}

--verse_people_group
SELECT DISTINCT
  osisRef AS osis_verse,
  people_group
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.peopleGroups)) people_group
WHERE verse.peopleGroups IS NOT NULL