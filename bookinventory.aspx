<%@ Page Title="Book Inventory | Book-Ocean" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="bookinventory.aspx.cs" Inherits="E_LibraryManagement.bookinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">

        $(document).ready(function () { $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable(); });

    </script>

    <script type="text/javascript">

        function ReadURL(input)
        {
            if (input.files && input.files[0])
            {
                var reader = new FileReader();

                reader.onload = function (e)
                {
                    $('#imgView').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
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
                                <h5><b>Book Inventory</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">                                
                                <img id="imgView" src="images/bookinventory/nofile.png" width="100" height="150" />
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        
                            
                        
                        <div class="row text-center">
                            <div class="col">
                                <asp:FileUpload class="form-control" ID="FileUpload1" onchange="ReadURL(this);" runat="server" />
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-4">
                                <label><b>Book ID</b></label>
                                <div class="form-group">
                                    <div class="input-group">                                        
                                        <asp:TextBox ID="TextBox12" class="form-control" placeholder="ID" runat="server" TextMode="SingleLine"></asp:TextBox>
                                        <asp:Button ID="Button3" class="btn btn-primary mr-1" runat="server" Text="Get" OnClick="Button3_Click" />
                                        
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-8">
                                <label><b>Book Name</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox13" class="form-control" placeholder="Book Name" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Language</b></label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                                        <asp:ListItem Text="Select" Value="Select" />
                                        <asp:ListItem Text="Bengali" Value="Bengali" />
                                        <asp:ListItem Text="Hindi" Value="Hindi" />
                                        <asp:ListItem Text="English" Value="English" />
                                    </asp:DropDownList>
                                </div>
                                <label><b>Publisher Name</b></label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                        <%-- ListItems will be loaded dynamically from database--%>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Author Name</b></label>
                                <div class="form-group">
                                    <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                                        <%-- ListItems will be loaded dynamically from database--%>
                                    </asp:DropDownList>
                                </div>
                                <label><b>Publish Date</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox1" class="form-control" placeholder="None" runat="server" TextMode="Date" Rows="2"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Genre</b></label>
                                <div class="form-group">
                                    <asp:ListBox ID="ListBox6" class="form-control" runat="server" SelectionMode="Multiple">
                                        <asp:ListItem Text="Action" Value="Action" />
                                        <asp:ListItem Text="Drama" Value="Drama" />
                                        <asp:ListItem Text="Motivational" Value="Motivational" />
                                        <asp:ListItem Text="Detective" Value="Detective" />
                                    </asp:ListBox>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Eddition</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox7" class="form-control" placeholder="None" runat="server" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Cost per Book</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox8" class="form-control" placeholder="None" runat="server" TextMode="number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Pages</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox9" class="form-control" placeholder="None" runat="server" TextMode="number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label><b>Actual Stock</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox10" class="form-control" placeholder="None" runat="server" TextMode="number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Current Stock</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox11" class="form-control" placeholder="None" runat="server" ReadOnly="True" TextMode="number"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <label><b>Issued Books</b></label>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox14" class="form-control" placeholder="None" runat="server" ReadOnly="True" TextMode="number"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <span><b>Book Description</b></span>
                                    <asp:TextBox ID="TextBox2" class="form-control" placeholder="None" runat="server" Rows="2" TextMode="SingleLine"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-success btn-lg btn-block" ID="Button4" runat="server" Text="Add" OnClick="Button4_Click" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button class="btn btn-primary btn-lg btn-block" ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" />
                                </div>
                            </div>
                            <div class="col-md-4">
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
                                <h5><b>Book List</b></h5>
                            </div>
                        </div>

                        <div class="row text-center">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString (ForBookInventory) %>" SelectCommand="SELECT * FROM [book_tbl]"></asp:SqlDataSource>
                            <div class="col">
                                <asp:GridView class="table table-bordered table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="SqlDataSource1">
                                    
                                    <Columns>
                                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="True" SortExpression="book_id" >
                                        
                                        <ItemStyle Font-Bold="True" />
                                        </asp:BoundField>
                                        
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-lg-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("book_name") %>' Font-Bold="True" Font-Size="X-Large" Font-Italic="True"></asp:Label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    Author -
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>
                                                                    &nbsp;| Genre -
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>
                                                                    &nbsp;| Language -
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    Publisher -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>
                                                                    &nbsp;| Published on -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>
                                                                    &nbsp;| Pages -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>
                                                                    &nbsp;| Eddition -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("eddition") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    Cost -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>
                                                                    &nbsp;| Actual Stock -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>
                                                                    &nbsp;| Available Stock -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>

                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-lg-12">

                                                                    Description -
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("book_description") %>' Font-Italic="True" Font-Size="Medium"></asp:Label>
                                                                    &nbsp;</div>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image ID="Image1" class="img-fluid" height="150" width="100" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
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
