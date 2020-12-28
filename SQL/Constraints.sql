USE HospitalDB1
GO

ALTER TABLE [LamViec] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien]([MaNV])
GO

ALTER TABLE [LamViec] ADD FOREIGN KEY ([NgayLamViec], [CaLamViec]) REFERENCES [CaTruc]([Thu],[Ca])
GO

ALTER TABLE [BacSi] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien] ([MaNV])
GO

ALTER TABLE [BacSi] ADD FOREIGN KEY ([MaKhoa]) REFERENCES [Khoa] ([MaKhoa])
GO

ALTER TABLE [BQL] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien] ([MaNV])
GO

ALTER TABLE [Khoa] ADD FOREIGN KEY ([MaQuanLy]) REFERENCES [BacSi] ([MaNV])
GO

ALTER TABLE [BacSiChinh] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien] ([MaNV])
GO

ALTER TABLE [BacSiXetNghiem] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien] ([MaNV])
GO

ALTER TABLE [BacSiChupPhim] ADD FOREIGN KEY ([MaNV]) REFERENCES [NhanVien] ([MaNV])
GO

ALTER TABLE [CuocKham] ADD FOREIGN KEY ([MaBacSi]) REFERENCES [BacSiChinh] ([MaNV])
GO

ALTER TABLE [CuocKham] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhan] ([CMND])
GO

ALTER TABLE [KhamNoiTru] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [KhamNgoaiTru] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [ChiSo] ADD FOREIGN KEY ([MaXN]) REFERENCES [XetNghiem] ([MaXN])
GO

ALTER TABLE [CoXetNghiem] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [CoXetNghiem] ADD FOREIGN KEY ([MaXN]) REFERENCES [XetNghiem] ([MaXN])
GO

ALTER TABLE [CoXetNghiem] ADD FOREIGN KEY ([MaBSXN]) REFERENCES [BacSiXetNghiem] ([MaNV])
GO

ALTER TABLE [KetQuaXetNghiem] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham]([MaKhamBenh])
GO

ALTER TABLE [KetQuaXetNghiem] ADD FOREIGN KEY ([MaXN]) REFERENCES [XetNghiem] ([MaXN])
GO

ALTER TABLE [CoChupPhim] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [CoChupPhim] ADD FOREIGN KEY ([TenChupPhim]) REFERENCES [ChupPhim] ([Ten])
GO

ALTER TABLE [CoChupPhim] ADD FOREIGN KEY ([MaBSCP]) REFERENCES [BacSiChupPhim] ([MaNV])
GO

ALTER TABLE [ChanDoanHinhAnh] ADD FOREIGN KEY ([MaKhamBenh],[TenChupPhim]) REFERENCES [CoChupPhim]([MaKhamBenh],[TenChupPhim])
GO

ALTER TABLE [CoKeDon] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [CoKeDon] ADD FOREIGN KEY ([TenThuoc], [NhaCungCap]) REFERENCES [Thuoc] ([Ten], [NhaCungCap])
GO

ALTER TABLE [DiUng] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhan] ([CMND])
GO

ALTER TABLE [BenhNhanNoiTru] ADD FOREIGN KEY ([CMND]) REFERENCES [BenhNhan] ([CMND])
GO

ALTER TABLE [BenhNhanNoiTru] ADD FOREIGN KEY ([MaBSChiDinhNV]) REFERENCES [BacSiChinh] ([MaNV])
GO

ALTER TABLE [BenhNhanNoiTru] ADD FOREIGN KEY ([MaBSChiDinhXV]) REFERENCES [BacSiChinh] ([MaNV])
GO

ALTER TABLE [BenhNhanNgoaiTru] ADD FOREIGN KEY ([CMND]) REFERENCES [BenhNhan] ([CMND])
GO

ALTER TABLE [CheDoDinhDuong] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CuocKham] ([MaKhamBenh])
GO

ALTER TABLE [ThucPhamBoSung] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CheDoDinhDuong] ([MaKhamBenh])
GO

