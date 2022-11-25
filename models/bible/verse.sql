{{ config(materialized='table') }}

-- verse
SELECT DISTINCT
  verseID AS verse_id,
  osisRef AS osis_verse,
  chapter AS osis_chapter,
  book AS osis_book,
  verseNum AS verse_num,
  verseText AS verse_text,
  mdText AS md_text,
  richText AS rich_text,
  yearNum AS year_num,
  eventsDescribed AS events_described,
  eventsReferenced AS events_referenced
FROM `mockecommerce-342202.bible.theography_verses`