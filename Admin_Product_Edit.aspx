<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Product_Edit.aspx.cs" Inherits="Admin_Product_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
<div class="row form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-edit" id="icons-padding"></i>產品資料編輯 </h1>
<div class="col-md-auto"><h6>請選擇產品類別：</h6></div>
<div class="col"><asp:DropDownList class="form-select" ID="ddlProductClass" runat="server" 
 AutoPostBack="True" DataSourceID="SqlDataSource_ProductClass" 
 DataTextField="類別名稱" DataValueField="類別編號">
</asp:DropDownList></div></div>

                        <asp:SqlDataSource ID="SqlDataSource_ProductClass" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [產品類別] ORDER BY [類別編號] DESC">
                        </asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource_Product" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT [類別編號], [產品編號], [品名], [單價], [圖示] FROM [產品資料] WHERE ([類別編號] = @類別編號)" 
                DeleteCommand="DELETE FROM [產品資料] WHERE [產品編號] = @產品編號" 
                InsertCommand="INSERT INTO [產品資料] ([類別編號], [產品編號], [品名], [單價], [圖示]) VALUES (@類別編號, @產品編號, @品名, @單價, @圖示)" 
                
                UpdateCommand="UPDATE [產品資料] SET [類別編號] = @類別編號, [品名] = @品名, [單價] = @單價 WHERE [產品編號] = @產品編號">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlProductClass" Name="類別編號" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="產品編號" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="類別編號" Type="Int32" />
                    <asp:Parameter Name="品名" Type="String" />
                    <asp:Parameter Name="單價" Type="Int32" />
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
    <div class="card  table-responsive">
            <asp:GridView class="table" gridlines="None" ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="產品編號" DataSourceID="SqlDataSource_Product" PageSize="5" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ControlStyle-CssClass="btn btn-light btn-sm" ID="Button1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="更新" />
                            &nbsp;<asp:Button ControlStyle-CssClass="btn btn-light btn-sm" ID="Button2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="取消" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ControlStyle-CssClass="btn btn-light btn-sm" ID="Button1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="編輯" />
                            <asp:Button ControlStyle-CssClass="btn btn-light btn-sm" ID="Button2" runat="server" CausesValidation="False" 
                                CommandArgument='<%# Eval("圖示") %>' CommandName="Delete" Text="刪除" />
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:BoundField DataField="產品編號" HeaderText="產品編號" ReadOnly="True" 
                        SortExpression="產品編號">
                    <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="類別編號" SortExpression="類別編號">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
                                DataValueField="類別編號" SelectedValue='<%# Bind("類別編號") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" 
                                DataSourceID="SqlDataSource_ProductClass" DataTextField="類別名稱" 
                                DataValueField="類別編號" Enabled="False" SelectedValue='<%# Bind("類別編號") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="品名" SortExpression="品名">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("品名") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("品名") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="單價" SortExpression="單價">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("單價") %>' Width="50px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("單價") %>'></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="圖示" SortExpression="圖示">
                        <EditItemTemplate>
                            <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Width="130px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" 
                                ImageUrl='<%# Eval("圖示", "product_img/{0}") %>' Width="130px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

</div>
</div>
</asp:Content>