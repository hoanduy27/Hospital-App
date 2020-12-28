--BN3: Thuoc da dung trong tat ca cac lan dieu tri
create or alter proc BN3_AllMedicine
	@cmnd nchar(9)
as
begin
	SELECT CoKeDon.MaKhamBenh, TenThuoc, NhaCungCap
	FROM CoKeDon, CuocKham
	WHERE 
		CuocKham.MaKhamBenh = CoKeDon.MaKhamBenh
		AND CuocKham.MaBN = @cmnd
end
GO 

EXEC BN3_AllMedicine '225600011'
