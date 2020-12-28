USE HospitalDB
GO

CREATE OR ALTER PROC DoctorSearch
	@khoa varchar(20),
	@ngay int,
	@ca int
AS
BEGIN
	DECLARE @tmpKhoa TABLE(ma nchar(4));
	IF @khoa = ''
		INSERT INTO @tmpKhoa SELECT MaKhoa FROM Khoa;
	ELSE
		INSERT INTO @tmpKhoa SELECT MaKhoa FROM Khoa WHERE TenKhoa = @khoa;

	DECLARE @tmpCa TABLE(Ca int);
	IF @ca = 0
		INSERT INTO @tmpCa SELECT Ca FROM CaTruc;
	ELSE
		INSERT INTO @tmpCa VALUES (@ca);

	DECLARE @tmpNgay TABLE(Ngay int);
	IF @ngay = 0
		INSERT INTO @tmpNgay SELECT DISTINCT NgayLamViec FROM LamViec;
	ELSE
		INSERT INTO @tmpNgay VALUES (@ngay);

	SELECT b.MaNV,NhanVien.Ho,NhanVien.Ten,b.ChuyenNganh,b.HocVi,b.ThamNien,b.MaKhoa FROM
	NhanVien JOIN
	(SELECT bs.MaNV,bs.ChuyenNganh,bs.HocVi,bs.ThamNien,bs.MaKhoa FROM
		(SELECT * FROM BacSi JOIN @tmpKhoa tmpKhoa ON BacSi.MaKhoa = tmpKhoa.ma) AS bs JOIN
			(SELECT * FROM (SELECT * FROM LamViec JOIN @tmpNgay tmpNgay ON LamViec.NgayLamViec = tmpNgay.Ngay) AS lv1 JOIN
				@tmpCa tmpCa ON lv1.CaLamViec = tmpCa.Ca) AS lv
		ON bs.MaNV = lv.MaNV) AS b
	ON NhanVien.MaNV = b.MaNV
END
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
	ELSE IF @type = 'Ngoai tru'
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