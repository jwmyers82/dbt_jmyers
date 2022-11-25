{{ config(materialized='table') }}

-- chapter_author
WITH base AS (
  SELECT DISTINCT
    chapter.osisRef AS osis_chapter,
    author
  FROM `mockecommerce-342202.bible.theography_chapters` chapter,
  UNNEST(SPLIT(chapter.writer)) author
  WHERE chapter.writer IS NOT NULL
)
SELECT 
  MD5(CONCAT(osis_chapter, author)) AS pk,
  osis_chapter,
  author
FROM base