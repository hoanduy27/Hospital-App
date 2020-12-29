--Kết quả xét nghiệm mới được thêm vào phải có TenChiSo nằm trong các TenChiSo trong bảng [ChiSo] ứng với MaXN

USE HospitalDB1
GO

CREATE OR ALTER TRIGGER trg_InsertMismatchIndexNameInTestRet
	ON KetQuaXetNghiem
	INSTEAD OF INSERT
AS
BEGIN
	IF(
		(SELECT COUNT(inserted.TenChiSo)
			FROM ChiSo, inserted
			WHERE 
				inserted.MaXN = ChiSo.MaXN
				AND inserted.TenChiSo = ChiSo.TenChiSo
		)
		< (SELECT COUNT(*) FROM inserted)
	)
	BEGIN
		PRINT 'Mismatch in TenChiSo'
	END
	ELSE
		--PRINT 'Can insert'
		INSERT INTO KetQuaXetNghiem
		SELECT * FROM inserted
END
GO

INSERT INTO CoXetNghiem	
VALUES
	('100000000000006', '0001', '100000016', '+')

INSERT INTO KetQuaXetNghiem
VALUES 
	('100000000000006', '0001', 'Duong huyet luc doi', 8.6, 'BatThuong'),
	('100000000000006', '0001', 'Duong huyet nap glucose', 8.6, 'BatThuong')

--Run later to get back to the original table if needed.
DELETE FROM KetQuaXetNghiem
WHERE MaKhamBenh = '100000000000006' AND MaXN = '0001'
GO

DELETE FROM CoXetNghiem
WHERE MaKhamBenh = '100000000000006' AND MaXN = '0001'
GO

