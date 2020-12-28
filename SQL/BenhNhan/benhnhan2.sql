create or alter proc xem_danh_sach_thuoc_gan_nhat
	@cmnd nchar(9)
as
begin
	declare @makhambenh nchar(15)
	declare @tgk_gan_nhat datetime
	set @tgk_gan_nhat =(select max(ThoiGianKham) from CuocKham where MaBN = @cmnd)
	set @makhambenh = (select MaKhamBenh from CuocKham where ThoiGianKham = @tgk_gan_nhat)
	select TenThuoc from CoKeDon where MaKhamBenh = @makhambenh
end
