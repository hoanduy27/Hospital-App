USE HospitalDB1
GO

--9. Xem các bệnh nhân có ghi chú bất thường trong kết quả xét nghiệm của cùng 1 bệnh mà mình đã chẩn đoán
CREATE OR ALTER PROCEDURE PROC_9
	@ma_bac_si nchar(9),
	@ten_benh varchar(100)
AS
BEGIN
	SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN
	(	CuocKham INNER JOIN 
				(KetQuaXetNghiem INNER JOIN 
					( CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh)
				ON KetQuaXetNghiem.MaXN = XetNghiem.MaXN AND  KetQuaXetNghiem.GhiChu = 'BatThuong') 
		ON CuocKham.MaKhamBenh = KetQuaXetNghiem.MaKhamBenh AND (CuocKham.MaBacSi = @ma_bac_si OR CoXetNghiem.MaBSXN = @ma_bac_si))					
	ON BenhNhan.CMND = CuocKham.MaBN;
END
GO


EXEC  PROC_9  100000005 , 'Gout'
GO