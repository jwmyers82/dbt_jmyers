{{ config(materialized='table') }}

-- easton
SELECT DISTINCT
  dictLookup AS dictionary_lookup,
  `index` AS dictionary_id,
  termID AS term_id,
  termLabel AS term_label,
  dictText AS dictionary_text,
  def_id AS definition_id,
  matchType AS match_type
FROM `mockecommerce-342202.bible.theography_easton`