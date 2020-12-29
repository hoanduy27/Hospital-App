USE HospitalDB1
GO
--1: Cap nhat thong tin nhan khau hoc va bhyt
create or alter proc BN1_UpdatePatientInfo
	@cmnd nchar(9),
	@bhyt varchar(15),
	@GioiTinh nchar(1),
	@ChieuCao INTEGER,
	@CanNang INTEGER
as
begin
	DECLARE @oldBHYT NCHAR(15);
	DECLARE @oldGioiTinh NCHAR(1);
	DECLARE @oldChieuCao INTEGER;
	DECLARE @oldCanNang INTEGER;

	SELECT @oldBHYT = MaBHYT, @oldGioiTinh = GioiTinh, @oldChieuCao = ChieuCao, @oldCanNang = CanNang
	FROM BenhNhan
	WHERE CMND = @cmnd

	IF(@bhyt = '')
		SET @bhyt = @oldBHYT;
	IF(@GioiTinh = '')
		SET @GioiTinh = @oldGioiTinh;
	IF(@ChieuCao = 0)
		SET @ChieuCao = @oldChieuCao
	IF(@CanNang = 0)
		SET @CanNang = @oldCanNang

	update BenhNhan
	set MaBHYT=@bhyt, GioiTinh = @GioiTinh, ChieuCao = @ChieuCao, CanNang= @CanNang
	where CMND = @cmnd
end
GO



