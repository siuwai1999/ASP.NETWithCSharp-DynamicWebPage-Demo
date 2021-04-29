using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsgPanel.Visible = false;
    }

    protected void DataList_Product_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "Buy")
        {
            if (Session["IsMemberLogin"] == null)
            {
                Response.Redirect("Member_Login_suggestion.htm");
            }
            else
            {
                try
                {
                    Label lblProductId = (Label)e.Item.FindControl("產品編號Label");
                    Label lblProductName = (Label)e.Item.FindControl("品名Label");
                    Label lblProductPrice = (Label)e.Item.FindControl("單價Label");
                    SqlDataSource_ShoppingCar.SelectParameters["帳號"].DefaultValue = Session["MemberUid"].ToString();
                    SqlDataSource_ShoppingCar.SelectParameters["產品編號"].DefaultValue = lblProductId.Text;
                    SqlDataReader dr = (SqlDataReader)SqlDataSource_ShoppingCar.Select(DataSourceSelectArguments.Empty);
                    if (dr.Read())
                    {
                        SqlDataSource_ShoppingCar.UpdateParameters["帳號"].DefaultValue = Session["MemberUid"].ToString();
                        SqlDataSource_ShoppingCar.UpdateParameters["產品編號"].DefaultValue = lblProductId.Text;
                        SqlDataSource_ShoppingCar.Update();
                    }
                    else
                    {
                        SqlDataSource_ShoppingCar.InsertParameters["帳號"].DefaultValue = Session["MemberUid"].ToString();
                        SqlDataSource_ShoppingCar.InsertParameters["產品編號"].DefaultValue = lblProductId.Text;
                        SqlDataSource_ShoppingCar.InsertParameters["品名"].DefaultValue = lblProductName.Text;
                        SqlDataSource_ShoppingCar.InsertParameters["單價"].DefaultValue = lblProductPrice.Text;
                        SqlDataSource_ShoppingCar.InsertParameters["數量"].DefaultValue = "1";
                        SqlDataSource_ShoppingCar.Insert();
                    }
                    dr.Close();
                    lblMsgPanel.Visible = true;
                    lblMsg.Text = "產品" + lblProductName.Text + "已放入購物清單";
                }
                catch (Exception ex)
                {
                    lblMsgPanel.Visible = false;
                    lblMsg.Text = ex.Message;
                }
            }
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1);
        lblMsg.Text = "";
    }

}