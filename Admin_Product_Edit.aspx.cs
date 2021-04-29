using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_Product_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete" && e.CommandArgument != "")
        {
            string imgFileName = e.CommandArgument.ToString();
            System.IO.File.Delete(Server.MapPath("product_img/"+imgFileName ));   
        }
    }

}
