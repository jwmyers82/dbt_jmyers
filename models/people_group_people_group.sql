{{ config(materialized='table') }}

-- people_group_people_group
SELECT DISTINCT
  groupName AS people_group,
  partOf AS related_people_group
FROM `mockecommerce-342202.bible.theography_people_groups`