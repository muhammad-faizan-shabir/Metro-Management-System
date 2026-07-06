<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="MetroManagementSystem.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>Our  Primary Features -</b></p>
                    </center>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/metroCard.jpg" />
                        
                        <h4>Metro Card</h4>
                        <p class="text-justify">A customer can either pay using cash or by the provided virtual metro card. The metro card can be recharged online.</p>
                    </center>
                </div>

                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/loyaltyProgram.png" />
                        
                        <h4>Loyalty Program:</h4>
                        <p class="text-justify">if a customer travels more frequently, then he becomes a premium customer who will have to pay less for future travels.</p>

                    </center>

                </div>

                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/complaints.jpeg" />
                        
                       <a href="ComplaintsAndQueries.aspx"> <h4 >Complaints/Feedback</h4> </a>
                        <p class="text-justify">Customers will be able to register complaints and the admin will respond to them</p>
                    </center>
                </div>

            </div>

        </div>
    </section>

    <section>
    <img src="imgs/metroMangement.jpeg"  width="1900" height="400" />
        

    </section>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Process</h2>
                        <p><b>We have a Simple 3 Step Process</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/sign-up.png" />
                        
                        <h4>Sign Up</h4>
                        <p class="text-justify">Free online sign up which hardly takes two minutes</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/searchTrain.jpeg" />
                        
                        <h4>Search Trains</h4>
                        <p class="text-justify">View and filter the available trains</p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="150px" src="imgs/reservations.jpeg" />
                        
                        <h4>Reservation</h4>
                        <p class="text-justify">Make reservation using cash or metro card</p>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
