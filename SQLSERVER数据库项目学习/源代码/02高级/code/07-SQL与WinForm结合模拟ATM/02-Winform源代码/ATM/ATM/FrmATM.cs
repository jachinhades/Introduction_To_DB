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
    public partial class FrmATM : Form
    {
        public FrmATM()
        {
            InitializeComponent();
        }

        public string CardNo { get; set; }  //卡号

        private void FrmATM_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        private void FrmATM_FormClosed(object sender, FormClosedEventArgs e)
        {
            if(e.CloseReason == CloseReason.UserClosing)
                ((FrmLogin)this.Owner).Show();
        }

        private void FrmATM_Load(object sender, EventArgs e)
        {
            HideAllPanel();
            this.Height = 563;
        }

        #region 隐藏所有的panel
        private void HideAllPanel()
        {
            this.pnCunQian.Visible = false;
            this.pnCxye.Visible = false;
            this.pnExchange.Visible = false;
            this.pnQuqian.Visible = false;
            this.pnTransfer.Visible = false;
            this.pnZhuanZhang.Visible = false;
        }
        #endregion

        #region 查询余额的菜单按钮
        private void btCxye_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            this.pnCxye.Visible = true;
            this.pnCxye.Location = new Point(140, 143);

            string sql = "select Convert(varchar(20),CardMoney,1) from BankCard where CardNo = @CardNo";
            DBHelper.PrepareSql(sql);

            DBHelper.SetParameter("CardNo", this.CardNo);
            //double cardMoney =  double.Parse(DBHelper.ExecScalar().ToString());

            this.lblYue.Text = "您的余额为：¥" + DBHelper.ExecScalar().ToString();
            //DataTable dt = new DataTable();
            //dt = DBHelper.ExecQuery();
            //this.lblYue.Text = "您的余额为：" + dt.Rows[0]["CardMoney"].ToString();

        }
        #endregion

        #region 存钱菜单
        private void btCunQian_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            this.pnCunQian.Visible = true;
            this.pnCunQian.Location = new Point(140, 143);
        }
        #endregion

        #region 取钱菜单
        private void btQuqian_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            this.pnQuqian.Visible = true;
            this.pnQuqian.Location = new Point(140, 143);
        }
        #endregion

        #region 退卡菜单
        private void btExit_Click(object sender, EventArgs e)
        {
            ((FrmLogin)this.Owner).Show();
            this.Close();

        }
        #endregion

        #region  转账菜单
        private void btTransfer_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            this.pnZhuanZhang.Visible = true;
            this.pnZhuanZhang.Location = new Point(140, 143);
        }
        #endregion

        #region 存取钱记录菜单
        private void btExchangeRecord_Click(object sender, EventArgs e)
        {
            HideAllPanel();
            this.pnExchange.Visible = true;
            this.pnExchange.Location = new Point(140, 143);
        }
        #endregion

        #region 转账记录菜单
        private void btTransferRecord_Click(object sender, EventArgs e)
        {
            string sql = "select CardOut.RealName 转出人,CardNoOut 转出卡号,CardIn.RealName 转入人,CardNoIn 转入卡号,TransferMoney 转账金额,TransferTime 交易时间 from CardTransfer inner join (select CardNo,RealName from BankCard inner join AccountInfo on AccountInfo.AccountId = BankCard.AccountId) CardOut on CardTransfer.CardNoOut = CardOut.CardNo inner join(select CardNo,RealName from BankCard inner join AccountInfo on AccountInfo.AccountId = BankCard.AccountId) CardIn on CardTransfer.CardNoIn = CardIn.CardNo where CardNoOut = @CardNo or CardNoIn = @CardNo";
            DBHelper.PrepareSql(sql);
            DBHelper.SetParameter("CardNo", this.CardNo);
    
            this.dgvTransfer.DataSource = DBHelper.ExecQuery();

            HideAllPanel();
            this.pnTransfer.Visible = true;
            this.pnTransfer.Location = new Point(140, 143);
        }
        #endregion

        #region 存钱操作
        private void btInMoney_Click(object sender, EventArgs e)
        {
            try
            {
                DBHelper.PrepareProc("proc_InMoney");
                DBHelper.SetParameter("CardNo", this.CardNo);
                DBHelper.SetParameter("CardMoney", this.txtInMoney.Text);
                DBHelper.ExecNonQuery();
                MessageBox.Show("存钱成功!");
            }
            catch
            {
                MessageBox.Show("存钱失败!");
            }
            finally
            {
                this.txtInMoney.Text = "";
            }
        }
        #endregion

        #region 取钱操作
        private void btOutMoney_Click(object sender, EventArgs e)
        {
            try
            {
                DBHelper.PrepareProc("proc_OutMoney");
                DBHelper.SetParameter("CardNo", this.CardNo);
                DBHelper.SetParameter("CardMoney", this.txtOutMoney.Text);
                DBHelper.ExecNonQuery();
                MessageBox.Show("取钱成功!");
            }
            catch
            {
                MessageBox.Show("取钱失败!");
            }
            finally
            {
                this.txtOutMoney.Text = "";
            }
        }
        #endregion

        #region 转账操作
        private void btTransferOk_Click(object sender, EventArgs e)
        {
            //转账前需要先判断对方账号是否正确，此步骤省略

            try
            {
                DBHelper.PrepareProc("proc_Transfer");
                DBHelper.SetParameter("CardOut", this.CardNo);
                DBHelper.SetParameter("CardIn", this.txtInCardNo.Text);
                DBHelper.SetParameter("CardMoney", this.txtTransferInMoney.Text);
                DBHelper.ExecNonQuery();
                MessageBox.Show("转账成功!");
            }
            catch
            {
                MessageBox.Show("转账失败!");
            }
            finally
            {
                this.txtInCardNo.Text = "";
                this.txtTransferInMoney.Text = "";
            }
        }
        #endregion





    }
}
