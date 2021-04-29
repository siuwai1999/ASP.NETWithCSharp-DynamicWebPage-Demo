<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Orders_Manager.aspx.cs" Inherits="Admin_Orders_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                <asp:SqlDataSource ID="SqlDataSource_Order" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT * FROM [訂單主檔] ORDER BY 訂單編號 DESC" 
                    DeleteCommand="DELETE FROM [訂單主檔] WHERE [訂單編號] = @訂單編號" 
                    UpdateCommand="UPDATE [訂單主檔] SET [訂單狀態] = @訂單狀態 WHERE [訂單編號] = @訂單編號">
                    <DeleteParameters>
                        <asp:Parameter Name="訂單編號" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="訂單狀態" Type="String" />
                        <asp:Parameter Name="訂單編號" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

    <div class="container">
<div class="form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-clipboard" id="icons-padding"></i>訂單資料管理 </h1>
</div>
<div class="row text-center d-flex justify-content-center">
    <div class="card col-md-8 table-responsive">
                <asp:GridView class="table" gridlines="None" ID="GridView_Order" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="訂單編號" DataSourceID="SqlDataSource_Order" PageSize="5" Width="100%">
                    <Columns>
                        <asp:CommandField ControlStyle-CssClass="btn btn-light btn-sm" ButtonType="Button" 
                            ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="訂單編號" HeaderText="訂單編號" InsertVisible="False" 
                    ReadOnly="True" SortExpression="訂單編號" />
                        <asp:BoundField DataField="收貨人" HeaderText="收貨人" SortExpression="收貨人" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="收貨人電話" HeaderText="收貨人電話" SortExpression="收貨人電話" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="收貨人住址" HeaderText="收貨人住址" SortExpression="收貨人住址" 
                            ReadOnly="True" />
                        <asp:TemplateField HeaderText="訂單狀態" SortExpression="訂單狀態">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("訂單狀態") %>' 
                                    Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("訂單狀態") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="下單日期" HeaderText="下單日期" SortExpression="下單日期" 
                            DataFormatString="{0:d}" ReadOnly="True" />
                    </Columns>
                </asp:GridView>
        </div>

                <asp:SqlDataSource ID="SqlDataSource_OrderDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            
                    SelectCommand="SELECT 訂單明細.產品編號, 產品資料.品名, 訂單明細.單價, 訂單明細.數量, 訂單明細.單價 * 訂單明細.數量 AS 小計 FROM 訂單明細 INNER JOIN 產品資料 ON 訂單明細.產品編號 = 產品資料.產品編號 WHERE (訂單明細.訂單編號 = @訂單編號)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView_Order" Name="訂單編號" 
                    PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <div class="card col-md-3 table-responsive">
                    <div class="card-header bg-white text-center py-3"><h5 class="mb-0 fw-bold">訂單詳情</h5></div>
                <asp:GridView class="table" gridlines="None" ID="GridView_OrderDetail" runat="server" AllowSorting="True" 
            AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource_OrderDetail" 
            Width="100%">
                    <Columns>
                        <asp:BoundField DataField="產品編號" HeaderText="產品編號" SortExpression="產品編號" />
                        <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
                        <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                        <asp:BoundField DataField="數量" HeaderText="數量" SortExpression="數量" />
                        <asp:BoundField DataField="小計" HeaderText="小計" ReadOnly="True" 
                    SortExpression="小計" />
                    </Columns>
                         <EmptyDataTemplate>
         <h6 class="text-black-50">點選 查詢訂單 獲取訂單詳情 </h6>
     </EmptyDataTemplate>
                </asp:GridView>
                    </div>
</div>
</div>

</asp:Content>

