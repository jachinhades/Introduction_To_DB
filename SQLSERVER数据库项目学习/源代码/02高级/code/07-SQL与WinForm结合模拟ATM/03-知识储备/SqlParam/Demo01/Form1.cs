using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Demo01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            string connStr = "Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=DB1702;Data Source=.";
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            string sql = string.Format("insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone) values('{0}','{1}','{2}','{3}')",
                this.txtAccount.Text.Replace("'","''"),
                this.txtPwd.Text.Replace("'", "''"),
                this.txtNickName.Text.Replace("'", "''"),
                this.txtPhone.Text.Replace("'", "''"));

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            MessageBox.Show("添加成功！");
        }

    }
}
