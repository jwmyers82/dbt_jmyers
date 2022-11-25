{{ config(materialized='table') }}

-- chapter_author
SELECT DISTINCT
  chapter.osisRef AS osis_chapter,
  writer
FROM `mockecommerce-342202.bible.theography_chapters` chapter,
UNNEST(SPLIT(chapter.writer)) writer
WHERE chapter.writer IS NOT NULL