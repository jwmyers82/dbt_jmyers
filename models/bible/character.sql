{{ config(materialized='table') }}

--character
SELECT DISTINCT
  personID AS person_id,
  personLookup AS person_key,
  displayTitle AS name_title,
  name AS given_name,
  surname,
  slug,
  gender,
  birthYear AS birth_year,
  deathYear AS death_year,
  minYear AS first_reference_year,
  maxYear AS last_reference_year,
  birthPlace AS birth_location,
  deathPlace AS death_location,
  dictionaryLink AS dictionary_link,
  dictionaryText AS dictionary_text,
  dictText AS alt_dictionary_text
FROM `mockecommerce-342202.bible.theography_people`