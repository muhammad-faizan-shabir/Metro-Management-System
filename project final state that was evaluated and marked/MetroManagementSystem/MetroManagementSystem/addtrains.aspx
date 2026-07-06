<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="addtrains.aspx.cs" Inherits="MetroManagementSystem.addtrains" %>

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
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Train Details</h4>


                                </center>

                            </div>

                        </div>
                        <div class="row">
                            <div class="col">
                                <center>

                                    <img id="imgview" height="150px" width="300px" src="imgs/addtrain.png" />

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
                                <label>Train ID</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Train ID"></asp:TextBox>


                                    </div>

                                </div>

                            </div>

                        </div>



                        <div class="row">
                            <div class="col-md-6">
                                <label>From Station</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="From Station"></asp:TextBox>

                                </div>

                            </div>
                            <div class="col-md-6">
                                <label>To Station</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="To Station"></asp:TextBox>

                                </div>

                            </div>


                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Start Time</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Start Time"></asp:TextBox>

                                </div>

                            </div>
                            <div class="col-md-6">
                                <label>End Time</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="End Time"></asp:TextBox>

                                </div>

                            </div>


                        </div>





                        <div class="row">


                            <div class="col-6">
                                <label>Date</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Date"></asp:TextBox>

                                </div>

                            </div>

                            <div class="col-6">
                                <label>Price</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Price"></asp:TextBox>

                                </div>

                            </div>

                        </div>





                        <div class="row">
                            <div class="col-12">
                                <asp:Button ID="Button2" CssClass="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button2_Click" />
                            </div>

                        </div>

                    </div>

                </div>
                <a href="homepage.aspx"><< Back to Home</a>
                <br />
                <br />
            </div>

            <div class="col-md-7">
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
                                        <asp:BoundField DataField="train_id" HeaderText="Train ID" ReadOnly="True" SortExpression="train_id"></asp:BoundField>

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
