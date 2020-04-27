<%@ Page Title="User Profile | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="E_LibraryManagement.profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <img src="images/generaluser.png" width="100" height="100" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Your Details</b></h5>
                                <span class="badge badge-pill">Accoutn Status:</span>
                                <asp:Label class="badge badge-pill badge-success " ID="Label1" runat="server" Text="Status goes here"></asp:Label>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox12" class="form-control" placeholder="Enter Fullname" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" class="form-control" placeholder="Enter DOB" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox14" class="form-control" placeholder="Contact Number" runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox15" class="form-control" placeholder="E-Mail ID" runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:DropDownList ID="DropDownList1" class="form-control" placeholder="State" runat="server" TextMode="SingleLine">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Andaman and Nicobar Islands" Value="Andaman and Nicobar Islands" />
                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh" />
                                        <asp:ListItem Text="Arunachal Pradesh" Value="Arunachal Pradesh" />
                                        <asp:ListItem Text="Assam" Value="Assam" />
                                        <asp:ListItem Text="Bihar" Value="Bihar" />
                                        <asp:ListItem Text="Chandigarh" Value="Chandigarh" />
                                        <asp:ListItem Text="Chhattisgarh" Value="Chhattisgarh" />
                                        <asp:ListItem Text="Dadra and Nagar Haveli and Daman and Diu" Value="Dadra and Nagar Haveli and Daman and Diu" />
                                        <asp:ListItem Text="National Capital Territory of Delhi" Value="National Capital Territory of Delhi" />
                                        <asp:ListItem Text="Goa" Value="Goa" />
                                        <asp:ListItem Text="Gujarat" Value="Gujarat" />
                                        <asp:ListItem Text="Haryana" Value="Haryana" />
                                        <asp:ListItem Text="Himachal Pradesh" Value="Himachal Pradesh" />
                                        <asp:ListItem Text="Jammu and Kashmir" Value="Jammu and Kashmir" />
                                        <asp:ListItem Text="Jharkhand" Value="Jharkhand" />
                                        <asp:ListItem Text="Karnataka" Value="Karnataka" />
                                        <asp:ListItem Text="Kerala" Value="Kerala" />
                                        <asp:ListItem Text="Ladakh" Value="Ladakh" />
                                        <asp:ListItem Text="Lakshadweep" Value="Lakshadweep" />
                                        <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh" />
                                        <asp:ListItem Text="Maharashtra" Value="Maharashtra" />
                                        <asp:ListItem Text="Manipur" Value="Manipur" />
                                        <asp:ListItem Text="Meghalaya" Value="Meghalaya" />
                                        <asp:ListItem Text="Mizoram" Value="Mizoram" />
                                        <asp:ListItem Text="Nagaland" Value="Nagaland" />
                                        <asp:ListItem Text="Odisha" Value="Odisha" />
                                        <asp:ListItem Text="Puducherry" Value="Puducherry" />
                                        <asp:ListItem Text="Punjab" Value="Punjab" />
                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan" />
                                        <asp:ListItem Text="Sikkim" Value="Sikkim" />
                                        <asp:ListItem Text="Tamil Nadu" Value="Tamil Nadu" />
                                        <asp:ListItem Text="Telangana" Value="Telangana" />
                                        <asp:ListItem Text="Tripura" Value="Tripura" />
                                        <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh" />
                                        <asp:ListItem Text="Uttarakhand" Value="Uttarakhand" />
                                        <asp:ListItem Text="West Bengal" Value="West Bengal" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox16" class="form-control" placeholder="City" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox17" class="form-control" placeholder="PIN Code" runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox18" class="form-control" placeholder="Full Address" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <div class="align-content-center">
                                    <span class="badge badge-pill badge-danger">Login Credentials</span>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <span>User ID</span>
                                    <asp:TextBox ID="TextBox19" class="form-control" placeholder="User ID" runat="server" TextMode="SingleLine" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <span>Enter old password</span>
                                    <asp:TextBox ID="TextBox20" class="form-control" placeholder="Old Password" runat="server" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <span>Enter new password</span>
                                    <asp:TextBox ID="TextBox21" class="form-control" placeholder="New Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6 mx-auto">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg btn-block" ID="Button4" runat="server" Text="Update" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br />
                <div class="row mx-auto">
                    <a href="home.aspx"><span class="badge badge-pill badge-dark">Back to Home</span></a>
                </div>
                <br />
            </div>

            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col">
                                <img src="images/books1.png" width="100" height="100" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Issued Books</b></h5>
                                <asp:Label class="badge badge-pill badge-success " ID="Label2" runat="server" Text="Your books Info"></asp:Label>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server"></asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
