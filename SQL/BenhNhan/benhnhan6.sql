create or alter proc xem_danh_sach_xet_nghiem_bat_thuong
	@cmnd nchar(9)
as
begin
	declare @makhambenh table( makham nchar(15))
	declare @makham nchar(15)
	declare @tenXN varchar(15)
	declare @maxn nchar(4)
	declare @ghichu varchar(11)
	declare @danhsachXN table( maxn nchar(4),TenXetNghiem varchar(15),GhiChu varchar(11))
	insert into @makhambenh select MaKhamBenh from CuocKham where MaBN = @cmnd
	declare makhamcur cursor for
	select makham from @makhambenh

	open makhamcur
	fetch next from makhamcur into @makham
	while @@FETCH_STATUS = 0
	begin
		set @maxn = (select MaXN from KetQuaXetNghiem where MaKhamBenh = @makham)
		set @tenXN = (select TenXN from XetNghiem where MaXN = @maxn)
		set @ghichu = (select GhiChu from KetQuaXetNghiem where MaKhamBenh = @makham and MaXN = @maxn)
		insert into @danhsachXN 
		values ( @maxn , @tenXN, @ghichu)
	end
	select maxn , TenXetNghiem
	from @danhsachXN
	group by maxn,TenXetNghiem,GhiChu
	Having GhiChu = 'bat thuong'
end

