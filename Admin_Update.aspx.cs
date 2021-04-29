using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource_Admin_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        lblMsg.Text = "密碼修改完成!";
    }
}
