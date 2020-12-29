using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.Data.SqlClient;

namespace Hospital.ADO
{
    public class DataProvider
    {
        private static DataProvider instance;

        public static DataProvider Instance 
        {
            get { if (instance == null) instance = new DataProvider(); return DataProvider.instance; }
            private set { DataProvider.instance = value; }
        }

        //private string connLink = "Data Source=DESKTOP-A606SMA;Initial Catalog=HospitalDB;Integrated Security=True";
        private string connLink = "Data Source=DESKTOP-T2NQUMF;Initial Catalog=HospitalDB1;Integrated Security=True";
        public DataTable executeQuery(string query)
        {
            SqlConnection conn = new SqlConnection(connLink);
            conn.Open();
            SqlCommand comm = new SqlCommand(query, conn);
            SqlDataAdapter adt = new SqlDataAdapter(comm);
            DataTable data = new DataTable();
            adt.Fill(data);
            conn.Close();
            return data;
        }
        public string executeScalar(string query)
        {
            SqlConnection conn = new SqlConnection(connLink);
            conn.Open();
            SqlCommand comm = new SqlCommand(query, conn);
            string data = comm.ExecuteScalar().ToString();
            conn.Close();
            return data;
        }
    }
}
