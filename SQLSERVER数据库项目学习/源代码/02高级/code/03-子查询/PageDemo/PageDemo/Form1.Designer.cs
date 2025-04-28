namespace PageDemo
{
    partial class Form1
    {
        /// <summary>
        /// 必需的设计器变量。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 清理所有正在使用的资源。
        /// </summary>
        /// <param name="disposing">如果应释放托管资源，为 true；否则为 false。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows 窗体设计器生成的代码

        /// <summary>
        /// 设计器支持所需的方法 - 不要
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btFirst = new System.Windows.Forms.Button();
            this.btPrev = new System.Windows.Forms.Button();
            this.btNext = new System.Windows.Forms.Button();
            this.btLast = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNowPage = new System.Windows.Forms.TextBox();
            this.lblPageCount = new System.Windows.Forms.Label();
            this.StuId = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StuName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.StuSex = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.btOk = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.StuId,
            this.StuName,
            this.StuSex});
            this.dataGridView1.Location = new System.Drawing.Point(13, 13);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowTemplate.Height = 23;
            this.dataGridView1.Size = new System.Drawing.Size(579, 216);
            this.dataGridView1.TabIndex = 0;
            // 
            // btFirst
            // 
            this.btFirst.Location = new System.Drawing.Point(101, 246);
            this.btFirst.Name = "btFirst";
            this.btFirst.Size = new System.Drawing.Size(48, 23);
            this.btFirst.TabIndex = 1;
            this.btFirst.Text = "<<";
            this.btFirst.UseVisualStyleBackColor = true;
            this.btFirst.Click += new System.EventHandler(this.btFirst_Click);
            // 
            // btPrev
            // 
            this.btPrev.Location = new System.Drawing.Point(155, 246);
            this.btPrev.Name = "btPrev";
            this.btPrev.Size = new System.Drawing.Size(48, 23);
            this.btPrev.TabIndex = 1;
            this.btPrev.Text = "<";
            this.btPrev.UseVisualStyleBackColor = true;
            this.btPrev.Click += new System.EventHandler(this.btPrev_Click);
            // 
            // btNext
            // 
            this.btNext.Location = new System.Drawing.Point(209, 246);
            this.btNext.Name = "btNext";
            this.btNext.Size = new System.Drawing.Size(48, 23);
            this.btNext.TabIndex = 1;
            this.btNext.Text = ">";
            this.btNext.UseVisualStyleBackColor = true;
            this.btNext.Click += new System.EventHandler(this.btNext_Click);
            // 
            // btLast
            // 
            this.btLast.Location = new System.Drawing.Point(263, 246);
            this.btLast.Name = "btLast";
            this.btLast.Size = new System.Drawing.Size(48, 23);
            this.btLast.TabIndex = 1;
            this.btLast.Text = ">>";
            this.btLast.UseVisualStyleBackColor = true;
            this.btLast.Click += new System.EventHandler(this.btLast_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(333, 256);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(41, 12);
            this.label1.TabIndex = 2;
            this.label1.Text = "当前：";
            // 
            // txtNowPage
            // 
            this.txtNowPage.Location = new System.Drawing.Point(369, 247);
            this.txtNowPage.Name = "txtNowPage";
            this.txtNowPage.Size = new System.Drawing.Size(38, 21);
            this.txtNowPage.TabIndex = 3;
            // 
            // lblPageCount
            // 
            this.lblPageCount.AutoSize = true;
            this.lblPageCount.Location = new System.Drawing.Point(413, 256);
            this.lblPageCount.Name = "lblPageCount";
            this.lblPageCount.Size = new System.Drawing.Size(83, 12);
            this.lblPageCount.TabIndex = 2;
            this.lblPageCount.Text = "页/总共？？页";
            // 
            // StuId
            // 
            this.StuId.DataPropertyName = "StuId";
            this.StuId.HeaderText = "学生编号";
            this.StuId.Name = "StuId";
            // 
            // StuName
            // 
            this.StuName.DataPropertyName = "StuName";
            this.StuName.HeaderText = "学生姓名";
            this.StuName.Name = "StuName";
            // 
            // StuSex
            // 
            this.StuSex.DataPropertyName = "StuSex";
            this.StuSex.HeaderText = "学生性别";
            this.StuSex.Name = "StuSex";
            // 
            // btOk
            // 
            this.btOk.Location = new System.Drawing.Point(500, 249);
            this.btOk.Name = "btOk";
            this.btOk.Size = new System.Drawing.Size(51, 23);
            this.btOk.TabIndex = 4;
            this.btOk.Text = "跳转";
            this.btOk.UseVisualStyleBackColor = true;
            this.btOk.Click += new System.EventHandler(this.btOk_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(604, 292);
            this.Controls.Add(this.btOk);
            this.Controls.Add(this.txtNowPage);
            this.Controls.Add(this.lblPageCount);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btLast);
            this.Controls.Add(this.btNext);
            this.Controls.Add(this.btPrev);
            this.Controls.Add(this.btFirst);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btFirst;
        private System.Windows.Forms.Button btPrev;
        private System.Windows.Forms.Button btNext;
        private System.Windows.Forms.Button btLast;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNowPage;
        private System.Windows.Forms.Label lblPageCount;
        private System.Windows.Forms.DataGridViewTextBoxColumn StuId;
        private System.Windows.Forms.DataGridViewTextBoxColumn StuName;
        private System.Windows.Forms.DataGridViewTextBoxColumn StuSex;
        private System.Windows.Forms.Button btOk;
    }
}

