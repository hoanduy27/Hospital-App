USE HospitalDB1
GO

--5. Xem các thuốc đã được dùng qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_5
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	IF @ma_benh_nhan IN (SELECT MaBN FROM BenhAnNoiTru)
		SELECT DISTINCT CoKeDon.MaKhamBenh, CoKeDon.TenThuoc, CoKeDon.NhaCungCap
		FROM CoKeDon INNER JOIN CuocKham
		ON CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaKhamBenh = CoKeDon.MaKhamBenh;
	ELSE 
		PRINT 'KHONG PHAI BENH NHAN NOI TRU';
END
GO



EXEC PROC_5 100000001,225600003
GO
