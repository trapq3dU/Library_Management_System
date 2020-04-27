<%@ Page Title="Admin Login | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="E_LibraryManagement.adminlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row text-center">
                            <div class="col">
                                <img src="images/login.png" width="150" height="175" />
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col">
                                <h3><b>Admin Login</b></h3>
                            </div>
                        </div>
                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="Enter Username" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Enter Password" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
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
        </div>
    </div>

</asp:Content>
