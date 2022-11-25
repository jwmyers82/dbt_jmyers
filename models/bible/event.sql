{{ config(materialized='table') }}

-- event
SELECT DISTINCT
  title AS timeline_event_name,
  id AS timeline_event_id,
  startDate AS start_date,
  duration,
  predecessor AS preceeding_timeline_event_name,
  `lag` AS lag_between_timeline_event_start_dates,
  partOf AS timeline_event_context,
  notes,
  verseSort AS sort
FROM `mockecommerce-342202.bible.theography_events`