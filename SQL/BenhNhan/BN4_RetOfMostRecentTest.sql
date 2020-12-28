USE HospitalDB1
GO
--BN4: Ket qua xet nghiem trong lan dieu tri gan nhat
create or alter proc BN4_RetOfMostRecentTest
	@cmnd nchar(9)
as
begin
	SELECT CuocKham.MaKhamBenh, XetNghiem.TenXN, TenChiSo, GiaTri, GhiChu
	FROM KetQuaXetNghiem, XetNghiem, CuocKham
	WHERE 
		KetQuaXetNghiem.MaKhamBenh = CuocKham.MaKhamBenh
		AND XetNghiem.MaXN = KetQuaXetNghiem.MaXN
		AND ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd)
end
GO
EXEC BN4_RetOfMostRecentTest '225600013'
