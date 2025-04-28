using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Demo03
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            string sql = "insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone) values(@MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone)";
            DBHelper.PrepareCmd(sql);
            DBHelper.SetCmdParameter("MemberAccount", this.txtAccount.Text);
            DBHelper.SetCmdParameter("MemberPwd", this.txtPwd.Text);
            DBHelper.SetCmdParameter("MemberNickname", this.txtNickName.Text);
            DBHelper.SetCmdParameter("MemberPhone", this.txtPhone.Text);
            DBHelper.ExecCmd();
            MessageBox.Show("添加成功!");

        }
    }
}
