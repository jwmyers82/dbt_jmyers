{{ config(materialized='table') }}

--book_author
WITH base AS (
  SELECT DISTINCT
    book.osisName AS osis_book,
    LTRIM(RTRIM(writers)) AS author
  FROM `mockecommerce-342202.bible.theography_books` AS book,
  UNNEST(SPLIT(book.writers)) writers
  WHERE book.writers IS NOT NULL
)
SELECT 
  MD5(CONCAT(osis_book, author)) AS pk,
  osis_book,
  author
FROM base