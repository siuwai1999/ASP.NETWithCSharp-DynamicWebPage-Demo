using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Member_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsMemberLogin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Page.IsPostBack)
        {
            SqlDataReader drMember = (SqlDataReader)SqlDataSource_Member.Select(DataSourceSelectArguments.Empty);
            if (drMember.Read())
            {
                txtUid.Text = drMember["帳號"].ToString();
                txtPwd.Text = drMember["密碼"].ToString();
                txtName.Text = drMember["姓名"].ToString();
                txtMail.Text = drMember["信箱"].ToString();
                txtTel.Text = drMember["電話"].ToString();
                txtAdd.Text = drMember["住址"].ToString();
            }
            drMember.Close();
        }
    }
    protected void btnMemberUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            SqlDataSource_Member.UpdateParameters["帳號"].DefaultValue = txtUid.Text;
            SqlDataSource_Member.UpdateParameters["密碼"].DefaultValue = txtPwd.Text;
            SqlDataSource_Member.UpdateParameters["姓名"].DefaultValue = txtName.Text;
            SqlDataSource_Member.UpdateParameters["信箱"].DefaultValue = txtMail.Text;
            SqlDataSource_Member.UpdateParameters["電話"].DefaultValue = txtTel.Text;
            SqlDataSource_Member.UpdateParameters["住址"].DefaultValue = txtAdd.Text ;
            SqlDataSource_Member.Update();
            Response.Redirect("Member_Update_Ok.htm");
        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message;
        }
    }
}
