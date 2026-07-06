<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="viewreservations.aspx.cs" Inherits="MetroManagementSystem.viewreservations" %>

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
                                    <h4>Your Reservations</h4>


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
                                <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="train_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="train_id" HeaderText="Train ID" ReadOnly="True" SortExpression="train_id" />
                                        <asp:BoundField DataField="from_station" HeaderText="From Station" SortExpression="from_station" />
                                        <asp:BoundField DataField="to_station" HeaderText="To Station" SortExpression="to_station" />
                                        <asp:BoundField DataField="start_time" HeaderText="Start Station" SortExpression="start_time" />
                                        <asp:BoundField DataField="end_time" HeaderText="End Station" SortExpression="end_time" />
                                        <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
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
