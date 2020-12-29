using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Hospital
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new SQLConn());
        }
    }

    public class IdKeeper
    {
        public static IdKeeper ID = new IdKeeper();
        private static string id = "";

        public void Set(string a)
        {
            id = a;
        }
        public string Get()
        {
            return id;
        }

        public void Delete()
        {
            id = "";
        }
    }
}
