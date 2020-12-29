namespace Hospital
{
    partial class SQLConn
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
            this.connBtn = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.usnBox = new System.Windows.Forms.TextBox();
            this.pwBox = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.roleCbx = new System.Windows.Forms.ComboBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lbErrorLogin = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // connBtn
            // 
            this.connBtn.Cursor = System.Windows.Forms.Cursors.Default;
            this.connBtn.ForeColor = System.Drawing.SystemColors.ControlText;
            this.connBtn.Location = new System.Drawing.Point(52, 284);
            this.connBtn.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.connBtn.Name = "connBtn";
            this.connBtn.Size = new System.Drawing.Size(169, 47);
            this.connBtn.TabIndex = 0;
            this.connBtn.Text = "Connect";
            this.connBtn.UseVisualStyleBackColor = true;
            this.connBtn.Click += new System.EventHandler(this.connBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 20F);
            this.label1.Location = new System.Drawing.Point(58, 0);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(163, 39);
            this.label1.TabIndex = 1;
            this.label1.Text = "Đăng nhập";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.label2.Location = new System.Drawing.Point(4, 66);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(84, 21);
            this.label2.TabIndex = 2;
            this.label2.Text = "Username";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(4, 128);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 21);
            this.label3.TabIndex = 3;
            this.label3.Text = "Password";
            // 
            // usnBox
            // 
            this.usnBox.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.usnBox.Location = new System.Drawing.Point(4, 91);
            this.usnBox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.usnBox.Name = "usnBox";
            this.usnBox.Size = new System.Drawing.Size(265, 29);
            this.usnBox.TabIndex = 4;
            // 
            // pwBox
            // 
            this.pwBox.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.pwBox.Location = new System.Drawing.Point(4, 153);
            this.pwBox.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.pwBox.Name = "pwBox";
            this.pwBox.PasswordChar = '*';
            this.pwBox.Size = new System.Drawing.Size(265, 29);
            this.pwBox.TabIndex = 5;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(4, 190);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(79, 21);
            this.label4.TabIndex = 6;
            this.label4.Text = "Log in as";
            // 
            // roleCbx
            // 
            this.roleCbx.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.roleCbx.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.roleCbx.FormattingEnabled = true;
            this.roleCbx.Items.AddRange(new object[] {
            "Quản lý bệnh viện",
            "Bác sĩ",
            "Bệnh nhân"});
            this.roleCbx.Location = new System.Drawing.Point(4, 214);
            this.roleCbx.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.roleCbx.Name = "roleCbx";
            this.roleCbx.Size = new System.Drawing.Size(265, 28);
            this.roleCbx.TabIndex = 7;
            // 
            // panel1
            // 
            this.panel1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.panel1.Controls.Add(this.lbErrorLogin);
            this.panel1.Controls.Add(this.label1);
            this.panel1.Controls.Add(this.connBtn);
            this.panel1.Controls.Add(this.roleCbx);
            this.panel1.Controls.Add(this.usnBox);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Controls.Add(this.pwBox);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Location = new System.Drawing.Point(199, 29);
            this.panel1.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(275, 341);
            this.panel1.TabIndex = 8;
            // 
            // lbErrorLogin
            // 
            this.lbErrorLogin.AutoSize = true;
            this.lbErrorLogin.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbErrorLogin.ForeColor = System.Drawing.Color.Red;
            this.lbErrorLogin.Location = new System.Drawing.Point(0, 246);
            this.lbErrorLogin.Name = "lbErrorLogin";
            this.lbErrorLogin.Size = new System.Drawing.Size(263, 21);
            this.lbErrorLogin.TabIndex = 8;
            this.lbErrorLogin.Text = "Thông tin đăng nhập không đúng!";
            // 
            // SQLConn
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(665, 399);
            this.Controls.Add(this.panel1);
            this.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.Name = "SQLConn";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Hospital";
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button connBtn;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox usnBox;
        private System.Windows.Forms.TextBox pwBox;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox roleCbx;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lbErrorLogin;
    }
}

