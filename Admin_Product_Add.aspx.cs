using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Product_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnProductAdd_Click(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Text = "";
            string imgNewFileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(FileUpload_Img.FileName).ToLower();
            if (FileUpload_Img.HasFile)
            {
                FileUpload_Img.SaveAs(Server.MapPath("product_img") + "/" + imgNewFileName);
            }
            SqlDataSource_Product.InsertParameters["產品編號"].DefaultValue = txtProductId.Text;
            SqlDataSource_Product.InsertParameters["類別編號"].DefaultValue = ddl_ProductClass.SelectedItem.Value;
            SqlDataSource_Product.InsertParameters["品名"].DefaultValue = txtProductName.Text;
            SqlDataSource_Product.InsertParameters["單價"].DefaultValue = txtPrice.Text;
            SqlDataSource_Product.InsertParameters["圖示"].DefaultValue = imgNewFileName;
            SqlDataSource_Product.Insert();
            // 若目前檔案存在，則將檔案傳送到網站的product_img資料夾下
          
            lblMsg.ForeColor = System.Drawing.Color.Blue;
            lblMsg.Text = "產品資料新增成功!";
            txtProductId.Text = "";
            txtProductName.Text = "";
            txtPrice.Text = "";
        }
        catch (Exception ex)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = ex.Message;
        }
    }
}
