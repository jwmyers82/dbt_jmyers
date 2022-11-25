{{ config(materialized='table') }}

-- character_alias
SELECT DISTINCT
  person.personLookup AS person_key,
  alias
FROM `mockecommerce-342202.bible.theography_people` person,
UNNEST(SPLIT(person.alsoCalled)) alias
WHERE person.alsoCalled IS NOT NULL