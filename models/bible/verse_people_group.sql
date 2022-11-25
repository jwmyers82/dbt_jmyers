{{ config(materialized='table') }}

--verse_people_group
SELECT DISTINCT
  osisRef AS osis_verse,
  people_groups
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.peopleGroups)) people_groups
WHERE verse.peopleGroups IS NOT NULL