<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ComplaintsAndQueries.aspx.cs" Inherits="Metro_Management.ComplaintsAndQueries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="text mb-4">
                    <img width="150" src="imgs/complaint.png" /><br /><br />
                </div>
                <div class="form-group">
                    <label for="TextBox1">User ID:</label>
                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="UserID" ReadOnly="false" Width="218px"></asp:TextBox>
                </div>
                <br>
                <div class="form-group">
                    <label for="TextBox2">Suggestions/Feedback:</label>
                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Feedback" ReadOnly="false" TextMode="MultiLine" Height="188px" Width="564px"></asp:TextBox>
                </div>
                <br>
                <div class="d-grid gap-2">
                      <asp:Button class="btn btn-primary" ID="BtnSubmit" runat="server" Text="Submit" OnClick = "BtnSubmit_Click" Width="74px" /><br>
                </div>
                <br /><br /><br /><br />
            </div>
        </div>
    </div>
</asp:Content>

