USE HospitalDB
GO

CREATE LOGIN ban_quan_ly
WITH PASSWORD = 'ban_quan_ly_password' MUST_CHANGE, CHECK_EXPIRATION = ON, CHECK_POLICY = ON, DEFAULT_DATABASE = HospitalDB;
GO

CREATE LOGIN bac_si
WITH PASSWORD = 'bac_si_password' MUST_CHANGE, CHECK_EXPIRATION = ON, CHECK_POLICY = ON, DEFAULT_DATABASE = HospitalDB;
GO

CREATE LOGIN ten_benh_nhan
WITH PASSWORD = 'ten_benh_nhan_password' MUST_CHANGE, CHECK_EXPIRATION = ON, CHECK_POLICY = ON, DEFAULT_DATABASE = HospitalDB;
GO

CREATE USER ban_quan_ly FOR LOGIN ban_quan_ly;
GO

CREATE USER bac_si FOR LOGIN bac_si;
GO

CREATE USER ten_benh_nhan FOR LOGIN ten_benh_nhan;
GO

/* Ban quan ly */

GRANT SELECT,UPDATE ON CaTruc			
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON LamViec			
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON PhuTa			
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON BacSi			
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON BacSiChinh		
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON BacSiXetNghiem	
	TO ban_quan_ly 
GO
GRANT SELECT,UPDATE ON BacSiChupPhim	
	TO ban_quan_ly 
GO

GRANT SELECT ON Benhnhan				
	TO ban_quan_ly 
GO
GRANT SELECT ON Nguoithan				
	TO ban_quan_ly 
GO

GRANT SELECT ON CuocKham				
	TO ban_quan_ly 
GO
GRANT SELECT ON KhamNoiTru				
	TO ban_quan_ly 
GO
GRANT SELECT ON KhamNgoaiTru			
	TO ban_quan_ly 
GO
GRANT SELECT ON BenhNhanNgoaiTru		TO ban_quan_ly GO
GRANT SELECT ON BenhNhanNoiTru			TO ban_quan_ly GO
GRANT SELECT ON 
TO ban_quan_ly GO
GRANT SELECT ON CheDoDinhDuong			TO ban_quan_ly GO
GRANT SELECT ON ThucPhamKieng			TO ban_quan_ly GO
GRANT SELECT ON ThucPhamBoSung			TO ban_quan_ly GO
GRANT SELECT ON CoXetNghiem				TO ban_quan_ly GO
GRANT SELECT ON KetQuaXetNghiem			TO ban_quan_ly GO
GRANT SELECT ON CoChupPhim				TO ban_quan_ly GO
GRANT SELECT ON ChanDoanHinhAnh			TO ban_quan_ly GO
GRANT SELECT ON CoKeDon					TO ban_quan_ly GO
GRANT SELECT ON BenhAnNoiTru			TO ban_quan_ly GO
GRANT SELECT ON BenhNhapVien			TO ban_quan_ly GO
GRANT SELECT ON BenhXuatVien			TO ban_quan_ly GO


/* Bac si */

GRANT SELECT,UPDATE ON CuocKham			TO bac_si GO
GRANT SELECT,UPDATE ON KhamNoiTru		TO bac_si GO
GRANT SELECT,UPDATE ON KhamNgoaiTru	    TO bac_si GO
GRANT SELECT,UPDATE ON BenhNhanNgoaiTru	TO bac_si GO
GRANT SELECT,UPDATE ON BenhNhanNoiTru	TO bac_si GO
GRANT SELECT,UPDATE ON YLenh			TO bac_si GO
GRANT SELECT,UPDATE ON CheDoDinhDuong	TO bac_si GO
GRANT SELECT,UPDATE ON ThucPhamKieng	TO bac_si GO
GRANT SELECT,UPDATE ON ThucPhamBoSung	TO bac_si GO
GRANT SELECT,UPDATE ON CoXetNghiem		TO bac_si GO
GRANT SELECT,UPDATE ON KetQuaXetNghiem	TO bac_si GO
GRANT SELECT,UPDATE ON CoChupPhim		TO bac_si GO
GRANT SELECT,UPDATE ON ChanDoanHinhAnh	TO bac_si GO
GRANT SELECT,UPDATE ON CoKeDon			TO bac_si GO
GRANT SELECT,UPDATE ON BenhAnNoiTru		TO bac_si GO
GRANT SELECT,UPDATE ON BenhNhapVien		TO bac_si GO
GRANT SELECT,UPDATE ON BenhXuatVien		TO bac_si GO

GRANT SELECT ON Benhnhan				TO bac_si GO
GRANT SELECT ON Nguoithan				TO bac_si GO

/* Benh nhan */

GRANT SELECT,UPDATE ON Benhnhan			TO ten_benh_nhan GO
GRANT SELECT,UPDATE ON Nguoithan		TO ten_benh_nhan GO

GRANT SELECT ON CuocKham				TO ten_benh_nhan GO
GRANT SELECT ON KhamNoiTru				TO ten_benh_nhan GO
GRANT SELECT ON KhamNgoaiTru			TO ten_benh_nhan GO
GRANT SELECT ON BenhNhanNgoaiTru		TO ten_benh_nhan GO
GRANT SELECT ON BenhNhanNoiTru			TO ten_benh_nhan GO
GRANT SELECT ON YLenh					TO ten_benh_nhan GO
GRANT SELECT ON CheDoDinhDuong			TO ten_benh_nhan GO
GRANT SELECT ON ThucPhamKieng			TO ten_benh_nhan GO
GRANT SELECT ON ThucPhamBoSung			TO ten_benh_nhan GO
GRANT SELECT ON CoXetNghiem				TO ten_benh_nhan GO
GRANT SELECT ON KetQuaXetNghiem			TO ten_benh_nhan GO
GRANT SELECT ON CoChupPhim				TO ten_benh_nhan GO
GRANT SELECT ON ChanDoanHinhAnh			TO ten_benh_nhan GO
GRANT SELECT ON CoKeDon					TO ten_benh_nhan GO
GRANT SELECT ON BenhAnNoiTru			TO ten_benh_nhan GO
GRANT SELECT ON BenhNhapVien			TO ten_benh_nhan GO
GRANT SELECT ON BenhXuatVien			TO ten_benh_nhan GO


 
   
  
