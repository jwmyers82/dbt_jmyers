{{ config(materialized='table') }}

--verse_quote
WITH base AS (
SELECT DISTINCT
  osisRef AS osis_verse,
  quotes_from
FROM `mockecommerce-342202.bible.theography_verses` verse,
UNNEST(SPLIT(verse.quotesFrom)) quotes_from
WHERE verse.quotesFrom IS NOT NULL
)
SELECT
  MD5(CONCAT(osis_verse, quotes_from)) AS pk,
  osis_verse,
  quotes_from
FROM base