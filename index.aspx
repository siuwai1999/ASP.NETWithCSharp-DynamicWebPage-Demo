<%@ Page Title="" Language="C#" MasterPageFile="~/前台.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div
    class="p-5 text-center bg-image card"
    style="
      background-image: url('images/Front.jpg');
      height: 400px;
    "
  >
    <div class="mask" style="background-color: rgba(0, 0, 0, 0.6)">
      <div class="d-flex justify-content-center align-items-center h-100">
        <div class="text-white">
          <h1 class="mb-3">INNOVATOR Studio</h1>
          <h4 class="mb-3">創新服飾工作室</h4>
          <a class="btn btn-outline-light btn-lg" href="Default.aspx" role="button"
            >前往 商品資料</a
          >
        </div>
      </div>
    </div>
  </div>

    <div class="container text-center">
        <h2 style="padding:16px">服務</h2>
        <p>INNOVATOR 提供以下服務</p>
        <div class="row d-flex justify-content-center">
            <div class="col-md-3"><div class="card"><i class="fas fa-shopping-basket fa-6x"></i><h3 style="padding:12px">線上購物</h3></div></div>
            <div class="col-md-3"><div class="card"><i class="fas fa-shipping-fast fa-6x"></i><h3 style="padding:12px">快速送達</h3></div></div>
            <div class="col-md-3"><div class="card"><i class="fas fa-mobile-alt fa-6x"></i><h3 style="padding:12px">響應式設計</h3></div>
        </div>
    </div>
    </div>


    <div class="container text-center" style="  width: 100%;
  max-width: 800px;
  padding: 25px;
  margin: auto;">
        <h2 style="padding:16px">聯絡我們</h2>
        <p>向 INNOVATOR 留言</p>
    <div class="row">
    <div class="col-md-6">
     <div class="form-outline mb-4">
        <asp:TextBox type="text" class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
        <label class="form-label" for="TextBox1">姓名</label>
     </div>
    <div class="form-outline mb-4">
        性別：
        <asp:RadioButton ID="RadioButton1" runat="server" Text="先生" GroupName="1" Checked="True" />
        <asp:RadioButton ID="RadioButton2" runat="server" Text="小姐" GroupName="1" />
    </div>
    <div class="form-outline mb-4">
        <asp:TextBox type="text" class="form-control" ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
        <label class="form-label" for="TextBox2">時間</label>
    </div>
    </div>
    <div class="col-md-6">
    <div class="form-outline mb-4">
        <asp:TextBox type="text" class="form-control" ID="TextBox3" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
        <label class="form-label" for="TextBox3">留言內容</label>
    </div>
    </div>
        <asp:Button class="btn btn-dark" ID="Button1" runat="server" Text="送出留言" OnClick="Button1_Click" />
    </div>
    <div class="row">
        <h2 style="padding:16px">留言內容</h2>
        <asp:Label ID="Label1" runat="server" Text="無留言"></asp:Label>
    </div>
    </div>

</asp:Content>

