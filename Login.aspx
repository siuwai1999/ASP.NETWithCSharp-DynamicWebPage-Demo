<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [帳號], [密碼] FROM [會員] WHERE (([帳號] = @帳號) AND ([密碼] = @密碼))" DataSourceMode="DataReader">
    <SelectParameters>
        <asp:Parameter Name="帳號" Type="String" />
        <asp:Parameter Name="密碼" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Admin" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DataSourceMode="DataReader" SelectCommand="SELECT [帳號], [密碼] FROM [管理者] WHERE (([帳號] = @帳號) AND ([密碼] = @密碼))">
        <SelectParameters>
            <asp:Parameter Name="帳號" Type="String" />
            <asp:Parameter Name="密碼" Type="String" />
        </SelectParameters>
</asp:SqlDataSource>

<div class="container form-signin">
<h1 style="padding-bottom:24px"><i class="fas fa-sign-in-alt" id="icons-padding"></i>登入</h1>

  <div class="form-outline mb-4">
    <asp:TextBox type="" id="txtUid" class="form-control" runat="server"></asp:TextBox>
    <label class="form-label" for="form1Example1">帳號</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="password" id="txtPwd" class="form-control" runat="server"></asp:TextBox>
    <label class="form-label" for="txtPwd">密碼</label>
  </div>

  <div class="row mb-4">

      <a href="#!" class="link-dark">忘記密碼？</a>

  </div>
    <asp:Panel ID="lblMsgPanel" runat="server">
        <div class="alert alert-danger" role="alert">
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </div>
    </asp:Panel>

    <div class="row">
    <div class="col-6">
    <asp:Button class="btn btn-light btn-block mb-4" ID="btnMemberLogin" runat="server" Text="會員登入" OnClick="btnMemberLogin_Click" />
    </div>
    <div class="col-6">
    <asp:Button class="btn btn-dark btn-block mb-4" ID="btnAdminLogin" runat="server" Text="管理員登入" OnClick="btnAdminLogin_Click" />
    </div>
    </div>

  <div class="text-center">
    <p>沒有會員？<a href="Member_Add.aspx" class="link-dark">註冊</a></p>
    <p>或透過以下帳號登入</p>
    <button type="button" class="btn btn-light btn-floating mx-1">
      <i class="fab fa-facebook-f"></i>
    </button>

    <button type="button" class="btn btn-light btn-floating mx-1">
      <i class="fab fa-google"></i>
    </button>

    <button type="button" class="btn btn-light btn-floating mx-1">
      <i class="fab fa-twitter"></i>
    </button>

    <button type="button" class="btn btn-light btn-floating mx-1">
      <i class="fab fa-github"></i>
    </button>
  </div>

</div>
</asp:Content>

