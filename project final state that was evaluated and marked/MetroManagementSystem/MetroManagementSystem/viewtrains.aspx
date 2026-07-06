<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="viewtrains.aspx.cs" Inherits="MetroManagementSystem.viewtrains" %>
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
                                    <h4>Train List</h4>


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
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MetroConnectConnectionString %>" SelectCommand="SELECT * FROM [train_master_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView Class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="train_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="train_id" HeaderText="Train ID" ReadOnly="True" SortExpression="train_id" >

                                        </asp:BoundField>

                                        <asp:BoundField DataField="from_station" HeaderText="From Station" SortExpression="from_station" />
                                        <asp:BoundField DataField="to_station" HeaderText="To Station" SortExpression="to_station" />
                                        <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                                        <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
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
