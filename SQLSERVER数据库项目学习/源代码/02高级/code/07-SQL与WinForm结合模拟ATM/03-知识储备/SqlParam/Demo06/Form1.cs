using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Demo06
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btSearch_Click(object sender, EventArgs e)
        {
            string sql = "proc_GetPhoneByAccount";
            DBHelper.PrepareCmdProc(sql);
            DBHelper.SetCmdParameter("MemberAccount", this.txtAccount.Text);
            DBHelper.SetCmdOutParameter("MemberPhone", SqlDbType.VarChar, 20);
            DBHelper.ExecCmd();
            this.txtPhone.Text = DBHelper.GetCmdParameter("MemberPhone").ToString();
        }
    }
}
