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
    public partial class bacsi : Form
    {
        public bacsi()
        {
            InitializeComponent();
            lbUpdateError.Hide();
            LoadBacsiPage();
        }
        void LoadBacsiPage()
        {
            string query = "SELECT * FROM NhanVien WHERE MaNV = '" + IdKeeper.ID.Get() + "'";
            DataTable info = ADO.DataProvider.Instance.executeQuery(query);
            string ho, ten;
            ho = info.Rows[0]["Ho"].ToString();
            ten = info.Rows[0]["Ten"].ToString();
            bacsiLbl.Text = "Bác sĩ " + ho + " " + ten;

            query = "SELECT DISTINCT TenXN FROM XetNghiem";
            DataTable data = ADO.DataProvider.Instance.executeQuery(query);
            foreach (DataRow item in data.Rows)
            {
                benhCbx.Items.Add(item["TenXN"]);
            }
            query = "SELECT DISTINCT KetQua FROM CoChupPhim";
            data = ADO.DataProvider.Instance.executeQuery(query);
            foreach (DataRow item in data.Rows)
            {
                benhCbx.Items.Add(item["KetQua"]);
            }
            query = "SELECT DISTINCT Convert(varchar(10),ThoiGianKham,103) AS Ngay FROM CuocKham";
            data = ADO.DataProvider.Instance.executeQuery(query);
            foreach (DataRow item in data.Rows)
            {
                ngayCbx.Items.Add(item["Ngay"]);
            }

            tbxNgayThamKham.Text = "Ngày (DD/MM/YYYY)";
            tbxNgayThamKham.ForeColor = SystemColors.GrayText;

            tbxGioThamKham.Text = "Giờ (HH:MM:SSSS)";
            tbxGioThamKham.ForeColor = SystemColors.GrayText;
        }

        private void tbnCapNhat_Click(object sender, EventArgs e)
        {

            if (typeTabCtrl.SelectedTab == ngtruPage)
            {
                if(tbxThGianTaiKham.Text == "")
                {
                    lbUpdateError.Show();
                    return;
                }
                string query = "EXEC PROC_1" + "'" + IdKeeper.ID.Get() + "'" + ',' + "'" + tbxMaBN.Text + "'" + ',' + "'" + tbxThGianTaiKham.Text + "'";
                try
                {   
                    ADO.DataProvider.Instance.executeQuery(query);
                }
                catch
                {
                    lbUpdateError.Show();
                    return;
                }
                MessageBox.Show("Cập nhật thành công.");
                lbUpdateError.Hide();
            }
            else
            {
                if(tbxMaBN.Text == "" || tbxNgayThamKham.Text == "" || tbxGioThamKham.Text == "" ||
                    tbxSoBuong.Text == "" || tbxSoGiuong.Text == "" || tbxTinhTrangNhapVien.Text == "")
                {
                    lbUpdateError.Show();
                    return;
                }
                string ngay, gio;
                ngay = tbxNgayThamKham.Text;
                gio = tbxGioThamKham.Text;
                string d, m, y;
                try {
                    d = ngay.Split('/')[0];
                    m = ngay.Split('/')[1];
                    y = ngay.Split('/')[2];
                }
                catch(Exception updateFailed)
                {
                    lbUpdateError.Show();
                    return;
                }
                string thoiGianThamKham = y + "-" + m + "-" + d + " " + gio;
                string query = "EXEC PROC_2" + "'" + IdKeeper.ID.Get() + "'" +
                                ',' + "'" + tbxMaBN.Text + "'" +
                                ',' + "'" + thoiGianThamKham + "'" +
                                ',' + "'" + tbxSoBuong.Text + "'" +
                                ',' + "'" + tbxSoGiuong.Text + "'" +
                                ',' + "'" + tbxTinhTrangNhapVien.Text + "'";
                try
                {
                    ADO.DataProvider.Instance.executeQuery(query);
                }
                catch(Exception updateFailed)
                {
                    lbUpdateError.Show();
                    return;
                }
                MessageBox.Show("Cập nhật thành công.");
                lbUpdateError.Hide();
            }
        }

        private void chandoanBtn_Click(object sender, EventArgs e)
        {
            if (tbxMaBN.Text.Length != 9) return;
            string query = "EXEC PROC_4" + "'" + IdKeeper.ID.Get() + "'" + ',' + "'" + tbxMaBN.Text + "'";
            bninfoList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
        }

        private void thuocBtn_Click(object sender, EventArgs e)
        {
            if (tbxMaBN.Text.Length != 9) return;
            string query = "EXEC PROC_5" + "'" + IdKeeper.ID.Get() + "'" + ',' + "'" + tbxMaBN.Text + "'";
            bninfoList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
            bninfoList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
        }

        private void xetnghiemBtn_Click(object sender, EventArgs e)
        {
            if (tbxMaBN.Text.Length != 9) return;
            string query = "EXEC PROC_6" + '\'' + IdKeeper.ID.Get() + '\'' + ',' + '\'' + tbxMaBN.Text + '\'';
            bninfoList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
            bninfoList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
        }

        private void chupphimBtn_Click(object sender, EventArgs e)
        {
            if (tbxMaBN.Text.Length != 9) return;
            string query = "EXEC PROC_7" + '\'' + IdKeeper.ID.Get() + '\'' + ',' + '\'' + tbxMaBN.Text + '\'';
            bninfoList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
            bninfoList.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
        }

        private void hienthiBtn_Click(object sender, EventArgs e)
        {
            if (bnlistTabCtrl.SelectedTab == benhPage)
            {
                if (benhCbx.Text == "") return;
                if (!abnormalBox.Checked)
                {
                    string query = "EXEC PROC_8" + "'" + IdKeeper.ID.Get() + "'" + ',' + "'" + benhCbx.Text + "'";
                    benhnhanList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
                }
                else
                {
                    string query = "EXEC PROC_9" + "'" + IdKeeper.ID.Get() + "'" + ',' + "'" + benhCbx.Text + "'";
                    benhnhanList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
                }
            }
            else if(bnlistTabCtrl.SelectedTab == ngayPage)
            {
                if (ngayCbx.Text == "") return;
                string query = "EXEC PROC_3" + "'" + ngayCbx.Text + "'" + ',' + "'" + IdKeeper.ID.Get() + "'";
                benhnhanList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
            }
            else
            {
                string query = "EXEC PROC_10" + "'" + IdKeeper.ID.Get() + "'";
                benhnhanList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
            }
        }

        private void tbxNgayThamKham_Leave(object sender, EventArgs e)
        {
            if(tbxNgayThamKham.Text == "")
            {
                tbxNgayThamKham.Text = "Ngày (DD/MM/YYYY)";
                tbxNgayThamKham.ForeColor = SystemColors.GrayText;
            }
        }

        private void tbxNgayThamKham_Enter(object sender, EventArgs e)
        {
            if (tbxNgayThamKham.Text == "Ngày (DD/MM/YYYY)")
            {
                tbxNgayThamKham.Text = "";
                tbxNgayThamKham.ForeColor = SystemColors.GrayText;
            }
        }

        private void tbxGioThamKham_Leave(object sender, EventArgs e)
        {
            if (tbxGioThamKham.Text == "")
            {
                tbxGioThamKham.Text = "Giờ (HH:MM:SSSS)";
                tbxGioThamKham.ForeColor = SystemColors.GrayText;
            }
        }

        private void tbxGioThamKham_Enter(object sender, EventArgs e)
        {
            if (tbxGioThamKham.Text == "Giờ (HH:MM:SSSS)")
            {
                tbxGioThamKham.Text = "";
                tbxGioThamKham.ForeColor = SystemColors.GrayText;
            }
        }
    }
}