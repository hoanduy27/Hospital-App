USE HospitalDB1
GO

--10. Xem các bệnh nhân đã xuất viện mà mình đã phụ trách 
CREATE OR ALTER PROCEDURE PROC_10
	@ma_bac_si nchar(9)
AS
BEGIN
	SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN BenhAnNoiTru
	ON BenhAnNoiTru.MaBSChiDinhXV = @ma_bac_si AND BenhNhan.CMND = BenhAnNoiTru.MaBN ;
END
GO


EXEC PROC_10 100000007
GO