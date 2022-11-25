{{ config(materialized='table') }}

-- easton_character
WITH base AS (
  SELECT DISTINCT
    `index` AS dictionary_id,
    person_key
  FROM `mockecommerce-342202.bible.theography_easton` easton,
  UNNEST(SPLIT(easton.personLookup)) person_key
    WHERE easton.personLookup IS NOT NULL
    AND easton.personLookup != ''
)
SELECT
  MD5(CONCAT(dictionary_id, person_key)) AS pk,
  dictionary_id,
  person_key
FROM base