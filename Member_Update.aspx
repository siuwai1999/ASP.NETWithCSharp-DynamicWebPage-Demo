<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Update.aspx.cs" Inherits="Member_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:SqlDataSource 
            ID="SqlDataSource_Member" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            InsertCommand="INSERT INTO [會員] ([帳號], [密碼], [姓名], [信箱], [電話], [住址]) VALUES (@帳號, @密碼, @姓名, @信箱, @電話, @住址)" 
            SelectCommand="SELECT 帳號, 密碼, 姓名, 信箱, 電話, 住址 FROM 會員 WHERE (帳號 = @帳號)" 
            DataSourceMode="DataReader" 
            UpdateCommand="UPDATE 會員 SET 密碼 = @密碼, 姓名 = @姓名, 信箱 = @信箱, 電話 = @電話, 住址 = @住址 WHERE (帳號 = @帳號)">
            <SelectParameters>
                <asp:SessionParameter Name="帳號" SessionField="MemberUid" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="密碼" />
                <asp:Parameter Name="姓名" />
                <asp:Parameter Name="信箱" />
                <asp:Parameter Name="電話" />
                <asp:Parameter Name="住址" />
                <asp:Parameter Name="帳號" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="帳號" Type="String" />
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="信箱" Type="String" />
                <asp:Parameter Name="電話" Type="String" />
                <asp:Parameter Name="住址" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

<div class="container form-signin">
<h1 style="padding-bottom:24px"><i class="fas fa-user-edit" id="icons-padding"></i>資料修改 </h1>

  <div class="row mb-4">
    <div class="col">
      <div class="form-outline">
        <asp:TextBox type="text" class="form-control" ID="txtUid" runat="server" ReadOnly="True"></asp:TextBox>
        <label class="form-label" for="txtUid">帳號</label>
      </div>
    </div>
    <div class="col">
      <div class="form-outline">
        <asp:TextBox type="text" class="form-control" ID="txtName" runat="server"></asp:TextBox>
        <label class="form-label" for="txtName">姓名</label>
      </div>
    </div>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="Password" class="form-control" ID="txtPwd" runat="server"></asp:TextBox>
    <label class="form-label" for="txtPwd">密碼</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="email" class="form-control" ID="txtMail" runat="server" Width="200px"></asp:TextBox>
    <label class="form-label" for="txtMail">信箱</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="number" class="form-control" ID="txtTel" runat="server"></asp:TextBox>
    <label class="form-label" for="txtTel">電話</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox class="form-control" ID="txtAdd" runat="server" Width="300px" TextMode="MultiLine" Rows="3"></asp:TextBox>
    <label class="form-label" for="txtAdd">住址</label>
  </div>

    <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    <asp:Button class="btn btn-light btn-block mb-4" ID="btnMemberUpdate" runat="server" onclick="btnMemberUpdate_Click" Text="會員資料修改" />

</div>
</asp:Content>

