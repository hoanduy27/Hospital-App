--Drop Database HospitalDB1
--Create Database HospitalDB1

USE HospitalDB1
GO

CREATE TABLE [NhanVien] (
  [MaNV] NCHAR(9) PRIMARY KEY,
  [Ho] VARCHAR(30) NOT NULL,
  [Ten] VARCHAR(10) NOT NULL,
  [NgaySinh] DATE NOT NULL,
  [NgayVaoLam] DATE NOT NULL
)
GO

--Changed----------------
CREATE TABLE [CaTruc] (
  [Ca] SMALLINT PRIMARY KEY,
  [GioBatDau] TIME NOT NULL,
  [GioKetThuc] TIME NOT NULL
)
-------------------------
GO
CREATE TABLE [LamViec] (
  [MaNV] NCHAR(9),
  --Changed-----
  [NgayLamViec] SMALLINT,
  [CaLamViec] SMALLINT,
  --------------
  PRIMARY KEY ([MaNV], [NgayLamViec], [CaLamViec])
)
GO

CREATE TABLE [BacSi] (
  [MaNV] NCHAR(9) PRIMARY KEY,
  [ChuyenNganh] VARCHAR(20) NOT NULL,
  [HocVi] VARCHAR(20) NOT NULL,
  [ThamNien] INTEGER NOT NULL,
  [MaKhoa] NCHAR(4) NOT NULL
)
GO

CREATE TABLE [BQL] (
  [MaNV] NCHAR(9) PRIMARY KEY DEFAULT ('000000000')
)
GO

CREATE TABLE [Khoa] (
  [MaKhoa] NCHAR(4) PRIMARY KEY,
  [TenKhoa] VARCHAR(20) UNIQUE NOT NULL,
  [MaQuanLy] NCHAR(9) NOT NULL
)
GO

CREATE TABLE [BacSiChinh] (
  [MaNV] NCHAR(9) PRIMARY KEY
)
GO

CREATE TABLE [BacSiXetNghiem] (
  [MaNV] NCHAR(9) PRIMARY KEY,
  [LinhVuc] VARCHAR(8) NOT NULL
)
GO

CREATE TABLE [BacSiChupPhim] (
  [MaNV] NCHAR(9) PRIMARY KEY,
  [NgayDamNhiem] DATE NOT NULL
)
GO

CREATE TABLE [CuocKham] (
  [MaKhamBenh] NCHAR(15) PRIMARY KEY,
  [ThoiGianKham] DATETIME NOT NULL,
  [MaBacSi] NCHAR(9),
  [MaBN] NCHAR(9)
)
GO

CREATE TABLE [KhamNoiTru] (
  [MaKhamBenh] NCHAR(15) PRIMARY KEY,
  [ThoiGianThamKham] DATETIME NOT NULL
)
GO

CREATE TABLE [KhamNgoaiTru] (
  [MaKhamBenh] NCHAR(15) PRIMARY KEY,
  [ThoiGianTaiKham] DATETIME NOT NULL
)
GO

CREATE TABLE [XetNghiem] (
  [MaXN] NCHAR(4) PRIMARY KEY,
  [TenXN] VARCHAR(15) UNIQUE NOT NULL
)
GO

CREATE TABLE [ChiSo] (
  [MaXN] NCHAR(4) NOT NULL,
  [TenChiSo] VARCHAR(30) UNIQUE NOT NULL,
  [DonVi] VARCHAR(10) NOT NULL,
  [NguongBT] FLOAT NOT NULL,
  PRIMARY KEY([MaXN], [TenChiSo])
)
GO

CREATE TABLE [ChupPhim] (
  [Ten] VARCHAR(15) PRIMARY KEY
)
GO

CREATE TABLE [Thuoc] (
  [Ten] VARCHAR(30),
  [NhaCungCap] VARCHAR(30),
  [DonVi] VARCHAR(4) NOT NULL
  PRIMARY KEY ([Ten], [NhaCungCap])
)
GO

CREATE TABLE [CoXetNghiem] (
  [MaKhamBenh] NCHAR(15),
  [MaXN] NCHAR(4),
  [MaBSXN] NCHAR(9) NOT NULL,
  [ChanDoanXetNghiem] VARCHAR(100) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [MaXN])
)
GO

CREATE TABLE [KetQuaXetNghiem] (
  [MaKhamBenh] NCHAR(15) NOT NULL,
  [MaXN] NCHAR(4) NOT NULL,
  [TenChiSo] VARCHAR(30) NOT NULL,
  [GiaTri] FLOAT NOT NULL,
  [GhiChu] VARCHAR(11) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [MaXN], [TenChiSo])
)
GO

