{{ config(materialized='table') }}

-- book_place
SELECT DISTINCT
  book.osisName AS osis_book,
  LTRIM(RTRIM(placeWritten)) AS place_written
FROM `mockecommerce-342202.bible.theography_books` AS book,
UNNEST(SPLIT(book.placeWritten)) placeWritten
WHERE book.placeWritten IS NOT NULL