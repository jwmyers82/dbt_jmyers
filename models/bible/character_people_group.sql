{{ config(materialized='table') }}

-- character_people_group
SELECT DISTINCT
  person.personLookup AS person_key,
  people_group
FROM `mockecommerce-342202.bible.theography_people` person,
UNNEST(SPLIT(person.memberOf)) people_group
WHERE person.memberOf IS NOT NULL