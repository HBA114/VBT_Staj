/*
	--------------------------------
	-------- Limiting Rows ---------
	--------------------------------
	
	OFFSET FETCH
	TOP
*/

-- OFFSET FETCH
SELECT 
	PERSONEL_ADI, 
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	IL_ADI
FROM 
	PERSONEL
ORDER BY
	PERSONEL_ADI
OFFSET
	5 ROWS
FETCH NEXT 20 ROWS ONLY


-- TOP
SELECT
	TOP 10 * 
FROM PERSONEL



