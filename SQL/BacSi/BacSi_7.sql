USE HospitalDB1
GO

--7. Xem các chỉ định chụp phim đã làm qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_7
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	IF @ma_benh_nhan IN (SELECT MaBN FROM BenhAnNoiTru)
		SELECT DISTINCT CoChupPhim.MaKhamBenh, CoChupPhim.TenChupPhim
		FROM CoChupPhim INNER JOIN CuocKham
		ON CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh;
	ELSE 
		SELECT 'Failed!!!'
END
GO



EXEC PROC_7 100000002,225600011
GO
