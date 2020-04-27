using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class bookinventory : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillAuthorPublisherValues();
            }
            GridView1.DataBind();
        }


        //************ Button Events *************

        //Get button events
        protected void Button3_Click(object sender, EventArgs e)
        {
            GetBookByID();
        }

        //add button events
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckBookExists())
            {
                Response.Write("<script>alert('Book already exists with the same ID or Name');</script>");
            }
            else
            {
                AddNewBook();
            }
        }

        //update button events
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckBookExists())
            {
                UpdateBookByID();
            }
            else
            {
                Response.Write("<script>alert('Book doesn\\'t exists');</script>");
            }

        }

        //delete button events
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckBookExists())
            {
                DeleteBookByID();
            }
            else
            {
                Response.Write("<script>alert('Book doesn\\'t exists');</script>");
            }
        }


        //**********Userdefined functions *******************

        /*This function will get the list of Authors and Publishers values from database
          which will be needed to add, delete or updating books
         */
        void FillAuthorPublisherValues()
        {
            try
            {
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_tbl;", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();


                cmd = new SqlCommand("SELECT publisher_name FROM publisher_tbl;", conn);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "publisher_name";
                DropDownList2.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void AddNewBook()
        {
            if (TextBox12.Text.Trim() == "" || TextBox12.Text.Trim() == null)
            {
                Response.Write("<script>alert('Please enter a valid book id');</script>");
            }
            else
            {
                try
                {
                    string genres = "";
                    foreach (int i in ListBox6.GetSelectedIndices())
                    {
                        genres = genres + ListBox6.Items[i] + ";";
                    }
                    genres = genres.Remove(genres.Length - 1);



                    string filepath = "~/images/BookInventory/book1.png";
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.SaveAs(Server.MapPath("images/BookInventory/" + filename));
                    filepath = "~/images/BookInventory/" + filename;

                    SqlConnection conn = new SqlConnection(constr);

                    //checking whether the connection is open or not
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();
                    }
                    SqlCommand cmd = new SqlCommand("INSERT INTO book_tbl (book_id, book_name, genre, author_name, publisher_name, publish_date, language,eddition, book_cost, no_of_pages, book_description, actual_stock, current_stock, book_img_link) VALUES(@bid, @bnm, @gn, @an, @pn, @pd, @lan, @edd, @bc, @pgs, @bdes, @astk, @cstk, @blnk);", conn);


                    cmd.Parameters.AddWithValue("@bid", TextBox12.Text.Trim());//
                    cmd.Parameters.AddWithValue("@bnm", TextBox13.Text.Trim());//
                    cmd.Parameters.AddWithValue("@gn", genres);
                    cmd.Parameters.AddWithValue("@an", DropDownList3.SelectedItem.Value);//
                    cmd.Parameters.AddWithValue("@pn", DropDownList2.SelectedItem.Value);//
                    cmd.Parameters.AddWithValue("@pd", TextBox1.Text.Trim());//
                    cmd.Parameters.AddWithValue("@lan", DropDownList1.SelectedItem.Value);//
                    cmd.Parameters.AddWithValue("@edd", TextBox7.Text.Trim());//
                    cmd.Parameters.AddWithValue("@bc", TextBox8.Text.Trim());//
                    cmd.Parameters.AddWithValue("@pgs", TextBox9.Text.Trim());//
                    cmd.Parameters.AddWithValue("@bdes", TextBox2.Text.Trim());//
                    cmd.Parameters.AddWithValue("@astk", TextBox10.Text.Trim());//
                    cmd.Parameters.AddWithValue("@cstk", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@blnk", filepath);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('A new book added successfully');</script>");
                    GridView1.DataBind();




                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }


        void GetBookByID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT author_name FROM author_tbl;", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "author_name";
                DropDownList3.DataBind();


                cmd = new SqlCommand("SELECT * FROM book_tbl WHERE book_id='" + TextBox12.Text.Trim() + "';", conn);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {

                    TextBox13.Text = dt.Rows[0]["book_name"].ToString().Trim();
                    TextBox1.Text = dt.Rows[0]["publish_date"].ToString().Trim();
                    TextBox7.Text = dt.Rows[0]["eddition"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    TextBox2.Text = dt.Rows[0]["book_description"].ToString();

                    TextBox10.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    TextBox14.Text = "" + (Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    DropDownList2.SelectedValue = dt.Rows[0]["publisher_name"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["author_name"].ToString().Trim();

                    //filling genre multi-select listbox details
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(';');
                    ListBox6.ClearSelection();
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox6.Items.Count; j++)
                        {
                            if (ListBox6.Items[j].ToString() == genre[i])
                            {
                                ListBox6.Items[j].Selected = true;
                            }
                        }
                    }//genre filling ends here


                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_current_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString().Trim();
                }
                else
                {
                    Response.Write("<script>alert('Invalid book id');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        bool CheckBookExists()
        {
            bool a;
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM book_tbl WHERE book_id='" + TextBox12.Text.Trim() + "' OR book_name='" + TextBox13.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    a = true;
                }
                else
                {
                    a = false;
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

                a = false;
            }

            return a;
        }


        void UpdateBookByID()
        {
            try
            {

                int actual_stock = Convert.ToInt32(TextBox10.Text.Trim());
                int current_stock = Convert.ToInt32(TextBox11.Text.Trim());
                if (global_actual_stock == actual_stock)
                {

                }
                else
                {
                    if (actual_stock < global_issued_books)
                    {
                        Response.Write("<script>alert('Actual stock value can not be less than the issued books');</script>");
                        return;
                    }
                    else
                    {
                        current_stock = actual_stock - global_issued_books;
                        TextBox8.Text = "" + current_stock;
                    }
                }

                string genres = "";
                foreach (int i in ListBox6.GetSelectedIndices())
                {
                    genres = genres + ListBox6.Items[i] + ";";
                }
                genres = genres.Remove(genres.Length - 1);


                string filepath = "~/images/BookInventory/books1";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                if (filename == "" || filename == null)
                {
                    filepath = global_filepath;
                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("images/BookInventory/" + filename));
                    filepath = "~/images/BookInventory/" + filename;
                }


                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE book_tbl SET book_name=@bnm, genre=@gn, author_name=@an, publisher_name=@pn, publish_date=@pd, language=@lan, eddition=@edd, book_cost=@bc, no_of_pages=@pgs, book_description=@bdes, actual_stock=@astk, current_stock=@cstk, book_img_link=@blnk WHERE book_id='" + TextBox12.Text.Trim() + "'", conn);

                cmd.Parameters.AddWithValue("@bnm", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@gn", genres);
                cmd.Parameters.AddWithValue("@an", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pn", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pd", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@lan", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edd", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@bc", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@pgs", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@bdes", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@astk", actual_stock.ToString());
                cmd.Parameters.AddWithValue("@cstk", current_stock.ToString());
                cmd.Parameters.AddWithValue("@blnk", filepath);


                cmd.ExecuteNonQuery();
                conn.Close();
                GridView1.DataBind();
                Response.Write("<script>alert('Book Updated successfully');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        void DeleteBookByID()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM book_tbl WHERE book_id='" + TextBox12.Text.Trim() + "'", conn);


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Book deleted successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


    }
}