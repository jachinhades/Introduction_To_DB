using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace TransactionDemo
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        #region 转账代码
        private void btTransfer_Click(object sender, EventArgs e)
        {
            //此功能演示需要给银行卡余额字段添加check约束设置余额必须>=0
            //方案一（直接写事务代码）：
            //DBHelper.OpenConn();  //打开数据库联接
            //SqlTransaction sqlTransaction = DBHelper.conn.BeginTransaction(); //定义一个事务开始
            //SqlCommand cmd = new SqlCommand();  //定义一个Command对象用于执行sql语句
            //cmd.Connection = DBHelper.conn;  //设置Command对象的联接
            //cmd.Transaction = sqlTransaction; //设置command对象的事务对象
            //try
            //{
            //    string sql1 = string.Format("update BankCard set CardMoney = CardMoney -{0} where CardNo = '{1}'", this.txtMoney.Text, this.txtMyCardNo.Text);
            //    cmd.CommandText = sql1;
            //    cmd.ExecuteNonQuery();

            //    string sql2 = string.Format("update BankCard set CardMoney = CardMoney+{0} where CardNo = '{1}'", this.txtMoney.Text, this.txtYourCardNo.Text);
            //    cmd.CommandText = sql2;
            //    cmd.ExecuteNonQuery();

            //    string sql3 = string.Format("insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime) values('{0}','{1}',{2},GETDATE())",
            //        this.txtMyCardNo.Text, this.txtYourCardNo.Text, this.txtMoney.Text);
            //    cmd.CommandText = sql3;
            //    cmd.ExecuteNonQuery();

            //    sqlTransaction.Commit();  //提交事务
            //    MessageBox.Show("转账成功!");
            //}
            //catch (Exception ex)
            //{
            //    sqlTransaction.Rollback(); //回滚事务
            //    MessageBox.Show("余额不足");
            //}

            //方案二：调用封装好的方法
            List<string> listSql = new List<string>();
            string sql = "";
            sql = string.Format("update BankCard set CardMoney = CardMoney + {0} where CardNo = '{1}'",
                this.txtMoney.Text, this.txtYourCardNo.Text);
            listSql.Add(sql);
            sql = string.Format("update BankCard set CardMoney = CardMoney - {0} where CardNo = '{1}'",
                this.txtMoney.Text, this.txtMyCardNo.Text);
            listSql.Add(sql);
            sql = string.Format("insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime) values('{0}','{1}',{2},GETDATE())", this.txtMyCardNo.Text, this.txtYourCardNo.Text, this.txtMoney.Text);
            bool result = DBHelper.ExecNonQueryTransaction(listSql);
            if (result == true)
                MessageBox.Show("转账成功!");
            else
                MessageBox.Show("余额不足!");
        }
        #endregion



    }
}
