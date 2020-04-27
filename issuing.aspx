<%@ Page Title="Book Issuing | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="issuing.aspx.cs" Inherits="E_LibraryManagement.issuing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Book Issuing</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <img src="images/issuing.png" width="150" height="150" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <label><b>Member ID</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" class="form-control" placeholder="ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <label><b>Book ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox12" class="form-control" placeholder="ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                        <asp:Button class="btn btn-secondary" ID="Button3" runat="server" Text="Go" />
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Member Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="Member Name" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>Book Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Book Name" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <label><b>Start Date</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" class="form-control" placeholder="Start Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label><b>End Date</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" class="form-control" placeholder="End Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button4" runat="server" Text="Issue" />
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg btn-block" ID="Button1" runat="server" Text="Return" />
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

            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Issued Book List</b></h5>
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
