using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Demo02
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
            string sql = "insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone) values(@MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone)";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.Add(new SqlParameter("@MemberAccount", this.txtAccount.Text));

            cmd.Parameters.Add(new SqlParameter("@MemberPwd", this.txtPwd.Text));
            cmd.Parameters.Add(new SqlParameter("@MemberNickname", this.txtNickName.Text));
            cmd.Parameters.Add(new SqlParameter("@MemberPhone", this.txtPhone.Text));
            cmd.ExecuteNonQuery();
            MessageBox.Show("添加成功！");
        }
    }
}
