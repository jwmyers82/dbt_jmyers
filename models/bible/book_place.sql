{{ config(materialized='table') }}

-- book_place
WITH base AS (
  SELECT DISTINCT
    book.osisName AS osis_book,
    LTRIM(RTRIM(placeWritten)) AS place_written
  FROM `mockecommerce-342202.bible.theography_books` AS book,
  UNNEST(SPLIT(book.placeWritten)) placeWritten
  WHERE book.placeWritten IS NOT NULL
)
SELECT
  MD5(CONCAT(osis_book, place_written)) AS pk,
  osis_book,
  place_written
FROM base