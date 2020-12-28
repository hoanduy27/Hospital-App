USE HospitalDB1
GO
--6. Xem các chỉ định xét nghiệm đã làm qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_6
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	SELECT DISTINCT CuocKham.ThoiGianKham, XetNghiem.TenXN

	FROM XetNghiem INNER JOIN( 
		CoXetNghiem INNER JOIN CuocKham
		ON 
			CuocKham.MaBacSi = @ma_bac_si 
			AND CuocKham.MaBN = @ma_benh_nhan 
			AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh
		)
	ON XetNghiem.MaXN = CoXetNghiem.MaXN
END
GO

EXEC PROC_6 '100000006', '225600001'
