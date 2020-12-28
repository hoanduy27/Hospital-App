USE HospitalDB1
GO

--4. Xem các chẩn đóan bệnh của bệnh nhân mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_4
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	(SELECT DISTINCT XetNghiem.TenXN AS BenhChanDoan
	FROM XetNghiem INNER JOIN (CuocKham INNER JOIN CoXetNghiem ON CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT CoChupPhim.KetQua AS BenhChanDoan
	FROM CuocKham INNER JOIN CoChupPhim 
	ON CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)

	UNION

	(SELECT DISTINCT XetNghiem.TenXN AS BenhChanDoan
	FROM XetNghiem INNER JOIN (CuocKham INNER JOIN CoXetNghiem ON CuocKham.MaBN = @ma_benh_nhan AND CoXetNghiem.MaBSXN = @ma_bac_si AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT CoChupPhim.KetQua AS BenhChanDoan
	FROM CuocKham INNER JOIN CoChupPhim 
	ON CuocKham.MaBN = @ma_benh_nhan AND CoChupPhim.MaBSCP = @ma_bac_si AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)

	--UNION

	--(SELECT DISTINCT BenhNhapVien.TenBenh AS BenhChanDoan
	--FROM BenhNhapVien INNER JOIN BenhNhanNoiTru
	--ON BenhNhanNoiTru.CMND = BenhNhapVien.MaBN AND BenhNhanNoiTru.CMND = @ma_benh_nhan AND BenhNhanNoiTru.MaBSChiDinhNV = @ma_bac_si)

	--UNION

	--(SELECT DISTINCT BenhXuatVien.TenBenh AS BenhChanDoan
	--FROM BenhXuatVien INNER JOIN BenhNhanNoiTru
	--ON BenhNhanNoiTru.CMND = BenhXuatVien.MaBN AND BenhNhanNoiTru.CMND = @ma_benh_nhan AND BenhNhanNoiTru.MaBSChiDinhXV = @ma_bac_si)
												
END
GO



EXEC PROC_4 100000005,225600012
GO