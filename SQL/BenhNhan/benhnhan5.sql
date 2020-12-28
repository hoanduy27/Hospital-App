create or alter proc xem_danh_sach_xet_nghiem_da_lam
	@cmnd nchar(9)
as
begin
	declare @makhambenh table( makham nchar(15))
	declare @makham nchar(15)
	declare @tenXN varchar(15)
	declare @maxn nchar(4)
	declare @danhsachXN table( maxn nchar(4),TenXetNghiem varchar(15))
	insert into @makhambenh select MaKhamBenh from CuocKham where MaBN = @cmnd
	declare makhamcur cursor for
	select makham from @makhambenh

	open makhamcur
	fetch next from makhamcur into @makham
	while @@FETCH_STATUS = 0
	begin
		set @maxn = (select MaXN from CoXetNghiem where MaKhamBenh = @makham)
		set @tenXN = (select TenXN from XetNghiem where MaXN = @maxn)
		insert into @danhsachXN 
		values ( @maxn , @tenXN)
	end
	select maxn , TenXetNghiem
	from @danhsachXN
	group by maxn,TenXetNghiem
end