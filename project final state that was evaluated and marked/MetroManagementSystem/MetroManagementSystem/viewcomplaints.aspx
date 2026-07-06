<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="viewcomplaints.aspx.cs" Inherits="MetroManagementSystem.viewcomplaints" %>
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
                                <h4>User Complaints/Queries</h4>


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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MetroConnectConnectionString %>" SelectCommand="SELECT r.train_id,from_station,to_station,start_time,end_time,date,price FROM [reservations] as r inner join train_master_tbl as t on r.train_id=t.train_id;"></asp:SqlDataSource>
                        <div class="col">
                            <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                                    <asp:BoundField DataField="queries" HeaderText="Complaints/Queries" SortExpression="queries" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MetroConnectConnectionString %>" SelectCommand="SELECT * FROM [ComplaintsAndQueries]"></asp:SqlDataSource>
                        </div>

                    </div>


                </div>


            </div>


        </div>


    </div>

</div>
</asp:Content>
