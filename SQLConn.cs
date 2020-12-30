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
    public partial class SQLConn : Form
    {
        public SQLConn()
        {
            InitializeComponent();
            lbErrorLogin.Hide();
        }

        private void connBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string role;
                switch (roleCbx.Text) {
                    case "Quản lý bệnh viện":
                        role = "mng";
                        break;
                    case "Bác sĩ":
                        role = "doc";
                        break;
                    case "Bệnh nhân":
                        role = "pat";
                        break;
                    default:
                        return;
                }
                string query = "EXEC VerifyLogin '" + usnBox.Text + "','" + pwBox.Text + "','" + role + "'";
                string login = ADO.DataProvider.Instance.executeScalar(query);
                if (login == "Failed!!!")
                {
                    lbErrorLogin.Show();
                    return;
                }
                IdKeeper.ID.Set(login);
                if (role == "mng") {
                    quanly qly = new quanly();
                    this.Hide();
                    qly.ShowDialog();
                    lbErrorLogin.Hide();
                    this.Show();
                }
                else if (role == "pat")
                {
                    benhnhan bn = new benhnhan();
                    this.Hide();
                    bn.ShowDialog();
                    lbErrorLogin.Hide();
                    this.Show();
                }
                else
                {
                    bacsi bs = new bacsi();
                    this.Hide();
                    bs.ShowDialog();
                    lbErrorLogin.Hide();
                    this.Show();
                }
                IdKeeper.ID.Delete();
            }
            catch (Exception E)
            {
                Console.WriteLine("Error: " + E.Message);
            }
            Console.Read();
        }
    }
}
