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

EXEC DoctorSearch 'CDHA',4,2;