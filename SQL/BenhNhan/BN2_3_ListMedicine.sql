--BN2: Thuoc da dung trong lan dieu tri gan nhat
--BN3: Thuoc da dung trong tat ca cac lan dieu tri
create or alter proc BN2_3_ListMedicine
	@cmnd nchar(9),
	@isAll SMALLINT --0 for most recent, 1 for all
as
begin
	--Danh sach thuoc trong lan dieu tri gan nhat
	IF(@isAll = 0)
	BEGIN
		SELECT CoKeDon.MaKhamBenh, TenThuoc, NhaCungCap
		FROM CuocKham, CoKeDon
		WHERE
			CuocKham.MaKhamBenh = CoKeDon.MaKhamBenh
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham)
										FROM CuocKham
										WHERE CuocKham.MaBN = @cmnd)
			
	END
	--Danh sach thuoc o tat ca cac lan dieu tri
	ELSE
		SELECT CoKeDon.MaKhamBenh, TenThuoc, NhaCungCap
		FROM CoKeDon, CuocKham
		WHERE 
			CuocKham.MaKhamBenh = CoKeDon.MaKhamBenh
			AND CuocKham.MaBN = @cmnd
end
GO 

EXEC BN2_3_ListMedicine '225600011', 1
