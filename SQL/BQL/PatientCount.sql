USE HospitalDB
GO

CREATE OR ALTER PROC PatientCount
	@type varchar(10),
	@khoa varchar(20),
	@ngay varchar(10),
	@ca int
AS
BEGIN
	DECLARE @tmpBacsi TABLE(maNV nchar(9));
	IF @khoa = ''
		INSERT INTO @tmpBacsi SELECT MaNV FROM BacSi;
	ELSE
		INSERT INTO @tmpBacsi SELECT MaNV FROM (SELECT BacSi.MaNV,Khoa.TenKhoa FROM BacSi JOIN Khoa ON BacSi.MaKhoa = Khoa.MaKhoa) AS bs WHERE TenKhoa = @khoa;

	DECLARE @start varchar(8);
	DECLARE @end varchar(8);
	IF @ca != 0
	BEGIN		
		SET @start = (SELECT convert(varchar(8),GioBatDau,108) FROM CaTruc WHERE Ca = @ca);
		SET @end = (SELECT convert(varchar(8),GioKetThuc,108) FROM CaTruc WHERE Ca = @ca);
	END
	ELSE
	BEGIN
		SET @start = '00:00:00';
		SET @end = '23:59:59';
	END

	DECLARE @tmpNgay TABLE(Ngay varchar(10));
	IF @ngay = ''
		INSERT INTO @tmpNgay SELECT DISTINCT convert(varchar(10),ThoiGianKham,103) FROM CuocKham;
	ELSE
		INSERT INTO @tmpNgay VALUES (@ngay);

	DECLARE @tmpMaKB TABLE(maKB nchar(15));
	IF @type = ''
		INSERT INTO @tmpMaKB SELECT MaKhamBenh FROM CuocKham;
	ELSE IF @type = 'out'
		INSERT INTO @tmpMaKB SELECT MaKhamBenh FROM KhamNgoaiTru;
	ELSE
		INSERT INTO @tmpMaKB SELECT MaKhamBenh FROM KhamNoiTru;

	SELECT COUNT(*) AS Tong FROM (SELECT * FROM (SELECT * FROM
		(SELECT * FROM CuocKham JOIN @tmpBacsi BS ON CuocKham.MaBacSi = BS.maNV) AS ck
		JOIN @tmpNgay Ngay ON convert(varchar(10),ck.ThoiGianKham,103) = Ngay.Ngay) AS ck2
		JOIN @tmpMaKB MaKB ON ck2.MaKhamBenh = MaKB.maKB) AS ck3
	WHERE convert(varchar(8),ck3.ThoiGianKham,108) >= @start and convert(varchar(8),ck3.ThoiGianKham,108) <= @end;
END
GO

EXEC PatientCount 'out','YDK','02/11/2020',2;