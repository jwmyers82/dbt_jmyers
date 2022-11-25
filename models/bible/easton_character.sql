{{ config(materialized='table') }}

-- easton_character
SELECT DISTINCT
  `index` AS dictionary_id,
  person_key
FROM `mockecommerce-342202.bible.theography_easton` easton,
UNNEST(SPLIT(easton.personLookup)) person_key
  WHERE easton.personLookup IS NOT NULL
  AND easton.personLookup != ''