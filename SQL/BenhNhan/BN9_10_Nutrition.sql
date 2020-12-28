--BN9: Xem danh sach che do dinh duong trong lan dieu tri gan nhat
--BN10: Xem danh sach che do dinh duong trong tat ca cac lan dieu tri

USE HospitalDB1
GO

create or alter proc BN9_10_Nutrition
	@cmnd nchar(9),
	@isAll SMALLINT --0: Most recent (BN9), 1: All (BN10)
as
begin	
	IF(@isAll = 0)
	BEGIN
		(SELECT CuocKham.MaKhamBenh, 'Bo sung: ' + ThucPhamBoSung.TenThucPham AS CheDoDinhDuong
		FROM CuocKham, ThucPhamBoSung
		WHERE
			CuocKham.MaKhamBenh = ThucPhamBoSung.MaKhamBenh
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd))

		UNION

		(SELECT CuocKham.MaKhamBenh, 'Kieng: ' + ThucPhamKieng.TenThucPham AS CheDoDinhDuong
		FROM CuocKham, ThucPhamKieng
		WHERE
			CuocKham.MaKhamBenh = ThucPhamKieng.MaKhamBenh
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd))
	END
	ELSE
	BEGIN
		(SELECT CuocKham.MaKhamBenh ,'Bo sung: ' + ThucPhamBoSung.TenThucPham AS CheDoDinhDuong
		FROM CuocKham, ThucPhamBoSung
		WHERE
			CuocKham.MaKhamBenh = ThucPhamBoSung.MaKhamBenh
			AND CuocKham.MaBN = @cmnd)

		UNION

		(SELECT CuocKham.MaKhamBenh, 'Kieng: ' + ThucPhamKieng.TenThucPham AS CheDoDinhDuong
		FROM CuocKham, ThucPhamKieng
		WHERE
			CuocKham.MaKhamBenh = ThucPhamKieng.MaKhamBenh
			AND CuocKham.MaBN = @cmnd)
	END
end
GO

EXEC BN9_10_Nutrition '225600003', 0
EXEC BN9_10_Nutrition '225600012', 1
