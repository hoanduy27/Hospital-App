USE HospitalDB1
GO

--4. Xem các chẩn đóan bệnh của bệnh nhân mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_4
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	(SELECT DISTINCT 
		CuocKham.ThoiGianKham AS ThoiGian, 
		'XN: ' + XetNghiem.TenXN AS TenXN_CP, 
		CoXetNghiem.ChanDoanXetNghiem AS ChanDoan
	FROM XetNghiem INNER JOIN 
		(CuocKham INNER JOIN CoXetNghiem 
		ON 
			CuocKham.MaBN = @ma_benh_nhan 
			AND CuocKham.MaBacSi = @ma_bac_si 
			AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT 
		CuocKham.ThoiGianKham AS ThoiGian, 
		'CP: ' + CoChupPhim.TenChupPhim AS TenXN_CP, 
		CoChupPhim.KetQua AS ChanDoan
	FROM CuocKham INNER JOIN CoChupPhim
	ON
		CuocKham.MaBN = @ma_benh_nhan
		AND CuocKham.MaBacSi = @ma_bac_si
		AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)

	UNION

	(SELECT DISTINCT 
		CuocKham.ThoiGianKham AS ThoiGian, 
		'XN: ' + XetNghiem.TenXN AS TenXN_CP, 
		CoXetNghiem.ChanDoanXetNghiem AS ChanDoan
	FROM XetNghiem INNER JOIN 
		(CuocKham INNER JOIN CoXetNghiem 
		ON 
			CuocKham.MaBN = @ma_benh_nhan 
			AND CoXetNghiem.MaBSXN = @ma_bac_si 
			AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT 
		CuocKham.ThoiGianKham AS ThoiGian, 
		'CP: ' + CoChupPhim.TenChupPhim AS TenXN_CP, 
		CoChupPhim.KetQua AS ChanDoan
	FROM CuocKham INNER JOIN CoChupPhim
	ON
		CuocKham.MaBN = @ma_benh_nhan
		AND CoChupPhim.MaBSCP = @ma_bac_si
		AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)
												
END
GO

EXEC PROC_4 '100000006', '225600001'
EXEC PROC_4 '100000011', '225600001'
EXEC PROC_4 '100000001', '225600003'
EXEC PROC_4 '100000027', '225600003'
