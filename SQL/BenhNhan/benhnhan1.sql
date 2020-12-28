USE HospitalDB1
GO
--1: Cap nhat thong tin nhan khau hoc va bhyt
create or alter proc BN1_UpdatePatientInfo
	@cmnd nchar(9),
	@bhyt nchar(15),
	@GioiTinh nchar(1),
	@ChieuCao int,
	@CanNang int
as
begin
	update BenhNhan
	set MaBHYT=@bhyt, GioiTinh = @GioiTinh, ChieuCao = @ChieuCao, CanNang=@CanNang
	where CMND = @cmnd
end
