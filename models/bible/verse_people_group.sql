{{ config(materialized='table') }}

--verse_people_group
WITH base AS (
SELECT DISTINCT
  osisRef AS osis_verse,
  people_group
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.peopleGroups)) people_group
WHERE verse.peopleGroups IS NOT NULL
)
SELECT
  MD5(CONCAT(osis_verse, people_group)) AS pk,
  osis_verse,
  people_group
FROM base