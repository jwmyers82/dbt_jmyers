{{ config(materialized='table') }}

-- place
SELECT DISTINCT
  placeLookup AS location,
  displayTitle AS display_name,
  kjvName AS kjv_name,
  esvName AS esv_name,
  featureType AS feature_type,
  openBibleLat AS open_bible_latitude,
  openBibleLong AS open_bible_longitude,
  latitude,
  longitude,
  recogitoLat AS recogito_latitude,
  recogitoLon AS recogito_longitude,
  rootID as root_id,
  `precision`,
  comment AS notes,
  dictionaryLink AS dictionary_link,
  dictionaryText AS dictionary_text,
  placeID as location_id,
  recogitoUri AS recogito_uri,
  recogitoStatus AS recogito_status,
  recogitoComments AS recogito_notes,
  recogitoUID AS recogito_uid,
  slug,
  duplicate_of,
  eastons,
  dictText AS alt_dictionary_text,
  featureSubType AS feature_subtype
FROM `mockecommerce-342202.bible.theography_places`