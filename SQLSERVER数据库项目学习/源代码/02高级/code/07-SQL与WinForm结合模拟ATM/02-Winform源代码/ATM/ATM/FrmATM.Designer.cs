namespace ATM
{
    partial class FrmATM
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btCxye = new System.Windows.Forms.Button();
            this.btCunQian = new System.Windows.Forms.Button();
            this.btQuqian = new System.Windows.Forms.Button();
            this.btTransfer = new System.Windows.Forms.Button();
            this.btExchangeRecord = new System.Windows.Forms.Button();
            this.btTransferRecord = new System.Windows.Forms.Button();
            this.btExit = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.pnCxye = new System.Windows.Forms.Panel();
            this.lblYue = new System.Windows.Forms.Label();
            this.pnCunQian = new System.Windows.Forms.Panel();
            this.btInMoney = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.txtInMoney = new System.Windows.Forms.TextBox();
            this.pnQuqian = new System.Windows.Forms.Panel();
            this.btOutMoney = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txtOutMoney = new System.Windows.Forms.TextBox();
            this.pnZhuanZhang = new System.Windows.Forms.Panel();
            this.btTransferOk = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.txtTransferInMoney = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtInCardNo = new System.Windows.Forms.TextBox();
            this.pnTransfer = new System.Windows.Forms.Panel();
            this.dgvExchange = new System.Windows.Forms.DataGridView();
            this.pnExchange = new System.Windows.Forms.Panel();
            this.dgvTransfer = new System.Windows.Forms.DataGridView();
            this.pnCxye.SuspendLayout();
            this.pnCunQian.SuspendLayout();
            this.pnQuqian.SuspendLayout();
            this.pnZhuanZhang.SuspendLayout();
            this.pnTransfer.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvExchange)).BeginInit();
            this.pnExchange.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransfer)).BeginInit();
            this.SuspendLayout();
            // 
            // btCxye
            // 
            this.btCxye.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btCxye.Location = new System.Drawing.Point(806, 234);
            this.btCxye.Name = "btCxye";
            this.btCxye.Size = new System.Drawing.Size(109, 38);
            this.btCxye.TabIndex = 0;
            this.btCxye.Text = "查 询 余 额";
            this.btCxye.UseVisualStyleBackColor = true;
            this.btCxye.Click += new System.EventHandler(this.btCxye_Click);
            // 
            // btCunQian
            // 
            this.btCunQian.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btCunQian.Location = new System.Drawing.Point(806, 315);
            this.btCunQian.Name = "btCunQian";
            this.btCunQian.Size = new System.Drawing.Size(109, 38);
            this.btCunQian.TabIndex = 0;
            this.btCunQian.Text = "存  钱";
            this.btCunQian.UseVisualStyleBackColor = true;
            this.btCunQian.Click += new System.EventHandler(this.btCunQian_Click);
            // 
            // btQuqian
            // 
            this.btQuqian.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btQuqian.Location = new System.Drawing.Point(806, 396);
            this.btQuqian.Name = "btQuqian";
            this.btQuqian.Size = new System.Drawing.Size(109, 38);
            this.btQuqian.TabIndex = 0;
            this.btQuqian.Text = "取  钱";
            this.btQuqian.UseVisualStyleBackColor = true;
            this.btQuqian.Click += new System.EventHandler(this.btQuqian_Click);
            // 
            // btTransfer
            // 
            this.btTransfer.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btTransfer.Location = new System.Drawing.Point(-1, 234);
            this.btTransfer.Name = "btTransfer";
            this.btTransfer.Size = new System.Drawing.Size(109, 38);
            this.btTransfer.TabIndex = 0;
            this.btTransfer.Text = "转  账";
            this.btTransfer.UseVisualStyleBackColor = true;
            this.btTransfer.Click += new System.EventHandler(this.btTransfer_Click);
            // 
            // btExchangeRecord
            // 
            this.btExchangeRecord.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btExchangeRecord.Location = new System.Drawing.Point(-1, 315);
            this.btExchangeRecord.Name = "btExchangeRecord";
            this.btExchangeRecord.Size = new System.Drawing.Size(109, 38);
            this.btExchangeRecord.TabIndex = 0;
            this.btExchangeRecord.Text = "存 取 钱 记 录";
            this.btExchangeRecord.UseVisualStyleBackColor = true;
            this.btExchangeRecord.Click += new System.EventHandler(this.btExchangeRecord_Click);
            // 
            // btTransferRecord
            // 
            this.btTransferRecord.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btTransferRecord.Location = new System.Drawing.Point(-1, 396);
            this.btTransferRecord.Name = "btTransferRecord";
            this.btTransferRecord.Size = new System.Drawing.Size(109, 38);
            this.btTransferRecord.TabIndex = 0;
            this.btTransferRecord.Text = "转 账 记 录";
            this.btTransferRecord.UseVisualStyleBackColor = true;
            this.btTransferRecord.Click += new System.EventHandler(this.btTransferRecord_Click);
            // 
            // btExit
            // 
            this.btExit.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btExit.Location = new System.Drawing.Point(806, 475);
            this.btExit.Name = "btExit";
            this.btExit.Size = new System.Drawing.Size(109, 38);
            this.btExit.TabIndex = 0;
            this.btExit.Text = "退  卡";
            this.btExit.UseVisualStyleBackColor = true;
            this.btExit.Click += new System.EventHandler(this.btExit_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("微软雅黑", 30F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(230, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(427, 52);
            this.label1.TabIndex = 1;
            this.label1.Text = "欢 迎 来 到 军 军 银 行";
            // 
            // pnCxye
            // 
            this.pnCxye.Controls.Add(this.lblYue);
            this.pnCxye.Location = new System.Drawing.Point(140, 12);
            this.pnCxye.Name = "pnCxye";
            this.pnCxye.Size = new System.Drawing.Size(626, 102);
            this.pnCxye.TabIndex = 2;
            // 
            // lblYue
            // 
            this.lblYue.AutoSize = true;
            this.lblYue.Font = new System.Drawing.Font("微软雅黑", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.lblYue.Location = new System.Drawing.Point(137, 34);
            this.lblYue.Name = "lblYue";
            this.lblYue.Size = new System.Drawing.Size(82, 31);
            this.lblYue.TabIndex = 0;
            this.lblYue.Text = "label2";
            // 
            // pnCunQian
            // 
            this.pnCunQian.Controls.Add(this.btInMoney);
            this.pnCunQian.Controls.Add(this.label4);
            this.pnCunQian.Controls.Add(this.txtInMoney);
            this.pnCunQian.Location = new System.Drawing.Point(140, 120);
            this.pnCunQian.Name = "pnCunQian";
            this.pnCunQian.Size = new System.Drawing.Size(626, 102);
            this.pnCunQian.TabIndex = 3;
            // 
            // btInMoney
            // 
            this.btInMoney.Location = new System.Drawing.Point(168, 61);
            this.btInMoney.Name = "btInMoney";
            this.btInMoney.Size = new System.Drawing.Size(83, 31);
            this.btInMoney.TabIndex = 7;
            this.btInMoney.Text = "确定存钱";
            this.btInMoney.UseVisualStyleBackColor = true;
            this.btInMoney.Click += new System.EventHandler(this.btInMoney_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(99, 24);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(65, 12);
            this.label4.TabIndex = 6;
            this.label4.Text = "存钱金额：";
            // 
            // txtInMoney
            // 
            this.txtInMoney.Font = new System.Drawing.Font("宋体", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtInMoney.Location = new System.Drawing.Point(168, 13);
            this.txtInMoney.Name = "txtInMoney";
            this.txtInMoney.Size = new System.Drawing.Size(225, 32);
            this.txtInMoney.TabIndex = 5;
            // 
            // pnQuqian
            // 
            this.pnQuqian.Controls.Add(this.btOutMoney);
            this.pnQuqian.Controls.Add(this.label2);
            this.pnQuqian.Controls.Add(this.txtOutMoney);
            this.pnQuqian.Location = new System.Drawing.Point(140, 234);
            this.pnQuqian.Name = "pnQuqian";
            this.pnQuqian.Size = new System.Drawing.Size(626, 102);
            this.pnQuqian.TabIndex = 3;
            // 
            // btOutMoney
            // 
            this.btOutMoney.Location = new System.Drawing.Point(166, 63);
            this.btOutMoney.Name = "btOutMoney";
            this.btOutMoney.Size = new System.Drawing.Size(83, 31);
            this.btOutMoney.TabIndex = 7;
            this.btOutMoney.Text = "确定取钱";
            this.btOutMoney.UseVisualStyleBackColor = true;
            this.btOutMoney.Click += new System.EventHandler(this.btOutMoney_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(97, 26);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(65, 12);
            this.label2.TabIndex = 6;
            this.label2.Text = "取钱金额：";
            // 
            // txtOutMoney
            // 
            this.txtOutMoney.Font = new System.Drawing.Font("宋体", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtOutMoney.Location = new System.Drawing.Point(166, 15);
            this.txtOutMoney.Name = "txtOutMoney";
            this.txtOutMoney.Size = new System.Drawing.Size(225, 32);
            this.txtOutMoney.TabIndex = 5;
            // 
            // pnZhuanZhang
            // 
            this.pnZhuanZhang.Controls.Add(this.btTransferOk);
            this.pnZhuanZhang.Controls.Add(this.label5);
            this.pnZhuanZhang.Controls.Add(this.txtTransferInMoney);
            this.pnZhuanZhang.Controls.Add(this.label3);
            this.pnZhuanZhang.Controls.Add(this.txtInCardNo);
            this.pnZhuanZhang.Location = new System.Drawing.Point(140, 356);
            this.pnZhuanZhang.Name = "pnZhuanZhang";
            this.pnZhuanZhang.Size = new System.Drawing.Size(626, 102);
            this.pnZhuanZhang.TabIndex = 3;
            // 
            // btTransferOk
            // 
            this.btTransferOk.Location = new System.Drawing.Point(85, 64);
            this.btTransferOk.Name = "btTransferOk";
            this.btTransferOk.Size = new System.Drawing.Size(83, 31);
            this.btTransferOk.TabIndex = 7;
            this.btTransferOk.Text = "确定转账";
            this.btTransferOk.UseVisualStyleBackColor = true;
            this.btTransferOk.Click += new System.EventHandler(this.btTransferOk_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(316, 27);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(65, 12);
            this.label5.TabIndex = 6;
            this.label5.Text = "转入金额：";
            // 
            // txtTransferInMoney
            // 
            this.txtTransferInMoney.Font = new System.Drawing.Font("宋体", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtTransferInMoney.Location = new System.Drawing.Point(385, 16);
            this.txtTransferInMoney.Name = "txtTransferInMoney";
            this.txtTransferInMoney.Size = new System.Drawing.Size(225, 32);
            this.txtTransferInMoney.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 27);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 12);
            this.label3.TabIndex = 6;
            this.label3.Text = "转入卡号：";
            // 
            // txtInCardNo
            // 
            this.txtInCardNo.Font = new System.Drawing.Font("宋体", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.txtInCardNo.Location = new System.Drawing.Point(85, 16);
            this.txtInCardNo.Name = "txtInCardNo";
            this.txtInCardNo.Size = new System.Drawing.Size(225, 32);
            this.txtInCardNo.TabIndex = 5;
            // 
            // pnTransfer
            // 
            this.pnTransfer.Controls.Add(this.dgvTransfer);
            this.pnTransfer.Location = new System.Drawing.Point(12, 526);
            this.pnTransfer.Name = "pnTransfer";
            this.pnTransfer.Size = new System.Drawing.Size(626, 344);
            this.pnTransfer.TabIndex = 4;
            // 
            // dgvExchange
            // 
            this.dgvExchange.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvExchange.Location = new System.Drawing.Point(13, 14);
            this.dgvExchange.Name = "dgvExchange";
            this.dgvExchange.RowTemplate.Height = 23;
            this.dgvExchange.Size = new System.Drawing.Size(610, 318);
            this.dgvExchange.TabIndex = 4;
            // 
            // pnExchange
            // 
            this.pnExchange.Controls.Add(this.dgvExchange);
            this.pnExchange.Location = new System.Drawing.Point(656, 538);
            this.pnExchange.Name = "pnExchange";
            this.pnExchange.Size = new System.Drawing.Size(626, 352);
            this.pnExchange.TabIndex = 5;
            // 
            // dgvTransfer
            // 
            this.dgvTransfer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvTransfer.Location = new System.Drawing.Point(5, 11);
            this.dgvTransfer.Name = "dgvTransfer";
            this.dgvTransfer.RowTemplate.Height = 23;
            this.dgvTransfer.Size = new System.Drawing.Size(610, 318);
            this.dgvTransfer.TabIndex = 0;
            // 
            // FrmATM
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(914, 882);
            this.Controls.Add(this.pnExchange);
            this.Controls.Add(this.pnTransfer);
            this.Controls.Add(this.pnZhuanZhang);
            this.Controls.Add(this.pnQuqian);
            this.Controls.Add(this.pnCunQian);
            this.Controls.Add(this.pnCxye);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btExit);
            this.Controls.Add(this.btTransferRecord);
            this.Controls.Add(this.btExchangeRecord);
            this.Controls.Add(this.btTransfer);
            this.Controls.Add(this.btQuqian);
            this.Controls.Add(this.btCunQian);
            this.Controls.Add(this.btCxye);
            this.Name = "FrmATM";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ATM";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FrmATM_FormClosing);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FrmATM_FormClosed);
            this.Load += new System.EventHandler(this.FrmATM_Load);
            this.pnCxye.ResumeLayout(false);
            this.pnCxye.PerformLayout();
            this.pnCunQian.ResumeLayout(false);
            this.pnCunQian.PerformLayout();
            this.pnQuqian.ResumeLayout(false);
            this.pnQuqian.PerformLayout();
            this.pnZhuanZhang.ResumeLayout(false);
            this.pnZhuanZhang.PerformLayout();
            this.pnTransfer.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvExchange)).EndInit();
            this.pnExchange.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTransfer)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btCxye;
        private System.Windows.Forms.Button btCunQian;
        private System.Windows.Forms.Button btQuqian;
        private System.Windows.Forms.Button btTransfer;
        private System.Windows.Forms.Button btExchangeRecord;
        private System.Windows.Forms.Button btTransferRecord;
        private System.Windows.Forms.Button btExit;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Panel pnCxye;
        private System.Windows.Forms.Label lblYue;
        private System.Windows.Forms.Panel pnCunQian;
        private System.Windows.Forms.Panel pnQuqian;
        private System.Windows.Forms.Panel pnZhuanZhang;
        private System.Windows.Forms.Panel pnTransfer;
        private System.Windows.Forms.Button btInMoney;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtInMoney;
        private System.Windows.Forms.Button btOutMoney;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtOutMoney;
        private System.Windows.Forms.Button btTransferOk;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtTransferInMoney;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtInCardNo;
        private System.Windows.Forms.DataGridView dgvExchange;
        private System.Windows.Forms.Panel pnExchange;
        private System.Windows.Forms.DataGridView dgvTransfer;
    }
}