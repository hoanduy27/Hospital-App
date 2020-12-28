--BN6: Danh sach xet nghiem co ghi chu "Bat thuong" cua 1 chi so xet nghiem
USE HospitalDB1
GO

create or alter proc BN6_TestHasUnusualRet
	@cmnd nchar(9)
as
begin
	SELECT DISTINCT CuocKham.MaKhamBenh, TenXN
	FROM CuocKham, KetQuaXetNghiem, XetNghiem
	WHERE
		CuocKham.MaKhamBenh = KetQuaXetNghiem.MaKhamBenh
		AND KetQuaXetNghiem.GhiChu = 'BatThuong'
		AND KetQuaXetNghiem.MaXN = XetNghiem.MaXN
		AND CuocKham.MaBN = @cmnd
end
GO

EXEC BN6_TestHasUnusualRet '225600001'
