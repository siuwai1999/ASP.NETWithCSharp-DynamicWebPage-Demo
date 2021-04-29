<%@ Page Title="" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Member_List.aspx.cs" Inherits="Admin_Manager_Member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT * FROM 會員"></asp:SqlDataSource>

<div class="container">
<div class="form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-list" id="icons-padding"></i>會員資料瀏覽</h1>
</div>
<div class="row card table-responsive">
            <asp:GridView class="table" gridlines="None" ID="GridView_Member" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="帳號" DataSourceID="SqlDataSource_Member" Width="100%">
                <Columns>
                    <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" 
                    SortExpression="帳號" />
                    <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                    <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                    <asp:BoundField DataField="信箱" HeaderText="信箱" SortExpression="信箱" />
                    <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                    <asp:BoundField DataField="住址" HeaderText="住址" SortExpression="住址" />
                </Columns>
            </asp:GridView>
</div>
</div>
</asp:Content>

