<%@ Page Title="產品類別銷售網計圖" Language="C#" MasterPageFile="~/後台.master" AutoEventWireup="true" CodeFile="Admin_Show_Chart.aspx.cs" Inherits="Admin_Show_Chart" %><%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT TOP 5 產品資料.品名, SUM(訂單明細.數量) AS 銷售總額 FROM 訂單明細 INNER JOIN 產品資料 ON 訂單明細.產品編號 = 產品資料.產品編號
GROUP BY 產品資料.品名
ORDER BY 銷售總額 DESC"></asp:SqlDataSource>

<div class="container">
<div class="form-signin text-center">
<h1 style="padding-bottom:24px"><i class="fas fa-chart-pie" id="icons-padding"></i>產品銷售統計圖</h1></div>
<div class="row text-center d-flex justify-content-center">
<div class="col-md-auto">
    <asp:Chart  class="card img-fluid" ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="450px">
        <Series>
            <asp:Series Name="Series1" XValueMember="品名" YValueMembers="銷售總額">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
</div>

    <div class="col-md-auto">
    <div class="card table-responsive">
    <asp:GridView class="table" gridlines="None" ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="品名" HeaderText="品名" SortExpression="品名" />
            <asp:BoundField DataField="銷售總額" HeaderText="銷售總額" ReadOnly="True" 
                SortExpression="銷售總額" />
        </Columns>
    </asp:GridView>
    </div>
    </div>

</div>

</div>
</asp:Content>

