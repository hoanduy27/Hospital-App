create or alter proc danh_sach_bac_si_da_kham_qua
	@cmnd nchar(9)
as
begin
	declare @makhambenh table( makham nchar(15))
	declare @makham nchar(15)
	declare @mabschinh nchar(9)
	declare @mabschuphim nchar(9)
	declare @mabsxetngiem nchar(9)
	declare @dsbacsi table (HoBS varchar(30),TenBS varchar(10))
	insert into @makhambenh select MaKhamBenh from CuocKham where MaBN = @cmnd

	declare makhamcur cursor for
	select makham from @makhambenh

	open makhamcur
	fetch next from makhamcur into @makham
	while @@FETCH_STATUS = 0
	begin
		set @mabschinh = (select MaBacSi from CuocKham where MaKhamBenh = @makham)
		insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabschinh
		if(exists(select MaBSCP from CoChupPhim where MaKhamBenh = @makham))
			begin
				set @mabschuphim = (select MaBSCP from CoChupPhim where MaKhamBenh = @makham)
				insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabschuphim
			end
		if(exists(select MaBSXN from CoXetNghiem where MaKhamBenh = @makham))
			begin
				set @mabsxetngiem = (select MaBSXN from CoXetNghiem where MaKhamBenh = @makham)
				insert into @dsbacsi select Ho,Ten from NhanVien where MaNV = @mabsxetngiem
			end
	end
	select * from @dsbacsi group by HoBS,TenBS
end
go
