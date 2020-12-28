USE HospitalDB1
GO

--10. Xem các bệnh nhân đã xuất viện mà mình đã phụ trách 
CREATE OR ALTER PROCEDURE PROC_10
	@ma_bac_si nchar(9)
AS
BEGIN
	SELECT t.CMND, Ho, Ten
	FROM
		(SELECT DISTINCT CMND
		FROM BenhNhanNoiTru INNER JOIN BenhAnNoiTru
		ON 
			BenhAnNoiTru.MaBN = BenhNhanNoiTru.CMND
			AND BenhAnNoiTru.MaBSChiDinhXV = @ma_bac_si
		) t,
		BenhNhan
	WHERE t.CMND = BenhNhan.CMND;

END
GO
EXEC PROC_10 '100000005'
