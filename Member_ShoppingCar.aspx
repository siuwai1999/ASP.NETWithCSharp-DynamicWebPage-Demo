<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_ShoppingCar.aspx.cs" Inherits="Member_ShoppingCar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:SqlDataSource ID="SqlDataSource_ShoppingCar" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    DeleteCommand="DELETE FROM [購物車] WHERE [購物車編號] = @購物車編號" 
    InsertCommand="INSERT INTO [購物車] ([帳號], [產品編號], [品名], [單價], [數量]) VALUES (@帳號, @產品編號, @品名, @單價, @數量)" 
    SelectCommand="SELECT * FROM [購物車] WHERE ([帳號] = @帳號)" 
    UpdateCommand="UPDATE [購物車] SET  [數量] = @數量 WHERE [購物車編號] = @購物車編號" 
                DataSourceMode="DataReader">
                <SelectParameters>
                    <asp:SessionParameter Name="帳號" SessionField="MemberUid" Type="String" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="購物車編號" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="數量" Type="Int32" />
                    <asp:Parameter Name="購物車編號" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="產品編號" Type="String" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
                    <asp:Parameter Name="數量" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
            

            <asp:SqlDataSource ID="SqlDataSource_Order" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DataSourceMode="DataReader" 
                InsertCommand="INSERT INTO 訂單主檔(帳號, 收貨人, 收貨人電話, 收貨人住址, 下單日期, 訂單狀態) VALUES (@帳號, @收貨人, @收貨人電話, @收貨人住址, @下單日期, @訂單狀態)" 
                SelectCommand="SELECT TOP (1) 訂單編號 FROM 訂單主檔 ORDER BY 訂單編號 DESC">
                <InsertParameters>
                    <asp:Parameter Name="帳號" />
                    <asp:Parameter Name="收貨人" />
                    <asp:Parameter Name="收貨人電話" />
                    <asp:Parameter Name="收貨人住址" />
                    <asp:Parameter Name="下單日期" />
                    <asp:Parameter Name="訂單狀態" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_OrderDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                InsertCommand="INSERT INTO 訂單明細(訂單編號, 產品編號, 單價, 數量) VALUES (@訂單編號, @產品編號, @單價, @數量)" 
                SelectCommand="SELECT 訂單明細.* FROM 訂單明細">
                <InsertParameters>
                    <asp:Parameter Name="訂單編號" />
                    <asp:Parameter Name="產品編號" />
                    <asp:Parameter Name="單價" />
                    <asp:Parameter Name="數量" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_ShoppingDelAll" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM 購物車 WHERE (帳號 = @帳號)" 
                SelectCommand="SELECT * FROM 購物車">
                <DeleteParameters>
                    <asp:Parameter Name="帳號" />
                </DeleteParameters>
            </asp:SqlDataSource>

<div class="container">
<div class="form-signin text-center">
<h1><i class="fas fa-shopping-cart" id="icons-padding"></i>購物清單</h1>
</div>
<div class="row">

<div class="col-md-8 ">
<div class="card">
    <div class="card-header bg-white text-center py-3"><h5 class="mb-0 fw-bold">購物車</h5></div>
<div class="card-body text-center d-flex justify-content-center">
<div class="table-responsive">
<asp:GridView gridlines="None" class="table" ID="GridView_ShoppingCar" runat="server" AutoGenerateColumns="False" DataKeyNames="購物車編號" DataSourceID="SqlDataSource_ShoppingCar">
  <Columns >
    <asp:CommandField ControlStyle-CssClass="btn btn-light btn-sm"  ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="False" Visible="True">
