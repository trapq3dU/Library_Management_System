<%@ Page Title="User Account Status | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="E_LibraryManagement.status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Member Status</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <img src="images/validation.png" width="150" height="150" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-3">
                                <label><b>Member ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox12" class="form-control" placeholder="ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                        <asp:LinkButton class="btn btn-primary mr-1" ID="LinkButton4" runat="server" Text="Go" OnClick="LinkButton4_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <label><b>Full Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" class="form-control" placeholder="Full Name" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>

                            <div class="col-md-5">
                                <label><b>Account Status</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox5" class="form-control mr-1" placeholder="Status" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>

                                        <asp:LinkButton class="btn btn-success mr-1" ID="LinkButton1" runat="server" Text="A" OnClick="LinkButton1_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-warning mr-1" ID="LinkButton2" runat="server" Text="P" OnClick="LinkButton2_Click"><i class="fas fa-pause-circle"></i></asp:LinkButton>
                                        <asp:LinkButton class="btn btn-danger mr-1" ID="LinkButton3" runat="server" Text="X" OnClick="LinkButton3_Click"><i class="fas fa-times-circle"></i></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label><b>DOB</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="DOB" runat="server" TextMode="date" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Contact No</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="Contact No" runat="server" TextMode="number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <label><b>E-mail ID</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox6" class="form-control" placeholder="E-mail" runat="server" TextMode="email" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b>State</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox3" class="form-control" placeholder="State" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>City</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox4" class="form-control" placeholder="City" runat="server" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>PIN Code</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" class="form-control" placeholder="PIN Code" runat="server" TextMode="number" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label><b>Full Address</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" class="form-control" placeholder="Full Address" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-lg btn-block" ID="Button4" runat="server" Text="Delete User Permanently" OnClick="Button4_Click" />
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

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Member List</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row text-center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString (ForStatusGridView) %>" SelectCommand="SELECT * FROM [member_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" ReadOnly="True" />
                                        <asp:BoundField DataField="full_name" HeaderText="Full Name" SortExpression="full_name" />
                                        <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                        <asp:BoundField DataField="contact_no" HeaderText="Contact No" SortExpression="contact_no" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
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
