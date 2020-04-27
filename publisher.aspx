<%@ Page Title="Publisher Details | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="publisher.aspx.cs" Inherits="E_LibraryManagement.publisher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row text-center">
                            <div class="col">
                                <h5><b>Publisher Details</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <img src="images/publisher.png" width="80" height="90" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Publisher ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox12" class="form-control" placeholder="ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                        <asp:Button class="btn btn-secondary" ID="Button3" runat="server" Text="Get" OnClick="Button3_Click" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label><b>Publisher Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" class="form-control" placeholder="Name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg btn-block" ID="Button4" runat="server" Text="Add" OnClick="Button4_Click" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-danger btn-lg btn-block" ID="Button2" runat="server" Text="Delete" OnClick="Button2_Click" />
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
                                <h5><b>Publisher Details From Database</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row text-center">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString (ForPublisherGridView) %>" SelectCommand="SELECT * FROM [publisher_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="Publisher ID" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_name" HeaderText="Publisher Name" SortExpression="publisher_name" />
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
