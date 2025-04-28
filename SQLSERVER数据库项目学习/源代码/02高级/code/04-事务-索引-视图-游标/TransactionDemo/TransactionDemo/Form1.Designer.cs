namespace TransactionDemo
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
            this.label1 = new System.Windows.Forms.Label();
            this.txtMyCardNo = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtYourCardNo = new System.Windows.Forms.TextBox();
            this.btTransfer = new System.Windows.Forms.Button();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMoney = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "我的卡号:";
            // 
            // txtMyCardNo
            // 
            this.txtMyCardNo.Location = new System.Drawing.Point(78, 10);
            this.txtMyCardNo.Name = "txtMyCardNo";
            this.txtMyCardNo.Size = new System.Drawing.Size(468, 21);
            this.txtMyCardNo.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 53);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 12);
            this.label2.TabIndex = 0;
            this.label2.Text = "对方卡号:";
            // 
            // txtYourCardNo
            // 
            this.txtYourCardNo.Location = new System.Drawing.Point(77, 50);
            this.txtYourCardNo.Name = "txtYourCardNo";
            this.txtYourCardNo.Size = new System.Drawing.Size(468, 21);
            this.txtYourCardNo.TabIndex = 1;
            // 
            // btTransfer
            // 
            this.btTransfer.Location = new System.Drawing.Point(77, 127);
            this.btTransfer.Name = "btTransfer";
            this.btTransfer.Size = new System.Drawing.Size(75, 23);
            this.btTransfer.TabIndex = 2;
            this.btTransfer.Text = "转  账";
            this.btTransfer.UseVisualStyleBackColor = true;
            this.btTransfer.Click += new System.EventHandler(this.btTransfer_Click);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(59, 12);
            this.label3.TabIndex = 0;
            this.label3.Text = "转账金额:";
            // 
            // txtMoney
            // 
            this.txtMoney.Location = new System.Drawing.Point(77, 89);
            this.txtMoney.Name = "txtMoney";
            this.txtMoney.Size = new System.Drawing.Size(468, 21);
            this.txtMoney.TabIndex = 1;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(569, 163);
            this.Controls.Add(this.btTransfer);
            this.Controls.Add(this.txtMoney);
            this.Controls.Add(this.txtYourCardNo);
            this.Controls.Add(this.txtMyCardNo);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "转账";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMyCardNo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtYourCardNo;
        private System.Windows.Forms.Button btTransfer;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtMoney;
    }
}

