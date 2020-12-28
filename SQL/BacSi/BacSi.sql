USE HospitalDB1
GO

--1. Cập nhật hoạt động khám / chữa bệnh cho bệnh nhân ngoại trú trong 1 ca trực
CREATE OR ALTER PROCEDURE PROC_1
	@ma_kham_benh nchar(15),
	@thoi_gian_kham datetime,
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	IF SUBSTRING(@ma_kham_benh,1,1) = '1'
		UPDATE CuocKham 
		SET ThoiGianKham = @thoi_gian_kham , MaBacSi = @ma_bac_si ,MaBN = @ma_benh_nhan 
		WHERE MaKhamBenh = @ma_kham_benh;
	ELSE
		PRINT 'MA KHAM BENH CUA BENH NHAN NGOAI TRU BAT DAU LA 1';
END
GO

--2. Cập nhật hoạt động khám / chữa bệnh cho bệnh nhân nội trú trong 1 ca trực
CREATE OR ALTER PROCEDURE PROC_2
	@ma_kham_benh nchar(15),
	@thoi_gian_kham datetime,
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9),

	@ma_benh_an nchar(4),
	@maBSChiDinhNV nchar(9),
	@maBSChiDinhXV nchar(9),
	@so_buong varchar(6),
	@so_giuong int,
	@thoi_gian_nhap_vien datetime,
	@tinh_trang_nhap_vien varchar(10),
	@thoi_gian_xuat_vien datetime,
	@tinh_trang_xuat_vien varchar(10),
	@ghi_chu varchar(255)
AS
BEGIN
	IF SUBSTRING(@ma_kham_benh,1,1) = '2'
		UPDATE CuocKham 
		SET ThoiGianKham = @thoi_gian_kham , MaBacSi = @ma_bac_si ,MaBN = @ma_benh_nhan 
		WHERE MaKhamBenh = @ma_kham_benh;
	ELSE
		PRINT 'MA KHAM BENH CUA BENH NHAN NGOAI TRU BAT DAU LA 2';

		UPDATE BenhAnNoiTru 
		SET MaBN = @ma_benh_nhan , MaBSChiDinhNV = @maBSChiDinhNV, MaBSChiDinhXV = @maBSChiDinhXV ,SoBuong = @so_buong,
				SoGiuong = @so_giuong, ThoiGianNhapVien = @thoi_gian_nhap_vien , TinhTrangNhapVien = @tinh_trang_nhap_vien ,
				ThoiGianXuatVien = @thoi_gian_xuat_vien , TinhTrangXuatVien = @tinh_trang_xuat_vien, GhiChu = @ghi_chu
		WHERE MaBenhAn = @ma_benh_an;
END
GO

--3. Xem danh sách bệnh nhân trong 1 ngày mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_3
	@thoi_gian_kham datetime,
	@ma_bac_si nchar(9)
AS
BEGIN
	(SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN CuocKham
	ON BenhNhan.CMND = CuocKham.MaBN AND CuocKham.ThoiGianKham = @thoi_gian_kham AND CuocKham.MaBacSi = @ma_bac_si)

	UNION 

	(SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN
	( CuocKham INNER JOIN CoXetNghiem ON CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh AND CuocKham.ThoiGianKham = @thoi_gian_kham 
										AND CoXetNghiem.MaBSXN = @ma_bac_si )
	ON BenhNhan.CMND = CuocKham.MaBN) 

	UNION

	(SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN
	( CuocKham INNER JOIN CoChupPhim ON CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh AND CuocKham.ThoiGianKham = @thoi_gian_kham 
										AND CoChupPhim.MaBSCP = @ma_bac_si )
	ON BenhNhan.CMND = CuocKham.MaBN) 

END
GO

