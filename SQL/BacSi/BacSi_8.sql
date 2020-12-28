USE HospitalDB1
GO

--8. Xem các bệnh nhân của cùng 1 bệnh mà mình đã chẩn đoán
CREATE OR ALTER PROCEDURE PROC_8
	@ma_bac_si nchar(9),
	@ten_benh varchar(100)
AS
BEGIN
	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN (CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh) 
			ON CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh AND CuocKham.MaBacSi = @ma_bac_si) )
		ON BenhNhan.CMND = CuocKham.MaBN

	UNION

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN CoChupPhim 
			ON CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh AND CoChupPhim.KetQua = @ten_benh 
															AND CuocKham.MaBacSi = @ma_bac_si) )
	ON BenhNhan.CMND = CuocKham.MaBN

	UNION 

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN (CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh) 
			ON CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh AND CoXetNghiem.MaBSXN = @ma_bac_si) )
		ON BenhNhan.CMND = CuocKham.MaBN

	UNION

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN CoChupPhim 
			ON CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh AND CoChupPhim.KetQua = @ten_benh 
															AND CoChupPhim.MaBSCP = @ma_bac_si) )
	ON BenhNhan.CMND = CuocKham.MaBN
END
GO



EXEC PROC_8 100000027,'U lanh o nao'
GO