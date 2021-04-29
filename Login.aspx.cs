using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsgPanel.Visible = false;
    }

    protected void btnMemberLogin_Click(object sender, EventArgs e)
    {
        SqlDataSource_Member.SelectParameters["帳號"].DefaultValue = txtUid.Text;
        SqlDataSource_Member.SelectParameters["密碼"].DefaultValue = txtPwd.Text;
        SqlDataReader dr = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
        if (dr.Read())
        {
            Session["IsMemberLogin"] = true;
            Session["MemberUid"] = dr["帳號"].ToString();
            Response.Redirect("Member_Update.aspx");
        }
        else
        {
            lblMsgPanel.Visible = true;
            lblMsg.Text = "會員帳號與密碼錯誤!";
        }
        dr.Close();
    }

    protected void btnAdminLogin_Click(object sender, EventArgs e)
    {
        SqlDataSource_Admin.SelectParameters["帳號"].DefaultValue = txtUid.Text;
        SqlDataSource_Admin.SelectParameters["密碼"].DefaultValue = txtPwd.Text;
        SqlDataReader dr = (SqlDataReader)SqlDataSource_Admin.Select(DataSourceSelectArguments.Empty);
        if (dr.Read())
        {
            Session["IsAdminLogin"] = true;
            Session["AdminUid"] = dr["帳號"].ToString();
            Response.Redirect("Admin_Update.aspx");
        }
        else
        {
            lblMsgPanel.Visible = true;
            lblMsg.Text = "管理者帳號與密碼錯誤!";
        }
        dr.Close();
    }
}