CREATE TABLE [CoChupPhim] (
  [MaKhamBenh] NCHAR(15),
  [TenChupPhim] VARCHAR(15),
  [MaBSCP] NCHAR(9) NOT NULL,
  [KetQua] VARCHAR(255) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [TenChupPhim])
)
GO

CREATE TABLE [ChanDoanHinhAnh] (
  [MaKhamBenh] NCHAR(15) NOT NULL,
  [TenChupPhim] VARCHAR(15) NOT NULL,
  [CDHA] VARCHAR(100) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [TenChupPhim], [CDHA])
)
GO

CREATE TABLE [CoKeDon] (
  [MaKhamBenh] NCHAR(15),
  [TenThuoc] VARCHAR(30),
  [NhaCungCap] VARCHAR(30),
  [LieuSang] INT,
  [LieuTrua] INT,
  [LieuChieu] INT,
  [LieuToi] INT,
  [SoLuong] INT NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [TenThuoc], [NhaCungCap])
)
GO

CREATE TABLE [BenhNhan] (
  [CMND] NCHAR(9) PRIMARY KEY,
  [MaBHYT] NCHAR(15) UNIQUE,
  [Ho] VARCHAR(30) NOT NULL,
  [Ten] VARCHAR(10) NOT NULL,
  [GioiTinh] NCHAR(1) NOT NULL,
  [NgaySinh] DATE NOT NULL,
  [ChieuCao] INTEGER NOT NULL,
  [CanNang] INTEGER NOT NULL
)
GO

CREATE TABLE [DiUng] (
  [MaBN] NCHAR(9) NOT NULL,
  [TenDiUng] NCHAR(15) NOT NULL,
  PRIMARY KEY([MaBN], [TenDiUng])
)
GO

CREATE TABLE [BenhNhanNoiTru] (
  [CMND] NCHAR(9) PRIMARY KEY,
  --[MaBSChiDinhNV] NCHAR(9) NOT NULL,
  --[MaBSChiDinhXV] NCHAR(9) NOT NULL
)
GO

CREATE TABLE [BenhNhanNgoaiTru] (
  [CMND] NCHAR(9) PRIMARY KEY
)
GO

CREATE TABLE [CheDoDinhDuong] (
  [MaKhamBenh] NCHAR(15) PRIMARY KEY
)
GO

CREATE TABLE [ThucPhamBoSung] (
  [MaKhamBenh] NCHAR(15) NOT NULL,
  [TenThucPham] VARCHAR(15) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [TenThucPham])
)
GO

CREATE TABLE [ThucPhamKieng] (
  [MaKhamBenh] NCHAR(15) NOT NULL,
  [TenThucPham] VARCHAR(15) NOT NULL,
  PRIMARY KEY ([MaKhamBenh], [TenThucPham])
)
GO

CREATE TABLE [NguoiThan] (
  [MaBN] NCHAR(9),
  [Ten] NCHAR(40),
  [QuanHe] NCHAR(10),
  [GioiTinh] NCHAR(1) NOT NULL,
  [NgaySinh] DATE NOT NULL,
  PRIMARY KEY ([MaBN], [Ten], [QuanHe])
)
GO

CREATE TABLE [BenhAnNoiTru] (
  [MaBenhAn] NCHAR(4),
  [MaBN] NCHAR(9),

  [MaBSChiDinhNV] NCHAR(9) NOT NULL,
  [MaBSChiDinhXV] NCHAR(9),

  [SoBuong] VARCHAR(6) NOT NULL,
  [SoGiuong] INTEGER NOT NULL,
  [ThoiGianNhapVien] DATETIME NOT NULL,
  [TinhTrangNhapVien] VARCHAR(10) NOT NULL,
  [ThoiGianXuatVien] DATETIME,
  [TinhTrangXuatVien] VARCHAR(10),
  [GhiChu] VARCHAR(255),
  PRIMARY KEY([MaBenhAn], [MaBN])
)
GO

CREATE TABLE [BenhNhapVien] (
  [MaBN] NCHAR(9) NOT NULL,
  [TenBenh] VARCHAR(50) NOT NULL,
  PRIMARY KEY ([MaBN], [TenBenh])
)
GO

CREATE TABLE [BenhXuatVien] (
  [MaBN] NCHAR(9) NOT NULL,
  [TenBenh] VARCHAR(50) NOT NULL,
  PRIMARY KEY ([MaBN], [TenBenh])
)
GO
