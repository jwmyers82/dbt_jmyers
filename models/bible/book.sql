{{ config(materialized='table') }}

-- book
SELECT DISTINCT
  osisName AS osis_book,
  bookOrder AS book_num,
  bookName AS book_name,
  bookDiv AS book_division,
  testament,
  slug,
  yearWritten AS year_completed
FROM `mockecommerce-342202.bible.theography_books`