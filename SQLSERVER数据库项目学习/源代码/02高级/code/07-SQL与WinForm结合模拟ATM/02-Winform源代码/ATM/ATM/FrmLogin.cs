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
    public partial class FrmLogin : Form
    {
        public FrmLogin()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button bt = sender as Button;
            this.txtPwd.Text += bt.Text;
        }

        private void btDelete_Click(object sender, EventArgs e)
        {
            if (this.txtPwd.Text.Length == 0)
                return;
            this.txtPwd.Text = this.txtPwd.Text.Substring(0, this.txtPwd.Text.Length - 1);
        }

        private void btCreateCard_Click(object sender, EventArgs e)
        {
            FrmCreateCard frm = new FrmCreateCard();
            frm.Show();

        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            //string sql = string.Format("select * from BankCard where CardNo = '{0}' and CardPwd = '{1}'"
            //    ,this.txtCardNo.Text,this.txtPwd.Text);
            //DBHelper.PrepareSql(sql);
            //DataTable dt = new DataTable();
            //dt = DBHelper.ExecQuery();
            string sql = "select * from BankCard where CardNo = @CardNo and CardPwd = @CardPwd";
            DBHelper.PrepareSql(sql);
            DBHelper.SetParameter("CardNo", this.txtCardNo.Text);
            DBHelper.SetParameter("CardPwd", this.txtPwd.Text);
            DataTable dt = new DataTable();
            dt = DBHelper.ExecQuery();
            if (dt.Rows.Count == 1)
            {
                FrmATM frm = new FrmATM();
                frm.Owner = this;
                frm.CardNo = this.txtCardNo.Text;
                frm.Show();
                this.Hide();
                this.txtCardNo.Text = "";
                this.txtPwd.Text = "";
            }
            else
            {
                MessageBox.Show("用户名或密码错误!");
                return;
            }
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            this.txtCardNo.Text = "";
            this.txtPwd.Text = "";
        }

    }
}
