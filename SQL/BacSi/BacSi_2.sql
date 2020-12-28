USE HospitalDB1
GO

--2. Cập nhật hoạt động khám / chữa bệnh cho bệnh nhân nội trú trong 1 ca trực
CREATE OR ALTER PROCEDURE PROC_2
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9),
	@thoi_gian_tham_kham DATETIME,

	@so_buong varchar(6),
	@so_giuong int,
	@tinh_trang_nhap_vien varchar(10)
AS
BEGIN
	DECLARE @ma_kham_benh nchar(15)
	DECLARE @thoi_gian_kham DATETIME

	--Lay ma kham benh tiep theo
	SELECT @ma_kham_benh = MAX(MaKhamBenh) 
	FROM CuocKham 

	SET @ma_kham_benh = CAST((CAST(@ma_kham_benh AS BIGINT) + 1) AS NCHAR(15))

	--Them vao CuocKham
	SET @thoi_gian_kham = CAST(GETDATE() AS DATETIME)

	INSERT INTO CuocKham 
	VALUES
		(@ma_kham_benh, @thoi_gian_kham, @ma_bac_si, @ma_benh_nhan);

	--Them vao KhamNoiTru
	INSERT INTO KhamNoiTru
	VALUES 
		(@ma_kham_benh, @thoi_gian_tham_kham)

	IF(NOT(EXISTS(SELECT CMND FROM BenhNhanNoiTru WHERE CMND = @ma_benh_nhan)))
	INSERT INTO BenhNhanNoiTru
	VALUES 
		(@ma_benh_nhan)
	--Them vao benh an noi tru neu: 1. Chua co benh an noi tru 2. Tat ca benh an noi tru da co thong tin xuat vien
	IF(
		NOT(EXISTS(SELECT * FROM BenhAnNoiTru WHERE MaBN = @ma_benh_nhan))
		OR NOT(EXISTS(SELECT * FROM BenhAnNoiTru WHERE MaBN = @ma_benh_nhan AND MaBSChiDinhXV IS NULL))
	)
	BEGIN
		DECLARE @ma_benh_an NCHAR(4)
		IF(NOT(EXISTS(SELECT * FROM BenhAnNoiTru WHERE MaBN = @ma_benh_nhan)))
			SET @ma_benh_an = '0001'
		ELSE
		BEGIN
			SELECT @ma_benh_an = MAX(MaBenhAn)
			FROM (
				SELECT MaBenhAn
				FROM BenhAnNoiTru
				WHERE MaBN = @ma_benh_nhan
			) t
			SET @ma_benh_an = RIGHT('0000' + CAST(CAST(@ma_benh_an AS INT) + 1 AS VARCHAR), 4)
		END
		INSERT INTO BenhAnNoiTru(MaBenhAn, MaBN, MaBSChiDinhNV, SoBuong, SoGiuong, ThoiGianNhapVien, TinhTrangNhapVien)
		VALUES 
			(@ma_benh_an, @ma_benh_nhan, @ma_bac_si, @so_buong, @so_giuong, @thoi_gian_kham, @tinh_trang_nhap_vien)
			
	END

END
GO

EXEC PROC_2 '100000001', '225600001', '2021-01-01 00:00:00', '303A', 3, 'Tinh Tao'
GO
EXEC PROC_2 '100000001', '225600001', '2021-01-02 00:00:00', '303A', 3, 'Tinh Tao'
GO
--Run Later to delete the inserted data
DELETE FROM BenhAnNoiTru
WHERE MaBenhAn = '0001' AND MaBN = '225600001'
GO
DELETE FROM KhamNoiTru
WHERE MaKhamBenh = '200000000000012'
GO
DELETE FROM CuocKham
WHERE MaKhamBenh = '200000000000012'
GO

DELETE FROM KhamNoiTru
WHERE MaKhamBenh = '200000000000013'
GO
DELETE FROM CuocKham
WHERE MaKhamBenh = '200000000000013'
GO
