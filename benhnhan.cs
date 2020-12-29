using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hospital
{
    public partial class benhnhan : Form
    {
        public benhnhan()
        {
            InitializeComponent();
            LoadBenhnhanPage();
        }

        void LoadBenhnhanPage()
        {
            string query = "SELECT * FROM BenhNhan WHERE CMND = '" + IdKeeper.ID.Get() + "'";
            DataTable info = ADO.DataProvider.Instance.executeQuery(query);
            string ho, ten, gioiTinh, ngaySinh, CMND, BHYT, chieuCao, canNang;
            ho = info.Rows[0]["Ho"].ToString();
            ten = info.Rows[0]["Ten"].ToString();
            gioiTinh = info.Rows[0]["GioiTinh"].ToString() == "M" ? "Nam" : "Nữ";
            ngaySinh = info.Rows[0]["NgaySinh"].ToString();
            
            CMND = info.Rows[0]["CMND"].ToString();
            BHYT = info.Rows[0]["MaBHYT"].ToString();
            chieuCao = info.Rows[0]["ChieuCao"].ToString();
            canNang = info.Rows[0]["CanNang"].ToString();

            string m, d, y;
            ngaySinh = ngaySinh.Substring(0, ngaySinh.IndexOf(' '));
            /* mm/dd/yyyy */
            m = ngaySinh.Split('/')[0];
            d = ngaySinh.Split('/')[1];
            y = ngaySinh.Split('/')[2];
            ngaySinh = d + ", Tháng " + m + ", " + y;


            benhnhanLbl.Text = "Bệnh nhân " + ho + " " + ten;

            txtBNInfoName.Text = ho + " " + ten;
            txtBNInfoSex.Text = gioiTinh;
            txtBNInfoDOB.Text = ngaySinh;
            txtBNInfoCMND.Text = CMND;
            txtBNInfoBHYT.Text = BHYT;
            txtBNInfoHeight.Text = chieuCao;
            txtBNInfoWeight.Text = canNang;

        }

        private void changeBtn_Click(object sender, EventArgs e)
        {
            changeBtn.Enabled = false;
            UpdatePatientInfo upd = new UpdatePatientInfo();
            upd.ShowDialog();

            LoadBenhnhanPage();
            changeBtn.Enabled = true;
        }

        private void BNBacSiBtn_Click(object sender, EventArgs e)
        {
            string typ;
            if (BNBacSiCbx.Text == "Tất cả") typ = "1";
            else if (BNBacSiCbx.Text == "Lần khám gần nhất") typ = "0";
            else
            {

                return;
            }
            string query =
                "DECLARE @r TABLE(MaKhamBenh NCHAR(15), MaBacSi NCHAR(9), Ho VARCHAR(100), Ten VARCHAR(100))\n"
                + "INSERT @r EXEC BN7_8_DoctorInCharge " + "'" + IdKeeper.ID.Get() + "'," + typ
                + "SELECT MaKhamBenh, MaBacSi, Ho + ' ' + Ten AS TenBacSi FROM @r";
            BNBacSiList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

            BNBacSiList.Columns[0].HeaderText = "Mã khám bệnh";
            BNBacSiList.Columns[1].HeaderText = "Mã NV";
            BNBacSiList.Columns[2].HeaderText = "Tên bác sĩ";

            BNBacSiList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            BNBacSiList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            BNBacSiList.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void BNXetNghiemBtn_Click(object sender, EventArgs e)
        {
            string query;
            if (BNXetNghiemCbx.Text == "Lần khám gần nhất")
            {
                query = "EXEC BN4_RetOfMostRecentTest '" + IdKeeper.ID.Get() + "'";
                BNXetNghiemList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

                BNXetNghiemList.Columns[0].HeaderText = "Mã khám bệnh";
                BNXetNghiemList.Columns[1].HeaderText = "Tên xét nghiệm";
                BNXetNghiemList.Columns[2].HeaderText = "Tên chỉ số";
                BNXetNghiemList.Columns[3].HeaderText = "Giá trị";
                BNXetNghiemList.Columns[4].HeaderText = "Ngưỡng bình thường";
                BNXetNghiemList.Columns[5].HeaderText = "Ghi chú";

                BNXetNghiemList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;


            }
            else if (BNXetNghiemCbx.Text == "Tất cả")
            {
                query = "EXEC BN5_AllTest '" + IdKeeper.ID.Get() + "'";
                BNXetNghiemList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

                BNXetNghiemList.Columns[0].HeaderText = "Mã khám bệnh";
                BNXetNghiemList.Columns[1].HeaderText = "Tên xét nghiệm";
                BNXetNghiemList.Columns[2].HeaderText = "Chẩn đoán";

                BNXetNghiemList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

            }
            else if (BNXetNghiemCbx.Text == "Bất thường")
            {
                query = "EXEC BN6_TestHasUnusualRet '" + IdKeeper.ID.Get() + "'";

                BNXetNghiemList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

                BNXetNghiemList.Columns[0].HeaderText = "Mã khám bệnh";
                BNXetNghiemList.Columns[1].HeaderText = "Tên xét nghiệm";

                BNXetNghiemList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
                BNXetNghiemList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            }
            else
            {
                return;
            }
        }

        private void BNThuocBtn_Click(object sender, EventArgs e)
        {
            string typ;
            if (BNThuocCbx.Text == "Tất cả")
            {
                typ = "1";
            }
            else if (BNThuocCbx.Text == "Lần khám gần nhất")
            {
                typ = "0";
            }
            else
            {
                return;
            }

            string query = "EXEC BN2_3_ListMedicine " + "'" + IdKeeper.ID.Get() + "'," + typ;
            BNThuocList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

            BNThuocList.Columns[0].HeaderText = "Mã khám bệnh";
            BNThuocList.Columns[1].HeaderText = "Tên thuốc";
            BNThuocList.Columns[2].HeaderText = "Nhà cung cấp";

            BNThuocList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            BNThuocList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            BNThuocList.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void BNDinhDuongBtn_Click(object sender, EventArgs e)
        {
            string typ;
            if (BNDinhDuongCbx.Text == "Tất cả")
            {
                typ = "1";
            }
            else if (BNDinhDuongCbx.Text == "Lần khám gần nhất")
            {
                typ = "0";
            }
            else
            {
                return;
            }
            string query = "EXEC BN9_10_Nutrition '" + IdKeeper.ID.Get() + "', " + typ;
            BNDinhDuongList.DataSource = ADO.DataProvider.Instance.executeQuery(query);

            BNDinhDuongList.Columns[0].HeaderText = "Mã khám bệnh";
            BNDinhDuongList.Columns[1].HeaderText = "Chế độ dinh dưỡng";

            BNDinhDuongList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            BNDinhDuongList.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void panel7_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
