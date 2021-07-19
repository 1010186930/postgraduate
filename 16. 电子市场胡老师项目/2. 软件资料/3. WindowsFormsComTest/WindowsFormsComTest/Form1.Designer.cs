namespace WindowsFormsComTest
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
        /// 设计器支持所需的方法 - 不要修改
        /// 使用代码编辑器修改此方法的内容。
        /// </summary>
        private void InitializeComponent()
        {
            this.button_com = new System.Windows.Forms.Button();
            this.comboBox_com_selsct = new System.Windows.Forms.ComboBox();
            this.comboBox_com_scanf = new System.Windows.Forms.ComboBox();
            this.button_scanf = new System.Windows.Forms.Button();
            this.comboBox_baud_select = new System.Windows.Forms.ComboBox();
            this.textBox_get = new System.Windows.Forms.TextBox();
            this.label_getcount = new System.Windows.Forms.Label();
            this.button_res_get = new System.Windows.Forms.Button();
            this.button_res_getcount = new System.Windows.Forms.Button();
            this.radioButton_gettext = new System.Windows.Forms.RadioButton();
            this.radioButton_getHex = new System.Windows.Forms.RadioButton();
            this.textBox_send = new System.Windows.Forms.TextBox();
            this.label_sendcount = new System.Windows.Forms.Label();
            this.button_res_send = new System.Windows.Forms.Button();
            this.radioButton_sendtext = new System.Windows.Forms.RadioButton();
            this.radioButton_sendHex = new System.Windows.Forms.RadioButton();
            this.button_send = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.checkBox_newLine = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // button_com
            // 
            this.button_com.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.button_com.Location = new System.Drawing.Point(90, 380);
            this.button_com.Name = "button_com";
            this.button_com.Size = new System.Drawing.Size(152, 42);
            this.button_com.TabIndex = 0;
            this.button_com.Text = "打开串口";
            this.button_com.UseVisualStyleBackColor = true;
            this.button_com.Click += new System.EventHandler(this.Button_com_Click);
            // 
            // comboBox_com_selsct
            // 
            this.comboBox_com_selsct.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.comboBox_com_selsct.FormattingEnabled = true;
            this.comboBox_com_selsct.Items.AddRange(new object[] {
            "COM1",
            "COM2",
            "COM3",
            "COM4",
            "COM5",
            "COM6",
            "COM7"});
            this.comboBox_com_selsct.Location = new System.Drawing.Point(319, 391);
            this.comboBox_com_selsct.Name = "comboBox_com_selsct";
            this.comboBox_com_selsct.Size = new System.Drawing.Size(136, 23);
            this.comboBox_com_selsct.TabIndex = 1;
            this.comboBox_com_selsct.SelectedIndexChanged += new System.EventHandler(this.ComboBox1_SelectedIndexChanged);
            // 
            // comboBox_com_scanf
            // 
            this.comboBox_com_scanf.FormattingEnabled = true;
            this.comboBox_com_scanf.Location = new System.Drawing.Point(12, 116);
            this.comboBox_com_scanf.Name = "comboBox_com_scanf";
            this.comboBox_com_scanf.Size = new System.Drawing.Size(111, 23);
            this.comboBox_com_scanf.TabIndex = 2;
            this.comboBox_com_scanf.SelectedIndexChanged += new System.EventHandler(this.ComboBox_com_scanf_SelectedIndexChanged);
            // 
            // button_scanf
            // 
            this.button_scanf.Location = new System.Drawing.Point(12, 36);
            this.button_scanf.Name = "button_scanf";
            this.button_scanf.Size = new System.Drawing.Size(152, 42);
            this.button_scanf.TabIndex = 3;
            this.button_scanf.Text = "扫描已有串口";
            this.button_scanf.UseVisualStyleBackColor = true;
            this.button_scanf.Click += new System.EventHandler(this.Button_scanf_Click);
            // 
            // comboBox_baud_select
            // 
            this.comboBox_baud_select.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.comboBox_baud_select.FormattingEnabled = true;
            this.comboBox_baud_select.Location = new System.Drawing.Point(631, 391);
            this.comboBox_baud_select.Name = "comboBox_baud_select";
            this.comboBox_baud_select.Size = new System.Drawing.Size(136, 23);
            this.comboBox_baud_select.TabIndex = 4;
            this.comboBox_baud_select.SelectedIndexChanged += new System.EventHandler(this.ComboBox_bote_SelectedIndexChanged);
            // 
            // textBox_get
            // 
            this.textBox_get.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox_get.Location = new System.Drawing.Point(81, 25);
            this.textBox_get.Multiline = true;
            this.textBox_get.Name = "textBox_get";
            this.textBox_get.ReadOnly = true;
            this.textBox_get.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox_get.Size = new System.Drawing.Size(306, 96);
            this.textBox_get.TabIndex = 5;
            this.textBox_get.TextChanged += new System.EventHandler(this.TextBox_get_TextChanged);
            // 
            // label_getcount
            // 
            this.label_getcount.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label_getcount.AutoSize = true;
            this.label_getcount.Location = new System.Drawing.Point(711, 317);
            this.label_getcount.Name = "label_getcount";
            this.label_getcount.Size = new System.Drawing.Size(47, 15);
            this.label_getcount.TabIndex = 6;
            this.label_getcount.Text = "Get:0";
            // 
            // button_res_get
            // 
            this.button_res_get.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button_res_get.Location = new System.Drawing.Point(396, 24);
            this.button_res_get.Name = "button_res_get";
            this.button_res_get.Size = new System.Drawing.Size(119, 31);
            this.button_res_get.TabIndex = 7;
            this.button_res_get.Text = "清空接收区";
            this.button_res_get.UseVisualStyleBackColor = true;
            this.button_res_get.Click += new System.EventHandler(this.Button_res_received_Click);
            // 
            // button_res_getcount
            // 
            this.button_res_getcount.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.button_res_getcount.Location = new System.Drawing.Point(786, 320);
            this.button_res_getcount.Name = "button_res_getcount";
            this.button_res_getcount.Size = new System.Drawing.Size(60, 26);
            this.button_res_getcount.TabIndex = 8;
            this.button_res_getcount.Text = "清零";
            this.button_res_getcount.UseVisualStyleBackColor = true;
            this.button_res_getcount.Click += new System.EventHandler(this.Button_res_getcount_Click);
            // 
            // radioButton_gettext
            // 
            this.radioButton_gettext.AutoSize = true;
            this.radioButton_gettext.Checked = true;
            this.radioButton_gettext.Location = new System.Drawing.Point(17, 36);
            this.radioButton_gettext.Name = "radioButton_gettext";
            this.radioButton_gettext.Size = new System.Drawing.Size(58, 19);
            this.radioButton_gettext.TabIndex = 9;
            this.radioButton_gettext.TabStop = true;
            this.radioButton_gettext.Text = "文本";
            this.radioButton_gettext.UseVisualStyleBackColor = true;
            this.radioButton_gettext.CheckedChanged += new System.EventHandler(this.RadioButton_gettext_CheckedChanged);
            // 
            // radioButton_getHex
            // 
            this.radioButton_getHex.AutoSize = true;
            this.radioButton_getHex.Location = new System.Drawing.Point(17, 89);
            this.radioButton_getHex.Name = "radioButton_getHex";
            this.radioButton_getHex.Size = new System.Drawing.Size(52, 19);
            this.radioButton_getHex.TabIndex = 10;
            this.radioButton_getHex.Text = "HEX";
            this.radioButton_getHex.UseVisualStyleBackColor = true;
            this.radioButton_getHex.CheckedChanged += new System.EventHandler(this.RadioButton_getHex_CheckedChanged);
            // 
            // textBox_send
            // 
            this.textBox_send.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox_send.Location = new System.Drawing.Point(81, 25);
            this.textBox_send.Multiline = true;
            this.textBox_send.Name = "textBox_send";
            this.textBox_send.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.textBox_send.Size = new System.Drawing.Size(306, 96);
            this.textBox_send.TabIndex = 11;
            // 
            // label_sendcount
            // 
            this.label_sendcount.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label_sendcount.AutoSize = true;
            this.label_sendcount.Location = new System.Drawing.Point(703, 332);
            this.label_sendcount.Name = "label_sendcount";
            this.label_sendcount.Size = new System.Drawing.Size(55, 15);
            this.label_sendcount.TabIndex = 12;
            this.label_sendcount.Text = "send:0";
            // 
            // button_res_send
            // 
            this.button_res_send.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.button_res_send.Location = new System.Drawing.Point(396, 90);
            this.button_res_send.Name = "button_res_send";
            this.button_res_send.Size = new System.Drawing.Size(119, 31);
            this.button_res_send.TabIndex = 13;
            this.button_res_send.Text = "清空发送区";
            this.button_res_send.UseVisualStyleBackColor = true;
            this.button_res_send.Click += new System.EventHandler(this.Button_res_send_Click);
            // 
            // radioButton_sendtext
            // 
            this.radioButton_sendtext.AutoSize = true;
            this.radioButton_sendtext.Checked = true;
            this.radioButton_sendtext.Location = new System.Drawing.Point(17, 57);
            this.radioButton_sendtext.Name = "radioButton_sendtext";
            this.radioButton_sendtext.Size = new System.Drawing.Size(58, 19);
            this.radioButton_sendtext.TabIndex = 14;
            this.radioButton_sendtext.TabStop = true;
            this.radioButton_sendtext.Text = "文本";
            this.radioButton_sendtext.UseVisualStyleBackColor = true;
            // 
            // radioButton_sendHex
            // 
            this.radioButton_sendHex.AutoSize = true;
            this.radioButton_sendHex.Location = new System.Drawing.Point(17, 96);
            this.radioButton_sendHex.Name = "radioButton_sendHex";
            this.radioButton_sendHex.Size = new System.Drawing.Size(52, 19);
            this.radioButton_sendHex.TabIndex = 15;
            this.radioButton_sendHex.Text = "HEX";
            this.radioButton_sendHex.UseVisualStyleBackColor = true;
            // 
            // button_send
            // 
            this.button_send.Enabled = false;
            this.button_send.Location = new System.Drawing.Point(71, 134);
            this.button_send.Name = "button_send";
            this.button_send.Size = new System.Drawing.Size(75, 29);
            this.button_send.TabIndex = 16;
            this.button_send.Text = "发送";
            this.button_send.UseVisualStyleBackColor = true;
            this.button_send.Click += new System.EventHandler(this.Button_send_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.radioButton_gettext);
            this.groupBox1.Controls.Add(this.radioButton_getHex);
            this.groupBox1.Controls.Add(this.textBox_get);
            this.groupBox1.Controls.Add(this.button_res_get);
            this.groupBox1.Location = new System.Drawing.Point(298, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(548, 127);
            this.groupBox1.TabIndex = 17;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "接收区";
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.checkBox_newLine);
            this.groupBox2.Controls.Add(this.radioButton_sendtext);
            this.groupBox2.Controls.Add(this.radioButton_sendHex);
            this.groupBox2.Controls.Add(this.button_send);
            this.groupBox2.Controls.Add(this.textBox_send);
            this.groupBox2.Controls.Add(this.button_res_send);
            this.groupBox2.Location = new System.Drawing.Point(298, 145);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(548, 169);
            this.groupBox2.TabIndex = 18;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "发送区";
            // 
            // checkBox_newLine
            // 
            this.checkBox_newLine.AutoSize = true;
            this.checkBox_newLine.Location = new System.Drawing.Point(165, 140);
            this.checkBox_newLine.Name = "checkBox_newLine";
            this.checkBox_newLine.Size = new System.Drawing.Size(89, 19);
            this.checkBox_newLine.TabIndex = 17;
            this.checkBox_newLine.Text = "发送新行";
            this.checkBox_newLine.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(263, 398);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(52, 15);
            this.label1.TabIndex = 19;
            this.label1.Text = "串口：";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(556, 394);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 15);
            this.label2.TabIndex = 20;
            this.label2.Text = "波特率：";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1134, 502);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label_sendcount);
            this.Controls.Add(this.button_res_getcount);
            this.Controls.Add(this.label_getcount);
            this.Controls.Add(this.comboBox_baud_select);
            this.Controls.Add(this.button_scanf);
            this.Controls.Add(this.comboBox_com_scanf);
            this.Controls.Add(this.comboBox_com_selsct);
            this.Controls.Add(this.button_com);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button_com;
        private System.Windows.Forms.ComboBox comboBox_com_selsct;
        private System.Windows.Forms.ComboBox comboBox_com_scanf;
        private System.Windows.Forms.Button button_scanf;
        private System.Windows.Forms.ComboBox comboBox_baud_select;
        private System.Windows.Forms.TextBox textBox_get;
        private System.Windows.Forms.Label label_getcount;
        private System.Windows.Forms.Button button_res_get;
        private System.Windows.Forms.Button button_res_getcount;
        private System.Windows.Forms.RadioButton radioButton_gettext;
        private System.Windows.Forms.RadioButton radioButton_getHex;
        private System.Windows.Forms.TextBox textBox_send;
        private System.Windows.Forms.Label label_sendcount;
        private System.Windows.Forms.Button button_res_send;
        private System.Windows.Forms.RadioButton radioButton_sendtext;
        private System.Windows.Forms.RadioButton radioButton_sendHex;
        private System.Windows.Forms.Button button_send;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.CheckBox checkBox_newLine;
    }
}

