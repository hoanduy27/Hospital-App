create or alter proc Che_Do_Dinh_Duong_FULL
	@cmnd nchar(9)
as
begin
	declare @makhambenh table( makham nchar(15))
	declare @makham nchar(15)
	insert into @makhambenh select MaKhamBenh from CuocKham where MaBN = @cmnd
	declare @ThucPhamKieng table(TenTPK varchar(15))
	declare @ThucPhamBosung table(TenTPBS varchar(15))
	
	declare makhamcur cursor for
	select makham from @makhambenh
	open makhamcur
	fetch next from makhamcur into @makham
	while @@FETCH_STATUS = 0
	begin
		insert into @ThucPhamKieng select TenThucPham from ThucPhamKieng where MaKhamBenh = @makham
		insert into @ThucPhamBosung select TenThucPham from ThucPhamBoSung where MaKhamBenh = @makham
	end
	select TenTPK,TenTPBS
	from @ThucPhamKieng,@ThucPhamBosung
	group by TenTPK,TenTPBS
end

