using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Data.SqlClient;

namespace Hospital
{
    public partial class quanly : Form
    {
        public quanly()
        {
            InitializeComponent();
            LoadQuanlyPage();
        }

        void LoadQuanlyPage()
        {
            string query = "SELECT TenKhoa FROM dbo.Khoa";
            DataTable data = ADO.DataProvider.Instance.executeQuery(query);
            foreach (DataRow item in data.Rows)
            {
                khoaCbx.Items.Add(item["TenKhoa"]);
                khoaCbx2.Items.Add(item["TenKhoa"]);
                khoaCbx3.Items.Add(item["TenKhoa"]);
            }

            query = "SELECT DISTINCT Convert(varchar(10),ThoiGianKham,103) AS Ngay FROM CuocKham";
            data = ADO.DataProvider.Instance.executeQuery(query);
            foreach (DataRow item in data.Rows)
            {
                ngayCbx2.Items.Add(item["Ngay"]);
                ngayCbx3.Items.Add(item["Ngay"]);
            }
        }

        private void findBtn_Click(object sender, EventArgs e)
        {
            string khoa,ngay,ca;
            if (khoaCbx.Text == "Tất cả") khoa = "''";
            else khoa = "'" + khoaCbx.Text + "'";
            if (ngayCbx.Text == "Tất cả") ngay = "0";
            else switch (ngayCbx.Text)
                {
                    case "Thứ 2": 
                        ngay = "2";
                        break;
                    case "Thứ 3":
                        ngay = "3";
                        break;
                    case "Thứ 4":
                        ngay = "4";
                        break;
                    case "Thứ 5":
                        ngay = "5";
                        break;
                    case "Thứ 6":
                        ngay = "6";
                        break;
                    case "Thứ 7":
                        ngay = "7";
                        break;
                    default:
                        ngay = "8";
                        break;   
                }
            if (catrucCbx.Text == "Tất cả") ca = "0";
            else ca = catrucCbx.Text;
            string query = "EXEC DoctorSearch " + khoa + "," + ngay + "," + ca;
            BacsiList.DataSource = ADO.DataProvider.Instance.executeQuery(query);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string loai, khoa, ngay, ca;
            if (loaidtCbx.Text == "Cả 2") loai = "''";
            else if (loaidtCbx.Text == "Ngoại trú") loai = "'out'";
            else loai = "'in'";
            if (khoaCbx2.Text == "Tất cả") khoa = "''";
            else khoa = "'" + khoaCbx2.Text + "'";
            if (ngayCbx2.Text == "Tất cả") ngay = "''";
            else ngay = "'" + ngayCbx2.Text + "'";
            if (catrucCbx2.Text == "Tất cả") ca = "0";
            else ca = catrucCbx2.Text;
            string query = "EXEC PatientCount " + loai + "," + khoa + "," + ngay + "," + ca;
            sobnBox.Text = ADO.DataProvider.Instance.executeScalar(query);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string khoa, ngay, ca;
            if (khoaCbx3.Text == "Tất cả") khoa = "''";
            else khoa = "'" + khoaCbx3.Text + "'";
            if (ngayCbx3.Text == "Tất cả") ngay = "''";
            else ngay = "'" + ngayCbx3.Text + "'";
            if (catrucCbx3.Text == "Tất cả") ca = "0";
            else ca = catrucCbx3.Text;
            string query = "EXEC TestCount " + khoa + "," + ngay + "," + ca;
            soxnBox.Text = ADO.DataProvider.Instance.executeScalar(query);
        }
    }
}
