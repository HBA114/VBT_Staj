/*
	--------------------------------
	-------- Sorting Data ----------
	--------------------------------
	
	ORDER BY
*/

-- ASC (Default asc)

SELECT * FROM PERSONEL --ORDER BY ID_PERSONEL ASC--

-- ASC (Specified asc)

SELECT * FROM PERSONEL ORDER BY PERSONEL_ADI DESC

-- DESC

SELECT * FROM PERSONEL ORDER BY PERSONEL_ADI ASC, PERSONEL_SOYADI desc