<ControlStyle CssClass="btn btn-light btn-sm"></ControlStyle>
      </asp:CommandField>
    <asp:BoundField DataField="產品編號" HeaderText="產品編號" ReadOnly="True" SortExpression="產品編號" Visible="False"></asp:BoundField>
    <asp:BoundField DataField="品名" HeaderText="品名" ReadOnly="True" SortExpression="品名" />
    <asp:BoundField DataField="單價" HeaderText="單價" ReadOnly="True" SortExpression="單價"></asp:BoundField>
    <asp:TemplateField HeaderText="數量" SortExpression="數量">
      <EditItemTemplate><asp:TextBox type="number" class="form-control" ID="TextBox1" runat="server" Text='<%# Bind("數量") %>' Width="50px"></asp:TextBox></EditItemTemplate>
      <ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("數量") %>'></asp:Label></ItemTemplate>
    </asp:TemplateField>
  </Columns>
    <EmptyDataTemplate>
        <h6 class="text-black-50">無商品<br />前往 <a href="Default.aspx" class="link-dark">產品資料</a>頁 </h6>
    </EmptyDataTemplate>
</asp:GridView>
</div>
</div>
</div>
</div>

<div class="col-md-4 ">
<div class="card">
<div class="card-header bg-white text-center py-3"><h5 class="mb-0 fw-bold">訂購資料</h5></div>
<div class="card-body text-center ">
            <div class="row mb-4">
                <div class="col">
                  <div class="form-outline">
                    <asp:TextBox type="text" class="form-control" ID="txtUid" runat="server" Visible="True" ReadOnly="True"></asp:TextBox>
                    <label class="form-label" for="txtUid" style="margin-left: 0px;">帳號</label>
                    <div class="form-notch">
                      <div class="form-notch-leading" style="width: 9px;"></div>
                      <div class="form-notch-middle" style="width: 68.8px;"></div>
                      <div class="form-notch-trailing"></div>
                    </div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 68.8px;"></div><div class="form-notch-trailing"></div></div></div>
                </div>
                <div class="col">
                  <div class="form-outline">
                    <asp:TextBox type="text" class="form-control" ID="txtReceiverName" runat="server"></asp:TextBox>
                    <label class="form-label" for="txtReceiverName" style="margin-left: 0px;">收貨人<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtReceiverName" ErrorMessage="*"></asp:RequiredFieldValidator></label>
                    <div class="form-notch">
                      <div class="form-notch-leading" style="width: 9px;"></div>
                      <div class="form-notch-middle" style="width: 68px;"></div>
                      <div class="form-notch-trailing"></div>
                    </div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 67.2px;"></div><div class="form-notch-trailing"></div></div></div>
                </div>
              </div>

              <div class="form-outline mb-4">
                <asp:TextBox type="number" class="form-control" ID="txtReceiverTel" runat="server"></asp:TextBox>
                <label class="form-label" for="txtReceiverTel" style="margin-left: 0px;">收貨人電話<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtReceiverTel" ErrorMessage="*"></asp:RequiredFieldValidator></label>
                <div class="form-notch">
                  <div class="form-notch-leading" style="width: 9px;"></div>
                  <div class="form-notch-middle" style="width: 44.8px;"></div>
                  <div class="form-notch-trailing"></div>
                </div>
              <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 44.8px;"></div><div class="form-notch-trailing"></div></div></div>

              <div class="form-outline mb-4">
                <asp:TextBox class="form-control" ID="txtReceiverAdd" runat="server" Width="300px" Rows="3" TextMode="MultiLine"></asp:TextBox>
                <label class="form-label" for="txtReceiverAdd" style="margin-left: 0px;">收貨人住址<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReceiverAdd" ErrorMessage="*"></asp:RequiredFieldValidator></label>
                <div class="form-notch">
                  <div class="form-notch-leading" style="width: 9px;"></div>
                  <div class="form-notch-middle" style="width: 131.2px;"></div>
                  <div class="form-notch-trailing"></div>
                </div>
              <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 134.4px;"></div><div class="form-notch-trailing"></div></div></div>
        <asp:Panel ID="lblMsgPanel" runat="server">
        <div class="alert alert-danger" role="alert">
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:Panel>
            <asp:Button class="btn btn-dark btn-block mb-4" ID="btnOrderOk" runat="server" onclick="btnOrderOk_Click" Text="確定購買" />
</div>
</div>
</div>
</div>
</div>

</asp:Content>

