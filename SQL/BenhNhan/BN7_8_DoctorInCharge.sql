--BN7: DS cac bac si dieu tri trong lan dieu tri gan nhat
--BN8: DS cac bac si da dieu tri trong tat ca cac lan dieu tri
USE HospitalDB1
GO

create or alter proc BN7_8_DoctorInCharge
	@cmnd nchar(9),
	@isAll SMALLINT --0: Most Recent, 1: All
AS
BEGIN
	IF(@isAll = 0)
	BEGIN
		(SELECT CuocKham.MaKhamBenh, CuocKham.MaBacSi, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, NhanVien
		WHERE 
			CuocKham.MaBacSi = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd))

		UNION 

		(SELECT CuocKham.MaKhamBenh, CoXetNghiem.MaBSXN, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, CoXetNghiem, NhanVien
		WHERE 
			CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh
			AND CoXetNghiem.MaBSXN = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd))

		UNION

		(SELECT CuocKham.MaKhamBenh, CoChupPhim.MaBSCP, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, CoChupPhim, NhanVien
		WHERE 
			CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh
			AND CoChupPhim.MaBSCP = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd
			AND CuocKham.ThoiGianKham = (SELECT MAX(ThoiGianKham) FROM CuocKham WHERE MaBN = @cmnd))
	END

	ELSE
		(SELECT CuocKham.MaKhamBenh, CuocKham.MaBacSi, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, NhanVien
		WHERE 
			CuocKham.MaBacSi = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd)

		UNION 

		(SELECT CuocKham.MaKhamBenh, CoXetNghiem.MaBSXN, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, CoXetNghiem, NhanVien
		WHERE 
			CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh
			AND CoXetNghiem.MaBSXN = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd)

		UNION

		(SELECT CuocKham.MaKhamBenh, CoChupPhim.MaBSCP, NhanVien.Ho, NhanVien.Ten
		FROM CuocKham, CoChupPhim, NhanVien
		WHERE 
			CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh
			AND CoChupPhim.MaBSCP = NhanVien.MaNV
			AND CuocKham.MaBN = @cmnd)
END
GO

EXEC BN7_8_DoctorInCharge '225600013', 0
EXEC BN7_8_DoctorInCharge '225600013', 1
