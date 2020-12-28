create or alter proc xem_danh_sach_thuoc_da_dung
	@cmnd nchar(9)
as
begin
	declare @makhambenh table( makham nchar(15))
	declare @makham nchar(15)
	declare @danhsachthuoc table( thuoc varchar(30))
	insert into @makhambenh select MaKhamBenh from CuocKham where MaBN = @cmnd
	declare makhamcur cursor for
	select makham from @makhambenh

	open makhamcur
	fetch next from makhamcur into @makham
	while @@FETCH_STATUS = 0
	begin
		insert into @danhsachthuoc select TenThuoc from CoKeDon where MaKhamBenh = @makham
	end
	select thuoc
	from @danhsachthuoc
	group by thuoc
end


