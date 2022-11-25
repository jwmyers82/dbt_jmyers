{{ config(materialized='table') }}

-- people_group_verse
SELECT DISTINCT
  groupName AS people_group,
  osis_verse
FROM `mockecommerce-342202.bible.theography_people_groups` people_group,
  UNNEST(SPLIT(people_group.verses)) osis_verse
  WHERE people_group.verses IS NOT NULL