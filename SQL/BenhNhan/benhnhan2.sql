USE HospitalDB1
GO
--BN2: Xem danh sach thuoc gan nhat
create or alter proc BN2_MostRecentMedicine
	@cmnd nchar(9)
as
begin
	declare @makhambenh nchar(15)
	declare @tgk_gan_nhat datetime
	set @tgk_gan_nhat =(select max(ThoiGianKham) from CuocKham where MaBN = @cmnd)
	set @makhambenh = (select MaKhamBenh from CuocKham where ThoiGianKham = @tgk_gan_nhat)
	select TenThuoc, NhaCungCap from CoKeDon where MaKhamBenh = @makhambenh
end
GO

EXEC BN2_MostRecentMedicine '225600001'
