USE HospitalDB1
GO
--BN5: Xem danh sach xet nghiem da lam
create or alter proc BN5_AllTest
	@cmnd nchar(9)
as
begin
	SELECT CuocKham.MaKhamBenh, TenXN, ChanDoanXetNghiem
	FROM CuocKham, CoXetNghiem, XetNghiem
	WHERE 
		CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh
		AND CoXetNghiem.MaXN = XetNghiem.MaXN
		AND CuocKham.MaBN = @cmnd
end
GO

EXEC BN5_AllTest '225600001'
