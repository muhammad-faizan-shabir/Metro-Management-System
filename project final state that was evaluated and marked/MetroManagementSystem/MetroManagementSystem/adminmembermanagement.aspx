<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="adminmembermanagement.aspx.cs" Inherits="MetroManagementSystem.adminmembermanagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
      $(document).ready(function () {
      
          //$(document).ready(function () {
              //$('.table').DataTable();
         // });
      
          $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
          //$('.table1').DataTable();
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Delete Member</h4>
                                
                                
                            </center>

                        </div>

                    </div>
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
                                <hr />

                            </center>

                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <label>Member ID</label>
                            <div class="form-group">
                                <div class="input-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Member ID"></asp:TextBox>
                                    

                                </div>

                            </div>

                        </div>

                        
                        

                        



                    </div>

                    

                    


                    

                    <div class="row">
                        
                        
                        

                    </div>




                    
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <asp:Button ID="Button2" CssClass="btn btn-lg btn-block btn-danger" runat="server" Text="Delete User Permanently" OnClick="Button2_Click"  />
                        </div>
                        
                        

                    </div>

                </div>

            </div>
            <a href="homepage.aspx"><< Back to Home</a> <br /> <br />
        </div>

        <div class="col-md-9">
            <div class="card">
                <div class="card-body">

                    <div class="row">
                        <div class="col">
                            <center>
                                <h4>Member List</h4>
                                
                                
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MetroConnectConnectionString %>" SelectCommand="SELECT * FROM [member_master_tbl]"></asp:SqlDataSource>

                        <div class="col">
                            <asp:GridView Class="table table-striped table-bordered"  ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                     <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                     
                                    <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                    <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                                    
                                    <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                    
                                    <asp:BoundField DataField="full_address" HeaderText="full_address" SortExpression="full_address" />
                                    <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                    
                                    <asp:BoundField DataField="card_balance" HeaderText="card_balance" SortExpression="card_balance" />
                                   
                                    
                                    
                                    
                                    
                                    
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>

                    
                </div>


            </div>


        </div>
        

    </div>

</div>
</asp:Content>
