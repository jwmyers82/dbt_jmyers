{{ config(materialized='table') }}

--verse_character
WITH base AS (
SELECT DISTINCT
  osisRef AS osis_verse,
  character
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.people)) character
WHERE verse.people IS NOT NULL
)
SELECT
  MD5(CONCAT(osis_verse, character)) AS pk,
  osis_verse,
  character
FROM base