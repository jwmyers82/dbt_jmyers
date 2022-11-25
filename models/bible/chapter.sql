{{ config(materialized='table') }}

-- chapter
SELECT DISTINCT
  osisRef AS osis_chapter,
  book AS osis_book,
  chapterNum AS chapter_num,
  slug
FROM `mockecommerce-342202.bible.theography_chapters`