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
    public partial class UpdatePatientInfo : Form
    {
        public UpdatePatientInfo()
        {
            InitializeComponent();
            lbUpdateError.Hide();

        }

        private void changeBtn_Click(object sender, EventArgs e)
        {
            Console.WriteLine(3);
            string bhyt, gioitinh, chieucao, cannang;
            bhyt = bhytBox.Text;
            if (bhyt.Length != 15 && bhyt.Length != 0)
            {
                lbUpdateError.Text = "Mã BHYT 15 ký tự!";
                lbUpdateError.Show();
                return;
            }
            chieucao = heightBox.Text;
            if (chieucao == "") chieucao = "0";
            cannang = weightBox.Text;
            if (cannang == "") cannang = "0";
            if (sexCbx.Text == "Nam") gioitinh = "M";
            else gioitinh = "F";
            string query = "EXEC BN1_UpdatePatientInfo '" + IdKeeper.ID.Get() + "','" + bhyt + "','" + gioitinh + "'," + chieucao + ", " + cannang;
            Console.WriteLine("GO");
            try
            {
                ADO.DataProvider.Instance.executeQuery(query);
                //LoadBenhnhanPage();
                this.Close();
            }
            catch (Exception existBHYT)
            {
                lbUpdateError.Text = "Mã BHYT đã tồn tại!";
                lbUpdateError.Show();
            }
            
        }

        private void cancelBtn_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void heightBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

        private void weightBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }
        }

    }
}
