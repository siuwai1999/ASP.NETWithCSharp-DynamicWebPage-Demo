<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Class.aspx.cs" Inherits="Admin_Product_Class" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

                <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [產品類別] WHERE [類別編號] = @類別編號" 
        InsertCommand="INSERT INTO [產品類別] ([類別名稱]) VALUES (@類別名稱)" 
        SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC" 
        UpdateCommand="UPDATE [產品類別] SET [類別名稱] = @類別名稱 WHERE [類別編號] = @類別編號">
                    <DeleteParameters>
                        <asp:Parameter Name="類別編號" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="類別名稱" Type="String" />
                        <asp:Parameter Name="類別編號" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="類別名稱" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>

<div class="container">
<div class="form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-hammer" id="icons-padding"></i>產品資料管理</h1>
    <div class="row">
                <asp:FormView ID="FormView_ProductClass" runat="server" DataKeyNames="類別編號" 
        DataSourceID="SqlDataSource_ProductClass" DefaultMode="Insert">
                    <EditItemTemplate>
                        類別編號:
                        <asp:Label ID="類別編號Label1" runat="server" Text='<%# Eval("類別編號") %>' />
                        <br />
                        類別名稱:
                        <asp:TextBox ID="類別名稱TextBox" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <br />
                        <asp:LinkButton  ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="更新" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        
                          <div class="form-outline mb-4">
                        <asp:TextBox type="text" class="form-control" ID="類別名稱TextBox0" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <label class="form-label" for="類別名稱TextBox0">類別名稱</label>
                          </div>
                        <asp:LinkButton class="btn btn-light" ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="插入" />
                        &nbsp;<asp:LinkButton class="btn btn-dark" ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="取消" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        類別編號:
                        <asp:Label ID="類別編號Label" runat="server" Text='<%# Eval("類別編號") %>' />
                        <br />
                        類別名稱:
                        <asp:Label ID="類別名稱Label" runat="server" Text='<%# Bind("類別名稱") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="編輯" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="刪除" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="新增" />
                    </ItemTemplate>
                </asp:FormView></div>

<div class="row card table-responsive">
                <asp:GridView class="table" gridlines="None" ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="類別編號" DataSourceID="SqlDataSource_ProductClass">
                    <Columns>
                        <asp:CommandField  ControlStyle-CssClass="btn btn-light btn-sm" ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" >
                        </asp:CommandField>
                        <asp:BoundField DataField="類別編號" HeaderText="類別編號" InsertVisible="False" 
                ReadOnly="True" SortExpression="類別編號" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="類別名稱" HeaderText="類別名稱" SortExpression="類別名稱" />
                    </Columns>
                </asp:GridView>
</div>
</div>
</div>
</asp:Content>

