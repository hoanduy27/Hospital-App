create or alter proc CheDoDinhDuongGanNhat
	@cmnd nchar(9)
as
begin
	declare @makhambenh nchar(15)
	declare @tgk_gan_nhat datetime
	set @tgk_gan_nhat =(select max(ThoiGianKham) from CuocKham where MaBN = @cmnd)
	set @makhambenh = (select MaKhamBenh from CuocKham where ThoiGianKham = @tgk_gan_nhat)
	declare @ThucPhamKieng table(TenTPK varchar(15))
	declare @ThucPhamBosung table(TenTPBS varchar(15))
	insert into @ThucPhamKieng select TenThucPham from ThucPhamKieng where MaKhamBenh = @makhambenh
	insert into @ThucPhamBosung select TenThucPham from ThucPhamBoSung where MaKhamBenh = @makhambenh
	select TenTPK,TenTPBS
	from @ThucPhamKieng,@ThucPhamBosung
end
