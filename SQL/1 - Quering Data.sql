/*
	--------------------------------
	--------- Quering Data ---------
	--------------------------------

	SELECT
	FROM

*/

-- Tüm alanların kısa yol ile (*) listelenmesi
SELECT * FROM PERSONEL 

-- Tüm alanların açıkca belirtilmiş olarak listelenmesi
SELECT [ID_PERSONEL]
      ,[PERSONEL_ADI]
      ,[PERSONEL_SOYADI]
      ,[MAAS]
  FROM [EGITIM].[dbo].[IK_PERSONEL]


-- Özellikle belirtilmiş alanların listelenmesi
SELECT 
	ID_PERSONEL,
	PERSONEL_ADI,
	PERSONEL_SOYADI,
	DOGUM_TARIHI,
	IL_ADI
FROM PERSONEL


