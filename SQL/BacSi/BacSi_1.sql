USE HospitalDB1
GO

--1. Cập nhật hoạt động khám / chữa bệnh cho bệnh nhân ngoại trú trong 1 ca trực
CREATE OR ALTER PROC PROC_1
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9),
	@thoi_gian_tai_kham INT --Bao nhieu ngay sau ngay hien tai
AS
BEGIN
	DECLARE @ma_kham_benh nchar(15)
	DECLARE @thoi_gian_kham DATETIME

	SELECT @ma_kham_benh = MAX(MaKhamBenh) 
	FROM (
		SELECT MaKhamBenh 
		FROM CuocKham 
		WHERE CAST(MaKhamBenh AS BIGINT) < 200000000000000
	) t
	SET @ma_kham_benh = CAST((CAST(@ma_kham_benh AS BIGINT) + 1) AS NCHAR(15))

	SET @thoi_gian_kham = CAST(GETDATE() AS DATETIME)

	INSERT INTO CuocKham 
	VALUES
		(@ma_kham_benh, CAST(GETDATE() AS DATETIME), @ma_bac_si, @ma_benh_nhan);

	INSERT INTO KhamNgoaiTru
	VALUES 
		(@ma_kham_benh, DATEADD(day, @thoi_gian_tai_kham, @thoi_gian_kham))
END
GO
