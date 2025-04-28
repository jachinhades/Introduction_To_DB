using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace ATM
{
    public partial class FrmCreateCard : Form
    {
        public FrmCreateCard()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DBHelper.PrepareProc("proc_CreateCard");
            DBHelper.SetParameter("code", this.txtCode.Text);
            DBHelper.SetParameter("phone", this.txtPhone.Text);
            DBHelper.SetParameter("realname", this.txtRealName.Text);
            DBHelper.SetParameter("pwd", this.txtPwd.Text);
            DBHelper.SetOutParameter("cardno", SqlDbType.VarChar, 18);
            DBHelper.ExecNonQuery();
            string strCardNo = DBHelper.GetParameter("cardno").ToString();
            MessageBox.Show("开卡成功,您的卡号为:" + strCardNo);
            this.Close();
        }
    }
}
