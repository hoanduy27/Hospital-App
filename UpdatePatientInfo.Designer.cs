
namespace Hospital
{
    partial class UpdatePatientInfo
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
            this.panel4 = new System.Windows.Forms.Panel();
            this.lbUpdateError = new System.Windows.Forms.Label();
            this.sexCbx = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.weightBox = new System.Windows.Forms.TextBox();
            this.changeBtn = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.bhytBox = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.heightBox = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.cancelBtn = new System.Windows.Forms.Button();
            this.panel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel4
            // 
            this.panel4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.panel4.Controls.Add(this.cancelBtn);
            this.panel4.Controls.Add(this.lbUpdateError);
            this.panel4.Controls.Add(this.sexCbx);
            this.panel4.Controls.Add(this.label1);
            this.panel4.Controls.Add(this.weightBox);
            this.panel4.Controls.Add(this.changeBtn);
            this.panel4.Controls.Add(this.label2);
            this.panel4.Controls.Add(this.label12);
            this.panel4.Controls.Add(this.bhytBox);
            this.panel4.Controls.Add(this.label11);
            this.panel4.Controls.Add(this.heightBox);
            this.panel4.Controls.Add(this.label3);
            this.panel4.Location = new System.Drawing.Point(2, 2);
            this.panel4.Margin = new System.Windows.Forms.Padding(4);
            this.panel4.Name = "panel4";
            this.panel4.Size = new System.Drawing.Size(362, 423);
            this.panel4.TabIndex = 20;
            // 
            // lbUpdateError
            // 
            this.lbUpdateError.AutoSize = true;
            this.lbUpdateError.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbUpdateError.ForeColor = System.Drawing.Color.Red;
            this.lbUpdateError.Location = new System.Drawing.Point(172, 62);
            this.lbUpdateError.Name = "lbUpdateError";
            this.lbUpdateError.Size = new System.Drawing.Size(169, 21);
            this.lbUpdateError.TabIndex = 20;
            this.lbUpdateError.Text = "Mã BHYT đã tồn tại!";
            // 
            // sexCbx
            // 
            this.sexCbx.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.sexCbx.FormattingEnabled = true;
            this.sexCbx.Items.AddRange(new object[] {
            "Nam",
            "Nữ"});
            this.sexCbx.Location = new System.Drawing.Point(7, 160);
            this.sexCbx.Margin = new System.Windows.Forms.Padding(4);
            this.sexCbx.Name = "sexCbx";
            this.sexCbx.Size = new System.Drawing.Size(333, 24);
            this.sexCbx.TabIndex = 19;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 16F);
            this.label1.Location = new System.Drawing.Point(19, -1);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(322, 31);
            this.label1.TabIndex = 10;
            this.label1.Text = "Chỉnh sửa thông tin cá nhân";
            this.label1.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // weightBox
            // 
            this.weightBox.Location = new System.Drawing.Point(7, 308);
            this.weightBox.Margin = new System.Windows.Forms.Padding(4);
            this.weightBox.Name = "weightBox";
            this.weightBox.Size = new System.Drawing.Size(333, 22);
            this.weightBox.TabIndex = 18;
            this.weightBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.weightBox_KeyPress);
            // 
            // changeBtn
            // 
            this.changeBtn.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.changeBtn.Location = new System.Drawing.Point(7, 353);
            this.changeBtn.Margin = new System.Windows.Forms.Padding(4);
            this.changeBtn.Name = "changeBtn";
            this.changeBtn.Size = new System.Drawing.Size(160, 49);
            this.changeBtn.TabIndex = 6;
            this.changeBtn.Text = "Chỉnh sửa";
            this.changeBtn.UseVisualStyleBackColor = true;
            this.changeBtn.Click += new System.EventHandler(this.changeBtn_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(4, 62);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(139, 21);
            this.label2.TabIndex = 11;
            this.label2.Text = "Mã bảo hiểm y tế";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(4, 283);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(115, 21);
            this.label12.TabIndex = 17;
            this.label12.Text = "Cân nặng (kg)";
            // 
            // bhytBox
            // 
            this.bhytBox.Location = new System.Drawing.Point(7, 86);
            this.bhytBox.Margin = new System.Windows.Forms.Padding(4);
            this.bhytBox.Name = "bhytBox";
            this.bhytBox.Size = new System.Drawing.Size(333, 22);
            this.bhytBox.TabIndex = 12;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(4, 209);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(125, 21);
            this.label11.TabIndex = 15;
            this.label11.Text = "Chiều cao (cm)";
            // 
            // heightBox
            // 
            this.heightBox.Location = new System.Drawing.Point(7, 234);
            this.heightBox.Margin = new System.Windows.Forms.Padding(4);
            this.heightBox.Name = "heightBox";
            this.heightBox.Size = new System.Drawing.Size(333, 22);
            this.heightBox.TabIndex = 16;
            this.heightBox.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.heightBox_KeyPress);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(4, 135);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 21);
            this.label3.TabIndex = 13;
            this.label3.Text = "Giới tính";
            // 
            // cancelBtn
            // 
            this.cancelBtn.Font = new System.Drawing.Font("Times New Roman", 10.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cancelBtn.Location = new System.Drawing.Point(182, 354);
            this.cancelBtn.Name = "cancelBtn";
            this.cancelBtn.Size = new System.Drawing.Size(159, 49);
            this.cancelBtn.TabIndex = 21;
            this.cancelBtn.Text = "Hủy";
            this.cancelBtn.UseVisualStyleBackColor = true;
            this.cancelBtn.Click += new System.EventHandler(this.cancelBtn_Click);
            // 
            // UpdatePatientInfo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 429);
            this.Controls.Add(this.panel4);
            this.Name = "UpdatePatientInfo";
            this.Text = "UpdatePatientInfo";
            this.panel4.ResumeLayout(false);
            this.panel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel4;
        private System.Windows.Forms.Label lbUpdateError;
        private System.Windows.Forms.ComboBox sexCbx;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox weightBox;
        private System.Windows.Forms.Button changeBtn;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox bhytBox;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox heightBox;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button cancelBtn;
    }
}