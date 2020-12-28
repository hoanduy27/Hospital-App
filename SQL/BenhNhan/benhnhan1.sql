create or alter proc cap_nhat_thong_tin_benh_nhan
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


