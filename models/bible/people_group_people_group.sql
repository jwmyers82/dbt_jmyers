{{ config(materialized='table') }}

-- people_group_people_group
WITH base AS (
SELECT DISTINCT
  groupName AS people_group,
  partOf AS related_people_group
FROM `mockecommerce-342202.bible.theography_people_groups`
)
SELECT
  MD5(CONCAT(people_group, related_people_group)) AS pk,
  people_group,
  related_people_group
FROM base