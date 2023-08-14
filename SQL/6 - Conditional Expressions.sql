﻿/*
	--------------------------------
	--- Conditional Expressions ----
	--------------------------------
	
	CASE / IIF (T-SQL)
	ISNULL
	NULLIF
*/

SELECT * FROM PERSONEL

-- CASE
SELECT 
	PER.PERSONEL_ADI,
	PER.PERSONEL_SOYADI,
	PER.DEPARTMAN_ADI,
	PER.UNVAN_ADI,
	CASE
		WHEN PER.UNVAN_ADI IN ('Müdür Yrd.', 'Genel Müdür Yrd.', 'Müdür') THEN 'Evet'
		ELSE 'Hayır'
	END
	AS YONETICI_MI
FROM PERSONEL AS PER


-- IIF
SELECT 
	PER.PERSONEL_ADI,
	PER.PERSONEL_SOYADI,
	PER.DEPARTMAN_ADI,
	PER.UNVAN_ADI,
	IIF(PER.UNVAN_ADI IN ('Müdür Yrd.', 'Genel Müdür Yrd.', 'Müdür'), 'Evet', 'Hayır')
	AS YONETICI_MI
FROM PERSONEL AS PER

-- ISNULL
SELECT 
	PER.PERSONEL_ADI,
	PER.PERSONEL_ADI,
	PER.IS_TELEFON,
	PER.OZEL_TELEFON,
	ISNULL(PER.IS_TELEFON, PER.OZEL_TELEFON) AS TELEFON
FROM PERSONEL AS PER

-- NULLIF
SELECT 
	PER.PERSONEL_ADI,
	PER.PERSONEL_ADI,
	PER.OZEL_TELEFON,
	PER.IS_TELEFON,
	NULLIF(PER.OZEL_TELEFON, PER.IS_TELEFON) AS TELEFON_NULLIF
FROM PERSONEL AS PER

SELECT COUNT(*) FROM PERSONEL

SELECT COUNT(NULLIF(OZEL_TELEFON, IS_TELEFON)) FROM PERSONEL



SELECT 100 / NULLIF(50-50,50-50) AS XX

SELECT 100 / NULL AS XX