ALTER TABLE [ThucPhamKieng] ADD FOREIGN KEY ([MaKhamBenh]) REFERENCES [CheDoDinhDuong] ([MaKhamBenh])
GO

ALTER TABLE [NguoiThan] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhan] ([CMND])
GO

ALTER TABLE [BenhNhapVien] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhanNoiTru] ([CMND])
GO

ALTER TABLE [BenhXuatVien] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhanNoiTru] ([CMND])
GO

ALTER TABLE [BenhAnNoiTru] ADD FOREIGN KEY ([MaBN]) REFERENCES [BenhNhanNoiTru] ([CMND])
GO



ALTER TABLE [NhanVien] ADD CHECK (NgaySinh < CAST(GETDATE() AS DATE))
GO

ALTER TABLE [NhanVien] ADD CHECK (NgayVaoLam < CAST(GETDATE() AS DATE))
GO

ALTER TABLE [NhanVien] ADD CHECK (NgaySinh < DATEADD(year, -18, CAST(NgayVaoLam as DATE)))
GO

ALTER TABLE [CaTruc] ADD CHECK (Thu IN (2,3,4,5,6,7,8))
GO

ALTER TABLE [CaTruc] ADD CHECK (Ca IN ('Sang', 'Chieu', 'Toi'))
GO

ALTER TABLE [BacSi] ADD CHECK (HocVi IN ('ChuyenKhoa', 'TienSi', 'ThacSi'))
GO

ALTER TABLE [BacSi] ADD CHECK (ThamNien >= 0)
GO

ALTER TABLE [BacSiXetNghiem] ADD CHECK (LinhVuc IN ('ViSinh', 'HoaSinh'))
GO

ALTER TABLE [BacSiChupPhim] ADD CHECK (NgayDamNhiem BETWEEN DATEADD(year, -3, CAST(GETDATE() as DATE)) AND CAST(GETDATE() as DATE))
GO

ALTER TABLE [CuocKham] ADD CHECK ((ThoiGianKham) <= GETDATE())
GO

ALTER TABLE [KhamNoiTru] ADD CHECK (ThoiGianThamKham >= GETDATE())
GO

ALTER TABLE [KhamNgoaiTru] ADD CHECK (ThoiGianTaiKham >= GETDATE())
GO

ALTER TABLE [KetQuaXetNghiem] ADD CHECK (GhiChu IN ('BinhThuong', 'BatThuong'))
GO

ALTER TABLE [CoKeDon] ADD CHECK (LieuSang + LieuTrua + LieuChieu + LieuToi <= SoLuong)
GO

ALTER TABLE [CoKeDon] ADD CHECK (DonVi IN ('vien', 'goi', 'ml'))
GO

ALTER TABLE [BenhNhan] ADD CHECK (CMND LIKE '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

ALTER TABLE [BenhNhan] ADD CHECK (GioiTinh IN ('M', 'F'))
GO

ALTER TABLE [BenhNhan] ADD CHECK (NgaySinh <= CAST(GETDATE() as DATE))
GO

ALTER TABLE [BenhNhan] ADD CHECK (ChieuCao > 0)
GO

ALTER TABLE [BenhNhan] ADD CHECK (CanNang > 0)
GO

ALTER TABLE [NguoiThan] ADD CHECK (QuanHe IN ('Cha', 'Me', 'Con', 'Anh', 'Chi', 'Em', 'HoHang'))
GO

ALTER TABLE [NguoiThan] ADD CHECK (GioiTinh IN ('M', 'F'))
GO

ALTER TABLE [NguoiThan] ADD CHECK (NgaySinh <= CAST(GETDATE() as DATE))
GO

ALTER TABLE [BenhAnNoiTru] ADD CHECK (ThoiGianNhapVien <= GETDATE())
GO

ALTER TABLE [BenhAnNoiTru] ADD CHECK (ThoiGianXuatVien <= GETDATE())
GO

ALTER TABLE [BenhAnNoiTru] ADD CHECK (ThoiGianNhapVien < ThoiGianXuatVien)
GO
