/*
	--------------------------------
	-------- Filtering Data --------
	--------------------------------
	
	- Conditions
	WHERE, AND, OR

	- Operators
	=, >, <, =>, <=, <>, IN, NOT IN, BETWEEN, LIKE, NOT LIKE

*/

select * from PERSONEL

/*Ankarada yaşayan personeller*/
SELECT
	*
FROM PERSONEL 
WHERE IL_ADI = 'Ankara'


/*Ankarada yaşayan ve Bilgi İşlem departmanında çalışan personeller*/
SELECT
	*
FROM PERSONEL 
WHERE IL_ADI = 'Ankara'
AND DEPARTMAN_ADI = 'Bilgi İşlem'


/*Bilgi İşlem ve Muhasebe departmanında çalışan, Uzman ve Müdür olmayan personeller*/

SELECT
	*
FROM PERSONEL
WHERE DEPARTMAN_ADI IN ('Bilgi İşlem' , 'Muhasebe')
AND UNVAN_ADI NOT IN ('Uzman', 'Müdür')


/*Yaşı 40+ ya da Kıdemi 10+ olan çalışanlar*/

-- 1.YOL
SELECT 
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	ISE_GIRIS_TARIHI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM

FROM PERSONEL 
WHERE 
	(YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) >= 40 OR YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) >= 10)

-- 2.YOL
SELECT 
	* 
FROM
	(
		SELECT 
			PERSONEL_ADI,
			PERSONEL_SOYADI,
			DOGUM_TARIHI,
			ISE_GIRIS_TARIHI,
			YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
			YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM
		FROM PERSONEL
	) AS TMP_PERSONEL
WHERE
	(YAS >= 40 OR KIDEM >= 10)


/*Yaşı 35+ olan ve kıdemi (çalışma yılı) 5 yılın altında olan personeller*/
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	ISE_GIRIS_TARIHI,
	YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) AS YAS,
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) AS KIDEM
FROM PERSONEL
WHERE YEAR(GETDATE()) - YEAR(DOGUM_TARIHI) >= 35
AND YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) <= 5
	
/*Doğum yılı 1985 ile 1990 arasında olan personeller*/
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	YEAR(DOGUM_TARIHI) AS DOGUM_YILI
FROM PERSONEL 
WHERE YEAR(DOGUM_TARIHI) >= 1985 
AND YEAR(DOGUM_TARIHI) <= 1990

-- BETWEEN
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	YEAR(DOGUM_TARIHI) AS DOGUM_YILI
FROM PERSONEL 
WHERE YEAR(DOGUM_TARIHI) BETWEEN 1985 AND 1990


/*Adı 'S' ile başlayan personellerin adı ve soyadına göre listele*/
SELECT
	PERSONEL_ADI,
	PERSONEL_SOYADI
FROM
	PERSONEL 
WHERE 
	PERSONEL_ADI LIKE 'S%'


/*Soyadı 'K' ile başlayan, Adı 'S' ile başlamayan personeller*/
SELECT 
	PERSONEL_ADI,
	PERSONEL_SOYADI
FROM PERSONEL
WHERE
	PERSONEL_SOYADI LIKE 'K%'
	AND PERSONEL_ADI NOT LIKE 'S%'


/*Kıdemi 10+ yıl ve maaşı 1000 ile 1200 TL altında arasında olanların Adı, Soyadı, Departmanı ve Unvan bilgisini listele*/
SELECT 
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DEPARTMAN_ADI,
	UNVAN_ADI,
	MAAS
FROM PERSONEL
WHERE
	YEAR(GETDATE()) - YEAR(ISE_GIRIS_TARIHI) >= 10
	AND MAAS BETWEEN 1000 AND 1200
