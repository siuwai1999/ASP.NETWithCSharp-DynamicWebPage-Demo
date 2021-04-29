<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="Member_Add.aspx.cs" Inherits="Member_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource_Member" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [會員] WHERE [帳號] = @original_帳號 AND (([密碼] = @original_密碼) OR ([密碼] IS NULL AND @original_密碼 IS NULL)) AND (([姓名] = @original_姓名) OR ([姓名] IS NULL AND @original_姓名 IS NULL)) AND (([信箱] = @original_信箱) OR ([信箱] IS NULL AND @original_信箱 IS NULL)) AND (([電話] = @original_電話) OR ([電話] IS NULL AND @original_電話 IS NULL)) AND (([住址] = @original_住址) OR ([住址] IS NULL AND @original_住址 IS NULL))" InsertCommand="INSERT INTO [會員] ([帳號], [密碼], [姓名], [信箱], [電話], [住址]) VALUES (@帳號, @密碼, @姓名, @信箱, @電話, @住址)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [會員]" UpdateCommand="UPDATE [會員] SET [密碼] = @密碼, [姓名] = @姓名, [信箱] = @信箱, [電話] = @電話, [住址] = @住址 WHERE [帳號] = @original_帳號 AND (([密碼] = @original_密碼) OR ([密碼] IS NULL AND @original_密碼 IS NULL)) AND (([姓名] = @original_姓名) OR ([姓名] IS NULL AND @original_姓名 IS NULL)) AND (([信箱] = @original_信箱) OR ([信箱] IS NULL AND @original_信箱 IS NULL)) AND (([電話] = @original_電話) OR ([電話] IS NULL AND @original_電話 IS NULL)) AND (([住址] = @original_住址) OR ([住址] IS NULL AND @original_住址 IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_帳號" Type="String" />
        <asp:Parameter Name="original_密碼" Type="String" />
        <asp:Parameter Name="original_姓名" Type="String" />
        <asp:Parameter Name="original_信箱" Type="String" />
        <asp:Parameter Name="original_電話" Type="String" />
        <asp:Parameter Name="original_住址" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="帳號" Type="String" />
        <asp:Parameter Name="密碼" Type="String" />
        <asp:Parameter Name="姓名" Type="String" />
        <asp:Parameter Name="信箱" Type="String" />
        <asp:Parameter Name="電話" Type="String" />
        <asp:Parameter Name="住址" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="密碼" Type="String" />
        <asp:Parameter Name="姓名" Type="String" />
        <asp:Parameter Name="信箱" Type="String" />
        <asp:Parameter Name="電話" Type="String" />
        <asp:Parameter Name="住址" Type="String" />
        <asp:Parameter Name="original_帳號" Type="String" />
        <asp:Parameter Name="original_密碼" Type="String" />
        <asp:Parameter Name="original_姓名" Type="String" />
        <asp:Parameter Name="original_信箱" Type="String" />
        <asp:Parameter Name="original_電話" Type="String" />
        <asp:Parameter Name="original_住址" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

<div class="container form-signin">
<h1 style="padding-bottom:24px"><i class="fas fa-user-plus" id="icons-padding"></i>註冊</h1>
<form>

  <div class="row mb-4">
    <div class="col">
      <div class="form-outline">
        <asp:TextBox type="text" class="form-control" ID="txtUid" runat="server"></asp:TextBox>
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
       <asp:TextBox type="password" class="form-control" ID="txtPwd" runat="server"></asp:TextBox>
       <label class="form-label" for="txtPwd">密碼</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="email" class="form-control" ID="txtMail" runat="server"></asp:TextBox>
    <label class="form-label" for="txtMail">信箱</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox type="number" class="form-control" ID="txtTel" runat="server"></asp:TextBox>
    <label class="form-label" for="txtTel">電話</label>
  </div>

  <div class="form-outline mb-4">
    <asp:TextBox class="form-control" ID="txtAdd" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
    <label class="form-label" for="txtAdd">住址</label>
  </div>

<asp:Panel ID="lblMsgPanel" runat="server"><div class="alert alert-danger" role="alert">
<asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
</div></asp:Panel>

  <asp:Button class="btn btn-light btn-block mb-4" ID="btnMemberAdd" runat="server" Text="註冊會員" OnClick="btnMemberAdd_Click" />

</form>
</div>
</asp:Content>

