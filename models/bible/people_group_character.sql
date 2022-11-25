{{ config(materialized='table') }}

-- people_group_character
SELECT DISTINCT
  groupName AS people_group,
  person
FROM `mockecommerce-342202.bible.theography_people_groups` people_group,
  UNNEST(SPLIT(people_group.members)) person
  WHERE people_group.members IS NOT NULL