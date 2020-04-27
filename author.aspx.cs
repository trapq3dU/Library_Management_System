using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_LibraryManagement
{
    public partial class author : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //Add button click event
        protected void Button4_Click(object sender, EventArgs e)
        {
            if(CheckAuthorExists())
            {
                Response.Write("<script>alert('An author already exists with the same ID. Please try with different ID');</script>");
            }
            else
            {
                AddNewAuthor();
            }
        }

        //Update button click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                UpdateAuthor();
                
            }
            else
            {
                Response.Write("<script>alert('Author doesn\\'t Exists');</script>");
            }
        }

        //Delete button click event
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                DeleteAuthor();

            }
            else
            {
                Response.Write("<script>alert('Author doesn\\'t Exists');</script>");
            }
        }

        //Go button click event
        protected void Button3_Click(object sender, EventArgs e)
        {
            GetAuthorByID();
        }

        // User defined function to check whether the Author exists or not
        bool CheckAuthorExists()
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_tbl WHERE author_id='" + TextBox12.Text.Trim() + "';", conn);
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

        // Function for adding new author
        void AddNewAuthor()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO author_tbl(author_id,author_name) values(@aname,@aid)", conn);

                cmd.Parameters.AddWithValue("@aname", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@aid", TextBox13.Text.Trim());


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('A new author added successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Function for updating author detals
        void UpdateAuthor()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE author_tbl SET author_name=@aname WHERE author_id='"+ TextBox12.Text.Trim() + "'", conn);

                cmd.Parameters.AddWithValue("@aname", TextBox13.Text.Trim());


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Author updated successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //function for deleting author
        void DeleteAuthor()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM author_tbl WHERE author_id='" + TextBox12.Text.Trim() + "'", conn);


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Author deleted successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Function for getting author name by ID
        void GetAuthorByID()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM author_tbl WHERE author_id='" + TextBox12.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox13.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Author ID');</script>");
                }

                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

                
            }
        }
    }
}