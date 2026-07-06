<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="metrocard.aspx.cs" Inherits="MetroManagementSystem.metrocard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <img width="100px" src="imgs/generaluser.png" />
                            </center>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Metro Card</h4>
                                <!--<span>Account Status - </span>
                                <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Your Status"></asp:Label> -->
                            </center>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col">
                            <center>
                                <hr />

                            </center>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>User ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="User ID" ReadOnly="true"></asp:TextBox>

                            </div>

                        </div>
                        <div class="col-md-6">
                            <label>Current Balance in PKR </label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Current Balance" ReadOnly="true"></asp:TextBox>

                            </div>

                        </div>


                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <label>Debit/Credit Card Number</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Debit/Credit Card Number"></asp:TextBox>

                            </div>

                        </div>
                        <div class="col-md-6">
                            <label>Pin Code</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Pin Code" ></asp:TextBox>

                            </div>

                        </div>


                    </div>

                    <div class="row">
                        
                        <div class="col-md-4">
                            <label>Amount to Add</label>
                            <div class="form-group">
                                <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Amount to Add"></asp:TextBox>

                            </div>

                        </div>
                        

                    </div>

                    


                    


                    



                    <div class="row">
                        <div class="col-8 mx-auto">
                            <center>
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Update Balance" OnClick="Button1_Click" />

                                </div>

                            </center>
                        </div>
                    </div>





                </div>


            </div>
              
            <a href="homepage.aspx"><< Back to Home</a>
            <br />
            <br />
        </div>

        


    </div>

</div>
</asp:Content>
