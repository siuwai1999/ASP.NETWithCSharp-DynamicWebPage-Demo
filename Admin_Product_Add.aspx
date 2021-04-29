<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Add.aspx.cs" Inherits="Admin_Product_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:SqlDataSource ID="SqlDataSource_Product" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [產品資料] WHERE [產品編號] = @產品編號" 
            InsertCommand="INSERT INTO [產品資料] ([類別編號], [產品編號], [品名], [單價], [圖示]) VALUES (@類別編號, @產品編號, @品名, @單價, @圖示)" 
            SelectCommand="SELECT * FROM [產品資料]" 
            UpdateCommand="UPDATE [產品資料] SET [類別編號] = @類別編號, [品名] = @品名, [單價] = @單價, [圖示] = @圖示 WHERE [產品編號] = @產品編號">
            <DeleteParameters>
                <asp:Parameter Name="產品編號" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="類別編號" Type="Int32" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="單價" Type="Int32" />
                <asp:Parameter Name="圖示" Type="String" />
                <asp:Parameter Name="產品編號" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="類別編號" Type="Int32" />
                <asp:Parameter Name="產品編號" Type="String" />
                <asp:Parameter Name="品名" Type="String" />
                <asp:Parameter Name="單價" Type="Int32" />
                <asp:Parameter Name="圖示" Type="String" />
            </InsertParameters>
</asp:SqlDataSource>

<div class="container">
<div class="form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-cart-plus" id="icons-padding"></i>產品資料新增</h1>

 
        <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC">
        </asp:SqlDataSource>
 
 
  <div class="form-outline mb-4">
    <asp:TextBox type="number" class="form-control" ID="txtProductId" runat="server"></asp:TextBox>
    <label class="form-label" for="txtProductId">產品編號<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtProductId" ErrorMessage="*"></asp:RequiredFieldValidator></label>
  </div>

  <div class="row mb-4">
  <div class="col-md-auto"><p>類別名稱</p></div>
  <div class="col">
      <asp:DropDownList class="form-select" ID="ddl_ProductClass" runat="server" 
            DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
            DataValueField="類別編號">
        </asp:DropDownList>
  </div>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="text" class="form-control" ID="txtProductName" runat="server"></asp:TextBox>
    <label class="form-label" for="txtProductName">品名<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProductName" ErrorMessage="*"></asp:RequiredFieldValidator></label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="number" class="form-control" ID="txtPrice" runat="server"></asp:TextBox>
    <label class="form-label" for="txtPrice">單價<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="*"></asp:RequiredFieldValidator></label>
  </div>

  <div class="row mb-4">
   <div class="col-md-auto"><label class="form-label" for="FileUpload_Img">上傳圖示</label><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FileUpload_Img" ErrorMessage="*"></asp:RequiredFieldValidator></div>
   <div class="col">    
    <asp:FileUpload type="file" class="form-control" ID="FileUpload_Img" runat="server" />
 </div>
 </div>

     <asp:Label ID="lblMsg" runat="server"></asp:Label>
 
    <asp:Button class="btn btn-light btn-block mb-4" ID="btnProductAdd" runat="server" onclick="btnProductAdd_Click" Text="產品新增" />

</div>
    </div>
</asp:Content>

