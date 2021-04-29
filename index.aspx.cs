using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox2.Text = DateTime.Now.ToString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        // 將TextBox1, TextBox2, TextBox3的姓名, 時間, 留言的內容累加在Label1標籤上
        Label1.Text += "姓名：" + TextBox1.Text;
        if (RadioButton1.Checked)
            Label1.Text += "<font color=blue>先生</font>";   //男生
        else
            Label1.Text += "<font color=red>小姐</font>";   //女生
        Label1.Text += "<br />時間：" + TextBox2.Text + "<br />內容：<br />" + TextBox3.Text + "<br />";
        Label1.Text += "<hr><br />";
    }
}