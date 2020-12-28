create or alter proc KetQuaXetNghiemGanNhat
	@cmnd nchar(9)
as
begin
	declare @makhambenh nchar(15)
	declare @tgk_gan_nhat datetime
	set @tgk_gan_nhat =(select max(ThoiGianKham) from CuocKham where MaBN = @cmnd)
	set @makhambenh = (select MaKhamBenh from CuocKham where ThoiGianKham = @tgk_gan_nhat)
	select * from KetQuaXetNghiem where MaKhamBenh = @makhambenh
end

