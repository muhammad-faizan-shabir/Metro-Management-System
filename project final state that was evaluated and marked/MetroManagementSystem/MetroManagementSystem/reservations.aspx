<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="reservations.aspx.cs" Inherits="MetroManagementSystem.reservations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
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
                                <h4>Make Reservations</h4>
                                
                                
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
                            <label>Train ID</label>
                            <div class="form-group">
                                <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Train ID" ></asp:TextBox>

                            </div>

                        </div>

                        


                    </div>

                    <div class="row">
                        
                        

                        


                        


                    </div>

                    




                    
                    <div class="row">
                        <div class="col-6">
                            <asp:Button ID="Button2" CssClass="btn btn-lg btn-block btn-primary" runat="server" Text="Reserve" OnClick="Button2_Click" />
                        </div>
                        
                        


                    </div>

                </div>

            </div>
            <a href="homepage.aspx"><< Back to Home</a> <br /> <br />
        </div>

        
        

    </div>

</div>
</asp:Content>
