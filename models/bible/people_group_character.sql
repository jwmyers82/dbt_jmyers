{{ config(materialized='table') }}

-- people_group_character
WITH base AS (
SELECT DISTINCT
  groupName AS people_group,
  character
FROM `mockecommerce-342202.bible.theography_people_groups` people_group,
  UNNEST(SPLIT(people_group.members)) character
  WHERE people_group.members IS NOT NULL
  )
SELECT
  MD5(CONCAT(people_group, character)) AS pk,
  people_group,
  character
FROM base