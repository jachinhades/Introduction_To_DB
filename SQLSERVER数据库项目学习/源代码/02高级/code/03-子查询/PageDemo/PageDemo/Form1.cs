using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace PageDemo
{
    public partial class Form1 : Form
    {
        int PageSize = 5;
        int PageIndex = 1;
        int PageCount = 0;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            BindData();
        }

        #region 绑定数据
        private void BindData()
        {
            string sqlCount = "select COUNT(*) from Student";
            int rowCount = (int)DBHelper.ExecScalar(sqlCount);
            PageCount = rowCount % PageSize == 0 ? rowCount / PageSize : rowCount / PageSize+1;
            this.lblPageCount.Text = "页/总共" + PageCount + "页";
            this.txtNowPage.Text = PageIndex.ToString();

            string sql = string.Format("select * from (select ROW_NUMBER() over(order by StuId) RowId,* from Student) Temp where RowId between {0} and {1}",
                (PageIndex - 1) * PageSize + 1,
                PageIndex * PageSize);
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.DataSource = DBHelper.ExecQuery(sql);

            SetButtonEnable(); //控制按钮是否可用
        }
        #endregion

        #region 第一页
        private void btFirst_Click(object sender, EventArgs e)
        {
            PageIndex = 1;
            BindData();
        }
        #endregion

        #region 上一页
        private void btPrev_Click(object sender, EventArgs e)
        {
            PageIndex--;
            BindData();
        }
        #endregion

        #region 下一页
        private void btNext_Click(object sender, EventArgs e)
        {
            PageIndex++;
            BindData();
        }
        #endregion

        #region 末页
        private void btLast_Click(object sender, EventArgs e)
        {
            PageIndex = PageCount;
            BindData();
        }
        #endregion

        #region 跳转指定页
        private void btOk_Click(object sender, EventArgs e)
        {
            int rPageIndex;
            //判断非数字
            if (int.TryParse(this.txtNowPage.Text, out rPageIndex) == false)
                PageIndex = 1;
            else if (rPageIndex < 1)//页码小于1
                PageIndex = 1;
            else if(rPageIndex > PageCount)
                PageIndex = PageCount;
            else
                PageIndex = int.Parse(this.txtNowPage.Text);
            BindData();
        }
        #endregion

        #region 控制按钮是否可用
        private void SetButtonEnable()
        {
            this.btPrev.Enabled = true;
            this.btNext.Enabled = true;
            if (PageIndex == 1)
                this.btPrev.Enabled = false;
            if (PageIndex == PageCount)
                this.btNext.Enabled = false;
        }
        #endregion
    }
}
