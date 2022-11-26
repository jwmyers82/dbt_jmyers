{{ config(materialized='table') }}

--verse_quote
WITH base AS (
  SELECT DISTINCT
    osisRef AS osis_verse,
    quotes_from
  FROM `mockecommerce-342202.bible.theography_verses` verse,
  UNNEST(SPLIT(verse.quotesFrom)) quotes_from
  WHERE verse.quotesFrom IS NOT NULL
),
combined AS (
SELECT
  osis_verse,
  quotes_from
FROM base
UNION ALL
SELECT
  string_field_1 AS osis_verse,
  string_field_0 AS quotes_from
FROM `mockecommerce-342202.bible.cross_references` 
WHERE string_field_1 != 'osis_verse_start'
)
SELECT DISTINCT
  MD5(CONCAT(osis_verse, quotes_from)) AS pk,
  osis_verse,
  quotes_from
FROM combined