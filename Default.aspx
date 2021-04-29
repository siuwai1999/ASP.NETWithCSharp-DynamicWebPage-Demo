<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [產品資料] WHERE ([類別編號] = @類別編號) ORDER BY [編號] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="類別編號" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_ShoppingCar" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DataSourceMode="DataReader" InsertCommand="INSERT INTO 購物車(帳號, 產品編號, 品名, 單價, 數量) VALUES (@帳號, @產品編號, @品名, @單價, @數量)" SelectCommand="SELECT 購物車編號, 帳號, 產品編號, 品名, 單價, 數量 FROM 購物車 WHERE (帳號 = @帳號) AND (產品編號 = @產品編號)" UpdateCommand="UPDATE 購物車 SET 數量 = 數量 + 1 WHERE (產品編號 = @產品編號) AND (帳號 = @帳號)">
        <InsertParameters>
            <asp:Parameter Name="帳號" />
            <asp:Parameter Name="產品編號" />
            <asp:Parameter Name="品名" />
            <asp:Parameter Name="單價" />
            <asp:Parameter Name="數量" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="帳號" />
            <asp:Parameter Name="產品編號" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="產品編號" />
            <asp:Parameter Name="帳號" />
        </UpdateParameters>
    </asp:SqlDataSource>

<div class="container">
<div class="row form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-shopping-bag" id="icons-padding"></i>產品資料 </h1>
    <div class="col"><h6>請選擇產品類別：</h6></div>
    <div class="col"><asp:DropDownList class="form-select" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="類別名稱" DataValueField="類別編號" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList></div>
    <asp:Panel ID="lblMsgPanel" runat="server">
        <div class="alert alert-success" role="alert">
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:Panel>
</div>

    <asp:DataList ID="DataList_Product" runat="server" DataKeyField="產品編號" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" Width="100%" RepeatColumns="2" OnItemCommand="DataList_Product_ItemCommand" >
        <ItemTemplate>

<div class="card text-center" style="padding-bottom: 16px;padding-top: 16px;">
    <div class="row">
    <div class="col-md-4">
        <asp:Image class="rounded mx-auto d-block" ID="ProductImg" runat="server" ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Height="120px" Width="120px" />
    </div>
    <div class="col-md-6">
        <h5 class="card-title"><asp:Label ID="品名Label" runat="server" Text='<%# Eval("品名") %>' /></h5>
      <div class="card-body row">
       <div class="col-sm-12 col-lg-6 text-danger">NT$ <asp:Label ID="單價Label" runat="server" Text='<%# Eval("單價") %>' Font-Size="X-Large" /></div>
       <div class="col-sm-12 col-lg-6"><asp:LinkButton class="btn btn-dark" ID="btnBuy" runat="server" CommandName="Buy" Text="購買"></asp:LinkButton></div>

<asp:Label ID="類別編號Label" runat="server" Text='<%# Eval("類別編號") %>' Visible="False" />
<asp:Label ID="編號Label" runat="server" Text='<%# Eval("編號") %>' Visible="False" />
<asp:Label ID="產品編號Label" runat="server" Text='<%# Eval("產品編號") %>' Visible="False" />
<asp:Label ID="圖示Label" runat="server" Text='<%# Eval("圖示") %>' Visible="False" />

      </div>
    </div>
    </div>
</div>

        </ItemTemplate>
    </asp:DataList>

</div>
</asp:Content>

