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
    public partial class signup : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //signup buttton click event
        protected void Button3_Click(object sender, EventArgs e)
        {
            if(CheckUserExists())
            {
                Response.Write("<script>alert('Already an user exists with the same User ID. Please use different User ID');</script>");
            }
            else
            {
                signupUser();
            }
        }


        // User defined function to check whether the user signing up with an unique user_id or not
        bool CheckUserExists()
        {
            bool a = true;
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM member_tbl WHERE member_id='"+TextBox10.Text.Trim()+"';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if(dt.Rows.Count>=1)
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
            }

            return a;
        }

        // User defined function to signup a new user
        void signupUser()
        {
            try
            {   //making connection to the database
                SqlConnection conn = new SqlConnection(constr);

                //checking whether the connection is open or not
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO member_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status) values(@fname,@dob,@contact,@email,@state,@city,@pincode,@fulladd,@id,@pass,@astatus)", conn);

                cmd.Parameters.AddWithValue("@fname", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@dob", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@contact", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@fulladd", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@id", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@pass", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@astatus", "Pending");


                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Signup successfull. We need some time to validate your account');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}