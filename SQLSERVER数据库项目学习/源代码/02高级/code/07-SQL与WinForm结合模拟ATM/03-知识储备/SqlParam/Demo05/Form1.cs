using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Demo05
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = "proc_MemberInsert";
                DBHelper.PrepareCmdProc(sql);
                DBHelper.SetCmdParameter("MemberAccount", this.txtAccount.Text);
                DBHelper.SetCmdParameter("MemberPwd", this.txtPwd.Text);
                DBHelper.SetCmdParameter("MemberNickname", this.txtNickName.Text);
                DBHelper.SetCmdParameter("MemberPhone", this.txtPhone.Text);
                DBHelper.SetCmdReturnParameter("returnValue");
                DBHelper.ExecCmd();
                int result = (int)DBHelper.GetCmdParameter("returnValue");
                if(result == 1)
                    MessageBox.Show("添加成功!");
            }
            catch(Exception ex)
            {
                int result = (int)DBHelper.GetCmdParameter("returnValue");
                if (result == -1)
                    MessageBox.Show("违反长度约束");
                else if(result == -2)
                    MessageBox.Show("违反唯一约束");
                else
                    MessageBox.Show("系统爆炸了!");
            }
        }
        
    
    
    }
}
