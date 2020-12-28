create or alter proc danh_sach_bac_si_trong_lan_gan_nhat
	@cmnd nchar(9)
as
begin
	declare @makhambenh nchar(15)
	declare @tgk_gan_nhat datetime
	declare @mabschinh nchar(9)
	declare @mabschuphim nchar(9)
	declare @mabsxetngiem nchar(9)
	declare @dsbacsi table (HoBS varchar(30),TenBS varchar(10))
	set @tgk_gan_nhat =(select max(ThoiGianKham) from CuocKham where MaBN = @cmnd)
	set @makhambenh = (select MaKhamBenh from CuocKham where ThoiGianKham = @tgk_gan_nhat)
	set @mabschinh = (select MaBacSi from CuocKham where MaKhamBenh = @makhambenh)
	insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabschinh
	if(exists(select MaBSCP from CoChupPhim where MaKhamBenh = @makhambenh))
		begin
			set @mabschuphim = (select MaBSCP from CoChupPhim where MaKhamBenh = @makhambenh)
			insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabschuphim
		end
	if(exists(select MaBSXN from CoXetNghiem where MaKhamBenh = @makhambenh))
		begin
			set @mabsxetngiem = (select MaBSXN from CoXetNghiem where MaKhamBenh = @makhambenh)
			insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabsxetngiem
		end
	select * from @dsbacsi
end
