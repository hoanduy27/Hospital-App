--3. Xem danh sách bệnh nhân trong 1 ngày mà mình đã phụ trách
CREATE OR ALTER PROCEDURE PROC_3
	@thoi_gian_kham date,
	@ma_bac_si nchar(9)
AS
BEGIN
	(SELECT DISTINCT BenhNhan.CMND, Ho, Ten
	FROM BenhNhan INNER JOIN CuocKham
	ON 
		BenhNhan.CMND = CuocKham.MaBN 
		AND CAST(CuocKham.ThoiGianKham AS DATE) = @thoi_gian_kham 
		AND CuocKham.MaBacSi = @ma_bac_si)

	UNION 

	(SELECT DISTINCT BenhNhan.CMND, Ho, Ten
	FROM BenhNhan INNER JOIN
		( CuocKham INNER JOIN CoXetNghiem 
		ON 
			CuocKham.MaKhamBenh = CoXetNghiem.MaKhamBenh 
			AND CAST(CuocKham.ThoiGianKham AS DATE)= @thoi_gian_kham 
			AND CoXetNghiem.MaBSXN = @ma_bac_si )
	ON BenhNhan.CMND = CuocKham.MaBN) 

	UNION

	(SELECT DISTINCT BenhNhan.CMND, Ho, Ten
	FROM BenhNhan INNER JOIN
		( CuocKham INNER JOIN CoChupPhim 
		ON 
			CuocKham.MaKhamBenh = CoChupPhim.MaKhamBenh 
			AND CAST(CuocKham.ThoiGianKham AS DATE) = @thoi_gian_kham 
			AND CoChupPhim.MaBSCP = @ma_bac_si )
	ON BenhNhan.CMND = CuocKham.MaBN) 

END
GO

EXEC PROC_3 '2020-11-11', '100000006';
