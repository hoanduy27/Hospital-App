/*
	Trong bảng [KetQuaXetNghiem], GhiChu phải phù hợp với GiaTri.
	Cụ thể với mỗi cặp (MaXN, TenChiSo) sẽ ứng với một NguongBinhThuong trong bảng [ChiSo]
	Ở đây giả sử GiaTri <= NguongBT thì GhiChu là BinhThuong, ngược lại là BatThuong.
	Trigger trg_CheckNoteTestRet dùng để chỉnh sửa lại GhiChu cho phù hợp.
*/
USE HospitalDB1
GO

CREATE OR ALTER TRIGGER trg_CheckNoteTestRet
	ON KetQuaXetNghiem
	AFTER INSERT

AS
BEGIN
	DECLARE @Value FLOAT
	DECLARE @Limit FLOAT
	DECLARE @CheckupID NCHAR(15)
	DECLARE @TestID NCHAR(4)
	DECLARE @IdxName VARCHAR(30)
	
	DECLARE TestRet CURSOR FOR

	SELECT MaKhamBenh, MaXN, TenChiSo, GiaTri 
	FROM inserted
	
	--Lay tung ket qua xet nghiem trong inserted
	OPEN TestRet
	FETCH NEXT FROM TestRet INTO
		@CheckupID,
		@TestID,
		@IdxName,
		@Value;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Lay gia tri NguongBT tuong ung
		SELECT @Limit = NguongBT
		FROM ChiSo
		WHERE 
			MaXN = @TestID
			AND TenChiSo = @IdxName;
		
		--Neu GiaTri <= NguongBT thi GhiChu la BinhThuong
		IF(@Value <= @Limit)
			--PRINT 'Binh thuong'
			UPDATE KetQuaXetNghiem
			SET GhiChu = 'BinhThuong'
			WHERE 
				MaKhamBenh = @CheckupID
				AND MaXN = @TestID
				AND TenChiSo = @IdxName 

		--Neu GiaTri > NguongBT thi GhiChu la BatThuong
		ELSE
			--PRINT 'Bat thuong'
			UPDATE KetQuaXetNghiem
			SET GhiChu = 'BatThuong'
			WHERE 
				MaKhamBenh = @CheckupID
				AND MaXN = @TestID
				AND TenChiSo = @IdxName 

		--Lay ket qua tiep theo trong inserted
		FETCH NEXT FROM TestRet INTO
			@CheckupID,
			@TestID,
			@IdxName,
			@Value;
	END

	CLOSE TestRet
	DEALLOCATE TestRet
END
GO



INSERT INTO CoXetNghiem	
VALUES
	('100000000000006', '0001', '100000016', '+')
GO

INSERT INTO KetQuaXetNghiem
VALUES 
	('100000000000006', '0001', 'Duong huyet luc doi', 100.0, 'BatThuong'),
	('100000000000006', '0001', 'Duong huyet nap glucose', 140.1, 'BinhThuong')
GO
--Run later to get back to the original table if needed.
DELETE FROM KetQuaXetNghiem
WHERE MaKhamBenh = '100000000000006' AND MaXN = '0001'
GO

DELETE FROM CoXetNghiem
WHERE MaKhamBenh = '100000000000006' AND MaXN = '0001'
GO

