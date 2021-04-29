using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 前台 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsMemberLogin"] == null)
        {
            MenuMemberLogout.Visible = true;
            PanelMemberLogout.Visible = true;
            MenuMemberLogin.Visible = false;
            PanelMemberLogin.Visible = false;
        }
        else
        {
            MenuMemberLogout.Visible = false;
            PanelMemberLogout.Visible = false;
            MenuMemberLogin.Visible = true;
            PanelMemberLogin.Visible = true;
        }
        int i, X1, X2, X3, X4, countY;
        if (Session["IsLogin"] == null)
        {
            Session["IsLogin"] = true;
            Application.Lock();
            if (Application["Count"] == null)
                Application["Count"] = 1;
            else
            {
                countY = int.Parse(Application["Count"].ToString());
                Application["Count"] = countY + 1;
            }
            Application.UnLock();
        }
        countY = int.Parse(Application["Count"].ToString());
        for (i = 0; i < 4; i++)
        {
            X4 = countY % 10;
            X3 = (countY / 10) % 10;
            X2 = (countY / 100) % 10;
            X1 = (countY / 1000) % 10;
            Label1.Text =  X1.ToString() ;
            Label2.Text =  X2.ToString() ;
            Label3.Text =  X3.ToString() ;
            Label4.Text =  X4.ToString() ;
        }
    }

    protected void btnMemberLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Login.aspx");
    }
}
