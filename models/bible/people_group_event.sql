{{ config(materialized='table') }}

-- people_group_event
SELECT DISTINCT
  groupName AS people_group,
  timeline_event_name
FROM `mockecommerce-342202.bible.theography_people_groups` people_group,
  UNNEST(SPLIT(people_group.events_dev)) timeline_event_name
  WHERE people_group.events_dev IS NOT NULL