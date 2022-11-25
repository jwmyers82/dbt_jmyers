{{ config(materialized='table') }}

-- character_relationship
WITH child AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'child' AS relationship,
    related_person
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.children)) related_person
  WHERE person.children IS NOT NULL
),
mother AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'mother' AS relationship,
    mother
  FROM `mockecommerce-342202.bible.theography_people` person
),
father AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'father' AS relationship,
    father
  FROM `mockecommerce-342202.bible.theography_people` person
),
full_sibling AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'full sibling' AS relationship,
    related_person
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.siblings)) related_person
  WHERE person.siblings IS NOT NULL
),
partner AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'partner' AS relationship,
    related_person
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.partners)) related_person
  WHERE person.partners IS NOT NULL
),
maternal_sibling AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'maternal sibling' AS relationship,
    related_person
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.halfSiblingsSameMother)) related_person
  WHERE person.halfSiblingsSameMother IS NOT NULL
),
paternal_sibling AS (
  SELECT DISTINCT
    person.personLookup AS person_key,
    'paternal sibling' AS relationship,
    related_person
  FROM `mockecommerce-342202.bible.theography_people` person,
  UNNEST(SPLIT(person.halfSiblingsSameFather)) related_person
  WHERE person.halfSiblingsSameFather IS NOT NULL
)
SELECT * FROM child
UNION ALL
SELECT * FROM mother
UNION ALL
SELECT * FROM father
UNION ALL
SELECT * FROM full_sibling
UNION ALL
SELECT * FROM maternal_sibling
UNION ALL
SELECT * FROM paternal_sibling