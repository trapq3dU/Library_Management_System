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
    public partial class publisher : System.Web.UI.Page
    {

        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["role"].ToString() == "admin")
            {

            }
            else
            {
                Response.Write("<script>alert('You have to login as ADMIN to access this page');</script>");
                Response.Redirect("home.aspx");
            }*/
        }


        //  *********** Button Events *************

        //Update button event
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                UpdatePublisher();

            }
            else
            {
                Response.Write("<script>alert('Publisher doesn\\'t Exists');</script>");
            }
        }

        //Add button event
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                Response.Write("<script>alert('A publisher already exists with the same ID. Please try with different ID');</script>");
            }
            else
            {
                AddNewPublisher();
            }
        }

        //Delete button event
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                DeletePublisher();

            }
            else
            {
                Response.Write("<script>alert('Publisher doesn\\'t Exists');</script>");
            }
        }

        //Get button event
        protected void Button3_Click(object sender, EventArgs e)
        {
            {
                GetPublisherByID();
            }
        }


        //  *********** User Defined Functions *************

        // User defined function to check whether the Author exists or not
        bool CheckPublisherExists()
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_tbl WHERE publisher_id='" + TextBox12.Text.Trim() + "';", conn);
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
        void AddNewPublisher()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_tbl(publisher_id,publisher_name) values(@pname,@pid)", conn);

                cmd.Parameters.AddWithValue("@pname", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@pid", TextBox13.Text.Trim());


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('A new publisher added successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Function for updating author detals
        void UpdatePublisher()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE publisher_tbl SET publisher_name=@pname WHERE publisher_id='" + TextBox12.Text.Trim() + "'", conn);

                cmd.Parameters.AddWithValue("@pname", TextBox13.Text.Trim());


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Publisher updated successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //function for deleting author
        void DeletePublisher()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM publisher_tbl WHERE publisher_id='" + TextBox12.Text.Trim() + "'", conn);


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Publisher deleted successfully');</script>");

                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        //Function for getting author name by ID
        void GetPublisherByID()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_tbl WHERE publisher_id='" + TextBox12.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    TextBox13.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid publisher ID');</script>");
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












