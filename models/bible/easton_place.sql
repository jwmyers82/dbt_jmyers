{{ config(materialized='table') }}

-- easton_place
SELECT DISTINCT
  `index` AS dictionary_id,
  location
FROM `mockecommerce-342202.bible.theography_easton` easton,
UNNEST(SPLIT(easton.placeLookup)) location
  WHERE easton.placeLookup IS NOT NULL
  AND easton.placeLookup != ''