--4. Xem các chẩn đóan bệnh của bệnh nhân mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_4
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	(SELECT DISTINCT XetNghiem.TenXN AS BenhChanDoan
	FROM XetNghiem INNER JOIN (CuocKham INNER JOIN CoXetNghiem ON CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT CoChupPhim.KetQua AS BenhChanDoan
	FROM CuocKham INNER JOIN CoChupPhim 
	ON CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)

	UNION

	(SELECT DISTINCT XetNghiem.TenXN AS BenhChanDoan
	FROM XetNghiem INNER JOIN (CuocKham INNER JOIN CoXetNghiem ON CuocKham.MaBN = @ma_benh_nhan AND CoXetNghiem.MaBSXN = @ma_bac_si AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh) 
	ON XetNghiem.MaXN = CoXetNghiem.MaXN)

	UNION

	(SELECT DISTINCT CoChupPhim.KetQua AS BenhChanDoan
	FROM CuocKham INNER JOIN CoChupPhim 
	ON CuocKham.MaBN = @ma_benh_nhan AND CoChupPhim.MaBSCP = @ma_bac_si AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh)

	--UNION

	--(SELECT DISTINCT BenhNhapVien.TenBenh AS BenhChanDoan
	--FROM BenhNhapVien INNER JOIN BenhNhanNoiTru
	--ON BenhNhanNoiTru.CMND = BenhNhapVien.MaBN AND BenhNhanNoiTru.CMND = @ma_benh_nhan AND BenhNhanNoiTru.MaBSChiDinhNV = @ma_bac_si)

	--UNION

	--(SELECT DISTINCT BenhXuatVien.TenBenh AS BenhChanDoan
	--FROM BenhXuatVien INNER JOIN BenhNhanNoiTru
	--ON BenhNhanNoiTru.CMND = BenhXuatVien.MaBN AND BenhNhanNoiTru.CMND = @ma_benh_nhan AND BenhNhanNoiTru.MaBSChiDinhXV = @ma_bac_si)
												
END
GO

--5. Xem các thuốc đã được dùng qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_5
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	SELECT DISTINCT CoKeDon.* 
	FROM CoKeDon INNER JOIN CuocKham
	ON CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaKhamBenh = CoKeDon.MaKhamBenh;
END
GO

--6. Xem các chỉ định xét nghiệm đã làm qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_6
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	SELECT DISTINCT CoXetNghiem.* 
	FROM CoXetNghiem INNER JOIN CuocKham
	ON CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh;
END
GO

--7. Xem các chỉ định chụp phim đã làm qua các ngày của 1 bệnh nhân nội trú mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_7
	@ma_bac_si nchar(9),
	@ma_benh_nhan nchar(9)
AS
BEGIN
	SELECT DISTINCT CoChupPhim.* 
	FROM CoChupPhim INNER JOIN CuocKham
	ON CuocKham.MaBacSi = @ma_bac_si AND CuocKham.MaBN = @ma_benh_nhan AND CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh;
END
GO

--8. Xem các bệnh nhân của cùng 1 bệnh mà mình đã chẩn đoán
CREATE OR ALTER PROCEDURE PROC_8
	@ma_bac_si nchar(9),
	@ten_benh varchar(100)
AS
BEGIN
	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN (CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh) 
			ON CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh AND CuocKham.MaBacSi = @ma_bac_si) )
		ON BenhNhan.CMND = CuocKham.MaBN

	UNION

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN CoChupPhim 
			ON CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh AND CoChupPhim.KetQua = @ten_benh 
															AND CuocKham.MaBacSi = @ma_bac_si) )
	ON BenhNhan.CMND = CuocKham.MaBN

	UNION 

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN (CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh) 
			ON CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh AND CoXetNghiem.MaBSXN = @ma_bac_si) )
		ON BenhNhan.CMND = CuocKham.MaBN

	UNION

	SELECT DISTINCT BenhNhan.*
	FROM  BenhNhan INNER JOIN(
			(CuocKham INNER JOIN CoChupPhim 
			ON CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh AND CoChupPhim.KetQua = @ten_benh 
															AND CoChupPhim.MaBSCP = @ma_bac_si) )
	ON BenhNhan.CMND = CuocKham.MaBN
END
GO

--9. Xem các bệnh nhân có ghi chú bất thường trong kết quả xét nghiệm của cùng 1 bệnh mà mình đã chẩn đoán
CREATE OR ALTER PROCEDURE PROC_9
	@ma_bac_si nchar(9),
	@ten_benh varchar(100)
AS
BEGIN
	SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN
	(	CuocKham INNER JOIN 
				(KetQuaXetNghiem INNER JOIN 
					( CoXetNghiem INNER JOIN XetNghiem ON CoXetNghiem.MaXN = XetNghiem.MaXN AND XetNghiem.TenXN = @ten_benh)
				ON KetQuaXetNghiem.MaXN = XetNghiem.MaXN AND  KetQuaXetNghiem.GhiChu = 'BatThuong') 
		ON CuocKham.MaKhamBenh = KetQuaXetNghiem.MaKhamBenh AND (CuocKham.MaBacSi = @ma_bac_si OR CoXetNghiem.MaBSXN = @ma_bac_si))					
	ON BenhNhan.CMND = CuocKham.MaBN;
END
GO

--10. Xem các bệnh nhân đã xuất viện mà mình đã phụ trách 
CREATE OR ALTER PROCEDURE PROC_10
	@ma_bac_si nchar(9)
AS
BEGIN
	SELECT DISTINCT BenhNhan.* 
	FROM BenhNhan INNER JOIN BenhAnNoiTru
	ON BenhAnNoiTru.MaBSChiDinhXV = @ma_bac_si;
END
GO

--11. Xem các bệnh nhân nội trú có số lượng dùng của 1 loại thuốc giảm dần trong 3 lần thuốc liên tiếp 
--mà mình đã phụ trách


--12. Xem các bệnh nhân có ghi chú bình thường của 1 chỉ số xét nghiệm trong kết quả xét nghiệm gần nhất 
--nhưng có ghi chú bất thường của cùng 1 chỉ số xét nghiệm trong kết quả xét nghiệm trước đó mà mình phụ trách
